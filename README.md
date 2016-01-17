# Fish Configuration

## Install
Clone this repository into `~/.config/fish/`:
```bash
git clone https://github.com/gibsjose/fish ~/.config/fish
```

To set `fish` as the default shell, first add it to the list of acceptable shells:
```bash
sudo -i # On OS X you must be root (not just use sudo) to redirect to this file... otherwise just open it up and add the line
echo /usr/local/bin/fish >>/etc/shells
logout
```

And finally change the shell:
```bash
chsh -s /usr/local/bin/fish
```
