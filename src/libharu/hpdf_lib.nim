when defined(windows):
  const hpdfDynlib* = "hpdf.dll"
elif defined(macosx):
  const hpdfDynlib* = "libhpdf(|.2.4).dylib"
else:
  const hpdfDynlib* = "libhpdf.so(|.2.4)"

when defined(windows) and not defined(hpdfCdecl):
  {.pragma: hpdfCall, stdcall.}
else:
  {.pragma: hpdfCall, cdecl.}
