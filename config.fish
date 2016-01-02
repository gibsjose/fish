# PATH
set -g -x PATH /usr/local/bin $PATH
### User Binaries
set -g -x PATH ~/bin $PATH
### General Coding Tools (clang, avr, etc.)
set -g -x PATH ~/bin/clang-analyzer ~/bin/avr $PATH
### Todo Python script
set -g -x PATH ~/bin/todo $PATH
### Pipsi
set -g -x PATH ~/.local/bin $PATH
### Utilities
set -g -x PATH ~/bin/utilities $PATH
### Git Merge/Diff Tools
set -g -x PATH ~/bin/git-tools $PATH
### ROOT
set -g -x PATH /usr/local/root/bin $PATH
### Add RVM to PATH for scripting
set -g -x PATH $HOME/.rvm/bin $PATH
### Rocket
set -g -x PATH ~/bin/rocket/bin $PATH
### Go
set -g -x GOPATH $HOME/go
set -g -x PATH $GOPATH $GOPATH/bin $PATH
set -g -x PATH /usr/local/opt/go/libexec/bin $PATH
### MacTeX (pdflatex, etc.)
set -g -x PATH /Library/TeX/texbin $PATH

### Hashcat base directory
set -g -x HASHCAT '/opt/homebrew-cask/Caskroom/hashcat/2.00/hashcat-2.00'

# Brew Cask Options
set -g -x HOMEBREW_CASK_OPTS '--appdir=/Applications'

# Set Editor
set -g -x EDITOR '/usr/local/bin/atom -w'

# Suppress Greeting
set -g -x fish_greeting ''

# Colourize `less`
alias 'less' 'less -RN' #Enable colour and line numbers
set -gx LESSOPEN '| /usr/local/Cellar/source-highlight/3.1.8/bin/src-hilite-lesspipe.sh %s' # Pipes the output of the `source-highlight` less utility to less rather than the raw file

# Load aliases
source ~/.config/fish/aliases/aliases.fish

# Load custom functions
source ~/.config/fish/functions/utilities.fish

# Load GitHub API Tokens
source ~/.config/fish/tokens/github.fish

# Paths to your tackle
set tacklebox_path ~/.tackle ~/.tacklebox

# Theme
# set tacklebox_theme entropy

# Which modules would you like to load? (modules can be found in ~/.tackle/modules/*)
# Custom modules may be added to ~/.tacklebox/modules/
# Example format: set tacklebox_modules virtualfish virtualhooks

# Which plugins would you like to enable? (plugins can be found in ~/.tackle/plugins/*)
# Custom plugins may be added to ~/.tacklebox/plugins/
# Example format: set tacklebox_plugins python extract

# Load Tacklebox configuration
# . ~/.tacklebox/tacklebox.fish
