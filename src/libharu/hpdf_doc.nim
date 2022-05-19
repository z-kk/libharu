##
##  << Haru Free PDF Library >> -- hpdf_doc.h
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

const
  HPDF_SIG_BYTES* = 0x41504446

import
  hpdf_catalog, hpdf_types, hpdf_objects, hpdf_list, hpdf_streams, hpdf_encoder,
  hpdf_font, hpdf_fontdef, hpdf_error, hpdf_mmgr

const
  HPDF_VER_DEFAULT* = HPDF_VER_12

type
  HPDF_Doc_Rec* {.bycopy.} = object
    sig_bytes*: HPDF_UINT32
    pdf_version*: HPDF_PDFVer
    mmgr*: HPDF_MMgr
    catalog*: HPDF_Catalog
    outlines*: HPDF_Outline
    xref*: HPDF_Xref
    root_pages*: HPDF_Pages
    cur_pages*: HPDF_Pages
    cur_page*: HPDF_Page
    page_list*: HPDF_List
    error*: HPDF_Error_Rec
    info*: HPDF_Dict
    trailer*: HPDF_Dict
    font_mgr*: HPDF_List
    ttfont_tag*: array[6, HPDF_BYTE] ##  list for loaded fontdefs
    fontdef_list*: HPDF_List   ##  list for loaded encodings
    encoder_list*: HPDF_List
    cur_encoder*: HPDF_Encoder ##  default compression mode
    compression_mode*: HPDF_BOOL
    encrypt_on*: HPDF_BOOL
    encrypt_dict*: HPDF_EncryptDict
    def_encoder*: HPDF_Encoder
    page_per_pages*: HPDF_UINT
    cur_page_num*: HPDF_UINT   ##  buffer for saving into memory stream
    stream*: HPDF_Stream

  HPDF_Doc* = ptr HPDF_Doc_Rec

{.push dynlib: "libhpdf.so".}
proc HPDF_Doc_FindEncoder*(pdf: HPDF_Doc; encoding_name: cstring): HPDF_Encoder {.importc.}
proc HPDF_Doc_FindFontDef*(pdf: HPDF_Doc; font_name: cstring): HPDF_FontDef {.importc.}
proc HPDF_Doc_FindFont*(pdf: HPDF_Doc; font_name: cstring; encoding_name: cstring): HPDF_Font {.importc.}
proc HPDF_Doc_Validate*(pdf: HPDF_Doc): HPDF_BOOL {.importc.}
## ----- page handling -------------------------------------------------------

proc HPDF_Doc_GetCurrentPages*(pdf: HPDF_Doc): HPDF_Pages {.importc.}
proc HPDF_Doc_AddPagesTo*(pdf: HPDF_Doc; parent: HPDF_Pages): HPDF_Pages {.importc.}
proc HPDF_Doc_SetCurrentPages*(pdf: HPDF_Doc; pages: HPDF_Pages): HPDF_STATUS {.importc.}
proc HPDF_Doc_SetCurrentPage*(pdf: HPDF_Doc; page: HPDF_Page): HPDF_STATUS {.importc.}
## ----- font handling -------------------------------------------------------

proc HPDF_GetFontDef*(pdf: HPDF_Doc; font_name: cstring): HPDF_FontDef {.importc.}
proc HPDF_Doc_RegisterFontDef*(pdf: HPDF_Doc; fontdef: HPDF_FontDef): HPDF_STATUS {.importc.}
## ----- encoding handling ---------------------------------------------------

proc HPDF_Doc_RegisterEncoder*(pdf: HPDF_Doc; encoder: HPDF_Encoder): HPDF_STATUS {.importc.}
## ----- encryptio------------------------------------------------------------

proc HPDF_Doc_SetEncryptOn*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_Doc_SetEncryptOff*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_Doc_PrepareEncryption*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
{.pop.}
