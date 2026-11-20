# Flynn's conjecture

Status: unresolved. These are elementary reductions for the full conjecture, not a claimed new resolution or a finite-case result.

Primary source: Steven Flynn, *Singular Value Decomposition for the X-ray Transforms on the Reduced Heisenberg Group, and a Two-Radius Theorem*, [arXiv:2305.04126](https://arxiv.org/abs/2305.04126), Section 5, Conjecture 1. Its Definition 2 and equation (11) fix the convention
```math
\ell_j(n)=L_j^{(n)}(n),\qquad
\sum_{j\ge0}\ell_j(n)t^j
=(1-t)^{-n-1}\exp\!\left(-\frac{nt}{1-t}\right).
```

The conjecture states that, for integral $n\ne0$ and $j\ge0$, the only zero is $(j,n)=(2,2)$.

## Negative integers

Write
```math
h(t)=\frac{t}{1-t}+\log(1-t)
=\sum_{d\ge2}\frac{d-1}{d}t^d.
```

For $n=-m<0$,
```math
\sum_{j\ge0}\ell_j(-m)t^j
=\frac{\exp(mh(t))}{1-t}.
```

The exponential has nonnegative coefficients and constant term one. Therefore every coefficient of the displayed series is at least one. No negative integer $n$ is a zero for any $j$.

## Odd integers

Logarithmic differentiation of the defining series gives
```math
(1-t)^2\frac{\partial F}{\partial t}
=(1-(n+1)t)F.
```

Consequently
```math
(j+1)\ell_{j+1}(n)
=(2j+1)\ell_j(n)-(j+n)\ell_{j-1}(n)\quad(j\ge1).
```

Put $A_j(n)=j!\ell_j(n)$. Then $A_0=A_1=1$ and
```math
A_{j+1}(n)=(2j+1)A_j(n)-j(j+n)A_{j-1}(n).
```

This proves $A_j\in\mathbb Z[n]$ by induction. If $n$ is odd, $j(j+n)$ is even. Reducing modulo two shows $A_j(n)\equiv1$ for all $j$, so no odd integer $n$ is a zero.

## A necessary divisibility condition

At $n=0$, the generating series is $(1-t)^{-1}$, hence $A_j(0)=j!$. Since $A_j$ has integer coefficients,
```math
A_j(n)\equiv j!\pmod n.
```

Thus an integer zero requires $n\mid j!$. In particular, every prime factor of a positive integer zero is at most $j$.

The first nonconstant polynomial is $\ell_2(n)=1-n/2$, giving the stated zero $(2,2)$. The reductions above leave **positive even $n$** and do not show that $(2,2)$ is the only remaining zero.

## Literature and continuation

On 20 November 2026, the original eight-page preprint, its exact conjecture statement and generating-function convention, the [MathDB entry](https://mathdb.com/p/358309/the-uniqueness-conjecture-for-zeros-of-diagonal-laguerre-fun), and both-engine searches for the author, paper title, diagonal Laguerre zeros, proof, and counterexample were inspected. No prior complete resolution was located. No novelty is asserted for the elementary observations in this note.

The missing step is uniform exclusion of the remaining positive even integer zeros. Extending a numerical search in $j$ or $n$ would not settle that step. A useful continuation would need a uniform arithmetic argument for the recurrence, an applicable irreducibility theorem with the parameter allowed to vary, or a rigorously certified counterexample.


### Later-source and attribution check

The [author's current publication list](https://stevenpatrickflynn.github.io/publications/) links the October 2026 version of [*Injectivity and stability for the sub-Riemannian X-ray transform on H-type groups*, arXiv:2312.00594v3](https://arxiv.org/pdf/2312.00594). Its page 8 defines $A_k=\{a\ge0:L_a^{(k)}(k)=0\}$ and explicitly states that $A_k$ is empty for odd $k$, citing Flynn's 2021 *Journal of Functional Analysis* paper, *Injectivity of the Heisenberg X-ray Transform*, 280(5), 108886. The odd-parameter exclusion above is therefore prior mathematics, independently rederived here. The new paper retains the set $A_{|k|}$ in its even-parameter statements (Theorem 2.8), and does not classify those zeros.

The recently circulated [*Uniform irreducibility and Galois groups of generalized Laguerre polynomials*](https://hexagonmath.org/pdf/2611.00087v1) was also checked for applicability. Its equation (1.4) concerns $L_N^{(-N-s)}$ with positive $s$, a negative-parameter family. It does not supply the needed theorem for the remaining positive parameters here. The identifier on that manuscript is a Hexagon identifier, not an arXiv identifier.
