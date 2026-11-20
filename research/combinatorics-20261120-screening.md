# Combinatorics target screening, 20 November 2026

This is a literature-screening record, not a list of new solutions. The current task requires named whole conjectures with no prior resolution, excludes fixed-parameter extensions, and does not request Lean work.

## Rejected targets

| Target | Evidence located | Decision |
| --- | --- | --- |
| Brouwer's conjecture | *On Full Brouwer's Laplacian Conjecture*, arXiv:2607.03388, explicitly attributes the inequality to a 2026 proof by Kothari and Tudose and proves the proposed equality characterization. | Prior full proof reported; exclude. |
| Ashraf–Omidi–Tayfeh-Rezaie conjecture | Yuan–Zhang, *On the Brouwer-type Conjecture for Signless Laplacian Eigenvalues of Graphs*, arXiv:2609.31355, explicitly claims the full inequality and equality characterization. | Prior full proof; exclude. |
| Levit–Mandrescu conjecture | arXiv:2409.00827 claims the very-well-covered unimodality statement, while later public 2026 material reports a counterexample. | Conflicting prior resolution claims; exclude from a new-priority campaign rather than assume an old open-status survey is current. |
| Alikhani–Peng conjecture | Galvin–Zhang (arXiv:2408.12731), Omar (arXiv:2601.14494), and Burcroff–O'Brien (doi:10.1016/j.disc.2023.113508) treat domination-polynomial unimodality as open. Deeper search found an indexed October 2026 preprint by Logan R. Chalmers, *The Alikhani-Peng conjecture is false: arbitrarily many deep peaks and sharp bounds for domination polynomials*. Its abstract asserts a full disproof using connected bounded-degree bipartite graphs. | The prior disproof claim was found after issue #74 was opened; #74 was promptly closed as not planned. Full proof not retrieved or verified here. Do not call this a verified resolution or a new result. |
| Pandey's conjecture | Conjecture 4.1 of arXiv:2601.03293 claims that the independence polynomial of GP(n,k) is real-rooted exactly when k is even. A public June 2026 refutation gives GP(3,1), GP(7,3), and GP(9,2), and an isomorphism between GP(7,2) and GP(7,3). | Already explicitly refuted; exclude. |

## Primary and priority links

- [Brouwer equality characterization](https://arxiv.org/abs/2607.03388).
- [Signless Laplacian proof](https://arxiv.org/abs/2609.31355).
- [Levit–Mandrescu related proof claim](https://arxiv.org/abs/2409.00827).
- [Galvin–Zhang](https://arxiv.org/abs/2408.12731), [Omar](https://arxiv.org/abs/2601.14494), [Burcroff–O'Brien](https://doi.org/10.1016/j.disc.2023.113508).
- [Search-index location of the Chalmers domination preprint](https://www.researchgate.net/topic/Restriction/publications). The dynamically rendered topic page did not expose the indexed entry when opened; the indexed abstract is evidence of a prior claim, not a substitute for a checked paper.
- [Pandey's original statement](https://arxiv.org/abs/2601.03293).
- [Prior Pandey refutation, results item 6](https://github.com/demonstrandum-research/artifacts/blob/main/RESULTS.md). The prior record gives the triangular prism polynomial 1 + 6x + 6x^2 and both directions of the counterexample.
- [Independent priority audit of the Pandey refutation](https://the-omega-institute.github.io/trureturing-mdbook/Library/GraphInvariants/pandey2026parity.html).

## Active mathematical work

[Chow's conjecture](chow/proof.md), tracked in [issue #77](https://github.com/1337isnot1337/solved-conjectures/issues/77), has a short complete deduction from the stronger refined interlacing theorem of Savage–Visontai. The note proves strict consecutive interlacing for n >= 3 and the weak n = 2 case. Independent exact checks are in [verify.py](chow/verify.py). The priority audit must decide how to describe a statement that recent sources still call open but that follows immediately from already published stronger results. It should not be represented as a new compatibility method.

Searches used both search engines and exact names, statement variants, proof/counterexample terms, current-year qualifiers, primary paper full text, and named specialist catalogues. A no-hit search is not a guarantee of global novelty.
