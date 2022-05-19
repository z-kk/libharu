##
##  << Haru Free PDF Library >> -- fpdf_utils.h
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

## !!!Ignored construct:  # _HPDF_UTILS_H [NewLine] # _HPDF_UTILS_H [NewLine] # hpdf_config.h [NewLine] # hpdf_types.h [NewLine] HPDF_INT HPDF_AToI ( const char * s ) ;
## Error: expected ';'!!!

proc HPDF_AToF*(s: cstring): HPDF_DOUBLE
proc HPDF_IToA*(s: cstring; val: HPDF_INT32; eptr: cstring): cstring
proc HPDF_IToA2*(s: cstring; val: HPDF_UINT32; len: HPDF_UINT): cstring
proc HPDF_FToA*(s: cstring; val: HPDF_REAL; eptr: cstring): cstring
proc HPDF_MemCpy*(`out`: ptr HPDF_BYTE; `in`: ptr HPDF_BYTE; n: HPDF_UINT): ptr HPDF_BYTE
proc HPDF_StrCpy*(`out`: cstring; `in`: cstring; eptr: cstring): ptr HPDF_BYTE
proc HPDF_MemCmp*(s1: ptr HPDF_BYTE; s2: ptr HPDF_BYTE; n: HPDF_UINT): HPDF_INT
proc HPDF_StrCmp*(s1: cstring; s2: cstring): HPDF_INT
proc HPDF_StrStr*(s1: cstring; s2: cstring; maxlen: HPDF_UINT): cstring
proc HPDF_MemSet*(s: pointer; c: HPDF_BYTE; n: HPDF_UINT): pointer
proc HPDF_StrLen*(s: cstring; maxlen: HPDF_INT): HPDF_UINT
proc HPDF_ToBox*(left: HPDF_INT16; bottom: HPDF_INT16; right: HPDF_INT16;
                top: HPDF_INT16): HPDF_Box
proc HPDF_ToPoint*(x: HPDF_INT16; y: HPDF_INT16): HPDF_Point
proc HPDF_ToRect*(left: HPDF_REAL; bottom: HPDF_REAL; right: HPDF_REAL; top: HPDF_REAL): HPDF_Rect
proc HPDF_UInt16Swap*(value: ptr HPDF_UINT16)
template HPDF_NEEDS_ESCAPE*(c: untyped): untyped =
  (c < 0x20 or c > 0x7e or c == '\\' or c == '%' or c == '#' or c == '/' or c == '(' or c == ')' or c == '<' or
      c == '>' or c == '[' or c == ']' or c == '{' or c == '}')

template HPDF_IS_WHITE_SPACE*(c: untyped): untyped =
  (c == 0x00 or c == 0x09 or c == 0x0A or c == 0x0C or c == 0x0D or c == 0x20)

## ----------------------------------------------------------------------------
## ----- macros for debug -----------------------------------------------------

when defined(LIBHPDF_DEBUG_TRACE):
## !!!Ignored construct:  # HPDF_PTRACE_ON [NewLine] # HPDF_PTRACE ( ARGS ) HPDF_PRINTF ARGS [NewLine] # [NewLine] # HPDF_PTRACE ( ARGS )  do nothing [NewLine] #  HPDF_PTRACE [NewLine] # LIBHPDF_DEBUG [NewLine] # HPDF_PRINT_BINARY ( BUF , LEN , CAPTION ) HPDF_PrintBinary ( BUF , LEN , CAPTION ) [NewLine] # [NewLine] # HPDF_PRINT_BINARY ( BUF , LEN , CAPTION )  do nothing [NewLine] # [NewLine] #  _HPDF_UTILS_H [NewLine]
## Error: expected ';'!!!
