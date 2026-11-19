# Solved conjectures in combinatorics and number theory

[![Lean proofs and certificates](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean.yml/badge.svg?branch=main)](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean.yml?query=branch%3Amain)
[![Computational verification](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/verify.yml/badge.svg?branch=main)](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/verify.yml?query=branch%3Amain)

Mathematical proofs, counterexamples, and partial results in combinatorics, number theory, graph theory, and discrete geometry. Includes Lean 4 formalizations and reproducible verification code.

Curated by [Cinna Davis](https://1337isnot1337.github.io/) and GPT-6.2 Astra. External contributions have separate result-level credit.

[Search the collection](https://1337isnot1337.github.io/solved-conjectures/) · [Full catalogue](CONTENTS.md) · [Verification](docs/verification.md) · [Lean status](docs/lean-status.md) · [History](HISTORY.md)

## Results

| Problem | Proof | Lean |
| :--- | :---: | :---: |
| [Haralambis’s three-difference conjecture](results/haralambis-three-differences/) | [Read](results/haralambis-three-differences/PROOF.md) | ✅ |
| [Random lonely runners on a fixed hyperplane](results/loneliness-on-a-hyperplane/) | [Read](results/loneliness-on-a-hyperplane/PROOF.md) | 🟡 |
| [Eight-speed Loneliness Spectrum Conjecture](results/eight-speed-spectrum/) | [Read](results/eight-speed-spectrum/PROOF.md) | 🟡 |
| [Seven-speed Amended Loneliness Spectrum Conjecture](results/seven-speed-spectrum/) | [Read](results/seven-speed-spectrum/PROOF.md) | 🟡 |
| [Six-speed Loneliness Spectrum Conjecture](results/six-speed-spectrum/) | [Read](results/six-speed-spectrum/PROOF.md) | 🟡 |
| [Eleven through fourteen lonely runners, all equality cases](results/tight-eleven-to-fourteen/) | [Read](results/tight-eleven-to-fourteen/PROOF.md) | 🟡 |
| [Ten lonely runners, unique equality case](results/tight-nine-speeds/) | [Read](results/tight-nine-speeds/PROOF.md) | 🟡 |
| [Nine lonely runners, unique equality case](results/tight-eight-speeds/) | [Read](results/tight-eight-speeds/PROOF.md) | 🟡 |
| [Eight lonely runners, all equality cases](results/tight-seven-speeds/) | [Read](results/tight-seven-speeds/PROOF.md) | 🟡 |
| [Five-speed Loneliness Spectrum Conjecture](results/five-speed-spectrum/) | [Read](results/five-speed-spectrum/PROOF.md) | [🟡](results/five-speed-spectrum/FOUR_SPEED_GAP_LEAN.md) |
| [Liu–Zhu packing and Natalchenko–Sagdeev covering](results/symmetric-four-point-density/) | [Read](results/symmetric-four-point-density/PROOF.md) | ✅ |
| [Natalchenko–Sagdeev nonmixed-gap packing](results/nonmixed-gap-packing/) | [Read](results/nonmixed-gap-packing/PROOF.md) | ✅ |
| [Two-difference Motzkin density](results/two-difference-motzkin/) | [Read](results/two-difference-motzkin/PROOF.md) · [Checked compact, relation, and cyclic theorems](docs/lean-status.md) | 🟡 |
| [Tight six-speed sets and seven-coordinate critical subtori](results/tight-six-speeds/) | [Read](results/tight-six-speeds/PROOF.md) | 🟡 |
| [Distance graphs with three missing differences](results/distance-graph-densities/) | [Read](results/distance-graph-densities/PROOF.md) | ✅ |
| [Rectangle partition asymptotics](results/rectangle-partition-asymptotics/) | [Read](results/rectangle-partition-asymptotics/PROOF.md) | ✅ |
| [CUT Family B: nim-sequence threshold](results/cut-family-b/) | [Read](results/cut-family-b/PROOF.md) | ✅ |
| [Erdős Problem 607: line-size sets](results/erdos-607-line-sizes/) | [Read](results/erdos-607-line-sizes/PROOF.md) · [Checked geometry and formal generating function](docs/lean-status.md) | 🟡 |
| [CUT arithmetic periodicity with a preperiod](results/cut-arithmetic-periodicity/) | [Read](results/cut-arithmetic-periodicity/PROOF.md) | ✅ |
| [Generalized Bulgarian solitaire limit shapes](results/l-solitaire-limit-shapes/) | [Read](results/l-solitaire-limit-shapes/PROOF.md) | ✅ |
| [Graffiti.pc Conjecture 318](results/graffiti-pc-318/) · [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334) | [Read](results/graffiti-pc-318/PROOF.md) | ✅ |
| [Li's chromatic symmetric function signs](results/li-coefficient-sign/) | [Read](results/li-coefficient-sign/PROOF.md) | ⬜ |
| [Pham's Bulgarian solitaire denominator degree](results/pham-denominator-degree/) | [Read](results/pham-denominator-degree/PROOF.md) | ✅ |
| [Spivey's three-player War](results/spivey-multiplayer-war/) | [Read](results/spivey-multiplayer-war/PROOF.md) | ✅ |
| [Batista's Egyptian fractions](results/batista-egyptian-fractions/) | [Read](results/batista-egyptian-fractions/PROOF.md) | ✅ |

✅ Formalized stated result · 🟡 Partial formalization · ⬜ Not formalized

The [catalogue](CONTENTS.md) gives the exact claims, sources, and scope. The [Lean status report](docs/lean-status.md) distinguishes complete results from partial certificates and remaining dependencies. The solitaire checkmark covers both the fixed-scale counterexample and the corrected theorem for every diverging horizontal scale.

These notes are unrefereed. Computational checks and Lean verification are distinct from peer review and priority claims.

## Partial results on open problems

- [Frankl’s union-closed sets conjecture](results/frankl-generator-families/). A four-position generator theorem and a frequency bound for regular, high-girth incidence graphs.
- [Lonely Runner Conjecture](results/lonely-runner-two-insertions/). Two arbitrary speeds can be adjoined to every Goddyn–Wong simultaneous acceleration.
- [Erdős–Gyárfás power-of-two cycles](results/erdos-gyarfas-abelian-covers/). A sharp cycle-length bound for abelian covers of a singly subdivided tetrahedron.
- [Hadamard existence, order 2396](results/hadamard-2396/). Order 479 is excluded from the automorphism group of any candidate matrix. The entry also gives sequence restrictions and a fixed border. Existence at this order remains open. The arithmetic, Fourier, permutation, and quadratic class-order components are Lean-checked; the full obstruction remains pending. [Checked Lean components](docs/lean-status.md#hadamard-automorphism-arithmetic).

## Layout

- `results/`: individual results, proofs, and computational checks.
- `lean/`: shared formalizations and pinned dependencies.
- `docs/`: verification instructions and formalization status.
- `scripts/`: repository-wide validation tools.

## How to cite

GitHub's **Cite this repository** control reads [`CITATION.cff`](CITATION.cff).
The repository-level authors are Cinna Davis and GPT-6.2 Astra (an AI model), in that order.
Credit the [Graffiti.pc 318 result](results/graffiti-pc-318/) and its proof to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334), who contributed them.

Suggested BibTeX for the repository:

```bibtex
@misc{davis2026solvedconjectures,
  author       = {Cinna Davis and {GPT-6.2 Astra}},
  title        = {Solved conjectures in combinatorics and number theory},
  year         = {2026},
  howpublished = {GitHub repository},
  url          = {https://github.com/1337isnot1337/solved-conjectures},
  note         = {Unrefereed mathematical notes and reproducible verification code}
}
```

For an individual result, cite its credited author, result title, directory, and commit or release.
Cite the original conjecture's publication separately (see [the catalogue](CONTENTS.md#primary-sources)).
These notes have no DOI or peer-reviewed publication.

## Verification

The badges show the current workflow status on `main`. The Lean workflow checks the registered package, transitive axioms, and kernel replay. The computational workflow runs the result verifiers.

The [verification guide](docs/verification.md) gives commands, compiler requirements, and the scope of each check.

## Precise scope

See [the scope notes](CONTENTS.md#precise-scope) and each result's proof for hypotheses and limitations.

## Primary sources

Sources are linked in the [catalogue](CONTENTS.md#primary-sources) and individual proofs.
