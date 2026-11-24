# Herzog–Schönheim conjecture: uniformly large simple normal subgroups

Status: **partial result, not a resolution of the unrestricted conjecture.** Addendum to [the quotient-lifting checkpoint](README.md), issue #324, 2026-11-24. Proof reviewed locally for its stated asymptotic scope; no independent review or Lean verification. AI-assisted derivation; priority unestablished.

## Theorem

Fix a real number alpha with 0 < alpha < 1. There is an absolute threshold M_alpha such that, if a finite group G has a nonabelian simple normal subgroup S of order at least M_alpha, G/S is solvable, and

    |G/S| <= exp(exp((ln |S|)^alpha)),

then G satisfies the Herzog–Schönheim conjecture.

In particular, **all but finitely many isomorphism types of finite almost simple groups satisfy the conjecture**. No assertion is made here that the finite exceptional set is empty.

This result uses the solvable-group theorem of Menon (arXiv:2611.11002v1, November 7, 2026) through the lifting criterion in README.md. The underlying subgroup estimates and their classification-based proofs are due to earlier authors; in particular, the essential estimates are collected in Garonzi–Margolis, *The Herzog-Schönheim conjecture for simple and symmetric groups*, arXiv:2509.25118v2 (May 2026).

## 1. Quantitative uniform decay of the subgroup-index sum

Use the notation J(S) of README.md. We show

    J(S)-1 = O((ln ln |S|)/(ln |S|))             (A)

uniformly over nonabelian finite simple groups as |S| tends to infinity.

For a finite group S, let K(S) be the number of distinct orders of its maximal subgroups and m(S) the least index of a proper subgroup. Every proper subgroup has order dividing a maximal-subgroup order. Consequently

    J(S)-1
      <= (1/|S|) sum_{a a distinct maximal-subgroup order} sum_{d|a} d
      <= K(S)(1+ln |S|)/m(S).                   (B)

Here the inner sum divided by a equals the sum of the reciprocals of the divisors of a, bounded by the a-th harmonic sum, at most 1+ln a. Counting the same order multiple times only enlarges the bound.

### Alternating socles

For S=A_n, equation (9) of Garonzi–Margolis gives J(A_n)-1=O(1/n). The elementary factorial bounds

    (floor(n/2))^(floor(n/2))/2 <= |A_n| <= n^n

imply ln |A_n| = Theta(n ln n) and ln ln |A_n| = Theta(ln n). Thus (A) holds.

### Classical groups of Lie type

Use the dimension parameter n and field parameter q of Garonzi–Margolis (Section 4: the actual field has q^2 elements in the unitary case). Their Lemma 4.4 and its proof, using the maximal-subgroup counting theorem cited there, give

    K(S) <= 2 n^5.2 + n log_2(log_2 q).

Their Lemma 4.5 gives |S| <= q^(n^2) and m(S) >= q^(n-2). For n>=3 write x=ln q >= ln 2. Since log_2(log_2 q)=O(1+x), uniformly for q>=2,

    (J(S)-1) ln |S|
       <= B_0 n^10 (1+x)^3 exp(-(n-2)x)          (C)

for an absolute constant B_0, by (B). The integer exponent 10 is a convenient overestimate.

For each fixed n>=3 the right-hand side tends to zero as q tends to infinity. Uniformly as n tends to infinity, the factor (1+x)^3 exp(-(n-2)x) is decreasing for x>=ln 2 once n>=4: its logarithmic derivative is 3/(1+x)-(n-2)<0. Its supremum is therefore attained at x=ln 2. The resulting bound is O(n^10 2^(-n)), tending to zero.

These two observations imply uniform convergence to zero as |S| tends to infinity, since only finitely many (n,q) pairs exist with both parameters bounded. The rank-one family PSL(2,q) is handled directly by the maximal-subgroup classification used in README.md: K(S)=O(1+ln q), m(S)>=q+1 for q sufficiently large, and |S|<q^3. Thus (B) again gives (J(S)-1) ln |S| -> 0. In particular (A) holds for all classical families.

### Exceptional groups of Lie type

The estimates in Proposition 4.8 and Table 5 of Garonzi–Margolis give K(S)=O(1+log_2(log_2 q)), ln |S|=O(ln q), and m(S)>=q for q sufficiently large, uniformly across the finitely many exceptional families. Applying (B) yields

    (J(S)-1) ln |S| = O((1+ln q)^3/q) -> 0.

The sporadic groups and exceptional individual small groups cause no asymptotic issue, since they form a finite set. By the classification of finite simple groups, (A) follows.

## 2. Applying the lifting criterion

Write t=|G/S| and C(t)=sigma(t)/t. The unconditional divisor-sum estimate of Robin (*Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann*, 1984) implies

    C(t) = O(1+ln ln(t+2)).

The +2 and the constant term merely handle small t. Under the hypothesis on t, set L=ln |S|. For L sufficiently large,

    C(t) = O(1+L^alpha).

Combining with (A),

    (J(S)-1) C(t)
        = O((ln L)/L * (1+L^alpha)) -> 0,

since alpha<1. In particular the product is strictly less than 1 for |S|>=M_alpha. Apply Theorem 1 of README.md. This proves the theorem.

## 3. Almost simple groups

By definition, S <= G <= Aut(S) for a finite nonabelian simple S, identified with its inner automorphism group. Schreier's theorem (a consequence of the classification) gives that Out(S) is solvable; hence G/S is solvable.

No delicate bound on the order of outer automorphism groups is necessary. A finite group of order u has a generating set of at most floor(log_2 u) elements: each generator adjoined outside the generated subgroup increases its order by a factor of at least two. An automorphism is determined by the images of these generators, so

    |G/S| <= |Aut(S)| <= |S|^floor(log_2 |S|)
                       <= exp((ln |S|)^2/ln 2).

This is smaller than exp(exp((ln |S|)^alpha)) for all sufficiently large |S| (for instance take alpha=1/2). The theorem therefore applies to all almost simple groups whose socles are sufficiently large. There are finitely many finite groups of bounded order and, for each socle, finitely many subgroups of its finite automorphism group. Hence only finitely many almost simple isomorphism types can remain.

## 4. A direct-product extension

The same argument applies if S is replaced by a normal direct product N=S_1 x ... x S_k of nonabelian finite simple groups, provided k is fixed, the minimum u=min_i |S_i| tends to infinity, G/N is solvable, and

    |G/N| <= exp(exp((ln u)^alpha)).

Indeed, the index factorization for any normal subgroup implies

    J(N) <= product_i J(S_i)

(as in Garonzi–Margolis, Lemma 2.1). By (A), and eventual monotonic decrease of (ln ln u)/(ln u), J(N)-1=O_k((ln ln u)/(ln u)). The proof in Section 2 now applies with u in place of |S|. More generally, without holding k fixed, the product criterion

    (product_i J(S_i)-1) C(|G/N|) < 1

suffices. None of these statements handles arbitrary nonsolvable quotients.

## Audit and provenance

- The results of Garonzi–Margolis prove the conjecture for simple and symmetric groups and establish J(S)->1. The quantitative strengthening (A) follows from their explicit estimates; we make no claim that (A) is novel in isolation.
- The new deduction recorded here is to combine these estimates with the quotient-lifting criterion, obtaining a uniform statement for extensions and an almost-simple finite-exception theorem, not just a bound on J(S) or a simple-group result.
- The convergence in (C) is uniform when n or q grows; the fixed-n and fixed-q limits alone would not justify a uniform threshold.
- Robin's bound is unconditional; it is not the sharper inequality equivalent to the Riemann hypothesis.
- The solvable-group theorem of Menon is used, and is explicitly a dependency. The main lifting argument is in README.md. No assertion that the dependency was independently checked in Lean is made.
- No effective list of exceptional almost simple groups is supplied. An all-but-finite statement about almost simple groups is not an all-groups resolution. No named conjecture is counted as solved.
- Literature check: Garonzi–Margolis, arXiv:2509.25118v2, Theorems 1.2–1.4, equation (9), Lemmas 4.4–4.5, Proposition 4.8 and Remark 5.1; Menon, arXiv:2611.11002v1, Theorem 1.2 and Sections 2–3; Sun, arXiv:math/0306099, Theorem 3.1. Searches for the specific large-almost-simple and normal-simple-subgroup conclusions did not locate a prior explicit result. A relevant distinct result is the p-extension of A5 at https://stepsunbounded.com/results/R004/ (a normal p-group, rather than a normal large simple subgroup). These searches cannot certify priority.
