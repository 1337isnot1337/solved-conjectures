# Athanasiadis–Chapoton’s transmuted M-triangle duality conjecture

We prove [Conjecture 8.2](https://arxiv.org/html/2605.26916v1#S8) for all finite preorders. We use the coordinate-weighted reciprocity identity (R) for the preorder point set from [the q-zeta proof, §1](../athanasiadis-chapoton-q-zeta/PROOF.md#1-weighted-reciprocity). Here the point set is P, its ground set is E with size n, and a0=n−|a|.

## The reciprocal transmuted M-triangle

For positive real U<V put w=V−U and average (R) over independent geometrically distributed variables. For each i∈E let c_i=1+N_i where Pr(N_i=k)=(1−p)p^k and p=U/V. Let v−1=N0 be geometric with parameter p0=1/(1+w). These random variables have all polynomial moments, so termwise averaging is valid. For a≥1,
```
E binom(1+N_i,a) = p^{a−1}/(1−p)^a = V U^{a−1}/w^a,
E binom(N_i+a−1,a) = p/(1−p)^a = U V^{a−1}/w^a.
```
For a=0 both expectations are 1. These identities are respectively the coefficients of s^a in (1−p)(1+s)/(1−p−ps) and (1−p)(1−s)/(1−p−s); the second uses the usual expansion of (1−s)^{-N_i}. For the universal summand,
```
E binom(N0,a0) = [p0/(1−p0)]^{a0} = w^{-a0},
E binom(N0+a0,a0) = (1−p0)^{-a0} = (1+w)^{a0}/w^{a0}.
```
The first identity uses E(1+s)^{N0}; the second uses E(1−s)^{−N0−1}. Multiply the averaged identity by w^n and write s(a)=#{i:a_i>0}. We obtain
```
Σ_{a∈P} U^{|a|−s(a)} V^{s(a)}
 = Σ_{a∈P} V^{|a|−s(a)} U^{s(a)} (1−U+V)^{n−|a|}.       (S)
```
Both sides are polynomials, so equality extends from the open cone 0<U<V to all variables.

For the coordinate downset P, every interval [b,a] is a product of chains. Its Möbius function is zero unless a−b has entries 0 or 1, in which case it is (−1)^{|a−b|}. Conditioning the M-triangle on its upper point a and summing over b thus gives
```
M_P(x,y) = Σ_{a∈P} (xy)^{|a|−s(a)} [y(x−1)]^{s(a)}.
```
Applying the exact transmutation (x,y) ↦ ((1−y)/(1−xy),1−xy) from the source gives
```
Mbar_P(x,y) = Σ_{a∈P} (1−y)^{|a|−s(a)} [y(x−1)]^{s(a)}.
```
Apply (S) with U=1−x and V=x(y−1), for which 1−U+V=xy. The left side is Mbar_P(y,x). The right side is precisely (xy)^n Mbar_P(1/x,1/y), because for e=|a|−s(a) and s=s(a),
```
(xy)^n (1−1/y)^e [(1/y)(1/x−1)]^s
 = (xy)^{n−|a|} [x(y−1)]^e(1−x)^s.
```
This gives the literal Conjecture 8.2 for every preorder, independent of the existence assertion in Conjecture 8.1.

## Prior work

The original source names both statements and explicitly distinguishes equation (21) from its unweighted consequence. Luo's ordinal-sum proof concerns another conjecture. The [November 2026 preorder-polytope preprint](https://doi.org/10.5281/zenodo.24235777) reports a proof of Conjecture 7.2 and of (22) and says the q-form of 4.9 and Conjecture 8.2 are still open. Searches for their exact statements and labels did not uncover a subsequent solution. The multiaffine identity and Conjecture 8.2 are the new claims here, not the ordinary reciprocity.

The separate lattice realization claim 8.1 has a [reported corolla obstruction](https://aixiv.online/abs/2611.02411). The polynomial identity of 8.2 does not depend on that claim.
