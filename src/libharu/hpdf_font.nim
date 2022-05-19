##
##  << Haru Free PDF Library >> -- hpdf_font.h
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
  hpdf_fontdef, hpdf_types, hpdf_objects, hpdf_encoder, hpdf_mmgr

## ----------------------------------------------------------------------------
## ----- Writing Mode ---------------------------------------------------------

type
  HPDF_FontType* = enum
    HPDF_FONT_TYPE1 = 0, HPDF_FONT_TRUETYPE, HPDF_FONT_TYPE3, HPDF_FONT_TYPE0_CID,
    HPDF_FONT_TYPE0_TT, HPDF_FONT_CID_TYPE0, HPDF_FONT_CID_TYPE2, HPDF_FONT_MMTYPE1
  HPDF_Font* = HPDF_Dict
  HPDF_Font_TextWidths_Func* = proc (font: HPDF_Font; text: ptr HPDF_BYTE;
                                  len: HPDF_UINT): HPDF_TextWidth
  HPDF_Font_MeasureText_Func* = proc (font: HPDF_Font; text: ptr HPDF_BYTE;
                                   len: HPDF_UINT; width: HPDF_REAL;
                                   fontsize: HPDF_REAL; charspace: HPDF_REAL;
                                   wordspace: HPDF_REAL; wordwrap: HPDF_BOOL;
                                   real_width: ptr HPDF_REAL): HPDF_UINT
  HPDF_FontAttr_Rec* {.bycopy.} = object
    `type`*: HPDF_FontType
    writing_mode*: HPDF_WritingMode
    text_width_fn*: HPDF_Font_TextWidths_Func
    measure_text_fn*: HPDF_Font_MeasureText_Func
    fontdef*: HPDF_FontDef
    encoder*: HPDF_Encoder ##  if the encoding-type is HPDF_ENCODER_TYPE_SINGLE_BYTE, the width of
                         ##  each charactors are cashed in 'widths'.
                         ##  when HPDF_ENCODER_TYPE_DOUBLE_BYTE the width is calculate each time.
                         ##
    widths*: ptr HPDF_INT16
    used*: ptr HPDF_BYTE
    xref*: HPDF_Xref
    descendant_font*: HPDF_Font
    map_stream*: HPDF_Dict
    cmap_stream*: HPDF_Dict
  HPDF_FontAttr* = ptr HPDF_FontAttr_Rec



{.push dynlib: "libhpdf.so".}
proc HPDF_Type1Font_New*(mmgr: HPDF_MMgr; fontdef: HPDF_FontDef;
                        encoder: HPDF_Encoder; xref: HPDF_Xref): HPDF_Font {.importc.}
proc HPDF_TTFont_New*(mmgr: HPDF_MMgr; fontdef: HPDF_FontDef; encoder: HPDF_Encoder;
                     xref: HPDF_Xref): HPDF_Font {.importc.}
proc HPDF_Type0Font_New*(mmgr: HPDF_MMgr; fontdef: HPDF_FontDef;
                        encoder: HPDF_Encoder; xref: HPDF_Xref): HPDF_Font {.importc.}
proc HPDF_Font_Validate*(font: HPDF_Font): HPDF_BOOL {.importc.}
{.pop.}
