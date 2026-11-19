# The published L-solitaire limit-shape conjecture and a corrected theorem

**Research note (17 November 2026). Unrefereed.** This Markdown transcription is provided for searching and checking the mathematical arguments. The [four-page original PDF](proof.pdf) is the primary presentation and includes figures and an embedded verifier.

## Definition and the conjecture actually published

Fix a set of positive layer indices `L` containing 1. From each pile of size `j`, remove the cards at heights in `L intersect {1,...,j}`, measured from the bottom. Combine all removed cards into one new pile, and sort all piles in decreasing order. Write

```math
 \sigma(j)=|L\cap\{1,\ldots,j\}|,\qquad f(j)=j-\sigma(j),\qquad f(0)=0.
```

Both `sigma` and `f` are nondecreasing, with successive increments either zero or one. Each positive pile loses at least one card every turn.

In Eriksson, Jonsson and Sjoestrand (2020), Definition 2 defines the scaled profile of any partition `lambda` of mass `|lambda|` by

```math
 D_a(\lambda,x)=\frac{a}{|\lambda|}\lambda_{\lfloor ax\rfloor+1},\qquad a>0,\;x>0,
```

with zero parts appended. Their Definition 3 permits any **positive** scaling factors `a_n`. Definition 4 takes as stable reference on deck size `n` the stable partition with the largest mass at most `n`; call it `zeta^(n)`. Conjecture 1, in section 7, says that a pointwise limit of the stable references is also the common limit of recurrent configurations with the same scaling. The distinct Theorem 4 assumes a diverging scaling sequence; that assumption is **not** part of Definition 3 or Conjecture 1.

## The counterexample

For every deck size `n>=3` set

```math
 B=\lfloor n/2\rfloor+1,\qquad L_n=\{1,\ldots,B\}.
```

The map removes `min(B,j)` cards from each pile `j`. Since `B>n/2`,

```math
 (n)\longrightarrow(B,n-B)\longrightarrow(n)
```

is a genuine recurrent two-cycle. Indeed, both piles at the middle state are no larger than `B`, so the second move collects every card into one pile.

Set

```math
 h=\left\lfloor\frac{n+B}{2}\right\rfloor,\qquad
 \zeta^{(n)}=(h,h-B),\qquad s=2h-B\in\{n-1,n\},
```

omitting any zero part. This partition is stable: the top pile retains `h-B` cards and contributes `B` to the new pile; the smaller pile contributes all its `h-B` cards, so the new pile has `h` cards. All stable partitions for this rule have the form

```math
 S(j)=(j,(j-B)_+,(j-2B)_+,\ldots).
```

Their mass is strictly increasing with `j`. Since `B<=h<2B` and `|S(h+1)|>n`, the displayed `zeta^(n)` is exactly the stable reference from Definition 4, not an arbitrarily chosen fixed point.

Choose the scaling sequence `a_n=1`, which is allowed by Definitions 2--4. As `n->infinity`, `h/s->3/4` and `(h-B)/s->1/4`. Hence for every `x>0` the stable references converge pointwise to

```math
 \phi(x)=\begin{cases}
 3/4,&0\lt x<1,
 \\ 1/4,&1\le x<2,
 \\ 0,&x\ge2.
 \end{cases}
```

The recurrent sequence `rho^(n)=(n)` instead has the pointwise limit

```math
 \psi(x)=\begin{cases}1,&0\lt x<1,\\0,&x\ge1.\end{cases}
```

Since `phi(1/2)=3/4` and `psi(1/2)=1`, the published Conjecture 1 is false. With 101 cards this gives `(76,25)` stable and `(101)<->(51,50)` recurrent. These formulas hold for arbitrarily large decks, not just one example.

## The return-time lemma

Now fix an **arbitrary** admissible layer set `L`, not necessarily consecutive. Consider any directed cycle of states on `n` cards, parametrized in both time directions by `t`. Let `b_t` be the number of cards in the pile born at step `t`. Put `M=max_t b_t`, `m=min_t b_t`. Define the return time of a card born at bottom rank `r` by

```math
 \tau(r)=\begin{cases}1,&r\in L,\\1+\tau(f(r)),&r\notin L.\end{cases}
```

The recursion is well-founded: if `r` is not picked then `f(r)` lies in `{1,...,r-1}`, and `1 in L`. After one move the card drops to rank `f(r)`, regardless of other cards above it. This proves the formula for the number of moves until the card next joins a newly born pile.

**Lemma 1.** For every `r`, the indicator `1_{b_t >= r}` has period `tau(r)` on the cycle.

*Proof.* The ranks, measured at their **previous births**, of the cards arriving at step `t` form the set

```math
 A_t=\{r\le M:b_{t-\tau(r)}\ge r\}.
```

Every arriving card belongs to exactly one such birth rank; thus `|A_t|=b_t`. Of all subsets of `b_t` distinct positive integers, `{1,...,b_t}` uniquely minimizes the sum of ranks. Consequently

```math
 \sum_{r\in A_t}r\ge\sum_{r=1}^{b_t}r.
```

Summing over a full cycle, each rank `r` occurs as an arrival just as often as it occurs at births, because the time shift `t->t-tau(r)` permutes the cycle. Thus the sums over all `t` on both sides are equal. Every nonnegative summand in the inequality must be zero: `A_t={1,...,b_t}` for every `t`. In particular `b_t>=r` if and only if `b_{t-tau(r)}>=r`. QED.

**Lemma 2.** `f(M)<=m`.

*Proof.* If `m=M`, this is immediate. Otherwise, each rank `r` in `(m,M]` occurs at some but not all birth times. By Lemma 1 it cannot have return time 1, hence it cannot belong to `L`. Therefore `sigma` is constant with value `c=sigma(m)>=1` on `[m,M]`. If `M-m>c`, let `r=m+1` and `s=r+c<=M`. Then `f(s)=r`, so `tau(s)=tau(r)+1`. Presence of birth rank `s` implies presence of rank `r`, but both presence indicators are nonconstant; choose a birth time with `s` present and one with `r` absent. These two events recur with respective periods `tau(s)` and `tau(r)`. Since these integers are consecutive and coprime, the Chinese remainder theorem produces a time at which `s` is present but `r` is absent, a contradiction. Thus `M-m<=c` and `f(M)=M-c<=m`. QED.

## Uniform interlacing for arbitrary picking rules

Every stable partition is

```math
 S(j)=(j,f(j),f^2(j),\ldots)
```

with zero entries omitted, by the fixed-point characterization in the original paper. On a recurrent cycle, the pile born `k` turns earlier has current size `f^k(b_{t-k})`. By Lemma 2,

```math
 f^{k+1}(M)\le f^k(m),
```

so **birth-age order is already decreasing pile-size order**. Thus every recurrent configuration `rho` on the cycle satisfies the coordinatewise sandwich

```math
 S(m)\le\rho\le S(M).
```

Let `zeta=S(j)` be the original paper's reference fixed point, the one with largest mass at most `n`. The inequalities `|S(m)|<=n<=|S(M)|` and strict monotonicity of the stable mass in `j` imply `m<=j<=M`. Both `rho` and `zeta` lie in the same sandwich. Using `f^(k+1)(M)<=f^k(m)` gives the **one-column interlacing inequalities**, for all `i>=1`,

```math
 \boxed{\zeta_{i+1}\le\rho_i,\qquad\rho_{i+1}\le\zeta_i.}
```

This is exact for each finite deck and each admissible layer set.

## Limit at every diverging scale

**Theorem.** For any sequence of layer sets `L_n` with `1 in L_n`, for any positive scale sequence `a_n -> infinity`, and any `epsilon>0`, the normalized profiles of **every** recurrent state on `n` cards and the largest-mass admissible stable reference converge uniformly together for `x>=epsilon`. Therefore if the stable references converge pointwise on `x>0`, all recurrent configurations have the same pointwise limit.

*Proof.* Let `s=|zeta|` and let `d_i=zeta_i-zeta_(i+1)=sigma(zeta_i)`. Since `zeta_i` decreases and `sigma` is nondecreasing, the drops `d_i` are nonincreasing. The first `i` piles contain at least `(1+...+i)d_i` cards, yielding

```math
 d_i\le\frac{2s}{i(i+1)}.
```

For `i>=2`, the one-column interlacing inequalities and monotonicity of the drops give

```math
 |\rho_i-\zeta_i|\le d_{i-1}\le\frac{2s}{i(i-1)}.
```

The stable reference has mass `s<=n` with

```math
 0\le n-s\le\sqrt{2n}.
```

For completeness, let `ell` be the number of nonzero piles of `S(j)=zeta`. Increasing the top pile to `j+1` adds at most one to each of its `ell` existing piles and may create at most one final 1, since `f` is 1-Lipschitz. By maximality of `s`, `n-s<|S(j+1)|-s<=ell+1`; the integer gap therefore satisfies `n-s<=ell`. Since stable positive piles strictly decrease, `ell(ell+1)/2<=s<=n`; hence `ell<sqrt(2n)`.

Choose `a=a_n`, `x>=epsilon`, `a*epsilon>=2`, and `i=floor(a*x)+1`. Then `i>a*epsilon` and `i-1>=a*epsilon/2`. Using these bounds, `s<=n`, and `zeta_i<=s/i`,

```math
 \begin{aligned}
 |D_a(\rho,x)-D_a(\zeta,x)|
 &\le \frac{a}{n}|\rho_i-\zeta_i|
  +a\zeta_i\left(\frac{1}{s}-\frac{1}{n}\right)
 \\ &\le\frac{2a}{i(i-1)}+\frac{a(n-s)}{ni}
 \\ &\le\boxed{\frac{4}{a\epsilon^2}+\frac{\sqrt 2}{\epsilon\sqrt n}}.
 \end{aligned}
```

The right-hand side tends to zero uniformly over all layer sets, all recurrent configurations, and `x>=epsilon`. QED.

This theorem transfers all known stable limit-shape results in the diverging-scale regime to all recurrent states. In particular, it applies to the interpolation regime of the original paper's Theorem 5(c), not only the two extreme regimes separately handled in its section 9.

## Mechanical checks, earlier work, and limits of the claim

The [embedded Python verifier](verify.py) independently enumerates every partition and all `2^(n-1)` admissible layer sets for each deck size `1<=n<=14`, verifies the directed recurrent cycles, computes `tau`, and checks both lemmas and both interlacing inequalities. Its totals are: 16,383 rule instances, 1,768,137 rule--partition pairs, 20,531 directed cycles, and 48,426 recurrent states. It also tests the explicit counterexample for every `1<=n<=1000`. No part of the infinity-scale theorem depends on the exhaustive checks.

The 2017 preprint by these authors uses a different normalization, by the largest pile, but the same two-cycle also separates its profiles: for the stable state the height of the second pile tends to `1/3`, and for the one-pile recurrent state it is 1 at `x=7/8` (after the 2017 normalization). The 2020 paper is the precise target of the published-conjecture claim.

Hopkins (2024), Theorem 5, had already classified cycles for this consecutive-bottom-`B` picking rule (his `H_B`). Neither the existence of this simple two-cycle nor a separate limit-shape refutation is claimed to be a first discovery without a full priority investigation. The return-time/interlacing argument is presented as an unrefereed theorem, not a claim of established priority.

### References

1. K. Eriksson, M. Jonsson and J. Sjoestrand, *Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire*, *Online Journal of Analytic Combinatorics* 15 (2020), paper 10. [PDF](https://combinatorialpress.com/article/ojac/vol15/192.pdf). See Definitions 2--4, Lemma 3, Theorems 4--5 and Conjecture 1.
2. B. Hopkins, *Henrik Eriksson's Bulgarian Solitaire Variant*, *INTEGERS* 24A (2024), article A9, Theorem 5. [PDF](https://math.colgate.edu/~integers/a9Proc23/a9Proc23.pdf).
