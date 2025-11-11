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
    if type -q http
        command http $argv
    else
        command curl $argv
    end
end

# `ping` to `prettyping`
function ping
    if type -q prettyping
        command prettyping --nolegend $argv
    else
        command ping $argv
    end
end

# `grep` to `ripgrep` (rg) - Much faster grep replacement
function grep
    if type -q rg
        command rg $argv
    else
        command grep --color=auto $argv
    end
end

# `top` and `htop` to `bottom` (btm) - Modern Rust-based system monitor
# Falls back to glances, then standard top/htop
function top
    if type -q btm
        command btm $argv
    else if type -q glances
        command glances $argv
    else
        command top $argv
    end
end

function htop
    if type -q btm
        command btm $argv
    else if type -q glances
        command glances $argv
    else
        command htop $argv
    end
end

# `ls` to `eza`
function ls
    if type -q eza
        command eza $argv
    else
        command ls $argv
    end
end

# `lg` to `lazygit`
function lg
    if type -q lazygit
        command lazygit $argv
    end
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