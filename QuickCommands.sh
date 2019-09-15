#!/bin/bash
# Cloudbox Quick Command Launcher v.0.1
figlet CloudCommand
echo -e "\e[32mCloudbox Quick Command Launcher\e[37m"
PS3='Choose Command: '
options=("Plex AutoScan Log" "Cloudplow Log" "NCDU /opt (excluding Plex)" "NCDU /opt (including Plex)" "Plex Sync Folder Size" "Show Certificate Information" "Fix Plex Trash" "Renew Necessary Certificates" "Force Renew ALL Certificates" "NCDU Local Mount" "Get Plex Token" "Nench Benchmark" "Quit")
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
        "Nench Benchmark")
        echo "Launching Nench Benchmark. \e[39m"
        echo
        curl -s wget.racing/nench.sh | bash
        ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

