# Omac

A tiling window manager for macOS. Your windows arrange themselves side by
side, never overlap, and you move between them with the keyboard. It works with
[Omarchy](https://omarchy.org)'s keybindings.

## Install

**Needs** a Mac with Apple silicon and macOS 14 or later. Nothing else — no
Homebrew, no developer tools, no GitHub account.

**1. Paste this into Terminal** (⌘ Space, type *Terminal*, press Return):

```bash
curl -fsSL https://raw.githubusercontent.com/evanscastonguay/omac/main/install.sh | bash
```

Gratuit — conditions d'utilisation : [`EULA.fr.md`](EULA.fr.md) · free to use — terms: [`EULA.md`](EULA.md). Installing means you accept them; the installer prints these links too.

If an old copy of Omac is in `/Applications`, Terminal asks for your Mac
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

**Reporting a problem:** send the output of `omac status` and what you pressed.

## Update

Run the install command from step 1 again. Your settings and the Accessibility
permission are kept.

## Uninstall

Undo what Omac changed, then remove it:

```bash
omac theme off        # if you used a theme: restores your wallpaper and recoloured apps
omac skill uninstall  # if you installed the coding-agent skill
omac login off
omac quit
rm -rf ~/Applications/Omac.app ~/.local/bin/omac
```

Then remove Omac from **System Settings → Privacy & Security → Accessibility**.

To also delete its settings, state and downloaded wallpapers:

```bash
rm -rf ~/.config/omac ~/.local/state/omac ~/.local/share/omac
defaults delete com.evanscastonguay.omac
```

The installer may have added two lines starting with `# Added by the Omac
installer` to your shell's startup file — `~/.zshrc`, `~/.bash_profile`, or
`~/.config/fish/config.fish` — which you can delete.

<details>
<summary><b>What the install command does</b></summary>

<br>

1. Downloads the latest release from this repository.
2. Checks its SHA-256 checksum, so a broken download is never installed.
3. Checks the app is signed with Omac's Developer ID (team `5GB46V9555`), so a
   modified app is never installed.
4. Removes an old copy in `/Applications`, if there is one.
5. Installs `Omac.app` to `~/Applications` and the `omac` command to
   `~/.local/bin`, adding that folder to your `PATH` if it is not already there.
6. Starts Omac. On a first install it also turns on *start at login*.

To read the script before running it:

```bash
curl -fsSL https://raw.githubusercontent.com/evanscastonguay/omac/main/install.sh -o install.sh
less install.sh
bash install.sh
```

</details>

<details>
<summary><b>Install without Terminal</b></summary>

<br>

1. Download **`Omac-arm64.zip`** from the
   [latest release](https://github.com/evanscastonguay/omac/releases/latest) and open it.
2. Drag **`Omac.app`** from the folder that appears into **Applications**.
3. Open Omac. macOS asks once whether to open an app downloaded from the
   internet — click **Open**.
4. Continue with step 2 above.

This way does not set up the `omac` command or start at login. Choose **Launch
at login** from Omac's menu-bar icon for that.

</details>

<details>
<summary><b>Signed and notarized</b></summary>

<br>

Omac is signed with a Developer ID, so macOS knows who built it and that it has
not been changed since — the installer checks that before installing. Since
1.4.8 it is also *notarized*: Apple scanned the build and issued a ticket,
stapled to the app, so macOS can confirm it even offline. A copy downloaded
with a web browser opens after macOS's usual first-open confirmation; the
Terminal command has no extra step.

</details>

## License

From 1.4.8, Omac is free to use under its licence terms,
[`EULA.md`](EULA.md) (en français, [`EULA.fr.md`](EULA.fr.md)), which come with
the app. All rights reserved — see [`LICENSE`](LICENSE). Versions 1.4.5, 1.4.6 and
1.4.7 were released under the MIT License and stay under it
([`LICENSE-MIT-1.4.5-1.4.7`](LICENSE-MIT-1.4.5-1.4.7)); later versions are not.
Omac includes third-party work, listed in
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md). Of Omarchy's 92 theme
wallpapers, a review found 22 that Omac may redistribute, and 21 of those show
Omarchy's wordmark or logo, so from 1.4.8 Omac ships one: Flexoki Light's orb.
[The review](docs/wallpaper-review.md) gives every decision.

Omac is an independent, unofficial project. It is not affiliated with or
endorsed by Omarchy, its creators, 37signals LLC or the Omacom Foundation.
Omarchy and the Omarchy trademark belong to 37signals LLC and the creators of Omarchy.

---

<sub>Tested with the exact command above on an Apple-silicon Mac running macOS
26.3.1, on 2026-09-26: updated 1.4.4 to 1.4.5 after removing an old copy in
`/Applications`, signature verified, `accessibility true`, `tap true`.</sub>
