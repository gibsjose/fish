# Launch tmux if in an interactive shell
# if status is-interactive
# and not set -q TMUX
#     exec tmux new-session -A -s main
# end

# PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH ~/bin $PATH
set -g -x PATH ~/bin/utilities $PATH
set -g -x PATH ~/.cargo/bin $PATH
set -g -x PATH ~/.local/bin $PATH

# JDK Path for compilers
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@21/include"

# Set Editor
set -g -x EDITOR 'vim'

# Suppress Greeting
set -g -x fish_greeting ''

# Source aliases
for f in (find ~/.config/fish/aliases/*.fish)
    source $f
end

# Source custom functions
for f in (find ~/.config/fish/functions/*.fish)
    source $f
end

# Source any vendor completions
for f in (find /opt/homebrew/share/fish/vendor_completions.d/*.fish)
    source $f
end

# Redefine fish prompt to use powerline
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end

# Set up fzf key bindings
if type -q fzf
    fzf --fish | source
end

# Open in tmux popup if on tmux, otherwise use --height mode
# export FZF_DEFAULT_OPTS='--height 50% --tmux bottom,50% --layout reverse --border rounded'
set -g -x FZF_DEFAULT_OPTS '--style full --layout reverse --tmux bottom,40%'

# Print tree structure in the preview window
set -g -x FZF_ALT_C_OPTS "--walker-skip .git,node_modules,target --preview 'tree -C {}'"

# Set up 1Password CLI completions
if type -q op
    op completion fish | source
end