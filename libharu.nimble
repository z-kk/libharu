# Package

version       = "0.2.0"
author        = "z-kk"
description   = "library for libharu"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task test, "Run the deterministic binding tests":
  exec "nim c -r tests/test_libharu.nim"
