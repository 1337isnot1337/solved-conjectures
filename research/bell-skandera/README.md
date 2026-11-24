# Bell–Skandera conjecture: finite irreducible-exception reduction

**Status: substantial partial result.** The unrestricted conjecture is not proved. This note proves an all-large-degree irreducible theorem using a recently posted Kruskal–Katona estimate and classical trace theorems. It reduces the conjecture to finitely many irreducible polynomials over all degrees. The remaining finite set is not enumerated or checked. External review, priority checking and review of the new preprint dependency remain outstanding.

## 1. Original question and literature screen

Bell and Skandera, *Multicomplexes and polynomials with real zeros*, Discrete Math. 307 (2007), 668–682, [DOI 10.1016/j.disc.2006.07.020](https://doi.org/10.1016/j.disc.2006.07.020), [author manuscript](https://www.lehigh.edu/~mas906/papers/logc.pdf), Question 1.1 and Conjecture 4.1: every real-rooted polynomial

    f(t) = 1 + a_1 t + ... + a_d t^d in Z_{\ge 0}[t]

is the f-polynomial of an ordinary simplicial complex, where a_i counts i-element faces. They prove the multicomplex assertion, the ordinary assertion when all roots lie in [-1,0), and finiteness of counterexamples for each fixed d (Theorem 4.8). They also note reduction to irreducible factors via joins.

Mu–Welker, [arXiv:2503.24076](https://arxiv.org/abs/2503.24076), v2 October 14, 2026, [DOI 10.1016/j.aam.2026.103041](https://doi.org/10.1016/j.aam.2026.103041), establish sufficient conditions but leave the full question open. Liu–Wang–Zhang, [arXiv:2609.23694](https://arxiv.org/abs/2609.23694), disprove a separate recursive-real-rootedness conjecture and explicitly leave Bell–Skandera open. Shing–Xie, [First differences of real-rooted integer polynomials and simplicial complexes](https://hexagonmath.org/2611.00919v1), November 23, 2026, [PDF](https://hexagonmath.org/pdf/2611.00919v1), prove the different Kubitzke–Welker first-difference assertion. Their Theorem 3.1 is an input to the present proof.

Searches through November 24, 2026, using the exact original statement, author/title searches, and combinations of irreducible, discriminant, all degrees, finite exceptions and Kruskal–Katona, located no previous full resolution or identical all-degree finite reduction. This is a bounded screen, not proof of novelty.

**Theorem.** If f is irreducible in Z[t], satisfies the conjecture's hypotheses and d >= 100000, it is an ordinary simplicial-complex f-polynomial.

**Corollary.** There are at most finitely many irreducible counterexamples to the Bell–Skandera conjecture, without a degree restriction. Moreover the conjecture is equivalent to checking the finitely many possible irreducible counterexamples in degrees < 100000.

The proof relies on Theorem 3.1 of the Shing–Xie preprint just cited. All other non-elementary inputs are classical: Newton/Maclaurin, Kruskal–Katona, and Siegel/Smyth trace bounds. The value 100000 is deliberately loose, not an optimized threshold or finite numerical experiment.

## 2. Preliminary inequalities

Write

    f(t)=product_{i=1}^d (1+lambda_i t),
    P(X)=X^d f(-1/X)=product_i (X-lambda_i).

All lambda_i are strictly positive, and P is monic integral, irreducible and separable. In particular the lambda_i are distinct. Since d>1, P(1) is a nonzero integer. Define

    A = a_d = product_i lambda_i >= 1,
    u = A^(1/d) >= 1,
    b_j = a_j / binom(d,j),
    c = sqrt(5)/2.

Newton's inequalities say that the successive ratios b_{j+1}/b_j are nonincreasing. In particular, at an adjacent pair p,p+1, put

    k=d-p, B=b_p, q=b_{p+1}/b_p.

Then

    B >= q^p,
    B >= b_j q^(p-j) for 0 <= j <= p, and
    a_{p+1}=a_p k q/(p+1).

Also B>=u^p by Maclaurin or direct AM–GM of the products of p distinct roots.

Let K_p(m) be the Kruskal–Katona raising operator, so that the conjecture is equivalent to a_{p+1}<=K_p(a_p) for 1<=p<d. If m=binom(x,p) with x>=p, the Shing–Xie estimate (Theorem 3.1, PDF p. 4) is

    K_p(m) >= m (x-p-1)/(p+1).                         (1)

For real s>0 define

    T(s)=binom(p+1+k s,p)/binom(d,p)
        =product_{i=1}^p (k s+i+1)/(k+i).

It follows immediately from (1) that

    B>=T(q)  implies  a_{p+1}<=K_p(a_p).               (2)

The function T is increasing; T(s)/s^p is decreasing, since each factor of that ratio is (k+(i+1)/s)/(k+i). Consequently, if r>0 satisfies T(r)<=r^p and B>=r^p, then (2) holds: q<=B^(1/p) and T(B^(1/p))<=B.

## 3. Discriminant and random-pairing bound

**Lemma 1.** For every 0<=j<=d,

    b_j >= u^j (1+1/(4u^2))^(min(j,d-j)/2).

In particular b_j>=c^min(j,d-j).

**Proof.** Put h=min(j,d-j). Randomly permute the d roots, pair the first 2h, and select one root independently and uniformly from each pair. If j>d/2, select every unpaired root as well. This produces a uniformly random j-element subset, by invariance under every permutation of the indices. Conditional on the pairs and singles, the expected product of selected roots is the product of the selected singles and the arithmetic means of the pairs.

Apply the concavity of the logarithm to this conditional expectation, and split each pair's contribution as

    log((lambda_i+lambda_l)/2)
      = (log lambda_i + log lambda_l)/2
        + (1/2) log(1+(lambda_i-lambda_l)^2/(4 lambda_i lambda_l)).

By symmetry the expected linear log term over all selections is j log u. The discriminant

    Disc(P)=product_{i<l} (lambda_i-lambda_l)^2

is a positive integer. Thus the average over distinct unordered pairs of

    v_{i,l}=log((lambda_i-lambda_l)^2/(4 lambda_i lambda_l))

is at least -log 4 - 2 log u. The function v -> log(1+exp v) is convex and increasing. Jensen's inequality on the pairs therefore gives

    log b_j >= j log u + (h/2) log(1+1/(4u^2)).

Exponentiate. Since j>=h and u>=1,

    u^j (1+1/(4u^2))^(h/2)
      = u^(j-h)(u^2+1/4)^(h/2) >= c^h.

This also covers j=0,d directly. QED.

The argument needs separability, the positive integral discriminant, and the product bound; it does not assume that roots themselves are rational integers.

## 4. Small ranks

**Lemma 2.** Under the irreducible hypotheses, for d>=5 and 1<=p<=k/2, the Kruskal–Katona inequality holds.

For p=1, a_1>=d by AM–GM, and Newton gives a_2<=(d-1)a_1^2/(2d)<=binom(a_1,2). Assume p>=2.

Every product of p distinct lambda_i is a totally positive algebraic integer. Its conjugates occur with equal multiplicity within its Galois orbit in the multiset of products. Siegel's trace bound says that the mean of the conjugates of such a product is at least 3/2 unless the product equals 1. Let Z count the p-element subsets with product 1. Every (p-1)-element subset can extend to at most one such p-element subset, since the roots are distinct. Hence p Z<=binom(d,p-1) and

    B >= 3/2 - 1/[2(k+1)].

For q<=1,

    T(q)<=T(1)=(d+1)/(k+1)
          =1+p/(k+1)<=3/2-1/[2(k+1)]<=B.

For q>=1 we use the classical Smyth trace theorem, stated in Bell–Skandera, Theorem 4.10: for an irreducible polynomial of the required form, a_1>1.7719d except for five explicitly listed polynomials of degrees at most four. Thus b_1>=R=7/4 here. By Newton, B>=R q^(p-1). Also T(R)<=R^p for p>=2: in the first two factors of T(R)/R^p, put U=kR. The numerator (U+2)(U+3) is smaller than the denominator (U+R)(U+2R), since R=7/4. Each subsequent factor is at most 1 because R i>=i+1 for i>=3.

For 1<=q<=R, log(T(q)/q^(p-1)) is convex as a function of log q: it is a sum of log-sum-exponentials minus a linear term. Its value is at most the larger of its endpoint values, which are both at most log R (at 1 use T(1)<=3/2, at R use T(R)<=R^p). Therefore T(q)<=R q^(p-1)<=B. If q>=R, use B>=q^p and monotonicity of T(q)/q^p. In all cases (2) holds. QED.

## 5. Large ranks, reduction to bounded coefficient and corank

Put r=21/20. We claim for every p>=128 and k>=1,

    T(r)<=r^p.                                        (3)

Indeed, using log(1+z)<=z,

    log(T(r)/r^p)
      <= (1/r) sum_{i=1}^p (1-i/20)/(k+i).

The weighted mean of i with weights 1/(k+i) is nondecreasing as k increases: for k>=1 the ratio of these weights to those at k=1 is (1+i)/(k+i), an increasing function of i; reweighting by an increasing positive function cannot decrease a mean. The mean is also nondecreasing as p increases, because the extra indices exceed the earlier mean. At p=128,k=1 the mean is

    128 / (sum_{i=1}^{128} 1/(i+1)) - 1
      >= 128/log(129) - 1 > 20.

The integral comparison and log(129)<5 prove the last inequality. This proves (3). In particular the pair p,p+1 is settled if B>=r^p.

Now assume d>=D=100000. Lemma 2 covers all p<128, since p<=k/2 for such p. For p>=128 suppose the inequality is not already settled. We may assume

    B<r^p.

If p<=k, Lemma 1 would give B>=c^p>=r^p. Thus p>k. Let j=floor(d/2); then j<=p and p<=2j. Lemma 1 gives b_j>=c^j. If q>=1, Newton implies B>=b_j>=c^j>=r^p (since c>=r^2), a contradiction. If 19/20<=q<1, Newton instead gives

    B>=c^j q^(p-j) >= (19c/20)^j >= r^j >= d+1.

Here 19c/20>r by squaring. The last inequality holds for j>=50000, even using only the second binomial term j(j-1)/800 in (1+1/20)^j, which exceeds 2j+2>=d+1. But T(q)<=T(1)<d+1, settling the pair by (2). Hence every unsettled pair has q<19/20.

The Kruskal–Katona operator is superadditive: a disjoint union of complexes realizing given numbers of p-faces and their maximal numbers of (p+1)-faces realizes their sum (p>=1). In particular, floor(B) disjoint full simplices on d vertices, plus any leftover individual p-faces, give

    K_p(a_p)>= floor(B) binom(d,p+1).

If B>=20, floor(B)>= B-1 >= (19/20)B > q B, again settling the pair. Thus we may assume

    p>k, B<20, q<19/20, A<400, k<=27.                 (4)

The bound on A follows from B>=A^(p/d) and p>d/2. The bound on k follows from B>=c^k and c^28=(5/4)^14>20. If k=1 then binom(d,p+1)=1 and q B=a_d=A is an integer less than B, so floor(B)>=A, settling the pair. It remains to handle (4) with 2<=k<=27.

## 6. Reciprocal-root means in the bounded-corank regime

First we establish an elementary auxiliary inequality, independent of algebraic-integer theorems:

    x - (2/3) log x - log|x-1| >= 7/5  (x>0,x!=1).   (5)

The expression tends to +infinity at 0, 1 from either side, and infinity. Its two critical points are (4-sqrt(10))/3 and (4+sqrt(10))/3, one on each domain interval. Enclose these respectively in [279/1000,280/1000] and [2387/1000,2388/1000] by squaring the rational bounds 3161/1000<sqrt(10)<3163/1000. At the first point its value is at least

    279/1000 + (2/3) log(25/7) + log(1000/721)
      > 279/1000 + (2/3)(5/4) + 8/25 > 7/5.

The log lower bounds follow from the positive series log y=2 sum_{i>=0} z^(2i+1)/(2i+1), z=(y-1)/(y+1): use three terms for y=25/7 and one for y=1000/721. At the second point its value is at least

    2387/1000 - (2/3) log(597/250) - log(347/250)
      > 2387/1000 - (2/3)(9/10) - 7/20 > 7/5.

The log upper bounds follow from truncating the positive exp series at degree three for 9/10 and degree two for 7/20. This proves (5) with rationally checkable constants.

Put beta_i=1/lambda_i, and let b'_i=e_i(beta)/binom(d,i). By (4), b'_k=B/A<20. Write M=max(1,max_i beta_i). If max beta_i>=1, retain one root equal to M, and use only k-subsets containing it. AM–GM over the (k-1)-subsets of the remaining d-1 roots gives

    20 > b'_k >= (k/d) M (1/(AM))^((k-1)/(d-1)).

Since (k-1)/(d-1)<=1/2 and A<400, we obtain M^(1/2)<=400d; the same conclusion is trivial if all beta_i<1. Thus M<=(400d)^2.

All beta_i differ from 1, and

    product beta_i = 1/A,
    product |beta_i-1| = |P(1)|/A >= 1/A.

Delete any k-1 roots. Every deleted beta_i and |beta_i-1| is at most M, so each product over the remaining set R of size d-k+1 is at least 1/(400 M^(k-1)). Average (5) over R to obtain

    mean_R beta
      >= 7/5 - (5/3)(log400 + (k-1) log M)/(d-k+1)
      >= 27/20.                                      (6)

For the last estimate use log400<7, log(400D)<18 and d>=D. The latter two log bounds can be checked by exp(1)>8/3; all needed integer powers are in verify.py. Since log(400d)<=18+log(d/D)<=18d/D, k-1<=26 and d-k+1>=d/2, the subtracted error is at most

    (10/3)(943/D) < 1/20.

The identity

    b'_k/b'_{k-1}
      = [sum_{|S|=k-1} (product_{i in S} beta_i) *
                  (sum_{i not in S} beta_i)/(d-k+1)]
        / [sum_{|S|=k-1} product_{i in S} beta_i]

expresses this ratio as a positive weighted average of the remaining means in (6). Therefore b'_k/b'_{k-1}>=27/20, or equivalently

    q=b_{p+1}/b_p=b'_{k-1}/b'_k <=20/27.               (7)

**Direction audit:** (7) is obtained from the weighted-average identity, not from reversed Maclaurin. Maclaurin alone would bound this ratio in the opposite direction.

## 7. Explicit simplicial-complex construction at the last ranks

Set U=binom(d,p), V=binom(d,p+1), and U_1=binom(d-1,p), V_1=binom(d-1,p+1). In the remaining case 2<=k<=27 these are positive. Let l=floor(B), theta=B-l. Form l disjoint full d-vertex simplices and then floor(theta U/U_1) disjoint full (d-1)-vertex simplices. Add enough separate p-faces to obtain exactly a_p=BU faces of size p; these do not contribute to the count of faces of size p+1. Since K_p gives the largest possible number of (p+1)-faces, this constructs the bound

    K_p(a_p)/V >= l + floor(theta U/U_1) V_1/V
        >= l + theta (k-1)/k - (k-1)/d
        = B - theta/k - (k-1)/d.

We used U_1/U=k/d and V_1/V=(k-1)/d. Since B>=1, l>=1 and theta<1, we have theta<=B/2. Consequently, using k>=2, k-1<=26 and d>=D,

    K_p(a_p)/V >= (3/4)B - 26/D
                > (20/27)B >= b_{p+1}.

The strict inequality follows from B>=1 and 26/D<3/4-20/27=1/108. This proves the remaining Kruskal–Katona inequalities, completing the theorem in every degree d>=D.

## 8. Finite reduction and audit

Every f with constant term 1 factors over Z[t] into factors of constant term 1 after adjusting signs. All roots of each factor remain negative; therefore every such factor has nonnegative integer coefficients. The f-polynomial of the join of two complexes is the product of their f-polynomials. Hence it suffices to verify the conjecture on irreducible factors. By the theorem all factors of degree >=D satisfy it; by the original Bell–Skandera Theorem 4.8 there are only finitely many possible counterexamples in each degree <D. This proves the stated finite reduction.

- The discriminant argument does not apply to repeated roots, which is why the reduction to irreducibles precedes it.
- Lemma 2 uses the classical trace theorems on conjugacy orbits, not on individual positive roots. Products equal to 1 are explicitly accounted for.
- The lower normalized coefficient bound is established for all j, not a finite range. The p>=128 criterion is uniform in k.
- The bounded-corank regime is deduced from the general inequalities, not assumed. The product of absolute differences |beta_i-1| is nonzero because P(1) is a nonzero integer.
- The inverse-root ratio uses all possible remaining subsets and positive weights, avoiding any assumption of bounded maximum without proof.
- The disjoint-simplex construction operates separately at each adjacent rank; this is sufficient by the exact Kruskal–Katona characterization and does not assert that these separate complexes are nested.
- The proof of the large-degree theorem is conditional on the cited result of Shing–Xie, which was posted one day before this research session. Its statement and relevant displayed formulas were checked in the primary PDF; a separate complete review of that source is not claimed.
- No finite search over the outstanding degrees has been performed. The original conjecture remains unresolved.
- The companion verify.py checks the constants in the elementary inequalities using exact rational arithmetic; it is not a substitute for the proof.

Original conjecture attribution belongs to Bell and Skandera. The trace and Kruskal–Katona input is attributed above. The discriminant/random-pairing lemma and the finite-reduction argument were derived in this ChatGPT research session at the repository owner's request. Priority for these deductions is unestablished.
