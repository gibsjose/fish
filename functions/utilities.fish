# Reload fish configuration
function reload
    source ~/.config/fish/config.fish
end

# Setup Improved Git Environment
function setup-git
    git config --global alias.ls "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

    git config --global core.pager "diff-so-fancy | less --tabs=1,5 -R"
end

# `sizeof`: get the size of a file/directory in human readable format
function sizeof
    if test -d $argv
        dirsize $argv
    else
        filesize $argv
    end
end

function filesize
    ls -lah $argv | awk '{print $5}'
end

function dirsize
    du -sh $argv | awk '{print $1}'
end

# Fuck
function fuck
    eval (thefuck --alias | tr '\n' ';')
end
