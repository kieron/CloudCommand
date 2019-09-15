# Cloudbox Quick Command Launcher
A very simple script to quickly launch common scripts/commands, relating to a Cloudbox environment.

### Install

The below will download the script, place it into `/opt/scripts` and set up an alias of `qc` for you to run the script.

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/QuickCommands.sh" > /opt/scripts/quickCommands.sh; chmod +x /opt/scripts/quickCommands.sh; alias qc=/opt/scripts/quickCommands.sh`

Then it is advised you set an alias for easy launching, I use `qc` for example. Here is how to set the alias:

1. Check your shell type by typing `echo $SHELL`. Depending what it says, use the instructions below:

Bash:
   1. `nano ~/.bashrc`
   2. Something instructions something to add here

Zsh:
   1. `nano ~/.zshrc`
   2. Add `alias qc="/opt/scripts/quickCommands.sh"`


## Updating

Updating instructions are actually the same as downloading currently, simply run:

`curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/QuickCommands.sh" > /opt/scripts/quickCommands.sh; chmod +x /opt/scripts/quickCommands.sh`


