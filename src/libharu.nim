import libharu/hpdf
export hpdf

import strutils
include libharu/hpdf_lib

type
  HaruError* = object of CatchableError
    errorNo*: HPDF_STATUS
    detailNo*: HPDF_STATUS

  PendingHpdfError = object
    errorNo: HPDF_STATUS
    detailNo: HPDF_STATUS

var pendingHpdfError {.threadvar.}: PendingHpdfError

proc captureError(errorNo, detailNo: HPDF_STATUS; userData: pointer)
    {.hpdfCall, gcsafe, raises: [].} =
  pendingHpdfError.errorNo = errorNo
  pendingHpdfError.detailNo = detailNo

let errorHandler: HPDF_Error_Handler = captureError

proc clearPendingError() =
  pendingHpdfError = default(PendingHpdfError)

proc raiseHpdfError(errorNo, detailNo: HPDF_STATUS) {.noreturn.} =
  let message = "libharu error 0x$1 (detail $2)" %
    [errorNo.uint.toHex(4), $detailNo.uint]
  var exception = newException(HaruError, message)
  exception.errorNo = errorNo
  exception.detailNo = detailNo
  raise exception

proc checkCall(status: HPDF_STATUS = HPDF_OK) =
  let captured = pendingHpdfError
  clearPendingError()
  if captured.errorNo != HPDF_OK:
    raiseHpdfError(captured.errorNo, captured.detailNo)
  if status != HPDF_OK:
    raiseHpdfError(status, 0)

proc newPdfDoc*(errFn: HPDF_Error_Handler = errorHandler;
                userData: pointer = nil): HPDF_Doc =
  clearPendingError()
  result = HPDF_New(errFn, userData)
  if pendingHpdfError.errorNo != HPDF_OK:
    checkCall()
  if result.isNil:
    raiseHpdfError(HPDF_STATUS(INVALID_DOCUMENT.ord), 0)

proc saveToFile*(pdf: HPDF_Doc; fileName: string) =
  clearPendingError()
  checkCall(pdf.HPDF_SaveToFile(fileName))

proc saveToMemory*(pdf: HPDF_Doc): seq[byte] =
  clearPendingError()
  checkCall(pdf.HPDF_SaveToStream())

  clearPendingError()
  var remaining = pdf.HPDF_GetStreamSize()
  checkCall()
  result = newSeq[byte](remaining.int)
  if remaining == 0:
    return

  clearPendingError()
  checkCall(pdf.HPDF_ResetStream())
  clearPendingError()
  checkCall(pdf.HPDF_ReadFromStream(addr result[0], addr remaining))
  result.setLen(remaining.int)

proc addPage*(pdf: HPDF_Doc): HPDF_Page =
  clearPendingError()
  result = pdf.HPDF_AddPage()
  checkCall()
  if result.isNil:
    raiseHpdfError(HPDF_STATUS(INVALID_PAGE.ord), 0)

proc beginText*(page: HPDF_Page) =
  clearPendingError()
  checkCall(page.HPDF_Page_BeginText())

proc endText*(page: HPDF_Page) =
  clearPendingError()
  checkCall(page.HPDF_Page_EndText())

proc textWidth*(page: HPDF_Page; text: string): float =
  clearPendingError()
  result = page.HPDF_Page_TextWidth(text)
  checkCall()

proc moveTextPos*(page: HPDF_Page; x, y: float) =
  clearPendingError()
  checkCall(page.HPDF_Page_MoveTextPos(x, y))

proc textOut*(page: HPDF_Page; x, y: float; text: string) =
  page.beginText()
  try:
    clearPendingError()
    checkCall(page.HPDF_Page_TextOut(x, y, text))
  finally:
    page.endText()

proc textOut*(page: HPDF_Page; text: string) =
  clearPendingError()
  checkCall(page.HPDF_Page_ShowText(text))

proc textOutCenter*(page: HPDF_Page; x, y: float; text: string) =
  let textWidth = page.textWidth(text)
  page.textOut(x - textWidth / 2, y, text)

proc textOutCenter*(page: HPDF_Page; text: string) =
  let textWidth = page.textWidth(text)
  page.moveTextPos(-textWidth / 2, 0)
  page.textOut(text)
  page.moveTextPos(textWidth / 2, 0)

proc textOutRight*(page: HPDF_Page; x, y: float; text: string) =
  page.textOut(x - page.textWidth(text), y, text)

proc textOutRight*(page: HPDF_Page; text: string) =
  let textWidth = page.textWidth(text)
  page.moveTextPos(-textWidth, 0)
  page.textOut(text)
  page.moveTextPos(textWidth, 0)

proc width*(page: HPDF_Page): float =
  clearPendingError()
  result = page.HPDF_Page_GetWidth()
  checkCall()

proc height*(page: HPDF_Page): float =
  clearPendingError()
  result = page.HPDF_Page_GetHeight()
  checkCall()

proc getFontName*(pdf: HPDF_Doc; ttfName: string): string =
  clearPendingError()
  let fontName = pdf.HPDF_LoadTTFontFromFile(ttfName, HPDF_TRUE)
  checkCall()
  if fontName.isNil:
    raiseHpdfError(HPDF_STATUS(INVALID_DOCUMENT_STATE.ord), 0)
  result = $fontName

proc getFont*(pdf: HPDF_Doc; fontName: string;
              encoding = ecNone): HPDF_Font =
  if encoding == ecUtf8:
    clearPendingError()
    checkCall(pdf.HPDF_UseUTFEncodings())

  clearPendingError()
  if encoding == ecNone:
    result = pdf.HPDF_GetFont(fontName, nil)
  else:
    result = pdf.HPDF_GetFont(fontName, cstring($encoding))
  checkCall()
  if result.isNil:
    raiseHpdfError(HPDF_STATUS(INVALID_DOCUMENT_STATE.ord), 0)

proc setFont*(page: HPDF_Page; font: HPDF_Font;
              size: float = HPDF_DEF_FONTSIZE) =
  clearPendingError()
  checkCall(page.HPDF_Page_SetFontAndSize(font, size))

proc free*(pdf: HPDF_Doc) =
  clearPendingError()
  pdf.HPDF_Free()
  checkCall()
