# os-update
Update systems with zypper and reboot automatically if necessary.

## Introduction
`os-update` runs daily via systemd timers (so can be configured to any time
you want) and updates the system in a defined way. If the updated packages
require a reboot, either rebootmgr is notified (if running) or a reboot is
done via `systemctl reboot`.

It can be configured to do a full system upgrade (e.g. `zypper dup` for
rolling release distributions like *openSUSE Tumbleweed*),
to update only packages (e.g. `zypper up` for something like
*SUSE Linux Enterprise*) or to apply only security updates
(e.g. `zypper patch --category security`).

## CONFIGURATION OPTIONS

**UPDATE_CMD**="auto" - Specifies how to update the system. Valid values are "auto", "dup", "up" and
"security". "auto" will select the best fitting command depending on the OS.

**REBOOT_CMD**="auto" - Specifies how the system will be rebooted in case an update requires this. Valid values are "auto", "rebootmgr" and "reboot". "auto" will use rebootmgr if installed and running, else `systemctl reboot`.

**RESTART_SERVICES**="yes" - Specifies if after a successful update services should automatically restarted, if they are still using old libraries.

**IGNORE_SERVICES_FROM_RESTART**="udev dbus" - Specifies a list of services which should not be restarted

## CONFIGURATION FILES
**/usr/etc/os-update.conf** - Vendor provided configuration file, contains the defaults.

**/etc/os-update.conf** - Admin provided configuration file, should only contain the variables which were changed by the system administrator compared to the vendor configuration file.

