# Reload fish configuration
function reload
    source ~/.config/fish/config.fish
end

# Setup Improved Git Environment
function setup-git
    git config --global alias.ls "log --color --graph --pretty=format:'%Cred%h%Creset -%C(blue)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    
    git config --global alias.sl "stash list --pretty=format:'%C(bold blue)%gd%Cred: %C(reset)%s'"
end

# lsusb replacement for macOS
function lsusb
    ioreg -p IOUSB -l -w 0
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
    ls -laho $argv | awk '{print $4}'
end

function dirsize
    du -sh $argv | awk '{print $1}'
end

# Transfer
function transfer
    if not count $argv >/dev/null
        echo "No arguments specified."
        echo ""
        echo "Usage:"
        echo -e "  1)   transfer /tmp/test.md"
        echo -e "  2)   cat /tmp/test.md | transfer test.md"
        return 1
    end

    set tmpfile (mktemp -t transferXXX)

    if tty -s
        set basefile (basename "$argv[1]" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
        curl --progress-bar --upload-file "$argv[1]" "https://transfer.sh/$basefile" >> $tmpfile
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$argv[1]" >> $tmpfile
    end

    cat $tmpfile
    rm -f $tmpfile
end
