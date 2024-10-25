function fish_greeting
  #   pfetch
end


# Automatically attach to an existing tmux session if one exists
# if test -z "$TMUX"
#     tmux has-session 2>/dev/null
#     and tmux attach-session
# end

function fish_prompt
    # Git branch
    set -l git_branch ""
    set git_branch (git branch --show-current 2>/dev/null)

    # Build prompt
    set_color red --bold
    printf "["
    set_color yellow
    printf "%s" "$USER"
    set_color green
    printf "@"
    set_color blue
    printf "%s" "$hostname"
    set_color magenta
    printf " %s" "$PWD"
    
    if test -n "$git_branch"
        set_color cyan
        printf " (%s)" "$git_branch"
    end

    set_color red
    printf "] "
    set_color normal
end

abbr n "nvim"
abbr ls "eza --icons "
abbr l "eza --icons "
abbr ll "eza --icons -ahl"
abbr lt "eza --tree"

abbr cat "bat"
abbr cd "z"

abbr g "git"
abbr gs "git status"
abbr gp "git pull"
abbr gps "git push"
abbr ga "git add"
abbr gc "git commit -m "

abbr update "sudo pacman -Syu --noconfirm"
abbr install "sudo pacman -S"
abbr remove "sudo pacman -Rns"

abbr ss "sudo systemctl"
abbr s "sudo"

alias rm "rm -v"
alias cp "cp -v"
alias mv "mv -v"
alias c "clear"

alias config "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

abbr tn "tmux new -As (pwd | sed 's/.*\///g')"
abbr t "tmux"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export PATH $PATH:/home/relow/.dotnet/tools
set --export PATH $PATH:/home/relow/.tmuxifier/bin

set --export EDITOR nvim

fish_vi_key_bindings


zoxide init fish | source

