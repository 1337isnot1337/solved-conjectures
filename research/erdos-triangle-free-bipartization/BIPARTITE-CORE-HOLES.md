# Disjoint holes in a bipartite core

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). Let a finite triangle-free graph have three independent vertex sets A, B and C partitioning its support. Total vertex mass is 1, and edge masses are endpoint products. No hypothesis of equitable degrees is imposed.

## A repair certificate

Take indexed pairwise disjoint subsets A_i of A and B_i of B; vertices outside all subsets are permitted. For x in C, write d_X(x) for its weighted degree into X. Define

    R = sum_i e(A_i,B_i)
        + sum_(x in C) w_x [d_A(x)+d_B(x)
            - max(d_A(x), d_B(x), max_i(d_(A_i)(x)+d_(B_i)(x)))].

The inner maximum uses just the first two choices if the index family is empty. If R <= 1/20000, then the graph satisfies the sharp bound beta <= 1/25.

Indeed, remove all edges between A_i and B_i. For each x in C retain the links described by one maximizing option: all links to just A, all to just B, or only its links to the two matched subsets A_i and B_i. The deleted mass is exactly R. The edited graph maps to the climbable template from [the induced-path note](INDUCED-PATH-FREE.md). Map each A_i to a_i, each B_i to b_i, and the vertices taking option i to c_i. Put unindexed A and B vertices in separate fresh template indices on their own sides. Vertices of C retaining only A links go to a new b-index, and those retaining only B links go to a separate new a-index. Choose all these fresh indices distinct, so none creates a forbidden within-index A–B link. There are no edges inside C. Every surviving edge is thus mapped to an allowed one.

For a middle-band input, e <= 3197/20000. The edited graph has at most this edge mass. The explicit climbable gap in the linked proof is beta <= 799/20000 at this density, with the disconnected version following by the same component proof there. Restoring the removed edges adds at most R. At other densities use [the established two tails](https://arxiv.org/abs/2103.14179).

### A canonical choice of blocks

Form the bipartite graph of missing pairs between A and B, and use its connected components as blocks. For any x in C adjacent to both A and B, triangle-freeness means that the entire rectangle N_A(x) by N_B(x) lies in that missing-pair graph. Since both shores are nonempty, its endpoints belong to one component. Thus the second sum in R is zero. The first sum is precisely the original A–B edge mass within these missing-pair components. In particular, if each component of the missing graph is complete bipartite, the sharp bound follows with R=0. The same argument tolerates weighted deviations from that condition. This certificate remains informative even when the three-coloring has strongly imbalanced rows, but a single giant missing-pair component can make this canonical choice useless.

## Complement of a large independent set

Separately, the sharp bound holds for every weighted triangle-free graph with an independent set of mass at least 59/100. Let its mass be a and let Y be its complement of mass s=1-a. Write z=e(Y). The cut separating the independent set from Y pays exactly z, so assume z>1/25. Weighted Mantel gives s>2/5, hence a<3/5 and s<=41/100.

Take an optimal cut U,V of Y. Its loss is at most z-4z²/s² by the classical neighborhood cut averaged on Y. In the present range the expression decreases with z and increases with s, so its loss is at most 81/42025. The missing mass between U and V is at most s²/4-4z²/s², again maximized by raising s and lowering z to those boundaries. It is therefore at most 265761/67240000, which is smaller than (63/1000)². For each vertex x of the independent set, its neighborhoods in U and V span a missing rectangle. Their mass product is no larger than the missing mass, so assigning x to its cheaper shore costs at most (63/1000)w_x. These assignments do not interfere. The resulting whole-graph loss is at most

    81/42025 + (3/5)(63/1000) = 333909/8405000 < 1/25.

Every counterexample accordingly has independence mass less than 59/100, and in particular every vertex has weighted degree less than 59/100. This conclusion makes no minimal-support hypothesis.

## Bounding the repair without tracking each attachment profile

Let eta be the total missing A–B pair mass outside the union of the matched rectangles. The rectangles need not be fully missing; actual edges inside them still incur the first cost in R. If c is the mass of C, then

    R <= sum_i e(A_i,B_i) + c sqrt(2 eta).

In particular, if there are at most two matched rectangles, this upper bound may be as large as 803/80000 rather than 1/20000. The repaired graph then has at most two active c-indices. It maps to the Clebsch graph by the explicit zero-, one-, and two-index constructions in the linked induced-path proof. The five Clebsch cuts on the repaired graph give beta <= (e-R)/5. Restoring the edits gives beta <= e/5+4R/5, which is at most 1/25 throughout the middle band at the stated threshold.

To prove the square-root bound, consider one x in C and put r=d_A(x), q=d_B(x), with r_i,q_i its degree masses by block. Add the two unindexed sets as distinct dummy blocks, one for each shore. Thus r=sum_i r_i and q=sum_i q_i. Its lost degree mass is

    l = min(r, q, r+q-max_i(r_i+q_i)).

The dummy blocks do not change this number because their masses are already at most max(r,q). Its attachment rectangle is entirely missing, so its off-block mass U=rq-sum_i r_i q_i is at most eta. We claim that U >= l²/2.

If l is positive, trim the r_i and q_i to nonnegative masses r'_i,q'_i, each retaining total l, with r'_i+q'_i <= l at every block. One can do this by max-flow: two supply nodes have mass l each, their capacities to block i are r_i and q_i, and block i has sink capacity l. The cut checks for the two supply nodes separately are sum_i min(l,r_i)>=l and sum_i min(l,q_i)>=l, from r,q>=l. The joint cut check is sum_i min(l,r_i+q_i)>=2l. If two or more summands reach l this is immediate; if none reach l it follows from r+q>=2l; if exactly one reaches l the remainder has mass at least l by the formula for l. Thus a feasible trimming exists. Now

    sum_i r'_i q'_i <= sum_i (r'_i+q'_i)²/4 <= l²/2.

All off-block products are nonnegative and cannot increase under trimming. Their original total U is therefore at least l² - l²/2, as claimed. The coefficient 1/2 is sharp for this profile inequality: two blocks with r_i=q_i=l/2 give equality. Hence l<=sqrt(2 eta); multiply by each vertex weight and sum to prove the repair estimate.
