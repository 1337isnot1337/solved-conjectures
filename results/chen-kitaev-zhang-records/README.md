# Chen–Kitaev–Zhang's record conjectures

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Sources](SOURCES.md) · [Independent audit](AUDIT.md)

## Result

The original Conjectures 1 and 3 in Chen, Kitaev and Zhang's *Distributions of statistics on separable permutations* hold in full.

For every length at least three, each of the four record distributions on separable permutations is unimodal with a maximum at two records. For every positive length, the right-maxima and left-minima distributions on reducible separable permutations are weakly decreasing from one record, as are the left-maxima and right-minima distributions on irreducible separable permutations.

The proof establishes three new coefficient comparisons and uses the credited, previously public all-index tail argument for Conjecture 2. The written proof reconstructs that argument and its exact certificates. Conjecture 2 adds no new resolution. The two source assertions are recorded together as one named result package.

## Review and priority

The complete written proof passed a separate internal mathematical audit. The [source audit](SOURCES.md) records both search engines, primary manuscripts, author records and public solution archives. No earlier resolution of Conjectures 1 or 3 was found in those sources. The publisher's complete typeset body and every citing paper were not exhaustively retrieved; the notes remain unrefereed and priority is subject to correction.

**Lean status:** partial. Lean checks the Schröder series, low-record algebra and uniform numerator bounds, and the 16 finite integer certificates, with the executable list operations related to the stated polynomials. The all-index coefficient inequalities and actual permutation-class identifications remain. Strict standalone compilation, axiom audit and isolated kernel replay passed; the combined repository gate is pending.

## Reproduce

From the repository root:

```bash
python3 results/chen-kitaev-zhang-records/verify.py
```

Only Python's standard library is required. The script checks all polynomial identities and sixteen certificates and regenerates [ckz_certificates.json](ckz_certificates.json). It also enumerates separable permutations through length eight to check the source conventions. Those finite rows are not the basis of the all-length theorem.

## Source

Joanna N. Chen, Sergey Kitaev and Philip B. Zhang, *Distributions of statistics on separable permutations*, Discrete Applied Mathematics 355 (2024), 169–179, [doi:10.1016/j.dam.2024.05.004](https://doi.org/10.1016/j.dam.2024.05.004), [author manuscript](https://arxiv.org/html/2404.18517v1), original Conjectures 1 and 3.

Research and review: [issue 157](https://github.com/1337isnot1337/solved-conjectures/issues/157).
