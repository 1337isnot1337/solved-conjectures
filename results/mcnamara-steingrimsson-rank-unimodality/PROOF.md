# Counterexample to rank-unimodality of permutation pattern intervals

**A closed interval in the classical permutation pattern poset has rank sizes
$`8{,}598{,}793{,}292{,}661 > 8{,}598{,}464{,}986{,}146 < 8{,}599{,}053{,}474{,}845`$ at relative ranks 44, 45 and 46.**
This disproves Conjecture 9.4 of McNamara and Steingrímsson, which counts each
distinct permutation once under subsequence pattern containment. The authors
checked all top permutations of length at most 8. Vatter restated the conjecture
as Conjecture 2.2. [Original paper, Conjecture 9.4](https://strathprints.strath.ac.uk/52872/1/McNamara_Steingrímsson_JCTSA2015_topology_of_the_permutation_pattern_poset.pdf) | [Vatter, arXiv:2602.16355v3](https://arxiv.org/abs/2602.16355v3)

## The interval

Use $`\oplus`$ for the direct sum of permutations. For a composition $`v`$,
write $`L(v)`$ for the direct sum of decreasing permutations with lengths
given by the parts, in order. Write $`P(v)=1\ominus L(v)`$ for the
permutation obtained by placing a new maximum before $`L(v)`$. Define
```math
u=(1,1,1,2)^8(1),\qquad w=(2)^{33},\qquad
\alpha=P(u),\qquad \pi=P(w),\qquad t=1628.
```
The notation for $`u,w`$ means concatenation of composition parts. Set
```math
\sigma=\alpha\oplus\pi^{\oplus(t-1)},\qquad
\tau=\alpha\oplus\pi^{\oplus t}.
```
Here $`|\alpha|=42`$, $`|\pi|=67`$, $`|\sigma|=109051`$ and
$`|\tau|=109118`$. Relative rank $`r`$ means length $`|\sigma|+r`$.

For a permutation $`\rho`$, let
```math
F_\rho(x)=\sum_{\eta\le \rho}x^{|\eta|}
```
include the empty pattern. Let $`R_{\gamma,\rho}(x)`$ count the closed
interval $`[\gamma,\rho]`$ by relative rank.

## Counting the interval

Both $`\alpha`$ and $`\pi`$ are sum-indecomposable because their first
entries are their maxima. An occurrence of a sum-indecomposable pattern
in a direct sum lies within a single summand. An occurrence using points
on both sides of a sum boundary would realize a nontrivial sum.
The sum-indecomposable components of a permutation are uniquely recovered
by cutting after each proper initial segment whose values are precisely
the smallest values.

### The interval between the two pointed permutations

The layered permutations $`L(u)`$ and $`L(w)`$ avoid 312. An ascent crosses
a layer boundary, where all the later values are larger than the earlier
ones. The permutation $`\alpha`$ contains 312 because its leading maximum
can be followed by an ascent across two layers.

Consequently every pattern of $`\pi`$ containing $`\alpha`$ uses the
leading maximum and has the form $`1\ominus v`$ for a pattern $`v`$ of
$`L(w)`$. Each such pattern is sum-indecomposable. An occurrence of
$`\alpha`$ in $`1\ominus v`$ must use the leading maximum again, so deleting
it gives a bijection with $`[L(u),L(w)]`$ that preserves relative ranks.

A subpattern of $`L(w)`$ retains at most one nonempty layer from each of
its 33 layers. An occurrence of $`L(u)`$ must use 33 distinct layers.
A decreasing layer of $`L(u)`$ cannot cross a boundary of a host layer,
and the ascents between successive layers of $`L(u)`$ force distinct
host layers. Thus any layered permutation in $`[L(u),L(w)]`$ has exactly
33 layers and satisfies the size constraints coordinate by coordinate.
Eight sizes are fixed at 2 and each of the other 25 sizes is independently
1 or 2. The layer sizes determine the permutation. It follows that
```math
R_{\alpha,\pi}(x)=(1+x)^{25}.
```

### The interval with one additional sum component

A pattern of $`\alpha\oplus\pi`$ containing $`\alpha`$ has an occurrence
of $`\alpha`$ inside one of the two summands. If the first summand is
retained in full, this gives the family $`\alpha\oplus\zeta`$ for
$`\zeta\le\pi`$. Its rank polynomial is $`F_\pi`$. The other family has
the form $`\eta\oplus\zeta`$ where $`\eta`$ is a proper pattern of
$`\alpha`$, possibly empty, and $`\zeta\in[\alpha,\pi]`$.
The last sum-indecomposable component is $`\zeta`$, so these pairs give
distinct patterns. The two families overlap only at $`\alpha`$.
The first family's first component is $`\alpha`$, while in the
other family a nonempty $`\eta`$ is too short to start with a component
of that length. An empty $`\eta`$ gives the single component $`\zeta`$,
so overlap requires $`\zeta=\alpha`$. Therefore
```math
R_{\alpha,\alpha\oplus\pi}(x)
=F_\pi(x)+\bigl(F_\alpha(x)-x^{42}\bigr)(1+x)^{25}-1.
\tag{1}
```

### The repeated sum components

In an embedding of $`\sigma`$ in $`\tau`$, each of the $`t-1`$ copies of
$`\pi`$ occupies a distinct full $`\pi`$ summand of $`\tau`$.
It cannot use any of the initial $`\alpha`$ summand, which is shorter
than $`\pi`$. Consider which of the $`t`$ copies of $`\pi`$ is omitted
by this embedding.

If the omitted summand is the first, the resulting elements of
$`[\sigma,\tau]`$ comprise exactly
```math
\{\,\beta\oplus\pi^{\oplus(t-1)}
  :\ \beta\in[\alpha,\alpha\oplus\pi]\,\}.
```
The prefix $`\beta`$ is recovered by deleting the fixed suffix, and
relative ranks are preserved.

If the omitted summand is later, the embedding uses the first whole
$`\pi`$ summand. It must then embed $`\alpha`$ wholly in the initial
$`\alpha`$, so that summand is retained in full. The omitted $`\pi`$
summand may contribute any of its subpatterns. At interior ranks
$`1\le r\le 66`$ this contribution is a nonempty proper pattern of
length $`r`$. Each resulting permutation has a non-$`\pi`$ component
after its first $`\pi`$ component. Its sum decomposition identifies the
insertion position among the full $`\pi`$ components and the contributed
subpattern. This shows distinctness for all later omission positions
and choices of subpattern.

The family with first omission has no non-$`\pi`$ component after its
first $`\pi`$ component. In its prefix $`\beta`$, any $`\pi`$ component
can come only from the full second summand of $`\alpha\oplus\pi`$ and
must occur last in $`\beta`$. This proves disjointness at interior ranks.
The interval endpoints each contribute one. With (1) the full rank
polynomial is
```math
R_{\sigma,\tau}(x)=
tF_\pi(x)+G(x)-t-(t-1)x^{67},\qquad
G(x)=\bigl(F_\alpha(x)-x^{42}\bigr)(1+x)^{25}.
\tag{2}
```

## Exact coefficients

For a composition $`v`$ with parts in $`\{1,2\}`$, let $`D_v(x)`$
count its distinct generalized subwords by weight, including the
empty word. A generalized subword matches each chosen letter to an
increasing sequence of host positions with host letter at least the
chosen letter. This is exactly the containment rule between layered
permutations. For $`v=u,w`$, the downset of $`P(v)`$ splits into patterns
of $`L(v)`$ and patterns obtained by adding a leading maximum to such
patterns. The two sets overlap only on the decreasing permutations of
length 1 and 2. Adding a leading maximum to any pattern with an ascent
creates 312, and both hosts have largest layer size 2. Hence
```math
F_{P(v)}(x)=(1+x)D_v(x)-x-x^2.
\tag{3}
```

For $`w`$, any word over the letters $`1,2`$ of length at most 33 is
a generalized subword. Thus
```math
D_w(x)=\sum_{j=0}^{33}(x+x^2)^j.
\tag{4}
```

To calculate $`D_u`$, greedily match the first letter of a nonempty
subword to the earliest possible host position. A suffix can be
matched after that position whenever it can be matched after any
position allowed for the first letter. With a host suffix $`v`$, this
gives $`D_{2v}=1+(x+x^2)D_v`$. For a host beginning with
$`s\ge 1`$ copies of 1 followed by 2, starting with letter 1 leaves the
suffix $`1^{s-1}2v`$, and starting with letter 2 leaves $`v`$. Therefore
$`D_{1^s2v}=1+xD_{1^{s-1}2v}+x^2D_v`$. Put
```math
A(x)=1+x+x^2+x^3,\qquad C(x)=x^2+x^3+2x^4+x^5.
```
Expanding the recurrence for $`s=3`$ gives $`D_{1112v}=A+C D_v`$.
Applying it eight times and using $`D_{(1)}=1+x`$ yields
```math
D_u(x)=A(x)\sum_{j=0}^7 C(x)^j+C(x)^8(1+x).
\tag{5}
```

Equations (2) through (5) give the following integer coefficients.

| Relative rank $`r`$ | $`[x^r] F_\pi(x)`$ | $`[x^r]G(x)`$ | Rank size |
|---:|---:|---:|---:|
| 44 | 1,503,326,622 | 6,151,377,552,045 | 8,598,793,292,661 |
| 45 | 2,106,401,227 | 5,169,243,788,590 | 8,598,464,986,146 |
| 46 | 2,775,276,049 | 4,080,904,067,073 | 8,599,053,474,845 |

The decrease of 328,306,515 followed by an increase of 588,488,699
violates weak unimodality. The ranks are interior to the closed interval,
so the same dip occurs if one omits its endpoints.

[Audit and reproduction](AUDIT.md) · [Exact checker](verify.py)
