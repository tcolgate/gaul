TESTS= \
	test-callback-object.scm

TESTS_ENVIRONMENT=guile -L $(top_srcdir)/src -s

%.check: %
	$(TESTS_ENVIRONMENT) $(srcdir)/$*

EXTRA_DIST=$(TESTS) guile-library.api
