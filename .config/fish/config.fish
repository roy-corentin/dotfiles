# Fish configuration translated from ~/.zshrc.
# Fish already provides autosuggestions, syntax highlighting, and completions.

# Environment
set -gx EDITOR /usr/bin/nvim
set -gx VISUAL /usr/bin/nvim
set -gx MANROFFOPT -c
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx COMPOSE_BAKE true
set -gx EMACS_IGC_GENS "256000 0.8 256000 0.6 256000 0.4 512000 0.2"
set -gx MISE_DISABLE_TOOLS ruby

# Language and package-manager paths
set -gx GEM_HOME "$HOME/.local/share/gem/ruby/3.4.0"
set -gx GEM_PATH "$GEM_HOME/gems"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx BUN_INSTALL "$HOME/.bun"

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/Applications/depot_tools"
fish_add_path "$GEM_HOME/bin"
fish_add_path "$PNPM_HOME"
fish_add_path "$BUN_INSTALL/bin"

# Optional Fish-native profile for environment variables and startup setup.
if test -f "$HOME/.fish_profile"
    source "$HOME/.fish_profile"
end

# CachyOS `done` plugin: notify when a long-running command finishes.
if status is-interactive; and test -f /usr/share/cachyos-fish-config/conf.d/done.fish
    source /usr/share/cachyos-fish-config/conf.d/done.fish
    set -g __done_min_cmd_duration 10000
    set -g __done_notification_urgency_level low
end

# History. Fish manages persistence and duplicate handling itself.
set -g fish_history fish

# Aliases
alias cl='clear'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias hx='helix'
alias l='eza -l -g --group-directories-first --icons=always'
alias la='eza -l -g -a --group-directories-first --icons=always'
alias lt='eza -aT --group-directories-first --icons=always'
alias tree='eza -aT --group-directories-first --icons=always'
alias neo='fastfetch'
alias y='yazi'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias fishconfig='nvim ~/.config/fish/config.fish'
alias zshconfig='nvim ~/.zshrc'
alias myip='curl https://ipinfo.io/ip'

# CachyOS aliases
alias l.="eza -a | grep -e '^\\.'"
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias tarnow='tar -acf'
alias untar='tar -zxvf'
alias wget='wget -c'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'
alias big="expac -H M '%m\\t%n' | sort -h | nl"
alias gitpkg="pacman -Q | grep -i '\\-git' | wc -l"
alias update='sudo cachyos-rate-mirrors && sudo pacman -Syu'
alias mirror='sudo cachyos-rate-mirrors'
alias apt='man pacman'
alias apt-get='man pacman'
alias tb='nc termbin.com 9999'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
alias jctl='journalctl -p 3 -xb'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\\t%n %v' | sort | tail -200 | nl"

# CachyOS file helpers
function backup --argument-names filename
    if test -z "$filename"
        echo 'Usage: backup FILE' >&2
        return 2
    end
    command cp -i -- "$filename" "$filename.bak"
end

function copy
    if test (count $argv) -eq 2; and test -d "$argv[1]"
        command cp -ri -- "$argv[1]" "$argv[2]"
    else
        command cp -i $argv
    end
end

# Git aliases
alias gf='git fetch --all'
alias gF='git pull'
alias gp='git push'
alias gl='git log'
alias gst='git status'

# Emacs helpers
function e
    if pgrep emacs >/dev/null
        emacsclient -n $argv
    else
        emacs -nw $argv
    end
end

function ediff
    if test (count $argv) -ne 2
        echo 'Usage: ediff FILE1 FILE2' >&2
        return 2
    end
    emacs -nw --eval "(ediff-files \"$argv[1]\" \"$argv[2]\")"
end

function eman
    if test (count $argv) -ne 1
        echo 'Usage: eman TOPIC' >&2
        return 2
    end
    emacs -nw --eval "(switch-to-buffer (man \"$argv[1]\"))"
end

function ekill
    emacsclient --eval '(kill-emacs)'
end

function et
    emacsclient -t $argv
end

function fish_greeting
    fastfetch
end
# set -g fish_greeting

if status is-interactive
    # Emacs-style bindings; Fish includes history-prefix search by default.
    fish_default_key_bindings

    # Optional tool integrations.
    if type -q mise
        mise activate fish | source
    end

    zoxide init --cmd cd fish | source
    fzf --fish | source

    if type -q starship
        starship init fish | source
    end

    set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
    set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"
end

# ~/.secret may contain Zsh-only syntax, so do not source it directly here.
# Put Fish-compatible secrets in ~/.config/fish/conf.d/secret.fish instead.
