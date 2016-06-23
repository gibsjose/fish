# PATH
set -g -x PATH /usr/local/bin $PATH

### User Binaries
set -g -x PATH ~/bin $PATH
### Git HFCS
set -g -x PATH ~/bin/util.git-hfcs $PATH
### Utilities
# set -g -x PATH ~/bin/bash-utilities $PATH
### Todo Python script
# set -g -x PATH ~/bin/todo $PATH

### CodeSonar
set -g -x PATH $PATH /usr/local/codesonar-4.2p0/codesonar/bin

### AVR Toolchain
#### Postfixing this to PATH so it searches this last
set -g -x PATH $PATH /Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin

### MacTeX (pdflatex, etc.)
set -g -x PATH /Library/TeX/texbin $PATH

# Brew Cask Options
set -g -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

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

# Source API Tokens
# for f in (find ~/.config/fish/tokens/*.fish)
#     source $f
# end

# Set path for Git HFCS
set -g -x PATH /usr/local/bin $PATH
