# Shallit 14: finite prime support of the integer quotients

Status, 21 November 2026: a restricted decision theorem with an independent paper-proof review. This is not a solution of the unrestricted [paid problem](https://github.com/1337isnot1337/solved-conjectures/issues/229), and no novelty or bounty claim is made. It strengthens the preceding campaign's base-power-quotient promise argument. The finite-prime-support lemma for ordinary automatic integer sets is already in Rowland and Shallit's paper; it is not a new result here.

## Statement

Let `k >= 2`. A finite automaton accepts synchronous base-`k` representations of pairs `(A,B)` of positive integers. Suppose every represented denominator is coprime to `k`. Suppose also that there is a finite set of primes `S` such that every positive integer in the represented quotient set `A/B` has all its prime divisors in `S`.

Then the existence of a represented integer quotient is decidable. The finite set `S` need not be supplied to the algorithm: its existence is a promise on the input.

For every prime-power base, the coprime-denominator hypothesis can be removed by effective normalization. In that case the integer-quotient set is unchanged by the normalization.

Noninteger quotients are unrestricted. The theorem does not assert an algorithm for checking the promise, and does not decide the problem for arbitrary input automata.

## The effective bound

Delete all common leading zero pairs, an effective regular-language operation, and let `N >= 1` be the number of states of an automaton for the resulting positive-pair language. Every accepted positive integer quotient `q=A/B` satisfies

```math
q\lt k^N\quad\text{or}\quad B\lt k^{N-1}.
\tag{1}
```

Both bounds refer to the normalized automaton. No small complexity bound is claimed.

## An affine recurrence cannot stay smooth unless it is geometric

**Lemma.** Let `M >= 2` and `E` be integers. Suppose positive integers `q_h` satisfy

```math
q_{h+1}=Mq_h+E\qquad(h\ge0),
```

and tend to infinity. If every prime factor of every `q_h` belongs to one finite set `S`, then `E=0`.

**Proof.** Assume `E` is nonzero. The exact recurrence identity is

```math
(M-1)q_h=\bigl((M-1)q_0+E\bigr)M^h-E.
```

For every prime `p` dividing `M`, the first term on the right eventually has `p`-adic valuation greater than `v_p(E)`. Since `p` does not divide `M-1`, this gives

```math
v_p(q_h)=v_p(E)
```

for all sufficiently large `h`. Choose one index `H` beyond the finitely many required thresholds for primes of `S` dividing `M`.

For every prime `p` in `S` not dividing `M`, the map `x -> Mx+E` is a permutation of the residues modulo `p^(v_p(q_H)+1)`. Its orbit through `q_H` therefore returns to that residue after some positive period `r_p`. Choose a common multiple `r` of these periods, or `r=1` if there are none. Then every `q_(H+rt)` has exactly the same valuation at each prime in `S` as `q_H`. Primes dividing `M` retain their stabilized valuations; the other valuations are fixed by the displayed modulus.

Every positive integer `q_(H+rt)` has no prime divisors outside `S`, so unique factorization makes all of them equal to `q_H`. This contradicts divergence to infinity. Therefore `E=0`.

The argument is an elementary fixed-valuation argument, not an application of an ineffective bound for general unit equations.

## Proof of the witness bound

Let `A/B` be an accepted positive integer. Since `A >= B` and there are no common leading zero pairs, the numerator is canonical. Let `d` be the number of initial zero digits on the denominator track, equivalently the difference of the canonical digit lengths.

If `d < N`, the elementary digit-length bounds give

```math
\frac AB\lt k^{d+1}\le k^N.
```

Assume instead that `d >= N`. In an accepting path, two of the first `N+1` states agree. Factor the accepted paired word as `uvw`, with

```math
|uv|\le N,\qquad |v|\ge1,
```

so every word `uv^t w` for `t >= 0` is accepted. Every denominator digit of `uv` is zero, so its denominator stays equal to `B` under pumping.

Write `U,V,W` for the integer values of the numerator blocks `u,v,w`, and set

```math
K=k^{|v|},\qquad T=k^{|w|}.
```

For the numerator `A_t` of `uv^t w`, direct concatenation gives

```math
A_{t+1}=KA_t+C,
\qquad C=VT-(K-1)W.
\tag{2}
```

The original witness is `t=1`. Since `gcd(K,B)=1`, (2) acts as a permutation of residues modulo `B`. Starting at residue zero, it returns to zero after a positive number `r` of steps. Consequently

```math
B\mid A_{1+rh}\qquad(h\ge0).
```

The quotients `q_h=A_(1+rh)/B` are positive integers represented by accepted words. They diverge: pumping after `t=1` preserves a nonzero initial numerator digit and increases its canonical length. Iterating (2) exactly `r` times gives

```math
q_{h+1}=K^r q_h+E,
\qquad
E=\frac{C(1+K+\cdots+K^{r-1})}{B}.
```

Here `E` is an integer, because the formula holds between integer quotients at `h=0`. The input promise puts the prime factors of every `q_h` in the same finite set `S`. The affine lemma forces `E=0`. Its geometric-sum multiplier is positive, so `C=0`.

Since `C=0`, we have `VT=(K-1)W`. The integers `K-1` and `T` are coprime, so `K-1` divides `V`. The digit bound `0 <= V < K` leaves only `V=0` or `V=K-1`. The second choice would force `W=T`, contradicting `W<T`. Hence `V=W=0`.

Consequently

```math
A_1=UKT.
```

Since `B` divides `A_1` and is coprime to `KT`, it follows that `B` divides `U`. Positivity of `A_1` gives `U>0`. Finally, `|u|+|v| <= N` and `|v| >= 1` give

```math
0\lt B\le U\lt k^{|u|}\le k^{N-1}.
```

This proves (1). The argument also shows that each quotient in this second case is a power of `k` times an integer smaller than `k^N`.

## Finite decision procedure

For each integer `q` with `1 <= q < k^N`, intersect the input language with the fixed-multiplier relation `A=qB` and test emptiness. Multiplication by a fixed integer has a finite carry automaton.

For each integer `B` with `1 <= B < k^(N-1)`, intersect with the fixed-denominator condition and the finite remainder automaton for `A=0 mod B`, then test emptiness.

All tests terminate and the bound proves their completeness on promised inputs. On arbitrary inputs, a witness found by these tests is still valid; absence of a witness need not be conclusive.

The same proof gives more than a nonemptiness decision. For each bounded denominator, intersect with `A=Bq` and project to `q`; fixed multiplication and projection preserve automaticity. Add the finitely many successful bounded quotients. This constructs a base-`k` automaton for the entire positive integer-quotient set. The [independent review](independent-review.md) records this corollary and the sharper denominator bound.

If the original problem permits `A=0`, handle it first by an ordinary regular intersection with `A=0,B>0`. The case `B=0` is likewise a separate regular test under the chosen divisibility convention.

## Removing coprimality in prime-power bases

Suppose `k=p^a`, with `p` prime and `a>=1`. Replace each base-`k` digit by its fixed block of `a` base-`p` digits. This preserves the represented integers and regularity.

Take the right quotient by arbitrary common trailing zero pairs, and retain only pairs whose denominator ends in a nonzero base-`p` digit. Every integer witness survives: if `p^s` is the exact power of `p` dividing its denominator, the same power divides its numerator, and deleting those `s` common zeros preserves their quotient. Every retained pair comes from an original pair by equal scaling, so no new quotient is introduced.

The retained denominator is coprime to `p`. Remove common leading zero pairs and apply the proved theorem to the resulting base-`p` automaton. Its state count supplies the finite bounds.

For a base with distinct prime factors, removing common base factors need not make the denominator coprime to the base. That extension is not established by this proof.

## Relation to the earlier work and to the bounty

The earlier [base-power promise theorem](../../bounty-lean-2026-11-21/shallit-divisibility/power-only-promise.md) required every integer quotient to be a power of the base. The present assumption permits all products of an arbitrary fixed finite set of primes, including primes unrelated to the base. It uses the same prefix-pumping setup and replaces discreteness of ratios of powers by the affine prime-factor lemma.

[Rowland and Shallit, *Automatic Sets of Rational Numbers*](https://ericrowland.github.io/papers/Automatic_sets_of_rational_numbers.pdf), Theorems 20 and 32, already characterize ordinary automatic integer sets with finite prime support and give an effective recognition procedure. That known classification alone cannot be applied to the integer part of an arbitrary automatic rational set without proving that its integer part is automatic. No priority claim is made for the restricted statement above either.

This promise theorem rules out undecidability reductions that force every incidental integer quotient to use only finitely many primes in the covered bases. A valid reduction of the unrestricted problem could still produce integer quotients with unbounded prime support. A terminating general decision procedure is also still missing.

No complete resolution of Shallit 14, accepted prize, or payment has been established.
