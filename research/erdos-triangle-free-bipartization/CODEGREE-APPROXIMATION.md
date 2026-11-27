# Edit-distance approximation from the codegree tail

Let W be zero-one, triangle-free and saturated as in [CODEGREE-GAP](CODEGREE-GAP.md), with minimum degree ≥d₀>0. For η>0 put

    E(η) = measure{(x,y) : 0<K(x,y)<η}.

For every 0<ε≤1 there is a triangle-free weighted finite graph quotient U satisfying

    ||W−U||₁ ≤ (2+1/(2d₀)) (2E(η)+ε)

with at most (1+8/(η√ε))^ceil(16/(η²ε)) parts. This is a quantitative approximation in **edit** distance, not just cut distance; no uniform codegree gap is needed. The dependence on E(η) is essential to this argument.

## Cluster mean-square codegree rows

For almost every x let E_x={y:0<K(x,y)<η}. For any two such rows,

    ||W_x−W_(x')||₁ ≤ |E_x|+|E_(x')|+||K_x−K_(x')||₂²/η².

Outside E_x∪E_(x'), a disagreement in the W rows forces absolute difference at least η in the K rows; that yields the last term. Let σ=η√ε/4. Keep only the eigenvalues of T_W of absolute value greater than σ, so the number of retained coordinates is at most 1/σ². The projected K rows lie in a unit ball and differ from the full rows by at most σ. Cover that ball by balls of radius σ using a maximal σ-separated net, of size at most (1+2/σ)^ceil(1/σ²). Assign each row measurably to its first covering center. Any two rows in a resulting cell differ by at most 4σ in L² on the K side.

Draw X uniformly and X' independently conditional on lying in X's cell. Both unconditional marginals are uniform. Therefore, writing D=E||W_X−W_(X')||₁,

    D ≤ 2E(η)+ε.

## Sample a representative graph

Independently sample one point r_i from each positive-mass cell C_i and put U equal to W(r_i,r_j) on C_i×C_j for i≠j, and zero on diagonal squares. Almost surely the representative graph is triangle-free, since for any three distinct cells their independent representatives are sampled from a law absolutely continuous on triples.

For different cells, insert the intermediate entry W(r_i,y); after integrating and averaging, replacing x first and then y costs at most D each. This follows because the replaced coordinate is a new independent draw in the same cell, and the unreplaced coordinate can be integrated over its full ambient space, bounding the sum even with diagonal products excluded.

For a diagonal square the error is its original edge mass. By triangle-freeness, for almost every edge xy the two neighborhoods are disjoint, so ||W_x−W_y||₁=d(x)+d(y)≥2d₀. Summing over diagonal squares bounds their total error by

    (1/(2d₀)) ∑_i |C_i|² E[||W_X−W_(X')||₁ | X∈C_i] ≤ D/(2d₀).

The total expected error is thus at most (2+1/(2d₀))D, and a choice of representatives realizes this bound. This proves the assertion. At a maximizing graphon one can take d₀=4/25 by [vertex-weight stationarity](GRAPHON-EXTREMIZERS.md).

A usable constraint on E(η) for all maximizing counterexamples is still missing. This reduction does not replace the proof of the middle-density inequality.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
