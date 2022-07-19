# IPCNS <span style="font-weight: normal; font-size:20px;"># ip change notify script</span>

> Script to keep me informed of my constantly-changing home ip while I find a free dynamic dns service or configure my own.

---

## Installation

1. Install msmtp package (rpm: `msmtp-1.8.10-1.el8.x86_64`)

2. Configure msmtp

File `~/.msmtprc` - example content:

```
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-bundle.crt
logfile        ~/.msmtp.log

account        gmail
host           smtp.gmail.com
port           587

account default : gmail

```

3. Configure script variables

File `./vars.conf` - example content:

```
destination=<to-email>
smtp_email=<from-email>
smtp_password=<app-password>
check_frequency=<cron-expression> # Optional (default: "*/5 * * * *" every 5 minutes)

```

4. Install crontab

Run `install-cron.sh` to install crontab-which will periodically run `check.sh` script to check for ip change.

```
$ ./install-cron.sh
```
