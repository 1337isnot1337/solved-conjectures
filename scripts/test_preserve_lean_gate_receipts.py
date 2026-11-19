#!/usr/bin/env python3
"""Archive-boundary tests for fixed original Lean evidence preservation."""
import io
import stat
import unittest
import warnings
import zipfile

from preserve_lean_gate_receipts import archive_files


def payload(entries, compression=zipfile.ZIP_DEFLATED):
    stream = io.BytesIO()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", UserWarning)
        with zipfile.ZipFile(stream, "w", compression=compression) as archive:
            for path, raw in entries:
                archive.writestr(path, raw)
    return stream.getvalue()


class EvidenceArchiveTests(unittest.TestCase):
    def test_original_bytes_preserved(self):
        files = {"nested/receipt.json": b'{ "status" : "passed" }\n',
                 "nested/kernel.log": "checked α\n".encode()}
        self.assertEqual(archive_files(payload(files.items())), files)

    def test_duplicate_member_rejected(self):
        with self.assertRaises(RuntimeError):
            archive_files(payload([("receipt.json", b"a"), ("receipt.json", b"b")]))

    def test_parent_escape_rejected(self):
        with self.assertRaises(RuntimeError):
            archive_files(payload([("../receipt.json", b"a")]))

    def test_absolute_member_rejected(self):
        with self.assertRaises(RuntimeError):
            archive_files(payload([("/receipt.json", b"a")]))

    def test_windows_separator_rejected(self):
        with self.assertRaises(RuntimeError):
            archive_files(payload([("nested\\receipt.json", b"a")]))

    def test_symlink_rejected(self):
        info = zipfile.ZipInfo("receipt.json")
        info.create_system = 3
        info.external_attr = (stat.S_IFLNK | 0o777) << 16
        with self.assertRaises(RuntimeError):
            archive_files(payload([(info, b"elsewhere")]))

    def test_unexpected_compression_rejected(self):
        with self.assertRaises(RuntimeError):
            archive_files(payload([("receipt.json", b"a")], compression=zipfile.ZIP_BZIP2))


if __name__ == "__main__":
    unittest.main()
