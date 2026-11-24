# Erdős–Mollin–Walsh conjecture: super-Wieferich constraints on perfect-power centers

Tracking issue: [#354](https://github.com/1337isnot1337/solved-conjectures/issues/354).

**Status:** Structural obstruction and a conditional fixed-base finiteness theorem. This is not a proof of the conjecture. Priority is not asserted.

The conjecture asks whether three consecutive positive integers can all be powerful (a prime dividing a powerful integer always divides it at least to the second power). The original [Mollin–Walsh paper](https://doi.org/10.1155/S0161171286000984), [Chan 2025](https://math.colgate.edu/~integers/z7/z7.pdf), [She 2025](https://math.colgate.edu/~integers/z103/z103.pdf), [Ma 2026](https://arxiv.org/abs/2608.23418), and [Mian–Siddique 2026](https://arxiv.org/abs/2609.25011) distinguish the conjecture from known perfect-power shape restrictions and a finite bound. Searches for late 2026 full resolutions and for the specific constraint below did not locate either. The [Erdős #364 source record](https://www.erdosproblems.com/364) gives the attribution and known cases.

[Granville 1986](https://dms.umontreal.ca/~andrew/PDF/PowerfulFLT.pdf) proved that the conjecture would imply infinitely many ordinary non-Wieferich primes to base 2. His argument uses the same elementary valuation lift in the opposite direction. [Murty–Séguin 2019, Theorems 1.1 and 1.4](https://doi.org/10.1016/j.jnt.2019.02.016) study cyclotomic factor valuations and show that finiteness of super-Wieferich primes implies infinitude of non-Wieferich primes. The result here instead gives an exponent-by-exponent necessary condition for powerful triples, quantitative in the factorization of the exponent.

## Statement

Let `x≥2` and `k≥1`, and suppose `x^k−1,x^k,x^k+1` are all powerful. Necessarily `x` is even, because the only triple of consecutive residues modulo 4 avoiding the residue 2 has middle residue 0. Write `k=2^t m` with `m` odd and put `y=x^(2^t)`. A prime `q∤x` is *super-Wieferich to base x* if `q³|x^(q−1)−1`.

Let `B={ℓ: ℓ prime, ℓ|m, ℓ|y²−1}`, and let `G` be the other prime factors of `m`. Set `b=1` if exactly one of `x−1,x+1` is nonsquare and `b=2` if both are. Then there are at least

```text
∑_(ℓ∈B) v_ℓ(m) + 2∑_(ℓ∈G) v_ℓ(m) − |G| + max(0,t+b−|B|)
```

distinct base-`x` super-Wieferich primes dividing `(x^k−1)(x^k+1)`. In particular there are at least `max(Ω(m),t+b)` such primes, where Ω counts prime factors with multiplicity. All these primes are at most `(x^k+1)^(1/3)`.

Consequently, fix an even base `x`. If it has only finitely many super-Wieferich primes, write `S` for their number. If `S=0`, no power of `x` can be the middle of a powerful triple. Otherwise let `M` be their largest prime. Every allowable exponent satisfies

```text
k | lcm(1,2,…,M−1),     Ω(k)≤2S−1.
```

In particular, infinitely many powerful triples centered at powers of one fixed even base would require infinitely many super-Wieferich primes to that base. This does not address triples with varying bases, whether or not their centers are perfect powers.

## Proof

### 1. Turning an odd valuation into a super-Wieferich prime

Let `q` be an odd prime, let `d=ord_q(x)`, and suppose `d|2k`. The lifting formula yields

```text
v_q(x^(2k)−1) = v_q(x^d−1)+v_q(k),
v_q(x^(q−1)−1) = v_q(x^d−1).
```

The second equality holds because `d|q−1` and `q∤q−1`. The two neighbors `x^k−1,x^k+1` are odd and coprime. Hence a prime `q∤m` with `v_q(x^d−1)` positive and odd has odd valuation in the one neighbor it divides. Powerful neighbors force that valuation to be at least 3. Thus such a prime is super-Wieferich. We construct distinct witnesses with positive odd `v_q(x^d−1)` and then subtract the possible witnesses dividing `m`.

### 2. Witnesses with nontrivial odd part in their order

For each odd prime `ℓ|m`, each `1≤j≤v_ℓ(m)`, and each sign `ε∈{1,−1}` with `ℓ∤ε y−1`, take the integer

```text
F = ((εy)^(ℓ^j)−1)/((εy)^(ℓ^(j−1))−1)
  = 1+z+···+z^(ℓ−1),  z=(εy)^(ℓ^(j−1)).
```

It is positive and odd. It is not a square, by [Ljunggren's 1943 theorem, Theorem 1](https://msleziak.com/temp/Ljunggren.pdf): the only integer bases of absolute value greater than 1 for which such a geometric sum of length greater than 2 is a square are 7 with length 4 and 3 with length 5. The stated theorem covers negative bases, and here `z` is even. Thus a prime `q` appears in `F` to positive odd exponent.

This prime is not `ℓ): modulo `ℓ`, one has `z≡εy≠1`, and `1+z+···+z^(ℓ−1)≡1`. For any `q|F` with `q≠ℓ`, `z≠1 mod q` (otherwise the sum is `ℓ mod q`), so `ord_q(εy)=ℓ^j`. For `ε=1` this means `ord_q(y)=ℓ^j`; for `ε=−1` it gives `ord_q(y)=2ℓ^j`, since the order of `−y` is odd. In particular `q>ℓ`. Since the denominator of `F` is not divisible by `q`, its `q`-valuation equals that of `(εy)^(ℓ^j)−1`. This equals `v_q(x^d−1)`: for the plus sign in `ε` raise `x` to exponent `2^tℓ^j`, and for the minus sign use `x^(2^tℓ^j)+1` and multiply by its coprime-in-`q` companion `x^(2^tℓ^j)−1`. The resulting exponent in either case is divisible by `d` and coprime to `q`.

Different triples `(ℓ,j,ε)` have different orders of `y`, so the witnesses are distinct. Each has order of `x` with odd part `ℓ^j>1`, since `y` is obtained by a power of 2. Therefore a witness of this type that divides `m` must lie in `G`; primes in `B` have order dividing `2^(t+1)`. At most `|G|` witnesses are lost to `q|m`. There is one allowed sign for every `ℓ∈B`, and two for every `ℓ∈G`.

### 3. Witnesses with power-of-two orders

The two positive integers `x−1,x+1` cannot both be squares: their difference is 2, which is not a difference of two positive squares. Choose a prime of odd valuation from each nonsquare one. Its order of `x` is 1 or 2, respectively, and its valuation in the corresponding number equals `v_q(x^d−1)`.

For each `1≤j≤t`, the integer `x^(2^j)+1` is a square plus 1, hence is nonsquare. A prime of odd valuation in it has order of `x` exactly `2^(j+1)` and that same valuation in `x^(2^(j+1))−1`. These `t+b` witnesses are distinct and disjoint from those in §2. Some can divide `m`, but only through `B`, as their orders divide `2^(t+1)`. Thus at least `max(0,t+b−|B|)` of these are super-Wieferich by §1.

Adding §2 and §3 gives the stated count. The contribution from §2 is at least `Ω(m)` since `2v−1≥v` for `v≥1`. Because `Ω(m)≥|B|`, the sum is at least both `Ω(m)` and `t+b`.

### 4. Bounding the exponents when the prime set is finite

If `m>1`, take `ℓ` to be its largest prime factor. At least one sign is allowed in §2, and its witness `q>ℓ` does not divide `m`, so is super-Wieferich. Thus all prime divisors of `m` are below `M`. It follows that all selected witnesses, including those dividing `m`, are at most `M`. For each `ℓ^j|m`, §2 gives `ℓ^j|q−1` for some `q≤M`. For `t≥1` the highest dyadic witness gives `2^(t+1)|q−1` for some `q≤M`. These divisibilities imply `k|lcm(1,…,M−1)`, with `t=0` or `m=1` treated by omitting the corresponding premise. Lastly `Ω(m)≤S` and `t+1≤t+b≤S`; their sum is at most `2S−1`.

### 5. A weaker finiteness hypothesis using only orders

The same proof does not require all super-Wieferich primes to be finite. Suppose, for a fixed even base `x`, that both of the following order sets are bounded:

* The prime powers that occur as the nontrivial odd part of `ord_q(x)` among base-`x` super-Wieferich primes `q`, with supremum `H_o`.
* The powers of two that occur as the entire `ord_q(x)` among such primes, with supremum `H_2`.

Use supremum 1 if the respective set is empty. Markers with order having at least two distinct odd prime factors are never used.

If `m>1`, the marker for its largest prime factor `ℓ` with `j=1` is super-Wieferich and has odd part of order `ℓ`. Thus every prime factor of `m` is at most `H_o`. Now each `ℓ^j|m` has a marker with odd part of order `ℓ^j`. If that marker is super-Wieferich, `ℓ^j≤H_o`; otherwise it is a prime factor of `m` and `ℓ^j|q−1<H_o`. Hence `m|lcm(1,…,H_o)`. If `t≥1`, the dyadic marker of order `2^(t+1)` is either super-Wieferich or a prime factor of `m`, so

```text
2^(t+1) ≤ max(H_2, H_o−1).
```

Therefore only finitely many exponents are possible under this weaker condition. Conversely, an infinite fixed-base family would force unbounded powers in at least one of these two order sets, not merely infinitely many super-Wieferich primes without a restriction on order.
