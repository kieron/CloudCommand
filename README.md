# Cloudbox Quick Command Launcher
A very simple script to quickly launch common scripts/commands, relating to a Cloudbox environment.

### Install

The below will download the script, and place it into `/opt/scripts`.

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/QuickCommands.sh" > /opt/scripts/quickCommands.sh; chmod +x /opt/scripts/quickCommands.sh`

Then it is advised you set an alias for easy launching, I use `qc` for example. Here is how to set the alias:

1. Check your shell type by typing `echo $SHELL`. Depending what it says, use the instructions below:

Bash:
   1. `nano ~/.bashrc`
   2. Add `alias qc="/opt/scripts/quickCommands.sh"`
   3. Run `source ~/.bashrc` to make the new alias available.

Zsh:
   1. `nano ~/.zshrc`
   2. Add `alias qc="/opt/scripts/quickCommands.sh"`
   3. Run `source ~/.zshrc` to make the new alias available.


### Updating

Updating instructions are actually the same as downloading currently, simply run:

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/QuickCommands.sh" > /opt/scripts/quickCommands.sh; chmod +x /opt/scripts/quickCommands.sh`
