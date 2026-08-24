import os, osproc, strutils, unittest

import libharu

const
  outputPath = "tests/libharu-test.pdf"
  expectedText = "libharu Nim binding test"

proc asString(data: openArray[byte]): string =
  result = newString(data.len)
  if data.len > 0:
    copyMem(addr result[0], unsafeAddr data[0], data.len)

proc checkPdfHeader(data: openArray[byte]) =
  check data.len > 8
  check data.asString().startsWith("%PDF-")

static:
  doAssert sizeof(HPDF_UINT64) == 8
  doAssert sizeof(HPDF_DashMode) == 40
  doAssert sizeof(HPDF_3DMatrix) == 48
  doAssert sizeof(HPDF_PDFAType) == sizeof(cint)
  doAssert sizeof(HPDF_PDFVer) == sizeof(cint)
  doAssert HPDF_VERSION_ID == 20406
  doAssert ord(HPDF_PDFA_4F) == 10
  doAssert ord(HPDF_VER_20) == 6
  doAssert ord(HPDF_ANNOT_WIDGET) == 17

suite "libharu 2.4.6 binding":
  test "reports the runtime version":
    check $HPDF_GetVersion() == "2.4.6"

  test "writes text to file and memory":
    if outputPath.fileExists():
      outputPath.removeFile()
    defer:
      if outputPath.fileExists():
        outputPath.removeFile()

    let pdf = newPdfDoc()
    defer: pdf.free()
    let page = pdf.addPage()
    let font = pdf.getFont(HPDF_DEF_FONT)
    page.setFont(font, 14)
    page.textOut(40, page.height() - 40, expectedText)

    pdf.saveToFile(outputPath)
    check outputPath.fileExists()
    outputPath.readFile().toOpenArrayByte(0, outputPath.getFileSize().int - 1)
      .checkPdfHeader()

    let memoryPdf = pdf.saveToMemory()
    memoryPdf.checkPdfHeader()

    let info = execCmdEx("pdfinfo " & outputPath.quoteShell())
    check info.exitCode == 0
    check info.output.contains("Pages:")
    check info.output.contains("1")
    check info.output.contains("Haru Free PDF Library 2.4.6")

    let extracted = execCmdEx("pdftotext " & outputPath.quoteShell() & " -")
    check extracted.exitCode == 0
    check extracted.output.contains(expectedText)

  test "raises a catchable error after a C call returns":
    let pdf = newPdfDoc()
    defer: pdf.free()
    let page = pdf.addPage()
    var caught = false
    try:
      page.endText()
    except HaruError as error:
      caught = true
      check error.errorNo == HPDF_STATUS(PAGE_INVALID_GMODE.ord)
      check error.detailNo == 0
    check caught

  test "keeps interleaved page text state independent":
    let firstPdf = newPdfDoc()
    defer: firstPdf.free()
    let secondPdf = newPdfDoc()
    defer: secondPdf.free()

    let firstPage = firstPdf.addPage()
    let secondPage = secondPdf.addPage()
    firstPage.setFont(firstPdf.getFont(HPDF_DEF_FONT))
    secondPage.setFont(secondPdf.getFont(HPDF_DEF_FONT))

    firstPage.beginText()
    firstPage.moveTextPos(30, 30)
    secondPage.beginText()
    secondPage.moveTextPos(40, 40)
    firstPage.textOut("first document")
    secondPage.textOut("second document")
    secondPage.endText()
    firstPage.endText()

    firstPdf.saveToMemory().checkPdfHeader()
    secondPdf.saveToMemory().checkPdfHeader()

  test "exposes representative 2.4.6 public API":
    let pdf = newPdfDoc()
    defer: pdf.free()
    let page = pdf.addPage()

    check HPDF_GetDocMMgr(pdf) != nil
    check HPDF_GetPageMMgr(page) != nil
    check HPDF_Page_SetBoundary(page, HPDF_PAGE_CROPBOX, 0, 0, 300, 400) == HPDF_OK
    var dash = [HPDF_REAL(2), HPDF_REAL(1)]
    check HPDF_Page_SetDash(page, addr dash[0], dash.len.HPDF_UINT,
                           HPDF_REAL(0)) == HPDF_OK

    let widget = HPDF_Page_CreateWidgetAnnot(
      page, HPDF_Rect(left: 10, bottom: 10, right: 30, top: 30))
    check widget != nil

    let shading = HPDF_Shading_New(pdf, HPDF_SHADING_FREE_FORM_TRIANGLE_MESH,
      HPDF_CS_DEVICE_RGB, 0, 100, 0, 100)
    check shading != nil
    check HPDF_Shading_AddVertexRGB(shading,
      HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_NO_CONNECTION, 0, 0, 255, 0, 0) == HPDF_OK
    check HPDF_Shading_AddVertexRGB(shading,
      HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_NO_CONNECTION, 100, 0, 0, 255, 0) == HPDF_OK
    check HPDF_Shading_AddVertexRGB(shading,
      HPDF_FREE_FORM_TRI_MESH_EDGEFLAG_NO_CONNECTION, 0, 100, 0, 0, 255) == HPDF_OK
    check HPDF_Page_SetShading(page, shading) == HPDF_OK
