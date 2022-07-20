#/bin/bash
cd $(dirname "$0")
new_ip=$(curl -s ipecho.net/plain && echo || echo "failed");
old_ip=$(cat ./ip 2> /dev/null);

if [ "$new_ip" == "failed" ]; then echo "failed to fetch"; exit 1; fi;
if [ "$new_ip" == "$old_ip" ]; then echo "no change."; exit 0; fi;

echo "ip change."
echo $new_ip > ./ip

source ./handle_update.sh
send_mail;


