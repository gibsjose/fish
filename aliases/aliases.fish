# Microamps Blog SSH
function microamps
    ssh -o ServerAliveInterval=20 -c blowfish -i ~/.ssh/microamps microamps@microamps.ydns.eu $argv
end

# Setup Improved Git Log
function setup-git-log
    git config --global alias.ls "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
end
