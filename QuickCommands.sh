#!/bin/bash
# Cloudbox Quick Command Launcher v.0.1
echo -e "Default \e[32mCloudbox Quick Command Launcher"
echo
PS3='Choose Command: '
options=("Plex AutoScan Log" "Cloudplow Log" "NCDU /opt (excluding Plex)" "NCDU /opt (including Plex)" "Plex Sync Folder Size" "Show Certificate Information" "Fix Plex Trash" "Renew Necessary Certificates" "Force Renew ALL Certificates" "NCDU Local Mount" "Get Plex Token" "Nench Benchmark" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Plex AutoScan Log")
        echo "Launching Plex Autoscan Log Tail."
        echo
        tail -f /opt/plex_autoscan/plex_autoscan.log -n 30
        ;;
        "Cloudplow Log")
        echo "Launching Cloudplow Log Tail."
        echo
        tail -f /opt/cloudplow/cloudplow.log -n 30
        ;;
        "NCDU /opt (excluding Plex)")
        echo "Launching NCDU (excluding Plex)."
        echo
        ncdu -x /opt --exclude=/opt/plex
        ;;
        "NCDU /opt (including Plex)")
        echo "Launching NCDU (including Plex)."
        ncdu /opt
        ;;
        "NCDU Local Mount")
        echo "Launching NCDU in Local Mount."
        ncdu "/mnt/local/"
        ;;
        "Get Plex Token")
        echo "Launching Plex Token Script."
        /scripts/files/plex_token.sh
        ;;
        "Plex Sync Folder Size")
        currSize=$(sudo du -sh '/opt/plex/Library/Application Support/Plex Media Server/Cache/Transcode' | awk '{print $1}')
        echo "Sync Folder Size is: $currSize"
        ;;
		"Fix Plex Trash")
		echo "Running Plex Trash Fixer Script."
        /opt/scripts/plex/plex_trash_fixer.py
		;;
        "Show Certificate Information")
        echo "Launching Certificate Information."
        docker exec letsencrypt /app/cert_status
        ;;
        "Renew Necessary Certificates")
        echo "Forcing Renew of all Necessary Cerificates."
        docker exec letsencrypt /app/signal_le_service
        ;;
        "Force Renew ALL Certificates")
        echo "Forcing Renew of ALL Cerificates."
        docker exec letsencrypt /app/cert_status
        ;;
        "Nench Benchmark")
        echo "Launching Nench Benchmark."
        echo
        curl -s wget.racing/nench.sh | bash
        ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

