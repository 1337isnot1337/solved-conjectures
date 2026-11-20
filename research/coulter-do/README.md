# Coulter–Do conjecture

Status: unresolved. This directory records a structural parameter reduction and diagnostic computations, not a solution.

Issue: [#88](https://github.com/1337isnot1337/solved-conjectures/issues/88).

## Target and sources

The target is Conjecture C, equivalently Conjectures 4.21 and 4.22, of [Coulter–Do, arXiv:2506.04002v1](https://arxiv.org/html/2506.04002v1). For every nonnegative half-integer genus, every positive profile, and every real parameter $b\notin\{0,-1\}$, the connected $bt$-monotone Hurwitz polynomial is conjectured to have only real zeros. Increasing any profile part by one is conjectured to give an interlacing polynomial.

The paper's separate Conjecture 5.4(a), about commuting deformed Jucys–Murphy operators, has a previously published counterexample and is not a target here. See [LITERATURE.md](LITERATURE.md) for the audit and [PARAMETER.md](PARAMETER.md) for the full reduction.

## Exact implementation

[probe.py](probe.py) implements the published cut-join-flip recurrence, Corollary 4.16. Let $r=2g$, $h=\lfloor r/2\rfloor$, and $\epsilon=r\bmod2$. It works with

```math
H_{g,n}(\mu;b,t)
=(b+1)^{n-1+h}b^\epsilon P_{r,\mu}(z,t),
\qquad z=\frac{b^2}{b+1}.
```

The complete real parameter range is $z>0$ or $z\leq-4$. A positive $z$ and a negative $z$ in this range each correspond to admissible real parameters $b$; no untested interval between $-4$ and $0$ belongs to the problem.

The implementation uses exact rational arithmetic in two variables. It reproduces six independent formulas in Tables 2–4, including multi-part profiles $(2,2)$ and $(2,1,1)$. This verifies conventions and the normalization against the source. It does not prove the conjecture.

## Bounded searches and their limits

For $N=|\mu|\geq2$, the tested polynomials satisfy

```math
P_{r,\mu}(z,t)=t(1+t)^{N-2}
\Gamma_{r,\mu}\left(z,\frac{t}{(1+t)^2}\right).
```

The scripts compute the gamma coefficients exactly, then use floating-point roots solely to search for candidates. A candidate would require exact verification and a structural argument before any result could be claimed.

Completed diagnostics on 2026-11-20:

- [root_diagnostic.py](root_diagnostic.py): all partitions of totals $3$ through $11$, with $0\leq r\leq16$, at twenty specified samples on the two admissible parameter rays. There were 3,247 profile/genus pairs. No candidate was found.
- [interlacing_diagnostic.py](interlacing_diagnostic.py): all profiles of totals $3$ through $10$, with $0\leq r\leq12$, and every distinct one-part increment, at the same samples. There were 3,653 profile edges. No candidate was found.

Neither computation covers every real parameter, and neither finite range supplies an induction. The scripts use a numerical tolerance and are not exact root-count certificates. The parameter reduction is the only general mathematical statement established in this directory.

## Remaining gap

The recurrence couples genera, profile lengths, and products of lower terms. The current argument does not provide a common interlacing or sign invariant for these summands. On the negative parameter ray, the normalized recurrence also has cancellations. Establishing a uniform invariant, or finding and exactly certifying an algebraic counterexample, remains necessary.

The combinatorics lane has stopped increasing the finite search range and is switching to other named targets. The conjecture remains open in this repository.
