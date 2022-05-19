##
##  << Haru Free PDF Library >> -- hpdf_pages.c
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
  hpdf_gstate, hpdf_types, hpdf_objects, hpdf_streams, hpdf_font, hpdf_mmgr

## ----------------------------------------------------------------------------
## ----- HPDF_Pages -----------------------------------------------------------

{.push dynlib: "libhpdf.so".}
proc HPDF_Pages_New*(mmgr: HPDF_MMgr; parent: HPDF_Pages; xref: HPDF_Xref): HPDF_Pages {.importc.}
proc HPDF_Pages_Validate*(pages: HPDF_Pages): HPDF_BOOL {.importc.}
proc HPDF_Pages_AddKids*(parent: HPDF_Pages; kid: HPDF_Dict): HPDF_STATUS {.importc.}
proc HPDF_Page_InsertBefore*(page: HPDF_Page; target: HPDF_Page): HPDF_STATUS {.importc.}
{.pop.}
type
  HPDF_PageAttr_Rec* {.bycopy.} = object
    parent*: HPDF_Pages
    fonts*: HPDF_Dict
    xobjects*: HPDF_Dict
    ext_gstates*: HPDF_Dict
    gstate*: HPDF_GState
    str_pos*: HPDF_Point
    cur_pos*: HPDF_Point
    text_pos*: HPDF_Point
    text_matrix*: HPDF_TransMatrix
    gmode*: HPDF_UINT16
    contents*: HPDF_Dict
    stream*: HPDF_Stream
    xref*: HPDF_Xref
    compression_mode*: HPDF_UINT
    ver*: ptr HPDF_PDFVer
  HPDF_PageAttr* = ptr HPDF_PageAttr_Rec


## ----------------------------------------------------------------------------
## ----- HPDF_Page ------------------------------------------------------------

{.push dynlib: "libhpdf.so".}
proc HPDF_Page_Validate*(page: HPDF_Page): HPDF_BOOL {.importc.}
proc HPDF_Page_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_Page {.importc.}
proc HPDF_Page_GetInheritableItem*(page: HPDF_Page; key: cstring;
                                  obj_class: HPDF_UINT16): pointer {.importc.}
proc HPDF_Page_GetXObjectName*(page: HPDF_Page; xobj: HPDF_XObject): cstring {.importc.}
proc HPDF_Page_GetLocalFontName*(page: HPDF_Page; font: HPDF_Font): cstring {.importc.}
proc HPDF_Page_GetExtGStateName*(page: HPDF_Page; gstate: HPDF_ExtGState): cstring {.importc.}
proc HPDF_Page_GetMediaBox*(page: HPDF_Page): HPDF_Box {.importc.}
proc HPDF_Page_SetBoxValue*(page: HPDF_Page; name: cstring; index: HPDF_UINT;
                           value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_SetFilter*(page: HPDF_Page; filter: HPDF_UINT) {.importc.}
proc HPDF_Page_CheckState*(page: HPDF_Page; mode: HPDF_UINT): HPDF_STATUS {.importc.}
{.pop.}
