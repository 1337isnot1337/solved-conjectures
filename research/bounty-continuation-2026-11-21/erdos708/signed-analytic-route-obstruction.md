# Erdős 708: signed analytic route and the surviving obstruction

Date: 21 November 2026. Status: no proof or disproof of the full problem. This note records an analytic attempt after the all-interval transfer was identified as prior work.

## Exact goal

For a finite set of primes and weights $`0\le w_p\le1`$, define

```math
X_w(m)=\sum_p w_pv_p(m).
```

The sought uniform inequality is

```math
\sum_{m=1}^{M}(X_w(m)-2)_+
\le\sum_{b=x+1}^{x+M}(X_w(b)-1)_+.
\tag{H2}
```

An appropriate uniform fractional bound of coefficient two would imply the paid asymptotic assertion by Wang's prior transference theorem. The inequality above is not proved here. In particular, a negative individual summand in a decomposition does not disprove the complete sum.

## Prior obstructions checked first

Wang's [pinned obstruction record](https://github.com/science-prince/erdos-708-interval-divisor-covers/blob/fc929346e7dbe0e818070ef90e4dfbfa06169527/evidence/BLOCKED.md) gives two relevant limitations:

- B30 excludes a universal nonnegative divisor certificate for any fixed hinge threshold, even if its domination requirement is imposed only on the actual target interval. The record traces this mechanism to earlier Chen work. The five-coordinate positive kernel therefore cannot simply be extended unchanged to arbitrary support.
- B38 excludes a generic signed sandwich with only a linear total negative coefficient mass. Later files strengthen the quantitative obstruction. Charging every negative divisor coefficient its own worst possible floor error does not preserve a sublinear correction.

These are earlier method obstructions, not new results in this session. They motivated keeping the signs and the actual interval discrepancies instead of discarding them.

## An exact signed identity

First consider bounded binary prime profiles

```math
\omega_P(m)=\#\{p\in P:p\mid m\}.
```

This is a bounded-profile subproblem, not the same function as the raw valuation sum $`\sum_{p\in P}v_p(m)`$. A universal bounded-profile theorem can be used with the existing tail-truncation argument, but a theorem for binary profiles alone would not settle arbitrary real weights.

For $`J\subseteq P`$, write $`d_J=\prod_{p\in J}p`$, and define

```math
\delta_J(x,M)=
\left\lfloor\frac{x+M}{d_J}\right\rfloor
-\left\lfloor\frac{x}{d_J}\right\rfloor
-\left\lfloor\frac{M}{d_J}\right\rfloor.
```

Each discrepancy is exactly zero or one, including when $`d_J>M`$. Inclusion–exclusion gives the pointwise identity

```math
(\omega_P(m)-1)_+
=\sum_{\substack{J\subseteq P\\|J|\ge2}}
(-1)^{|J|}1_{d_J\mid m}.
\tag{1}
```

Since $`(t-1)_+-(t-2)_+=1_{t\ge2}`$ for integer $`t\ge0`$, summing (1) proves

```math
\begin{aligned}
&\sum_{b=x+1}^{x+M}(\omega_P(b)-1)_+
-\sum_{m=1}^{M}(\omega_P(m)-2)_+\\
&\qquad=
\#\{m\le M:\omega_P(m)\ge2\}
+\sum_{\substack{J\subseteq P\\|J|\ge2}}(-1)^{|J|}\delta_J(x,M).
\end{aligned}
\tag{2}
```

Thus even this binary bounded-profile route needs a bound on the complete alternating discrepancy sum. The individual facts $`\delta_J\in\{0,1\}`$ do not provide such a bound by absolute values. The needed cancellation is tied to a single common shift $`x`$ across all products $`d_J`$. No uniform estimate of the required sign was obtained.

Formula (2) is an exact reformulation and an elementary inclusion–exclusion calculation. It is not claimed as a novel theorem, and it does not make the original problem easier by itself.

## Averaging only over the threshold does not repair a prime term

The next attempted simplification was to use the scaled-interval telescoping formula and prove that each prime's contribution becomes nonnegative after integration over its threshold. The following uniform family rules out that simplification.

Let $`L`$ be sufficiently large. Hensley and Richards prove that the maximum number of integers in a length-$`L`$ interval that avoid the small prime divisors exceeds

```math
\pi(L)+c\frac{L}{(\log L)^2}
```

for every fixed $`c<\log2`$, once $`L`$ is large enough. This is an unconditional theorem about rough integers or admissible configurations. It is not an unconditional theorem that an actual interval contains more primes than the first $`L`$ integers.

Primary source: D. Hensley and I. Richards, *Primes in intervals*, Acta Arithmetica 25 (1974), 375–391, [publisher record](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/25/4/100146/primes-in-intervals), [primary PDF](https://matwbn.icm.edu.pl/ksiazki/aa/aa25/aa2548.pdf). The rough-number function and its unconditional meaning are defined on printed p. 378; the theorem is stated in §2 on p. 380. Changing a strict small-prime cutoff to $`p\le L`$ costs at most one point and does not affect the argument below.

Choose a positive interval $`J=\{z+1,\ldots,z+L\}`$ containing $`R>\pi(L)+1`$ integers divisible by none of the primes at most $`L`$. Put

```math
Y(m)=\sum_{\substack{q\le L\\q\ \mathrm{prime}}}v_q(m).
```

For every $`0\le s<1`$, the two level-set counts are constant as functions of $`s`$:

```math
\#\{k\le L:Y(k)>s+1\}=L-1-\pi(L),
```

```math
\#\{b\in J:Y(b)>s\}=L-R.
```

The first count is the number of composites in $`[1,L]`$, including prime powers. The second is the number of interval elements that have at least one prime divisor at most $`L`$. Consequently

```math
\int_0^1\left(
\#\{b\in J:Y(b)>s\}
-\#\{k\le L:Y(k)>s+1\}
\right)\,ds
=\pi(L)+1-R<0.
\tag{3}
```

The deficit persists across the entire integration range. It is not a phenomenon at a single threshold of measure zero.

### Embedding as a complete single-prime increment

Choose a prime $`p>L`$. The rough-number pattern is periodic modulo the product of the primes at most $`L`$. By the Chinese remainder theorem, the same pattern can be realized with $`z\equiv0\pmod p`$. Set

```math
M=pL,\qquad x=pz,
```

and add the prime $`p`$ with weight one to the active primes at most $`L`$, also of weight one.

The multiples of $`p`$ in $`[1,M]`$ have cofactors $`1,\ldots,L`$, while those in $`(x,x+M]`$ have cofactors $`z+1,\ldots,z+L`$. There are no multiples of $`p^2`$ in either interval: $`p^2>M`$, and the chosen target interval starts immediately after a multiple of $`p^2`$ and has length less than $`p^2`$.

Because $`Y(pm)=Y(m)`$, adding the new prime changes the source threshold-two sum by exactly $`L-1-\pi(L)`$, and changes the target threshold-one sum by exactly $`L-R`$. Hence the complete increment in target minus source is

```math
\pi(L)+1-R<0.
\tag{4}
```

This rules out an induction that requires each added prime's full integrated contribution to be nonnegative. Other primes may compensate, and the complete hinge inequality has not been disproved.

## Global follow-up: average over every prime order

Averaging over the threshold of one fixed prime order fails by (4). A different
attempt averages the complete telescoping decomposition over all orders of the
active primes. This permits contributions to move between prime positions.

For $`r`$ nonnegative coordinates $`u_i\ge0`$, define the order-averaged allocation

```math
\Phi_{i,c}(u)=
\sum_{S\subseteq[r]\setminus\{i\}}
\frac{|S|!(r-|S|-1)!}{r!}
\left[
\left(\sum_{j\in S}u_j+u_i-c\right)_+
-\left(\sum_{j\in S}u_j-c\right)_+
\right].
\tag{5}
```

For each order the increments telescope, so averaging gives the exact identity

```math
\sum_i\Phi_{i,c}(u)=\left(\sum_i u_i-c\right)_+.
\tag{6}
```

This is the usual Shapley allocation formula applied to the hinge. It is an
identity, not a proof of any arithmetic inequality. A sufficient next assertion
would be, with $`u_p(m)=w_pv_p(m)`$ for the raw valuation problem,

```math
\sum_{b\in I}\Phi_{p,1}(u(b))
\ge\sum_{m=1}^{M}\Phi_{p,2}(u(m))
\quad\text{for every active prime }p.
\tag{7}
```

Unlike the fixed-order claim refuted above, (7) allows compensation across all
possible earlier-prime sets before comparing a prime's total contribution.
It has not been proved here and must not be used as a lemma.

### The explicit remaining inequality already in the binary case

If $`u_p(m)=1_{p\mid m}`$ and $`t=\omega_P(m)`$, a prime dividing $`m`$ is
equally likely to occupy each of the $`t`$ relevant positions. Therefore

```math
\Phi_{p,1}(u(m))=\frac{(t-1)_+}{t},\qquad
\Phi_{p,2}(u(m))=\frac{(t-2)_+}{t}
\quad (p\mid m).
\tag{8}
```

Both are zero when $`p\nmid m`$. Scaling the $`p`$-multiples reduces (7) to
the following still-unproved uniform comparison. For every finite prime set
$`Q`$, positive length $`L`$, and length-$`L`$ interval $`J`$, it would suffice
to show

```math
\sum_{k=1}^{L}\frac{(\omega_Q(k)-1)_+}{\omega_Q(k)+1}
\le
\sum_{b\in J}\frac{\omega_Q(b)}{\omega_Q(b)+1}.
\tag{9}
```

For a general original interval length M, the source has L=floor(M/p) multiples of p. The target has at least L consecutive cofactors; discard any extra cofactor, since its contribution is nonnegative. The remaining primes form Q, which excludes p, so scaling by p preserves their divisibility indicators. Thus a uniform proof of (9) would supply the binary specialization of (7). The case L=0 is immediate.

Equivalently, with $`R_0=\#\{k\le L:\omega_Q(k)=0\}`$,

```math
\sum_{b\in J}\frac1{\omega_Q(b)+1}
\le 2\sum_{k=1}^{L}\frac1{\omega_Q(k)+1}-R_0.
\tag{10}
```

This reciprocal-overlap inequality concerns the complete joint distribution
of divisibility indicators. Separate lower bounds for the number of multiples of each prime do not prove it. An abstract model with six binary coordinates and three positions makes the limitation precise. Give the source positions profiles

```math
(1,1,1,0,0,0),\quad(0,0,0,1,1,1),\quad(0,0,0,0,0,0),
```

and give the target positions profiles

```math
(1,1,1,1,1,1),\quad(0,0,0,0,0,0),\quad(0,0,0,0,0,0).
```

Every coordinate has total one on both sides. Nevertheless, the source sum in (9) is one, while the target sum is 6/7. Even every nonempty joint-coordinate intersection count on the target is at least its source count. This is not an arithmetic-interval construction and does not refute (9). It proves that those abstract count inequalities alone are insufficient; a proof must use further arithmetic structure.

The positive-divisor and generic signed-error arguments checked above do not
supply the missing joint estimate either. No uniform arithmetic proof of
(9), its arbitrary-weight version (7), or an alternative sum-level estimate
was obtained. In particular, (9) must not be silently promoted from a proposed
sufficient condition to a fact.

### Bounded diagnostic, not proof evidence

`probe_order_average.py` evaluates (5) with exact integer scaling for first-power
profiles on the primes $`2,3,5,7,11,13`$. It examined 73 fixed rational weight
vectors and 14 fixed interval lengths, with every shift in the period 30030,
testing all six coordinates. `order-average-probe.json` records no violating
coordinate in those 1022 profile/length pairs. The finite check is merely a
falsification attempt; no universal conclusion follows from its failure to
find a counterexample. It was not enlarged into a sequence of numerical cases.

A repository search for “Shapley,” “random order,” “permutation,” and “prime
order” did not locate this exact formulation in Wang's indexed record. That
bounded search is not evidence of novelty. The allocation formula itself is
standard, and no new theorem is claimed for its use here.

## Source correction and exact remaining gap

Bergström's [second companion](https://zenodo.org/records/24342718), Remark 9(3), already invokes a Hensley–Richards obstruction at threshold zero. Two distinctions are required when using it:

1. The unconditional input concerns rough intervals. A conclusion about an excess of actual primes needs the additional prime-tuples hypothesis.
2. In the unit-weight construction, integration over the threshold alone leaves the deficit unchanged. A successful argument must retain compensation between prime contributions, valuation layers, or another global structure.

The obstruction is a sharpened scope audit of an existing mechanism, not a newly solved conjecture. The global order-averaging follow-up stops at the explicit unproved joint inequality (7), already nontrivial in the reciprocal form (10). No such theorem was proved, no symbolic violation of the complete hinge was found, and no numerical search is used as evidence of a full result. Full paid-target completion count remains zero.
