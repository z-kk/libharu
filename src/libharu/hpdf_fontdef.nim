##
##  << Haru Free PDF Library >> -- hpdf_fontdef.h
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
  hpdf_objects, hpdf_types, hpdf_list, hpdf_streams, hpdf_error, hpdf_mmgr,
  hpdf_consts

const
  HPDF_FONTDEF_SIG_BYTES* = 0x464F4E54

## ------ collection of flags for defining characteristics. ---

const
  HPDF_FONT_FIXED_WIDTH* = 1
  HPDF_FONT_SERIF* = 2
  HPDF_FONT_SYMBOLIC* = 4
  HPDF_FONT_SCRIPT* = 8

##  Reserved                    16

const
  HPDF_FONT_STD_CHARSET* = 32
  HPDF_FONT_ITALIC* = 64

##  Reserved                    128
##      Reserved                    256
##      Reserved                    512
##      Reserved                    1024
##      Reserved                    2048
##      Reserved                    4096
##      Reserved                    8192
##      Reserved                    16384
##      Reserved                    32768

const
  HPDF_FONT_ALL_CAP* = 65536
  HPDF_FONT_SMALL_CAP* = 131072
  HPDF_FONT_FOURCE_BOLD* = 262144
  HPDF_CID_W_TYPE_FROM_TO* = 0
  HPDF_CID_W_TYPE_FROM_ARRAY* = 1

## -- HPDF_FontDef ---------------------------------------

type
  HPDF_CharData* {.bycopy.} = object
    char_cd*: HPDF_INT16
    unicode*: HPDF_UNICODE
    width*: HPDF_INT16

  HPDF_FontDefType* = enum
    HPDF_FONTDEF_TYPE_TYPE1, HPDF_FONTDEF_TYPE_TRUETYPE, HPDF_FONTDEF_TYPE_CID,
    HPDF_FONTDEF_TYPE_UNINITIALIZED, HPDF_FONTDEF_TYPE_EOF
  HPDF_CID_Width* {.bycopy.} = object
    cid*: HPDF_UINT16
    width*: HPDF_INT16



## ----------------------------------------------------------------------------
## ----- HPDF_FontDef ---------------------------------------------------------

type
  HPDF_FontDef_FreeFunc* = proc (fontdef: HPDF_FontDef)
  HPDF_FontDef_CleanFunc* = proc (fontdef: HPDF_FontDef)
  HPDF_FontDef_InitFunc* = proc (fontdef: HPDF_FontDef): HPDF_STATUS
  HPDF_FontDef_Rec* {.bycopy.} = object
    sig_bytes*: HPDF_UINT32
    base_font*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    `type`*: HPDF_FontDefType
    clean_fn*: HPDF_FontDef_CleanFunc
    free_fn*: HPDF_FontDef_FreeFunc
    init_fn*: HPDF_FontDef_InitFunc
    ascent*: HPDF_INT16
    descent*: HPDF_INT16
    flags*: HPDF_UINT
    font_bbox*: HPDF_Box
    italic_angle*: HPDF_INT16
    stemv*: HPDF_UINT16
    avg_width*: HPDF_INT16
    max_width*: HPDF_INT16
    missing_width*: HPDF_INT16
    stemh*: HPDF_UINT16
    x_height*: HPDF_UINT16
    cap_height*: HPDF_UINT16 ##   the initial value of descriptor entry is NULL.
                           ##   when first font-object besed on the fontdef object is created,
                           ##   the font-descriptor object is created and descriptor entry is set.
                           ##
    descriptor*: HPDF_Dict
    data*: HPDF_Stream
    valid*: HPDF_BOOL
    attr*: pointer
  HPDF_FontDef* = ptr HPDF_FontDef_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_FontDef_Free*(fontdef: HPDF_FontDef) {.importc.}
proc HPDF_FontDef_Cleanup*(fontdef: HPDF_FontDef) {.importc.}
proc HPDF_FontDef_Validate*(fontdef: HPDF_FontDef): HPDF_BOOL {.importc.}
{.pop.}
## ----------------------------------------------------------------------------
## ----- HPDF_Type1FontDef  ---------------------------------------------------

type
  HPDF_Type1FontDefAttr_Rec* {.bycopy.} = object
    first_char*: HPDF_BYTE     ##  Required
    last_char*: HPDF_BYTE      ##  Required
    widths*: ptr HPDF_CharData  ##  Required
    widths_count*: HPDF_UINT
    leading*: HPDF_INT16
    char_set*: cstring
    encoding_scheme*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    length1*: HPDF_UINT
    length2*: HPDF_UINT
    length3*: HPDF_UINT
    is_base14font*: HPDF_BOOL
    is_fixed_pitch*: HPDF_BOOL
    font_data*: HPDF_Stream
  HPDF_Type1FontDefAttr* = ptr HPDF_Type1FontDefAttr_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Type1FontDef_New*(mmgr: HPDF_MMgr): HPDF_FontDef {.importc.}
proc HPDF_Type1FontDef_Load*(mmgr: HPDF_MMgr; afm: HPDF_Stream;
                            font_data: HPDF_Stream): HPDF_FontDef {.importc.}
proc HPDF_Type1FontDef_Duplicate*(mmgr: HPDF_MMgr; src: HPDF_FontDef): HPDF_FontDef {.importc.}
proc HPDF_Type1FontDef_SetWidths*(fontdef: HPDF_FontDef; widths: ptr HPDF_CharData): HPDF_STATUS {.importc.}
proc HPDF_Type1FontDef_GetWidthByName*(fontdef: HPDF_FontDef; gryph_name: cstring): HPDF_INT16 {.importc.}
proc HPDF_Type1FontDef_GetWidth*(fontdef: HPDF_FontDef; unicode: HPDF_UNICODE): HPDF_INT16 {.importc.}
proc HPDF_Base14FontDef_New*(mmgr: HPDF_MMgr; font_name: cstring): HPDF_FontDef {.importc.}
{.pop.}
## ----------------------------------------------------------------------------
## ----- HPDF_TTFontDef  ------------------------------------------------------

const
  HPDF_TTF_FONT_TAG_LEN* = 6

type
  HPDF_TTFTable* {.bycopy.} = object
    tag*: array[4, char]
    check_sum*: HPDF_UINT32
    offset*: HPDF_UINT32
    length*: HPDF_UINT32

  HPDF_TTF_OffsetTbl* {.bycopy.} = object
    sfnt_version*: HPDF_UINT32
    num_tables*: HPDF_UINT16
    search_range*: HPDF_UINT16
    entry_selector*: HPDF_UINT16
    range_shift*: HPDF_UINT16
    table*: ptr HPDF_TTFTable

  HPDF_TTF_CmapRange* {.bycopy.} = object
    format*: HPDF_UINT16
    length*: HPDF_UINT16
    language*: HPDF_UINT16
    seg_count_x2*: HPDF_UINT16
    search_range*: HPDF_UINT16
    entry_selector*: HPDF_UINT16
    range_shift*: HPDF_UINT16
    end_count*: ptr HPDF_UINT16
    reserved_pad*: HPDF_UINT16
    start_count*: ptr HPDF_UINT16
    id_delta*: ptr HPDF_INT16
    id_range_offset*: ptr HPDF_UINT16
    glyph_id_array*: ptr HPDF_UINT16
    glyph_id_array_count*: HPDF_UINT

  HPDF_TTF_GryphOffsets* {.bycopy.} = object
    base_offset*: HPDF_UINT32
    offsets*: ptr HPDF_UINT32
    flgs*: ptr HPDF_BYTE        ##  0: unused, 1: used

  HPDF_TTF_LongHorMetric* {.bycopy.} = object
    advance_width*: HPDF_UINT16
    lsb*: HPDF_INT16

  HPDF_TTF_FontHeader* {.bycopy.} = object
    version_number*: array[4, HPDF_BYTE]
    font_revision*: HPDF_UINT32
    check_sum_adjustment*: HPDF_UINT32
    magic_number*: HPDF_UINT32
    flags*: HPDF_UINT16
    units_per_em*: HPDF_UINT16
    created*: array[8, HPDF_BYTE]
    modified*: array[8, HPDF_BYTE]
    x_min*: HPDF_INT16
    y_min*: HPDF_INT16
    x_max*: HPDF_INT16
    y_max*: HPDF_INT16
    mac_style*: HPDF_UINT16
    lowest_rec_ppem*: HPDF_UINT16
    font_direction_hint*: HPDF_INT16
    index_to_loc_format*: HPDF_INT16
    glyph_data_format*: HPDF_INT16

  HPDF_TTF_NameRecord* {.bycopy.} = object
    platform_id*: HPDF_UINT16
    encoding_id*: HPDF_UINT16
    language_id*: HPDF_UINT16
    name_id*: HPDF_UINT16
    length*: HPDF_UINT16
    offset*: HPDF_UINT16

  HPDF_TTF_NamingTable* {.bycopy.} = object
    format*: HPDF_UINT16
    count*: HPDF_UINT16
    string_offset*: HPDF_UINT16
    name_records*: ptr HPDF_TTF_NameRecord

  HPDF_TTFontDefAttr_Rec* {.bycopy.} = object
    base_font*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    first_char*: HPDF_BYTE
    last_char*: HPDF_BYTE
    char_set*: cstring
    tag_name*: array[HPDF_TTF_FONT_TAG_LEN + 1, char]
    tag_name2*: array[(HPDF_TTF_FONT_TAG_LEN + 1) * 2, char]
    header*: HPDF_TTF_FontHeader
    glyph_tbl*: HPDF_TTF_GryphOffsets
    num_glyphs*: HPDF_UINT16
    name_tbl*: HPDF_TTF_NamingTable
    h_metric*: ptr HPDF_TTF_LongHorMetric
    num_h_metric*: HPDF_UINT16
    offset_tbl*: HPDF_TTF_OffsetTbl
    cmap*: HPDF_TTF_CmapRange
    fs_type*: HPDF_UINT16
    sfamilyclass*: array[2, HPDF_BYTE]
    panose*: array[10, HPDF_BYTE]
    code_page_range1*: HPDF_UINT32
    code_page_range2*: HPDF_UINT32
    length1*: HPDF_UINT
    embedding*: HPDF_BOOL
    is_cidfont*: HPDF_BOOL
    stream*: HPDF_Stream
  HPDF_TTFontDefAttr* = ptr HPDF_TTFontDefAttr_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_TTFontDef_New*(mmgr: HPDF_MMgr): HPDF_FontDef {.importc.}
proc HPDF_TTFontDef_Load*(mmgr: HPDF_MMgr; stream: HPDF_Stream; embedding: HPDF_BOOL): HPDF_FontDef {.importc.}
proc HPDF_TTFontDef_Load2*(mmgr: HPDF_MMgr; stream: HPDF_Stream; index: HPDF_UINT;
                          embedding: HPDF_BOOL): HPDF_FontDef {.importc.}
proc HPDF_TTFontDef_GetGlyphid*(fontdef: HPDF_FontDef; unicode: HPDF_UINT16): HPDF_UINT16 {.importc.}
proc HPDF_TTFontDef_GetCharWidth*(fontdef: HPDF_FontDef; unicode: HPDF_UINT16): HPDF_INT16 {.importc.}
proc HPDF_TTFontDef_GetGidWidth*(fontdef: HPDF_FontDef; gid: HPDF_UINT16): HPDF_INT16 {.importc.}
proc HPDF_TTFontDef_SaveFontData*(fontdef: HPDF_FontDef; stream: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_TTFontDef_GetCharBBox*(fontdef: HPDF_FontDef; unicode: HPDF_UINT16): HPDF_Box {.importc.}
proc HPDF_TTFontDef_SetTagName*(fontdef: HPDF_FontDef; tag: cstring) {.importc.}
{.pop.}
## ----------------------------------------------------------------------------
## ----- HPDF_CIDFontDef  -----------------------------------------------------

type
  HPDF_CIDFontDefAttr_Rec* {.bycopy.} = object
    widths*: HPDF_List
    DW*: HPDF_INT16
    DW2*: array[2, HPDF_INT16]
  HPDF_CIDFontDefAttr* = ptr HPDF_CIDFontDefAttr_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_CIDFontDef_New*(mmgr: HPDF_MMgr; name: cstring;
                         init_fn: HPDF_FontDef_InitFunc): HPDF_FontDef {.importc.}
proc HPDF_CIDFontDef_AddWidth*(fontdef: HPDF_FontDef; widths: ptr HPDF_CID_Width): HPDF_STATUS {.importc.}
proc HPDF_CIDFontDef_GetCIDWidth*(fontdef: HPDF_FontDef; cid: HPDF_UINT16): HPDF_INT16 {.importc.}
proc HPDF_CIDFontDef_ChangeStyle*(fontdef: HPDF_FontDef; bold: HPDF_BOOL;
                                 italic: HPDF_BOOL): HPDF_STATUS {.importc.}
{.pop.}
