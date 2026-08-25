# libharu

Nim bindings and a small convenience layer for
[libharu](https://github.com/libharu/libharu), a C library for creating PDF
files.

The public binding targets libharu 2.4.6 and is tested on Linux with Nim
1.6.20 and the current stable Nim release. The loader also selects conventional
Windows and macOS library names, but those platforms are not currently covered
by CI.

## Installation

Install libharu before installing this package. On Debian or Ubuntu, the
distribution package can be installed with:

```sh
sudo apt install libhpdf-dev
nimble install libharu
```

Use a libharu 2.4.6 build when calling APIs introduced in that release.

## Example

```nim
import libharu

let pdf = newPdfDoc()
try:
  let page = pdf.addPage()
  let font = pdf.getFont(HPDF_DEF_FONT)
  page.setFont(font, 14)
  page.textOut(40, page.height() - 40, "Hello from libharu")
  pdf.saveToFile("hello.pdf")
finally:
  pdf.free()
```

`newPdfDoc` installs an error callback that only records numeric error data
while C code is running. Convenience procedures raise `HaruError`, including
its `errorNo` and `detailNo`, after control has returned to Nim. Raw `HPDF_*`
procedures retain libharu's status-code behavior.
Custom error callbacks passed to `newPdfDoc` must also return normally and must
not raise an exception across the C call boundary.

Coordinate-based `textOut` calls manage their own text object. For a sequence
of positioned operations, use `beginText` and `endText` explicitly:

```nim
page.beginText()
page.moveTextPos(40, 700)
page.textOut("first line")
page.endText()
```

Every document returned by `newPdfDoc` or `HPDF_New` must eventually be
released with `free` or `HPDF_Free`. `saveToMemory` returns a Nim-owned byte
sequence.

The `libharu/hpdf` module exposes the official `hpdf.h` API. Other generated
modules mirror implementation-oriented libharu headers and are not part of the
2.4.6 public compatibility guarantee.

## Tests

The tests require libharu 2.4.6 plus Poppler's `pdfinfo` and `pdftotext` tools:

```sh
nimble test
```
