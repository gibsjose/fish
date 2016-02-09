# Microamps Blog SSH
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

# Setup Improved Git Log
function setup-git-log
    git config --global alias.ls "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
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
