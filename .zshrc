# Wal
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors.sh

# p10k config
# source ~/.zshrc_p10k

# Use powerline
USE_POWERLINE="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Source other config file inspired from manjaro
source "$HOME/.zsh-manjaro-config"
source "$HOME/.zsh-plugins"
source "$HOME/.zsh-keybinding"

# Use 256 colors and UNICODE.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# History
HISTSIZE=5000
HISTFILE=~/.zhistory
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory        # Immediately append history instead of overwriting
setopt sharehistory         # History shared between term
setopt hist_ignore_space    # Ignore command with spaces
setopt hist_ignore_dups     # Ignore duplicates
setopt hist_ignore_all_dups # Ignore all duplicate commands
setopt hist_save_no_dups    # Do not save duplicates
setopt hist_find_no_dups

# File and Dir colors for ls and other outputs
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"

# Path
# Doom bin
export PATH="$HOME/.config/emacs/bin:$PATH"
# local bin
export PATH="$HOME/.local/bin:$PATH"

# export local gem
# export GEM_HOME="$HOME/.local/share/gem/ruby/3.4.0"
# export GEM_PATH="$GEM_HOME:$HOME/.local/share/gem/ruby/gems/gems"
# export PATH="$GEM_HOME/bin:$PATH"

export EDITOR=/usr/bin/nano
export VISUAL=/usr/bin/nano

alias zshconfig="nvim ~/.zshrc"
alias cp="cp -i"     # Confirm before overwriting something
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias cl="clear"
alias ls='ls $LS_OPTIONS'
alias la="eza -l -g -a --icons=always"
alias l="eza -l -g --icons=always"
alias neo=fastfetch
alias eserv="emacs --daemon"
alias eclient="emacsclient -c -n"

source "$HOME/.emacs_alias.zsh"

# Yazi
alias y=yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source "$HOME/.git_alias.zsh"

if [ -f  "$HOME/.secret" ]; then
   source "$HOME/.secret"
fi

# pnpm
export PNPM_HOME="/home/croy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# rbenv
export PATH="/home/croy/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
# source /usr/lib/rbenv/completions/rbenv.zsh
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

# bun completions
[ -s "/home/croy/.bun/_bun" ] && source "/home/croy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source "$HOME/Applications/Hyprland/hyprctl/hyprctl.zsh"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Fzf
eval "$(fzf --zsh)"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
 local command=$1
 shift

 case "$command" in
     cd) fzf --preview 'eza —-tree ——color=always {} | head -200' "$@" ;;
     export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
     ssh) fzf --preview 'dig {}' "$@" ;;
     *) fzf --preview "--preview 'bat -n —-color=always —-line-range :500 {}'" "$@" ;;
esac
}
# Starship
eval "$(starship init zsh)"
