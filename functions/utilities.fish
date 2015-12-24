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

# Get the size of a file in human readable format
function fsize
	ls -lah $argv | awk '{print $5}'
end

function file-size
    fsize $argv
end

function sizeof
    fsize $argv
end
