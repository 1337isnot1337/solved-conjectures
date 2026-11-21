# Pula–Song–Wanless conjecture

[Catalogue](../../CONTENTS.md) · [Proof](proof.md) · [Source audit](source-audit.md) · [Issue #142](https://github.com/1337isnot1337/solved-conjectures/issues/142)

**Status:** Complete proposed proof of the named conjecture for every positive integer `m` and every integer `n>1`. The proof is unrefereed. Three internal reviews found no remaining mathematical gap. No earlier complete threshold proof was found in the public sources inspected; the source audit states the access and priority limits.

**Lean status:** none. No Lean formalization is included. The scripts audit formulas; the general proof does not depend on a finite computation.

## Result

Let `J` denote an all-ones block and let `Ω(V)` be the doubly stochastic matrices supported by

```math
V_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&J_m\end{pmatrix}.
```

The support is cohesive exactly when `n<m+sqrt(m)`. It is never barycentric for `n>1`. At and above the threshold, including equality, its unique permanent minimizer is

```math
A_0=\begin{pmatrix}
\frac{n-m}{n}I_n&\frac1nJ_{n,m}\\
\frac1nJ_{m,n}&0_m
\end{pmatrix},
\qquad
\mathop{\mathrm{per}} A_0=
\frac{n!m!(n-m)^{n-m}}{(n-m)!n^{n+m}}.
```

The previously missing contribution is the general threshold direction. The known cohesive and non-barycentric directions are credited and independently rederived. This conjecture appears in the literature discussed under [Minc Problem 14](https://yair-lavi.com/mincs-list/problem-14/index.html) and [Problem 15](https://yair-lavi.com/mincs-list/problem-15/index.html). It does not characterize arbitrary cohesive or barycentric supports, so it is not a full solution of either Minc entry.

## Proof and review

The proof first repairs a gap in the available 2011 equalization argument. A minor polynomial is a product of nonnegative first-order differential operators applied to a monomial. Its real nonpositive roots yield an inequality which forces equal cross-block parameters at a minimizer, including boundary cases. The reduced permanent satisfies a coefficient-derived differential equation. A first-zero argument proves strict increase at and above the threshold; a second-order expansion handles equality. A separate completion to a doubly stochastic matrix proves full-face uniqueness through the equality case of van der Waerden.

- [Complete proof](proof.md), including the reduction repair and all endpoint cases.
- [Inequalities review](review-inequalities.md).
- [Sign-matrix review](review-sign-matrices.md).
- [Source audit and dependency history](source-audit.md).

## Reproduce the identity audits

Requires Python 3 and SymPy 1.14.0. Run with assertions enabled:

```bash
python3 results/pula-song-wanless/verify.py
```

The script checks generic symbolic derivative and crossing identities, 72 coefficient ODE/variance cases, 48 permanent-counting identities against an independent subset dynamic program, and 42 exact barycenter inequalities. These checks detect algebra or parameter-convention errors; they are not a finite substitute for the all-parameter proof.
