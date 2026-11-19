# Conjectures in combinatorics and number theory

A growing collection of proofs, counterexamples, and reproducible verification code, curated by Cinna Davis and GPT-6.2 Astra. Externally contributed results are credited separately.

[Full catalogue](CONTENTS.md) · [Verification](docs/verification.md) · [Lean status](docs/lean-status.md) · [History](HISTORY.md)

## Results

| Problem | Proof | Lean |
| :--- | :---: | :---: |
| [Haralambis’s three-difference conjecture](results/haralambis-three-differences/) | [Read](results/haralambis-three-differences/PROOF.md) | ☑ |
| [Random lonely runners on a fixed hyperplane](results/loneliness-on-a-hyperplane/) | [Read](results/loneliness-on-a-hyperplane/PROOF.md) | ☐ |
| [Eight-speed Loneliness Spectrum Conjecture](results/eight-speed-spectrum/) | [Read](results/eight-speed-spectrum/PROOF.md) | ☐ |
| [Seven-speed Amended Loneliness Spectrum Conjecture](results/seven-speed-spectrum/) | [Read](results/seven-speed-spectrum/PROOF.md) | ☐ |
| [Six-speed Loneliness Spectrum Conjecture](results/six-speed-spectrum/) | [Read](results/six-speed-spectrum/PROOF.md) | ◐ |
| [Eleven through fourteen lonely runners, all equality cases](results/tight-eleven-to-fourteen/) | [Read](results/tight-eleven-to-fourteen/PROOF.md) | ☐ |
| [Ten lonely runners, unique equality case](results/tight-nine-speeds/) | [Read](results/tight-nine-speeds/PROOF.md) | ☐ |
| [Nine lonely runners, unique equality case](results/tight-eight-speeds/) | [Read](results/tight-eight-speeds/PROOF.md) | ◐ |
| [Eight lonely runners, all equality cases](results/tight-seven-speeds/) | [Read](results/tight-seven-speeds/PROOF.md) | ◐ |
| [Five-speed Loneliness Spectrum Conjecture](results/five-speed-spectrum/) | [Read](results/five-speed-spectrum/PROOF.md) | ◐ |
| [Liu–Zhu packing and Natalchenko–Sagdeev covering](results/symmetric-four-point-density/) | [Read](results/symmetric-four-point-density/PROOF.md) | ☑ |
| [Packing with two nonmixed gaps](results/nonmixed-gap-packing/) | [Read](results/nonmixed-gap-packing/PROOF.md) | ☑ |
| [Two-difference Motzkin density](results/two-difference-motzkin/) | [Read](results/two-difference-motzkin/PROOF.md) | ☐ |
| [Tight six-speed sets and seven-coordinate critical subtori](results/tight-six-speeds/) | [Read](results/tight-six-speeds/PROOF.md) | ◐ |
| [Distance graphs with three missing differences](results/distance-graph-densities/) | [Read](results/distance-graph-densities/PROOF.md) | ☑ |
| [Growing rectangles](results/rectangle-partition-asymptotics/) | [Read](results/rectangle-partition-asymptotics/PROOF.md) | ◐ |
| [CUT Family B](results/cut-family-b/) | [Read](results/cut-family-b/PROOF.md) | ☑ |
| [Line-size sets](results/erdos-607-line-sizes/) | [Read](results/erdos-607-line-sizes/PROOF.md) | ☐ |
| [CUT with a preperiod](results/cut-arithmetic-periodicity/) | [Read](results/cut-arithmetic-periodicity/PROOF.md) | ◐ |
| [L-solitaire limit shapes](results/l-solitaire-limit-shapes/) | [Read](results/l-solitaire-limit-shapes/PROOF.md) | ☑ |
| [Graffiti.pc Conjecture 318](results/graffiti-pc-318/) · [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334) | [Read](results/graffiti-pc-318/PROOF.md) | ☐ |
| [Li's coefficient-sign prediction](results/li-coefficient-sign/) | [Read](results/li-coefficient-sign/PROOF.md) | ☐ |
| [Denominator degree](results/pham-denominator-degree/) | [Read](results/pham-denominator-degree/PROOF.md) | ◐ |
| [Three-player War](results/spivey-multiplayer-war/) | [Read](results/spivey-multiplayer-war/PROOF.md) | ☑ |
| [Batista's Egyptian fractions](results/batista-egyptian-fractions/) | [Read](results/batista-egyptian-fractions/PROOF.md) | ☑ |

☑ Formalized stated result · ◐ Partial formalization · ☐ Not formalized

The [catalogue](CONTENTS.md) gives the exact claims, sources, and scope. The [Lean status report](docs/lean-status.md) distinguishes complete results from partial certificates and remaining dependencies. The solitaire checkmark covers both the fixed-scale counterexample and the corrected theorem for every diverging horizontal scale.

These notes are unrefereed. Computational checks and Lean verification are distinct from peer review and priority claims.

## Layout

- `results/`: individual results, proofs, and computational checks.
- `lean/`: shared formalizations and pinned dependencies.
- `docs/`: verification instructions and formalization status.
- `scripts/`: repository-wide validation tools.

## How to cite

GitHub's **Cite this repository** control reads [`CITATION.cff`](CITATION.cff).
The repository-level authors are credited in order: Cinna Davis, followed by GPT-6.2 Astra (an AI model). This is not an authorship claim over external contributions: the [Graffiti.pc 318 result](results/graffiti-pc-318/) must instead be credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334).

Suggested BibTeX for the repository:

```bibtex
@misc{davis2026solvedconjectures,
  author       = {Cinna Davis and {GPT-6.2 Astra}},
  title        = {Conjectures in combinatorics and number theory},
  year         = {2026},
  howpublished = {GitHub repository},
  url          = {https://github.com/1337isnot1337/solved-conjectures},
  note         = {Unrefereed mathematical notes and reproducible verification code}
}
```

When citing an individual result, identify the relevant directory and cite
the original conjecture's publication separately (see [the catalogue](CONTENTS.md#primary-sources)). No DOI or
peer-reviewed publication is claimed for these notes.

## Verification

See [VERIFICATION.md](docs/verification.md) for computational checks, compiler requirements, and the Lean build and axiom audit.

## Precise scope

See [the scope notes](CONTENTS.md#precise-scope) and each result's proof for hypotheses and limitations.

## Primary sources

Sources are linked in the [catalogue](CONTENTS.md#primary-sources) and individual proofs.
