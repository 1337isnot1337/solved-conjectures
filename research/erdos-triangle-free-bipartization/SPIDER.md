# Distance-weighted bipartization when the maximum cut is a spider

This is an all-weight, unbounded-template step on [Erdős Problem #23](https://www.erdosproblems.com/23), not a fixed-order computation. The general conjecture remains open.

Let G be a finite triangle-free graph with positive vertex weights p_v. An edge uv has weight p_u p_v. Fix a minimum-weight bipartization (equivalently, a maximum weighted cut); let B be its crossing-edge graph and M its monochromatic edges. Assume B is a spider: a hub with finitely many unbranched arms of arbitrary positive lengths ℓ_i, ending at leaves v_i, and that **all** edges of M join leaves. Then

    Γ = ∑_{uv∈M} p_u p_v (dist_B(u,v)+1)² ≤ (∑_v p_v)².

In particular the total weight of M is at most (∑ p_v)²/25. The inequality for Γ is stronger than the bipartization bound here, and is the proposed sufficient invariant in [Ferudun, §7](https://arxiv.org/html/2606.28041v1). Arbitrarily large integral blow-ups are included under the class-constant choice of cut.

## Capacities and notation

Write h for the hub weight, y_i for each leaf weight, β for the total weight of M, and D_i for the total weight of M-edges incident with leaf i. For every arm edge ab, flipping the colours on the component of B−ab containing leaf i would make every bad edge incident with that leaf crossing, and make only ab newly bad. Optimality of the cut therefore gives p_a p_b≥D_i. Thus any pair of successive arm vertices costs at least 2√D_i in total, and the first nonhub vertex costs at least D_i/h. Arms meeting no demand may be kept with D_i=0.

The ends of any edge of M have the same B-colour, so their two arm lengths have the same parity. Write β_e,β_o for the total weights of M in the even and odd arm classes, and Y_e,Y_o for the corresponding total leaf weights. By weighted Mantel, Y_e≥2√β_e and Y_o≥2√β_o. Indeed, prove weighted Mantel first with rational weights by equal-fibre blow-up after clearing denominators, then take real limits. The demand graphs on the leaf classes are triangle-free since G is.

In Euclidean space indexed by E(M), let a have coordinate √(p_u p_v) on uv, and let u_i be a restricted to the edges incident to leaf i. Then ||u_i||=√D_i and

    √Γ = ||a + ∑_i ℓ_i u_i||.

This is because each demand path in B runs along its two arms and contains exactly ℓ_i+ℓ_j+1 vertices.

## If h≥√β

On an even arm, pair all its nonhub vertices consecutively. On an odd arm pair all except its leaf, leaving the leaf weight available. Each paired arm vertex's accounting removes one unit of u_i in the triangle-inequality bound, because each pair costs at least 2||u_i||. After accounting for those pairs, the residual vector is a+∑_{odd i}u_i. Its norm is √(β_e+9β_o), since the multiplier is 1 on even-even demands and 3 on odd-odd demands. Now

    √(β_e+9β_o) ≤ √β + 2√β_o ≤ h+Y_o.

The unused hub and odd leaf weights cover the residual.

## If 0<h≤√β

Reserve the first nonhub vertex on every arm. On odd arms pair all other nonhub vertices. On even arms also reserve the leaf and pair the remaining vertices. All these pairs are successive vertices on their arm. The leftover vector after the same triangle inequality is a+∑_{odd i}u_i+2∑_{even i}u_i, with norm √(25β_e+9β_o). The reserved first vertices carry weight at least ∑D_i/h=2β/h. Together with the hub and even leaves they carry at least

    h + 2β/h + Y_e ≥ 3√β + 2√β_e ≥ √(25β_e+9β_o).

The first inequality uses t+2/t≥3 for t=h/√β∈(0,1]; the second follows by squaring and using √(ββ_e)≥β_e. This covers the residual, proving the claim in the second case too. If β=0 the statement is immediate. Finally every monochromatic edge has even B-distance at least four: distance two would create a triangle. Thus 25β≤Γ. Equal-weight pentagons attain equality and can realize their crossing path as a two-arm spider.

## Scope and source gate

The [1988 article](https://www.renyi.hu/~p_erdos/1988-12.pdf) gives the exact all-order conjecture. [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179) deal with low and high density; [Ferudun](https://arxiv.org/html/2606.28041v1) treats a near-threshold envelope and finite orders, and proposes Γ in general. I did not find the weighted multiarm argument above in the searched sources. The proof does not treat crossed components of higher branching complexity, nor demands with interior endpoints. A quotient by twin classes alone does not imply the spider hypothesis.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
