# Erdős 389: obstruction to finite-congruence prime-power lifting

21 November 2026. This note tests one construction route for the full existence problem. It proves that the route cannot work in the stated form. It does not refute Erdős 389, settle a new starting value, establish novelty, or claim a bounty. The completed full-target count remains zero.

Coordination: [issue 232](https://github.com/1337isnot1337/solved-conjectures/issues/232).

## Target and proposed route

For a nontrivial starting value n at least two, set s=n−1. The target is to find t>s making

```math
Q_s(t)=\frac{s!(2t-s)!}{(t!)^2}
```

an integer. The case n=1, or s=0, is already immediate from the central binomial coefficient and is excluded from the obstruction below.

The existing research proves that a congruence t=−1 modulo a suitable fixed integer R makes the valuation of Q_s(t) positive at any prescribed finite set of primes. The construction tested here was to retain those residues while lifting t through a prime power, hoping that increasing the exponent would eventually generate enough central-binomial carries for the remaining primes.

It does the opposite when the p-free cofactor is fixed: every increase of the exponent increases the denominator demand, while the available carries do not change.

## 1. Exact obstruction for a fixed cofactor

Let p>s be an odd prime, let c be a positive integer not divisible by p, let e≥1, and put t=c p^e>s. The existing even-factor carry criterion, with j=0, gives

```math
v_p(Q_s(c p^e))=v_p\binom{2c}{c}-e.
\tag{1}
```

The rightmost binomial valuation is fixed when c and p are fixed. Thus this family fails for every exponent larger than that carry count. In particular, if 2c<p, the cofactor c has one base-p digit and its double has no carry, so

```math
v_p(Q_s(c p^e))=-e.
\tag{2}
```

There is also a direct verification of (2) requiring no carry terminology. For 1≤a≤e, the a-th Legendre summand is

```math
\left\lfloor\frac{s}{p^a}\right\rfloor
+\left\lfloor\frac{2c p^e-s}{p^a}\right\rfloor
-2\left\lfloor\frac{c p^e}{p^a}\right\rfloor
=0+(2c p^{e-a}-1)-2c p^{e-a}=-1.
```

For a>e, every floor is zero because 2c<p and s<p. Summing gives (2).

## 2. Every arithmetic progression contains arbitrarily deep deficits

**Proposition.** Fix s≥1, a positive modulus M, and any residue a modulo M. There are a fixed prime p and infinitely many positive integers t in that residue class for which v_p(Q_s(t)) tends to negative infinity.

**Proof.** Let c be the positive representative of a in {1,…,M}. Choose a prime

```math
p>\mathop{\mathrm{max}}\{s,2M}.
```

In particular p is coprime to M and 2c<p. Let h be any positive integer with p^h=1 modulo M; Euler's theorem permits h=phi(M), including phi(1)=1. For each positive integer m put

```math
e=hm,\qquad t_m=c p^{hm}.
```

Then t_m=c=a modulo M, t_m>s, and (2) gives

```math
v_p(Q_s(t_m))=-hm\longrightarrow-\infty.
```

This proves the proposition. It uses only the existence of a prime above a fixed bound and Euler's theorem; it does not require primes in arithmetic progressions. QED.

Consequently no finite nonempty union of residue classes can, even after deleting an initial segment, be a sufficient condition for Q_s(t) to be integral. Equivalently, the valid t's contain no infinite eventually periodic subset. This does not preclude an infinite thin subset of a residue class, nor does it exclude a nonperiodic symbolic construction.

## 3. The obstruction survives arbitrary finite-prime cleanup

Fix any finite prime set P containing 2 and all primes at most s. For each ell in P, choose M_ell with ell^(M_ell)>s+1, and set

```math
R=\prod_{\ell\in P}\ell^{M_\ell}.
```

The existing cleanup lemma gives, for every t=−1 modulo R,

```math
v_\ell(Q_s(t))\ge M_\ell-v_\ell(s+1)>0
\qquad(\ell\in P).
\tag{3}
```

Choose a prime p>max{s,2R}. This prime is not in P. For every positive integer m, put

```math
e=m\varphi(R),\qquad t_m=(R-1)p^e.
\tag{4}
```

Euler's theorem gives t_m=−1 modulo R, so every prescribed prime has positive valuation surplus by (3). Nevertheless,

```math
v_p(Q_s(t_m))=-e.
\tag{5}
```

Thus one can satisfy every condition at any chosen finite prime set while failing at one fixed additional prime by an arbitrarily large amount. Increasing the cleanup set changes R and the construction, but never removes this general obstruction.

The individual factor t_m has largest prime factor exactly p, independent of m. This observation concerns t_m alone. For s≥3 the required block also includes t_m−1 and further shifts; no simultaneous smoothness claim about those other factors is made. The earlier counterfamily in the repository establishes a different feature: for s=1,2, it retains bounded multiplicity at the offending prime while keeping the required block subpolynomially smooth.

## 4. Relation to prior work

Ulas's *A note on Erdős–Straus and Erdős–Graham divisibility problems*, IJNT 9 (2013), 583–599, DOI [10.1142/S1793042112501497](https://doi.org/10.1142/S1793042112501497), already proves infinitely many failing block lengths for every nontrivial starting value in **Theorem 2.7**, using a fixed-cofactor prime-power family. The [author manuscript](https://www.academia.edu/48555588/A_Note_on_Erd%C5%91s_Straus_and_Erd%C5%91s_Graham_Divisibility_Problems_With_an_Appendix_by_Andrzej_Schinzel_) was read, including Theorems 2.2 and 2.7.

The observation recorded here is the compatibility of that obstruction with an arbitrary residue class, and in particular with all the finitely many positive-surplus conditions in (3). No priority claim is made for this refinement. The exact fixed-cofactor identity (1) is already a special case of the carry identity in the repository's preceding independent review.

## 5. Exact stopping point

Finite congruence conditions control only a fixed set of local valuations. The proposed prime-power lift keeps a p-free cofactor fixed, so it cannot produce a carry count that grows with the newly introduced p-adic exponent. Equations (4)–(5) show this failure uniformly for every s≥1, after all prescribed prime conditions have been satisfied.

A successful construction must control the prime factorization of each relevant t−j and make its p-free cofactor generate at least v_p(t−j) carries for every prime p>s. The result above does not prove that this is impossible. It only rules out treating a finite congruence certificate or a fixed-cofactor prime-power lift as that construction.

No larger finite search was run. The full existence statement remains unresolved.
