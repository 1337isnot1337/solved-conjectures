# Graffiti.pc Conjecture 318 — well-total domination

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

**Result credit: [@JesterInABarrel on X](https://x.com/JesterInABarrel/status/2123233964827812334).** This result and proof were publicly shared by that account on November 18, 2026, through a ChatGPT conversation, and included here with permission. This is an external contribution. Neither Cinna Davis nor the repository's AI collaborator is credited with discovering or authoring this result.

## Result

Graffiti.pc Conjecture 318 (DeLaViña, 2007) is true. In fact, if a finite simple connected graph $G$ on at least two vertices satisfies

\[
\max_{v\in V(G)}\operatorname{dist}_{even}(v)\ \geq\ |E(\overline G)|,
\]

then **every total dominating set contains a total dominating pair**. Consequently every inclusion-minimal total dominating set has exactly two adjacent vertices, and $G$ is well total dominated.

The original conjecture was listed as open in the [November 5, 2026 catalogue](https://www.uhd.edu/academics/sciences/mathematics-statistics/wowii/files/wowiiaii.pdf).

## Proof, source and credit

- [Self-contained proof and sharpness example](PROOF.md)
- [Original public report by @JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)
- [DeLaViña, *Written on the Wall II*, Conjecture 318 (March 4, 2007)](https://www.uhd.edu/academics/sciences/mathematics-statistics/wowii/files/wowiiaii.pdf)

**Cite @JesterInABarrel when referring to this result.** This repository maintains an independently checked presentation, not a separate discovery claim.

## Verification

From the repository root:

```bash
python3 results/graffiti-pc-318/verify.py
```

The standard-library verifier checks 419,235 labeled graphs, including every graph of order 2–7 that could meet the hypothesis. All 7,337 qualifying graphs satisfy the stronger conclusion. It also checks a five-vertex sharpness example. The all-order proof does not rely on finite enumeration.

## Formalization

The all-order Lean theorem and the five-vertex sharpness example have passed local
source compilation, a transitive axiom audit, and independent kernel replay.
The three modules are awaiting shared-package registration and hosted validation.
See the [exact statements and local receipts](LEAN.md), the
[candidate checks](../../docs/lean-candidates.md), and the
[Lean status report](../../docs/lean-status.md).
The result remains unrefereed and lacks independent peer review.
