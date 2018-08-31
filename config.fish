# PATH
set -g -x PATH /usr/local/bin $PATH

### User Binaries
set -g -x PATH ~/bin $PATH
### Utilities
set -g -x PATH ~/bin/utilities $PATH
### Git Merge/Diff Tools
# set -g -x PATH ~/bin/git-tools $PATH
### Todo Python script
# set -g -x PATH ~/bin/todo $PATH

### Rust
set -g -x PATH ~/.cargo/bin $PATH

### bin2image
set -g -x PATH ~/bin/util.bin2image $PATH

### Rocket
set -g -x PATH ~/bin/util.rocket/bin $PATH

### CodeSonar
set -g -x PATH $PATH /usr/local/codesonar-4.2p0/codesonar/bin

### AVR Toolchain
# set -g -x PATH /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin $PATH

### General Coding Tools (clang, etc.)
# set -g -x PATH ~/bin/clang-analyzer $PATH
### Pipsi
set -g -x PATH ~/.local/bin $PATH
### ROOT
# set -g -x PATH /usr/local/root/bin $PATH
### Add RVM to PATH for scripting
# set -g -x PATH $HOME/.rvm/bin $PATH
### Go
set -g -x GOPATH $HOME/go
set -g -x PATH $GOPATH $GOPATH/bin $PATH
set -g -x PATH /usr/local/opt/go/libexec/bin $PATH
# @TODO Cannot source a bash file from fish...
# source $GOPATH/src/github.com/zquestz/s/autocomplete/s-completion.bash

### MacTeX (pdflatex, etc.)
set -g -x PATH /Library/TeX/texbin $PATH

# Brew Cask Options
set -g -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

# Set Editor
set -g -x EDITOR 'vim'

# Suppress Greeting
set -g -x fish_greeting ''

# Source the autojump setup
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Source `pass` completion
source /usr/local/share/fish/vendor_completions.d/pass.fish

# Source aliases
for f in (find ~/.config/fish/aliases/*.fish)
    source $f
end

# Source custom functions
for f in (find ~/.config/fish/functions/*.fish)
    source $f
end

# Source API Tokens
# for f in (find ~/.config/fish/tokens/*.fish)
#     source $f
# end

# Set path for Git HFCS
set -g -x PATH /usr/local/bin $PATH

# Redefine fish prompt to use powerline
function fish_prompt
    powerline-shell --shell bare $status
end
