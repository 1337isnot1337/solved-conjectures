#!/usr/bin/env python3
"""Bounded source-discovery scan, not a complete prior-art audit.

Usage: python3 scan_native_archives.py OUTPUT_DIR ARCHIVE.tar.gz [...]
Searches native UTF-8 files <=20 MB, after Unicode NFKC/casefold.
Binary/PDF, embedded compressed, and larger bodies are excluded explicitly.
"""
import importlib.util
import re
from pathlib import Path

source = Path(__file__).resolve().parents[1] / 'audenaert-norm-compression' / 'scan_native_archives.py'
spec = importlib.util.spec_from_file_location('bounded_source_scan', source)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.PATTERN = re.compile(r'crossed[\s\-–—]{0,5}heinz|0805[.]1954|2611[.]22363|2610[.]04567|bourin.{0,20}(?:question|conjecture)', re.I)

if __name__ == '__main__':
    module.main()
