# Zsh config — managed by dotfiles
# Dotfile: ~/_Projects/.dotfiles/zsh/.zshrc
# Symlink: ~/.zshrc
#
# Machine-specific / personal configuration (NVM, custom paths, tool
# installers, etc.) goes into ~/.zshrc.local, which is sourced at the
# end of this file and is gitignored.

# ─── PATH ──────────────────────────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ─── Oh My Zsh ─────────────────────────────────────────────────────────────
# Zachowany dla jego plugin system (git aliases: gst, ga, gco, gc, gp, ...),
# ale theme wyłączony — starship bierze prompta na siebie.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

# ─── Zsh plugins (brew-installed) ──────────────────────────────────────────
# Kolejność ma znaczenie: syntax-highlighting MUSI być ostatnie.
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─── fzf (fuzzy finder) ────────────────────────────────────────────────────
# Ctrl+R — historia, Ctrl+T — pliki, Alt+C — cd do katalogu
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

# ─── zoxide (smart cd) ─────────────────────────────────────────────────────
# `z foo` skacze do ostatnio używanego dir zawierającego "foo"
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# ─── Starship prompt ───────────────────────────────────────────────────────
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# ─── Aliases ───────────────────────────────────────────────────────────────
# ls → eza (jeśli dostępne)
if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza --icons --group-directories-first -lh --git'
    alias la='eza --icons --group-directories-first -la --git'
    alias tree='eza --tree --icons --level=2'
fi

# cat → bat (z pagerem), cat-like przez `bcat`
if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never --style=plain'
    alias less='bat'
fi

# Git — shortcuts poza OMZ git plugin
alias gd='git diff'              # delta podchwyci dzięki ~/.gitconfig
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate -20'

# Editor — jeśli używasz nvim/cursor/code, ustaw tu swój preferowany
export EDITOR='nvim'
export VISUAL='nvim'

# ─── Machine-local overrides ───────────────────────────────────────────────
# Wszystko co jest machine-specific (NVM, Windsurf, bun, custom paths) idzie
# do ~/.zshrc.local, który jest gitignored i nigdy nie trafia do repo.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
