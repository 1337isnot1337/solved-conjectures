"""Regression cases for failures the Markdown renderer can accept silently."""

from pathlib import Path
from tempfile import TemporaryDirectory
import unittest

from check_lean_docs import check_document, repair_document


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

    def test_fix_rewrites_legacy_delimiters_only_in_prose(self):
        source = ("Let \\(n\\ge1\\) and `\\(code\\)` stay.\n\n"
                  "\\[\nx^2\\tag{1}\n\\]\n\n"
                  "```tex\n\\(kept\\)\n```\n\n"
                  "- item with \\( a_i \\) and \\(b\\).\n")
        expected = ("Let $`n\\ge1`$ and `\\(code\\)` stay.\n\n"
                    "```math\nx^2\\tag{1}\n```\n\n"
                    "```tex\n\\(kept\\)\n```\n\n"
                    "- item with $`a_i`$ and $`b`$.\n")
        fixed = repair_document(source)
        self.assertEqual(fixed, expected)
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        self.assertEqual(repair_document(fixed), fixed)

    def test_fix_leaves_what_it_cannot_express(self):
        for source in ("An unmatched \\( stays.\n", "Run-in display \\[x\\] stays.\n",
                       "Backtick \\(a`b\\) stays.\n"):
            with self.subTest(source=source):
                self.assertEqual(repair_document(source), source)
                self.assertTrue(self.check(source, "results/example/PROOF.md"))

    def test_fix_repairs_displays_that_markdown_splits(self):
        # A line starting with >, + or = turns the rest of a display into a
        # blockquote, list or heading, so its delimiters land in different blocks.
        for line in (">0.", "   + b^2", "="):
            with self.subTest(line=line):
                source = f"so\n\\[\na\n{line}\n\\]\nThen.\n"
                fixed = repair_document(source)
                self.assertEqual(fixed, f"so\n```math\na\n{line}\n```\nThen.\n")
                self.assertFalse(self.check(fixed, "results/example/PROOF.md"))

    def test_fix_keeps_a_display_whose_fence_would_leave_its_container(self):
        source = "- item\n  \\[\nx\n  \\]\n"
        self.assertEqual(repair_document(source), source)
        self.assertTrue(self.check(source, "results/example/PROOF.md"))

    def test_fix_restores_tex_commands_damaged_by_string_escapes(self):
        source = "Let $`\x0crac12<\x07lpha`$ and\n\n```math\n\x08eta\x0b\n```\n"
        self.assertTrue(self.check(source, "results/example/PROOF.md"))
        fixed = repair_document(source)
        self.assertEqual(fixed, "Let $`\\frac12<\\alpha`$ and\n\n```math\n\\beta\\v\n```\n")
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))

    def test_math_github_rejects(self):
        fence = "```math\n\\operatorname{rank}M<n\n```\n"
        messages = [message for _, message in self.check(fence, "results/example/PROOF.md")]
        self.assertEqual(len(messages), 2)
        fixed = repair_document(fence)
        self.assertEqual(fixed, "```math\n\\mathop{\\mathrm{rank}}M\\lt n\n```\n")
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        inline = "Here $`\\operatorname{per}A<n`$ holds.\n"
        self.assertTrue(self.check(inline, "results/example/PROOF.md"))
        self.assertEqual(repair_document(inline), "Here $`\\mathop{\\mathrm{per}}A<n`$ holds.\n")
        tagged = "```math\n\\begin{aligned}\na&=b\\\\\n&=c. \\tag{1}\n\\end{aligned}\n```\n"
        self.assertTrue(self.check(tagged, "results/example/PROOF.md"))
        fixed = repair_document(tagged)
        self.assertEqual(fixed, "```math\n\\begin{aligned}\na&=b\n\\\\ &=c.\n\\end{aligned} \\tag{1}\n```\n")
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        self.assertEqual(repair_document(fixed), fixed)
        self.assertEqual(repair_document("$`\\operatorname*{arg\\,min}_x f`$\n"),
                         "$`\\mathop{\\mathrm{arg\\,min}}_x f`$\n")
        for source in ("$`\\operatorname{\\mathrm{tr}}A`$\n",
                       "```math\n\\begin{aligned}a&=b\\tag{1}\\\\c&=d\\tag{2}\\end{aligned}\n```\n"):
            with self.subTest(source=source):
                self.assertEqual(repair_document(source), source)
                self.assertTrue(self.check(source, "results/example/PROOF.md"))

    def test_fix_leaves_code_alone(self):
        for source in ("Use `\\operatorname{x}` and `a<b`.\n",
                       "```tex\n\\operatorname{x}<y\n\\[\nz\n\\]\n```\n",
                       "    \\(indented code\\)\n"):
            with self.subTest(source=source):
                self.assertEqual(repair_document(source), source)

    def test_single_dollar_math_github_escapes(self):
        source = "Let $\\{0,1\\}^n$ and $\\int f\\,dx$ hold, with $x_1$ and $5 or $10.\n"
        self.assertEqual(len(self.check(source, "results/example/PROOF.md")), 2)
        fixed = repair_document(source)
        self.assertEqual(fixed, "Let $`\\{0,1\\}^n`$ and $`\\int f\\,dx`$ hold, with $x_1$ and $5 or $10.\n")
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        self.assertEqual(repair_document(fixed), fixed)
        named = "So $D=\\operatorname{diag}(x)$ holds.\n"
        self.assertEqual(repair_document(named), "So $`D=\\mathop{\\mathrm{diag}}(x)`$ holds.\n")
        adjacent = "Both $`a`$$`b`$ and `$\\{x\\}$` stay.\n"
        self.assertEqual(repair_document(adjacent), adjacent)
        self.assertFalse(self.check(adjacent, "results/example/PROOF.md"))

    def test_double_dollar_displays_become_fences(self):
        for source, expected in (
                ("Then\n$$\na=b\\\\\nc=d\n$$\nso.\n", "Then\n```math\na=b\n\\\\ c=d\n```\nso.\n"),
                ("$$x^2 \\tag{1}$$\n", "```math\nx^2 \\tag{1}\n```\n"),
                ("$$a\n=b$$\n", "```math\na\n=b\n```\n"),
                ("> $$\n> x\n> $$\n", "> ```math\n> x\n> ```\n")):
            with self.subTest(source=source):
                self.assertTrue(self.check(source, "results/example/PROOF.md"))
                fixed = repair_document(source)
                self.assertEqual(fixed, expected)
                self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        inline = "We have $$x$$ here.\n"
        self.assertEqual(repair_document(inline), inline)
        self.assertTrue(self.check(inline, "results/example/PROOF.md"))

    def test_row_breaks_move_to_the_next_line(self):
        source = "```math\n\\begin{aligned}\na&=b\\\\\n&=c\\\\\n\\end{aligned}\n```\n"
        self.assertTrue(self.check(source, "results/example/PROOF.md"))
        fixed = repair_document(source)
        self.assertEqual(fixed, "```math\n\\begin{aligned}\na&=b\n\\\\ &=c\n\\\\ \\end{aligned}\n```\n")
        self.assertFalse(self.check(fixed, "results/example/PROOF.md"))
        quoted = "> ```math\n> a\\\\\\\\\n>   b\\\\\n> ```\n"
        self.assertEqual(repair_document(quoted), "> ```math\n> a\n>   \\\\ \\\\ b\n> ```\n")

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
