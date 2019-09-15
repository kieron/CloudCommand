#!/bin/bash
# Cloudbox Quick Command Launcher
echo "Cloudbox Quick Command Launcher"
echo
PS3='Choose Command: '
options=("Plex AutoScan Log" "Cloudplow Log" "NCDU /opt (excluding Plex)" "NCDU /opt (including Plex)" "Show Certificate Information" "Renew Necessary Certificates" "Force Renew ALL Certificates" "NCDU Local Mount" "Get Plex Token" "Nench Benchmark" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Plex AutoScan Log")
        echo "Launching Plex Autoscan Log Tail"
        echo
        tail -f /opt/plex_autoscan/plex_autoscan.log -n 30
        ;;
        "Cloudplow Log")
        echo "Launching Cloudplow Log Tail"
        echo
        tail -f /opt/cloudplow/cloudplow.log -n 30
        ;;
        "NCDU /opt (excluding Plex)")
        echo "Launching NCDU (excluding Plex)"
        echo
        ncdu -x /opt --exclude=/opt/plex
        ;;
        "NCDU /opt (including Plex)")
        echo "Launching NCDU (including Plex)"
        ncdu /opt
        ;;
        "NCDU Local Mount")
        echo "Launching NCDU in Local Mount"
        ncdu "/mnt/local/"
        ;;
        "Get Plex Token")
        echo "Launching Plex Token Script"
        /scripts/files/plex_token.sh
        ;;
        "Show Certificate Information")
        echo "Launching Certificate Information"
        docker exec letsencrypt /app/cert_status
        ;;
        "Renew Necessary Certificates")
        echo "Forcing Renew of all Necessary Cerificates"
        docker exec letsencrypt /app/signal_le_service
        ;;
        "Force Renew ALL Certificates")
        echo "Forcing Renew of ALL Cerificates"
        docker exec letsencrypt /app/cert_status
        ;;
        "Nench Benchmark")
        echo "Launching Nench Benchmark"
        echo
        curl -s wget.racing/nench.sh | bash
        ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
