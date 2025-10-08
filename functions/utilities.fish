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

# Extract OTP from 1Password and copy to clipboard
function otp
    if test (count $argv) -eq 0
        echo "Usage: otp <item_name>"
        echo "Example: otp 'My Bank Account'"
        return 1
    end

    # Get the OTP from 1Password
    set otp_code (op item get "$argv[1]" --otp 2>/dev/null)

    if test $status -ne 0
        echo "Error: Failed to get OTP for '$argv[1]'"
        echo "Make sure you're signed in to 1Password CLI and the item exists"
        return 1
    end

    # Copy to clipboard
    echo $otp_code | pbcopy

    # Display the OTP (first 3 and last 3 characters for security)
    set otp_length (string length $otp_code)
    if test $otp_length -gt 6
        set masked_otp (string sub -l 3 $otp_code)"***"(string sub -s (math $otp_length - 2) $otp_code)
        echo "OTP copied to clipboard: $masked_otp"
    else
        echo "OTP copied to clipboard: $otp_code"
    end
end
