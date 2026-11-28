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
