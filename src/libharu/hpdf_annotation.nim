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
## ------ HPDF_Annotation -----------------------------------------------------

proc HPDF_Annotation_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; `type`: HPDF_AnnotType;
                         rect: HPDF_Rect): HPDF_Annotation
proc HPDF_LinkAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                        dst: HPDF_Destination): HPDF_Annotation
proc HPDF_URILinkAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                           uri: cstring): HPDF_Annotation
proc HPDF_3DAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect; u3d: HPDF_U3D): HPDF_Annotation
proc HPDF_MarkupAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                          text: cstring; encoder: HPDF_Encoder;
                          subtype: HPDF_AnnotType): HPDF_Annotation
proc HPDF_PopupAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                         parent: HPDF_Annotation): HPDF_Annotation
proc HPDF_StampAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                         name: HPDF_StampAnnotName; text: cstring;
                         encoder: HPDF_Encoder): HPDF_Annotation
proc HPDF_ProjectionAnnot_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref; rect: HPDF_Rect;
                              text: cstring; encoder: HPDF_Encoder): HPDF_Annotation
proc HPDF_Annotation_Validate*(annot: HPDF_Annotation): HPDF_BOOL