# Conjectures in combinatorics and number theory

This repository contains **unrefereed** mathematics notes with reproducible checks in Bulgarian solitaire, chromatic symmetric functions, Egyptian fractions, discrete geometry, and integer partitions.

| Result | Target statement | Status | Evidence |
| --- | --- | --- | --- |
| [L-solitaire limit shapes](l-solitaire-limit-shapes/) | Eriksson--Jonsson--Sjoestrand, *Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire* (2020), Conjecture 1 **as published** | Counterexample at the permitted fixed scale `a_n=1`; complementary theorem proves the conjectured implication whenever `a_n -> infinity` | Full [four-page note](l-solitaire-limit-shapes/proof.pdf), [text proof](l-solitaire-limit-shapes/PROOF.md), exact verifier |
| [Denominator degree](pham-denominator-degree/) | Nhung Pham, *Limiting behavior in growth of Bulgarian solitaire orbits* (2022), the **unnumbered exact reduced-denominator degree** conjecture in section 6 | Primitive necklace of length 10 has reduced denominator degree 5 | [Proof](pham-denominator-degree/PROOF.md), exact coefficient certificate and verifier |
| [Li's coefficient-sign prediction](li-coefficient-sign/) | Ethan Y. H. Li, *A quantitative way to e-positivity of trees* (arXiv:2503.09484v2, 2026), Problem 4.9 and the **first** question of Problem 4.6 | An explicit 31-vertex **non-spider** CPET tree has `[e_3e_2^14]X_T = +29`, eight connected triple-plus-pairs partitions, and a degree-4 vertex with only one leaf neighbor | [Proof PDF](li-coefficient-sign/proof.pdf), [text proof](li-coefficient-sign/PROOF.md), [novelty audit](li-coefficient-sign/NOVELTY.md), exact verifiers |
| [Batista’s Egyptian-fraction conjecture](batista-egyptian-fractions/PROOF.md) | David Batista, OEIS A398581, congruence of the exceptional denominators for three-term representations of $5/k$ | Proved. For every admissible $k$ outside the class $1$ modulo $5$, the lexicographically first triple uniquely maximizes the last denominator | [Proof](batista-egyptian-fractions/PROOF.md) and [exact verifier](batista-egyptian-fractions/verify.py) |
| [Line-size sets](erdos-607-line-sizes/PROOF.md) | Václav Kotesovec’s conjectured exponential base for the counting function of Erdős Problem 607 (OEIS A401948) | Sharp asymptotic with an exact leading prefactor. Szemerédi and Trotter previously established the original Erdős bound. | [Proof](erdos-607-line-sizes/PROOF.md) and [exact generating-function verifier](erdos-607-line-sizes/verify.py) |
| [Growing rectangles](rectangle-partition-asymptotics/PROOF.md) | Gajdzica and Zakarczemny, *A note on the partition function of a rectangle*, Remark 5.9, both growing-side predictions | Uniform leading asymptotic for $\log p(h,w)$ over all widths $w\ge h$ as $h$ grows | [Proof](rectangle-partition-asymptotics/PROOF.md) and [packing verifier](rectangle-partition-asymptotics/verify.py) |

## Precise scope

The L-solitaire counterexample relies on the original paper's Definitions 2--4 allowing *positive*, not necessarily diverging, horizontal scaling factors. It does **not** refute the natural corrected assertion for diverging scales. The note supplies a proof of that corrected assertion for all admissible layer sets.

The necklace result refutes **only** Pham's exact-degree guess. It does **not** refute the distinct Harris--Nguyen (2025) conjecture that a necklace and its reverse-complement dual admit a common denominator of degree equal to their period. The included dual calculation is consistent with that conjecture.

The Li example is neither a spider nor a caterpillar and refutes the **non-spider** sign prediction. Earlier spider constructions already refute the unrestricted coefficient assertion; likewise, earlier literature contains trees with two degree-4 vertices. The newly reported result is explicitly limited to the non-spider class, and novelty is provisional pending independent review. This example does **not** refute Dahlberg--She--van Willigenburg's general non-`e`-positivity conjecture.

These are mathematical claims with explicit proofs and computer checks, **not peer-reviewed publications**. A literature search cannot establish that a counterexample or stronger theorem is the first discovery. Please cite the primary publications when discussing the original conjectures.

## How to cite

GitHub's **Cite this repository** control reads [`CITATION.cff`](CITATION.cff).
The authors are credited in order: Cinna Davis, followed by GPT-6.2 Astra (an AI model).

Suggested BibTeX for the repository:

```bibtex
@misc{davis2026bulgariansolitaire,
  author       = {Cinna Davis and {GPT-6.2 Astra}},
  title        = {Conjectures in combinatorics and number theory},
  year         = {2026},
  howpublished = {GitHub repository},
  url          = {https://github.com/1337isnot1337/solved-conjectures},
  note         = {Unrefereed mathematical notes and reproducible verification code}
}
```

When citing an individual result, identify the relevant directory and cite
the original conjecture's publication separately (listed below). No DOI or
peer-reviewed publication is claimed for these notes.

## Verification

All commands require Python 3 and the standard library only.

```bash
python3 l-solitaire-limit-shapes/verify.py
python3 pham-denominator-degree/verify.py
python3 pham-denominator-degree/verify.py --dual --brute-depth 13
(cd pham-denominator-degree && python3 -m unittest discover -s tests -v)
python3 li-coefficient-sign/verify.py
python3 li-coefficient-sign/independent_check.py
python3 batista-egyptian-fractions/verify.py
python3 erdos-607-line-sizes/verify.py
python3 rectangle-partition-asymptotics/verify.py
```

`l-solitaire-limit-shapes/verify.py` is the original embedded PDF attachment, extracted byte-for-byte. The finite search checks all pick-layer sets and integer partitions for deck sizes 1 through 14 and separately verifies the specific counterexample for sizes 1 through 1000. Exhaustive tests do not replace the general argument in the PDF.

`pham-denominator-degree/verify.py` checks a finite certificate of 26 coefficients and applies Pham's *proved* degree bounds to deduce the entire rational-function identity. Optional `--dual` checks a second exact identity.

The Li verifier also checks all 6,842 partition types of 31 and the coefficient `+29` using exact edge-cut and coloring calculations. Its independent parity-based check is included. The original PDF has the verifier embedded as an attachment.

## Primary sources

- Kimmo Eriksson, Markus Jonsson, Jonas Sjoestrand, [*Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire*](https://combinatorialpress.com/article/ojac/vol15/192.pdf), *Online Journal of Analytic Combinatorics* 15 (2020), paper 10. Definitions 2--4, Theorems 3--5, Conjecture 1.
- Nhung Pham, [*Limiting behavior in growth of Bulgarian solitaire orbits*](https://arxiv.org/abs/2208.14496) (2022), Theorem 1.2 and section 6.
- A. J. Harris and Son Nguyen, [*Bulgarian Solitaire: A new representation for depth generating functions*](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf), *Australasian Journal of Combinatorics* 93 (2025), Conjecture 1.1.
- Brian Hopkins, [*Henrik Eriksson's Bulgarian Solitaire Variant*](https://math.colgate.edu/~integers/a9Proc23/a9Proc23.pdf), *INTEGERS* 24A (2024), Theorem 5 (cyclic states for consecutive bottom-layer picking).

- Ethan Y. H. Li, [*A quantitative way to e-positivity of trees*](https://arxiv.org/abs/2503.09484), arXiv:2503.09484v2 (10 February 2026), Section 4, Problems 4.6 and 4.9.
- Kai Zheng, [*On the e-positivity of trees and spiders*](https://doi.org/10.1016/j.jcta.2022.105608), *Journal of Combinatorial Theory, Series A* 189 (2022), Theorem 5.3 (earlier spider coefficient formula).
- Mirko Hornak and Mariusz Wozniak, [*On arbitrarily vertex decomposable trees*](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf), 2006 preprint / *Discrete Mathematics* 308 (2008), 1268--1281 (older spider and two-degree-four-vertex cases).
- Davion Q. B. Tang, David G. L. Wang and Monica M. Y. Wang, [*e-Positive caterpillars have maximum degree at most three*](https://arxiv.org/abs/2610.39481), arXiv:2610.39481v1 (29 October 2026) (caterpillar case).
- David Batista, [OEIS A398581](https://oeis.org/A398581), and Hùng Việt Chu, [Theorem 1.3 on best two-term underapproximations](https://arxiv.org/abs/2306.12564).

- Václav Kotesovec’s [conjectured exponential base](https://oeis.org/A401948) for the counting function in [Erdős Problem 607](https://www.erdosproblems.com/607). The verifier accepts the [10,000-term reference table](https://oeis.org/A401948/b401948.txt) with the option `--table b401948.txt`.
