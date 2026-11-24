# Herzog–Schönheim conjecture: quotient lifting

Status: **partial result; the unrestricted conjecture is not solved.** Research checkpoint, 2026-11-24, issue #324. Written proof with exact finite arithmetic checked locally. No Lean formalization or independent referee verification. AI-assisted derivation; priority is not established.

## Literature and scope

The conjecture of Herzog and Schönheim (1974, Canadian Mathematical Bulletin 17, p. 150) says that a finite nontrivial partition of a group into left cosets of subgroups has repeated subgroup indices. It suffices to consider finite groups. The current primary results located include:
- Sun, *On the Herzog–Schönheim conjecture for uniform covers of groups*, J. Algebra 273 (2004), 153–175, https://arxiv.org/abs/math/0306099, Theorem 3.1 (coset union inequality).
- Margolis and Schnabel, *The Herzog–Schönheim conjecture for small groups and harmonic subgroups*, https://arxiv.org/abs/1803.03569 (all groups of order <1440).
- Garonzi and Margolis, *The Herzog-Schönheim conjecture for simple and symmetric groups*, https://arxiv.org/html/2509.25118v2 (May 2026), especially the subgroup-index sum criterion, PSL(2,q) maximal subgroup classification in section 4, and Remark 5.1. The remark gives almost simple groups for which the sum of reciprocal distinct subgroup indices is unbounded.
- Menon, *The Herzog–Schönheim conjecture for solvable groups*, https://arxiv.org/html/2611.11002v1 (November 7, 2026), Theorem 1.2 (all solvable groups, with reported Lean formalization), Theorem 2.4 (Sun's union bound), Definition 3.1 and Lemma 3.2 (quotient/local indices and the fiber equality used below). His weighted up-set method uses an infinite product; the following finite divisor variant explicitly truncates at the quotient order.
- White, *Character degrees of extensions of PSL2(q)*, section on automorphisms, https://www.math.kent.edu/~white/papers/autpsl2.pdf (outer automorphism order and structure).
- Dickson's classification in Guralnick and Zieve, *Polynomials with PSL(2) monodromy*, Theorem A.1, https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n2-p11-p.pdf.

No unrestricted resolution was located. The exact lifting criterion and its rank-one application below are new derivations in this research checkpoint, not certified first discoveries. The published results and the Menon preprint are dependencies, not results claimed here.

## Theorem 1 (normal-subgroup lifting criterion)

Call a group HS if every nontrivial finite coset partition has repeated indices. For a finite group N let

    I(N) = { [N:L] : L <= N },
    J(N) = sum_{l in I(N)} 1/l.

For a positive integer t set

    C(t) = sum_{h | t} 1/h = sigma(t)/t.

Let G be finite, N normal in G, Q=G/N finite solvable, and t=|Q|. If

    (J(N)-1) C(t) < 1,

then G is HS (using Menon's solvable-group theorem).

### Proof

Suppose G has a nontrivial partition into left cosets g_i H_i with distinct indices d_i. By normality,

    d_i = h_i l_i,
    h_i = [G: H_i N] = [Q: H_i N/N],
    l_i = [N: H_i intersect N].

Let L index the parts with l_i>1, called nonuniversal, and X_i be their images in Q. Each part with l_i=1 consists of whole N-fibers. Disjointness of the partition implies that no such fiber meets both a universal part and a nonuniversal part. Hence the union of the nonuniversal parts is exactly the inverse image of the union of their X_i. In particular,

    nu := sum_{i in L} 1/d_i = |union_{i in L} X_i|/t.

This is the fiber argument of Menon, Lemma 3.2, and it uses no solvability of N or G. If L is empty, the partition descends to Q with distinct unchanged indices and at least two parts, contrary to Menon's Theorem 1.2. Thus nu>0.

Let H={h_i : i in L}, a set of distinct divisors of t. Among the parts with a given h, the local indices l_i>1 are distinct, since the d_i are distinct. Therefore

    nu <= (J(N)-1) sum_{h in H} 1/h.                 (1)

Set A={k : k divides t, and some h in H divides k}. This is an up-set in the divisibility lattice of t. Write t=product_p p^a_p. For z uniform modulo t, define X_p as the capped p-adic valuation min(v_p(z),a_p), using X_p=a_p when z=0 modulo p^a_p. By the Chinese remainder theorem these random variables are independent and

    Pr(X_p >= j)=p^(-j) for 0<=j<=a_p.

Independently consider a random divisor K of t with probability 1/(k C(t)) at divisor k. Its exponents Y_p are independent, with probability proportional to p^(-j) at j in {0,...,a_p}; thus

    Pr(Y_p >= j)
      = (p^(-j)-p^(-a_p-1))/(1-p^(-a_p-1))
      <= p^(-j).

For each p, the two distributions can be coupled by the same uniform random number and their inverse cumulative distribution functions; the displayed tail inequality gives X_p>=Y_p almost surely. Take independent uniform numbers for the different primes. Since A is upward closed, we obtain

    (1/C(t)) sum_{k in A} 1/k
       = Pr(product p^Y_p in A)
       <= Pr(product p^X_p in A)
       = dens(union_{h in H} h Z).

The empty prime product when t=1 causes no problem. Since H is a subset of A, applying Sun's theorem to the cosets X_i in the solvable group Q gives

    sum_{h in H} 1/h <= C(t) dens(union_{h in H} h Z)
                      <= C(t) nu.                  (2)

Combine (1) and (2) and divide by nu>0. This yields 1 <= (J(N)-1) C(t), a contradiction. QED.

### Variant (no solvability hypothesis on the quotient)

If Q itself is HS, one may replace C(t) by

    E(Q) = max_{h0 in I(Q)} h0 sum_{h in I(Q), h>=h0} 1/h.

Indeed, when L is nonempty, h0=min H and the union of the projected cosets has relative size nu>=1/h0. Hence sum_{h in H}1/h <= E(Q) nu. The rest of the proof is unchanged. This variant does not use Sun or Menon's theorem except where invoked to establish that Q is HS.

## Theorem 2 (all PSL(2,q) almost simple groups)

Let q=p^a>=4 be a prime power, let N be a normal subgroup of G isomorphic to PSL(2,q), and let G/N be solvable of order dividing gcd(2,q-1)*a. Then G is HS.

In particular every almost simple group with socle PSL(2,q) is HS: the outer automorphism group has order gcd(2,q-1)*a and is abelian (diagonal and field outer automorphisms).

### Proof of the arithmetic bound

Write d=gcd(2,q-1), n=|N|=q(q^2-1)/d, and T=d*a. Every proper subgroup is contained in a maximal subgroup. Dickson's maximal-subgroup classification gives the following superset of possible maximal orders:

    q(q-1)/d, 2(q-1)/d, 2(q+1)/d, 12,24,60,
    |PSL(2,p^(a/r))| for prime divisors r of a,
    |PGL(2,p^(a/2))| if a is even.

Including candidates that do not actually occur only enlarges the bound. Discard candidates not proper divisors of n. Let U be the union of their sets of positive divisors. Then

    J(N)-1 <= sum_{u in U} u/n.

For q=9, the candidates after filtering are 8,10,12,24,36,60. Orders 15,20,30 can only arise from the maximal subgroup of order 60, which is A5 by the classification. A5 has no subgroups of indices 4,3,2: simplicity makes the coset action faithful, which is impossible by the orders of the corresponding symmetric groups. Remove 15,20,30 from U in this case.

Since t=|G/N| divides T, C(t)<=C(T). For q<65536, the companion script enumerates every prime power in [4,65536) and verifies, with exact rational arithmetic, that

    (sum_{u in U} u/n) C(T) < 1

except at q=4,5. There are 6632 prime powers; the largest upper bound after excluding 4 and 5 is 77/80, attained at q=9. At 4 and 5, N is A5 and |G|<=120, so the published small-group theorem of Margolis–Schnabel applies.

For q>=65536 put k=floor(log_2 q)>=16. There are at most a+7<=k+7 maximal-order candidates. Every one of them is at most n/(q+1)=q(q-1)/d for this range. For the subfield candidates, the proper subfield has size at most sqrt(q), so the order is <=q^(3/2) <=q(q-1)/2; the remaining candidates satisfy the bound directly. For each candidate m,

    sum_{u|m} u/n = (m/n) sum_{v|m} 1/v
                   <= (1+ln(m))/(q+1)
                   < (1+3 ln q)/(q+1),

by the harmonic sum estimate and m<n<q^3. Also C(T)<=T<=2k. Therefore

    (J(N)-1) C(T)
       <= (k+7) (1+3 ln q) 2k / (q+1)
       < 2k(k+7)(3k+4) / 2^k.

The last expression is <1 for k=16 (38272/65536). The ratio of consecutive numerator polynomials is <=((k+1)/k)^3<2 for k>=16, so the expression decreases thereafter. This covers every q>=65536. Apply Theorem 1. QED.

### Consequence for the known index-sum obstruction

Garonzi–Margolis, Remark 5.1, exhibits S=PSL(2,2^a) with a the product of the first r primes, extended by a field automorphism of order a, for which J(G) is unbounded as r increases. Theorem 2 applies to every member of this family. Thus the quotient criterion succeeds where the absolute J(G)<2 test fails.

## Audit and limits

- The normality of N is essential for the index factorization and whole-fiber argument; it is explicitly assumed.
- The union bound is applied only to the solvable quotient, never to G itself.
- Distinct indices are used for each fixed quotient index, not assumed for the projected cosets.
- The strict inequality is essential; equality is not claimed to suffice.
- The finite checks use subgroup-order supersets, not an assumption that all divisors correspond to subgroups. The q=9 exclusion is justified separately.
- The finite enumeration only closes the small-field range of an all-q theorem; it is not a search for finite counterexamples.
- The result depends on Menon's November 2026 preprint. His proof has a reported formalization; it was not independently rebuilt here. If that theorem is not accepted as established, Theorem 1 can be stated with the extra explicit hypothesis that Q is HS. In the almost simple PSL2 case Q is abelian, so the classical finite abelian HS theorem suffices, and no reliance on the new solvable-group theorem is necessary.
- The theorem neither treats all almost simple groups nor proves the general conjecture. A plausible next step is to obtain uniform index-sum estimates for other simple socles, then handle multiple nonabelian composition factors. No first-priority claim is made.
