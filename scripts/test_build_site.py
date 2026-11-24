#!/usr/bin/env python3
"""Regression checks for mathematical scope versus Lean formalization status.
Run with python3 scripts/test_build_site.py. Requires the builder's Pandoc 3.x.
"""
import json
from pathlib import Path
import unittest

from build_site import Builder, Document, Result, landing_lean_status, pandoc, read_markdown
from check_readme_verification import parse_results


def doc(name, markdown):
    ast = read_markdown([], text=markdown)
    return Document(name, '', ast, name, '')


class StatusChecks(unittest.TestCase):
    def builder(self, partial_status='partial', rows=None):
        b = Builder(Path('/tmp/site-status-test'), 'https://example.test/', 1)
        if rows is None:
            rows = '| Frankl generating families | Partial | Checked components; remaining bridges open. |'
        b.documents = {
            'docs/lean-status.md': doc('docs/lean-status.md', '''| Note | Status | Scope |
| --- | --- | --- |
| L-solitaire | Complete | Stated result. |
''' + rows),
            'README.md': doc('README.md', '''| Problem | Lean verification status | Problem | Lean verification status |
| --- | --- | --- | --- |
| **1.** [Solitaire](results/l-solitaire-limit-shapes/) | ✅ | | |
'''),
        }
        results = {
            'l-solitaire-limit-shapes': Result('l-solitaire-limit-shapes', 'Solitaire', 'Games', 'full', 'Result'),
            'frankl-generator-families': Result('frankl-generator-families', 'Frankl', 'Combinatorics', partial_status, 'Restricted classes', scope='partial'),
        }
        return b, results

    def test_partial_math_with_partial_lean_stays_partial_math(self):
        b, results = self.builder()
        b.check_authoritative_statuses(results)
        self.assertEqual(results['frankl-generator-families'].status, 'partial')
        self.assertEqual(results['frankl-generator-families'].scope, 'partial')
        self.assertIn('remaining bridges', results['frankl-generator-families'].checked_scope)

    def test_hadamard_components_keep_open_problem_scope(self):
        b, results = self.builder(rows='| Hadamard order-2396 automorphism obstruction | Partial: arithmetic, coefficient, and Fourier components checked | Assembly and sequence/border obligations remain. |')
        del results['frankl-generator-families']
        source = (Path(__file__).resolve().parents[1] / 'results/hadamard-2396/README.md').read_text()
        results['hadamard-2396'] = Result('hadamard-2396', 'Hadamard', 'Combinatorics', landing_lean_status(source), 'Restricted results', scope='partial')
        b.check_authoritative_statuses(results)
        self.assertEqual(results['hadamard-2396'].status, 'partial')
        self.assertEqual(results['hadamard-2396'].scope, 'partial')
        self.assertIn('obligations remain', results['hadamard-2396'].checked_scope)
        results['hadamard-2396'].status = 'full'
        with self.assertRaisesRegex(ValueError, 'Stale catalogue status'):
            b.check_authoritative_statuses(results)

    def test_partial_math_with_full_formalization_does_not_promote_scope(self):
        b, results = self.builder('full', '| Frankl generating families | Complete | Restricted statement only. |')
        b.check_authoritative_statuses(results)
        self.assertEqual(results['frankl-generator-families'].scope, 'partial')

    def test_partial_formalization_requires_authoritative_receipt(self):
        b, results = self.builder(rows='')
        with self.assertRaisesRegex(ValueError, 'summary mismatch'):
            b.check_authoritative_statuses(results)

    def test_unformalized_partial_math_retains_legacy_support(self):
        b, results = self.builder('none', '')
        b.check_authoritative_statuses(results)

    def test_independent_status_disagreement_still_fails(self):
        b, results = self.builder('none')
        with self.assertRaisesRegex(ValueError, 'Stale catalogue status'):
            b.check_authoritative_statuses(results)

    def test_unknown_or_duplicate_summary_labels_fail(self):
        for rows, error in [
            ('| Unmapped result | Partial | Components |', 'Map the Lean summary label'),
            ('| Frankl generating families | Partial | A |\n| Frankl generating families | Partial | B |', 'Duplicate authoritative'),
        ]:
            with self.subTest(rows=rows):
                b, results = self.builder(rows=rows)
                with self.assertRaisesRegex(ValueError, error):
                    b.check_authoritative_statuses(results)

    def test_landing_status_is_explicit(self):
        self.assertEqual(landing_lean_status('**Lean status:** partial. See checked scope.'), 'partial')
        self.assertEqual(landing_lean_status('pending Lean formalization'), 'none')
        for text in ['Some components exist.', '**Lean status:** maybe. No Lean formalization.']:
            with self.assertRaises(ValueError):
                landing_lean_status(text)


class RankedReadme(unittest.TestCase):
    markdown = """## Results

| Problem | Lean verification status | Problem | Lean verification status |
| --- | --- | --- | --- |
| **1.** [A](results/a/) | ✅ | **3.** [C](results/c/) | ⬜ |
| **1.** [B](results/b/) | 🟡 | | |
"""

    def test_column_major_rank_order_with_ties_and_odd_count(self):
        expected = [(1, "a", "✅"), (1, "b", "🟡"), (3, "c", "⬜")]
        b = Builder(Path('/tmp/ranked-readme-test'), 'https://example.test/', 1)
        b.documents = {"README.md": doc("README.md", self.markdown)}
        self.assertEqual(b.readme_result_entries(), expected)
        self.assertEqual(parse_results("\n" + self.markdown), expected)

    def test_invalid_rank_duplicate_and_missing_pair(self):
        for markdown in [
            self.markdown.replace("**3.**", "**2.**"),
            self.markdown.replace("results/c/", "results/a/"),
            self.markdown.replace("**1.** [B](results/b/) | 🟡", " | "),
            self.markdown.replace("⬜", "Not formalized"),
        ]:
            with self.subTest(markdown=markdown):
                b = Builder(Path('/tmp/ranked-readme-test'), 'https://example.test/', 1)
                b.documents = {"README.md": doc("README.md", markdown)}
                with self.assertRaises(ValueError):
                    b.readme_result_entries()
                with self.assertRaises(ValueError):
                    parse_results("\n" + markdown)


class MathRendering(unittest.TestCase):
    def test_github_math_also_renders_as_mathml(self):
        ast = read_markdown([], text=r"""Write $`|r|_N=\min(r\bmod N,(-r)\bmod N)`$.

```math
\|v\|_2\le B
```
""")
        rendered = pandoc(['--from', 'json', '--to', 'html5', '--mathml'], text=json.dumps(ast))
        self.assertIn('<math display="inline"', rendered)
        self.assertIn('<math display="block"', rendered)
        self.assertIn(r'>|r|_N=\min(r\bmod N,(-r)\bmod N)</annotation>', rendered)
        self.assertIn(r'>\|v\|_2\le B</annotation>', rendered)


if __name__ == '__main__':
    unittest.main()
