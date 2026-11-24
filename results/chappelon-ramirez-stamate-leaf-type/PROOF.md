# Chappelon–Ramírez Alfonsín–Stamate’s leaf-type conjecture

The upper bound in [Conjecture 4.4 of *Numerical semigroup tree: type-representation*](https://arxiv.org/html/2507.15006v2#S4.Thmconjecture4) is false. The conjecture says that a leaf of genus g=4q+r, 0≤r<4, has type at most 2q−1 for r=0,1, at most 2q for r=2, and at most 2q+1 for r=3. In particular, it predicts type at most g/2. We give an infinite family with type strictly greater than g/2, and show that the maximum type among leaves of genus g is (2/3)g−Θ(√g) as g→∞. The corrected leading constant is therefore 2/3, for every sufficiently large genus rather than just along a subsequence.

## Construction

For an integer N≥4, let m=2N. Choose a set L⊆{0,1,…,N−1} containing 0 and 1 such that every integer 0≤a<N belongs to L+L. Write k=|L| and put

    A = L ∪ {N,N+1,…,2N−2},
    S = {0} ∪ (m+A) ∪ {2m,2m+1,…}.

All nonzero elements are at least m, so any sum of two lies in the stated tail; S is a numerical semigroup of multiplicity m. Its Frobenius number is 2m−1, since m−1 is not in A. The genus is

    g = (m−1) + (m−|A|) = 3N−k.

The children of a numerical semigroup in the usual tree are obtained by deleting one minimal generator larger than the Frobenius number. The possible elements to delete here all lie at or above 2m. Every integer in [0,m−1] lies in A+A: use L+L below N, 0+A between N and m−2, and 1+(m−2) for m−1. Thus every element in [2m,3m−1] is a sum of two positive elements of m+A. All elements at least 3m are a sum of m and another element of S. Consequently S has no children and is a leaf.

An integer gap f is pseudo-Frobenius if f+s∈S for every positive s∈S. All m−|A|=N−k+1 gaps between m and 2m−1 are pseudo-Frobenius, since adding m or more reaches the tail. For a small gap i∈[1,m−1], if i≤N−1, then m−1−i lies in the high interval of A. Hence adding m+(m−1−i) produces the gap 2m−1, so i is not pseudo-Frobenius. The same failure for i=m−1 follows by adding m. If N≤i≤m−2, then for a∈A, either the sum i+(m+a) reaches the tail, or its offset i+a is in the high interval of A, or this offset equals m−1. The last obstruction arises exactly when m−1−i∈L. Addition of elements in the tail always succeeds. Thus the small pseudo-Frobenius gaps are exactly the N−k integers i in the high interval with m−1−i∉L. The full type is

    t = (N−k+1)+(N−k) = 2N−2k+1.

For an explicit infinite family, take N=s² and

    L = {0,1,…,s−1} ∪ {s,2s,…,(s−1)s}.

Euclidean quotient and remainder show L+L contains [0,s²−1], and k=2s−1. The resulting leaves have

    g = 3s²−2s+1,    t = 2s²−4s+3,
    t−g/2 = (s−1)(s−5)/2.

For every s≥6 the conjecture fails even without considering its finer residue-class ceilings. The same family already violates the exact conjecture at s=5: g=66, t=33, and the asserted bound is 32. This is not a claim that genus 66 is the first counterexample.

## Corrected sharp leading constant

Let S be an arbitrary leaf, with genus g, Frobenius number F, multiplicity m, and type t. Since an element in [m,2m−1] cannot decompose into two positive elements, being a leaf requires F≥2m−1. Pseudo-Frobenius gaps occupy different nonzero residue classes modulo m: if f<f' have the same residue, adding a positive multiple of m to f cannot produce another gap. In fact at least one nonzero class is absent. To see this, decompose F+m=u+v into positive S-elements (the leaf property allows this). Neither u nor v is m, since the other would be the gap F. Moreover u−m is a gap, since otherwise (u−m)+v=F would lie in S. This gap is not pseudo-Frobenius by the same equality, and no other gap in its residue can be pseudo-Frobenius because u is the first S-element of that residue. The class is nonzero because all nonnegative multiples of m belong to S. This gives t≤m−2.

For each positive element s of S with s≤F, the reflection F−s is a gap that is not pseudo-Frobenius, as adding s would give the gap F. There are F−g such distinct gaps. Therefore t≤2g−F. Combining with F≥2m−1 and m≥t+2 gives the all-genus upper bound

    t ≤ floor((2g−3)/3).

The square-root deficit is also forced. Put c=F+1=2m+s with s≥0, and let h=g−(m−1) be the number of gaps at least m. Reflection in F sends each pseudo-Frobenius gap below m to a distinct gap at least m, never F itself. Thus if t_low and t_high count pseudo-Frobenius gaps below and above that cutoff, t_low≤h−1, t_high≤h, and t≤2h−1.

Set

    A = {a∈[0,m+s−1] : m+a∈S}.

Then |A|=m+s−h. At least h−s of the gaps m+r have r∈[s,s+m−1]. For each such gap, 2m+r is above F and at most c+m−1, so by the leaf property it decomposes as (m+a)+(m+b), with a,b∈A: each summand is positive and at most c−1 because the other is at least m. Neither summand offset can equal 0, since that would give m+r∈S. No offset can be a pseudo-Frobenius gap below m, since adding the other summand would again give m+r∈S. Each low pseudo-Frobenius gap lies in A, since adding m to it gives an element of S. Hence the allowable offset set has size

    e = |A|−1−t_low ≤ m+s−1−t.

Different r give different sums a+b, so h−s≤e(e+1)/2.

Write Δ=2g/3−t. The earlier upper bound gives Δ≥1. From t≤2h−1 we get m−1−t≤(3/2)Δ−1/2, and from t≤2g−F together with m≥t+2 we get s≤3Δ−3. Consequently

    e ≤ (9/2)Δ−7/2,
    h−s ≥ g/3−(7/2)Δ+7/2.

Using h−s≤e(e+1)/2 and Δ≥1 gives

    g/3 ≤ (81/8)Δ²−10Δ+7/8 ≤ (81/8)Δ².

Thus every leaf has Δ≥√(8g/243).

For a matching square-root-order lower bound at every large genus, in the construction take any N≥4 and use s=ceil(√N) and

    L_N = {0,…,s−1} ∪ {s,2s,…,floor((N−1)/s)·s}.

It is an additive basis for [0,N−1] by quotient and remainder, and k_N=|L_N|=s+floor((N−1)/s)=O(√N). From N to N+1 this size increases by either 0 or 1: inside a block where s is constant only the floor changes, and when N=u² the consecutive sizes are 2u−1 and 2u. Thus g_N=3N−k_N increases by either 2 or 3. For any sufficiently large target genus g, take the first N such that g_N≥g and add g_N−g≤2 unused low integers to L_N. Such low integers exist for all sufficiently large N because k_N=O(√N). Adding them preserves the additive-basis property and yields genus exactly g. With the enlarged size k, the exact type formula becomes

    t = 2N−2k+1 = (2/3)g−(4/3)k+1 = (2/3)g−O(√g),

where N=O(g) because k≤N. This and the square-root deficit bound prove the asserted asymptotic order. The exact constant multiplying √g is not determined.

## Scope and source check

The target is the joint conjecture of Jonathan Chappelon, Jorge L. Ramírez Alfonsín, and Dumitru I. Stamate, [arXiv:2507.15006v2](https://arxiv.org/abs/2507.15006v2), Conjecture 4.4. Their author-hosted [manuscript](https://imag.umontpellier.fr/~ramirez/NS-Tree.pdf) gives the same bound. The paper's reported data extend through genus 30. Exact-title, author, theorem number, numerical-semigroup leaf/type, additive-basis and counterexample searches found no prior resolution of this precise bound. Some of the inequalities used for the upper bound are standard; the source check is bounded and no priority is asserted. This result does not address the authors' type-refined count monotonicity, leaf-type unimodality, or their limiting proportion of leaves.
