import unittest
import
  os, strutils

proc checkFileExist(fileName: string): bool =
  if fileName.fileExists:
    fileName.removeFile
    return true
  return false

import libharu
test "create pdf":
  let
    pdf = newPdfDoc()
    page = pdf.addPage
    fileName = "test.pdf"
  pdf.saveToFile(fileName)
  pdf.free
  check fileName.checkFileExist

test "text out":
  let
    pdf = newPdfDoc()
    page = pdf.addPage
    font = pdf.getFont(HPDF_DEF_FONT)
    fileName = "test.pdf"
  page.setFont(font)
  page.textOut(20, page.height - 20, fileName)
  pdf.saveToFile(fileName)
  pdf.free
  check fileName.checkFileExist

test "unicode text":
  var ttfName = ""
  for ttf in walkFiles("tests/*.ttf"):
    ttfName = ttf
    break
  if ttfName == "":
    echo "put some ttf file in tests dir"
    stdout.write "pass this check?[Y/n]: "
    let
      ipt = stdin.readLine
      res = ipt.toLower != "n"
    check res
  else:
    let
      pdf = newPdfDoc()
      page = pdf.addPage
      fontName = pdf.getFontName(ttfName)
      font = pdf.getFont(fontName, ecUtf8)
      fileName = "test.pdf"
    page.setFont(font)
    page.textOut(20, page.height - 20, "japanese string [テスト文字列]")
    pdf.saveToFile(fileName)
    pdf.free
    check fileName.checkFileExist

test "libharu functions":
  let
    pdf = HPDF_New(nil, nil)
    page = HPDF_AddPage(pdf)
    font = HPDF_GetFont(pdf, HPDF_DEF_FONT, nil)
    fileName = "test.pdf"
  var sts: HPDF_STATUS
  sts = HPDF_Page_SetFontAndSize(page, font, HPDF_DEF_FONTSIZE)
  sts = HPDF_Page_BeginText(page)
  sts = HPDF_Page_TextOut(page, 10, 10, cstring(fileName))
  sts = HPDF_Page_EndText(page)
  sts = HPDF_SaveToFile(pdf, cstring(fileName))
  HPDF_Free(pdf)
  check fileName.checkFileExist
