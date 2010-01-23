dnl -*- Autoconf -*-

AC_INIT(gaul, 0.0.1)
dnl AC_CONFIG_SRCDIR(src/md5.scm)
AM_INIT_AUTOMAKE

AM_MAINTAINER_MODE

AC_SUBST(ACLOCAL_FLAGS,$ACLOCAL_FLAGS)

GUILE_PROGS
GUILE_FLAGS

GUILE_MODULE_AVAILABLE(HAVE_SRFI_34, [(srfi srfi-34)])
GUILE_MODULE_AVAILABLE(HAVE_SRFI_35, [(srfi srfi-35)])
GUILE_MODULE_AVAILABLE(HAVE_SRFI_34, [(gnome gtk)])

AM_CONDITIONAL(HAVE_SRFI_34, test "$HAVE_SRFI_34" = yes)
AM_CONDITIONAL(HAVE_SRFI_35, test "$HAVE_SRFI_35" = yes)

AC_CONFIG_FILES([
Makefile
src/Makefile
src/gaul/Makefile
src/gaul/apps/Makefile
unit-tests/Makefile
])
dnl doc/Makefile
dnl examples/Makefile

AC_OUTPUT
