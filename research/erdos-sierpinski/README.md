# Erdős–Sierpiński conjecture: odd squarefree members must accumulate prime factors

Tracking issue: [#343](https://github.com/1337isnot1337/solved-conjectures/issues/343).

**Status:** Proof of an effective complexity obstruction, not a resolution of the conjecture. Priority is not asserted.

The Erdős–Sierpiński conjecture asks whether `σ(n)=σ(n+1)` infinitely often, where σ denotes the sum of positive divisors. Fatehizadeh and Luca explicitly record this as the classical open case of Conjecture 5.4 in their [September 2026 preprint](https://arxiv.org/html/2609.04980v1#S5.SS3). Ford's [IMRN paper](https://doi.org/10.1093/imrn/rnaa218) proves infinitude at a positive proportion of shifts, not at shift 1. See also [Yamada](https://arxiv.org/abs/1001.2511) for fixed-core two-prime families and bounds for the other solutions, and [Benito](https://arxiv.org/abs/0707.2190) for computations. Searches of the exact equation with squarefree, bounded-factor, and abundancy qualifiers did not locate the following one-sided statement. This is not an exhaustive literature claim.

## The result

Let `n≥2` satisfy `σ(n)=σ(n+1)`. Write `e` for the even and `o` for the odd member of the pair. Assume that `o` is squarefree, and put `K=ω(e)+ω(o)`, where ω counts distinct prime factors. Let `r` count the primes `p` for which `p²|e`. Then

```text
n ≤ (2(K+1)2^K)^(2^(K+r−1)).
```

In particular, if the odd member is squarefree and the total number of distinct prime factors is bounded, only finitely many solutions are possible, regardless of the exponents on the even side. Quantitatively, with absolute constants,

```text
K+r ≥ log₂(log n) − O(1+log log log n)
```

as `n→∞`; in particular `ω(o)+2ω(e)` satisfies the same lower bound. If both members are squarefree, `K` itself satisfies it.

## A valuation obstruction

For a prime `p`, put `A(p,a)=1+p^(-1)+···+p^(-a)` for positive integer `a`, and `A(p,∞)=p/(p−1)`. Take two finite disjoint prime supports `E,O`, with `2∈E`, and allow every exponent on `E` to be any positive integer or ∞. Then

```text
∏_(p∈E) A(p,a_p) ≠ ∏_(p∈O) A(p,1).
```

If `O` is empty, its product is 1 and the even-side product is at least 3/2. Otherwise, write `P=max O`. The right product has `P`-adic valuation −1: for each odd prime `p<P`, one has `p+1<P`, while `P∤P+1`. A finite-exponent factor on the left cannot contribute a negative `P`-adic valuation, because its denominator is a power of a prime distinct from `P`. Equality would therefore require some saturated prime `q∈E` with `P|(q−1)`, hence `q>P`.

Take the largest saturated prime `Q` on the left. The numerator of its own factor contributes one to `v_Q`; no denominator from another saturated factor can contain `Q`, because that denominator is smaller than `Q`. No finite-exponent denominator can contain it either. So the left product has positive `Q`-adic valuation. The right product contains no `Q` in its numerator or denominator: `Q>P` and both are odd, so every `p+1` is strictly below `Q`. Contradiction.

Thus unequal products in this class differ by at least `1/D` whenever `D` is the product of their displayed (unreduced) denominators.

## Effective bound

Write `I(m)=σ(m)/m`. Each local factor of `I(e)` or `I(o)` is at most 2. We approximate both indices by replacing some local factors by 1 (omitted), some factors on the even side by `A(p,∞)` (saturated), and taking the other factors exactly. The factor at 2 is always present. A prime of exact exponent 1, even or odd, is never saturated. Let `D` be the product of the displayed denominators, one for each present factor, namely `p^a` for an exact factor and `p−1` for a saturated one. Let `u,v` denote the even and odd approximants.

Start with only the factor at 2: if its exponent is 1, use it exactly; otherwise saturate it. Thus `D₀≤2`. At any stage set

```text
T = min({n} ∪ {p : the factor at p is omitted}
            ∪ {p^(a+1) : the factor at p is saturated and its true exponent is a}).
```

Each omitted factor has absolute error at most `1/(p−1)≤2/T`. The saturation error is precisely `p^(−a−1)/(1−1/p)≤2/T`. Telescoping products, whose factors are all at most 2, bounds the sum of the errors for the two indices by `K·2^K/T`. Also, with `S=σ(n)=σ(n+1)`,

```text
|I(e)−I(o)| = S/(n(n+1)) ≤ 2^K/n ≤ 2^K/T.
```

The valuation obstruction therefore gives

```text
1/D ≤ |u−v| ≤ (K+1)2^K/T.
```

Write `C=(K+1)2^K`. If `T=n`, then `n≤CD`, so stop. If a prime `p` with an omitted factor attains `T`, include it exactly when its exponent is 1, and saturate it otherwise. Its denominator is at most `p=T≤CD`, so `D_new≤CD²`. If a saturated factor attains `T`, replace it by the true `A(p,a)`; the new denominator `p^a≤T≤CD` again yields `D_new≤CD²`. Ties involving `n` may always be stopped first.

Each prime is included once and only the `r` repeated primes may need the extra transition from saturation to exact evaluation. The initial inclusion of 2 is already done, so at most `K+r−1` transitions occur. If no earlier stop occurs, all factors become exact and the remaining minimum is `n`. The recurrence for `F=CD` is `F_new≤F²` and `F₀≤2C`. Therefore

```text
n ≤ (2C)^(2^(K+r−1)),
```

as claimed. Taking two logarithms gives `log₂(log n)≤K+r+O(1+log K)`. To write the error in terms of `n`, either `K≥log₂(log n)` already, or `log K=O(1+log log log n)`.

## A nonsquarefree odd-side extension

The same argument applies when the odd member is **cubefree** and every prime divisor of either member is either 3 or congruent to 2 modulo 3. Replace the displayed upper bound for n by `(2(K+1)2^K)^(3^(K+r−1))`. The restriction is on the prime supports, not a bound on the exponents on the even side.

Indeed, for a prime Q≡2 mod 3, no integer x makes Q divide x²+x+1: if x=1 mod Q then Q would divide 3; otherwise x would have multiplicative order 3 modulo Q. For the largest odd-support prime P, this excludes any numerator from the lower odd-side squared primes when P>3, and if P=3 there is no lower odd prime. First-power numerators from lower odd primes are less than P, and the factor at P contributes strictly negative valuation. Thus equality still forces a saturated even-support prime Q>P. The largest such Q is congruent to 2 modulo 3 (it exceeds 3), so it divides no odd-side squared-prime numerator either, while all odd-side first-power numerators are smaller than Q. The valuation contradiction follows as before.

In the effective approximation keep every odd-side exponent exact when bringing in that prime; never saturate it. The omitted-factor and even saturation errors are unchanged. Including an odd prime now costs a factor at most p²≤(CD)² in the denominator. Thus F=CD evolves by at most F↦F³ (all other transitions still obey F↦F²), with the same transition count. This gives the claimed bound and a corresponding logarithmic lower bound on the combined number of factors. No claim is made for cubefree odd members with unrestricted prime support.

## Scope and a barrier to fixed-core prime templates

Suppose a hypothetical infinite family can be written `e=AX, o=BY` for *fixed* positive coprime cores `A,B`, with each factorization coprime and with `I(X),I(Y)→1`. This includes the usual identities with a fixed finite product of moving primes or prime powers multiplying each fixed core. The equality of sums and the consecutive shift give `I(A)=I(B)` on taking limits. If `A` is even and `B` odd, the shared reduced denominator divides both cores and is therefore 1. Neither core can have index 1, so this family requires coprime even and odd multiperfect numbers of the same order. In the usual moving-prime application `A` is necessarily even, since all sufficiently large moving primes are odd. If `B` is squarefree, this pair is impossible by the largest-prime obstruction.

Unequal abundance limits are not automatic when the odd core is allowed to saturate: for example, `A(3,∞)=A(2,1)=3/2`, with disjoint supports. This is not just an artificial product identity. If the even member is `2p` and the odd member is `3^a q`, with primes `p>2`, `q≠3`, write `T=3^a` and `h=3^a q−2p∈{−1,1}`. The equality `σ(2p)=σ(3^a q)` is then equivalent to

```text
q = 3T+3h−7,
p = (Tq−h)/2.
```

Indeed, substituting `2p=Tq−h` into `3(p+1)=((3T−1)/2)(q+1)` gives the displayed expression for `q`, and every step is reversible. The two expressions still have to be prime, and no infinitude claim follows. This explains why the one-sided squarefree assumption cannot simply be removed from the valuation argument. The result neither bounds all possible factorizations at a solution nor proves that infinitely many solutions exist.
