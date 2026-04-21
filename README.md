# .dotfiles

Personal macOS configuration for window management, terminal, editor, and tmux.

## What's included

| Module | Tool | Purpose |
|---|---|---|
| `aerospace/` | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | i3-style tiling window manager |
| `karabiner/` | [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | Caps Lock → Hyper (`ctrl+cmd+alt`) / Escape on tap |
| `ghostty/` | [Ghostty](https://ghostty.org/) | **Primary terminal** |
| `kitty/` | [kitty](https://sw.kovidgoyal.net/kitty/) | Legacy terminal config (kept for fallback) |
| `zsh/` | Oh My Zsh + plugins | Zsh config (sources `~/.zshrc.local` for machine-specific stuff) |
| `starship/` | [Starship](https://starship.rs/) | Cross-shell prompt — Tokyo Night palette, git indicators, language badges |
| `tmux/` | [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm) | Terminal multiplexer with Dracula theme |

CLI productivity stack installed via Brewfile: `fzf`, `eza`, `bat`, `git-delta`, `zoxide`, `ripgrep`, `lazygit`, `zsh-autosuggestions`, `zsh-syntax-highlighting`.

Window borders come from [JankyBorders](https://github.com/FelixKratz/JankyBorders) and are started automatically by AeroSpace.

## Install

### 1. Clone

```zsh
git clone git@github.com:kl0sin/.dotfiles.git ~/_Projects/.dotfiles
cd ~/_Projects/.dotfiles
```

### 2. Homebrew

If you don't have Homebrew:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Packages

```zsh
brew bundle
```

Installs everything from `Brewfile`: AeroSpace, JankyBorders, Karabiner-Elements, Ghostty, kitty, JetBrains Mono, tmux, tmuxinator, ripgrep, lazygit, etc.

### 4. Link configuration

```zsh
./install
```

Uses GNU Stow to symlink each top-level directory into `$HOME`. Run `./uninstall` to reverse.

### 5. Karabiner — enable the Hyper rule

Karabiner-Elements manages its main config (`~/.config/karabiner/karabiner.json`) through the app GUI, so this repo only ships the **Caps Lock → Hyper / Escape** rule as an importable asset:

1. Launch **Karabiner-Elements** and grant the required permissions in **System Settings → Privacy & Security** (Input Monitoring, Accessibility).
2. Open **Complex Modifications → Add rule**.
3. Enable *"Caps Lock: hold = Hyper (ctrl+cmd+alt), tap = Escape"*.

### 6. AeroSpace — first run

Launch **AeroSpace.app** once and grant Accessibility permissions. It auto-starts on login (`start-at-login = true`) and launches JankyBorders automatically.

### 7. tmux plugins (TPM)

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux and press `prefix + I` (prefix is remapped to `Ctrl-a`) to install plugins.

## Uninstall

```zsh
./uninstall
```

Removes all symlinks from `$HOME`. Does not uninstall Homebrew packages — run `brew bundle cleanup --force` separately if you want that too.

## Symlink layout

After `./install`:

| Source (in repo) | Target (`$HOME`) |
|---|---|
| `aerospace/.aerospace.toml` | `~/.aerospace.toml` |
| `karabiner/.config/karabiner/assets/…` | `~/.config/karabiner/assets/…` |
| `ghostty/.config/ghostty/config` | `~/.config/ghostty/config` |
| `kitty/.config/kitty/` | `~/.config/kitty/` |
| `zsh/.zshrc` | `~/.zshrc` |
| `starship/.config/starship.toml` | `~/.config/starship.toml` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |

`~/.zshrc.local` is **not** in the repo — it holds machine-specific Zsh config (NVM, per-user paths, tool installers). Created on first shell setup.

## AeroSpace cheatsheet

`Hyper` = **Caps Lock held** (emits `ctrl+cmd+alt`). Tap Caps Lock = `Esc`.

| Binding | Action |
|---|---|
| `Hyper + h/j/k/l` | Focus left / down / up / right |
| `Hyper + Shift + h/j/k/l` | Move focused window |
| `Hyper + 1..9` | Switch workspace (1.Hub, 2.Dev, 3.Dev, 4.Dev, 5.Comm, 6.Docs, 7.Scratch, 8.Test, 9.Media) |
| `Hyper + Shift + 1..9` | Move window to workspace |
| `Hyper + Tab` | Back-and-forth between the last two workspaces |
| `Hyper + -` / `Hyper + =` | Resize smart |
| `Hyper + /` | Tiles layout |
| `Hyper + ,` | Accordion layout |
| `Hyper + ;` | Enter service mode |

**Service mode:** `r` reset layout · `f` toggle floating · `c` close window · `b` balance sizes · `Backspace` close-all-but-current · `Esc` reload config and exit.

## Notes

- Tested on macOS Sequoia (Apple Silicon). Older versions may work but are not verified.
- **On first install, before running `./install`:** back up your existing `~/.zshrc` (e.g. `mv ~/.zshrc ~/.zshrc.pre-dotfiles`). Then after `./install`, move any machine-specific Zsh config (NVM, custom paths, language version managers) from the backup into a new `~/.zshrc.local` — the managed `~/.zshrc` sources it automatically.
- **git-delta** is wired as the git pager via `git config --global` on first use. If you want it globally: `git config --global core.pager delta && git config --global interactive.diffFilter "delta --color-only" && git config --global delta.navigate true && git config --global delta.line-numbers true && git config --global merge.conflictStyle zdiff3`.
- PRs and issues welcome.
