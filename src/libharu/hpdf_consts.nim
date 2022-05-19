##
##  << Haru Free PDF Library >> -- hpdf_consts.h
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
  hpdf_types

## ----------------------------------------------------------------------------

const
  HPDF_TRUE* = 1
  HPDF_FALSE* = 0
  HPDF_OK* = 0
  HPDF_NOERROR* = 0

## ----- default values -------------------------------------------------------
##  buffer size which is required when we convert to character string.

const
  HPDF_TMP_BUF_SIZ* = 512
  HPDF_SHORT_BUF_SIZ* = 32
  HPDF_REAL_LEN* = 11
  HPDF_INT_LEN* = 11
  HPDF_TEXT_DEFAULT_LEN* = 256
  HPDF_UNICODE_HEADER_LEN* = 2
  HPDF_DATE_TIME_STR_LEN* = 23

##  length of each item defined in PDF

const
  HPDF_BYTE_OFFSET_LEN* = 10
  HPDF_OBJ_ID_LEN* = 7
  HPDF_GEN_NO_LEN* = 5

##  default value of Graphic State

const
  HPDF_DEF_FONT* = "Helvetica"
  HPDF_DEF_PAGE_LAYOUT* = HPDF_PAGE_LAYOUT_SINGLE
  HPDF_DEF_PAGE_MODE* = HPDF_PAGE_MODE_USE_NONE
  HPDF_DEF_WORDSPACE* = 0
  HPDF_DEF_CHARSPACE* = 0
  HPDF_DEF_FONTSIZE* = 10
  HPDF_DEF_HSCALING* = 100
  HPDF_DEF_LEADING* = 0
  HPDF_DEF_RENDERING_MODE* = HPDF_FILL
  HPDF_DEF_RISE* = 0
  HPDF_DEF_RAISE* = HPDF_DEF_RISE
  HPDF_DEF_LINEWIDTH* = 1
  HPDF_DEF_LINECAP* = HPDF_BUTT_END
  HPDF_DEF_LINEJOIN* = HPDF_MITER_JOIN
  HPDF_DEF_MITERLIMIT* = 10
  HPDF_DEF_FLATNESS* = 1
  HPDF_DEF_PAGE_NUM* = 1
  HPDF_BS_DEF_WIDTH* = 1

##  defalt page-size

const
  HPDF_DEF_PAGE_WIDTH* = 595.276F
  HPDF_DEF_PAGE_HEIGHT* = 841.89F

## ---------------------------------------------------------------------------
## ----- compression mode ----------------------------------------------------

const
  HPDF_COMP_NONE* = 0x00
  HPDF_COMP_TEXT* = 0x01
  HPDF_COMP_IMAGE* = 0x02
  HPDF_COMP_METADATA* = 0x04
  HPDF_COMP_ALL* = 0x0F

##  #define  HPDF_COMP_BEST_COMPRESS   0x10
##  #define  HPDF_COMP_BEST_SPEED      0x20
##

const
  HPDF_COMP_MASK* = 0xFF

## ----------------------------------------------------------------------------
## ----- permission flags (only Revision 2 is supported)-----------------------

const
  HPDF_ENABLE_READ* = 0
  HPDF_ENABLE_PRINT* = 4
  HPDF_ENABLE_EDIT_ALL* = 8
  HPDF_ENABLE_COPY* = 16
  HPDF_ENABLE_EDIT* = 32

## ----------------------------------------------------------------------------
## ------ viewer preferences definitions --------------------------------------

const
  HPDF_HIDE_TOOLBAR* = 1
  HPDF_HIDE_MENUBAR* = 2
  HPDF_HIDE_WINDOW_UI* = 4
  HPDF_FIT_WINDOW* = 8
  HPDF_CENTER_WINDOW* = 16
  HPDF_PRINT_SCALING_NONE* = 32

## ---------------------------------------------------------------------------
## ------ limitation of object implementation (PDF1.4) -----------------------

const
  HPDF_LIMIT_MAX_INT* = 2147483647
  HPDF_LIMIT_MIN_INT* = -2147483647
  HPDF_LIMIT_MAX_REAL* = 32767
  HPDF_LIMIT_MIN_REAL* = -32767
  HPDF_LIMIT_MAX_STRING_LEN* = 65535
  HPDF_LIMIT_MAX_NAME_LEN* = 127
  HPDF_LIMIT_MAX_ARRAY* = 32767
  HPDF_LIMIT_MAX_DICT_ELEMENT* = 4095
  HPDF_LIMIT_MAX_XREF_ELEMENT* = 8388607
  HPDF_LIMIT_MAX_GSTATE* = 28
  HPDF_LIMIT_MAX_DEVICE_N* = 8
  HPDF_LIMIT_MAX_DEVICE_N_V15* = 32
  HPDF_LIMIT_MAX_CID* = 65535
  HPDF_MAX_GENERATION_NUM* = 65535
  HPDF_MIN_PAGE_HEIGHT* = 3
  HPDF_MIN_PAGE_WIDTH* = 3
  HPDF_MAX_PAGE_HEIGHT* = 14400
  HPDF_MAX_PAGE_WIDTH* = 14400
  HPDF_MIN_MAGNIFICATION_FACTOR* = 8
  HPDF_MAX_MAGNIFICATION_FACTOR* = 3200

## ---------------------------------------------------------------------------
## ------ limitation of various properties -----------------------------------

const
  HPDF_MIN_PAGE_SIZE* = 3
  HPDF_MAX_PAGE_SIZE* = 14400
  HPDF_MIN_HORIZONTALSCALING* = 10
  HPDF_MAX_HORIZONTALSCALING* = 300
  HPDF_MIN_WORDSPACE* = -30
  HPDF_MAX_WORDSPACE* = 300
  HPDF_MIN_CHARSPACE* = -30
  HPDF_MAX_CHARSPACE* = 300
  HPDF_MAX_FONTSIZE* = 600
  HPDF_MAX_ZOOMSIZE* = 10
  HPDF_MAX_LEADING* = 300
  HPDF_MAX_LINEWIDTH* = 100
  HPDF_MAX_DASH_PATTERN* = 100
  HPDF_MAX_JWW_NUM* = 128

## ----------------------------------------------------------------------------
## ----- country code definition ----------------------------------------------

const
  HPDF_COUNTRY_AF* = "AF"
  HPDF_COUNTRY_AL* = "AL"
  HPDF_COUNTRY_DZ* = "DZ"
  HPDF_COUNTRY_AS* = "AS"
  HPDF_COUNTRY_AD* = "AD"
  HPDF_COUNTRY_AO* = "AO"
  HPDF_COUNTRY_AI* = "AI"
  HPDF_COUNTRY_AQ* = "AQ"
  HPDF_COUNTRY_AG* = "AG"
  HPDF_COUNTRY_AR* = "AR"
  HPDF_COUNTRY_AM* = "AM"
  HPDF_COUNTRY_AW* = "AW"
  HPDF_COUNTRY_AU* = "AU"
  HPDF_COUNTRY_AT* = "AT"
  HPDF_COUNTRY_AZ* = "AZ"
  HPDF_COUNTRY_BS* = "BS"
  HPDF_COUNTRY_BH* = "BH"
  HPDF_COUNTRY_BD* = "BD"
  HPDF_COUNTRY_BB* = "BB"
  HPDF_COUNTRY_BY* = "BY"
  HPDF_COUNTRY_BE* = "BE"
  HPDF_COUNTRY_BZ* = "BZ"
  HPDF_COUNTRY_BJ* = "BJ"
  HPDF_COUNTRY_BM* = "BM"
  HPDF_COUNTRY_BT* = "BT"
  HPDF_COUNTRY_BO* = "BO"
  HPDF_COUNTRY_BA* = "BA"
  HPDF_COUNTRY_BW* = "BW"
  HPDF_COUNTRY_BV* = "BV"
  HPDF_COUNTRY_BR* = "BR"
  HPDF_COUNTRY_IO* = "IO"
  HPDF_COUNTRY_BN* = "BN"
  HPDF_COUNTRY_BG* = "BG"
  HPDF_COUNTRY_BF* = "BF"
  HPDF_COUNTRY_BI* = "BI"
  HPDF_COUNTRY_KH* = "KH"
  HPDF_COUNTRY_CM* = "CM"
  HPDF_COUNTRY_CA* = "CA"
  HPDF_COUNTRY_CV* = "CV"
  HPDF_COUNTRY_KY* = "KY"
  HPDF_COUNTRY_CF* = "CF"
  HPDF_COUNTRY_TD* = "TD"
  HPDF_COUNTRY_CL* = "CL"
  HPDF_COUNTRY_CN* = "CN"
  HPDF_COUNTRY_CX* = "CX"
  HPDF_COUNTRY_CC* = "CC"
  HPDF_COUNTRY_CO* = "CO"
  HPDF_COUNTRY_KM* = "KM"
  HPDF_COUNTRY_CG* = "CG"
  HPDF_COUNTRY_CK* = "CK"
  HPDF_COUNTRY_CR* = "CR"
  HPDF_COUNTRY_CI* = "CI"
  HPDF_COUNTRY_HR* = "HR"
  HPDF_COUNTRY_CU* = "CU"
  HPDF_COUNTRY_CY* = "CY"
  HPDF_COUNTRY_CZ* = "CZ"
  HPDF_COUNTRY_DK* = "DK"
  HPDF_COUNTRY_DJ* = "DJ"
  HPDF_COUNTRY_DM* = "DM"
  HPDF_COUNTRY_DO* = "DO"
  HPDF_COUNTRY_TP* = "TP"
  HPDF_COUNTRY_EC* = "EC"
  HPDF_COUNTRY_EG* = "EG"
  HPDF_COUNTRY_SV* = "SV"
  HPDF_COUNTRY_GQ* = "GQ"
  HPDF_COUNTRY_ER* = "ER"
  HPDF_COUNTRY_EE* = "EE"
  HPDF_COUNTRY_ET* = "ET"
  HPDF_COUNTRY_FK* = "FK"
  HPDF_COUNTRY_FO* = "FO"
  HPDF_COUNTRY_FJ* = "FJ"
  HPDF_COUNTRY_FI* = "FI"
  HPDF_COUNTRY_FR* = "FR"
  HPDF_COUNTRY_FX* = "FX"
  HPDF_COUNTRY_GF* = "GF"
  HPDF_COUNTRY_PF* = "PF"
  HPDF_COUNTRY_TF* = "TF"
  HPDF_COUNTRY_GA* = "GA"
  HPDF_COUNTRY_GM* = "GM"
  HPDF_COUNTRY_GE* = "GE"
  HPDF_COUNTRY_DE* = "DE"
  HPDF_COUNTRY_GH* = "GH"
  HPDF_COUNTRY_GI* = "GI"
  HPDF_COUNTRY_GR* = "GR"
  HPDF_COUNTRY_GL* = "GL"
  HPDF_COUNTRY_GD* = "GD"
  HPDF_COUNTRY_GP* = "GP"
  HPDF_COUNTRY_GU* = "GU"
  HPDF_COUNTRY_GT* = "GT"
  HPDF_COUNTRY_GN* = "GN"
  HPDF_COUNTRY_GW* = "GW"
  HPDF_COUNTRY_GY* = "GY"
  HPDF_COUNTRY_HT* = "HT"
  HPDF_COUNTRY_HM* = "HM"
  HPDF_COUNTRY_HN* = "HN"
  HPDF_COUNTRY_HK* = "HK"
  HPDF_COUNTRY_HU* = "HU"
  HPDF_COUNTRY_IS* = "IS"
  HPDF_COUNTRY_IN* = "IN"
  HPDF_COUNTRY_ID* = "ID"
  HPDF_COUNTRY_IR* = "IR"
  HPDF_COUNTRY_IQ* = "IQ"
  HPDF_COUNTRY_IE* = "IE"
  HPDF_COUNTRY_IL* = "IL"
  HPDF_COUNTRY_IT* = "IT"
  HPDF_COUNTRY_JM* = "JM"
  HPDF_COUNTRY_JP* = "JP"
  HPDF_COUNTRY_JO* = "JO"
  HPDF_COUNTRY_KZ* = "KZ"
  HPDF_COUNTRY_KE* = "KE"
  HPDF_COUNTRY_KI* = "KI"
  HPDF_COUNTRY_KP* = "KP"
  HPDF_COUNTRY_KR* = "KR"
  HPDF_COUNTRY_KW* = "KW"
  HPDF_COUNTRY_KG* = "KG"
  HPDF_COUNTRY_LA* = "LA"
  HPDF_COUNTRY_LV* = "LV"
  HPDF_COUNTRY_LB* = "LB"
  HPDF_COUNTRY_LS* = "LS"
  HPDF_COUNTRY_LR* = "LR"
  HPDF_COUNTRY_LY* = "LY"
  HPDF_COUNTRY_LI* = "LI"
  HPDF_COUNTRY_LT* = "LT"
  HPDF_COUNTRY_LU* = "LU"
  HPDF_COUNTRY_MO* = "MO"
  HPDF_COUNTRY_MK* = "MK"
  HPDF_COUNTRY_MG* = "MG"
  HPDF_COUNTRY_MW* = "MW"
  HPDF_COUNTRY_MY* = "MY"
  HPDF_COUNTRY_MV* = "MV"
  HPDF_COUNTRY_ML* = "ML"
  HPDF_COUNTRY_MT* = "MT"
  HPDF_COUNTRY_MH* = "MH"
  HPDF_COUNTRY_MQ* = "MQ"
  HPDF_COUNTRY_MR* = "MR"
  HPDF_COUNTRY_MU* = "MU"
  HPDF_COUNTRY_YT* = "YT"
  HPDF_COUNTRY_MX* = "MX"
  HPDF_COUNTRY_FM* = "FM"
  HPDF_COUNTRY_MD* = "MD"
  HPDF_COUNTRY_MC* = "MC"
  HPDF_COUNTRY_MN* = "MN"
  HPDF_COUNTRY_MS* = "MS"
  HPDF_COUNTRY_MA* = "MA"
  HPDF_COUNTRY_MZ* = "MZ"
  HPDF_COUNTRY_MM* = "MM"
  HPDF_COUNTRY_NA* = "NA"
  HPDF_COUNTRY_NR* = "NR"
  HPDF_COUNTRY_NP* = "NP"
  HPDF_COUNTRY_NL* = "NL"
  HPDF_COUNTRY_AN* = "AN"
  HPDF_COUNTRY_NC* = "NC"
  HPDF_COUNTRY_NZ* = "NZ"
  HPDF_COUNTRY_NI* = "NI"
  HPDF_COUNTRY_NE* = "NE"
  HPDF_COUNTRY_NG* = "NG"
  HPDF_COUNTRY_NU* = "NU"
  HPDF_COUNTRY_NF* = "NF"
  HPDF_COUNTRY_MP* = "MP"
  HPDF_COUNTRY_NO* = "NO"
  HPDF_COUNTRY_OM* = "OM"
  HPDF_COUNTRY_PK* = "PK"
  HPDF_COUNTRY_PW* = "PW"
  HPDF_COUNTRY_PA* = "PA"
  HPDF_COUNTRY_PG* = "PG"
  HPDF_COUNTRY_PY* = "PY"
  HPDF_COUNTRY_PE* = "PE"
  HPDF_COUNTRY_PH* = "PH"
  HPDF_COUNTRY_PN* = "PN"
  HPDF_COUNTRY_PL* = "PL"
  HPDF_COUNTRY_PT* = "PT"
  HPDF_COUNTRY_PR* = "PR"
  HPDF_COUNTRY_QA* = "QA"
  HPDF_COUNTRY_RE* = "RE"
  HPDF_COUNTRY_RO* = "RO"
  HPDF_COUNTRY_RU* = "RU"
  HPDF_COUNTRY_RW* = "RW"
  HPDF_COUNTRY_KN* = "KN"
  HPDF_COUNTRY_LC* = "LC"
  HPDF_COUNTRY_VC* = "VC"
  HPDF_COUNTRY_WS* = "WS"
  HPDF_COUNTRY_SM* = "SM"
  HPDF_COUNTRY_ST* = "ST"
  HPDF_COUNTRY_SA* = "SA"
  HPDF_COUNTRY_SN* = "SN"
  HPDF_COUNTRY_SC* = "SC"
  HPDF_COUNTRY_SL* = "SL"
  HPDF_COUNTRY_SG* = "SG"
  HPDF_COUNTRY_SK* = "SK"
  HPDF_COUNTRY_SI* = "SI"
  HPDF_COUNTRY_SB* = "SB"
  HPDF_COUNTRY_SO* = "SO"
  HPDF_COUNTRY_ZA* = "ZA"
  HPDF_COUNTRY_ES* = "ES"
  HPDF_COUNTRY_LK* = "LK"
  HPDF_COUNTRY_SH* = "SH"
  HPDF_COUNTRY_PM* = "PM"
  HPDF_COUNTRY_SD* = "SD"
  HPDF_COUNTRY_SR* = "SR"
  HPDF_COUNTRY_SJ* = "SJ"
  HPDF_COUNTRY_SZ* = "SZ"
  HPDF_COUNTRY_SE* = "SE"
  HPDF_COUNTRY_CH* = "CH"
  HPDF_COUNTRY_SY* = "SY"
  HPDF_COUNTRY_TW* = "TW"
  HPDF_COUNTRY_TJ* = "TJ"
  HPDF_COUNTRY_TZ* = "TZ"
  HPDF_COUNTRY_TH* = "TH"
  HPDF_COUNTRY_TG* = "TG"
  HPDF_COUNTRY_TK* = "TK"
  HPDF_COUNTRY_TO* = "TO"
  HPDF_COUNTRY_TT* = "TT"
  HPDF_COUNTRY_TN* = "TN"
  HPDF_COUNTRY_TR* = "TR"
  HPDF_COUNTRY_TM* = "TM"
  HPDF_COUNTRY_TC* = "TC"
  HPDF_COUNTRY_TV* = "TV"
  HPDF_COUNTRY_UG* = "UG"
  HPDF_COUNTRY_UA* = "UA"
  HPDF_COUNTRY_AE* = "AE"
  HPDF_COUNTRY_GB* = "GB"
  HPDF_COUNTRY_US* = "US"
  HPDF_COUNTRY_UM* = "UM"
  HPDF_COUNTRY_UY* = "UY"
  HPDF_COUNTRY_UZ* = "UZ"
  HPDF_COUNTRY_VU* = "VU"
  HPDF_COUNTRY_VA* = "VA"
  HPDF_COUNTRY_VE* = "VE"
  HPDF_COUNTRY_VN* = "VN"
  HPDF_COUNTRY_VG* = "VG"
  HPDF_COUNTRY_VI* = "VI"
  HPDF_COUNTRY_WF* = "WF"
  HPDF_COUNTRY_EH* = "EH"
  HPDF_COUNTRY_YE* = "YE"
  HPDF_COUNTRY_YU* = "YU"
  HPDF_COUNTRY_ZR* = "ZR"
  HPDF_COUNTRY_ZM* = "ZM"
  HPDF_COUNTRY_ZW* = "ZW"

## ----------------------------------------------------------------------------
## ----- lang code definition -------------------------------------------------

const
  HPDF_LANG_AA* = "aa"
  HPDF_LANG_AB* = "ab"
  HPDF_LANG_AF* = "af"
  HPDF_LANG_AM* = "am"
  HPDF_LANG_AR* = "ar"
  HPDF_LANG_AS* = "as"
  HPDF_LANG_AY* = "ay"
  HPDF_LANG_AZ* = "az"
  HPDF_LANG_BA* = "ba"
  HPDF_LANG_BE* = "be"
  HPDF_LANG_BG* = "bg"
  HPDF_LANG_BH* = "bh"
  HPDF_LANG_BI* = "bi"
  HPDF_LANG_BN* = "bn"
  HPDF_LANG_BO* = "bo"
  HPDF_LANG_BR* = "br"
  HPDF_LANG_CA* = "ca"
  HPDF_LANG_CO* = "co"
  HPDF_LANG_CS* = "cs"
  HPDF_LANG_CY* = "cy"
  HPDF_LANG_DA* = "da"
  HPDF_LANG_DE* = "de"
  HPDF_LANG_DZ* = "dz"
  HPDF_LANG_EL* = "el"
  HPDF_LANG_EN* = "en"
  HPDF_LANG_EO* = "eo"
  HPDF_LANG_ES* = "es"
  HPDF_LANG_ET* = "et"
  HPDF_LANG_EU* = "eu"
  HPDF_LANG_FA* = "fa"
  HPDF_LANG_FI* = "fi"
  HPDF_LANG_FJ* = "fj"
  HPDF_LANG_FO* = "fo"
  HPDF_LANG_FR* = "fr"
  HPDF_LANG_FY* = "fy"
  HPDF_LANG_GA* = "ga"
  HPDF_LANG_GD* = "gd"
  HPDF_LANG_GL* = "gl"
  HPDF_LANG_GN* = "gn"
  HPDF_LANG_GU* = "gu"
  HPDF_LANG_HA* = "ha"
  HPDF_LANG_HI* = "hi"
  HPDF_LANG_HR* = "hr"
  HPDF_LANG_HU* = "hu"
  HPDF_LANG_HY* = "hy"
  HPDF_LANG_IA* = "ia"
  HPDF_LANG_IE* = "ie"
  HPDF_LANG_IK* = "ik"
  HPDF_LANG_IN* = "in"
  HPDF_LANG_IS* = "is"
  HPDF_LANG_IT* = "it"
  HPDF_LANG_IW* = "iw"
  HPDF_LANG_JA* = "ja"
  HPDF_LANG_JI* = "ji"
  HPDF_LANG_JW* = "jw"
  HPDF_LANG_KA* = "ka"
  HPDF_LANG_KK* = "kk"
  HPDF_LANG_KL* = "kl"
  HPDF_LANG_KM* = "km"
  HPDF_LANG_KN* = "kn"
  HPDF_LANG_KO* = "ko"
  HPDF_LANG_KS* = "ks"
  HPDF_LANG_KU* = "ku"
  HPDF_LANG_KY* = "ky"
  HPDF_LANG_LA* = "la"
  HPDF_LANG_LN* = "ln"
  HPDF_LANG_LO* = "lo"
  HPDF_LANG_LT* = "lt"
  HPDF_LANG_LV* = "lv"
  HPDF_LANG_MG* = "mg"
  HPDF_LANG_MI* = "mi"
  HPDF_LANG_MK* = "mk"
  HPDF_LANG_ML* = "ml"
  HPDF_LANG_MN* = "mn"
  HPDF_LANG_MO* = "mo"
  HPDF_LANG_MR* = "mr"
  HPDF_LANG_MS* = "ms"
  HPDF_LANG_MT* = "mt"
  HPDF_LANG_MY* = "my"
  HPDF_LANG_NA* = "na"
  HPDF_LANG_NE* = "ne"
  HPDF_LANG_NL* = "nl"
  HPDF_LANG_NO* = "no"
  HPDF_LANG_OC* = "oc"
  HPDF_LANG_OM* = "om"
  HPDF_LANG_OR* = "or"
  HPDF_LANG_PA* = "pa"
  HPDF_LANG_PL* = "pl"
  HPDF_LANG_PS* = "ps"
  HPDF_LANG_PT* = "pt"
  HPDF_LANG_QU* = "qu"
  HPDF_LANG_RM* = "rm"
  HPDF_LANG_RN* = "rn"
  HPDF_LANG_RO* = "ro"
  HPDF_LANG_RU* = "ru"
  HPDF_LANG_RW* = "rw"
  HPDF_LANG_SA* = "sa"
  HPDF_LANG_SD* = "sd"
  HPDF_LANG_SG* = "sg"
  HPDF_LANG_SH* = "sh"
  HPDF_LANG_SI* = "si"
  HPDF_LANG_SK* = "sk"
  HPDF_LANG_SL* = "sl"
  HPDF_LANG_SM* = "sm"
  HPDF_LANG_SN* = "sn"
  HPDF_LANG_SO* = "so"
  HPDF_LANG_SQ* = "sq"
  HPDF_LANG_SR* = "sr"
  HPDF_LANG_SS* = "ss"
  HPDF_LANG_ST* = "st"
  HPDF_LANG_SU* = "su"
  HPDF_LANG_SV* = "sv"
  HPDF_LANG_SW* = "sw"
  HPDF_LANG_TA* = "ta"
  HPDF_LANG_TE* = "te"
  HPDF_LANG_TG* = "tg"
  HPDF_LANG_TH* = "th"
  HPDF_LANG_TI* = "ti"
  HPDF_LANG_TK* = "tk"
  HPDF_LANG_TL* = "tl"
  HPDF_LANG_TN* = "tn"
  HPDF_LANG_TR* = "tr"
  HPDF_LANG_TS* = "ts"
  HPDF_LANG_TT* = "tt"
  HPDF_LANG_TW* = "tw"
  HPDF_LANG_UK* = "uk"
  HPDF_LANG_UR* = "ur"
  HPDF_LANG_UZ* = "uz"
  HPDF_LANG_VI* = "vi"
  HPDF_LANG_VO* = "vo"
  HPDF_LANG_WO* = "wo"
  HPDF_LANG_XH* = "xh"
  HPDF_LANG_YO* = "yo"
  HPDF_LANG_ZH* = "zh"
  HPDF_LANG_ZU* = "zu"

## ----------------------------------------------------------------------------
## ----- Graphis mode ---------------------------------------------------------

const
  HPDF_GMODE_PAGE_DESCRIPTION* = 0x0001
  HPDF_GMODE_PATH_OBJECT* = 0x0002
  HPDF_GMODE_TEXT_OBJECT* = 0x0004
  HPDF_GMODE_CLIPPING_PATH* = 0x0008
  HPDF_GMODE_SHADING* = 0x0010
  HPDF_GMODE_INLINE_IMAGE* = 0x0020
  HPDF_GMODE_EXTERNAL_OBJECT* = 0x0040

## ----------------------------------------------------------------------------

type
  Encodings* = enum
    ecNone
    ecUtf8 = "UTF-8"
