when not defined(INCLUDE_HPDF_CONFIG_H):
  const
    INCLUDE_HPDF_CONFIG_H* = 1
  ##  include/hpdf_config.h. Generated automatically at end of configure.
  ##  include/config.h.  Generated from config.h.in by configure.
  ##  include/config.h.in.  Generated from configure.in by autoheader.
  ##  debug build
  ##  #undef DEBUG
  ##  debug trace enabled
  ##  #undef DEBUG_TRACE
  ##  Define to 1 if you have the <dlfcn.h> header file.
  when not defined(LIBHPDF_HAVE_DLFCN_H):
    const
      LIBHPDF_HAVE_DLFCN_H* = 1
  ##  Define to 1 if you have the <inttypes.h> header file.
  when not defined(LIBHPDF_HAVE_INTTYPES_H):
    const
      LIBHPDF_HAVE_INTTYPES_H* = 1
  ##  Define to 1 if you have the `png' library (-lpng).
  when not defined(LIBHPDF_HAVE_LIBPNG):
    const
      LIBHPDF_HAVE_LIBPNG* = 1
  ##  Define to 1 if you have the `z' library (-lz).
  when not defined(LIBHPDF_HAVE_LIBZ):
    const
      LIBHPDF_HAVE_LIBZ* = 1
  ##  Define to 1 if you have the <memory.h> header file.
  when not defined(LIBHPDF_HAVE_MEMORY_H):
    const
      LIBHPDF_HAVE_MEMORY_H* = 1
  ##  libpng is not available
  ##  #undef HAVE_NOPNGLIB
  ##  zlib is not available
  ##  #undef HAVE_NOZLIB
  ##  Define to 1 if you have the <stdint.h> header file.
  when not defined(LIBHPDF_HAVE_STDINT_H):
    const
      LIBHPDF_HAVE_STDINT_H* = 1
  ##  Define to 1 if you have the <stdlib.h> header file.
  when not defined(LIBHPDF_HAVE_STDLIB_H):
    const
      LIBHPDF_HAVE_STDLIB_H* = 1
  ##  Define to 1 if you have the <strings.h> header file.
  when not defined(LIBHPDF_HAVE_STRINGS_H):
    const
      LIBHPDF_HAVE_STRINGS_H* = 1
  ##  Define to 1 if you have the <string.h> header file.
  when not defined(LIBHPDF_HAVE_STRING_H):
    const
      LIBHPDF_HAVE_STRING_H* = 1
  ##  Define to 1 if you have the <sys/stat.h> header file.
  when not defined(LIBHPDF_HAVE_SYS_STAT_H):
    const
      LIBHPDF_HAVE_SYS_STAT_H* = 1
  ##  Define to 1 if you have the <sys/types.h> header file.
  when not defined(LIBHPDF_HAVE_SYS_TYPES_H):
    const
      LIBHPDF_HAVE_SYS_TYPES_H* = 1
  ##  Define to 1 if you have the <unistd.h> header file.
  when not defined(LIBHPDF_HAVE_UNISTD_H):
    const
      LIBHPDF_HAVE_UNISTD_H* = 1
  ##  Define to the sub-directory where libtool stores uninstalled libraries.
  when not defined(LIBHPDF_LT_OBJDIR):
    const
      LIBHPDF_LT_OBJDIR* = ".libs/"
  ##  Define to the address where bug reports for this package should be sent.
  when not defined(LIBHPDF_PACKAGE_BUGREPORT):
    const
      LIBHPDF_PACKAGE_BUGREPORT* = ""
  ##  Define to the full name of this package.
  when not defined(LIBHPDF_PACKAGE_NAME):
    const
      LIBHPDF_PACKAGE_NAME* = "libhpdf"
  ##  Define to the full name and version of this package.
  when not defined(LIBHPDF_PACKAGE_STRING):
    const
      LIBHPDF_PACKAGE_STRING* = "libhpdf 2.3.0"
  ##  Define to the one symbol short name of this package.
  when not defined(LIBHPDF_PACKAGE_TARNAME):
    const
      LIBHPDF_PACKAGE_TARNAME* = "libhpdf"
  ##  Define to the home page for this package.
  when not defined(LIBHPDF_PACKAGE_URL):
    const
      LIBHPDF_PACKAGE_URL* = ""
  ##  Define to the version of this package.
  when not defined(LIBHPDF_PACKAGE_VERSION):
    const
      LIBHPDF_PACKAGE_VERSION* = "2.3.0"
  ##  Define to 1 if you have the ANSI C header files.
  when not defined(LIBHPDF_STDC_HEADERS):
    const
      LIBHPDF_STDC_HEADERS* = 1
  ##  Define to `unsigned int' if <sys/types.h> does not define.
  ##  #undef size_t
  ##  once: _INCLUDE_HPDF_CONFIG_H
