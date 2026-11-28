# Lih--Wang: failure of pointwise coefficient domination

Research date: 21 November 2026 UTC.

The coefficient inequality tested below is false. Its failure follows from
published Jerrum-graph permanent counts; no permanent search is required.
This is a rejection of a sufficient auxiliary assertion, not a counterexample
to [MINC Conjecture 34](https://yair-lavi.com/mincs-list/conjecture-34/index.html).

## Definitions and proposed assertion

Let `A` be a nonnegative doubly stochastic matrix of order `n`. Let
`sigma_j(A)` be the sum of all `j` by `j` subpermanents, with `sigma_0=1`.
Write `U_n` for the matrix whose entries are `1/n`, and put

```math
c_n=\mathop{\mathrm{per}}U_n=\frac{n!}{n^n},\qquad
q_j(A)=\frac{\sigma_j(A)}{\binom nj^2 j!/n^j}.
```

Thus `q_0=q_1=1` and `q_n=per(A)/c_n`. The proposed sufficient inequality was

```math
q_j-1\le\frac{2j(j-1)}{n(n-1)}(q_n-1),
\qquad n\ge4,\quad 2\le j\lt n.                    \tag{1}
```

To explain its purpose, multilinearity gives the exact mixture identity

```math
\frac{\mathop{\mathrm{per}}((1-t)U_n+tA)}{c_n}
=\sum_{j=0}^n\binom nj t^j(1-t)^{n-j}q_j(A).
                                                               \tag{2}
```

If (1) held, extending its right-hand coefficient to 2 at `j=n` would give
an excess at most `2t^2(q_n-1)`, and hence at most `t(q_n-1)` for
`0 <= t <= 1/2`. That would prove Lih--Wang. The pointwise step is invalid.

## Exact normalization of the penultimate coefficient

Direct calculation gives

```math
\sigma_{n-1}(U_n)
=n^2\frac{(n-1)!}{n^{n-1}}
=n!n^{2-n}.
```

Consequently

```math
\frac{q_{n-1}(A)}{q_n(A)}
=\frac{\sigma_{n-1}(A)}{n^2\mathop{\mathrm{per}}A}.    \tag{3}
```

In particular, a single large permanental cofactor gives a lower bound
on this ratio. The normalization has `n^2`, not `n`.

## Published graph counts

For integers `r>=3` and `f>=1`, the Jerrum graph `G_(r,f)` is binary and
`r`-regular, of matrix order

```math
n=r^2f+1.
```

Write its biadjacency matrix as `H`. Its distinguished missing edge
`(s,t)` has the exact counts

```math
\mathop{\mathrm{per}}H
=r((r-1)!)^{rf}(r-1)^{(r-1)f},
```

```math
\mathop{\mathrm{per}}H(s\mid t)
=((r-1)(r-1)!)^{rf}.
```

These are prior results in
[I. M. Wanless, *The Holens--Djokovic conjecture on permanents fails!*,
Example 1, p. 275](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The graph construction and equations were inspected directly in the rendered
primary PDF; its text layer is damaged. The same normalization is recorded
in the repository's reviewed
[C6 checkpoint](https://github.com/1337isnot1337/solved-conjectures/issues/139#issuecomment-7056258663).

For reproducibility, the construction has `r` branches. Each branch contains
`f` copies of `K_(r,r)`, each missing a distinguished edge. Join consecutive
copies by an edge from the distinguished left vertex of one to the
distinguished right vertex of the next. Add a left vertex `s` connected to
the first distinguished right vertex in every branch, and a right vertex
`t` connected to the last distinguished left vertex in every branch.
Every vertex then has degree `r`, and `(s,t)` is absent.

The ratio of the two displayed counts is `(r-1)^f/r`. With `A=H/r`,
which is doubly stochastic, normalization of a cofactor versus a full
permanent contributes the additional factor `r`. Therefore

```math
\frac{\mathop{\mathrm{per}}A(s\mid t)}{\mathop{\mathrm{per}}A}
=(r-1)^f,
\qquad
\frac{q_{n-1}(A)}{q_n(A)}\ge\frac{(r-1)^f}{n^2}.   \tag{4}
```

For every fixed `r>=3`, the lower bound in (4) tends to infinity with `f`.
Thus no constant bound near 2 on this coefficient ratio can be valid.

## One exact witness to the proposed assertion

Take `r=3`, `f=16`. Then `n=145`, and

```math
\mathop{\mathrm{per}}A=\frac{2^{80}}{3^{144}},\qquad
\mathop{\mathrm{per}}A(s\mid t)=\frac{2^{96}}{3^{144}}.
```

It follows that

```math
R:=\frac{q_{144}(A)}{q_{145}(A)}
\ge\frac{65536}{21025}
>\frac{286}{145}
=\frac{2\cdot144\cdot143}{145\cdot144}
=:c.
```

The rational comparison is immediate from
`65536 > 286*145 = 41470`. Since `q_145 > 0` and `c>1`,

```math
q_{144}-1-c(q_{145}-1)
=(R-c)q_{145}+(c-1)>0.
```

This is a strict violation of (1), with all parameters and normalizations
exact. The full penultimate subpermanent sum does not need to be computed:
its single displayed cofactor already suffices.

## Remaining aggregate question

The actual Lih--Wang assertion is the aggregate bound

```math
\sum_{j=0}^n\binom nj t^j(1-t)^{n-j}(q_j-1)
\le t(q_n-1),\qquad 0\le t\le\tfrac12.            \tag{5}
```

For `j=n-1`, the binomial weight is `n t^(n-1)(1-t)`. On the required
interval its largest value is `n/2^n`. This exponentially small weight can
offset an exponentially large penultimate coefficient. The lower bound
in (4) therefore does not contradict (5).

A proof of (5) must control several coefficients together using double
stochasticity, or give a different functional argument. The real-rooted
rook polynomial and separate Friedland--Tverberg coefficient lower bounds
do not imply the failed pointwise domination. No aggregate inequality
sufficient for (5) has been proved in this note. No full conjecture is
resolved or added to the completion count.
