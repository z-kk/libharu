##
##  << Haru Free PDF Library >> -- hpdf_objects.c
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
  hpdf_encoder, hpdf_types, hpdf_list, hpdf_error, hpdf_streams, hpdf_encrypt, hpdf_mmgr,
  hpdf_consts

##  if HPDF_OTYPE_DIRECT bit is set, the object owned by other container
##  object. if HPDF_OTYPE_INDIRECT bit is set, the object managed by xref.
##

const
  HPDF_OTYPE_NONE* = 0x00000000
  HPDF_OTYPE_DIRECT* = 0x80000000
  HPDF_OTYPE_INDIRECT* = 0x40000000
  HPDF_OTYPE_ANY* = (HPDF_OTYPE_DIRECT or HPDF_OTYPE_INDIRECT)
  HPDF_OTYPE_HIDDEN* = 0x10000000
  HPDF_OCLASS_UNKNOWN* = 0x0001
  HPDF_OCLASS_NULL* = 0x0002
  HPDF_OCLASS_BOOLEAN* = 0x0003
  HPDF_OCLASS_NUMBER* = 0x0004
  HPDF_OCLASS_REAL* = 0x0005
  HPDF_OCLASS_NAME* = 0x0006
  HPDF_OCLASS_STRING* = 0x0007
  HPDF_OCLASS_BINARY* = 0x0008
  HPDF_OCLASS_ARRAY* = 0x0010
  HPDF_OCLASS_DICT* = 0x0011
  HPDF_OCLASS_PROXY* = 0x0012
  HPDF_OCLASS_ANY* = 0x00FF
  HPDF_OSUBCLASS_FONT* = 0x0100
  HPDF_OSUBCLASS_CATALOG* = 0x0200
  HPDF_OSUBCLASS_PAGES* = 0x0300
  HPDF_OSUBCLASS_PAGE* = 0x0400
  HPDF_OSUBCLASS_XOBJECT* = 0x0500
  HPDF_OSUBCLASS_OUTLINE* = 0x0600
  HPDF_OSUBCLASS_DESTINATION* = 0x0700
  HPDF_OSUBCLASS_ANNOTATION* = 0x0800
  HPDF_OSUBCLASS_ENCRYPT* = 0x0900
  HPDF_OSUBCLASS_EXT_GSTATE* = 0x0A00
  HPDF_OSUBCLASS_EXT_GSTATE_R* = 0x0B00
  HPDF_OSUBCLASS_NAMEDICT* = 0x0C00
  HPDF_OSUBCLASS_NAMETREE* = 0x0D00

## ----------------------------------------------------------------------------
## ------ Values related xref -------------------------------------------------

const
  HPDF_FREE_ENTRY* = 'f'
  HPDF_IN_USE_ENTRY* = 'n'

##
##   structure of Object-ID
##
##   1       direct-object
##   2       indirect-object
##   3       reserved
##   4       shadow-object
##   5-8     reserved
##   9-32    object-idÅi0-8388607Åj
##
##   the real Object-ID is described "obj_id & 0x00FFFFFF"
##

type
  HPDF_Obj_Header* {.bycopy.} = object
    obj_id*: HPDF_UINT32
    gen_no*: HPDF_UINT16
    obj_class*: HPDF_UINT16


{.push dynlib: "libhpdf.so".}
proc HPDF_Obj_WriteValue*(obj: pointer; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Obj_Write*(obj: pointer; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Obj_Free*(mmgr: HPDF_MMgr; obj: pointer) {.importc.}
proc HPDF_Obj_ForceFree*(mmgr: HPDF_MMgr; obj: pointer) {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Null -----------------------------------------------------------

type
  HPDF_Null_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
  HPDF_Null* = ptr HPDF_Null_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Null_New*(mmgr: HPDF_MMgr): HPDF_Null {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Boolean --------------------------------------------------------

type
  HPDF_Boolean_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    value*: HPDF_BOOL
  HPDF_Boolean* = ptr HPDF_Boolean_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Boolean_New*(mmgr: HPDF_MMgr; value: HPDF_BOOL): HPDF_Boolean {.importc.}
proc HPDF_Boolean_Write*(obj: HPDF_Boolean; stream: HPDF_Stream): HPDF_STATUS {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Number ---------------------------------------------------------

type
  HPDF_Number_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    value*: HPDF_INT32
  HPDF_Number* = ptr HPDF_Number_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Number_New*(mmgr: HPDF_MMgr; value: HPDF_INT32): HPDF_Number {.importc.}
proc HPDF_Number_SetValue*(obj: HPDF_Number; value: HPDF_INT32) {.importc.}
proc HPDF_Number_Write*(obj: HPDF_Number; stream: HPDF_Stream): HPDF_STATUS {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Real -----------------------------------------------------------

type
  HPDF_Real_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    error*: HPDF_Error
    value*: HPDF_REAL
  HPDF_Real = ptr HPDF_Real_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Real_New*(mmgr: HPDF_MMgr; value: HPDF_REAL): HPDF_Real {.importc.}
proc HPDF_Real_Write*(obj: HPDF_Real; stream: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_Real_SetValue*(obj: HPDF_Real; value: HPDF_REAL): HPDF_STATUS {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Name -----------------------------------------------------------

type
  HPDF_Name_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    error*: HPDF_Error
    value*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
  HPDF_Name* = ptr HPDF_Name_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Name_New*(mmgr: HPDF_MMgr; value: cstring): HPDF_Name {.importc.}
proc HPDF_Name_SetValue*(obj: HPDF_Name; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_Name_Write*(obj: HPDF_Name; stream: HPDF_Stream): HPDF_STATUS {.importc.}
proc HPDF_Name_GetValue*(obj: HPDF_Name): cstring {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_String ---------------------------------------------------------

type
  HPDF_String_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    encoder*: HPDF_Encoder
    value*: ptr HPDF_BYTE
    len*: HPDF_UINT
  HPDF_String* = ptr HPDF_String_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_String_New*(mmgr: HPDF_MMgr; value: cstring; encoder: HPDF_Encoder): HPDF_String {.importc.}
proc HPDF_String_SetValue*(obj: HPDF_String; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_String_Free*(obj: HPDF_String) {.importc.}
proc HPDF_String_Write*(obj: HPDF_String; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_String_Cmp*(s1: HPDF_String; s2: HPDF_String): HPDF_INT32 {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Binary ---------------------------------------------------------

type
  HPDF_Binary_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    value*: ptr HPDF_BYTE
    len*: HPDF_UINT
  HPDF_Binary* = ptr HPDF_Binary_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Binary_New*(mmgr: HPDF_MMgr; value: ptr HPDF_BYTE; len: HPDF_UINT): HPDF_Binary {.importc.}
proc HPDF_Binary_SetValue*(obj: HPDF_Binary; value: ptr HPDF_BYTE; len: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Binary_GetValue*(obj: HPDF_Binary): ptr HPDF_BYTE {.importc.}
proc HPDF_Binary_Free*(obj: HPDF_Binary) {.importc.}
proc HPDF_Binary_Write*(obj: HPDF_Binary; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Binary_GetLen*(obj: HPDF_Binary): HPDF_UINT {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Array ----------------------------------------------------------

type
  HPDF_Array_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    list*: HPDF_List
  HPDF_Array* = ptr HPDF_Array_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Array_New*(mmgr: HPDF_MMgr): HPDF_Array {.importc.}
proc HPDF_Box_Array_New*(mmgr: HPDF_MMgr; box: HPDF_Box): HPDF_Array {.importc.}
proc HPDF_Array_Free*(array: HPDF_Array) {.importc.}
proc HPDF_Array_Write*(array: HPDF_Array; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Array_Add*(array: HPDF_Array; obj: pointer): HPDF_STATUS {.importc.}
proc HPDF_Array_Insert*(array: HPDF_Array; target: pointer; obj: pointer): HPDF_STATUS {.importc.}
proc HPDF_Array_GetItem*(array: HPDF_Array; index: HPDF_UINT; obj_class: HPDF_UINT16): pointer {.importc.}
proc HPDF_Array_AddNumber*(array: HPDF_Array; value: HPDF_INT32): HPDF_STATUS {.importc.}
proc HPDF_Array_AddReal*(array: HPDF_Array; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Array_AddName*(array: HPDF_Array; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_Array_Clear*(array: HPDF_Array) {.importc.}
proc HPDF_Array_Items*(array: HPDF_Array): HPDF_UINT {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Dict -----------------------------------------------------------

type
  HPDF_Dict_FreeFunc* = proc (obj: HPDF_Dict)
  HPDF_Dict_BeforeWriteFunc* = proc (obj: HPDF_Dict): HPDF_STATUS
  HPDF_Dict_AfterWriteFunc* = proc (obj: HPDF_Dict): HPDF_STATUS
  HPDF_Dict_OnWriteFunc* = proc (obj: HPDF_Dict; stream: HPDF_Stream): HPDF_STATUS
  HPDF_Dict_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    list*: HPDF_List
    before_write_fn*: HPDF_Dict_BeforeWriteFunc
    write_fn*: HPDF_Dict_OnWriteFunc
    after_write_fn*: HPDF_Dict_AfterWriteFunc
    free_fn*: HPDF_Dict_FreeFunc
    stream*: HPDF_Stream
    filter*: HPDF_UINT
    filterParams*: HPDF_Dict
    attr*: pointer
  HPDF_Dict* = ptr HPDF_Dict_Rec

  HPDF_DictElement_Rec* {.bycopy.} = object
    key*: array[HPDF_LIMIT_MAX_NAME_LEN + 1, char]
    value*: pointer
  HPDF_DictElement* = ptr HPDF_DictElement_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Dict_New*(mmgr: HPDF_MMgr): HPDF_Dict {.importc.}
proc HPDF_Dict_Free*(dict: HPDF_Dict) {.importc.}
proc HPDF_Dict_Write*(dict: HPDF_Dict; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Dict_GetKeyByObj*(dict: HPDF_Dict; obj: pointer): cstring {.importc.}
proc HPDF_Dict_Add*(dict: HPDF_Dict; key: cstring; obj: pointer): HPDF_STATUS {.importc.}
proc HPDF_Dict_GetItem*(dict: HPDF_Dict; key: cstring; obj_class: HPDF_UINT16): pointer {.importc.}
proc HPDF_Dict_AddName*(dict: HPDF_Dict; key: cstring; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_Dict_AddNumber*(dict: HPDF_Dict; key: cstring; value: HPDF_INT32): HPDF_STATUS {.importc.}
proc HPDF_Dict_AddReal*(dict: HPDF_Dict; key: cstring; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Dict_AddBoolean*(dict: HPDF_Dict; key: cstring; value: HPDF_BOOL): HPDF_STATUS {.importc.}
proc HPDF_Dict_RemoveElement*(dict: HPDF_Dict; key: cstring): HPDF_STATUS {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_Xref -----------------------------------------------------------

type
  HPDF_XrefEntry_Rec* {.bycopy.} = object
    entry_typ*: char
    byte_offset*: HPDF_UINT
    gen_no*: HPDF_UINT16
    obj*: pointer
  HPDF_XrefEntry* = ptr HPDF_XrefEntry_Rec

  HPDF_Xref_Rec* {.bycopy.} = object
    mmgr*: HPDF_MMgr
    error*: HPDF_Error
    start_offset*: HPDF_UINT32
    entries*: HPDF_List
    `addr`*: HPDF_UINT
    prev*: HPDF_Xref
    trailer*: HPDF_Dict
  HPDF_Xref* = ptr HPDF_Xref_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_DictStream_New*(mmgr: HPDF_MMgr; xref: HPDF_Xref): HPDF_Dict {.importc.}
proc HPDF_Xref_New*(mmgr: HPDF_MMgr; offset: HPDF_UINT32): HPDF_Xref {.importc.}
proc HPDF_Xref_Free*(xref: HPDF_Xref) {.importc.}
proc HPDF_Xref_Add*(xref: HPDF_Xref; obj: pointer): HPDF_STATUS {.importc.}
proc HPDF_Xref_GetEntry*(xref: HPDF_Xref; index: HPDF_UINT): HPDF_XrefEntry {.importc.}
proc HPDF_Xref_WriteToStream*(xref: HPDF_Xref; stream: HPDF_Stream; e: HPDF_Encrypt): HPDF_STATUS {.importc.}
proc HPDF_Xref_GetEntryByObjectId*(xref: HPDF_Xref; obj_id: HPDF_UINT): HPDF_XrefEntry {.importc.}
{.pop.}
## ---------------------------------------------------------------------------
## ----- HPDF_ProxyObject ----------------------------------------------------

type
  HPDF_Proxy_Rec* {.bycopy.} = object
    header*: HPDF_Obj_Header
    obj*: pointer
  HPDF_Proxy* = ptr HPDF_Proxy_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_Proxy_New*(mmgr: HPDF_MMgr; obj: pointer): HPDF_Proxy {.importc.}
{.pop.}
type
  HPDF_EmbeddedFile* = HPDF_Dict
  HPDF_NameDict* = HPDF_Dict
  HPDF_NameTree* = HPDF_Dict
  HPDF_Pages* = HPDF_Dict
  HPDF_Page* = HPDF_Dict
  HPDF_Annotation* = HPDF_Dict
  HPDF_3DMeasure* = HPDF_Dict
  HPDF_ExData* = HPDF_Dict
  HPDF_XObject* = HPDF_Dict
  HPDF_Image* = HPDF_Dict
  HPDF_Outline* = HPDF_Dict
  HPDF_EncryptDict* = HPDF_Dict
  HPDF_Action* = HPDF_Dict
  HPDF_ExtGState* = HPDF_Dict
  HPDF_Destination* = HPDF_Array
  HPDF_U3D* = HPDF_Dict
  HPDF_OutputIntent* = HPDF_Dict
  HPDF_JavaScript* = HPDF_Dict
