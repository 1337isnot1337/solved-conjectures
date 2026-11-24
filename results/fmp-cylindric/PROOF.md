# Ferroni–Morales–Panova conjecture

**Result.** Ferroni–Morales–Panova's cylindric-skew order-positivity assertion ([Conjecture 7.9](https://doi.org/10.1112/plms.70204)) admits two different answers depending on the boundary convention. The usual cylindric skew diagrams, whose two periodically extended boundary sequences are weakly decreasing, **do** have nonnegative order-polynomial coefficients. If the displayed relaxed seam inequalities (7.1) are read literally together with the unpinned wrap described verbally in §7.2, the claim is **false**: a 13-cell counterexample and failures of unbounded size are given in §6. The distinction is necessary because the Gessel–Krattenthaler determinant requires additional boundary-value constraints at the relaxed endpoints.

## 1. The conventions and edge cases

Let λ and μ be partitions, padded to ℓ rows, with μᵢ ≤ λᵢ. Row i consists of the integer columns j satisfying μᵢ < j ≤ λᵢ. Use the standard Gessel–Krattenthaler wrap: row ℓ, column j is followed by row 1, column j+d, wherever both cells exist. Along each horizontal or downward vertical step, including the wrap, plane-partition values weakly decrease. This is the verbal convention of FMP §7.2 (the shifted last row is placed *above* the first), their Figure 7, and [Gessel–Krattenthaler, *Cylindric partitions*](https://doi.org/10.1090/S0002-9947-97-01791-1), equation (1.3c). The isolated coordinate description just before FMP Theorem 7.4 is not consistent with those conventions: its stated restriction in Figure 7 would give zero wrap pairs since μℓ=0.

In Sections 2–5 assume that both periodic boundary sequences are weakly decreasing, equivalently

    λℓ+d ≥ λ₁,  μℓ+d ≥ μ₁.

These are the standard skew-diagram conditions for a periodic strip, with ordinary partitions λ, μ inside the fundamental period. They are stronger by one at the seam than the displayed inequalities (7.1) in FMP. Gessel–Krattenthaler's Theorem 2 specializes to FMP (7.2) on this standard class without additional boundary conditions.

Without wrap pairs the shape is ordinary skew and FMP Theorem 4.2 applies. With wrap pairs, first and last rows are nonempty. We may delete any empty interior row a: occupied columns above it are greater than μₐ, and occupied columns below it are at most λₐ=μₐ. Thus deletion creates no new vertical comparisons, leaves wrap comparisons unchanged, and preserves the seam inequalities. If ℓ=1, any acyclic wrap constraint is already redundant in the row chain. If ℓ≥2 and d=0, any wrap pair is in a column occupied in every row by monotonicity of both boundaries, so it makes a directed cycle and does not give a cell poset. We therefore assume d>0. The standard seam bounds and ordinary partitions require d≥0.

## 2. Extracting the derivative in the Gessel–Krattenthaler sum

Extend the boundaries by λ_{i+ℓ}=λ_i−d and μ_{i+ℓ}=μ_i−d. A term in the determinant sum (FMP Theorem 7.4, equation (7.2)) chooses a permutation π and a vector (k₁,…,k_ℓ) of sum zero. Write the lifted column index as Jᵢ=π(i)−ℓkᵢ. The sign is sgn π, and row i contributes

    binom(t−1+b,b+Jᵢ−i),   b=λᵢ−μ_{Jᵢ}.

This is (7.2) since μ_{Jᵢ}=μ_{π(i)}+dkᵢ. A negative lower index makes the corresponding entry zero. There are only finitely many nonzero products: the nonnegative lower index bounds each kᵢ above, uniformly over π, and the zero-sum condition then bounds each below.

Whenever J≥i for a representative row 1≤i≤ℓ, b=λᵢ−μ_J is at least 1. For J≤ℓ use μ_J≤μᵢ<λᵢ. For J>ℓ, the existence of a wrap pair implies μ_J≤μ₁−d<λℓ≤λᵢ. Call these factors **forward**. Writing D=J−i≥0, a forward factor has constant term zero and coefficient of t

    (−1)^D (b−1)! D!/(b+D)!.

This is the product of all nonzero constant factors in (t+b−1)…(t−D), divided by (b+D)!. Every nonzero **backward** factor J<i has b≥i−J≥1, and its constant term is

    binom(b−1,b+J−i)=binom(b−1,i−J−1).

The sum of displacements Jᵢ−i is zero, so every nonzero term has at least one forward factor. The linear coefficient thus uses exactly one forward factor, differentiated, and all other factors evaluated at zero.

## 3. Cancellation on the cylinder

Fix the forward row r and lift J=j−ℓk. A backward constant is the number of lattice paths of unit east and north steps from

    S_J=(μ_J−J−1,J+1)    to    E_i=(λ_i−i−1,i).

The displacements are b+J−i and i−J−1, summing to b−1. Conversely any such path automatically has J<i, and nonnegative displacements give a nonzero backward entry. These sources and sinks are periodic with period vector p=(−d−ℓ,ℓ). Translating a path from S_{j'−ℓkᵢ} to E_i by kᵢp gives a path from the representative source S_{j'} to E_i+kᵢp. Thus, in the quotient lattice cylinder, each remaining source and sink residue is used once, and the sum of terminal shift integers is −k.

The signed sum cancels all families in which two projected paths intersect. The function u(x,y)=ℓx+(d+ℓ)y is invariant under p and strictly increases along either allowed step. No path can therefore visit a projected vertex twice. Choose the shared vertex of smallest u (break ties by a fixed ordering); select among its visitors the two paths of lowest source index. Swap their tails there. In the plane translate the tails by opposite period multiples to splice them to the new prefixes. The endpoint residues are exchanged and the sum of terminal shifts is unchanged. The multiset of visited projected vertices, the chosen shared vertex and its visitors' source labels are unchanged, so this is a sign-reversing involution. The fixed forward factor is not modified.

## 4. The uncancelled signs

Periodically lift a disjoint family, and denote by w(i) the source index matched to sink i, excluding sink residue r and source residue j. This bijection between the two sets of integer indices is strictly increasing. In fact, the weak decrease of the periodically extended boundaries implies that the x-coordinates of both source and sink lists weakly decrease as their indices increase, and their y-coordinates strictly increase. If i<i' and w(i)>w(i'), the path to E_i starts weakly to the left and strictly above the start of the path to E_{i'}, but ends weakly to the right and strictly below its end. The horizontal interval of the latter path is contained in the former's. At its left boundary the former path is above its start, and at its right boundary the former path is below its end, unless they already meet on one of those boundary lines. Two east/north paths cannot switch their vertical order without an intersection: if disjoint, their sections at a common horizontal coordinate are disjoint compact intervals, and their relative order cannot change across the horizontal interval, including at vertical runs. For a zero-length horizontal interval the latter path is a vertical segment and the same conclusion holds directly. Unit lattice edges can meet only at a lattice vertex, contradicting projected vertex disjointness. Periodic copies of the same path cannot give an inverted pair since both their indices shift together.

Put m=ℓ−1. Write the surviving representative sink indices s₁<⋯<sₘ and source indices a₁<⋯<aₘ, and extend each list by adding ℓ when the list index increases by m. An increasing bijection of the two infinite lists is a shift w(s_q)=a_{q+c} for some integer c. Telescoping gives

    Σ_{q=1}^m a_{q+c} = Σ_{q=1}^m a_q + ℓc.

The zero total displacement, including the forward factor, is

    0 = J−r + Σ_q (w(s_q)−s_q) = J−j+ℓc.

Hence c=k. The permutation of remaining residues is a cyclic shift by k, of sign (−1)^((m−1)k). Restoring the fixed entry at (r,j) multiplies the sign by (−1)^(r+j). Including the sign of the forward derivative, its total exponent is

    (r+j)+(ℓ−2)k+(J−r)=2j−2k.

It is even. Every uncancelled family therefore contributes the positive magnitude (b−1)!(J−r)!/(b+J−r)! of the differentiated factor. Sum over forward pairs to prove that the linear coefficient is nonnegative.

## 5. All coefficients and closure under ideal cuts

The order-polynomial coproduct (FMP Proposition 3.1) says that Ω(P;x+y) is the sum of Ω(I;x)Ω(P∖I;y) over lower ideals I. Repeating it and taking the coefficient of x₁⋯x_k expresses k! times the coefficient of t^k as a sum of products of linear coefficients on intervals between ideals. It remains to check that these intervals have the same shape hypotheses.

Orient the cell order so that left or above is a predecessor, including the wrapped predecessor from the shifted last row. This is the dual of the orientation on plane-partition values and has the same order polynomial. An ideal I consists in row i of the prefix ending at some νᵢ with μᵢ≤νᵢ≤λᵢ. The cut ν weakly decreases internally: if νᵢ<νᵢ₊₁, the lower cell in column νᵢ₊₁ lies in I, while its upper predecessor exists by monotonicity of the boundaries and does not lie in I.

The periodic condition persists at the seam. If ν₁>νℓ+d, then column ν₁ of the first row is an ideal cell: it is greater than νℓ+d≥μℓ+d≥μ₁. Its wrapped predecessor exists because ν₁≤λ₁≤λℓ+d and ν₁>μℓ+d. But that predecessor is outside the ideal, a contradiction. Hence νℓ+d≥ν₁. Both parts of the ideal cut retain the boundary conditions. An interval between ideals is order-convex, so any comparison path between its elements stays in the interval; its inherited order is generated by its own internal grid and wrap comparisons.

This proves nonnegativity of every coefficient. It also gives Ehrhart positivity of standard cylindric-skew order polytopes since their Ehrhart polynomial is Ω(P;t+1). The proved ideal/filter stability lets one apply the general transfer theorem of [Jochemko–Menon, arXiv:2604.08394, Theorems 1.3–1.4](https://arxiv.org/abs/2604.08394) to obtain Ehrhart positivity for marked order polytopes on the same class, including their multivariate positivity in successive marking differences. Also, n! times an order polynomial has integer coefficients by its expansion in binom(t,j) with integer coefficients counting strict chains of ideals (FMP equation (2.1)), since j≤n.

## 6. Failure under the published relaxed seam inequalities

Here is an acyclic unpinned shape satisfying the displayed (7.1) of FMP:

    λ=(9,9,8,6,2),  μ=(7,7,6,1,0),  d=6.

Both seam inequalities hold with equality at the relaxed endpoints, λℓ+d=λ₁−1 and μℓ+d=μ₁−1. The occupied row sets are {8,9}, {8,9}, {7,8}, {2,3,4,5,6}, and {1,2}. The single wrap pair is from (5,2) to (1,8). All row and vertical edges, including the wrap, strictly increase the integer potential ℓ·j+d·i on representative cell (i,j). Thus they define a poset after taking their transitive closure.

The order-polynomial values at t=0,1,…,13 are

    (0, 1, 99, 2559, 33041, 275160, 1687503, 8248254,
     33826449, 120595278, 383436376, 1108248906, 2954764590, 7350892820).

For an exact elementary certificate, enumerate all subsets of the 13 cells having no edge from their complement into the subset; these are precisely the lower ideals for the increasing-potential orientation. Set F₀(∅)=1 and F₀(I)=0 for all nonempty ideals. Then F_{t+1}(I)=Σ_{J⊆I}F_t(J), summing only over ideals J. This recurrence counts multichains of ideals ending at I, so Ω(P;t)=F_t(P). The values above are generated by the independent direct recurrence in the accompanying checker. Since the order polynomial has degree 13, its linear coefficient is recovered exactly by the Lagrange-interpolation formula

    [t] Ω(P;t) = Σ_{j=1}^{13} (−1)^(j−1) binom(13,j) Ω(P;j)/j
               = −1/17160.

The derivative weight follows by evaluating at zero the derivative of the jth Lagrange basis polynomial on nodes 0,1,…,13; the node j=0 makes no contribution because Ω(P;0)=0.

The same conjecture is restated by Alejandro H. Morales as Conjecture 4 in [Oberwolfach Report 2/2026, pp. 148–149](https://ems.press/content/serial-article-files/53596?nt=1#page=68). That restatement gives the same relaxed inequalities and only the verbal wrap convention, with entries 1 through n. Thus the negative example also applies to that unambiguous unpinned restatement.

The counterexamples are not bounded in size. For each h≥0 shift rows 1–3 right by h, replace d by d+h, and insert h singleton rows with occupied columns 6+h,5+h,…,7 between original rows 3 and 4. Both boundary sequences remain partitions. Both displayed relaxed seam inequalities remain equalities. The old wrap pairs are simply translated at their top ends and unchanged at their bottom ends. The inserted rows are pairwise disjoint in column and share no column with either adjacent old row: the smallest column in row 3 is 7+h, and the largest column in row 4 is 6. Thus the new poset is the old one disjoint union h isolated cells. Its order polynomial is t^hΩ(P;t), with negative coefficient of t^(h+1).

### Why the determinant does not apply to this counterexample

The original [Gessel–Krattenthaler paper](https://doi.org/10.1090/S0002-9947-97-01791-1), p. 433, following (3.1)–(3.2), states precisely what happens at these seam equalities. If λℓ=λ₁−d−1 the additional comparison to the *missing* cell beyond the end of the last row forces the rightmost cell of the first row to take the lower bound. If μℓ=μ₁−d−1 the additional comparison to the *missing* cell just left of the first row forces the leftmost cell of the last row to take the upper bound. Under these conditions the determinant enumerates pinned fillings, not the order-preserving maps of the actual unpinned cell poset. In FMP §7.2, neither exceptional boundary condition appears before formula (7.2), and an ordinary order polynomial does not fix variables to bounds.

One diagnostic example is λ=(6,5,4), μ=(3,2,1), d=1: the actual unpinned poset has Ω(P;2)=12, whereas formula (7.2) gives 8. With the two Gessel–Krattenthaler pins the count is indeed 8. This explains the discrepancy without changing the determinant theorem when used with its hypotheses.

## Prior work and scope

FMP Theorem 7.7 proves the circular-fence (closed ribbon) case and uses the determinant with a specialized shift. The determinant and affine tail swapping in another setting are due to Gessel–Krattenthaler. For standard cylindric skew diagrams the new step here is fixing the one forward factor to extract the linear coefficient, then proving that every disjoint backward path family has positive total sign. For the displayed relaxed unpinned convention, the exact witness and its enlargement disprove the coefficient assertion. We found no earlier full proof of the standard version or counterexample to the displayed relaxed version.

The November 2026 preprint [*Annular Obstructions and Skew-Shape Block Identities*](https://arxiv.org/abs/2611.14506) concerns an unrelated annular cluster-polynomial counterexample and Kahane's ordinary-skew block statistic, not FMP Conjecture 7.9. Neither result here addresses the separate width-two or shifted-skew clauses of Conjecture 1.5, or the contradictory coordinate sentence in FMP considered independently of its figure and cited source.
