#######################################
# SSH Aliases
#######################################

# Microamps Blog
function microamps
    ssh -o ServerAliveInterval=20 -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

### NASA
set -g -x NASA_USERNAME 'jjgibso2'

# Build Hostname
function nasa_hostname
    echo "gs408-$argv[1].ndc.nasa.gov"
end

# Sunlight
function sunlight
    set -x NASA_HOSTNAME (eval nasa_hostname sunlight)
    set -x NASA_KEY ~/.ssh/sunlight
    ssh -o ServerAliveInterval=20 -i $NASA_KEY $NASA_USERNAME@$NASA_HOSTNAME $argv
end

# Grays
function grays
    set -x NASA_HOSTNAME (eval nasa_hostname grays)
    # set -x key ~/.ssh/grays
    ssh -o ServerAliveInterval=20 $NASA_USERNAME@$NASA_HOSTNAME $argv
end

# Torreys
function torreys
    set -x NASA_HOSTNAME (eval nasa_hostname torreys)
    # set -x key ~/.ssh/torreys
    ssh -o ServerAliveInterval=20 $NASA_USERNAME@$NASA_HOSTNAME $argv
end

# HFCS VM
function hfcs
    ssh -o PubkeyAuthentication=no hfcs@hfcs-vm
end
