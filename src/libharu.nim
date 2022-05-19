import
  libharu / hpdf

export
  hpdf

import
  strutils

let
  error_handler: HPDF_Error_Handler = proc(error_no, detail_no: HPDF_STATUS, user_data: pointer) =
    let
      err = cast[ErrorCode](error_no)
      msg = "$1\nerror_no=$2, detail_no=$3" % [$err, err.ord.toHex(4), $detail_no.uint]
    raise newException(Exception, msg)

var
  textBegun: bool

proc newPdfDoc*(errFn = error_handler, userData: pointer = nil): HPDF_Doc =
  return HPDF_New(errFn, userData)

proc saveToFile*(pdf: HPDF_Doc, fileName: string) =
  discard pdf.HPDF_SaveToFile(fileName)

proc addPage*(pdf: HPDF_Doc): HPDF_Page =
  return pdf.HPDF_AddPage

proc beginText*(page: HPDF_Page) =
  if not textBegun:
    textBegun = true
    discard page.HPDF_Page_BeginText

proc endText*(page: HPDF_Page) =
  if textBegun:
    textBegun = false
    discard page.HPDF_Page_EndText

proc textWidth*(page: HPDF_Page, txt: string): float =
  return page.HPDF_Page_TextWidth(txt)

proc moveTextPos*(page: HPDF_Page, x, y: float) =
  page.beginText
  discard page.HPDF_Page_MoveTextPos(x, y)

proc textOut*(page: HPDF_Page, x, y: float, txt: string) =
  page.beginText
  discard page.HPDF_Page_TextOut(x, y, txt)
  page.endText

proc textOut*(page: HPDF_Page, txt: string) =
  page.beginText
  discard page.HPDF_Page_ShowText(txt)

proc textOutCenter*(page: HPDF_Page, x, y: float, txt: string) =
  page.beginText
  let tw = page.textWidth(txt)
  discard page.HPDF_Page_TextOut(x - tw / 2, y, txt)

proc textOutCenter*(page: HPDF_Page, txt: string) =
  page.beginText
  let tw = page.textWidth(txt)
  page.moveTextPos(-tw / 2, 0)
  page.textOut(txt)
  page.moveTextPos(tw / 2, 0)

proc textOutRight*(page: HPDF_Page, x, y: float, txt: string) =
  page.beginText
  let tw = page.textWidth(txt)
  discard page.HPDF_Page_TextOut(x - tw, y, txt)

proc textOutRight*(page: HPDF_Page, txt: string) =
  page.beginText
  let tw = page.textWidth(txt)
  page.moveTextPos(-tw, 0)
  page.textOut(txt)
  page.moveTextPos(tw, 0)

proc width*(page: HPDF_Page): float =
  return page.HPDF_Page_GetWidth

proc height*(page: HPDF_Page): float =
  return page.HPDF_Page_GetHeight

proc getFontName*(pdf: HPDF_Doc, ttfName: string): string =
  return $pdf.HPDF_LoadTTFontFromFile(ttfName, HPDF_TRUE)

proc getFont*(pdf: HPDF_Doc, fontName: string, encoding = ecNone): HPDF_Font =
  if encoding in [ecUtf8]:
    discard pdf.HPDF_UseUTFEncodings
  if encoding == ecNone:
    return pdf.HPDF_GetFont(fontName, nil)
  else:
    return pdf.HPDF_GetFont(fontName, cstring($encoding))

proc setFont*(page: HPDF_Page, font: HPDF_Font, size: float = HPDF_DEF_FONTSIZE) =
  discard page.HPDF_Page_SetFontAndSize(font, size)

proc free*(pdf: HPDF_Doc) =
  pdf.HPDF_Free
