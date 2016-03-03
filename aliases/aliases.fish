# @TODO: Safer 'rm': Use 'trash' on Darwin (uname = Darwin), rm -i on others

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

function pls
    pwd; echo; ls $argv
end

# `emacs` wrapper
function emacsclient
    ec $argv
end

# Microamps Blog SSH
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

# `s` aliases
function search
    s $argv
end

function stackoverflow
    s -p stackoverflow $argv
end

function stack
    s -p stackoverflow $argv
end

function google
    s -p google $argv
end

function wikipedia
    s -p wikipedia $argv
end

function wiki
    s -p wikipedia $argv
end

function amazon
    s -p amazon $argv
end

function github
    s -p github $argv
end

function hackernews
    s -p hackernews $argv
end

function hn
    s -p hackernews $argv
end

function wolframalpha
    s -p wolframalpha $argv
end

function wolfram
    s -p wolframalpha $argv
end
