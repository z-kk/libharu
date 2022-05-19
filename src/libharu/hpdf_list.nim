##
##  << Haru Free PDF Library >> -- hpdf_list.h
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
  hpdf_error, hpdf_mmgr, hpdf_types

type
  HPDF_List_Rec* {.bycopy.} = object
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    block_siz*: HPDF_UINT
    items_per_block*: HPDF_UINT
    count*: HPDF_UINT
    obj*: ptr pointer
  HPDF_List* = ptr HPDF_List_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_List_New*(mmgr: HPDF_MMgr; items_per_block: HPDF_UINT): HPDF_List {.importc.}
proc HPDF_List_Free*(list: HPDF_List) {.importc.}
proc HPDF_List_Add*(list: HPDF_List; item: pointer): HPDF_STATUS {.importc.}
proc HPDF_List_Insert*(list: HPDF_List; target: pointer; item: pointer): HPDF_STATUS {.importc.}
proc HPDF_List_Remove*(list: HPDF_List; item: pointer): HPDF_STATUS {.importc.}
proc HPDF_List_RemoveByIndex*(list: HPDF_List; index: HPDF_UINT): pointer {.importc.}
proc HPDF_List_ItemAt*(list: HPDF_List; index: HPDF_UINT): pointer {.importc.}
proc HPDF_List_Find*(list: HPDF_List; item: pointer): HPDF_INT32 {.importc.}
proc HPDF_List_Clear*(list: HPDF_List) {.importc.}
{.pop.}
