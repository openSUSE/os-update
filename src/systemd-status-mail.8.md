systemd-status-mail 8 "December 2024" os-update "System Manager's Manual "
==========================================================================

# NAME

**systemd-status-mail** - Send a mail if a systemd.unit fails

# SYNOPSIS

**/usr/libexec/systemd-status-mail**  
**/usr/lib/systemd/system/systemd-status-mail@.service**

# DESCRIPTION

`systemd-mail-status` is called by `systemd-status-mail@.service`
if the service is configured for the **OnFailure** and/or **OnSuccess**
case of a systemd unit.
It sends an email to a configureable address with the name of the service, the
hostname and the output of `systemctl status --full <service>`.

# CONFIGURATION OPTIONS

ADDRESS="root@localhost"
: Address to which the status mail should be send.

FROM="root@myhostname"
: Sender address of the status mail.

HOSTNAME="<hostname>"
: Name of the host used as domain for the from address (root@$HOSTNAME)

MAILER="sendmail"
: Name of the mail client to send the status mail. Valid values are "sendmail"
and "mailx", by default "sendmail" is used.

RELAYHOST=""
: Mail relay used by mailx(1) if specified and not empty.

MAILX_OPTIONS=""
: Additional options passed to mailx(1)

SEND_ON_FAILURE="transactional-update.service"
: List of services which will be handled by the systemd.generator without the
need of creating static overrides. You can list the generated units with
"systemctl list-units 'systemd-status-mail@*' --all".

NUMLINES=500
: In case a service fails the mail will contain the service's log output; to
limit the mail's size by default only the last 500 lines will be added to the
mail's contents.

# CONFIGURATION FILES

/usr/etc/default/systemd-status-mail
:  Vendor provided configuration file, contains the defaults.

/etc/default/systemd-status-mail
:  Admin provided configuration file, should only contain the variables which
were changed by the system administrator compared to the vendor configuration
file.

# Example

To get informed if os-update(8) failed, create a file
`status-mail.conf` in the `/etc/systemd/system/os-update.service.d/` directory
with the content:

```
[Unit]
OnFailure=systemd-status-mail@%n.service
```

Everytime the os-update.service fails, a mail is send.

# SEE ALSO
os-update(8), mailx(1), sendmail(1), postfix(1)

# AUTHOR
Thorsten Kukuk
