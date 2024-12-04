
libexec_SCRIPTS = os-update systemd-status-mail

man_MANS = os-update.8 systemd-status-mail.8

configdir=/usr/share/os-update

config_DATA = os-update.conf

EXTRA_DIST = $(DATA) $(MANS) os-update.8.md os-update.in \
	     systemd-status-mail systemd-status-mail.8.md

%.8: %.8.md
	go-md2man -in $< -out $@
