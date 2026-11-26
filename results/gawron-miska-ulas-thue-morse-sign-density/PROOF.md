# Gawron–Miska–Ulas Thue–Morse sign-density conjecture

**Result.** Conjecture 5.8 is false. For the square of the Thue–Morse
series, both exception sets in the conjecture have positive lower
density. In fact, each has an exception in every block of a fixed
length, as well as a term with the proposed usual sign.

Let $T(q)=\prod_{i\ge0}(1-q^{2^i})$ and
$t_m(N)=[q^N]T(q)^m$. [Conjecture 5.8 of Gawron–Miska–Ulas](https://doi.org/10.1007/s00605-017-1041-2)
defines, for all $m\ge2$ and $j=0,1$,
```math
 \mathcal A_{m,j}
 =\{n\ge0:\mathop{\mathrm{sgn}}t_m(3n+j)\ne(-1)^j\}.
```
It asserts that these sets are infinite and have density zero, with
the density measured in the input index $n$, not in $3n+j$.
We prove the following bounds for $m=2$:
```math
 \begin{aligned}
 \liminf_{X\to\infty}\frac{\#(\mathcal A_{2,0}\cap[0,X))}{X}
 &\ge \frac{1}{512},
 \\ \liminf_{X\to\infty}\frac{\#(\mathcal A_{2,1}\cap[0,X))}{X}
 &\ge \frac{1}{256}.
 \end{aligned}
```

## 1. Two identities valid for every input

Abbreviate $t(N)=t_2(N)$, taking $t(-1)=0$. The functional equation
$T(q)^2=(1-q)^2T(q^2)^2$ gives
```math
 t(0)=1,\qquad
 t(2n)=t(n)+t(n-1),\quad t(2n+1)=-2t(n)
 \qquad(n\ge0).
```
Every even-indexed coefficient is odd, by induction: in its sum,
one input has an even index and the other has an odd index, with
the $n=0$ case given separately. Every odd-indexed coefficient is
nonzero by induction from its recurrence. Thus $t(N)\ne0$ for all
$N\ge0$.

Write $v(n)=(t(n),t(n-1))^{\mathsf T}$. The digit matrices, for
appending 0 or 1 to $n$, are
```math
 M_0=\begin{pmatrix}1&1\\0&-2\end{pmatrix},
 \qquad
 M_1=\begin{pmatrix}-2&0\\1&1\end{pmatrix},
 \qquad v(2n+b)=M_bv(n).
```
For $b=0,n=0$ the second row follows from $t(-1)=0$; otherwise
it follows from the same odd-index recurrence. For a word of
$L$ bits $w=b_1\cdots b_L$, with numerical value $c$, one
therefore obtains $t(2^Ln+c)$ by applying the first row of
$M_{b_L}\cdots M_{b_1}$ to $v(n)$. For direct arithmetic
verification, the first row is computed starting from $(1,0)$
and reading the word right-to-left with the two updates
```math
 (a,b)M_0=(a,a-2b),\qquad (a,b)M_1=(-2a+b,b).
```

| $L$ | suffix bits | $c$ | first row |
| :-- | :-- | --: | :-- |
| 9 | 000000000 | 0 | $(1,171)$ |
| 9 | 000011110 | 30 | $(11,-39)$ |
| 9 | 101000100 | 324 | $(-3,7)$ |
| 8 | 00000001 | 1 | $(-2,-86)$ |
| 8 | 00010000 | 16 | $(-7,19)$ |
| 8 | 10100110 | 166 | $(3,-7)$ |

The first three rows sum to zero with positive weights $(1,13,48)$,
and the last three with positive weights $(1,34,80)$. Thus
```math
 \begin{aligned}
 t(512n)+13t(512n+30)+48t(512n+324)&=0,
 \\ t(256n+1)+34t(256n+16)+80t(256n+166)&=0
 \end{aligned}
```
for *every* $n\ge0$. Each triple consists of nonzero integers, so
the positive weights force both signs in each triple.

## 2. Counting in the conjecture's units

Take $n=3h$. The first identity uses exactly the indices
$3(512h+s)$ with $`s\in\{0,10,108\}`$. At least one coefficient is
negative, so $\mathcal A_{2,0}$ meets $[512h,512(h+1))$.
The second uses the indices $3(256h+s)+1$ with
$`s\in\{0,5,55\}`$. At least one coefficient is positive, so
$\mathcal A_{2,1}$ meets $[256h,256(h+1))$.
The blocks are disjoint as $h$ varies. Counting complete blocks
in $[0,X)$ gives the lower bounds above. The other sign in each
triple gives upper-density bounds $1-1/512$ and $1-1/256$,
respectively. No asymptotic sign-distribution assumption or finite
range extrapolation is used.

## Source and priority

- [Gawron, Miska and Ulas, Monatshefte Math. 185 (2018), 307–360](https://doi.org/10.1007/s00605-017-1041-2),
  §5, Conjecture 5.8; exact accessible statement also at
  [arXiv:1703.01955, page 31](https://arxiv.org/pdf/1703.01955#page=31).
  Their §3.4 proves local sign and Turán facts for $t_2$, and the
  appendix compares positive and negative values of the whole sequence.
  Those statements do not give eventual sign densities conditioned
  on the two particular residues modulo 3.
- Searches by title, authors, conjecture number, Thue–Morse square
  signs and density, and three-residue sign patterns found no earlier
  disproof. The distinct Conjecture 5.2 concerns valuations, and the
  recent unboundedness and valuation papers do not address this
  sign-density statement. Priority is provisional.
