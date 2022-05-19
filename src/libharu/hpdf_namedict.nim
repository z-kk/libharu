##
##  << Haru Free PDF Library >> -- hpdf_namedict.h
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
  hpdf_objects

proc HPDF_NameDict_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_NameDict
proc HPDF_NameDict_GetNameTree*(namedict: HPDF_NameDict; key: HPDF_NameDictKey): HPDF_NameTree
proc HPDF_NameDict_SetNameTree*(namedict: HPDF_NameDict; key: HPDF_NameDictKey;
                               tree: HPDF_NameTree): HPDF_STATUS
proc HPDF_NameDict_Validate*(namedict: HPDF_NameDict): HPDF_BOOL
## ------- NameTree -------

proc HPDF_NameTree_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_NameTree
proc HPDF_NameTree_Add*(tree: HPDF_NameTree; name: HPDF_String; obj: pointer): HPDF_STATUS
proc HPDF_NameTree_Validate*(tree: HPDF_NameTree): HPDF_BOOL
## ------- EmbeddedFile -------

proc HPDF_EmbeddedFile_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; file: cstring): HPDF_EmbeddedFile
proc HPDF_EmbeddedFile_Validate*(emfile: HPDF_EmbeddedFile): HPDF_BOOL