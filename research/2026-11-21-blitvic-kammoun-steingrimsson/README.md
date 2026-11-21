# Blitvić–Kammoun–Steingrímsson's conjecture

Date: 21 November 2026. Status: research in progress; no resolution or result-count increment.

## Exact target

Conjecture 10.6 in Blitvić, Kammoun and Steingrímsson, *Permutations, Pattern Covers, Posets and Positivity, Part II: Regular Pattern Packings and Moment Sequences*, arXiv:2611.12829v1 (9 November 2026), asserts that the overlap-one packing counts `(N(r+1))` form a Stieltjes moment sequence for every permutation pattern of every length at least two. Prescribed occurrences start at regularly spaced positions; additional occurrences are allowed.

Primary source: https://arxiv.org/abs/2611.12829

Accessible author-manuscript mirror: https://arxiv.cnoctave.top/pdf/2611.12829

Coordination: [issue #161](https://github.com/1337isnot1337/solved-conjectures/issues/161).

The source proves endpoint gaps one and two and the cases with an endpoint equal to the minimum or maximum pattern letter. Its earlier universal all-overlap conjecture is already refuted in the same paper. That different conjecture is not a target here.

## An exact recurrence for every overlap-one pattern

By reversal or value complementation suppose the first endpoint is smaller than the last. Put

```math
a=\pi_1-1,\qquad c=\pi_K-\pi_1,\qquad b=K-\pi_K,\qquad d=K-1=a+b+c.
```

Here `a,b` are nonnegative integers and `c` is a positive integer. This notation is local to this note. There are `1+jd` elements in the poset for `j` prescribed occurrences.

For each occurrence, the chain has `a` elements below its first endpoint, `c-1` elements between its endpoints and `b` elements above its last endpoint. The shared endpoints have labels ordered as `0 < y_0 < ... < y_j < 1`. All nonshared elements belong to only one occurrence. Integrating their ordered labels gives the order-polytope volume

```math
E_j=\int_{0<y_0<\cdots<y_j<1}
\prod_{i=0}^{j-1}
\frac{y_i^a(y_{i+1}-y_i)^{c-1}(1-y_{i+1})^b}
 {a!\,(c-1)!\,b!}\,dy_0\cdots dy_j.
```

Every linear extension occupies a simplex of volume `1/(1+jd)!`, so

```math
N(j)=(1+jd)!E_j.
```

Consequently, with `H_0(v)=1`,

```math
H_j(v)=\frac{(1-v)^b}{a!b!(c-1)!}
       \int_0^v u^a(v-u)^{c-1}H_{j-1}(u)\,du,
\qquad E_j=\int_0^1 H_j(v)\,dv.
```

For exact computation define integer exponential coefficients by

```math
(b!)^jH_j(v)=\sum_p t_{j,p}\frac{v^p}{p!}.
```

Initially `t_(0,0)=1`. For each old index `p`, put `q=p+a+c`. For `0 <= k <= b`, add

```math
t_{j-1,p}\binom{p+a}{a}(-1)^k\binom bk\frac{(q+k)!}{q!}
```

to `t_(j,q+k)`. Multiplication by `u^a/a!`, followed by `c` integrations and multiplication by `(1-v)^b`, proves this recurrence. Since every occurring degree is at most `jd`, the count is computed with integers as

```math
N(j)=\frac{1}{(b!)^j}
      \sum_p t_{j,p}\frac{(1+jd)!}{(p+1)!}.
```

No floating-point subtraction is used.

## Checks and present outcome

The implementation in `diagnostics.py` checks the known rooted formula

```math
N(j)=\prod_{i=0}^{j-1}\binom{i(b+c)+b}{b}\quad(a=0),
```

the symmetry in `a,b`, and the independent two-occurrence formula

```math
N(2)=\binom{2a+c}{a}\binom{2b+c}{b}.
```

For the first unknown endpoint configuration `(a,b,c)=(1,1,3)` the counts begin

```
1, 25, 2100, 373500, 114435000, 53727381000,
35844862284000, 32236835771448000.
```

Exact Bareiss elimination found all leading and once-shifted leading Hankel determinants through order 12 strictly positive for the 294 triples `1 <= a <= b <= 6`, `3 <= c <= 16`.

Reproduce with:

```
python3 diagnostics.py --max-a 6 --max-b 6 --max-c 16 --size 12
```

These finite checks establish no moment representation and no full resolution. They only eliminate small Hankel obstructions in this range. A counterexample would require an exact negative principal minor; a positive answer requires a uniform measure or positivity construction.

Both search engines were used with the exact authors, paper identifier, conjecture number, overlap-one terminology, proof and counterexample terms. The retrieved material includes the new primary paper, author/index pages and the separate public refutation of the Part I maximum-packing conjecture. No resolution of Conjecture 10.6 was located in that initial screen. A deeper priority audit is required if a proof is found.
