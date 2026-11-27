# Profile collisions in clique-free graphons

For a graphon W with t(K_r,W)=0, r≥3, consider the adjacency bits of two vertices x,y to a single independent random root. Write Δ(x,y) for their disagreement probability, sampling graphon edges independently conditional on positions. For every u≥0,

    ∫∫ W(x,y) 1[Δ(x,y)≤u] dxdy ≤ (3r−4)u.

In particular the edge mass of pairs with the same profile to a roots drawn independently, averaged over those roots and the profile bits, is at most (3r−4)/a. This extends the decisive rounding step of [the polynomial rooted maximum-cut bound](POLYNOMIAL-ROOT-RATE.md) beyond triangle-free graphons.

## Proof of the small-disagreement tail

Write W_x(z)=W(x,z). Pointwise for a,b∈[0,1],

    a+b−2ab ≥ |a−b|,
    a+b−2ab = (a−b)² + a(1−a) + b(1−b).

Thus Δ(x,y)≤u implies both ||W_x−W_y||₁≤u and q_x=∫W_x(1−W_x)≤u.

Fix a typical x, and set R={y:W(x,y)>0 and Δ(x,y)≤u}. If its W_x-mass is zero there is nothing to prove. Otherwise q_x≤u. Put R'=R∩{y:W(x,y)≥1/2}. On the part omitted from R', W_x≤2W_x(1−W_x), so that part contributes at most 2u to the W_x-mass of R.

For every relevant y∈R', its total missing adjacency on R' is at most

    ∫_(R') (1−W(y,z)) dz
       ≤ ||W_x−W_y||₁ + ∫_(R') (1−W(x,z)) dz
       ≤ u+2q_x ≤ 3u.

The second inequality on the integral uses W_x≥1/2 on R'. Also R' lies in the positive neighborhood of x. For almost every x the restriction there is K_(r−1)-free, since any clique density in this positive neighborhood would contribute to t(K_r,W). By Turán's bound on this restricted graphon, if s=|R'|>0 its total missing mass is at least s²/(r−2). The previous estimate gives missing mass at most 3us, hence s≤3(r−2)u. Therefore ∫_R W_x≤s+2u≤(3r−4)u; finally integrate over x.

Independent roots yield the expected collision mass ∫∫ W(1−Δ)^a. Bound by exp(−aΔ), write exp(−aΔ)=∫ from Δ to infinity of a exp(−at) dt, and use the small-disagreement tail to bound this mass by (3r−4)∫₀^∞ at exp(−at)dt=(3r−4)/a.

## Consequence for rooted MaxCut

In the [stagewise construction](POLYNOMIAL-ROOT-RATE.md), neither the greedy response nor the validation requires triangle-freeness. The collision estimate above is the replacement for disjoint neighborhoods. Use an arbitrarily near-optimal sign function in the construction and a=O(r/ε) extra anchors. The training-root count is O(ε⁻³). As in the updated polynomial proof, condition on one independent rounding seed during validation and average over its choice afterward. Only the training labels are guessed, so the logarithm of the candidate count is O(ε⁻³), regardless of the number of extra anchors. The resulting number of roots is

    O(ε⁻⁵+r/ε).

For unrestricted graphons some assumption is necessary: in the complete graphon, all Boolean adjacency profiles are identical, so the deterministic profile envelope cannot approximate the optimum balanced cut.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
