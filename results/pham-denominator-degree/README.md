# Bulgarian solitaire: a counterexample to Pham's denominator-degree conjecture

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

A primitive binary necklace of length 10 whose Bulgarian-solitaire limiting level generating function has **reduced denominator degree 5**.

The necklace is `0001001011` (`1` = black bead). Its generating function is

```math
H_{0001001011}(x)=
\frac{10+4x+10x^2+8x^3-14x^4-34x^5+14x^6+2x^7}
{1-x^3-4x^4-6x^5}.
```

The numerator and denominator are coprime. Hence, for $n\ge8$, its coefficients satisfy

```math
\boxed{h_n=h_{n-3}+4h_{n-4}+6h_{n-5}}.
```

This **disproves the exact reduced-denominator-degree conjecture** stated in Section 6 of [Pham (2022)](https://arxiv.org/html/2208.14496). Pham proved that the denominator degree is at most the necklace length and conjectured equality. Here it is strictly less: $`5<10`$.

The proof is not merely a fit to early terms. Pham's proven numerator/denominator degree bounds reduce the rational-function identity to an exact, finite certificate. An independently derived reverse-Bulgarian-Solitaire enumerator verifies the first 26 coefficients; the bounds then prove the identity for all $n$.

**Read the [complete proof](PROOF.md)**, including the precise counting algorithm and the finite-coefficient identity lemma.

## Lean formalization

[`DenominatorTheorem.lean`](../../lean/Conjectures/DenominatorTheorem.lean)
proves both the primary and dual identities from the actual Bulgarian-solitaire
map. The [direct formal proof](FORMAL_PROOF.md) explains this route. It derives
rationality from finite prefix recursions and does not assume Pham's general
rationality or degree-bound theorem.

For every repetition count `k ≥ 2`, the formalization proves that each word
gives an actual forward cycle with ten distinct vertices. For every depth `n`,
its exact first-entry level size equals the limiting coefficient for every
repetition count `k ≥ n + 2`.
Thus the identities apply to the limiting level generating functions defined
by the finite game. The proof also shows that every nonzero denominator for
the primary series has degree at least 5, and every nonzero denominator for
the dual series has degree at least 10.

The polynomial certificate checks 418 recursive identities in Lean. Its Python
generator supplies proposed coefficients; Lean checks each identity from the
recursive definitions. The main endpoints are
`DenominatorForest.pham_denominator_counterexample` and
`DenominatorForest.pham_dual_denominator`. The
[Lean status](../../docs/lean-status.md) records source, axiom-audit, and
independent kernel verification.

## Verify

Requires Python 3.10+ and no third-party packages.

```sh
python3 verify.py
python3 -m unittest discover -s tests -v
```

For an optional proof of the **dual necklace's** generating function:

```sh
python3 verify.py --dual --brute-depth 13
```

The primary verification takes only a few seconds on ordinary hardware. The dual certificate computes 31 coefficients and takes longer.

## An important distinction

The later [Harris–Nguyen (2025) Conjecture 1.1](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf) says that $H_P$ and $`H_{P^*}`$ *can be written over a common denominator of degree* $`|P|`$. This example **does not refute** that statement.

Indeed the dual is `0010110111` and its denominator is

```math
1-(x^3+4x^4+6x^5)^2,
```

of degree 10, which is divisible by the denominator of $H_P$. The dual's numerator and the verification are in [PROOF.md](PROOF.md).

## Contents

- [`PROOF.md`](PROOF.md) — theorem, exact proof, counting invariant, and dual comparison.
- [`FORMAL_PROOF.md`](FORMAL_PROOF.md) — direct derivation used by Lean, including stabilization of actual finite orbit levels.
- [`DenominatorTheorem.lean`](../../lean/Conjectures/DenominatorTheorem.lean) — full primary and dual endpoints, with minimal denominator degrees.
- [`prefix_certificate.py`](prefix_certificate.py) — finite recursive polynomial coefficient proposals for the Lean certificate.
- [`verify.py`](verify.py) — complete standard-library verifier and independent brute-force enumerator.
- [`certificates/coefficients.json`](certificates/coefficients.json) — exact integer coefficient certificates.
- [`tests/`](tests/) — regression checks, including two published examples.

The result is a counterexample to a specific 2022 conjectural equality, not a resolution of all denominator conjectures for Bulgarian Solitaire.
