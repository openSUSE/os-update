% os-update(8)
% Thorsten Kukuk `<kukuk@thkukuk.de>`

# NAME

**os-update** - Update automatically packages and reboot if necessary

# SYNOPSIS

| **/usr/libexec/os-update**
| **/usr/lib/systemd/system/os-update.service**
| **/usr/lib/systemd/system/os-update.timer**

# DESCRIPTION

`os-update` runs daily via the `os-update.timer` systemd timer and updates the
system in a defined way. If the updated packages require a reboot, either
rebootmgr is notified (if running) or a reboot is done via `systemctl reboot`.

The os-update.timer can be configured like any other systemd timer to run at
the best fitting time.

It can be configured to do a full system upgrade (e.g. `zypper dup` for
rolling release distributions like *openSUSE Tumbleweed*),
to update only packages (e.g. `zypper up` for something like
*SUSE Linux Enterprise*) or to apply only security updates
(e.g. `zypper patch --category security`).

# CONFIGURATION OPTIONS

UPDATE_CMD="auto"
: Specifies how to update the system. Valid values are "auto", "dup", "up" and
"security". "auto" will select the best fitting command depending on the OS.

REBOOT_CMD="auto"
: Specifies how the system will be rebooted in case an update requires
this. Valid values are "auto", "rebootmgr", "reboot" and "none". "auto" will
use rebootmgr if installed and running, else `systemctl reboot`. "none" will
only print an informative message that a reboot is required, but not trigger
any.

RESTART_SERVICES="yes"
: Specifies if after a successful update services should automatically
restarted, if they are still using old libraries.

IGNORE_SERVICES_FROM_RESTART="dbus"
: Specifies a list of services which should not be restarted.

SERVICES_TRIGGERING_SOFT_REBOOT="dbus"
: Specifies a list of services which trigger a soft-reboot. If anything else triggers a real reboot, a full reboot is performed.

SERVICES_TRIGGERING_REBOOT=""
: Specifies a list of services which trigger a full reboot.

LOG_TAG="root"
: Specifies a custom log identifier

# CONFIGURATION FILES

/usr/etc/os-update.conf
:  Vendor provided configuration file, contains the defaults.

/etc/os-update.conf
:  Admin provided configuration file, should only contain the variables which
were changed by the system administrator compared to the vendor configuration
file.

# SEE ALSO
systemd.timer(5), systemd-status-mail(8)
