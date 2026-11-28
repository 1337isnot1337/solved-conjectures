# Shallit 14: an independent decision-procedure attempt

Status: partial analysis only. No decision procedure for arbitrary DFAs, undecidability reduction, or reward claim is established here. The elementary lemmas below are not claimed to be new.

## The full target

For a fixed integer base `k >= 2`, a finite automaton accepts synchronous pairs of digit strings. Leading zero padding makes their lengths equal. The target asks whether one can decide if some accepted pair `(p,q)` satisfies `p > 0` and `p | q`. The `p = 0` convention can be handled separately by a regular check. The sponsor's [2014 BCTCS slides, page 40](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf) advertise £50 for resolving this question. This note does not establish eligibility or payment.

[Rowland and Shallit, Automatic Sets of Rational Numbers (2014)](https://ericrowland.github.io/papers/Automatic_sets_of_rational_numbers.pdf) supplies the representation model and decision procedures for fixed rational membership, boundedness, and whether every represented quotient is an integer. The present target is whether at least one quotient is an integer. These quantifiers must not be interchanged. In this note the quotient is `q/p`, so the tracks are swapped relative to the paper's convention.

## Why bounded quotients are not the hard case

For each fixed integer `r >= 0`, the relation `q = r*p` is automatic: a finite carry automaton recognizes multiplication by the constant `r`. If all positive-denominator accepted quotients are at most a known finite `B`, testing the finitely many integers `0 <= r <= floor(B)` decides the question. A bounded positive denominator also permits finitely many ordinary modular checks.

These observations do not handle arbitrary input. Long leading-zero prefixes on the denominator track permit arbitrarily large quotients. A terminating procedure must also certify some negative instances in this unbounded case.

## A regular negative instance that defeats fixed-modulus certificates

Consider the base-2 relation

```math
R=\{(2^m+1,\ 2^n-1):m\ge1,\ n\ge1\text{ odd}\}.
```

This relation is automatic. The first track, including arbitrary leading zeros, belongs to `0*10*1`; the second belongs to `0*1(11)*`. Intersecting the inverse images of these two regular languages under the coordinate projections gives a regular language over paired digits. Requiring no initial `(0,0)` is an optional additional regular condition and does not change the represented relation.

### Proposition 1: no pair in R satisfies p | q

Suppose, to obtain a contradiction, that `p = 2^m+1` divides `q = 2^n-1`, where `m >= 1` and `n` is odd. Modulo `p`,

```math
2^m\equiv-1,\qquad 2^n\equiv1.
```

Raising the first congruence to the odd power `n` gives `2^(mn) = -1` modulo `p`; raising the second to `m` gives `2^(mn) = 1`. Therefore `p | 2`. But `p >= 3`, a contradiction.

This proof covers the entire infinite relation, not a numerical range.

### Proposition 2: every finite fixed-modulus test can nevertheless pass

For a positive integer `M`, a necessary condition for `p | q` is

```math
\gcd(p,M)\mid q.
```

For every `M >= 1` and every real bound `B`, there exists `(p,q) in R` such that

```math
\gcd(p,M)=1,\qquad q/p>B.
```

Write `M = 2^a d` with `d` odd. Choose a positive `m` satisfying `2^m = 1` modulo `d`; for example Euler's theorem permits a positive multiple of `phi(d)`, with the case `d = 1` immediate. Then `p = 2^m+1` is odd and is congruent to `2` modulo `d`. Hence `gcd(p,M) = 1`. Now choose an odd `n` sufficiently large that `(2^n-1)/p > B`.

For finitely many test moduli `M_1,...,M_s`, apply the same construction to their least common multiple (or their product). The resulting pair passes every test simultaneously while still not satisfying `p | q`, by Proposition 1.

Consequently the following proposed negative certificate is incomplete: check all small integer quotients, then exclude every remaining pair by finitely many conditions of the form `gcd(p,M_i) does not divide q`. This conclusion applies only to that certificate scheme. It does not prove that the original decision problem is undecidable.

### The obstruction is not confined to a finite prime support

The denominators `2^m+1` have infinitely many prime factors collectively: the subfamily with `m = 2^j` is the sequence of pairwise coprime Fermat numbers. The numerators with odd `n` also have infinitely many prime factors collectively. For a finite set of primes `P`, choose an odd prime `n` larger than every member of `P`. If `ell in P` divided `2^n-1`, then `ell` would be odd and the multiplicative order of `2` modulo `ell` would divide the prime `n`. It cannot be `1`, so it would equal `n`, contradicting that the order is at most `ell-1 < n`. Thus `2^n-1 > 1` has a prime factor outside `P`.

The point is limited but useful: a general negative-instance procedure cannot rely only on a bounded quotient, finitely many fixed moduli, or both coordinate sets having finite prime support.

## A one-loop family has an effective finite calculation

The basic pumping calculation does give a complete procedure for a single fixed family `u v^t x`, with fixed words `u,v,x` and `t >= 0`; it does not give a procedure for every regular language.

Let `k` be the base, `r = |v| >= 1`, `l = |x|`, `K = k^r`, and `D = K-1`. Denote the numerical values of the three pieces in the denominator track by `U,V,X`, and in the numerator track by `U',V',X'`. The represented numbers satisfy

```math
Dp_t=A K^t+B,\qquad Dq_t=C K^t+E,
```

where

```math
\begin{aligned}
A&=(DU+V)k^l,&B&=DX-Vk^l,
\\ C&=(DU'+V')k^l,&E&=DX'-V'k^l.
\end{aligned}
```

All six parameters `D,K,A,B,C,E` are explicitly computable integers, with `D > 0`, `K >= 2`, and `A,C >= 0`. Set `P_t = Dp_t`, `Q_t = Dq_t`. Because both numbers are scaled by the same positive integer, `p_t | q_t` if and only if `P_t | Q_t`.

If `A > 0`, then

```math
A Q_t-C P_t=AE-CB=:\Delta.
```

Thus any positive `P_t` dividing `Q_t` divides the fixed integer `Delta`.

- If `Delta != 0`, every such `P_t` is at most `|Delta|`. Since `P_t = A K^t+B` increases strictly and tends to infinity, only an effectively bounded initial segment of `t` needs checking.
- If `Delta = 0`, every positive-denominator quotient equals the fixed rational `C/A`. The answer is determined by whether that rational is an integer and whether some positive denominator occurs.
- If `A = 0`, nonnegativity gives `U = V = 0`, so `p_t = X` is constant. If `X = 0`, no positive denominator occurs. Otherwise the sequence `Q_t` modulo `DX` is eventually periodic, because `K^t` modulo `DX` is eventually periodic. Iterating this finite residue system decides divisibility.

This proves the restricted one-loop procedure. It gives no uniform bound for arbitrary contexts: in a general DFA, the suffix `x` is itself unbounded and may contain further independent cycles. In the displayed calculation, that changes `B,E`, and hence the would-be bound `|Delta|`. Treating it as a constant across all accepted words would be circular.

## Pumping need not preserve an existing divisibility witness

An explicit family is

```math
p_t=2^t+1,\qquad q_t=3\cdot2^t,\qquad t\ge1.
```

Its paired binary words have a fixed prefix and suffix with one shared zero-pair loop. It has exactly one divisibility witness: `t = 1`, giving `(p,q) = (3,6)`. Indeed `q_t = 3p_t-3`, so `p_t | q_t` implies `p_t | 3`, and `p_t >= 3` then forces `p_t = 3`. Pumping the zero-pair loop once gives `(5,12)`, which is not a witness.

An argument that starts from an accepted divisibility pair and invokes ordinary DFA pumping must therefore supply an additional arithmetic invariant. Language acceptance alone is insufficient.

## Remaining gap

For arbitrary automata, the denominator-changing cycles and the leading denominator-zero cycles may vary independently. Even two such cycles lead to exponential congruences with a variable modulus. The one-loop determinant calculation no longer gives a fixed bound. The negative family above also defeats the simplest fixed-modulus compactness argument.

No mechanism here yields a terminating negative test for every DFA. The full £50 problem remains unresolved by this work. The other lane is investigating an undecidability reduction; these observations neither complete nor refute that reduction.
