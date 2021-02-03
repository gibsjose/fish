#######################################
# SSH Aliases
#######################################

# Microamps Blog
function microamps
    ssh -o ServerAliveInterval=20 -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end