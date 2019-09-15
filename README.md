# Cloudbox Quick Command Launcher
CloudCommand is a very simple script to quickly launch common scripts/commands, relating to a Cloudbox environment.

### Install

The below will download the script, and place it into `/opt/scripts`.

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/CloudCommand.sh" > /opt/scripts/CloudCommand.sh; chmod +x /opt/scripts/CloudCommand.sh`

Then it is advised you set an alias for easy launching, I use `cc` for example. Here is how to set the alias:

1. Check your shell type by typing `echo $SHELL`. Depending what it says, use the instructions below:

Bash:
   1. `nano ~/.bashrc`
   2. Add `alias cc="/opt/scripts/CloudCommand.sh"`
   3. Run `source ~/.bashrc` to make the new alias available.

Zsh:
   1. `nano ~/.zshrc`
   2. Add `alias cc="/opt/scripts/CloudCommand.sh"`
   3. Run `source ~/.zshrc` to make the new alias available.


### Updating

Updating instructions are actually the same as downloading currently, simply run:

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/CloudCommand.sh" > /opt/scripts/CloudCommand.sh; chmod +x /opt/scripts/CloudCommand.sh`
