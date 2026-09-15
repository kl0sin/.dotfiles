# .dotfiles

Personal macOS configuration for terminal, shell, editor, and tmux.

## What's included

| Module | Tool | Purpose |
|---|---|---|
| `karabiner/` | [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | Caps Lock → Hyper (`ctrl+cmd+alt`) / Escape on tap |
| `ghostty/` | [Ghostty](https://ghostty.org/) | **Primary terminal** |
| `zsh/` | Zsh + Oh My Zsh (git plugin) + brew plugins | Prompt is Starship; OMZ is kept only for git aliases. Autosuggest + syntax-highlight sourced from Homebrew. Sources `~/.zshrc.local` for machine-specific config |
| `starship/` | [Starship](https://starship.rs/) | Cross-shell prompt — Tokyo Night palette, git indicators, language badges |
| `tmux/` | [tmux](https://github.com/tmux/tmux) + [TPM](https://github.com/tmux-plugins/tpm) | Terminal multiplexer with Tokyo Night theme |

CLI productivity stack installed via Brewfile: `fzf`, `eza`, `bat`, `git-delta`, `zoxide`, `ripgrep`, `lazygit`, `zsh-autosuggestions`, `zsh-syntax-highlighting`.

Window management is [Loop](https://github.com/MrKai77/Loop) (installed via Brewfile). It is configured through its own GUI, so nothing for it lives in this repo — see the Loop section below.

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

Installs everything from `Brewfile`: Loop, Karabiner-Elements, Ghostty, JetBrains Mono, tmux, tmuxinator, ripgrep, lazygit, etc.

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

### 6. Loop — first run

Launch **Loop.app** once, grant Accessibility permissions and enable launch at login. Then in **Settings**:

- **Trigger key**: Caps Lock (Hyper) — emitted by the Karabiner rule above.
- **Keybindings → +**: add the *Thirds* actions; the radial menu only maps halves/quarters, so wrap thirds in **Cycle** keybinds (e.g. Left Half → Left Two Thirds → Left Third) and repeat the key or left-click to cycle.
- **Behavior → Padding**: window gaps + screen padding (per screen if needed).

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
| `karabiner/.config/karabiner/assets/…` | `~/.config/karabiner/assets/…` |
| `ghostty/.config/ghostty/config` | `~/.config/ghostty/config` |
| `zsh/.zshrc` | `~/.zshrc` |
| `starship/.config/starship.toml` | `~/.config/starship.toml` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |

`~/.zshrc.local` is **not** in the repo — it holds machine-specific Zsh config (NVM, per-user paths, tool installers). Created on first shell setup.

## Notes

- Tested on macOS Sequoia (Apple Silicon). Older versions may work but are not verified.
- **On first install, before running `./install`:** back up your existing `~/.zshrc` (e.g. `mv ~/.zshrc ~/.zshrc.pre-dotfiles`). Then after `./install`, move any machine-specific Zsh config (NVM, custom paths, language version managers) from the backup into a new `~/.zshrc.local` — the managed `~/.zshrc` sources it automatically.
- **git-delta** is wired as the git pager via `git config --global` on first use. If you want it globally: `git config --global core.pager delta && git config --global interactive.diffFilter "delta --color-only" && git config --global delta.navigate true && git config --global delta.line-numbers true && git config --global merge.conflictStyle zdiff3`.
- PRs and issues welcome.
