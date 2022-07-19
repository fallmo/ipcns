#/bin/bash

new_ip=$(curl -s ipecho.net/plain);
old_ip=$(cat ./ip 2> /dev/null);

if [ "$new_ip" == "$old_ip" ]; then echo "no change."; exit 0; fi;

echo "ip change."
echo $new_ip > ./ip

source ./handle_update.sh
send_mail;


