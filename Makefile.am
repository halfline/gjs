# http://people.gnome.org/~walters/docs/build-api.txt
.buildapi-allow-builddir:

-include $(INTROSPECTION_MAKEFILE)

bin_PROGRAMS =
lib_LTLIBRARIES =
noinst_HEADERS =
noinst_LTLIBRARIES =
noinst_DATA =
dist_gjsjs_DATA =
BUILT_SOURCES =
CLEANFILES =
EXTRA_DIST =
check_PROGRAMS =
check_LTLIBRARIES =
INTROSPECTION_GIRS =
## ACLOCAL_AMFLAGS can be removed for Automake 1.13
ACLOCAL_AMFLAGS = -I m4
AM_CXXFLAGS = $(WARN_CXXFLAGS) $(CODE_COVERAGE_CFLAGS)
AM_CPPFLAGS = -DG_LOG_DOMAIN=\"Gjs\" $(CODE_COVERAGE_CPPFLAGS)
AM_LDFLAGS = $(WARN_LDFLAGS) $(CODE_COVERAGE_LDFLAGS)
MAINTAINERCLEANFILES =					\
	$(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL)	\
	$(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN)	\
	$(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL)	\
	tap-driver.sh					\
	$(NULL)
GITIGNOREFILES = INSTALL m4

gjsjsdir = @gjsjsdir@
gjsoverridedir = $(gjsjsdir)/overrides

gjs_public_includedir = $(includedir)/gjs-1.0

########################################################################
include gjs-srcs.mk
########################################################################
nobase_gjs_public_include_HEADERS = $(gjs_public_headers)

########################################################################
pkgconfig_DATA = gjs-1.0.pc

EXTRA_DIST += gjs-1.0.pc.in

########################################################################
gjs_directory_defines = 				\
	-DGJS_TOP_SRCDIR=\"$(top_srcdir)\"		\
	-DGJS_TOP_BUILDDIR=\"$(top_builddir)\"		\
	-DGJS_JS_DIR=\"$(gjsjsdir)\"			\
	-DPKGLIBDIR=\"$(pkglibdir)\"

########################################################################
lib_LTLIBRARIES += libgjs.la

libgjs_la_CPPFLAGS =		\
	$(AM_CPPFLAGS)		\
	$(GJS_CFLAGS)	\
	$(gjs_directory_defines)\
	-I$(top_srcdir)/gi	\
	-DGJS_COMPILATION
libgjs_la_LDFLAGS = 			\
	-export-symbols-regex "^[^_]"	\
	-version-info 0:0:0		\
	$(NO_UNDEFINED_FLAG)		\
	$(NULL)
libgjs_la_LIBADD = 		\
	$(GJS_LIBS)

if ENABLE_GTK
libgjs_la_CPPFLAGS += $(GJS_GTK_CFLAGS)
libgjs_la_LIBADD += $(GJS_GTK_LIBS)
endif

# Please see gjs-srcs.mk for brief expanations
# of the layout of the sources due to historical
# reasons
libgjs_la_SOURCES = $(gjs_srcs)

# Also, these files used to be a separate library
libgjs_private_source_files = $(gjs_private_srcs)

if ENABLE_GTK
libgjs_private_source_files += $(gjs_gtk_private_srcs)
endif

libgjs_la_SOURCES += $(libgjs_private_source_files)

GjsPrivate-1.0.gir: libgjs.la
GjsPrivate_1_0_gir_LIBS = libgjs.la
GjsPrivate_1_0_gir_INCLUDES = GObject-2.0 Gio-2.0
GjsPrivate_1_0_gir_CFLAGS = -I$(top_srcdir)
GjsPrivate_1_0_gir_FILES = $(libgjs_private_source_files)
GjsPrivate_1_0_gir_SCANNERFLAGS =	\
	--identifier-prefix=Gjs		\
	--symbol-prefix=gjs_		\
	--warn-all			\
	$(WARN_SCANNERFLAGS)		\
	$(NULL)

if ENABLE_GTK
GjsPrivate_1_0_gir_INCLUDES += Gtk-3.0
endif

INTROSPECTION_GIRS += GjsPrivate-1.0.gir

if ENABLE_DTRACE
gjs_gi_probes.h: gi/gjs_gi_probes.d
	$(DTRACE) -C -h -s $< -o $@
gjs_gi_probes.o: gi/gjs_gi_probes.d
	$(DTRACE) -G -s $< -o $@
BUILT_SOURCES += gjs_gi_probes.h gjs_gi_probes.o
libgjs_la_LIBADD += gjs_gi_probes.o
endif
EXTRA_DIST += gi/gjs_gi_probes.d

tapset_in_files = gjs/gjs.stp.in
EXTRA_DIST += $(tapset_in_files)
if ENABLE_SYSTEMTAP
gjs/gjs.stp: gjs/gjs.stp.in Makefile
	$(AM_V_GEN)$(MKDIR_P) $(@D) && \
	$(SED) -e s,@EXPANDED_LIBDIR@,$(libdir), < $< > $@.tmp && mv $@.tmp $@
tapsetdir   = $(datadir)/systemtap/tapset
tapset_DATA = $(tapset_in_files:.stp.in=.stp)
endif

include Makefile-modules.am
include Makefile-examples.am

typelibdir = $(pkglibdir)/girepository-1.0
typelib_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)

CLEANFILES += $(INTROSPECTION_GIRS) $(typelib_DATA)

########################################################################
bin_PROGRAMS += gjs-console

gjs_console_CPPFLAGS = 		\
	$(AM_CPPFLAGS)		\
	$(GJS_CONSOLE_CFLAGS)	\
	$(NULL)
gjs_console_LDADD =		\
	$(GJS_CONSOLE_LIBS)	\
	libgjs.la
gjs_console_LDFLAGS = -rdynamic
gjs_console_SOURCES = $(gjs_console_srcs)

install-exec-hook:
	(cd $(DESTDIR)$(bindir) && $(LN_S) -f gjs-console$(EXEEXT) gjs$(EXEEXT))

include Makefile-test.am
include Makefile-insttest.am

EXTRA_DIST +=					\
	autogen.sh				\
	COPYING.LGPL				\
	doc/ByteArray.md			\
	doc/cairo.md				\
	doc/Hacking.md				\
	doc/SpiderMonkey_Memory.md		\
	doc/Style_Guide.md			\
	win32/build-rules-msvc.mak		\
	win32/config-msvc.mak			\
	win32/config.h.win32			\
	win32/create-lists-msvc.mak		\
	win32/create-lists.bat			\
	win32/detectenv-msvc.mak		\
	win32/generate-msvc.mak			\
	win32/gjs-introspection-msvc.mak	\
	win32/info-msvc.mak			\
	win32/install.mak			\
	win32/introspection-msvc.mak		\
	win32/Makefile.vc			\
	win32/README.txt			\
	$(NULL)

# Colin's handy Makefile bits for:
# 1) stuffing tarballs with pre-generated scripts from your workstation
# 2) bumping configure.ac version post-release
# 3) tagging correctly in git
# 4) uploading to gnome.org
# To use:
#  $ make check
#  $ make dist
#  $ make prepare-minor-release

# Customize to taste
TAG_PREFIX=GJS_
COMPRESSION=.bz2


PACKAGE=@PACKAGE@
VERSION=@VERSION@
DISTNAME=$(PACKAGE)-$(VERSION).tar$(COMPRESSION)
TAG_VERSION := $(shell echo $(VERSION) | $(SED) s/\\\./_/g)

prepare-release-tag: Makefile
	git tag -m "Tag $(TAG_VERSION)" -a $(TAG_PREFIX)$(TAG_VERSION)

prepare-minor-release: $(DISTNAME) prepare-release-tag Makefile
	env top_srcdir=$(top_srcdir) python $(top_srcdir)/verbump.py

upload-release: $(DISTNAME) Makefile
	git log origin/master..master
	@echo -n "Ok to push? [y/N] "; read ans; test x$$ans == xy || exit 1
	git push --tags origin master:master
	scp $(DISTNAME) master.gnome.org:
	ssh master.gnome.org install-module $(DISTNAME)


CPPCHECK=cppcheck
### cppcheck static code analysis
#
cppcheck:
	$(CPPCHECK) --enable=warning,performance,portability,information,missingInclude --force -q $(top_srcdir) -I $(top_builddir)

-include $(top_srcdir)/git.mk
