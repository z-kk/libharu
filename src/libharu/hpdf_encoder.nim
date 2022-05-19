##
##  << Haru Free PDF Library >> -- hpdf_encoder.h
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
  hpdf_consts, hpdf_streams, hpdf_types, hpdf_error, hpdf_list, hpdf_mmgr

## -- HPDF_Encoder ---------------------------------------

const
  HPDF_ENCODER_SIG_BYTES* = 0x454E4344

## ----------------------------------------------------------------------------
## ------ predefined font encodings -------------------------------------------

const
  HPDF_ENCODING_FONT_SPECIFIC* = "FontSpecific"
  HPDF_ENCODING_STANDARD* = "StandardEncoding"
  HPDF_ENCODING_MAC_ROMAN* = "MacRomanEncoding"
  HPDF_ENCODING_WIN_ANSI* = "WinAnsiEncoding"
  HPDF_ENCODING_ISO8859_2* = "ISO8859-2"
  HPDF_ENCODING_ISO8859_3* = "ISO8859-3"
  HPDF_ENCODING_ISO8859_4* = "ISO8859-4"
  HPDF_ENCODING_ISO8859_5* = "ISO8859-5"
  HPDF_ENCODING_ISO8859_6* = "ISO8859-6"
  HPDF_ENCODING_ISO8859_7* = "ISO8859-7"
  HPDF_ENCODING_ISO8859_8* = "ISO8859-8"
  HPDF_ENCODING_ISO8859_9* = "ISO8859-9"
  HPDF_ENCODING_ISO8859_10* = "ISO8859-10"
  HPDF_ENCODING_ISO8859_11* = "ISO8859-11"
  HPDF_ENCODING_ISO8859_13* = "ISO8859-13"
  HPDF_ENCODING_ISO8859_14* = "ISO8859-14"
  HPDF_ENCODING_ISO8859_15* = "ISO8859-15"
  HPDF_ENCODING_ISO8859_16* = "ISO8859-16"
  HPDF_ENCODING_CP1250* = "CP1250"
  HPDF_ENCODING_CP1251* = "CP1251"
  HPDF_ENCODING_CP1252* = "CP1252"
  HPDF_ENCODING_CP1253* = "CP1253"
  HPDF_ENCODING_CP1254* = "CP1254"
  HPDF_ENCODING_CP1255* = "CP1255"
  HPDF_ENCODING_CP1256* = "CP1256"
  HPDF_ENCODING_CP1257* = "CP1257"
  HPDF_ENCODING_CP1258* = "CP1258"
  HPDF_ENCODING_KOI8_R* = "KOI8-R"

## ----------------------------------------------------------------------------
## ----- definition for font encoding -----------------------------------------

const
  char_NOTDEF* = ".notdef"

type
  HPDF_EncodingType* = enum
    HPDF_STANDARD_ENCODING = 0, HPDF_MAC_ROMAN_ENCODING, HPDF_WIN_ANSI_ENCODING,
    HPDF_FONT_SPECIFIC, HPDF_ENCODING_EOF
  HPDF_ParseText_Rec* {.bycopy.} = object
    text*: ptr HPDF_BYTE
    index*: HPDF_UINT
    len*: HPDF_UINT
    byte_type*: HPDF_ByteType

  HPDF_Encoder_ByteType_Func* = proc (encoder: HPDF_Encoder;
                                   state: ptr HPDF_ParseText_Rec): HPDF_ByteType
  HPDF_Encoder_ToUnicode_Func* = proc (encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UNICODE
  HPDF_Encoder_EncodeText_Func* = proc (encoder: HPDF_Encoder; text: cstring;
                                     len: HPDF_UINT; encoded_length: ptr HPDF_UINT): cstring
  HPDF_Encoder_Write_Func* = proc (encoder: HPDF_Encoder; `out`: HPDF_Stream): HPDF_STATUS
  HPDF_Encoder_Init_Func* = proc (encoder: HPDF_Encoder): HPDF_STATUS
  HPDF_Encoder_Free_Func* = proc (encoder: HPDF_Encoder)
  HPDF_Encoder_Rec* {.bycopy.} = object
    sig_bytes*: HPDF_UINT32
    name*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    `type`*: HPDF_EncoderType
    byte_type_fn*: HPDF_Encoder_ByteType_Func
    to_unicode_fn*: HPDF_Encoder_ToUnicode_Func
    encode_text_fn*: HPDF_Encoder_EncodeText_Func
    write_fn*: HPDF_Encoder_Write_Func
    free_fn*: HPDF_Encoder_Free_Func
    init_fn*: HPDF_Encoder_Init_Func ##
                                   ##     char                         lang_code[3];
                                   ##     char                         country_code[3];
                                   ##
    attr*: pointer
  HPDF_Encoder* = ptr HPDF_Encoder_Rec

  HPDF_BaseEncodings* = enum
    HPDF_BASE_ENCODING_STANDARD, HPDF_BASE_ENCODING_WIN_ANSI,
    HPDF_BASE_ENCODING_MAC_ROMAN, HPDF_BASE_ENCODING_FONT_SPECIFIC,
    HPDF_BASE_ENCODING_EOF



{.push dynlib: "libhpdf.so".}
proc HPDF_Encoder_Validate*(encoder: HPDF_Encoder): HPDF_STATUS {.importc.}
proc HPDF_Encoder_SetParseText*(encoder: HPDF_Encoder;
                               state: ptr HPDF_ParseText_Rec; text: ptr HPDF_BYTE;
                               len: HPDF_UINT) {.importc.}
proc HPDF_Encoder_ByteType*(encoder: HPDF_Encoder; state: ptr HPDF_ParseText_Rec): HPDF_ByteType {.importc.}
proc HPDF_Encoder_ToUnicode*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UNICODE {.importc.}
proc HPDF_Encoder_Free*(encoder: HPDF_Encoder) {.importc.}
{.pop.}
## -- HPDF_BasicEncoder ----------------------------------

type
  HPDF_BasicEncoderAttr_Rec* {.bycopy.} = object
    base_encoding*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    first_char*: HPDF_BYTE
    last_char*: HPDF_BYTE
    unicode_map*: array[256, HPDF_UNICODE]
    has_differences*: HPDF_BOOL
    differences*: array[256, HPDF_BYTE]
  HPDF_BasicEncoderAttr* = ptr HPDF_BasicEncoderAttr_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_BasicEncoder_New*(mmgr: HPDF_MMgr; encoding_name: cstring): HPDF_Encoder {.importc.}
proc HPDF_BasicEncoder_Free*(encoder: HPDF_Encoder) {.importc.}
proc HPDF_BasicEncoder_Write*(encoder: HPDF_Encoder; `out`: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_BasicEncoder_ToUnicode*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UNICODE {.importc.}
{.pop.}
## -- HPDF_CMapEncoder ----------------------------------

type
  HPDF_CMapEncoder_ByteType_Func* = proc (encoder: HPDF_Encoder; b: HPDF_BYTE): HPDF_BOOL
  HPDF_CidRange_Rec* {.bycopy.} = object
    `from`*: HPDF_UINT16
    to*: HPDF_UINT16
    cid*: HPDF_UINT16

  HPDF_UnicodeMap_Rec* {.bycopy.} = object
    code*: HPDF_UINT16
    unicode*: HPDF_UINT16

  HPDF_CMapEncoderAttr_Rec* {.bycopy.} = object
    unicode_map*: array[256, array[256, HPDF_UNICODE]]
    cid_map*: array[256, array[256, HPDF_UINT16]]
    jww_line_head*: array[HPDF_MAX_JWW_NUM, HPDF_UINT16]
    cmap_range*: HPDF_List
    notdef_range*: HPDF_List
    code_space_range*: HPDF_List
    writing_mode*: HPDF_WritingMode
    registry*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    ordering*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    suppliment*: HPDF_INT
    is_lead_byte_fn*: HPDF_CMapEncoder_ByteType_Func
    is_trial_byte_fn*: HPDF_CMapEncoder_ByteType_Func
    uid_offset*: HPDF_INT
    xuid*: array[3, HPDF_UINT]
  HPDF_CMapEncoderAttr* = ptr HPDF_CMapEncoderAttr_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_CMapEncoder_New*(mmgr: HPDF_MMgr; name: cstring;
                          init_fn: HPDF_Encoder_Init_Func): HPDF_Encoder {.importc.}
proc HPDF_CMapEncoder_InitAttr*(encoder: HPDF_Encoder): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_Free*(encoder: HPDF_Encoder) {.importc.}
proc HPDF_CMapEncoder_Write*(encoder: HPDF_Encoder; `out`: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_ToUnicode*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UNICODE {.importc.}
proc HPDF_CMapEncoder_ToCID*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UINT16 {.importc.}
proc HPDF_CMapEncoder_SetParseText*(encoder: HPDF_Encoder;
                                   state: ptr HPDF_ParseText_Rec;
                                   text: ptr HPDF_BYTE; len: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_ByteType*(encoder: HPDF_Encoder;
                               state: ptr HPDF_ParseText_Rec): HPDF_ByteType {.importc.}
proc HPDF_CMapEncoder_AddCMap*(encoder: HPDF_Encoder; range: ptr HPDF_CidRange_Rec): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_AddNotDefRange*(encoder: HPDF_Encoder;
                                     range: HPDF_CidRange_Rec): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_AddCodeSpaceRange*(encoder: HPDF_Encoder;
                                        range: HPDF_CidRange_Rec): HPDF_STATUS {.importc.}
proc HPDF_CMapEncoder_SetUnicodeArray*(encoder: HPDF_Encoder;
                                      array1: ptr HPDF_UnicodeMap_Rec) {.importc.}
proc HPDF_CMapEncoder_AddJWWLineHead*(encoder: HPDF_Encoder; code: ptr HPDF_UINT16): HPDF_STATUS {.importc.}
proc HPDF_Encoder_CheckJWWLineHead*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_BOOL {.importc.}
## -- utility functions ----------------------------------

proc HPDF_UnicodeToGryphName*(unicode: HPDF_UNICODE): cstring {.importc.}
proc HPDF_GryphNameToUnicode*(gryph_name: cstring): HPDF_UNICODE {.importc.}
{.pop.}
