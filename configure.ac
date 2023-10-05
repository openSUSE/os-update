dnl Process this file with autoconf to produce a configure script.
AC_INIT(os-update, 1.12)
AM_INIT_AUTOMAKE
AC_PREFIX_DEFAULT(/usr)

AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

AC_ARG_ENABLE([vendordir],
  AS_HELP_STRING([--enable-vendordir=DIR], [Directory for configuration files provided by the distribution]),,
  []
)
AC_SUBST([vendordir], [$enable_vendordir])
AM_CONDITIONAL([HAVE_VENDORDIR], [test "x$enable_vendordir" != x])

PKG_CHECK_VAR([systemdsystemunitdir], [systemd], [systemdsystemunitdir], [],
	[AC_MSG_ERROR([Could not determine value for 'systemdsystemunitdir' - is the 'systemd.pc' file installed?])])
PKG_CHECK_VAR([tmpfilesdir], [systemd], [tmpfilesdir], [],
	[AC_MSG_ERROR([Could not determine value for 'tmpfilesdir' - is the 'systemd.pc' file installed?])])
PKG_CHECK_VAR([sysusersdir], [systemd], [sysusersdir], [],
	[AC_MSG_ERROR([Could not determine value for 'sysusersdir' - is the 'systemd.pc' file installed?])])

AC_PROG_INSTALL
AC_PROG_LN_S

AC_OUTPUT([Makefile src/Makefile src/os-update systemd/Makefile])
