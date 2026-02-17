# Launch tmux if in an interactive shell
# if status is-interactive
# and not set -q TMUX
#     exec tmux new-session -A -s main
# end

# PATH
fish_add_path --prepend --global ~/bin
fish_add_path --prepend --global ~/bin/utilities
fish_add_path --prepend --global ~/.cargo/bin
fish_add_path --prepend --global ~/.local/bin

# JDK Path for compilers
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@21/include"

# Set Editor
set -g -x EDITOR 'vim'

# Suppress Greeting
set -g -x fish_greeting ''

# Redefine fish prompt to use powerline
function fish_prompt
    ~/.local/bin/powerline-shell --shell bare $status
end

# Set up fzf key bindings
if type -q fzf
    fzf --fish | source
end

# Open in tmux popup if on tmux, otherwise use --height mode
set -g -x FZF_DEFAULT_OPTS '--style full --layout reverse --tmux bottom,40%'

# Show a preview using bat in the file viewer, or a tree when a directory is highlighted
set -g -x FZF_CTRL_T_OPTS '--preview "[ -d {} ] && tree -C {} || bat --color=always --style=numbers --line-range=:500 {}"'

# Print tree structure in the preview window
set -g -x FZF_ALT_C_OPTS "--walker-skip .git,node_modules,target --preview 'tree -C {}'"

# Set up 1Password CLI completions
if type -q op
    op completion fish | source
end

# Set up bat completions
if type -q bat
    bat --completion fish | source
end

# iTerm 2 integration
if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end

# Source aliases
for f in (find ~/.config/fish/aliases/*.fish)
    source $f
end

# Source custom functions
for f in (find ~/.config/fish/functions/*.fish)
    source $f
end

# Source tokens (gitignored, not in version control)
for f in (find ~/.config/fish/tokens -name "*.fish" 2>/dev/null)
    source $f
end

# Source any vendor completions
if test -d /opt/homebrew/share/fish/vendor_completions.d
    for f in (find /opt/homebrew/share/fish/vendor_completions.d/*.fish)
        source $f
    end
end