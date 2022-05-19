##
##  << Haru Free PDF Library >> -- hpdf_catalog.h
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
  hpdf_objects, hpdf_types, hpdf_mmgr

type
  HPDF_Catalog* = HPDF_Dict

{.push dynlib: "libhpdf.so".}
proc HPDF_Catalog_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_Catalog {.importc.}
proc HPDF_Catalog_GetNames*(catalog: HPDF_Catalog): HPDF_NameDict {.importc.}
proc HPDF_Catalog_SetNames*(catalog: HPDF_Catalog; dict: HPDF_NameDict): HPDF_STATUS {.importc.}
proc HPDF_Catalog_GetRoot*(catalog: HPDF_Catalog): HPDF_Pages {.importc.}
proc HPDF_Catalog_GetPageLayout*(catalog: HPDF_Catalog): HPDF_PageLayout {.importc.}
proc HPDF_Catalog_SetPageLayout*(catalog: HPDF_Catalog; layout: HPDF_PageLayout): HPDF_STATUS {.importc.}
proc HPDF_Catalog_GetPageMode*(catalog: HPDF_Catalog): HPDF_PageMode {.importc.}
proc HPDF_Catalog_SetPageMode*(catalog: HPDF_Catalog; mode: HPDF_PageMode): HPDF_STATUS {.importc.}
proc HPDF_Catalog_SetOpenAction*(catalog: HPDF_Catalog;
                                open_action: HPDF_Destination): HPDF_STATUS {.importc.}
proc HPDF_Catalog_AddPageLabel*(catalog: HPDF_Catalog; page_num: HPDF_UINT;
                               page_label: HPDF_Dict): HPDF_STATUS {.importc.}
proc HPDF_Catalog_GetViewerPreference*(catalog: HPDF_Catalog): HPDF_UINT {.importc.}
proc HPDF_Catalog_SetViewerPreference*(catalog: HPDF_Catalog; value: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Catalog_Validate*(catalog: HPDF_Catalog): HPDF_BOOL {.importc.}
{.pop.}
