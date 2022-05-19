##
##  << Haru Free PDF Library >> -- hpdf_encryptdict.h
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

## ---------------------------------------------------------------------------
## ------ HPDF_EncryptDict ---------------------------------------------------

proc HPDF_EncryptDict_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_EncryptDict
proc HPDF_EncryptDict_CreateID*(dict: HPDF_EncryptDict; info: HPDF_Dict;
                               xref: HPDF_Xref)
proc HPDF_EncryptDict_OnFree*(obj: HPDF_Dict)
proc HPDF_EncryptDict_SetPassword*(dict: HPDF_EncryptDict; owner_passwd: cstring;
                                  user_passwd: cstring): HPDF_STATUS
proc HPDF_EncryptDict_Validate*(dict: HPDF_EncryptDict): HPDF_BOOL
proc HPDF_EncryptDict_Prepare*(dict: HPDF_EncryptDict; info: HPDF_Dict;
                              xref: HPDF_Xref): HPDF_STATUS
proc HPDF_EncryptDict_GetAttr*(dict: HPDF_EncryptDict): HPDF_Encrypt