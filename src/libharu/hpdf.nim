##
##  << Haru Free PDF Library 2.0.8 >> -- hpdf.h
##
##  URL http://libharu.org/
##
##  Copyright (c) 1999-2006 Takeshi Kanno
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
  hpdf_types, hpdf_doc, hpdf_objects, hpdf_font, hpdf_fontdef, hpdf_streams, hpdf_encoder, hpdf_error, hpdf_mmgr,
  hpdf_consts

export
  hpdf_types, hpdf_doc, hpdf_objects, hpdf_font, hpdf_fontdef, hpdf_streams, hpdf_encoder, hpdf_error, hpdf_mmgr,
  hpdf_consts

template HPDF_UNUSED*(a: untyped): untyped =
  ((void)(a))

{.push dynlib: "libhpdf.so".}
proc HPDF_GetVersion*(): cstring {.importc.}
proc HPDF_NewEx*(user_error_fn: HPDF_Error_Handler; user_alloc_fn: HPDF_Alloc_Func;
                user_free_fn: HPDF_Free_Func; mem_pool_buf_size: HPDF_UINT;
                user_data: pointer): HPDF_Doc {.importc.}
proc HPDF_New*(user_error_fn: HPDF_Error_Handler; user_data: pointer): HPDF_Doc {.importc.}
proc HPDF_SetErrorHandler*(pdf: HPDF_Doc; user_error_fn: HPDF_Error_Handler): HPDF_STATUS {.importc.}
proc HPDF_Free*(pdf: HPDF_Doc) {.importc.}
proc HPDF_NewDoc*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_FreeDoc*(pdf: HPDF_Doc) {.importc.}
proc HPDF_HasDoc*(pdf: HPDF_Doc): HPDF_BOOL {.importc.}
proc HPDF_FreeDocAll*(pdf: HPDF_Doc) {.importc.}
proc HPDF_SaveToStream*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_GetContents*(pdf: HPDF_Doc; buf: ptr HPDF_BYTE; size: ptr HPDF_UINT32): HPDF_STATUS {.importc.}
proc HPDF_GetStreamSize*(pdf: HPDF_Doc): HPDF_UINT32 {.importc.}
proc HPDF_ReadFromStream*(pdf: HPDF_Doc; buf: ptr HPDF_BYTE; size: ptr HPDF_UINT32): HPDF_STATUS {.importc.}
proc HPDF_ResetStream*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_SaveToFile*(pdf: HPDF_Doc; file_name: cstring): HPDF_STATUS {.importc.}
proc HPDF_GetError*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_GetErrorDetail*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_ResetError*(pdf: HPDF_Doc) {.importc.}
proc HPDF_CheckError*(error: HPDF_Error): HPDF_STATUS {.importc.}
proc HPDF_SetPagesConfiguration*(pdf: HPDF_Doc; page_per_pages: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_GetPageByIndex*(pdf: HPDF_Doc; index: HPDF_UINT): HPDF_Page {.importc.}
## ---------------------------------------------------------------------------
## ---------------------------------------------------------------------------

proc HPDF_GetPageLayout*(pdf: HPDF_Doc): HPDF_PageLayout {.importc.}
proc HPDF_SetPageLayout*(pdf: HPDF_Doc; layout: HPDF_PageLayout): HPDF_STATUS {.importc.}
proc HPDF_GetPageMode*(pdf: HPDF_Doc): HPDF_PageMode {.importc.}
proc HPDF_SetPageMode*(pdf: HPDF_Doc; mode: HPDF_PageMode): HPDF_STATUS {.importc.}
proc HPDF_GetViewerPreference*(pdf: HPDF_Doc): HPDF_UINT {.importc.}
proc HPDF_SetViewerPreference*(pdf: HPDF_Doc; value: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_SetOpenAction*(pdf: HPDF_Doc; open_action: HPDF_Destination): HPDF_STATUS {.importc.}
## ---------------------------------------------------------------------------
## ----- page handling -------------------------------------------------------

proc HPDF_GetCurrentPage*(pdf: HPDF_Doc): HPDF_Page {.importc.}
proc HPDF_AddPage*(pdf: HPDF_Doc): HPDF_Page {.importc.}
proc HPDF_InsertPage*(pdf: HPDF_Doc; page: HPDF_Page): HPDF_Page {.importc.}
proc HPDF_Page_SetWidth*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_SetHeight*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_SetSize*(page: HPDF_Page; size: HPDF_PageSizes;
                       direction: HPDF_PageDirection): HPDF_STATUS {.importc.}
proc HPDF_Page_SetRotate*(page: HPDF_Page; angle: HPDF_UINT16): HPDF_STATUS {.importc.}
proc HPDF_Page_SetZoom*(page: HPDF_Page; zoom: HPDF_REAL): HPDF_STATUS {.importc.}
## ---------------------------------------------------------------------------
## ----- font handling -------------------------------------------------------

proc HPDF_GetFont*(pdf: HPDF_Doc; font_name: cstring; encoding_name: cstring): HPDF_Font {.importc.}
proc HPDF_LoadType1FontFromFile*(pdf: HPDF_Doc; afm_file_name: cstring;
                                data_file_name: cstring): cstring {.importc.}
proc HPDF_GetTTFontDefFromFile*(pdf: HPDF_Doc; file_name: cstring;
                               embedding: HPDF_BOOL): HPDF_FontDef {.importc.}
proc HPDF_LoadTTFontFromFile*(pdf: HPDF_Doc; file_name: cstring; embedding: HPDF_BOOL): cstring {.importc.}
proc HPDF_LoadTTFontFromFile2*(pdf: HPDF_Doc; file_name: cstring; index: HPDF_UINT;
                              embedding: HPDF_BOOL): cstring {.importc.}
proc HPDF_AddPageLabel*(pdf: HPDF_Doc; page_num: HPDF_UINT; style: HPDF_PageNumStyle;
                       first_page: HPDF_UINT; prefix: cstring): HPDF_STATUS {.importc.}
proc HPDF_UseJPFonts*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseKRFonts*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseCNSFonts*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseCNTFonts*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- outline ------------------------------------------------------------

proc HPDF_CreateOutline*(pdf: HPDF_Doc; parent: HPDF_Outline; title: cstring;
                        encoder: HPDF_Encoder): HPDF_Outline {.importc.}
proc HPDF_Outline_SetOpened*(outline: HPDF_Outline; opened: HPDF_BOOL): HPDF_STATUS {.importc.}
proc HPDF_Outline_SetDestination*(outline: HPDF_Outline; dst: HPDF_Destination): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- destination --------------------------------------------------------

proc HPDF_Page_CreateDestination*(page: HPDF_Page): HPDF_Destination {.importc.}
proc HPDF_Destination_SetXYZ*(dst: HPDF_Destination; left: HPDF_REAL; top: HPDF_REAL;
                             zoom: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFit*(dst: HPDF_Destination): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitH*(dst: HPDF_Destination; top: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitV*(dst: HPDF_Destination; left: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitR*(dst: HPDF_Destination; left: HPDF_REAL;
                              bottom: HPDF_REAL; right: HPDF_REAL; top: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitB*(dst: HPDF_Destination): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitBH*(dst: HPDF_Destination; top: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Destination_SetFitBV*(dst: HPDF_Destination; left: HPDF_REAL): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- encoder ------------------------------------------------------------

proc HPDF_GetEncoder*(pdf: HPDF_Doc; encoding_name: cstring): HPDF_Encoder {.importc.}
proc HPDF_GetCurrentEncoder*(pdf: HPDF_Doc): HPDF_Encoder {.importc.}
proc HPDF_SetCurrentEncoder*(pdf: HPDF_Doc; encoding_name: cstring): HPDF_STATUS {.importc.}
proc HPDF_Encoder_GetType*(encoder: HPDF_Encoder): HPDF_EncoderType {.importc.}
proc HPDF_Encoder_GetByteType*(encoder: HPDF_Encoder; text: cstring; index: HPDF_UINT): HPDF_ByteType {.importc.}
proc HPDF_Encoder_GetUnicode*(encoder: HPDF_Encoder; code: HPDF_UINT16): HPDF_UNICODE {.importc.}
proc HPDF_Encoder_GetWritingMode*(encoder: HPDF_Encoder): HPDF_WritingMode {.importc.}
proc HPDF_UseJPEncodings*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseKREncodings*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseCNSEncodings*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseCNTEncodings*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
proc HPDF_UseUTFEncodings*(pdf: HPDF_Doc): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- annotation ---------------------------------------------------------

proc HPDF_Page_Create3DAnnot*(page: HPDF_Page; rect: HPDF_Rect; u3d: HPDF_U3D): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateTextAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                               encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateFreeTextAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                   encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateLineAnnot*(page: HPDF_Page; text: cstring; encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateLinkAnnot*(page: HPDF_Page; rect: HPDF_Rect;
                               dst: HPDF_Destination): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateURILinkAnnot*(page: HPDF_Page; rect: HPDF_Rect; uri: cstring): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateTextMarkupAnnot*(page: HPDF_Page; rect: HPDF_Rect;
                                     text: cstring; encoder: HPDF_Encoder;
                                     subType: HPDF_AnnotType): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateHighlightAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                    encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateUnderlineAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                    encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateSquigglyAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                   encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateStrikeOutAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                    encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreatePopupAnnot*(page: HPDF_Page; rect: HPDF_Rect;
                                parent: HPDF_Annotation): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateStampAnnot*(page: HPDF_Page; rect: HPDF_Rect;
                                name: HPDF_StampAnnotName; text: cstring;
                                encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateProjectionAnnot*(page: HPDF_Page; rect: HPDF_Rect;
                                     text: cstring; encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateSquareAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                 encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_Page_CreateCircleAnnot*(page: HPDF_Page; rect: HPDF_Rect; text: cstring;
                                 encoder: HPDF_Encoder): HPDF_Annotation {.importc.}
proc HPDF_LinkAnnot_SetHighlightMode*(annot: HPDF_Annotation;
                                     mode: HPDF_AnnotHighlightMode): HPDF_STATUS {.importc.}
proc HPDF_LinkAnnot_SetBorderStyle*(annot: HPDF_Annotation; width: HPDF_REAL;
                                   dash_on: HPDF_UINT16; dash_off: HPDF_UINT16): HPDF_STATUS {.importc.}
proc HPDF_TextAnnot_SetIcon*(annot: HPDF_Annotation; icon: HPDF_AnnotIcon): HPDF_STATUS {.importc.}
proc HPDF_TextAnnot_SetOpened*(annot: HPDF_Annotation; opened: HPDF_BOOL): HPDF_STATUS {.importc.}
proc HPDF_Annot_SetRGBColor*(annot: HPDF_Annotation; color: HPDF_RGBColor): HPDF_STATUS {.importc.}
proc HPDF_Annot_SetCMYKColor*(annot: HPDF_Annotation; color: HPDF_CMYKColor): HPDF_STATUS {.importc.}
proc HPDF_Annot_SetGrayColor*(annot: HPDF_Annotation; color: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Annot_SetNoColor*(annot: HPDF_Annotation): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetTitle*(annot: HPDF_Annotation; name: cstring): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetSubject*(annot: HPDF_Annotation; name: cstring): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetCreationDate*(annot: HPDF_Annotation; value: HPDF_Date): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetTransparency*(annot: HPDF_Annotation; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetIntent*(annot: HPDF_Annotation; intent: HPDF_AnnotIntent): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetPopup*(annot: HPDF_Annotation; popup: HPDF_Annotation): HPDF_STATUS {.importc.}
proc HPDF_MarkupAnnot_SetRectDiff*(annot: HPDF_Annotation; rect: HPDF_Rect): HPDF_STATUS {.importc.}
##  RD entry

proc HPDF_MarkupAnnot_SetCloudEffect*(annot: HPDF_Annotation;
                                     cloudIntensity: HPDF_INT): HPDF_STATUS {.importc.}
##  BE entry

proc HPDF_MarkupAnnot_SetInteriorRGBColor*(annot: HPDF_Annotation;
    color: HPDF_RGBColor): HPDF_STATUS {.importc.}
##  IC with RGB entry

proc HPDF_MarkupAnnot_SetInteriorCMYKColor*(annot: HPDF_Annotation;
    color: HPDF_CMYKColor): HPDF_STATUS {.importc.}
##  IC with CMYK entry

proc HPDF_MarkupAnnot_SetInteriorGrayColor*(annot: HPDF_Annotation;
    color: HPDF_REAL): HPDF_STATUS {.importc.}
##  IC with Gray entry

proc HPDF_MarkupAnnot_SetInteriorTransparent*(annot: HPDF_Annotation): HPDF_STATUS {.importc.}
##  IC with No Color entry

proc HPDF_TextMarkupAnnot_SetQuadPoints*(annot: HPDF_Annotation; lb: HPDF_Point;
                                        rb: HPDF_Point; rt: HPDF_Point;
                                        lt: HPDF_Point): HPDF_STATUS {.importc.}
##  l-left, r-right, b-bottom, t-top positions

proc HPDF_Annot_Set3DView*(mmgr: HPDF_MMgr; annot: HPDF_Annotation;
                          annot3d: HPDF_Annotation; view: HPDF_Dict): HPDF_STATUS {.importc.}
proc HPDF_PopupAnnot_SetOpened*(annot: HPDF_Annotation; opened: HPDF_BOOL): HPDF_STATUS {.importc.}
proc HPDF_FreeTextAnnot_SetLineEndingStyle*(annot: HPDF_Annotation;
    startStyle: HPDF_LineAnnotEndingStyle; endStyle: HPDF_LineAnnotEndingStyle): HPDF_STATUS {.importc.}
proc HPDF_FreeTextAnnot_Set3PointCalloutLine*(annot: HPDF_Annotation;
    startPoint: HPDF_Point; kneePoint: HPDF_Point; endPoint: HPDF_Point): HPDF_STATUS {.importc.}
##  Callout line will be in default user space

proc HPDF_FreeTextAnnot_Set2PointCalloutLine*(annot: HPDF_Annotation;
    startPoint: HPDF_Point; endPoint: HPDF_Point): HPDF_STATUS {.importc.}
##  Callout line will be in default user space

proc HPDF_FreeTextAnnot_SetDefaultStyle*(annot: HPDF_Annotation; style: cstring): HPDF_STATUS {.importc.}
proc HPDF_LineAnnot_SetPosition*(annot: HPDF_Annotation; startPoint: HPDF_Point;
                                startStyle: HPDF_LineAnnotEndingStyle;
                                endPoint: HPDF_Point;
                                endStyle: HPDF_LineAnnotEndingStyle): HPDF_STATUS {.importc.}
proc HPDF_LineAnnot_SetLeader*(annot: HPDF_Annotation; leaderLen: HPDF_INT;
                              leaderExtLen: HPDF_INT; leaderOffsetLen: HPDF_INT): HPDF_STATUS {.importc.}
proc HPDF_LineAnnot_SetCaption*(annot: HPDF_Annotation; showCaption: HPDF_BOOL;
                               position: HPDF_LineAnnotCapPosition;
                               horzOffset: HPDF_INT; vertOffset: HPDF_INT): HPDF_STATUS {.importc.}
proc HPDF_Annotation_SetBorderStyle*(annot: HPDF_Annotation;
                                    subtype: HPDF_BSSubtype; width: HPDF_REAL;
                                    dash_on: HPDF_UINT16; dash_off: HPDF_UINT16;
                                    dash_phase: HPDF_UINT16): HPDF_STATUS {.importc.}
proc HPDF_ProjectionAnnot_SetExData*(annot: HPDF_Annotation; exdata: HPDF_ExData): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- 3D Measure ---------------------------------------------------------

proc HPDF_Page_Create3DC3DMeasure*(page: HPDF_Page; firstanchorpoint: HPDF_Point3D;
                                  textanchorpoint: HPDF_Point3D): HPDF_3DMeasure {.importc.}
proc HPDF_Page_CreatePD33DMeasure*(page: HPDF_Page;
                                  annotationPlaneNormal: HPDF_Point3D;
                                  firstAnchorPoint: HPDF_Point3D;
                                  secondAnchorPoint: HPDF_Point3D;
                                  leaderLinesDirection: HPDF_Point3D;
                                  measurementValuePoint: HPDF_Point3D;
                                  textYDirection: HPDF_Point3D; value: HPDF_REAL;
                                  unitsString: cstring): HPDF_3DMeasure {.importc.}
proc HPDF_3DMeasure_SetName*(measure: HPDF_3DMeasure; name: cstring): HPDF_STATUS {.importc.}
proc HPDF_3DMeasure_SetColor*(measure: HPDF_3DMeasure; color: HPDF_RGBColor): HPDF_STATUS {.importc.}
proc HPDF_3DMeasure_SetTextSize*(measure: HPDF_3DMeasure; textsize: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_3DC3DMeasure_SetTextBoxSize*(measure: HPDF_3DMeasure; x: HPDF_INT32;
                                      y: HPDF_INT32): HPDF_STATUS {.importc.}
proc HPDF_3DC3DMeasure_SetText*(measure: HPDF_3DMeasure; text: cstring;
                               encoder: HPDF_Encoder): HPDF_STATUS {.importc.}
proc HPDF_3DC3DMeasure_SetProjectionAnotation*(measure: HPDF_3DMeasure;
    projectionanotation: HPDF_Annotation): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- External Data ---------------------------------------------------------

proc HPDF_Page_Create3DAnnotExData*(page: HPDF_Page): HPDF_ExData {.importc.}
proc HPDF_3DAnnotExData_Set3DMeasurement*(exdata: HPDF_ExData;
    measure: HPDF_3DMeasure): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## --------------------------------------------------------------------------
## ----- 3D View ---------------------------------------------------------

proc HPDF_Page_Create3DView*(page: HPDF_Page; u3d: HPDF_U3D;
                            annot3d: HPDF_Annotation; name: cstring): HPDF_Dict {.importc.}
proc HPDF_3DView_Add3DC3DMeasure*(view: HPDF_Dict; measure: HPDF_3DMeasure): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- image data ---------------------------------------------------------

proc HPDF_LoadPngImageFromMem*(pdf: HPDF_Doc; buffer: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_Image {.importc.}
proc HPDF_LoadPngImageFromFile*(pdf: HPDF_Doc; filename: cstring): HPDF_Image {.importc.}
proc HPDF_LoadPngImageFromFile2*(pdf: HPDF_Doc; filename: cstring): HPDF_Image {.importc.}
proc HPDF_LoadJpegImageFromFile*(pdf: HPDF_Doc; filename: cstring): HPDF_Image {.importc.}
proc HPDF_LoadJpegImageFromMem*(pdf: HPDF_Doc; buffer: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_Image {.importc.}
proc HPDF_LoadU3DFromFile*(pdf: HPDF_Doc; filename: cstring): HPDF_Image {.importc.}
proc HPDF_LoadU3DFromMem*(pdf: HPDF_Doc; buffer: ptr HPDF_BYTE; size: HPDF_UINT): HPDF_Image {.importc.}
proc HPDF_Image_LoadRaw1BitImageFromMem*(pdf: HPDF_Doc; buf: ptr HPDF_BYTE;
                                        width: HPDF_UINT; height: HPDF_UINT;
                                        line_width: HPDF_UINT;
                                        black_is1: HPDF_BOOL;
                                        top_is_first: HPDF_BOOL): HPDF_Image {.importc.}
proc HPDF_LoadRawImageFromFile*(pdf: HPDF_Doc; filename: cstring; width: HPDF_UINT;
                               height: HPDF_UINT; color_space: HPDF_ColorSpace): HPDF_Image {.importc.}
proc HPDF_LoadRawImageFromMem*(pdf: HPDF_Doc; buf: ptr HPDF_BYTE; width: HPDF_UINT;
                              height: HPDF_UINT; color_space: HPDF_ColorSpace;
                              bits_per_component: HPDF_UINT): HPDF_Image {.importc.}
proc HPDF_Image_AddSMask*(image: HPDF_Image; smask: HPDF_Image): HPDF_STATUS {.importc.}
proc HPDF_Image_GetSize*(image: HPDF_Image): HPDF_Point {.importc.}
proc HPDF_Image_GetSize2*(image: HPDF_Image; size: ptr HPDF_Point): HPDF_STATUS {.importc.}
proc HPDF_Image_GetWidth*(image: HPDF_Image): HPDF_UINT {.importc.}
proc HPDF_Image_GetHeight*(image: HPDF_Image): HPDF_UINT {.importc.}
proc HPDF_Image_GetBitsPerComponent*(image: HPDF_Image): HPDF_UINT {.importc.}
proc HPDF_Image_GetColorSpace*(image: HPDF_Image): cstring {.importc.}
proc HPDF_Image_SetColorMask*(image: HPDF_Image; rmin: HPDF_UINT; rmax: HPDF_UINT;
                             gmin: HPDF_UINT; gmax: HPDF_UINT; bmin: HPDF_UINT;
                             bmax: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Image_SetMaskImage*(image: HPDF_Image; mask_image: HPDF_Image): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- info dictionary ----------------------------------------------------

proc HPDF_SetInfoAttr*(pdf: HPDF_Doc; `type`: HPDF_InfoType; value: cstring): HPDF_STATUS {.importc.}
proc HPDF_GetInfoAttr*(pdf: HPDF_Doc; `type`: HPDF_InfoType): cstring {.importc.}
proc HPDF_SetInfoDateAttr*(pdf: HPDF_Doc; `type`: HPDF_InfoType; value: HPDF_Date): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- encryption ---------------------------------------------------------

proc HPDF_SetPassword*(pdf: HPDF_Doc; owner_passwd: cstring; user_passwd: cstring): HPDF_STATUS {.importc.}
proc HPDF_SetPermission*(pdf: HPDF_Doc; permission: HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_SetEncryptionMode*(pdf: HPDF_Doc; mode: HPDF_EncryptMode;
                            key_len: HPDF_UINT): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- compression --------------------------------------------------------

proc HPDF_SetCompressionMode*(pdf: HPDF_Doc; mode: HPDF_UINT): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## ----- font ---------------------------------------------------------------

proc HPDF_Font_GetFontName*(font: HPDF_Font): cstring {.importc.}
proc HPDF_Font_GetEncodingName*(font: HPDF_Font): cstring {.importc.}
proc HPDF_Font_GetUnicodeWidth*(font: HPDF_Font; code: HPDF_UNICODE): HPDF_INT {.importc.}
proc HPDF_Font_GetBBox*(font: HPDF_Font): HPDF_Box {.importc.}
proc HPDF_Font_GetAscent*(font: HPDF_Font): HPDF_INT {.importc.}
proc HPDF_Font_GetDescent*(font: HPDF_Font): HPDF_INT {.importc.}
proc HPDF_Font_GetXHeight*(font: HPDF_Font): HPDF_UINT {.importc.}
proc HPDF_Font_GetCapHeight*(font: HPDF_Font): HPDF_UINT {.importc.}
proc HPDF_Font_TextWidth*(font: HPDF_Font; text: ptr HPDF_BYTE; len: HPDF_UINT): HPDF_TextWidth {.importc.}
proc HPDF_Font_MeasureText*(font: HPDF_Font; text: ptr HPDF_BYTE; len: HPDF_UINT;
                           width: HPDF_REAL; font_size: HPDF_REAL;
                           char_space: HPDF_REAL; word_space: HPDF_REAL;
                           wordwrap: HPDF_BOOL; real_width: ptr HPDF_REAL): HPDF_UINT {.importc.}
## --------------------------------------------------------------------------
## ----- attachements -------------------------------------------------------

proc HPDF_AttachFile*(pdf: HPDF_Doc; file: cstring): HPDF_EmbeddedFile {.importc.}
## --------------------------------------------------------------------------
## ----- extended graphics state --------------------------------------------

proc HPDF_CreateExtGState*(pdf: HPDF_Doc): HPDF_ExtGState {.importc.}
proc HPDF_ExtGState_SetAlphaStroke*(ext_gstate: HPDF_ExtGState; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_ExtGState_SetAlphaFill*(ext_gstate: HPDF_ExtGState; value: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_ExtGState_SetBlendMode*(ext_gstate: HPDF_ExtGState; mode: HPDF_BlendMode): HPDF_STATUS {.importc.}
## --------------------------------------------------------------------------
## --------------------------------------------------------------------------

proc HPDF_Page_TextWidth*(page: HPDF_Page; text: cstring): HPDF_REAL {.importc.}
proc HPDF_Page_MeasureText*(page: HPDF_Page; text: cstring; width: HPDF_REAL;
                           wordwrap: HPDF_BOOL; real_width: ptr HPDF_REAL): HPDF_UINT {.importc.}
proc HPDF_Page_GetWidth*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetHeight*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetGMode*(page: HPDF_Page): HPDF_UINT16 {.importc.}
proc HPDF_Page_GetCurrentPos*(page: HPDF_Page): HPDF_Point {.importc.}
proc HPDF_Page_GetCurrentPos2*(page: HPDF_Page; pos: ptr HPDF_Point): HPDF_STATUS {.importc.}
proc HPDF_Page_GetCurrentTextPos*(page: HPDF_Page): HPDF_Point {.importc.}
proc HPDF_Page_GetCurrentTextPos2*(page: HPDF_Page; pos: ptr HPDF_Point): HPDF_STATUS {.importc.}
proc HPDF_Page_GetCurrentFont*(page: HPDF_Page): HPDF_Font {.importc.}
proc HPDF_Page_GetCurrentFontSize*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetTransMatrix*(page: HPDF_Page): HPDF_TransMatrix {.importc.}
proc HPDF_Page_GetLineWidth*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetLineCap*(page: HPDF_Page): HPDF_LineCap {.importc.}
proc HPDF_Page_GetLineJoin*(page: HPDF_Page): HPDF_LineJoin {.importc.}
proc HPDF_Page_GetMiterLimit*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetDash*(page: HPDF_Page): HPDF_DashMode {.importc.}
proc HPDF_Page_GetFlat*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetCharSpace*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetWordSpace*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetHorizontalScalling*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetTextLeading*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetTextRenderingMode*(page: HPDF_Page): HPDF_TextRenderingMode {.importc.}
##  This function is obsolete. Use HPDF_Page_GetTextRise.

proc HPDF_Page_GetTextRaise*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetTextRise*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetRGBFill*(page: HPDF_Page): HPDF_RGBColor {.importc.}
proc HPDF_Page_GetRGBStroke*(page: HPDF_Page): HPDF_RGBColor {.importc.}
proc HPDF_Page_GetCMYKFill*(page: HPDF_Page): HPDF_CMYKColor {.importc.}
proc HPDF_Page_GetCMYKStroke*(page: HPDF_Page): HPDF_CMYKColor {.importc.}
proc HPDF_Page_GetGrayFill*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetGrayStroke*(page: HPDF_Page): HPDF_REAL {.importc.}
proc HPDF_Page_GetStrokingColorSpace*(page: HPDF_Page): HPDF_ColorSpace {.importc.}
proc HPDF_Page_GetFillingColorSpace*(page: HPDF_Page): HPDF_ColorSpace {.importc.}
proc HPDF_Page_GetTextMatrix*(page: HPDF_Page): HPDF_TransMatrix {.importc.}
proc HPDF_Page_GetGStateDepth*(page: HPDF_Page): HPDF_UINT {.importc.}
## --------------------------------------------------------------------------
## ----- GRAPHICS OPERATORS -------------------------------------------------
## --- General graphics state ---------------------------------------------
##  w

proc HPDF_Page_SetLineWidth*(page: HPDF_Page; line_width: HPDF_REAL): HPDF_STATUS {.importc.}
##  J

proc HPDF_Page_SetLineCap*(page: HPDF_Page; line_cap: HPDF_LineCap): HPDF_STATUS {.importc.}
##  j

proc HPDF_Page_SetLineJoin*(page: HPDF_Page; line_join: HPDF_LineJoin): HPDF_STATUS {.importc.}
##  M

proc HPDF_Page_SetMiterLimit*(page: HPDF_Page; miter_limit: HPDF_REAL): HPDF_STATUS {.importc.}
##  d

proc HPDF_Page_SetDash*(page: HPDF_Page; dash_ptn: ptr HPDF_UINT16;
                       num_param: HPDF_UINT; phase: HPDF_UINT): HPDF_STATUS {.importc.}
##  ri --not implemented yet
##  i

proc HPDF_Page_SetFlat*(page: HPDF_Page; flatness: HPDF_REAL): HPDF_STATUS {.importc.}
##  gs

proc HPDF_Page_SetExtGState*(page: HPDF_Page; ext_gstate: HPDF_ExtGState): HPDF_STATUS {.importc.}
## --- Special graphic state operator --------------------------------------
##  q

proc HPDF_Page_GSave*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  Q

proc HPDF_Page_GRestore*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  cm

proc HPDF_Page_Concat*(page: HPDF_Page; a: HPDF_REAL; b: HPDF_REAL; c: HPDF_REAL;
                      d: HPDF_REAL; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
## --- Path construction operator ------------------------------------------
##  m

proc HPDF_Page_MoveTo*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
##  l

proc HPDF_Page_LineTo*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
##  c

proc HPDF_Page_CurveTo*(page: HPDF_Page; x1: HPDF_REAL; y1: HPDF_REAL; x2: HPDF_REAL;
                       y2: HPDF_REAL; x3: HPDF_REAL; y3: HPDF_REAL): HPDF_STATUS {.importc.}
##  v

proc HPDF_Page_CurveTo2*(page: HPDF_Page; x2: HPDF_REAL; y2: HPDF_REAL; x3: HPDF_REAL;
                        y3: HPDF_REAL): HPDF_STATUS {.importc.}
##  y

proc HPDF_Page_CurveTo3*(page: HPDF_Page; x1: HPDF_REAL; y1: HPDF_REAL; x3: HPDF_REAL;
                        y3: HPDF_REAL): HPDF_STATUS {.importc.}
##  h

proc HPDF_Page_ClosePath*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  re

proc HPDF_Page_Rectangle*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL;
                         width: HPDF_REAL; height: HPDF_REAL): HPDF_STATUS {.importc.}
## --- Path painting operator ---------------------------------------------
##  S

proc HPDF_Page_Stroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  s

proc HPDF_Page_ClosePathStroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  f

proc HPDF_Page_Fill*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  f*

proc HPDF_Page_Eofill*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  B

proc HPDF_Page_FillStroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  B*

proc HPDF_Page_EofillStroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  b

proc HPDF_Page_ClosePathFillStroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  b*

proc HPDF_Page_ClosePathEofillStroke*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  n

proc HPDF_Page_EndPath*(page: HPDF_Page): HPDF_STATUS {.importc.}
## --- Clipping paths operator --------------------------------------------
##  W

proc HPDF_Page_Clip*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  W*

proc HPDF_Page_Eoclip*(page: HPDF_Page): HPDF_STATUS {.importc.}
## --- Text object operator -----------------------------------------------
##  BT

proc HPDF_Page_BeginText*(page: HPDF_Page): HPDF_STATUS {.importc.}
##  ET

proc HPDF_Page_EndText*(page: HPDF_Page): HPDF_STATUS {.importc.}
## --- Text state ---------------------------------------------------------
##  Tc

proc HPDF_Page_SetCharSpace*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
##  Tw

proc HPDF_Page_SetWordSpace*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
##  Tz

proc HPDF_Page_SetHorizontalScalling*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
##  TL

proc HPDF_Page_SetTextLeading*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
##  Tf

proc HPDF_Page_SetFontAndSize*(page: HPDF_Page; font: HPDF_Font; size: HPDF_REAL): HPDF_STATUS {.importc.}
##  Tr

proc HPDF_Page_SetTextRenderingMode*(page: HPDF_Page; mode: HPDF_TextRenderingMode): HPDF_STATUS {.importc.}
##  Ts

proc HPDF_Page_SetTextRise*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
##  This function is obsolete. Use HPDF_Page_SetTextRise.

proc HPDF_Page_SetTextRaise*(page: HPDF_Page; value: HPDF_REAL): HPDF_STATUS {.importc.}
## --- Text positioning ---------------------------------------------------
##  Td

proc HPDF_Page_MoveTextPos*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
##  TD

proc HPDF_Page_MoveTextPos2*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
##  Tm

proc HPDF_Page_SetTextMatrix*(page: HPDF_Page; a: HPDF_REAL; b: HPDF_REAL;
                             c: HPDF_REAL; d: HPDF_REAL; x: HPDF_REAL; y: HPDF_REAL): HPDF_STATUS {.importc.}
##  T*

proc HPDF_Page_MoveToNextLine*(page: HPDF_Page): HPDF_STATUS {.importc.}
## --- Text showing -------------------------------------------------------
##  Tj

proc HPDF_Page_ShowText*(page: HPDF_Page; text: cstring): HPDF_STATUS {.importc.}
##  TJ
##  '

proc HPDF_Page_ShowTextNextLine*(page: HPDF_Page; text: cstring): HPDF_STATUS {.importc.}
##  "

proc HPDF_Page_ShowTextNextLineEx*(page: HPDF_Page; word_space: HPDF_REAL;
                                  char_space: HPDF_REAL; text: cstring): HPDF_STATUS {.importc.}
## --- Color showing ------------------------------------------------------
##  cs --not implemented yet
##  CS --not implemented yet
##  sc --not implemented yet
##  scn --not implemented yet
##  SC --not implemented yet
##  SCN --not implemented yet
##  g

proc HPDF_Page_SetGrayFill*(page: HPDF_Page; gray: HPDF_REAL): HPDF_STATUS {.importc.}
##  G

proc HPDF_Page_SetGrayStroke*(page: HPDF_Page; gray: HPDF_REAL): HPDF_STATUS {.importc.}
##  rg

proc HPDF_Page_SetRGBFill*(page: HPDF_Page; r: HPDF_REAL; g: HPDF_REAL; b: HPDF_REAL): HPDF_STATUS {.importc.}
##  RG

proc HPDF_Page_SetRGBStroke*(page: HPDF_Page; r: HPDF_REAL; g: HPDF_REAL; b: HPDF_REAL): HPDF_STATUS {.importc.}
##  k

proc HPDF_Page_SetCMYKFill*(page: HPDF_Page; c: HPDF_REAL; m: HPDF_REAL; y: HPDF_REAL;
                           k: HPDF_REAL): HPDF_STATUS {.importc.}
##  K

proc HPDF_Page_SetCMYKStroke*(page: HPDF_Page; c: HPDF_REAL; m: HPDF_REAL;
                             y: HPDF_REAL; k: HPDF_REAL): HPDF_STATUS {.importc.}
## --- Shading patterns ---------------------------------------------------
##  sh --not implemented yet
## --- In-line images -----------------------------------------------------
##  BI --not implemented yet
##  ID --not implemented yet
##  EI --not implemented yet
## --- XObjects -----------------------------------------------------------
##  Do

proc HPDF_Page_ExecuteXObject*(page: HPDF_Page; obj: HPDF_XObject): HPDF_STATUS {.importc.}
## --- Content streams ----------------------------------------------------

proc HPDF_Page_New_Content_Stream*(page: HPDF_Page; new_stream: ptr HPDF_Dict): HPDF_STATUS {.importc.}
proc HPDF_Page_Insert_Shared_Content_Stream*(page: HPDF_Page;
    shared_stream: HPDF_Dict): HPDF_STATUS {.importc.}
## --- Marked content -----------------------------------------------------
##  BMC --not implemented yet
##  BDC --not implemented yet
##  EMC --not implemented yet
##  MP --not implemented yet
##  DP --not implemented yet
## --- Compatibility ------------------------------------------------------
##  BX --not implemented yet
##  EX --not implemented yet

proc HPDF_Page_DrawImage*(page: HPDF_Page; image: HPDF_Image; x: HPDF_REAL;
                         y: HPDF_REAL; width: HPDF_REAL; height: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_Circle*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL; ray: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_Ellipse*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL; xray: HPDF_REAL;
                       yray: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_Arc*(page: HPDF_Page; x: HPDF_REAL; y: HPDF_REAL; ray: HPDF_REAL;
                   ang1: HPDF_REAL; ang2: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_Page_TextOut*(page: HPDF_Page; xpos: HPDF_REAL; ypos: HPDF_REAL;
                       text: cstring): HPDF_STATUS {.importc.}
proc HPDF_Page_TextRect*(page: HPDF_Page; left: HPDF_REAL; top: HPDF_REAL;
                        right: HPDF_REAL; bottom: HPDF_REAL; text: cstring;
                        align: HPDF_TextAlignment; len: ptr HPDF_UINT): HPDF_STATUS {.importc.}
proc HPDF_Page_SetSlideShow*(page: HPDF_Page; `type`: HPDF_TransitionStyle;
                            disp_time: HPDF_REAL; trans_time: HPDF_REAL): HPDF_STATUS {.importc.}
proc HPDF_ICC_LoadIccFromMem*(pdf: HPDF_Doc; mmgr: HPDF_MMgr; iccdata: HPDF_Stream;
                             xref: HPDF_Xref; numcomponent: cint): HPDF_OutputIntent {.importc.}
proc HPDF_LoadIccProfileFromFile*(pdf: HPDF_Doc; icc_file_name: cstring;
                                 numcomponent: cint): HPDF_OutputIntent {.importc.}
{.pop.}
