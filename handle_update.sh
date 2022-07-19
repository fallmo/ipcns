source ./vars.conf

function send_mail {
    message = $(printf "Subject: IP Update\n\nCurrent IP: $new_ip\nDate: $(date +%c)");
    echo $message | msmtp -a default --from=$smtp_email --user=$smtp_email --passwordeval="echo $smtp_password" --logfile=./mail.log $destination
    echo "mail sent to: $destination"
}