##
##  << Haru Free PDF Library >> -- hpdf_outline.h
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
  hpdf_objects, hpdf_types, hpdf_encoder, hpdf_mmgr

## ----------------------------------------------------------------------------
## ----- HPDF_Outline ---------------------------------------------------------

{.push dynlib: "libhpdf.so".}
proc HPDF_OutlineRoot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_Outline {.importc.}
proc HPDF_Outline_New*(mmgr: HPDF_MMgr; parent: HPDF_Outline; title: cstring;
                      encoder: HPDF_Encoder; xref: HPDF_Xref): HPDF_Outline {.importc.}
proc HPDF_Outline_GetFirst*(outline: HPDF_Outline): HPDF_Outline {.importc.}
proc HPDF_Outline_GetLast*(outline: HPDF_Outline): HPDF_Outline {.importc.}
proc HPDF_Outline_GetPrev*(outline: HPDF_Outline): HPDF_Outline {.importc.}
proc HPDF_Outline_GetNext*(outline: HPDF_Outline): HPDF_Outline {.importc.}
proc HPDF_Outline_GetParent*(outline: HPDF_Outline): HPDF_Outline {.importc.}
proc HPDF_Outline_GetOpened*(outline: HPDF_Outline): HPDF_BOOL {.importc.}
proc HPDF_Outline_Validate*(obj: HPDF_Outline): HPDF_BOOL {.importc.}
{.pop.}
