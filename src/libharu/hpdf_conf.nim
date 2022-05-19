##
##  << Haru Free PDF Library >> -- hpdf_conf.h
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

## !!!Ignored construct:  # _HPDF_CONF_H [NewLine] # _HPDF_CONF_H [NewLine] # < stdlib . h > [NewLine] # < stdio . h > [NewLine] # defined ( _MSC_VER ) [NewLine] # _USE_MATH_DEFINES [NewLine] # _USE_MATH_DEFINES 1 [NewLine] #  _USE_MATH_DEFINES [NewLine] # [NewLine] # __USE_XOPEN [NewLine] # __USE_XOPEN  for M_PI [NewLine] #  __USE_XOPEN [NewLine] # < math . h > [NewLine] ---------------------------------------------------------------------------- ----- standard C library functions ----------------------------------------- # HPDF_FOPEN fopen [NewLine] # HPDF_FCLOSE fclose [NewLine] # HPDF_FREAD fread [NewLine] # HPDF_FWRITE fwrite [NewLine] # HPDF_FFLUSH fflush [NewLine] # HPDF_FSEEK fseek [NewLine] # HPDF_FTELL ftell [NewLine] # HPDF_FEOF feof [NewLine] # HPDF_FERROR ferror [NewLine] # HPDF_MALLOC malloc [NewLine] # HPDF_FREE free [NewLine] # HPDF_FILEP FILE * [NewLine] # HPDF_TIME time [NewLine] # HPDF_PRINTF printf [NewLine] # HPDF_SIN sin [NewLine] # HPDF_COS cos [NewLine] ---------------------------------------------------------------------------- ----- parameters in relation to performance --------------------------------  default buffer size of memory-stream-object # HPDF_STREAM_BUF_SIZ 4096 [NewLine]  default array size of list-object # HPDF_DEF_ITEMS_PER_BLOCK 20 [NewLine]  default array size of cross-reference-table # HPDF_DEFALUT_XREF_ENTRY_NUM 1024 [NewLine]  default array size of widths-table of cid-fontdef # HPDF_DEF_CHAR_WIDTHS_NUM 128 [NewLine]  default array size of page-list-tablef # HPDF_DEF_PAGE_LIST_NUM 256 [NewLine]  default array size of range-table of cid-fontdef # HPDF_DEF_RANGE_TBL_NUM 128 [NewLine]  default buffer size of memory-pool-object # HPDF_MPOOL_BUF_SIZ 8192 [NewLine] # HPDF_MIN_MPOOL_BUF_SIZ 256 [NewLine] # HPDF_MAX_MPOOL_BUF_SIZ 1048576 [NewLine]  alignment size of memory-pool-object
##  # HPDF_ALIGN_SIZ sizeof int ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] #  _HPDF_CONF_H [NewLine]
## Error: did not expect [NewLine]!!!
