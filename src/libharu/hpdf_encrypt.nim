##
##  << Haru Free PDF Library >> -- hpdf_encrypt.h
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
## ------------------------------------------------------------------------------
##
##  The code implements MD5 message-digest algorithm is based on the code
##  written by Colin Plumb.
##  The copyright of it is as follows.
##
##  This code implements the MD5 message-digest algorithm.
##  The algorithm is due to Ron Rivest.  This code was
##  written by Colin Plumb in 1993, no copyright is claimed.
##  This code is in the public domain; do with it what you wish.
##
##  Equivalent code is available from RSA Data Security, Inc.
##  This code has been tested against that, and is equivalent,
##  except that you don't need to include two pages of legalese
##  with every copy.
##
##  To compute the message digest of a chunk of bytes, declare an
##  MD5Context structure, pass it to MD5Init, call MD5Update as
##  needed on buffers full of bytes, and then call MD5Final, which
##  will fill a supplied 16-byte array with the digest.
##
## ---------------------------------------------------------------------------

import
  hpdf_types

## ----------------------------------------------------------------------------
## ----- encrypt-dict ---------------------------------------------------------

const
  HPDF_ID_LEN* = 16
  HPDF_PASSWD_LEN* = 32
  HPDF_ENCRYPT_KEY_MAX* = 16
  HPDF_MD5_KEY_LEN* = 16
  HPDF_PERMISSION_PAD* = 0xFFFFFFC0
  HPDF_ARC4_BUF_SIZE* = 256

type
  HPDF_MD5_CTX* {.bycopy.} = object
    buf*: array[4, HPDF_UINT32]
    bits*: array[2, HPDF_UINT32]
    `in`*: array[64, HPDF_BYTE]

  HPDF_ARC4_Ctx_Rec* {.bycopy.} = object
    idx1*: HPDF_BYTE
    idx2*: HPDF_BYTE
    state*: array[HPDF_ARC4_BUF_SIZE, HPDF_BYTE]

  HPDF_Encrypt_Rec* {.bycopy.} = object
    mode*: HPDF_EncryptMode    ##  key_len must be a multiple of 8, and between 40 to 128
    key_len*: HPDF_UINT        ##  owner-password (not encrypted)
    owner_passwd*: array[HPDF_PASSWD_LEN, HPDF_BYTE] ##  user-password (not encrypted)
    user_passwd*: array[HPDF_PASSWD_LEN, HPDF_BYTE] ##  owner-password (encrypted)
    owner_key*: array[HPDF_PASSWD_LEN, HPDF_BYTE] ##  user-password (encrypted)
    user_key*: array[HPDF_PASSWD_LEN, HPDF_BYTE]
    permission*: HPDF_INT
    encrypt_id*: array[HPDF_ID_LEN, HPDF_BYTE]
    encryption_key*: array[HPDF_MD5_KEY_LEN + 5, HPDF_BYTE]
    md5_encryption_key*: array[HPDF_MD5_KEY_LEN, HPDF_BYTE]
    arc4ctx*: HPDF_ARC4_Ctx_Rec
  HPDF_Encrypt* = ptr HPDF_Encrypt_Rec


{.push dynlib: "libhpdf.so".}
proc HPDF_MD5Init*(ctx: ptr HPDF_MD5_CTX) {.importc.}
proc HPDF_MD5Update*(ctx: ptr HPDF_MD5_CTX; buf: ptr HPDF_BYTE; len: HPDF_UINT32) {.importc.}
proc HPDF_MD5Final*(digest: array[16, HPDF_BYTE]; ctx: ptr HPDF_MD5_CTX) {.importc.}
proc HPDF_PadOrTrancatePasswd*(pwd: cstring; new_pwd: ptr HPDF_BYTE) {.importc.}
proc HPDF_Encrypt_Init*(attr: HPDF_Encrypt) {.importc.}
proc HPDF_Encrypt_CreateUserKey*(attr: HPDF_Encrypt) {.importc.}
proc HPDF_Encrypt_CreateOwnerKey*(attr: HPDF_Encrypt) {.importc.}
proc HPDF_Encrypt_CreateEncryptionKey*(attr: HPDF_Encrypt) {.importc.}
proc HPDF_Encrypt_InitKey*(attr: HPDF_Encrypt; object_id: HPDF_UINT32;
                          gen_no: HPDF_UINT16) {.importc.}
proc HPDF_Encrypt_Reset*(attr: HPDF_Encrypt) {.importc.}
proc HPDF_Encrypt_CryptBuf*(attr: HPDF_Encrypt; src: ptr HPDF_BYTE;
                           dst: ptr HPDF_BYTE; len: HPDF_UINT) {.importc.}
{.pop.}
