# Johnson statistics force Armstrong's germ positivity

This note proves a converse to the sufficient criterion in [Armstrong, Lattice Points and Rational q-Catalan Numbers, §§7–9](https://doi.org/10.1007/s00026-026-00819-9): for fixed a≥2, existence of a Johnson statistic is **equivalent** to the nonnegativity of each q-Catalan germ. It does not prove either for all a. No determination of which actual root-lattice points carry a given weight is needed for this equivalence.

Let B be the lattice points of the fundamental box with 0≤x_i<a in type A_{a−1}, and B_R its root-lattice subset. Put |x|=Σ_i x_i. For a coprime cut c and its previous coprime cut c', write G_c(q) for Armstrong's q-Catalan germ, defined by dividing the tilted-height enumerator of c'<|x|≤c by [a]_q within B. We restrict to positive cuts, including the first germ (which includes |x|=0). The highest nonzero cut is at most (a−1)^2. Armstrong proves that G_c has integer coefficients and
```
Cat(a,b)_q = Σ_c G_c(q) K_{floor((b−c)/a)}(q)
```
for b≥1 coprime to a, where K_j=[a−1+j choose a−1]_{q^a} if j≥0 and zero otherwise (Proposition 8.3).

Suppose J is a Johnson statistic. Armstrong's Theorem 7.3 gives the same expression using q^{J(x)} from the root-lattice box points, with |x| in place of c:
```
Cat(a,b)_q = Σ_{x∈B_R} q^{J(x)} K_{floor((b−|x|)/a)}(q).
```
For each residue r with 1≤r<a and gcd(r,a)=1, fix b=am+r for m≥0. Group the first formula by the index ℓ=ceil((c−r)/a), and the second by ℓ=ceil((|x|−r)/a). Both indices are nonnegative. The two sequences are convolutions by the same causal kernel K. Since K_0=1, coefficientwise subtraction and induction on m show that the grouped weights are identical for every ℓ. In particular their cumulative weights through ℓ=m agree, giving for every positive coprime cut b
```
Σ_{x∈B_R : |x|≤b} q^{J(x)} = Σ_{c≤b} G_c(q).
```
Subtract consecutive coprime cuts (the count before the first is 0). It follows that the level partition of a Johnson statistic **must** realize the germs individually:
```
G_c(q) = Σ_{x∈B_R : c'<|x|≤c} q^{J(x)}.
```
The coefficients on the right are nonnegative. The other direction is Armstrong's result via standard partitions, so this is an equivalence, not merely a sufficient construction. This converse also identifies, for each box slice, the multiset of statistic values in every putative solution.

## Exact finite check, supplementary only

The attached C++ checker constructs the full two-variable tilted-height enumerator one coordinate at a time. If F_j(s,h) counts vectors on coordinates 1,…,j with sum s and height h, the finite geometric sum in coordinate j gives
```
F_j(s,h) = F_{j−1}(s,h)+F_j(s−1,h−j)−F_{j−1}(s−a,h−aj).
```
Aggregate between coprime cuts to get P_h, then divide exactly using G_h=P_h−P_{h−1}+G_{h−a}; zero tail certifies polynomial division. It suffices to check through the first coprime cut at or past the middle of the box: complementing every coordinate within [0,a−1] reflects (s,h) to (M−s,T−h), with M=(a−1)^2, T=aM/2. As M−1 is divisible by a, a coprime-cut slice reflects to a coprime-cut slice, and [a]_q is reciprocal. All computations above a=20 through a=43 passed. Fixed precision is exact in this range: any count is at most a^{a−1}, temporary additions are at most 2a^{a−1}, and each partial quotient coefficient is a sum of subsequences of first differences bounded in absolute value by 2a^{a−1}. The proof is the equivalence; the finite check by itself is not a resolution or a new general bound.
