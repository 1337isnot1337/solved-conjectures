# Erdős–Pyber–Tuza rainbow six-cycle conjecture

Research note for [Erdős Problem 811](https://www.erdosproblems.com/811) and [issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870). This settles the elementary abelian two Cayley model, not the unrestricted conjecture.

## Statement

Let G be a compact abelian group of exponent two with probability Haar measure. Let six measurable functions f_i:G→[0,1] have sum 1 almost everywhere and each have integral 1/6. Their Cayley graphon is W_i(x,y)=f_i(x+y). Its rainbow C6 density vanishes if and only if a continuous nonzero character χ:G→F₂ divides the colors into two groups of three and each color is supported almost everywhere on its assigned χ-coset. In particular, the pure parity obstruction is the only one, without restricting the number of vertex types or requiring deterministic colors.

Changing variables from the six vertices to a starting vertex and five successive differences identifies each ordered rainbow density with the convolution f_1 * … * f_6 evaluated at zero. Haar measure and commutativity make this independent of the ordering. The reverse implication follows by applying χ to the six steps: precisely three have χ-value 1, so they cannot sum to zero.

## 1. An equal-size critical-pair exclusion

In a finite elementary abelian two group, sets A and B of the same size s, with s≡2 mod 4 or s≡3 mod 8, cannot have an aperiodic sumset of size 2s−1. Here aperiodic means trivial translation stabilizer.

Use induction on the group order and [Lev's form of Kemperman's structure theorem](https://doi.org/10.1142/S1793042106000620), stated explicitly as Theorem 3 in [Even-Zohar and Lev, Small Asymmetric Sumsets](https://math.haifa.ac.il/seva/Papers/SmallF2n.pdf). In the elementary alternatives, type I requires a singleton and type II requires an element of order at least 2s−1. Type III requires a subgroup of order 2s−1, an odd number greater than one. Type IV requires a subgroup of order 2s, which is a power of two only in the s=2 case among our residues. But a two-point set in exponent two is a coset of a two-element subgroup, so its sum with another set has even size.

In the non-elementary alternative, there is a nontrivial proper subgroup K, and each set consists of full K-cosets and one exceptional nonempty slice A₀ or B₀. The exceptional projected sum coset has a unique representation. Every other represented coset in A+B is full, while the exceptional slice in it is A₀+B₀. This slice is not full and is aperiodic within K: a period there would be a period of the whole sum. Both input slices are proper, since if either were full then so would their sum. Thus each slice has the same size t=s mod |K| with 0<t<|K|, and KST gives |A₀+B₀|=2t−1. If s≡2 mod 4 and |K|=2, no such t exists; for larger |K| we have t≡2 mod 4, and induction rules it out. If s≡3 mod 8 and |K|≥8, apply induction with t≡3 mod 8; if |K|=4 then t=3 gives 2t−1=5>4.

The remaining case has s≡3 mod 8 and |K|=2. The quotient sets Ā and B̄ both have size (s+1)/2≡2 mod 4. Subtract the exceptional output slice of size 1 and divide by 2: the quotient sum has size (s−1)+1=s=2|Ā|−1. This is odd and hence aperiodic in the quotient, contradicting induction.

## 2. Finite classification

Put A_i={f_i>0}, let H be the stabilizer of the full sum, and let S_i be the projected supports in G/H, of order q. A convolution at zero vanishes exactly when the original sum misses zero. The quotient sum also misses zero, because the original sum is H-saturated. The quotient sum is aperiodic, so all nonempty subsums are aperiodic: any period of a partial sum would persist. Finite Kneser therefore gives
```math
\sum_{i=1}^6 |S_i|\le q+4,qquad |S_i|\ge \lceil q/6\rceil.
```
The second inequality uses mass 1/6 and capacity 1/q per coset. We can apply Kneser with any disjoint grouping, since the same aperiodicity holds for all unions of groups of summands.

If q=2^k with odd k≥3, s=ceil(q/6)=(q+4)/6≡2 mod 4. Every set must have size s. By Section 1 any pair grows to at least 2s rather than 2s−1. Thus the full sum has size at least 6s−5+1=q, a contradiction.

If k is even and at least 4, s=(q+2)/6≡3 mod 8. There are at most two total extra points above the six lower bounds. With at least one extra point, choose two disjoint pairs at the minimum size. Each grows by at least one more than the Kneser minimum, giving full sum size at least q+2+1−5+2=q. With no extras, all three disjoint pairs get the gain, giving q+2−5+3=q.

If q=4, at least four supports are singletons. Each hue has total mass 2/3 in units of one coset's capacity; two singleton hues cannot use the same coset. Thus there are exactly four singletons, one per coset, and two double supports. The latter hues each need mass 2/3 and have residual capacity at most 1/3 in each coset. Their supports must partition the four cosets into two pairs. These pairs are parallel in F₂², so share a nonzero period, contradicting aperiodicity of the full sum.

The quotient cannot be trivial since the sum misses zero. For q=2, all six supports must be singletons, with three in each coset by balance and coverage. This is exactly the parity claim.

## 3. Popular sums on compact groups

For positive-measure measurable supports A and B, write P(A,B) for the open set where the convolution of their indicator functions is positive. The same set is obtained by convolving any two bounded nonnegative functions with these positivity supports. We use measurable representatives A*,B* of full measure in A,B such that P(A,B)=A*+B* exactly. To obtain them on a metrizable compact elementary abelian two group, take the density points inside A and B for a decreasing sequence of open subgroups of finite index forming a neighborhood base. Such subgroups exist by Pontryagin duality: characters take values in {±1}, separate points, and give the topology. Martingale convergence gives full measure to the density points. If a and b are density points, at a sufficiently fine common subgroup both local densities exceed 1/2; the intersection of the corresponding translates in that subgroup has positive measure. Conversely, every t in P(A,B) has positive-measure representations, so one remains after deleting the null exceptions.

This also reduces the nonmetrizable case. Each of the six L² functions has at most countably many nonzero Fourier coefficients. Factoring by their common annihilator gives a metrizable quotient (the dual subgroup generated by countably many characters is countable). Completeness of the characters in L² means the functions are pullbacks up to null sets. Haar probability pushes forward correctly and the convolution and parity assertions pull back. Hence the remaining proof can assume metrizability.

Two consequences of [compact Kneser and Griesmer's equality theorem](https://arxiv.org/abs/1112.6403), Proposition 1.1 and Theorem 1.3, will suffice:

1. If μ(P(A,B))<μ(A)+μ(B), then P(A,B) is a union of cosets of an open subgroup. Indeed apply compact Kneser to A*,B*: it gives actual saturation, not just equality modulo null sets.
2. If μ(A)=μ(B)=1/6, then μ(P(A,B))≠1/3. To see this, apply Griesmer to the density-point representatives. Alternative (P) is impossible since open-subgroup coset unions have dyadic measure, and alternative (K) is impossible since an exponent-two group cannot surject onto the circle. In (E), the extension has strictly larger total individual measure and the same inner sum measure, so compact Kneser makes that inner measure dyadic, also impossible.

For alternative (QP) in the second consequence, let the subgroup have index q. Each input is a union modulo null sets of full cosets and one nonempty exceptional slice. Other cosets in the sum are full modulo null sets, and the exceptional sum is uniquely represented in the quotient. The exceptional input slices have equal measure: in units of 1/q both have measure r={q/6}. Their sum within one coset must have measure 2r by (QP.3). The index is a power of two. For q=1 or 2 there are no full cosets in either input, contrary to (QP); for q≥4 with even exponent, r=2/3 and 2r>1. For q≥8 with odd exponent, r=1/3. Both quotient supports then have size s=ceil(q/6)≡2 mod 4. If the quotient sum has M cosets, the normalized mass of the total sum is M−1+2/3=q/3=2s−2+2/3, so M=2s−1. The odd cardinality implies aperiodicity, contrary to Section 1. This exhausts (QP).

In this calculation a coset occupied by a periodic part really is full modulo null sets, since that part is equal modulo null sets to its subgroup saturation. A sum from a full-measure slice and any nonempty slice contains a full-measure translate, sufficient for the counting argument. The exceptional slice has positive measure because q/6 is never integral.

## 4. Reduction of the zero case to a finite quotient

Let g_1=f_1*f_2, g_2=f_3*f_4 and g_3=f_5*f_6 and let B_j={g_j>0}. If any pair convolution has support measure strictly smaller than the sum of its two input support measures, Section 3 makes B_j saturated by an open subgroup H. Otherwise each μ(B_j)>1/3: both input supports have measure at least 1/6, and equality at 1/3 is excluded by Section 3.

In the latter case let D={g_1*g_2>0}. The zero at 0 implies D and B_3 are disjoint: they are open, and any nonempty intersection makes the integral of (g_1*g_2)(x)g_3(x) positive. Here −x=x. Thus
```math
\mu(D)\le 1-\mu(B_3)<2/3<\mu(B_1)+\mu(B_2).
```
Again Section 3 gives saturation of D by an open subgroup H.

In either case a partial convolution has positivity support saturated by H, and convolving it with the remaining hues preserves this property. Precisely, for any cosets x+H,y+H, a strictly positive contribution at every t∈x+y+H occurs when the first factor is positive everywhere on x+H and the second has positive integral over y+H. If no such pair of cosets exists, the convolution on that output coset vanishes. Thus the full convolution's vanishing at zero implies its full integral on H is zero. Conditional averaging onto G/H commutes with convolution by Haar disintegration, so the six averaged hues on G/H have zero rainbow density. They are still balanced and sum to one. Section 2 gives the parity character there. Nonnegativity means a zero conditional average on a coset forces the corresponding original hue to vanish almost everywhere there, proving the claim on G.

## Scope and sources

The statement includes all finite binary vector spaces, their inverse limits, and arbitrary nonsimple or fractional palettes. It assumes the whole graphon is Cayley on a group of exponent two. It does not classify arbitrary vertex-transitive graphons or arbitrary balanced graphons, and does not resolve Erdős Problem 811. The inputs are the [1993 Erdős–Tuza problem paper](https://www.sciencedirect.com/science/article/pii/S0167506008703777), Lev/Kemperman and Griesmer; the residue exclusion and the six-hue reduction above are separate arguments. See [Erdős Problem 811](https://www.erdosproblems.com/811) for the precise general conjecture.
