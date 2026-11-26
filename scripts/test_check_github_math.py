"""Regressions for formula loss at the Markdown and browser rendering stages."""

from unittest import TestCase, main
from unittest.mock import patch

from check_github_math import check_document


class GitHubMathTests(TestCase):
    @patch('check_github_math.github_markdown')
    def test_type_order_and_tex_reach_github(self, render):
        source = 'Write $`x<y`$.\n\n```math\nA=\\{a\\}\n```\n'
        inline = '<math-renderer class="js-inline-math">$x&amp;lt;y$</math-renderer>'
        display = r'<math-renderer class="js-display-math">$$A=\{a\}$$</math-renderer>'
        render.return_value = inline + display
        self.assertIsNone(check_document(source))
        for broken in (inline, display + inline, inline + display.replace(r'\{', '{')):
            with self.subTest(broken=broken):
                render.return_value = broken
                self.assertIn('formula', check_document(source))

    def test_browser_rejections_in_recognized_math(self):
        for tex in (r'\operatorname{Var}(X)', r'\begin{aligned}x&=y\tag{2}\end{aligned}', 'x<y'):
            with self.subTest(tex=tex):
                self.assertIsNotNone(check_document(f'```math\n{tex}\n```\n'))
        self.assertIsNone(check_document(r'Literal example: `\operatorname{Var}`.'))


if __name__ == '__main__':
    main()
