# Perron root of permanental compounds

A general fully polynomial randomized approximation scheme for the Perron root of a permanental compound of a nonnegative rational matrix.

## Statement

For every nonnegative rational matrix $`A\in\mathbb Q_{\ge0}^{n\times n}`$, every $`0\le k\le n`$, and rational accuracy and failure parameters in $(0,1)$, the algorithm returns a rational $R$ with

```math
\Pr\!\left[
 (1-\varepsilon)\rho(P_k(A))
 \le R\le
 (1+\varepsilon)\rho(P_k(A))
\right]\ge1-\delta.
```

The running time is polynomial in the binary input length, $1/\varepsilon$, and $\log(1/\delta)$. A zero root is detected exactly in polynomial time. The theorem covers all compound degrees, reducible inputs, zero diagonal entries and periodic compounds. It does not form the exponentially large compound matrix.

## Mathematical argument

The central estimate, valid for every integer $t\ge1$, is

```math
\frac{n!}{n^n}\max_{0\le j\le n}\rho(P_j(A))^t
\le
\sum_{j=0}^n\mathop{\mathrm{tr}}(P_j(A)^t)
\le
2^n\max_{0\le j\le n}\rho(P_j(A))^t.
```

The lower bound follows by applying Gurvits's coefficient-capacity theorem to the stable symbol of an iterated transfer operator. The sum of traces is the permanent of a cyclic layered matrix. Log-concavity across compound degrees allows one degree to be selected by a rational scaling parameter. A finite grid and the Jerrum–Sinclair–Vigoda permanent FPRAS then give the claimed accuracy and running time.

The [proof](proof.md) includes stability preservation, the trace estimate, the counting identity, zero detection, an explicit rational grid, all error constants, and bit-complexity bounds.

## Scope and review

This answers the general randomized approximation formulation of [Minc Problem 18](https://yair-lavi.com/mincs-list/problem-18/index.html). The historical wording asks for an algorithm without specifying a complexity threshold. The theorem does not assert exact polynomial-time computation of an algebraic eigenvalue or of the permanent. It does not solve Minc Problem 17 on characteristic polynomials.

The proof is unrefereed. Two independent internal reviews found no remaining gap after a correction to the positive-support argument. The [source audit](source-audit.md) found no previous full-domain FPRAS under permanental-compound, zeon, transfer-matrix or stable-operator terminology; that search does not certify priority. Known ingredients are credited explicitly.

- [Independent mathematical review](review-sign-matrices.md)
- [Independent inequality and complexity review](review-inequalities.md)
- [Coordination and review discussion](https://github.com/1337isnot1337/solved-conjectures/issues/140)

## Reproducible checks

Run from the repository root with ordinary Python 3.10 or later:

```sh
python3 results/perron-root-permanental-compounds/verify.py
```

The standard-library verifier checks 126 exact cyclic trace identities, 81 Newton inequalities and 2,048 exact support/degree cases. The checks test the finite reductions. The general theorem depends on the written proof and its cited theorems. The Jerrum–Sinclair–Vigoda sampler is not implemented here; no practical runtime claim is made.

No Lean verification is included.

## Files

| File | Contents |
| --- | --- |
| [proof.md](proof.md) | Complete mathematical proof and explicit algorithm |
| [source-audit.md](source-audit.md) | Prior-art search, overlaps and access limits |
| [verify.py](verify.py) | Exact finite checks for the reductions |
| [permanent_helpers.py](permanent_helpers.py) | Exact small-matrix permanent and compound routines |
| [review-sign-matrices.md](review-sign-matrices.md) | Independent proof review and additional prior-art checks |
| [review-inequalities.md](review-inequalities.md) | Independent review of the main estimate, edge cases and complexity |

