# Cloudbox Quick Command Launcher
A very simple script to quickly launch common scripts/commands, relating to a Cloudbox environment.

Instructions:

1.  curl "https://raw.githubusercontent.com/phunkb/Cloudbox-Quick-Command-Launcher/master/QuickCommands.sh" > /opt/scripts/quickCommands.sh; chmod +x /opt/scripts/quickCommands.sh

Then it is advised you set an alias for easy launching, I use `qc` for example. Here is how to set the alias:

1. Check your shell type by typing `echo $SHELL`. Depending what it says, use the instructions below:

Bash:
   1. `nano ~/.bashrc`
   2. Something instructions something to add here

Zsh:
   1. `nano ~/.zshrc`
   2. Add `alias qc="/opt/scripts/quickCommands.sh"`



