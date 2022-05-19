##
##  << Haru Free PDF Library >> -- hpdf_annotation.h
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

## ----------------------------------------------------------------------------
## ------ HPDF_3DMeasure -----------------------------------------------------

proc HPDF_3DC3DMeasure_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref;
                           firstanchorpoint: HPDF_Point3D;
                           textanchorpoint: HPDF_Point3D): HPDF_3DMeasure
proc HPDF_PD33DMeasure_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref;
                           annotationPlaneNormal: HPDF_Point3D;
                           firstAnchorPoint: HPDF_Point3D;
                           secondAnchorPoint: HPDF_Point3D;
                           leaderLinesDirection: HPDF_Point3D;
                           measurementValuePoint: HPDF_Point3D;
                           textYDirection: HPDF_Point3D; value: HPDF_REAL;
                           unitsString: cstring): HPDF_3DMeasure