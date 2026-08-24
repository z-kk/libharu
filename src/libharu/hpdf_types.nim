##
##  << Haru Free PDF Library >> -- hpdf_types.h
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

## ----------------------------------------------------------------------------
## ----- type definition ------------------------------------------------------
include hpdf_lib

##   native OS integer types

type
  HPDF_INT* = cint
  HPDF_UINT* = cuint

  HPDF_INT64* = int64
  HPDF_UINT64* = uint64

##   32bit integer types
##

type
  HPDF_INT32* = cint
  HPDF_UINT32* = cuint

##   16bit integer types
##

type
  HPDF_INT16* = cshort
  HPDF_UINT16* = cushort

##   8bit integer types
##

type
  HPDF_INT8* = cchar
  HPDF_UINT8* = uint8

##   8bit binary types
##

type
  HPDF_BYTE* = uint8

##   float type (32bit IEEE754)
##

type
  HPDF_REAL* = cfloat

##   double type (64bit IEEE754)
##

type
  HPDF_DOUBLE* = cdouble

##   boolean type (0: False, !0: True)
##

type
  HPDF_BOOL* = cint

##   error-no type (32bit unsigned integer)
##

type
  HPDF_STATUS* = culong

##   charactor-code type (16bit)
##

type
  HPDF_CID* = HPDF_UINT16
  HPDF_UNICODE* = HPDF_UINT16

##   HPDF_Point struct
##

type
  HPDF_Point* {.bycopy.} = object
    x*: HPDF_REAL
    y*: HPDF_REAL

  HPDF_Rect* {.bycopy.} = object
    left*: HPDF_REAL
    bottom*: HPDF_REAL
    right*: HPDF_REAL
    top*: HPDF_REAL


##   HPDF_Point3D struct
##

type
  HPDF_Point3D* {.bycopy.} = object
    x*: HPDF_REAL
    y*: HPDF_REAL
    z*: HPDF_REAL

  HPDF_Box* = HPDF_Rect

##  HPDF_Date struct
##

type                          ##  date-time type parameters
  HPDF_Date* {.bycopy.} = object
    year*: HPDF_INT
    month*: HPDF_INT
    day*: HPDF_INT
    hour*: HPDF_INT
    minutes*: HPDF_INT
    seconds*: HPDF_INT
    ind*: char
    off_hour*: HPDF_INT
    off_minutes*: HPDF_INT

  HPDF_InfoType* {.size: sizeof(cint).} = enum
    HPDF_INFO_CREATION_DATE = 0, HPDF_INFO_MOD_DATE, ##  string type parameters
    HPDF_INFO_AUTHOR, HPDF_INFO_CREATOR, HPDF_INFO_PRODUCER, HPDF_INFO_TITLE,
    HPDF_INFO_SUBJECT, HPDF_INFO_KEYWORDS, HPDF_INFO_TRAPPED, HPDF_INFO_GTS_PDFX,
    HPDF_INFO_EOF


##  PDF-A Types

type
  HPDF_PDFAType* {.size: sizeof(cint).} = enum
    HPDF_PDFA_NON_PDFA = -1,
    HPDF_PDFA_1A = 0, HPDF_PDFA_1B, HPDF_PDFA_2A, HPDF_PDFA_2B, HPDF_PDFA_2U,
    HPDF_PDFA_3A, HPDF_PDFA_3B, HPDF_PDFA_3U, HPDF_PDFA_4, HPDF_PDFA_4E,
    HPDF_PDFA_4F
  HPDF_PDFVer* {.size: sizeof(cint).} = enum
    HPDF_VER_12 = 0, HPDF_VER_13, HPDF_VER_14, HPDF_VER_15, HPDF_VER_16, HPDF_VER_17,
    HPDF_VER_20, HPDF_VER_EOF
  HPDF_EncryptMode* {.size: sizeof(cint).} = enum
    HPDF_ENCRYPT_R2 = 2, HPDF_ENCRYPT_R3 = 3
  HPDF_Error_Handler* = proc (error_no: HPDF_STATUS; detail_no: HPDF_STATUS;
                           user_data: pointer) {.hpdfCall.}
  HPDF_Alloc_Func* = proc (size: HPDF_UINT): pointer {.hpdfCall.}
  HPDF_Free_Func* = proc (aptr: pointer) {.hpdfCall.}




## ---------------------------------------------------------------------------
## ------ text width struct --------------------------------------------------

type
  HPDF_TextWidth* {.bycopy.} = object
    numchars*: HPDF_UINT ##  don't use this value (it may be change in the feature).
                       ##        use numspace as alternated.
    numwords*: HPDF_UINT
    width*: HPDF_UINT
    numspace*: HPDF_UINT


## ---------------------------------------------------------------------------
## ------ dash mode ----------------------------------------------------------

type
  HPDF_DashMode* {.bycopy.} = object
    ptn*: array[8, HPDF_REAL]
    num_ptn*: HPDF_UINT
    phase*: HPDF_REAL


## ---------------------------------------------------------------------------
## ----- HPDF_TransMatrix struct ---------------------------------------------

type
  HPDF_TransMatrix* {.bycopy.} = object
    a*: HPDF_REAL
    b*: HPDF_REAL
    c*: HPDF_REAL
    d*: HPDF_REAL
    x*: HPDF_REAL
    y*: HPDF_REAL

  HPDF_3DMatrix* {.bycopy.} = object
    a*, b*, c*, d*, e*, f*, g*, h*, i*: HPDF_REAL
    tx*, ty*, tz*: HPDF_REAL


## ---------------------------------------------------------------------------

type
  HPDF_ColorSpace* {.size: sizeof(cint).} = enum
    HPDF_CS_DEVICE_GRAY = 0, HPDF_CS_DEVICE_RGB, HPDF_CS_DEVICE_CMYK,
    HPDF_CS_CAL_GRAY, HPDF_CS_CAL_RGB, HPDF_CS_LAB, HPDF_CS_ICC_BASED,
    HPDF_CS_SEPARATION, HPDF_CS_DEVICE_N, HPDF_CS_INDEXED, HPDF_CS_PATTERN,
    HPDF_CS_EOF


## ---------------------------------------------------------------------------
## ----- HPDF_RGBColor struct ------------------------------------------------

type
  HPDF_RGBColor* {.bycopy.} = object
    r*: HPDF_REAL
    g*: HPDF_REAL
    b*: HPDF_REAL


## ---------------------------------------------------------------------------
## ----- HPDF_CMYKColor struct -----------------------------------------------

type
  HPDF_CMYKColor* {.bycopy.} = object
    c*: HPDF_REAL
    m*: HPDF_REAL
    y*: HPDF_REAL
    k*: HPDF_REAL


## ---------------------------------------------------------------------------
## ------ The line cap style -------------------------------------------------

type
  HPDF_LineCap* {.size: sizeof(cint).} = enum
    HPDF_BUTT_END = 0, HPDF_ROUND_END, HPDF_PROJECTING_SQUARE_END,
    HPDF_LINECAP_EOF

const
  HPDF_PROJECTING_SCUARE_END* {.deprecated: "use HPDF_PROJECTING_SQUARE_END".} =
    HPDF_PROJECTING_SQUARE_END


## ----------------------------------------------------------------------------
## ------ The line join style -------------------------------------------------

type
  HPDF_LineJoin* {.size: sizeof(cint).} = enum
    HPDF_MITER_JOIN = 0, HPDF_ROUND_JOIN, HPDF_BEVEL_JOIN, HPDF_LINEJOIN_EOF


## ----------------------------------------------------------------------------
## ------ The text rendering mode ---------------------------------------------

type
  HPDF_TextRenderingMode* {.size: sizeof(cint).} = enum
    HPDF_FILL = 0, HPDF_STROKE, HPDF_FILL_THEN_STROKE, HPDF_INVISIBLE,
    HPDF_FILL_CLIPPING, HPDF_STROKE_CLIPPING, HPDF_FILL_STROKE_CLIPPING,
    HPDF_CLIPPING, HPDF_RENDERING_MODE_EOF
  HPDF_WritingMode* {.size: sizeof(cint).} = enum
    HPDF_WMODE_HORIZONTAL = 0, HPDF_WMODE_VERTICAL, HPDF_WMODE_EOF
  HPDF_PageLayout* {.size: sizeof(cint).} = enum
    HPDF_PAGE_LAYOUT_SINGLE = 0, HPDF_PAGE_LAYOUT_ONE_COLUMN,
    HPDF_PAGE_LAYOUT_TWO_COLUMN_LEFT, HPDF_PAGE_LAYOUT_TWO_COLUMN_RIGHT,
    HPDF_PAGE_LAYOUT_TWO_PAGE_LEFT, HPDF_PAGE_LAYOUT_TWO_PAGE_RIGHT,
    HPDF_PAGE_LAYOUT_EOF
  HPDF_PageMode* {.size: sizeof(cint).} = enum
    HPDF_PAGE_MODE_USE_NONE = 0, HPDF_PAGE_MODE_USE_OUTLINE,
    HPDF_PAGE_MODE_USE_THUMBS, HPDF_PAGE_MODE_FULL_SCREEN, ##   HPDF_PAGE_MODE_USE_OC,
                                                         ##
                                                         ## HPDF_PAGE_MODE_USE_ATTACHMENTS,
                                                         ##
    HPDF_PAGE_MODE_EOF
  HPDF_PageNumStyle* {.size: sizeof(cint).} = enum
    HPDF_PAGE_NUM_STYLE_DECIMAL = 0, HPDF_PAGE_NUM_STYLE_UPPER_ROMAN,
    HPDF_PAGE_NUM_STYLE_LOWER_ROMAN, HPDF_PAGE_NUM_STYLE_UPPER_LETTERS,
    HPDF_PAGE_NUM_STYLE_LOWER_LETTERS, HPDF_PAGE_NUM_STYLE_EOF
  HPDF_DestinationType* {.size: sizeof(cint).} = enum
    HPDF_XYZ = 0, HPDF_FIT, HPDF_FIT_H, HPDF_FIT_V, HPDF_FIT_R, HPDF_FIT_B, HPDF_FIT_BH,
    HPDF_FIT_BV, HPDF_DST_EOF
  HPDF_AnnotType* {.size: sizeof(cint).} = enum
    HPDF_ANNOT_TEXT_NOTES, HPDF_ANNOT_LINK, HPDF_ANNOT_SOUND, HPDF_ANNOT_FREE_TEXT,
    HPDF_ANNOT_STAMP, HPDF_ANNOT_SQUARE, HPDF_ANNOT_CIRCLE, HPDF_ANNOT_STRIKE_OUT,
    HPDF_ANNOT_HIGHTLIGHT, HPDF_ANNOT_UNDERLINE, HPDF_ANNOT_INK,
    HPDF_ANNOT_FILE_ATTACHMENT, HPDF_ANNOT_POPUP, HPDF_ANNOT_3D,
    HPDF_ANNOT_SQUIGGLY, HPDF_ANNOT_LINE, HPDF_ANNOT_PROJECTION,
    HPDF_ANNOT_WIDGET
  HPDF_AnnotFlgs* {.size: sizeof(cint).} = enum
    HPDF_ANNOT_INVISIBLE, HPDF_ANNOT_HIDDEN, HPDF_ANNOT_PRINT, HPDF_ANNOT_NOZOOM,
    HPDF_ANNOT_NOROTATE, HPDF_ANNOT_NOVIEW, HPDF_ANNOT_READONLY
  HPDF_AnnotHighlightMode* {.size: sizeof(cint).} = enum
    HPDF_ANNOT_NO_HIGHTLIGHT = 0, HPDF_ANNOT_INVERT_BOX, HPDF_ANNOT_INVERT_BORDER,
    HPDF_ANNOT_DOWN_APPEARANCE, HPDF_ANNOT_HIGHTLIGHT_MODE_EOF
  HPDF_AnnotIcon* {.size: sizeof(cint).} = enum
    HPDF_ANNOT_ICON_COMMENT = 0, HPDF_ANNOT_ICON_KEY, HPDF_ANNOT_ICON_NOTE,
    HPDF_ANNOT_ICON_HELP, HPDF_ANNOT_ICON_NEW_PARAGRAPH,
    HPDF_ANNOT_ICON_PARAGRAPH, HPDF_ANNOT_ICON_INSERT, HPDF_ANNOT_ICON_EOF
  HPDF_AnnotIntent* {.size: sizeof(cint).} = enum
    HPDF_ANNOT_INTENT_FREETEXTCALLOUT = 0, HPDF_ANNOT_INTENT_FREETEXTTYPEWRITER,
    HPDF_ANNOT_INTENT_LINEARROW, HPDF_ANNOT_INTENT_LINEDIMENSION,
    HPDF_ANNOT_INTENT_POLYGONCLOUD, HPDF_ANNOT_INTENT_POLYLINEDIMENSION,
    HPDF_ANNOT_INTENT_POLYGONDIMENSION
  HPDF_LineAnnotEndingStyle* {.size: sizeof(cint).} = enum
    HPDF_LINE_ANNOT_NONE = 0, HPDF_LINE_ANNOT_SQUARE, HPDF_LINE_ANNOT_CIRCLE,
    HPDF_LINE_ANNOT_DIAMOND, HPDF_LINE_ANNOT_OPENARROW,
    HPDF_LINE_ANNOT_CLOSEDARROW, HPDF_LINE_ANNOT_BUTT, HPDF_LINE_ANNOT_ROPENARROW,
    HPDF_LINE_ANNOT_RCLOSEDARROW, HPDF_LINE_ANNOT_SLASH
  HPDF_LineAnnotCapPosition* {.size: sizeof(cint).} = enum
    HPDF_LINE_ANNOT_CAP_INLINE = 0, HPDF_LINE_ANNOT_CAP_TOP
  HPDF_StampAnnotName* {.size: sizeof(cint).} = enum
    HPDF_STAMP_ANNOT_APPROVED = 0, HPDF_STAMP_ANNOT_EXPERIMENTAL,
    HPDF_STAMP_ANNOT_NOTAPPROVED, HPDF_STAMP_ANNOT_ASIS, HPDF_STAMP_ANNOT_EXPIRED,
    HPDF_STAMP_ANNOT_NOTFORPUBLICRELEASE, HPDF_STAMP_ANNOT_CONFIDENTIAL,
    HPDF_STAMP_ANNOT_FINAL, HPDF_STAMP_ANNOT_SOLD, HPDF_STAMP_ANNOT_DEPARTMENTAL,
    HPDF_STAMP_ANNOT_FORCOMMENT, HPDF_STAMP_ANNOT_TOPSECRET,
    HPDF_STAMP_ANNOT_DRAFT, HPDF_STAMP_ANNOT_FORPUBLICRELEASE















## ----------------------------------------------------------------------------
## ------ border stype --------------------------------------------------------

type
  HPDF_BSSubtype* {.size: sizeof(cint).} = enum
    HPDF_BS_SOLID, HPDF_BS_DASHED, HPDF_BS_BEVELED, HPDF_BS_INSET,
    HPDF_BS_UNDERLINED


## ----- blend modes ----------------------------------------------------------

type
  HPDF_BlendMode* {.size: sizeof(cint).} = enum
    HPDF_BM_NORMAL, HPDF_BM_MULTIPLY, HPDF_BM_SCREEN, HPDF_BM_OVERLAY,
    HPDF_BM_DARKEN, HPDF_BM_LIGHTEN, HPDF_BM_COLOR_DODGE, HPDF_BM_COLOR_BUM,
    HPDF_BM_HARD_LIGHT, HPDF_BM_SOFT_LIGHT, HPDF_BM_DIFFERENCE, HPDF_BM_EXCLUSHON,
    HPDF_BM_EOF


## ----- slide show -----------------------------------------------------------

type
  HPDF_TransitionStyle* {.size: sizeof(cint).} = enum
    HPDF_TS_WIPE_RIGHT = 0, HPDF_TS_WIPE_UP, HPDF_TS_WIPE_LEFT, HPDF_TS_WIPE_DOWN,
    HPDF_TS_BARN_DOORS_HORIZONTAL_OUT, HPDF_TS_BARN_DOORS_HORIZONTAL_IN,
    HPDF_TS_BARN_DOORS_VERTICAL_OUT, HPDF_TS_BARN_DOORS_VERTICAL_IN,
    HPDF_TS_BOX_OUT, HPDF_TS_BOX_IN, HPDF_TS_BLINDS_HORIZONTAL,
    HPDF_TS_BLINDS_VERTICAL, HPDF_TS_DISSOLVE, HPDF_TS_GLITTER_RIGHT,
    HPDF_TS_GLITTER_DOWN, HPDF_TS_GLITTER_TOP_LEFT_TO_BOTTOM_RIGHT,
    HPDF_TS_REPLACE, HPDF_TS_EOF


## ----------------------------------------------------------------------------

type
  HPDF_PageSizes* {.size: sizeof(cint).} = enum
    HPDF_PAGE_SIZE_LETTER = 0, HPDF_PAGE_SIZE_LEGAL, HPDF_PAGE_SIZE_A3,
    HPDF_PAGE_SIZE_A4, HPDF_PAGE_SIZE_A5, HPDF_PAGE_SIZE_B4, HPDF_PAGE_SIZE_B5,
    HPDF_PAGE_SIZE_EXECUTIVE, HPDF_PAGE_SIZE_US4x6, HPDF_PAGE_SIZE_US4x8,
    HPDF_PAGE_SIZE_US5x7, HPDF_PAGE_SIZE_COMM10, HPDF_PAGE_SIZE_EOF
  HPDF_PageDirection* {.size: sizeof(cint).} = enum
    HPDF_PAGE_PORTRAIT = 0, HPDF_PAGE_LANDSCAPE
  HPDF_EncoderType* {.size: sizeof(cint).} = enum
    HPDF_ENCODER_TYPE_SINGLE_BYTE, HPDF_ENCODER_TYPE_DOUBLE_BYTE,
    HPDF_ENCODER_TYPE_UNINITIALIZED, HPDF_ENCODER_UNKNOWN
  HPDF_ByteType* {.size: sizeof(cint).} = enum
    HPDF_BYTE_TYPE_SINGLE = 0, HPDF_BYTE_TYPE_LEAD, HPDF_BYTE_TYPE_TRAIL,
    HPDF_BYTE_TYPE_UNKNOWN
  HPDF_TextAlignment* {.size: sizeof(cint).} = enum
    HPDF_TALIGN_LEFT = 0, HPDF_TALIGN_RIGHT, HPDF_TALIGN_CENTER, HPDF_TALIGN_JUSTIFY

const
  HPDF_BYTE_TYPE_TRIAL* {.deprecated: "use HPDF_BYTE_TYPE_TRAIL".} =
    HPDF_BYTE_TYPE_TRAIL






## ----------------------------------------------------------------------------
##  Name Dictionary values -- see PDF reference section 7.7.4

type
  HPDF_NameDictKey* {.size: sizeof(cint).} = enum
    HPDF_NAME_EMBEDDED_FILES = 0, ##  TODO the rest
    HPDF_NAME_EOF

  HPDF_AFRelationship* {.size: sizeof(cint).} = enum
    HPDF_AFRELATIONSHIP_SOURCE = 0, HPDF_AFRELATIONSHIP_DATA,
    HPDF_AFRELATIONSHIP_ALTERNATIVE, HPDF_AFRELATIONSHIP_SUPPLEMENT,
    HPDF_AFRELATIONSHIP_ENCRYPTEDPAYLOAD, HPDF_AFRELATIONSHIP_FORMDATA,
    HPDF_AFRELATIONSHIP_SCHEMA, HPDF_AFRELATIONSHIP_UNSPECIFIED

  HPDF_PageBoundary* {.size: sizeof(cint).} = enum
    HPDF_PAGE_MEDIABOX = 0, HPDF_PAGE_CROPBOX, HPDF_PAGE_BLEEDBOX,
    HPDF_PAGE_TRIMBOX, HPDF_PAGE_ARTBOX

  HPDF_ShadingType* {.size: sizeof(cint).} = enum
    HPDF_SHADING_FREE_FORM_TRIANGLE_MESH = 4

  HPDF_Shading_FreeFormTriangleMeshEdgeFlag* {.size: sizeof(cint).} = enum
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_NO_CONNECTION = 0,
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_BC,
    HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_AC
