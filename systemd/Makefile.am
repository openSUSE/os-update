
systemdsystemunit_DATA = os-update.timer os-update.service \
			 systemd-status-mail@.service

systemdsystemgenerator_SCRIPTS = status-mail-generator.sh

maildatadir=${datadir}/systemd-status-mail


maildata_DATA = status-mail.conf

EXTRA_DIST = os-update.timer os-update.service.in status-mail.conf \
	     status-mail-generator.sh.in systemd-status-mail@.service.in

CLEANFILES = os-update.service status-mail-generator.sh \
	     systemd-status-mail@.service

os-update.service: os-update.service.in
	sed -e 's|@libexec@|$(libexecdir)|g' $< > $@

status-mail-generator.sh: status-mail-generator.sh.in
	sed -e 's|@maildatadir@|$(maildatadir)|g' $< > $@

systemd-status-mail@.service: systemd-status-mail@.service.in
	sed -e 's|@libexec@|$(libexecdir)|g' $< > $@
