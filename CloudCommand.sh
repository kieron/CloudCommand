#!/bin/bash
# Cloudbox Quick Command Launcher v.0.1
figlet CloudCommand
echo -e "\e[32mCloudbox Quick Command Launcher"
echo -e "Choose a command from below:\e[37m"
echo
PS3='Enter Command: '
options=("Plex AutoScan Log" "Cloudplow Log" "Get Google Upload Ban Log Entry" "NCDU /opt (excluding Plex)" "NCDU /opt (including Plex)" "Plex Sync Folder Size" "Show Certificate Information" "Fix Plex Trash" "Renew Necessary Certificates" "Force Renew ALL Certificates" "NCDU Local Mount" "NCDU / (system) (excluding /mnt)" "Get Plex Token" "Update Ubuntu" "Nench Benchmark" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Plex AutoScan Log")
			echo -e "\e[96mLaunching Plex Autoscan Log Tail. \e[39m"
			echo
			tail -f /opt/plex_autoscan/plex_autoscan.log -n 30
        ;;
        "Cloudplow Log")
			echo -e "\e[96mLaunching Cloudplow Log Tail. \e[39m"
			echo
			tail -f /opt/cloudplow/cloudplow.log -n 30
        ;;
	"Get Google Upload Ban Log Entry")
			echo -e "\e[96mGetting last Cloudplow Google Ban Entry. \e[39m"
			echo
			grep "Exceeded" /opt/cloudplow/cloudplow.log | tail -1 
			echo
        ;;
        "NCDU /opt (excluding Plex)")
			echo -e "\e[96mLaunching NCDU (excluding Plex). \e[39m"
			echo
			ncdu -x /opt --exclude=/opt/plex
        ;;
        "NCDU /opt (including Plex)")
			echo -e "\e[96mLaunching NCDU (including Plex). \e[39m"
			ncdu /opt
        ;;
        "NCDU Local Mount")
			echo -e "\e[96mLaunching NCDU in Local Mount. \e[39m"
			ncdu "/mnt/local/"
        ;;
	"NCDU / (system) (excluding /mnt)")
			echo -e "\e[96mLaunching NCDU on system (excluding /mnt). \e[39m"
			ncdu -x / --exclude=/mnt
        ;;
        "Get Plex Token")
			echo -e "\e[96mLaunching Plex Token Script. \e[39m"
			/opt/scripts/plex/plex_token.sh
        ;;
        "Plex Sync Folder Size")
			currSize=$(sudo du -sh '/opt/plex/Library/Application Support/Plex Media Server/Cache/Transcode' | awk '{print $1}')
			echo -e "\e[96mSync Folder Size is: $currSize \e[39m"
        ;;
		"Fix Plex Trash")
			echo -e "\e[96mRunning Plex Trash Fixer Script. \e[39m"
			/opt/scripts/plex/plex_trash_fixer.py
		;;
        "Show Certificate Information")
			echo -e "\e[96mLaunching Certificate Information. \e[39m"
			docker exec letsencrypt /app/cert_status
        ;;
        "Renew Necessary Certificates")
			echo -e "\e[96mForcing Renew of all Necessary Cerificates. \e[39m"
			docker exec letsencrypt /app/signal_le_service
        ;;
        "Force Renew ALL Certificates")
			echo -e "\e[96mForcing Renew of ALL Cerificates. \e[39m"
			docker exec letsencrypt /app/cert_status
        ;;
		"Update Ubuntu")
			echo -e "\e[96mUpdating Ubuntu \e[39m"
			sudo apt-get update
			sudo apt-get dist-upgrade -y
			sudo apt-get autoremove -y
			sudo apt-get autoclean -y
        ;;
        "Nench Benchmark")
			echo -e "\e[96mLaunching Nench Benchmark. \e[39m"
			echo
			curl -s wget.racing/nench.sh | bash
        ;;
        "Quit")
            break
            ;;
        *) echo -e "\e[96mInvalid option $REPLY \e[39m";;
    esac
done

