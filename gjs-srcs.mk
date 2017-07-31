gjs_public_headers =		\
	gjs/context.h		\
	gjs/coverage.h		\
	gjs/gjs.h		\
	gjs/macros.h		\
	util/error.h		\
	$(NULL)

# For historical reasons, some files live in gi/
# Some headers in the following list were formerly
# public

gjs_srcs =				\
	gi/arg.cpp			\
	gi/arg.h			\
	gi/boxed.cpp			\
	gi/boxed.h			\
	gi/closure.cpp			\
	gi/closure.h			\
	gi/enumeration.cpp		\
	gi/enumeration.h		\
	gi/foreign.cpp			\
	gi/foreign.h			\
	gi/fundamental.cpp		\
	gi/fundamental.h		\
	gi/function.cpp			\
	gi/function.h			\
	gi/gerror.cpp			\
	gi/gerror.h			\
	gi/gjs_gi_trace.h		\
	gi/gtype.cpp			\
	gi/gtype.h			\
	gi/interface.cpp		\
	gi/interface.h			\
	gi/ns.cpp			\
	gi/ns.h	        		\
	gi/object.cpp			\
	gi/object.h			\
	gi/param.cpp			\
	gi/param.h			\
	gi/proxyutils.cpp		\
	gi/proxyutils.h			\
	gi/repo.cpp			\
	gi/repo.h			\
	gi/union.cpp			\
	gi/union.h			\
	gi/value.cpp			\
	gi/value.h			\
	gjs/byteArray.cpp		\
	gjs/byteArray.h			\
	gjs/context.cpp			\
	gjs/context-private.h		\
	gjs/coverage-internal.h		\
	gjs/coverage.cpp 		\
	gjs/importer.cpp		\
	gjs/importer.h			\
	gjs/jsapi-constructor-proxy.cpp	\
	gjs/jsapi-constructor-proxy.h	\
	gjs/jsapi-dynamic-class.cpp	\
	gjs/jsapi-private.cpp		\
	gjs/jsapi-private.h		\
	gjs/jsapi-util.cpp		\
	gjs/jsapi-util.h		\
	gjs/jsapi-util-args.h		\
	gjs/jsapi-util-error.cpp	\
	gjs/jsapi-util-root.h		\
	gjs/jsapi-util-string.cpp	\
	gjs/jsapi-wrapper.h		\
	gjs/mem.h			\
	gjs/mem.cpp			\
	gjs/native.cpp			\
	gjs/native.h			\
	gjs/runtime.cpp			\
	gjs/runtime.h			\
	gjs/profiler.cpp		\
	gjs/profiler.h			\
	gjs/stack.cpp			\
	gjs/type-module.cpp		\
	gjs/type-module.h		\
	modules/modules.cpp		\
	modules/modules.h		\
	util/error.cpp			\
	util/glib.cpp			\
	util/glib.h			\
	util/hash-x32.cpp		\
	util/hash-x32.h			\
	util/log.cpp			\
	util/log.h			\
	util/misc.cpp			\
	util/misc.h			\
	util/sp-capture-reader.c	\
	util/sp-capture-reader.h	\
	util/sp-capture-types.h		\
	util/sp-capture-writer.c	\
	util/sp-capture-writer.h	\
	$(NULL)

# These files were part of a separate library
gjs_private_srcs =				\
	libgjs-private/gjs-gdbus-wrapper.cpp	\
	libgjs-private/gjs-gdbus-wrapper.h	\
	libgjs-private/gjs-util.cpp		\
	libgjs-private/gjs-util.h		\
	libgjs-private/gjs-gtk-util.h		\
	$(NULL)

gjs_gtk_private_srcs =			\
	libgjs-private/gjs-gtk-util.c	\
	$(NULL)

gjs_console_srcs =	\
	gjs/console.cpp	\
	$(NULL)
