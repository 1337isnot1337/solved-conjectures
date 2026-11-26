"""Regression cases for failures the Markdown renderer can accept silently."""

from pathlib import Path
from tempfile import TemporaryDirectory
import unittest

from check_lean_docs import check_document


class LeanDocsTests(unittest.TestCase):
    def check(self, text, path="results/demo/LEAN.md", root=Path.cwd()):
        return list(check_document(root, Path(path), text))

    def test_gfm_table_literal_pipes_in_math_and_code(self):
        header = "| Formula | Meaning |\n| --- | --- |\n"
        for inline in ("$`|A|`$", "`fun | a => a`"):
            self.assertEqual(self.check(header + f"| {inline} | a description |\n")[0][0], 3)
        self.assertFalse(self.check(header + r"| $`\lvert A\rvert`$ | `a \| b` |" + "\n"))
        self.assertEqual(self.check(header + "| one cell |\n")[0][0], 3)

    def test_lean_and_math_fences(self):
        excerpt = "**Lean excerpt**\n\n```lean\n∀ n : Nat, n = n\n```\n"
        self.assertFalse(self.check(excerpt))
        self.assertIn("unclosed lean", self.check(excerpt.removesuffix("```\n"))[0][1])
        self.assertIn("label Lean excerpts", self.check(excerpt.split("\n\n")[1])[0][1])
        self.assertFalse(self.check("```math\nx^2\n```\n"))
        self.assertIn("on separate lines", self.check("```x^2```math\n")[0][1])
        self.assertIn("unclosed math", self.check("```math\nx^2\n")[0][1])

    def test_legacy_math_and_code_literals(self):
        self.assertTrue(self.check(r"Given \(x>0\), ..." + "\n"))
        self.assertTrue(self.check("$$\nx > 0\n$$\n"))
        self.assertFalse(self.check(r'The delimiter `\(` is literal here.' + "\n"))
        self.assertFalse(self.check("Given $`x>0`$, ...\n"))

    def test_github_math_in_proofs_and_supporting_pages(self):
        for path in ("results/example/PROOF.md", "results/example/README.md", "docs/audit.md"):
            for text in (r"Let \(n\) be uniform.", "\\[\nx^2\n\\]\n"):
                with self.subTest(path=path, text=text):
                    self.assertTrue(self.check(text, path))
            valid = "Let $`n`$ be uniform.\n\n```math\nx^2\\tag{1}\n```\n"
            self.assertFalse(self.check(valid, path))
            examples = r"The literal `\(x\)` appears in this source." + "\n\n```tex\n\\[x\\]\n```\n"
            self.assertFalse(self.check(examples, path))

    def test_relative_lean_source_link(self):
        with TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "results/demo").mkdir(parents=True)
            (root / "lean").mkdir()
            (root / "lean/Exists.lean").touch()
            self.assertFalse(self.check("[source](../../lean/Exists.lean#L1)\n", root=root))
            self.assertIn("broken relative Lean source link", self.check(
                "[source](../../lean/Missing.lean)\n", root=root)[0][1])


if __name__ == "__main__":
    unittest.main()
