if [ "$check_frequency" == "" ] 
then 
    check_frequency="*/5 * * * *"

fi

echo "Installing cron tab.. (check frequency: '$check_frequency')" 

crontab -l | { cat; echo "$check_frequency $(pwd)/check.sh"; } | crontab -
