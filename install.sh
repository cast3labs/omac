#!/bin/bash
# Install or update Omac — a keyboard-driven tiling window manager for macOS.
#
#   curl -fsSL https://raw.githubusercontent.com/cast3labs/omac/main/install.sh | bash
#
# A specific version:  ... | bash -s -- v1.4.8
#
# What this does: downloads the release, checks its SHA-256 and the app's
# Developer ID signature, and runs the installer sealed inside that signed app.
# That installer checks the signature again, removes any old copy in
# /Applications, installs to ~/Applications, puts the `omac` command on your
# PATH and starts Omac.
#
# Everything is inside main(), called on the last line, so a download cut off
# half way runs nothing.
set -euo pipefail

# Global, not `local`: the EXIT trap fires after main() has returned, when a
# local would be gone and `set -u` would turn a successful install into an error.
tmp=""
trap '[ -n "${tmp:-}" ] && rm -rf "$tmp"' EXIT

main() {
  local repo="cast3labs/omac"
  local want="${1:-latest}"
  local base
  if [ -n "${OMAC_BASE_URL:-}" ]; then
    base="$OMAC_BASE_URL"                                     # tests only
  elif [ "$want" = latest ]; then
    base="https://github.com/$repo/releases/latest/download"
  else
    base="https://github.com/$repo/releases/download/$want"
  fi

  fail() { printf '\n\033[31mOmac was not installed:\033[0m %s\n' "$*" >&2; exit 1; }

  [ "$(uname -s)" = Darwin ] || fail "Omac runs on macOS only."
  # The hardware, not the process: under Rosetta, `uname -m` says x86_64 even on
  # Apple silicon, and a Terminal opened that way would be wrongly refused.
  [ "$(sysctl -n hw.optional.arm64 2>/dev/null)" = 1 ] || fail "Omac needs a Mac with Apple silicon."
  local os major
  os=$(sw_vers -productVersion); major=${os%%.*}
  [ "$major" -ge 14 ] || fail "Omac needs macOS 14 or later (this Mac has $os)."

  tmp=$(mktemp -d)

  printf 'Downloading Omac (%s)…\n' "$want"
  curl -fL --progress-bar -o "$tmp/Omac-arm64.zip" "$base/Omac-arm64.zip" \
    || fail "the download failed. Check your connection and try again."
  curl -fsSL -o "$tmp/Omac-arm64.zip.sha256" "$base/Omac-arm64.zip.sha256" \
    || fail "could not download the checksum."

  # Proves the download is complete and uncorrupted. Authenticity is checked by
  # the next step, against the app's Developer ID signature.
  ( cd "$tmp" && shasum -a 256 -c Omac-arm64.zip.sha256 >/dev/null 2>&1 ) \
    || fail "the download is corrupted (checksum mismatch). Try again."

  ditto -x -k "$tmp/Omac-arm64.zip" "$tmp/x"

  # Check the app's identity HERE as well as in the installer inside the zip.
  # Older releases' installers matched text that whoever built the zip controls,
  # so this is the check that protects every version, old ones included. A signed
  # requirement, evaluated by codesign: Apple-anchored, this bundle id, our team.
  local app req preview_req preview=0
  app=$(find "$tmp/x" -maxdepth 3 -name Omac.app -type d | head -1)
  # Named Omac.app, not just found: a folder with a newline in its name would
  # cut find's first line short, at an app under another name, while the
  # installers below install the Omac.app next to them.
  { [ -n "$app" ] && [ "${app##*/}" = Omac.app ]; } || fail "the download has no Omac.app in it."
  req='anchor apple generic and identifier "com.cast3labs.omac" and certificate leaf[subject.OU] = "5GB46V9555"'
  # The previews (1.4.5 to 1.4.8) carry the earlier id. An app under it is
  # accepted only from such a preview, with the installer pinned below: never
  # with an installer sealed inside it.
  preview_req='anchor apple generic and identifier "com.evanscastonguay.omac" and certificate leaf[subject.OU] = "5GB46V9555"'
  codesign --verify --deep --strict "$app" 2>/dev/null \
    || fail "the app's signature is broken. Try again."
  if ! codesign --verify --strict -R "=$req" "$app" 2>/dev/null; then
    codesign --verify --strict -R "=$preview_req" "$app" 2>/dev/null \
      || fail "the app is not signed by Omac's developer."
    preview=1
  fi

  # Then run only an installer checked as strictly as the app. A release made
  # after 1.4.8 carries it sealed inside the app, as
  # Contents/Resources/release-install.sh: the signature just verified covers
  # that file byte for byte, so whoever serves the download can neither change
  # it nor take it out. The copy of it the zip also carries next to the app,
  # install.sh, is never run from here: nothing vouches for it.
  local inst="$app/Contents/Resources/release-install.sh"
  if [ "$preview" = 1 ] && { [ -e "$inst" ] || [ -L "$inst" ]; }; then
    fail "the app is not signed by Omac's developer."
  elif [ ! -f "$inst" ] || [ -L "$inst" ]; then
    # 1.4.5 to 1.4.8 carry only that install.sh. Run it only when it sits next
    # to the app just checked (it installs the Omac.app next to it) and is, byte
    # for byte, the one its version was published with. Published releases
    # never change, so these are final; 1.4.4's files were withdrawn.
    local version pinned sum
    version=$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$app/Contents/Info.plist" 2>/dev/null || echo "?")
    inst="$(dirname "$app")/install.sh"
    { [ -f "$inst" ] && [ ! -L "$inst" ]; } || fail "the download has no installer in it."
    case "$version" in
      1.4.5|1.4.6|1.4.7) pinned=1807fd9378deced6c3bb017734b2aa3d15364704bee9d0461d5f74bd1b9378a0 ;;
      1.4.8)             pinned=3dc3a848bad82027b430b3c5dc610261e047ecfb771c0a2f60b6da4112a842ed ;;
      *)                 pinned="" ;;
    esac
    sum=$(shasum -a 256 "$inst" | awk '{ print $1 }')
    { [ -n "$pinned" ] && [ "$sum" = "$pinned" ]; } \
      || fail "the installer in the download is not the one published with Omac $version, so it was not run."
  fi

  /bin/bash "$inst"
}

main "$@"
