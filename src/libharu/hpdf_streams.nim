##
##  << Haru Free PDF Library >> -- hpdf_streams.h
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
##  2005.12.20 Created.
##
##

import
  hpdf_list, hpdf_encrypt, hpdf_types, hpdf_error, hpdf_mmgr

const
  HPDF_STREAM_SIG_BYTES* = 0x5354524D

type
  HPDF_StreamType* = enum
    HPDF_STREAM_UNKNOWN = 0, HPDF_STREAM_CALLBACK, HPDF_STREAM_FILE,
    HPDF_STREAM_MEMORY


const
  HPDF_STREAM_FILTER_NONE* = 0x0000
  HPDF_STREAM_FILTER_ASCIIHEX* = 0x0100
  HPDF_STREAM_FILTER_ASCII85* = 0x0200
  HPDF_STREAM_FILTER_FLATE_DECODE* = 0x0400
  HPDF_STREAM_FILTER_DCT_DECODE* = 0x0800
  HPDF_STREAM_FILTER_CCITT_DECODE* = 0x1000

type
  HPDF_WhenceMode* = enum
    HPDF_SEEK_SET = 0, HPDF_SEEK_CUR, HPDF_SEEK_END
  HPDF_Stream_Write_Func* = proc (stream: HPDF_Stream; `ptr`: ptr HPDF_BYTE;
                               siz: HPDF_UINT): HPDF_STATUS
  HPDF_Stream_Read_Func* = proc (stream: HPDF_Stream; `ptr`: ptr HPDF_BYTE;
                              siz: ptr HPDF_UINT): HPDF_STATUS
  HPDF_Stream_Seek_Func* = proc (stream: HPDF_Stream; pos: HPDF_INT;
                              mode: HPDF_WhenceMode): HPDF_STATUS
  HPDF_Stream_Tell_Func* = proc (stream: HPDF_Stream): HPDF_INT32
  HPDF_Stream_Free_Func* = proc (stream: HPDF_Stream)
  HPDF_Stream_Size_Func* = proc (stream: HPDF_Stream): HPDF_UINT32
  HPDF_MemStreamAttr_Rec* {.bycopy.} = object
    buf*: HPDF_List
    buf_siz*: HPDF_UINT
    w_pos*: HPDF_UINT
    w_ptr*: ptr HPDF_BYTE
    r_ptr_idx*: HPDF_UINT
    r_pos*: HPDF_UINT
    r_ptr*: ptr HPDF_BYTE
  HPDF_MemStreamAttr* = ptr HPDF_MemStreamAttr_Rec

  HPDF_Stream_Rec* {.bycopy.} = object
    sig_bytes*: HPDF_UINT32
    `type`*: HPDF_StreamType
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    size*: HPDF_UINT
    write_fn*: HPDF_Stream_Write_Func
    read_fn*: HPDF_Stream_Read_Func
    seek_fn*: HPDF_Stream_Seek_Func
    free_fn*: HPDF_Stream_Free_Func
    tell_fn*: HPDF_Stream_Tell_Func
    size_fn*: HPDF_Stream_Size_Func
    attr*: pointer
  HPDF_Stream* = ptr HPDF_Stream_Rec



{.push dynlib: "libhpdf.so".}
proc HPDF_MemStream_New*(mmgr: HPDF_MMgr; buf_siz: HPDF_UINT): HPDF_Stream {.importc.}
proc HPDF_MemStream_GetBufPtr*(stream: HPDF_Stream; index: HPDF_UINT;
                              length: ptr HPDF_UINT): ptr HPDF_BYTE {.importc.}
proc HPDF_MemStream_GetBufSize*(stream: HPDF_Stream): HPDF_UINT {.importc.}
proc HPDF_MemStream_GetBufCount*(stream: HPDF_Stream): HPDF_UINT {.importc.}
proc HPDF_MemStream_Rewrite*(stream: HPDF_Stream; buf: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_MemStream_FreeData*(stream: HPDF_Stream) {.importc.}
proc HPDF_Stream_WriteToStream*(src: HPDF_Stream; dst: HPDF_Stream;
                               filter: HPDF_UINT; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_FileReader_New*(mmgr: HPDF_MMgr; fname: cstring): HPDF_Stream {.importc.}
proc HPDF_FileWriter_New*(mmgr: HPDF_MMgr; fname: cstring): HPDF_Stream {.importc.}
proc HPDF_CallbackReader_New*(mmgr: HPDF_MMgr; read_fn: HPDF_Stream_Read_Func;
                             seek_fn: HPDF_Stream_Seek_Func;
                             tell_fn: HPDF_Stream_Tell_Func;
                             size_fn: HPDF_Stream_Size_Func; data: pointer): HPDF_Stream {.importc.}
proc HPDF_CallbackWriter_New*(mmgr: HPDF_MMgr; write_fn: HPDF_Stream_Write_Func;
                             data: pointer): HPDF_Stream {.importc.}
proc HPDF_Stream_Free*(stream: HPDF_Stream) {.importc.}
proc HPDF_Stream_WriteChar*(stream: HPDF_Stream; value: char): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteStr*(stream: HPDF_Stream; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteUChar*(stream: HPDF_Stream; value: HPDF_BYTE): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteInt*(stream: HPDF_Stream; value: HPDF_INT): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteUInt*(stream: HPDF_Stream; value: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteReal*(stream: HPDF_Stream; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Stream_Write*(stream: HPDF_Stream; `ptr`: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Stream_Read*(stream: HPDF_Stream; `ptr`: ptr HPDF_BYTE; size: ptr HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Stream_ReadLn*(stream: HPDF_Stream; s: cstring; size: ptr HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Stream_Tell*(stream: HPDF_Stream): HPDF_INT32 {.importc.}
proc HPDF_Stream_Seek*(stream: HPDF_Stream; pos: HPDF_INT; mode: HPDF_WhenceMode): HPDF_STATUS {.importc.}
proc HPDF_Stream_EOF*(stream: HPDF_Stream): HPDF_BOOL {.importc.}
proc HPDF_Stream_Size*(stream: HPDF_Stream): HPDF_UINT32 {.importc.}
proc HPDF_Stream_Flush*(stream: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteEscapeName*(stream: HPDF_Stream; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteEscapeText2*(stream: HPDF_Stream; text: cstring; len: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteEscapeText*(stream: HPDF_Stream; text: cstring): HPDF_STATUS {.importc.}
proc HPDF_Stream_WriteBinary*(stream: HPDF_Stream; data: ptr HPDF_BYTE;
                             len: HPDF_UINT; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Stream_Validate*(stream: HPDF_Stream): HPDF_STATUS {.importc.}
{.pop.}
