# Omac

A tiling window manager for macOS. Your windows arrange themselves side by
side instead of piling up, and you move between them with the keyboard. It works
with [Omarchy](https://omarchy.org)'s keybindings. Website:
[omac.ghostype.ca](https://omac.ghostype.ca).

## Install

**Needs** a Mac with Apple silicon and macOS 14 or later. Nothing else — no
Homebrew, no developer tools, no GitHub account.

**1. Paste this into Terminal** (⌘ Space, type *Terminal*, press Return):

```bash
curl -fsSL https://raw.githubusercontent.com/cast3labs/omac/main/install.sh | bash
```

Gratuit — conditions d'utilisation : [`EULA.fr.md`](EULA.fr.md) · free to use — terms: [`EULA.md`](EULA.md). Installing means you accept them; the installer prints these links too.

If an old copy of Omac is in `/Applications`, Terminal may ask for your Mac
password to remove it. Two copies conflict.

**2. Let Omac control your windows.** A macOS dialog appears: click **Open
System Settings**, then turn **Omac** on under **Privacy & Security →
Accessibility**. Omac notices within two seconds — no restart needed.

**3. Check it.** Open a **new** Terminal window and run:

```bash
omac status
```

You should see:

```
accessibility        true
tap                  true
```

Done. Omac also starts by itself when you log in.

Already have an earlier preview of Omac? It cannot update itself:
see [Update](#update).

<details>
<summary><b>What the install command does</b></summary>

<br>

1. Downloads the latest release from this repository.
2. Checks its SHA-256 checksum, so a broken download is never installed.
3. Checks the app is signed with Omac's Developer ID (team `5GB46V9555`), so a
   modified app is never installed.
4. Stops, changing nothing, if Homebrew, MacPorts or Nix installed Omac, and
   prints that package manager's update command instead.
5. Removes an old copy in `/Applications`, if there is one.
6. Installs `Omac.app` to `~/Applications` and the `omac` command to
   `~/.local/bin`, adding that folder to your `PATH` if it is not already there.
7. Starts Omac. On a first install it also turns on *start at login*.

To read the script before running it:

```bash
curl -fsSL https://raw.githubusercontent.com/cast3labs/omac/main/install.sh -o install.sh
less install.sh
bash install.sh
```

</details>

<details>
<summary><b>Signed and notarized</b></summary>

<br>

Omac is signed with a Developer ID, so macOS knows who built it and that it has
not been changed since — the installer checks that before installing. It is
also *notarized*: Apple scanned the build and issued a ticket,
stapled to the app, so macOS can confirm it even offline. A copy downloaded
with a web browser opens after macOS's usual first-open confirmation; the
Terminal command has no extra step.

</details>

### Other ways to install

**With Homebrew:**

```bash
brew install --cask cast3labs/tap/omac
open ~/Applications/Omac.app
```

Then do step 2 above. The cask does not start Omac or turn on start at login;
`omac login on` does that.

**Without Terminal:**

1. Download **`Omac-arm64.zip`** from the
   [latest release](https://github.com/cast3labs/omac/releases/latest) and open it.
2. Drag **`Omac.app`** from the folder that appears into **Applications**.
3. Open Omac. macOS asks once whether to open an app downloaded from the
   internet — click **Open**.
4. Do step 2 above, then check it from Omac's menu-bar icon (step 3's
   `omac status` needs the `omac` command): its menu says “Hotkeys active
   (Super = Left ⌘)” once Omac has the permission.

This way does not set up the `omac` command or start at login. Choose **Launch
at login** from Omac's menu-bar icon for that.

### Every way, side by side

| | Install | Update | Uninstall (the app) | Switch to another way |
|---|---|---|---|---|
| **Terminal (curl)** | `curl -fsSL https://raw.githubusercontent.com/cast3labs/omac/main/install.sh \| bash` | run the same command again; settings and the Accessibility permission are kept (from an earlier preview, macOS asks for Accessibility once more) | with Omac running: `omac login off; omac quit; rm -rf ~/Applications/Omac.app ~/.local/bin/omac` (unless it prints “launch at login: off”, also remove Omac in **System Settings → General → Login Items**) | to Homebrew: uninstall, then `brew install --cask cast3labs/tap/omac` |
| **Homebrew** | `brew install --cask cast3labs/tap/omac`, then `open ~/Applications/Omac.app`; to have it start when you log in, turn on **Launch at login** in Omac's menu | `brew upgrade --cask cast3labs/tap/omac`, then quit Omac and open it again: `omac quit; while pgrep -x -U "$USER" Omac >/dev/null; do sleep 0.2; done; open ~/Applications/Omac.app` | with Omac running: `omac login off; brew uninstall --cask --zap cast3labs/tap/omac` (unless it prints “launch at login: off”, also remove Omac in **System Settings → General → Login Items**; `--zap` also removes settings and state — among them the copy of your own wallpaper that `omac theme off` puts back, so run that first if you used a theme — but not the theme media in `~/.local/share/omac`) | to curl: `brew uninstall --cask cast3labs/tap/omac`, then the curl command |
| **Download** | `Omac-arm64.zip` from the [latest release](https://github.com/cast3labs/omac/releases/latest); drag `Omac.app` into Applications | quit Omac, then download the new zip and replace `Omac.app` | turn off **Launch at login** in Omac's menu (or in **System Settings → General → Login Items**) if it is on, quit Omac, then drag `Omac.app` to the Trash | to curl: just run the curl command — the installer removes the `/Applications` copy for you; it does not turn on start at login: turn on **Launch at login** in Omac's menu |

Installed with Homebrew from the tap's old name, `evanscastonguay/tap`? Update it as above: Homebrew follows the tap to `cast3labs/tap`. Until it has been updated once, Homebrew refuses the new name to uninstall it: run `omac login off`, then `brew uninstall --cask evanscastonguay/tap/omac` (add `--zap` to remove its settings too).

Whatever the way, first grant **System Settings → Privacy & Security → Accessibility → Omac**,
then `omac status` must show `accessibility` and `tap` both `true`. Only the curl way and the
tap set up the `omac` command; the download does not. To undo everything Omac changed, see
[Uninstall](#uninstall).

## Try it

The Omac key is **Left ⌘**. Right ⌘ still works as a normal ⌘.

| Press | What happens |
|---|---|
| Left ⌘ **K** | Shows every shortcut |
| Left ⌘ **Return** | Opens a terminal |
| Left ⌘ **← ↑ → ↓** | Moves between windows |
| Left ⌘ **Shift ← ↑ → ↓** | Swaps a window with its neighbour |
| Left ⌘ **1 … 0** | Switches to workspace 1–10 |
| Left ⌘ **Shift 1 … 0** | Sends the window to that workspace |
| Left ⌘ **Shift Space** | Lets a window float freely |

**To stop it:** Left ⌘ **Ctrl ⌥ Esc** pauses the tiling; press it again to
resume. `omac quit` quits Omac.

## If something is wrong

| You see | What to do |
|---|---|
| Left ⌘ shortcuts do nothing | Omac needs the Accessibility permission (step 2). `omac status` says `accessibility false` until it has it. |
| `omac: command not found` | Open a **new** Terminal window. The installer set this up for new windows only. |
| *"Omac is an app downloaded from the Internet…"* | macOS asks this once, the first time you open a copy downloaded with a web browser. Click **Open**. |
| `Omac was not installed: …` | The message says why. Run the command again; if it happens again, send the full output. |

**Reporting a problem:** [open an issue](https://github.com/cast3labs/omac/issues) with the
output of `omac status` and what you pressed. Report a security problem privately, through
[GitHub's private vulnerability report form](https://github.com/cast3labs/omac/security/advisories/new),
never in an issue.

## Update

**On an earlier preview of Omac? Run the install command once more.** A preview
cannot update itself. Paste this into Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/cast3labs/omac/main/install.sh | bash
```

Your settings are kept.

With Homebrew:
`brew upgrade --cask cast3labs/tap/omac`, then quit Omac and open it
again:
`omac quit; while pgrep -x -U "$USER" Omac >/dev/null; do sleep 0.2; done; open ~/Applications/Omac.app`.

A copy you dragged from a download: quit Omac, then download the new zip and
replace `Omac.app`.

**From an earlier preview of Omac, grant Accessibility again.** From 1.0.0,
Omac has a new identifier, so macOS sees it as a new app: when Omac asks, turn it on
again in **System Settings → Privacy & Security → Accessibility** (and Screen Recording,
Microphone or Automation, if you used them). The preview's entry, also named Omac, may stay
in that list, switched on, and does not count for the new app: if the shortcuts still do
nothing, remove it (select it, then click −), then add `~/Applications/Omac.app` with + and
turn it on. Your settings are kept.

**From 1.0.0, Omac updates itself:** choose **Check for Updates…** in the Omac
menu (or run `omac update`), or turn on the once-a-day check in the first-run
window or the menu. A copy that cannot update itself says why on the `updates`
line of `omac status`. What Omac sends, and when, is in
[the privacy policy](https://omac.ghostype.ca/privacy/).

## Uninstall

To remove the app alone, use the "Uninstall" cell of
[Every way, side by side](#every-way-side-by-side) for the way you installed it.
To undo everything Omac changed, run these with Omac running (open it first), in this order:

```bash
omac theme off
omac dispatch mic_mute on=false
omac skill uninstall
omac login off
omac quit
tccutil reset All com.cast3labs.omac
```

What each line does:

- `omac theme off` puts your own wallpaper back, if you used a theme. What the theme wrote into
  other apps stays: see below.
- `omac dispatch mic_mute on=false` unmutes the microphone, if 🎙️ shows in the menu bar. From
  1.0.0, quitting Omac unmutes a microphone Omac muted itself; this line is for an
  earlier preview of Omac, or an Omac that did not quit normally (it crashed, was forced to quit or hung while
  quitting), or the microphone was not connected when Omac quit. The mute belongs to the
  microphone, not to Omac, so it would stay on in every app.
  If a microphone is still muted after Omac is gone, unmute it in **Audio MIDI Setup** (in
  **Applications → Utilities**).
- `omac skill uninstall` removes the link in each coding agent's skills folder, if you installed
  the coding-agent skill.
- `omac login off` stops Omac from starting at login. If it did not print “launch at login: off”,
  remove Omac in **System Settings → General → Login Items**.
- `omac quit` quits Omac.
- `tccutil reset All com.cast3labs.omac` removes every permission you gave Omac:
  Accessibility, and Screen Recording, Microphone or Automation if you allowed them. It comes
  before removing the app, since `tccutil` looks the app up by its identifier. On a Mac with other
  accounts, it can also remove the Accessibility and Screen Recording permissions Omac has in them.
- An earlier preview of Omac had another identifier, `com.evanscastonguay.omac`, and `tccutil`
  cannot find it once the preview is replaced. If you used one, remove any Omac still listed in
  **System Settings → Privacy & Security** (Accessibility, and Screen Recording, Microphone or
  Automation): select it, then click −.

A copy from a download has no `omac` command: type `/Applications/Omac.app/Contents/Helpers/omac`
in its place, or use Omac's menu (**Theme → Off**, untick **Mute microphone**, turn off **Launch at
login**, then **Quit Omac**) and run the `tccutil` line alone.

`omac theme off` leaves light or dark mode as it is, and what a theme wrote into other apps. To
remove that by hand: in Ghostty's config, the line
`config-file = ?"~/.local/state/omac/current/theme/ghostty.conf"`; in `~/.claude/settings.json`,
`"theme": "custom:omac"`, and the file `~/.claude/themes/omac.json`; in VS Code's settings,
`"workbench.colorTheme": "Omac"`, the folder `~/.vscode/extensions/omac-theme`, and the entry for
`local.omac-theme` in `~/.vscode/extensions/extensions.json`; in opencode's
`~/.config/opencode/opencode.jsonc` or `opencode.json`, `"theme": "system"`; in Sublime Text's
`Packages/User` folder, `"color_scheme": "Omac.sublime-color-scheme"` in
`Preferences.sublime-settings`, and the file `Omac.sublime-color-scheme`; in iTerm2, make another
profile the default, then delete `~/Library/Application Support/iTerm2/DynamicProfiles/omac.json`;
for Chrome and Brave, `defaults delete com.google.Chrome BrowserThemeColor` and
`defaults delete com.brave.Browser BrowserThemeColor`.

Then remove the app the way you installed it (its "Uninstall" cell above: Omac has already quit,
so the `omac` commands there say “Omac is not running”, which is expected here, and launch at login
is already off), and:

```bash
rm -rf ~/.config/omac ~/.local/state/omac ~/.local/share/omac
rm -rf ~/Library/Caches/com.cast3labs.omac ~/Library/Caches/com.evanscastonguay.omac
rm -rf ~/Library/HTTPStorages/com.cast3labs.omac ~/Library/HTTPStorages/com.evanscastonguay.omac
defaults delete com.cast3labs.omac 2>/dev/null
defaults delete com.evanscastonguay.omac 2>/dev/null
```

The first line removes Omac's settings, its state (the daily count's `telemetry.json` included, if you turned the count on) and the theme media it downloaded; the next two,
its caches and the web storage macOS keeps for it; the last two, its preferences in
`~/Library/Preferences`. Each names both of Omac's identifiers: today's, and the one an earlier
preview of Omac had.

The installer may have added two lines starting with `# Added by the Omac installer` to your
shell's startup file (`~/.zshrc`, `~/.bash_profile` or `~/.config/fish/config.fish`); delete
them. Night Shift stays as Omac left it: turn it on or off in **System Settings → Displays →
Night Shift…**.

## License

Omac is free to use under its licence terms,
[`EULA.md`](EULA.md) (en français, [`EULA.fr.md`](EULA.fr.md)), which come with
the app. All rights reserved — see [`LICENSE`](LICENSE), which also names the
earlier previews once offered under the MIT License.
Omac includes third-party work, listed in
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md). Omac ships all 92 of
Omarchy's theme wallpapers, as Omarchy's repository holds them, so every theme
has its own pictures. Omarchy publishes no license for these images; the notices
say where they come from.
[An earlier review](docs/wallpaper-review.md), when fewer shipped, is kept as history.

Omac is an independent, unofficial project. It is not affiliated with or
endorsed by Omarchy, its creators, 37signals LLC or the Omacom Foundation.
Omarchy and the Omarchy trademark belong to 37signals LLC and the creators of Omarchy.

---

<sub>Tested by hand with the exact command above on an Apple-silicon Mac running
macOS 26: the installer verified the signature, and `omac status` showed
`accessibility true` and `tap true`.</sub>
