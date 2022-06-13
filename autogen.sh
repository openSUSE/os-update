#!/bin/sh -x

rm -fv config.sub config.guess config.h.in
aclocal
automake --add-missing --copy --force
autoreconf
chmod 755 configure
