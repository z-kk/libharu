# libharu [![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png)](https://github.com/yglukhov/nimble-tag)
nim library for libharu

## Usage

install hpdf library

```
# apt install libhpdf-dev
$ nimble install libharu
```

nim source

```nim
import libharu
## you can use libharu functions
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

## or original nim functions written to libharu.nim
let
  pdf = newPdfDoc()
  page = pdf.addPage
  font = pdf.getFont(HPDF_DEF_FONT)
  fileName = "test.pdf"
page.setFont(font)
page.textOut(10, 10, fileName)
pdf.saveToFile(fileName)
pdf.free
```
