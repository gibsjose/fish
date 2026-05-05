################################################################################
# Helper function to create command wrappers with fallback chain
################################################################################
function add_cmd_wrapper -d "Create command alias with fallback chain"
    set -l alias_name $argv[1]
    set -l fallbacks $argv[2..]

    # Find first available command
    set -l selected_cmd ""
    for fallback in $fallbacks
        # Extract command name (first word)
        set -l cmd_name (string split -m1 ' ' -- $fallback)[1]
        if type -q $cmd_name
            set selected_cmd $fallback
            break
        end
    end

    # Fall back to original command if nothing found
    if test -z "$selected_cmd"
        set selected_cmd $alias_name
    end

    # Create the wrapper function
    function $alias_name -V selected_cmd
        set -l cmd_parts (string split ' ' -- $selected_cmd)
        command $cmd_parts $argv
    end
end

################################################################################
# Command aliases using add_cmd_wrapper
################################################################################

# `cat` to `bat`
add_cmd_wrapper cat 'bat --style=plain'

# `curl` to `httpie`
add_cmd_wrapper curl http

# `ping` to `prettyping`
add_cmd_wrapper ping 'prettyping --nolegend'

# `grep` to `ripgrep` (rg) - Much faster grep replacement
add_cmd_wrapper grep rg 'grep --color=auto'

# `top` and `htop` to `bottom` (btm) - Modern Rust-based system monitor
# Falls back to glances, then standard top/htop
add_cmd_wrapper top btm glances
add_cmd_wrapper htop btm glances

# `ls` to `eza`
add_cmd_wrapper ls eza exa

# `lg` to `lazygit` (no fallback - only runs if available)
function lg
    if type -q lazygit
        command lazygit $argv
    end
end

# CM Setup function for TDAQ
function cm_setup
    source /cvmfs/atlas.cern.ch/repo/sw/tdaq/tools/cmake_tdaq/bin/cm_setup.sh
end

# Tree (custom wrapper with default args)
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

# `du` to `dust` - More intuitive disk usage analyzer
add_cmd_wrapper du dust

# `ps` to `procs` - Modern process viewer with better output
add_cmd_wrapper ps procs

# `sed` to `sd` - Intuitive find & replace (Rust-based)
# Note: sd has different syntax, so this wrapper may not work for all cases
add_cmd_wrapper sed sd

# `man` to `tldr` - Simplified man pages with examples
add_cmd_wrapper man tldr

# Network monitoring
add_cmd_wrapper nettop bandwhich

# Configure git-delta for better diffs
if type -q delta
    set -gx GIT_PAGER delta
    set -gx DELTA_PAGER "less -R"
end

# Set up completions for new Rust tools
if type -q fd
    complete -c fd -f
end

if type -q rg
    complete -c rg -f
end

if type -q dust
    complete -c dust -f
end

if type -q procs
    complete -c procs -f
end

if type -q xh
    complete -c xh -f
end
