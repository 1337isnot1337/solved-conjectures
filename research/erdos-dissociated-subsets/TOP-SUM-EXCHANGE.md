# An upper-star exchange in a dissociated cube

Let B={b₁,…,b_d} be a maximum dissociated subset of a finite positive set P. Put S=∑B. If S∈P, then **at most two** of the d values S−b_i belong to P. In particular, if d≥3, a maximum basis and its whole nonzero subset-sum cube cannot both lie inside P.

This is a structural restriction for [Erdős #963](https://www.erdosproblems.com/963), not a count of all of P.

## Three replacements produce four independent choices

Assume S and S−b_i lie in P for three distinct indices i∈I. Retain B outside I and add S and the three complements. These d+1 numbers are distinct: S−b_i for i∈I is a sum of at least two members of B and cannot equal any singleton by dissociation when the singleton belongs to that sum or when it does not. The complement values are themselves distinct since the b_i are distinct.

In any ternary relation on the new set, let ε₀ be the coefficient of S, let ε_i be the coefficients of the three complements, and let δ_j be the coefficients of the retained basis. Put K=ε₀+∑_{i∈I}ε_i. Then

    K S = ∑_{i∈I} ε_i b_i − ∑_{j∉I} δ_j b_j.

If K=0, dissociation of B forces all the coefficients on the right to vanish, then ε₀=0. If |K|≥2, the absolute right-hand side is at most S, a contradiction. When K=1, equality at S is possible only if every coefficient on the right is +1, since all b_i>0. In particular all three ε_i=+1, forcing K≥2. Reversing signs excludes K=−1. The new set is therefore dissociated, contradicting maximal dimension.

The same argument works for a restricted center T=∑_{j∈J}b_j with I⊆J and with ∑_{j∉J}b_j<min_{i∈I}b_i. Now the right-hand side has magnitude at most S<2T. For K=1, if any selected ε_i were less than one, its deficit alone would exceed the entire outside-J sum, so equality at T is impossible; the K=−1 case is again symmetric. Thus no such T and its three designated complements can all lie in P.

## Four complements without their center

Suppose B is 2-dissociated as in [CARRY-EXCHANGE](CARRY-EXCHANGE.md), and let ℓ index its smallest element. If S−b_ℓ is in P, at most two of the other complements can be in P, even when S is not. To see this, given three others (index set I), retain B outside I and add four complements indexed by I∪{ℓ}. The same relation now has K=∑_{i∈I∪{ℓ}}ε_i and the right-hand side coefficient at ℓ can range from −2 to 2, since b_ℓ is also retained. Every other coefficient lies in [−1,1].

- For K=0, 2-dissociation forces all formal right-hand coefficients to vanish. In particular ε_i=0 for i∈I, hence K=0 gives ε_ℓ=0 and all retained coefficients are zero.
- For |K|≥2 the right-hand magnitude is at most S+b_ℓ<2S.
- For K=1 the extra contribution at ℓ above its coefficient-one baseline is at most b_ℓ, which is strictly smaller than any other basis element. Thus every other coefficient must be +1 for the sum to reach S. In particular the three ε_i for i∈I equal +1, making K≥2 regardless of ε_ℓ. Negating excludes K=−1.

This is another exact exchange, independent of the carry-support proof.

These restrictions constrain the ordinary positive subset sums lying in P, whereas the known universal covering by a maximum basis uses its full signed span. Passing from the signed cover to a cardinality bound remains open.

[Coordination #1101](https://github.com/1337isnot1337/solved-conjectures/issues/1101).
