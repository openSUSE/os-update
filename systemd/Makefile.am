
systemdsystemunit_DATA = os-update.timer os-update.service \
			 systemd-status-mail@.service

maildatadir=${datadir}/systemd-status-mail


maildata_DATA = status-mail.conf

EXTRA_DIST = os-update.timer os-update.service.in status-mail.conf \
	     systemd-status-mail@.service.in

CLEANFILES = os-update.service systemd-status-mail@.service

os-update.service: os-update.service.in
	sed -e 's|@libexec@|$(libexecdir)|g' $< > $@

systemd-status-mail@.service: systemd-status-mail@.service.in
	sed -e 's|@libexec@|$(libexecdir)|g' $< > $@
