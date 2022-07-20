cd $(dirname "$0")
source ./vars.conf

function send_mail {
	printf "Subject: IP Update ($HOSTNAME)\n\nCurrent IP: $new_ip\nDate: $(date +%c)\nHostname: $HOSTNAME" | msmtp -a default --from=$smtp_email --user=$smtp_email --passwordeval="echo $smtp_password" --logfile=./mail.log $destination
    echo "mail sent to: $destination"
}
