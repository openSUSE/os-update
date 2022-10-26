% os-update(1)
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


# CONFIGURATION FILES

/usr/etc/os-update.conf
:  Vendor provided configuration file, contains the defaults.

/etc/os-update.conf
:  Admin provided configuration file, should only contain the variables which
were changed by the system administrator compared to the vendor configuration
file.

# SEE ALSO
systemd.timer(5)
