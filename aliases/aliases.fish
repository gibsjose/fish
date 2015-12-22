# Microamps Blog SSH
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end
