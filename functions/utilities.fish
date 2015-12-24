# Reload fish configuration
function reload
    source ~/.config/fish/config.fish
end

# `grep` Wrapper: colour
function grep
    command grep --color=auto $argv
end

# `ls` Wrapper: colour and human-readable sizes
function ls
    command ls -hG $argv
end

# `ls` helper functions
function la
    ls -la $argv
end

function ltr
    ls -ltr $argv
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
