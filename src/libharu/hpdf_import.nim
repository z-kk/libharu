when defined(windows) and not defined(hpdfCdecl):
  {.push dynlib: hpdfDynlib, stdcall.}
else:
  {.push dynlib: hpdfDynlib, cdecl.}
