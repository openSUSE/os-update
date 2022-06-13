
systemdsystemunit_DATA = os-update.timer os-update.service

EXTRA_DIST = os-update.timer os-update.service.in

CLEANFILES = os-update.service

os-update.service: os-update.service.in
	sed -e 's|@libexec@|$(libexecdir)|g' $< > $@
