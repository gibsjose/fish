# `cat` to `bat`
function cat
    command bat $argv
end

# `curl` to `httpie`
function curl
    command http $argv
end

# `ping` to `prettyping`
function ping
    command prettyping --nolegend $argv
end

# `grep` Wrapper: colour
function grep
    command grep --color=auto $argv
end

# `top` and `htop` to `glances`
function top
    command glances $argv
end

function htop
    command glances $argv
end

# `ls` to `exa`
function ls
    command exa $argv
end

# ls with git output
function lsg
    command exa --long --git $argv
end

# `ls` helper functions
function la
    ls -la $argv
end

function l
    ls $argv
end

function pls
    pwd; echo; ls $argv
end

# Push/Pop Directories
function pud
    pushd $argv
end
function d
    pud $argv
end

function pod
    popd $argv
end
function p
    pod $argv
end

# Tree
function tree
    command tree -C --noreport $argv
end

function t --argument-names 'level'

    if test -n "$level"
        tree -L "$level"
    else
        tree -L 1
    end
end

function pt
    pwd; t
end

# `emacs` wrapper
function emacsclient
    ec $argv
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
