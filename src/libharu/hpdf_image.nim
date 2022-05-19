##
##  << Haru Free PDF Library >> -- hpdf_image.h
##
##  URL: http://libharu.org
##
##  Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
##  Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
##
##  Permission to use, copy, modify, distribute and sell this software
##  and its documentation for any purpose is hereby granted without fee,
##  provided that the above copyright notice appear in all copies and
##  that both that copyright notice and this permission notice appear
##  in supporting documentation.
##  It is provided "as is" without express or implied warranty.
##
##

import
  hpdf_objects, hpdf_types, hpdf_streams, hpdf_mmgr

{.push dynlib: "libhpdf.so".}
proc HPDF_Image_Load1BitImageFromMem*(mmgr: HPDF_MMgr; buf: ptr HPDF_BYTE;
                                     xref: HPDF_Xref; width: HPDF_UINT;
                                     height: HPDF_UINT; line_width: HPDF_UINT;
                                     top_is_first: HPDF_BOOL): HPDF_Image {.importc.}
when not defined(LIBHPDF_HAVE_NOPNGLIB):
  proc HPDF_Image_LoadPngImage*(mmgr: HPDF_MMgr; png_data: HPDF_Stream;
                               xref: HPDF_Xref; delayed_loading: HPDF_BOOL): HPDF_Image {.importc.}
proc HPDF_Image_LoadJpegImage*(mmgr: HPDF_MMgr; jpeg_data: HPDF_Stream;
                              xref: HPDF_Xref): HPDF_Image {.importc.}
proc HPDF_Image_LoadJpegImageFromMem*(mmgr: HPDF_MMgr; buf: ptr HPDF_BYTE;
                                     size: HPDF_UINT; xref: HPDF_Xref): HPDF_Image {.importc.}
proc HPDF_Image_LoadRawImage*(mmgr: HPDF_MMgr; stream: HPDF_Stream; xref: HPDF_Xref;
                             width: HPDF_UINT; height: HPDF_UINT;
                             color_space: HPDF_ColorSpace): HPDF_Image {.importc.}
proc HPDF_Image_LoadRawImageFromMem*(mmgr: HPDF_MMgr; buf: ptr HPDF_BYTE;
                                    xref: HPDF_Xref; width: HPDF_UINT;
                                    height: HPDF_UINT;
                                    color_space: HPDF_ColorSpace;
                                    bits_per_component: HPDF_UINT): HPDF_Image {.importc.}
proc HPDF_Image_Validate*(image: HPDF_Image): HPDF_BOOL {.importc.}
proc HPDF_Image_SetMask*(image: HPDF_Image; mask: HPDF_BOOL): HPDF_STATUS {.importc.}
proc HPDF_Image_SetColorSpace*(image: HPDF_Image; colorspace: HPDF_Array): HPDF_STATUS {.importc.}
proc HPDF_Image_SetRenderingIntent*(image: HPDF_Image; intent: cstring): HPDF_STATUS {.importc.}
{.pop.}
