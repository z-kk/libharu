##
##  << Haru Free PDF Library >> -- hpdf_info.c
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

proc HPDF_Info_SetInfoAttr*(info: HPDF_Dict; `type`: HPDF_InfoType; value: cstring;
                           encoder: HPDF_Encoder): HPDF_STATUS
proc HPDF_Info_GetInfoAttr*(info: HPDF_Dict; `type`: HPDF_InfoType): cstring
proc HPDF_Info_SetInfoDateAttr*(info: HPDF_Dict; `type`: HPDF_InfoType;
                               value: HPDF_Date): HPDF_STATUS