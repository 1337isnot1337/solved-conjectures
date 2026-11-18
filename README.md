# Conjectures in combinatorics and number theory

This repository contains **unrefereed** mathematics notes with reproducible checks in Bulgarian solitaire, chromatic symmetric functions, Egyptian fractions, discrete geometry, integer partitions, distance graphs, and combinatorial games.

| Result | Finding | Lean | Evidence |
| :--- | :--- | :---: | :--- |
| [L-solitaire limit shapes](l-solitaire-limit-shapes/) | Eriksson–Jonsson–Sjoestrand (2020), Conj. 1: fixed-scale counterexample (`a_n = 1`). | ☑ | [Lean](l-solitaire-limit-shapes/lean/) · [Proof](l-solitaire-limit-shapes/proof.pdf) |
| [Denominator degree](pham-denominator-degree/) | Pham (2022), §6: primitive period-10 necklace with reduced denominator degree 5. | ◐ | [Proof](pham-denominator-degree/PROOF.md) · [Check](pham-denominator-degree/verify.py) |
| [Li's coefficient-sign prediction](li-coefficient-sign/) | Li (2026), Problems 4.9 and 4.6 (first question): 31-vertex non-spider tree with `[e_3e_2^14]X_T = +29`. | ☐ | [Proof](li-coefficient-sign/PROOF.md) · [Check](li-coefficient-sign/verify.py) |
| [Batista's Egyptian fractions](batista-egyptian-fractions/PROOF.md) | OEIS A398581: the lexicographically first triple uniquely maximizes the last denominator for admissible `k ≢ 1 (mod 5)`. | ☑ | [Proof](batista-egyptian-fractions/PROOF.md) · [Check](batista-egyptian-fractions/verify.py) |
| [Line-size sets](erdos-607-line-sizes/PROOF.md) | Erdős Problem 607 / OEIS A401948: sharp counting asymptotic with exact leading prefactor. | ☐ | [Proof](erdos-607-line-sizes/PROOF.md) · [Check](erdos-607-line-sizes/verify.py) |
| [Growing rectangles](rectangle-partition-asymptotics/PROOF.md) | Gajdzica–Zakarczemny, Remark 5.9: uniform asymptotic for `log p(h,w)` as `h → ∞`, `w ≥ h`. | ☐ | [Proof](rectangle-partition-asymptotics/PROOF.md) · [Check](rectangle-partition-asymptotics/verify.py) |
| [Three-player War](spivey-multiplayer-war/PROOF.md) | Spivey (2010), Q5: three winner-first conventions admit cycles with all three players active. | ☑ | [Proof](spivey-multiplayer-war/PROOF.md) · [Check](spivey-multiplayer-war/verify.py) |
| [CUT Family B](cut-family-b/PROOF.md) | Ellis–Thanatipanonda (2022), Conj. 2: nim-sequence matches the base game iff the least odd cut above 1 exceeds three times the least even cut. | ◐ | [Proof](cut-family-b/PROOF.md) · [Check](cut-family-b/verify.py) |
| [CUT with a preperiod](cut-arithmetic-periodicity/PROOF.md) | Dailly et al., Open Problem 4: finite arithmetic-periodicity test; both examples have preperiod 6, period 12, saltus 8. | ◐ | [Proof](cut-arithmetic-periodicity/PROOF.md) · [Check](cut-arithmetic-periodicity/verify.py) |
| [Distance graphs with three missing differences](distance-graph-densities/PROOF.md) | Carraher et al., arXiv Conjecture 38 proved for all admissible parameters. Conjecture 39 fails for every `k=50,59,68,…`. The [corrected formula](distance-graph-densities/CLASSIFICATION.md) gives all densities for gaps five and seven. | ☐ | [Strip verifier](distance-graph-densities/verify.cpp) and [counterexample verifier](distance-graph-densities/counterexample.py) |
| [Two-difference Motzkin density](two-difference-motzkin/PROOF.md) | The exact character formula for any pair in any compact abelian group, including noncyclic finite subgroups. The cyclic maximum-independent-set problem has a prior 2026 solution. | ☐ | [Proof](two-difference-motzkin/PROOF.md) and [finite checks](two-difference-motzkin/verify.py) |
| [Liu–Zhu packing and Natalchenko–Sagdeev covering](symmetric-four-point-density/PROOF.md) | Sharp densities for every symmetric four-point set of integers. For odd coprime steps the proof determines the longest interval that can be covered exactly once. | ☐ | [Proof](symmetric-four-point-density/PROOF.md) and [finite checks](symmetric-four-point-density/verify.py) |
| [Packing with two nonmixed gaps](nonmixed-gap-packing/PROOF.md) | Natalchenko–Sagdeev’s main packing conjecture for arbitrary gap counts. The same formula gives the circle parameter in their Section 4 question. | ☐ | [Proof](nonmixed-gap-packing/PROOF.md) and [finite checks](nonmixed-gap-packing/verify.py) |
| [Haralambis’s three-difference conjecture](haralambis-three-differences/PROOF.md) | For every triple of positive integer differences, the extremal density equals the circle rotation bound. One pair sum is a period of an optimal set. | ☐ | [Proof](haralambis-three-differences/PROOF.md) and [certificate checks](haralambis-three-differences/verify.py) |
| [Five-speed Loneliness Spectrum Conjecture](five-speed-spectrum/PROOF.md) | The values below 1/5 are exactly s/(5s+1) for positive integers s. Cordella’s twelve sporadic primitive quintuples exhaust the exceptions to the two known families. | ☐ | [Proof](five-speed-spectrum/PROOF.md) and [exhaustive verifier](five-speed-spectrum/verify.py) |
| [Tight six-speed sets and seven-coordinate critical subtori](tight-six-speeds/PROOF.md) | The consecutive set is the unique primitive six-speed equality case. The seven-coordinate critical plane is unique up to signs and permutations. | ☐ | [Proof](tight-six-speeds/PROOF.md) and [exhaustive verifier](tight-six-speeds/verify.py) |

☑ Lean formalization of the stated result · ◐ Partial formalization with explicit remaining dependencies · ☐ No Lean formalization

See [Lean verification status and reproduction](LEAN_VERIFICATION.md) for the exact statements and remaining gaps. The War result now includes kernel-checked first-return periods of 90, 180, and 19,320 turns and a proof that all three players remain active forever. Partial entries do not assert that the full conjecture has been Lean verified.

## Precise scope

The L-solitaire counterexample relies on the original paper's Definitions 2--4 allowing *positive*, not necessarily diverging, horizontal scaling factors. It does **not** refute the natural corrected assertion for diverging scales. The note supplies a proof of that corrected assertion for all admissible layer sets.

The necklace result refutes **only** Pham's exact-degree guess. It does **not** refute the distinct Harris--Nguyen (2025) conjecture that a necklace and its reverse-complement dual admit a common denominator of degree equal to their period. The included dual calculation is consistent with that conjecture.

The Li example is neither a spider nor a caterpillar and refutes the **non-spider** sign prediction. Earlier spider constructions already refute the unrestricted coefficient assertion; likewise, earlier literature contains trees with two degree-4 vertices. The newly reported result is explicitly limited to the non-spider class, and novelty is provisional pending independent review (see the [novelty audit](li-coefficient-sign/NOVELTY.md)). This example does **not** refute Dahlberg--She--van Willigenburg's general non-`e`-positivity conjecture.

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
python3 spivey-multiplayer-war/verify.py
python3 cut-family-b/verify.py
python3 cut-arithmetic-periodicity/verify.py
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
