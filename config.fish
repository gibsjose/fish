# PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH ~/bin $PATH
set -g -x PATH ~/bin/utilities $PATH
set -g -x PATH ~/.cargo/bin $PATH
set -g -x PATH ~/.local/bin $PATH

# Set Editor
set -g -x EDITOR 'vim'

# Suppress Greeting
set -g -x fish_greeting ''

# Source the autojump setup
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Source aliases
for f in (find ~/.config/fish/aliases/*.fish)
    source $f
end

# Source custom functions
for f in (find ~/.config/fish/functions/*.fish)
    source $f
end

# Redefine fish prompt to use powerline
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end
