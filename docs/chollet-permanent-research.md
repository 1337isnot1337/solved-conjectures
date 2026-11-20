# Chollet's permanent conjecture: attack and failed-route certificate

2026-11-20. Research notes only. No resolution or novelty claim.

## Literature gate

Chollet's 1982 conjecture is per(A∘B) ≤ per(A)per(B) for complex Hermitian PSD matrices. Original source: J. Chollet, American Mathematical Monthly 89 (1982), 57–58, DOI 10.1080/00029890.1982.11995380. Yair Lavi's updated status page https://yair-lavi.com/mincs-list/conjecture-30/index.html explicitly marks the full problem open, while listing orders through six and rank at most three as covered by recent work. Pant–Singh https://arxiv.org/abs/2604.24192 is a primary 2026 source proving structural classes, not the unrestricted assertion. Searches for full proofs/counterexamples found restricted results and disproofs of other permanent conjectures, not a full resolution of Chollet.

The standard Cauchy–Schwarz reduction, attributed already to Chollet, is to B=conjugate(A). For permutation products a_sigma, b_sigma, |sum a_sigma b_sigma| ≤ sqrt(sum |a_sigma|² sum |b_sigma|²). Consequently it suffices to prove per(|A|²) ≤ per(A)². This reduction is not new.

## Counterexample reconnaissance

`search.py` uses Gram matrices V V* to enforce PSD and the Glynn sign formula with exact analytic gradients (floating evaluation) to seek violations of the full universal conjecture. The gradient was checked at one random order-four/rank-at-most-three point by central finite differences, maximum error 2.3e-10; this is a spot check, not universal validation. `results.json` records 72 starts at selected orders 7–12 with Gram column counts 4–6 (rank upper bounds, not certified final ranks). `fullrank.json` records another 84 starts at orders 7, 8, 9, 10, and 12, using near-full/full Gram column counts. Five reported ratios exceeded one only at floating-point noise scale; none passed the candidate threshold log(R)>1e-7, and none is a certified violation. These are not proofs, not exhaustive searches, and not claimed dimension-specific mathematical results. Floating candidates would require exact Gram reconstruction and exact permanent certificates before being considered evidence of disproof.

## Exact obstruction to a proposed proof route

A tempting stronger claim is that for every correlation matrix A, the ratio

    R(t) = per(|(1−t)I+tA|²) / per((1−t)I+tA)²

is nonincreasing on [0,1]. Since R(0)=1, this would prove Chollet. It is false, as follows. This is an obstruction to the strategy, NOT a counterexample to Chollet and not claimed as a previously unknown result.

Let ζ be a primitive sixth root of unity and A_ij=(1+ζ^(i−j))/2 for 0≤i,j<6. This is the Gram matrix of unit vectors (1,ζ^i)/sqrt(2), up to the harmless choice of inner-product convention, and has rank two. A(t)=(1−t)I+tA is PSD for 0≤t≤1.

For a matrix M with unit diagonal, multilinearity gives

    (d/dt) per((1−t)I+tM) at t=1
      = n per(M) − sum_i per(M with row/column i deleted).

For H(t)=|A(t)|², diagonal entries are one and off-diagonal entries are t²|a_ij|², so H'(1)=2(H−I), where H=|A|².

Here H is the rational circulant matrix with first row

    (1, 3/4, 1/4, 0, 1/4, 3/4).

Exact permutation enumeration gives per(H)=4005/256 and each principal five-minor has permanent 51/8. These statements are verified with rational arithmetic by `radial_certificate.py`.

For completeness, the Gram permanent formula follows by expanding ∏_j(z+ζ^j w)/sqrt(2): in the squared Gaussian norm, monomials z^k w^(n−k) have norm k!(n−k)!. The product is (z^6−w^6)/8 up to a unit phase, giving per(A)=2·6!/2^6=45/2. Deleting any one factor leaves five-degree coefficients all of modulus one, giving each principal minor permanent

    sum_(k=0)^5 k!(5−k)! / 2^5 = 39/4.

Therefore

    R'(1)/R(1)
      = 2·6[(39/4)/(45/2) − (51/8)/(4005/256)]
      = 138/445 > 0.

Continuity gives an interval immediately left of 1 on which R increases. The endpoint ratio itself is only 89/2880<1, so there is no contradiction to Chollet.

## What remains

The monotonicity shortcut is ruled out exactly. Numerical search did not find a counterexample. No general positivity argument controlling permutation-phase cancellation has been established. Any future proof cannot simply assert monotonicity of this ratio under identity contraction.
