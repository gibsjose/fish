# `cat` to `bat`
function cat
    if type -q bat
        command bat --style=plain $argv
    else
        command cat $argv
    end
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
    if type -q exa
        command exa $argv
    else
        command ls $argv
    end
end

# ls with git output
function lsg
    if type -q exa
        command exa --long --git $argv
    else
        command ls $argv
    end
end

function l
    ls $argv
end

# Push/Pop Directories
function pud
    pushd $argv
end

function pod
    popd $argv
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