# Bulgarian-solitaire conjectures: two audited counterexamples

This repository contains two **unrefereed**, independently reproducible mathematics notes about *different* Bulgarian-solitaire systems.

| Result | Target statement | Status | Evidence |
| --- | --- | --- | --- |
| [L-solitaire limit shapes](l-solitaire-limit-shapes/) | Eriksson--Jonsson--Sjoestrand, *Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire* (2020), Conjecture 1 **as published** | Counterexample at the permitted fixed scale `a_n=1`; complementary theorem proves the conjectured implication whenever `a_n -> infinity` | Full [four-page note](l-solitaire-limit-shapes/proof.pdf), [text proof](l-solitaire-limit-shapes/PROOF.md), exact verifier |
| [Denominator degree](pham-denominator-degree/) | Nhung Pham, *Limiting behavior in growth of Bulgarian solitaire orbits* (2022), the **unnumbered exact reduced-denominator degree** conjecture in section 6 | Primitive necklace of length 10 has reduced denominator degree 5 | [Proof](pham-denominator-degree/PROOF.md), exact coefficient certificate and verifier |

## Precise scope

The L-solitaire counterexample relies on the original paper's Definitions 2--4 allowing *positive*, not necessarily diverging, horizontal scaling factors. It does **not** refute the natural corrected assertion for diverging scales. The note supplies a proof of that corrected assertion for all admissible layer sets.

The necklace result refutes **only** Pham's exact-degree guess. It does **not** refute the distinct Harris--Nguyen (2025) conjecture that a necklace and its reverse-complement dual admit a common denominator of degree equal to their period. The included dual calculation is consistent with that conjecture.

These are mathematical claims with explicit proofs and computer checks, **not peer-reviewed publications**. A literature search cannot establish that a counterexample or stronger theorem is the first discovery. Please cite the primary publications when discussing the original conjectures.

## How to cite

GitHub's **Cite this repository** control reads [`CITATION.cff`](CITATION.cff).
The authors are credited in order: Cinna Davis, followed by GPT-6.2 Astra (an AI model).

Suggested BibTeX for the repository:

```bibtex
@misc{davis2026bulgariansolitaire,
  author       = {Cinna Davis and {GPT-6.2 Astra}},
  title        = {Bulgarian-solitaire conjectures: two counterexamples and verification certificates},
  year         = {2026},
  howpublished = {GitHub repository},
  url          = {https://github.com/1337isnot1337/solved-conjectures},
  note         = {Unrefereed mathematical notes and reproducible verification code}
}
```

When citing one of the two results, identify the relevant directory and cite
the original conjecture's publication separately (listed below). No DOI or
peer-reviewed publication is claimed for these notes.

## Verification

All commands require Python 3 and the standard library only.

```bash
python3 l-solitaire-limit-shapes/verify.py
python3 pham-denominator-degree/verify.py
python3 pham-denominator-degree/verify.py --dual --brute-depth 13
cd pham-denominator-degree && python3 -m unittest discover -s tests -v
```

`l-solitaire-limit-shapes/verify.py` is the original embedded PDF attachment, extracted byte-for-byte. The finite search checks all pick-layer sets and integer partitions for deck sizes 1 through 14 and separately verifies the specific counterexample for sizes 1 through 1000. Exhaustive tests do not replace the general argument in the PDF.

`pham-denominator-degree/verify.py` checks a finite certificate of 26 coefficients and applies Pham's *proved* degree bounds to deduce the entire rational-function identity. Optional `--dual` checks a second exact identity.

## Primary sources

- Kimmo Eriksson, Markus Jonsson, Jonas Sjoestrand, [*Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire*](https://combinatorialpress.com/article/ojac/vol15/192.pdf), *Online Journal of Analytic Combinatorics* 15 (2020), paper 10. Definitions 2--4, Theorems 3--5, Conjecture 1.
- Nhung Pham, [*Limiting behavior in growth of Bulgarian solitaire orbits*](https://arxiv.org/abs/2208.14496) (2022), Theorem 1.2 and section 6.
- A. J. Harris and Son Nguyen, [*Bulgarian Solitaire: A new representation for depth generating functions*](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf), *Australasian Journal of Combinatorics* 93 (2025), Conjecture 1.1.
- Brian Hopkins, [*Henrik Eriksson's Bulgarian Solitaire Variant*](https://math.colgate.edu/~integers/a9Proc23/a9Proc23.pdf), *INTEGERS* 24A (2024), Theorem 5 (cyclic states for consecutive bottom-layer picking).
