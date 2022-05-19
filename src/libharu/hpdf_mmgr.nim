##
##  << Haru Free PDF Library >> -- hpdf_mmgr.h
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
  hpdf_types, hpdf_error

type
  HPDF_MPool_Node_Rec* {.bycopy.} = object
    buf*: ptr HPDF_BYTE
    size*: HPDF_UINT
    used_size*: HPDF_UINT
    next_node*: HPDF_MPool_Node
  HPDF_MPool_Node* = ptr HPDF_MPool_Node_Rec

  HPDF_MMgr_Rec* {.bycopy.} = object
    error*: HPDF_Error
    alloc_fn*: HPDF_Alloc_Func
    free_fn*: HPDF_Free_Func
    mpool*: HPDF_MPool_Node
    buf_size*: HPDF_UINT
    when defined(HPDF_MEM_DEBUG):
      alloc_cnt*: HPDF_UINT
      free_cnt*: HPDF_UINT
  HPDF_MMgr* = ptr HPDF_MMgr_Rec


##   HPDF_mpool_new
##
##   create new HPDF_mpool object. when memory allocation goes wrong,
##   it returns NULL and error handling function will be called.
##   if buf_size is non-zero, mmgr is configured to be using memory-pool
##

{.push dynlib: "libhpdf.so".}
proc HPDF_MMgr_New*(error: HPDF_Error; buf_size: HPDF_UINT;
                   alloc_fn: HPDF_Alloc_Func; free_fn: HPDF_Free_Func): HPDF_MMgr {.importc.}
proc HPDF_MMgr_Free*(mmgr: HPDF_MMgr) {.importc.}
proc HPDF_GetMem*(mmgr: HPDF_MMgr; size: HPDF_UINT): pointer {.importc.}
proc HPDF_FreeMem*(mmgr: HPDF_MMgr; aptr: pointer) {.importc.}
{.pop.}
