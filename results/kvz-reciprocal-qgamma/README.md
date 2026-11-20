# Karp–Vishnyakova–Zhang's reciprocal q-gamma conjecture

This directory proves the complete reciprocal q-gamma sign-regularity conjecture in Section 3, item 8 of Karp, Vishnyakova, and Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, Results in Mathematics 80 (2025), article 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4). The statement appears on page 7 of [arXiv:2408.01755v2](https://arxiv.org/abs/2408.01755v2).

## The theorem

For $0\lt q\lt1$, define

```math
\Gamma_q(z)=(1-q)^{1-z}\frac{(q;q)_\infty}{(q^z;q)_\infty},
\qquad
(a;q)_k=\prod_{j=0}^{k-1}(1-aq^j).
```

For every integer $r\geq1$ and every pair of strictly increasing positive real tuples $x_1,\ldots,x_r$ and $y_1,\ldots,y_r$,

```math
(-1)^{\binom r2}
\det\left[\frac1{\Gamma_q(x_i+y_j)}\right]_{i,j=1}^r>0.
```

Thus the kernel is strictly sign regular of every order, with signature $(-1)^{\binom r2}$. The result allows every determinant size, every $q\in(0,1)$, and arbitrary ordered positive real arguments. The proof also gives an explicit positive lower bound for each signed determinant.

## Proof mechanism

The proof uses two classical q-binomial expansions. First,

```math
\frac1{(q^{a+b};q)_\infty}
=\sum_{\ell\geq0}\frac{q^{a\ell}q^{b\ell}}{(q;q)_\ell}.
```

Each finite Cauchy–Binet summand contains two exponential determinants with the same sign, so their product is positive. This proves strict total positivity and, after multiplying columns by positive factors, gives the same property for $(q^y;q)_k$ with $k\geq0$.

The second expansion is

```math
\frac1{\Gamma_q(x+y)}
=\frac{(1-q)^y}{\Gamma_q(x)}
\sum_{k\geq0}q^{kx}\frac{(q^y;q)_k}{(q;q)_k}.
```

Now each finite Cauchy–Binet summand contains one exponential determinant with sign $(-1)^{\binom r2}$ and one positive q-Pochhammer determinant. Every summand therefore has the required sign. A fixed consecutive-index summand remains strictly signed as the truncation grows. Continuity of finite determinants passes the result to the convergent infinite sum.

The argument proves strictness directly, including the auxiliary index $k=0$. It uses no numerical limiting argument and includes short proofs of the classical identities needed for the result.

## Files and verification

- [PROOF.md](PROOF.md): complete proof and explicit signed-minor lower bound.
- [NOVELTY.md](NOVELTY.md): source versions, prior-resolution search, related claims, and access limits.
- [verify.py](verify.py): exact diagnostic checks using only the Python standard library.

Run from the repository root:

```sh
python3 results/kvz-reciprocal-qgamma/verify.py
```

Recorded output:

```text
PASS: 1983 exact q-Pochhammer minors, including index zero
PASS: 48 exact finite Cauchy-Binet identities and 24 lower bounds
PASS: 12 rigorous rational infinite-product minor certificates
The all-order, all-parameter proof is in PROOF.md; finite checks are diagnostic only.
```

The infinite-product checks use rational enclosures from a finite prefix and the geometric tail bound. They check positive half-integer arguments, the determinant signature, and the explicit lower bound. No floating-point computation is used. These checks diagnose indexing and algebra; the general proof is in `PROOF.md`.

## Scope and review status

The positive $\Gamma_q(x+y)$ Hankel assertion already has a public proof claim by Salazar. That result is a known ingredient, with its elementary argument included, and is not counted as a new resolution. The present theorem proves the distinct reciprocal-kernel conjecture. The ordinary reciprocal-gamma analogue is also not counted separately.

The full written argument passed two separate internal reviews. No outside peer review or author confirmation is claimed. The recorded literature search found no earlier resolution of this exact reciprocal assertion as of 20 November 2026; the search limitations are stated in [NOVELTY.md](NOVELTY.md).

Research discussion: [issue #93](https://github.com/1337isnot1337/solved-conjectures/issues/93).
