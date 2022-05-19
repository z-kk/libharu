##
##  << Haru Free PDF Library >> -- hpdf_pdfa.h
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
  hpdf_doc, hpdf_objects, hpdf_types

{.push dynlib: "libhpdf.so".}
proc HPDF_PDFA_AppendOutputIntents*(pdf: HPDF_Doc; iccname: cstring;
                                   iccdict: HPDF_Dict): HPDF_STATUS {.importc.}
proc HPDF_PDFA_SetPDFAConformance*(pdf: HPDF_Doc; pdfatype: HPDF_PDFAType): HPDF_STATUS {.importc.}
proc HPDF_PDFA_GenerateID*(a1: HPDF_Doc): HPDF_STATUS {.importc.}
{.pop.}
