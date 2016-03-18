#######################################
# SSH Aliases
#######################################

# Microamps Blog
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

# NASA Sunlight
function sunlight
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/sunlight jjgibso2@gs408-sunlight.ndc.nasa.gov $argv
end
