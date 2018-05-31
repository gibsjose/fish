#######################################
# SSH Aliases
#######################################

# Microamps Blog
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish-cbc -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

# NASA Sunlight
function sunlight
    ssh -o ServerAliveInterval=20 -i ~/.ssh/sunlight jjgibso2@gs408-sunlight.ndc.nasa.gov $argv
end
