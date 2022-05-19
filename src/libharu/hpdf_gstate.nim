##
##  << Haru Free PDF Library >> -- hpdf_gstate.h
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
  hpdf_font, hpdf_types, hpdf_mmgr

## ----------------------------------------------------------------------------
## ------ graphic state stack -------------------------------------------------

type
  HPDF_GState_Rec* {.bycopy.} = object
    trans_matrix*: HPDF_TransMatrix
    line_width*: HPDF_REAL
    line_cap*: HPDF_LineCap
    line_join*: HPDF_LineJoin
    miter_limit*: HPDF_REAL
    dash_mode*: HPDF_DashMode
    flatness*: HPDF_REAL
    char_space*: HPDF_REAL
    word_space*: HPDF_REAL
    h_scalling*: HPDF_REAL
    text_leading*: HPDF_REAL
    rendering_mode*: HPDF_TextRenderingMode
    text_rise*: HPDF_REAL
    cs_fill*: HPDF_ColorSpace
    cs_stroke*: HPDF_ColorSpace
    rgb_fill*: HPDF_RGBColor
    rgb_stroke*: HPDF_RGBColor
    cmyk_fill*: HPDF_CMYKColor
    cmyk_stroke*: HPDF_CMYKColor
    gray_fill*: HPDF_REAL
    gray_stroke*: HPDF_REAL
    font*: HPDF_Font
    font_size*: HPDF_REAL
    writing_mode*: HPDF_WritingMode
    prev*: HPDF_GState
    depth*: HPDF_UINT
  HPDF_GState* = ptr HPDF_GState_Rec


## ----------------------------------------------------------------------------
## ----------------------------------------------------------------------------

{.push dynlib: "libhpdf.so".}
proc HPDF_GState_New*(mmgr: HPDF_MMgr; current: HPDF_GState): HPDF_GState {.importc.}
proc HPDF_GState_Free*(mmgr: HPDF_MMgr; gstate: HPDF_GState): HPDF_GState {.importc.}
{.pop.}
