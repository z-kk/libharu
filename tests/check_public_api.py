#!/usr/bin/env python3
"""Compare the Nim public surface with hpdf.h and resolve every C symbol."""

import ctypes
import pathlib
import re
import sys


if len(sys.argv) != 3:
    raise SystemExit("usage: check_public_api.py <hpdf.h> <libhpdf>")

header = pathlib.Path(sys.argv[1]).read_text()
binding = pathlib.Path("src/libharu/hpdf.nim").read_text()

header_names = set(
    re.findall(
        r"HPDF_EXPORT\s*\([^)]*\)\s*(HPDF_[A-Za-z0-9_]+)\s*\(",
        header,
        re.DOTALL,
    )
)
binding_names = set(
    re.findall(r"\bproc\s+(HPDF_[A-Za-z0-9_]+)\*?\s*\(", binding)
)

missing = sorted(header_names - binding_names)
extra = sorted(binding_names - header_names)
if missing or extra:
    raise SystemExit(f"public API mismatch: missing={missing}, extra={extra}")

library = ctypes.CDLL(sys.argv[2])
unresolved = [name for name in sorted(header_names) if not hasattr(library, name)]
if unresolved:
    raise SystemExit(f"unresolved public symbols: {unresolved}")

print(f"verified {len(header_names)} public libharu symbols")
