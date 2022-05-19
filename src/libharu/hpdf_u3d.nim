##
##  << Haru Free PDF Library >> -- hpdf_u3d.h
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

proc HPDF_CreateJavaScript*(pdf: HPDF_Doc; code: cstring): HPDF_JavaScript
proc HPDF_LoadU3DFromFile*(pdf: HPDF_Doc; filename: cstring): HPDF_U3D
proc HPDF_LoadU3DFromMem*(pdf: HPDF_Doc; buffer: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_Image
proc HPDF_Create3DView*(mmgr: HPDF_MMgr; name: cstring): HPDF_Dict
proc HPDF_U3D_Add3DView*(u3d: HPDF_U3D; view: HPDF_Dict): HPDF_STATUS
proc HPDF_U3D_SetDefault3DView*(u3d: HPDF_U3D; name: cstring): HPDF_STATUS
proc HPDF_U3D_AddOnInstanciate*(u3d: HPDF_U3D; javaScript: HPDF_JavaScript): HPDF_STATUS
proc HPDF_3DView_AddNode*(view: HPDF_Dict; name: cstring; opacity: HPDF_REAL;
                         visible: HPDF_BOOL): HPDF_STATUS
proc HPDF_3DView_SetLighting*(view: HPDF_Dict; scheme: cstring): HPDF_STATUS
proc HPDF_3DView_SetBackgroundColor*(view: HPDF_Dict; r: HPDF_REAL; g: HPDF_REAL;
                                    b: HPDF_REAL): HPDF_STATUS
proc HPDF_3DView_SetPerspectiveProjection*(view: HPDF_Dict; fov: HPDF_REAL): HPDF_STATUS
proc HPDF_3DView_SetOrthogonalProjection*(view: HPDF_Dict; mag: HPDF_REAL): HPDF_STATUS
proc HPDF_3DView_SetCamera*(view: HPDF_Dict; coox: HPDF_REAL; cooy: HPDF_REAL;
                           cooz: HPDF_REAL; c2cx: HPDF_REAL; c2cy: HPDF_REAL;
                           c2cz: HPDF_REAL; roo: HPDF_REAL; roll: HPDF_REAL): HPDF_STATUS
proc HPDF_3DView_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; u3d: HPDF_U3D; name: cstring): HPDF_Dict