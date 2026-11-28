# A six-cycle attachment obstruction

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). The theorem concerns a least-support saturated weighted counterexample, with the weights then maximizing the minimum cut on that fixed support. No assumption is made that arbitrary weightings of this root class maximize in its interior.

In such a counterexample, at **every** induced six-cycle root, let L be the vertices with at most one neighbor on the root, with total mass ell. Let M be the vertices seeing both shores of the root, and let q be the maximum weighted degree of a vertex of M inside M. Then

    ell + q > 1/500.

In particular no six-cycle can two-dominate the whole support with an independent mixed-attachment set. A six-cycle root is guaranteed to exist by [the circular result](CIRCULAR-THREE.md) and [the maximal triangle-free characterization](https://doi.org/10.1002/jgt.23235).

## Profiles and stationarity

Normalize total vertex mass to 1, and write beta for minimum monochromatic mass. Label root shores a_1,a_2,a_3 and b_1,b_2,b_3 with edges a_i b_j exactly for i different from j. An independent root profile meeting both shores must be exactly {a_i,b_i}, for some i. Write M_i for those vertices, so M is the union of the three sets. Each M_i is nonempty: saturation forces a common neighbor of the opposite roots a_i,b_i, and that neighbor cannot touch another root.

Outside L and M, each profile uses at least two roots on exactly one shore. The resulting vertex sets A and B are independent, since any two subsets of size at least two of the same three roots intersect. Write A_i for the profile seeing exactly the a-roots other than a_i, and A_* for the profile seeing all three. Define B_i and B_* symmetrically. Any neighbor of an M_i vertex in A or B belongs to A_i or B_i, respectively, since all other profiles share a root with it. This also accounts for any original root vertices by their profiles.

Suppose ell+q<=1/500. Every template vertex has positive weight by minimality. The [weight-stationarity law](BOUNDED-CODEGREE-TEMPLATES.md) says that at every vertex the expected monochromatic neighboring mass in optimal cuts is 2 beta >2/25. Flipping a vertex x of M_i to its cheaper side for just its A_i and B_i attachments costs at most min(d_(A_i)(x),d_(B_i)(x)) on them; all its other incident mass is at most ell+q. Thus for every x in M_i,

    min(d_(A_i)(x),d_(B_i)(x)) >= h,   h=39/500.

For each i let D_i be the maximum of this smaller attachment over M_i, and let D=max_i D_i, at index 1 after relabeling. The masses of A_1,B_1 are both at least D; the four endpoint masses for indices 2,3 are at least h. Moreover the endpoint neighborhoods of a vertex realizing D_i form a missing rectangle in A_i by B_i of product mass at least D_i².

## Two cuts

On the first cut keep all of A and B on opposite sides, and place each mixed vertex on its cheaper attachment side. Charge all edges inside M in the worst case, at most q/2 by summing the degrees within M. Random fair placement of L adds at most ell/2. With C the total mass of M, the comparison gives beta <= DC+(ell+q)/2. Therefore DC>b=39/1000. The spare mass after paying the lower bounds on both active shores is at most

    S = 1-2D-4h-C < 86/125 - 2D - b/D < 13/100.

The last step is AM–GM. S is nonnegative because the named masses occur disjointly in the support.

For the second cut put all of A_1 and B_1 on one side, all four classes of indices 2 and 3 on the other side, and each M_i opposite its two attachment classes. Let T be the combined mass of A_* and B_*, and let R_1,R_23 be the endpoint excesses above D,D at index 1 and above h at indices 2,3. Put R=R_1+R_23, so T+R<=S.

Inside index 1 the total available A_1–B_1 mass is their mass product minus the missing rectangle of mass at least D². This is at most D R_1+R_1²/4. Between the four endpoint classes of indices 2 and 3, the total possible mass is the product of the combined A- and B-shores, minus at least 2h² for the two disjoint missing rectangles. This is at most 2h²+2hR_23+R_23²/4. All mixed attachments cross.

Place A_* and B_* opposite and choose their relative orientation to the other classes fairly. Each indexed shore has mass at most D+2h+R, so this adds at most T(D+2h+R)/2. Finally charge the inside-M and L edges by (ell+q)/2 as before. Combining, using (D+2h)/2 <= max(D,2h) and R²/4+TR/2 <= S²/4, gives

    beta <= 2h² + max(D,2h) S + S²/4 + 1/1000.

Now 2h S < .02028, while D S <= (86/125)D-2D²-b <= (86/125)²/8-b = .020168. Consequently the displayed cut costs at most .012168+.02028+.004225+.001=.037673<1/25. This is a contradiction.

The proof uses all three mixed types from maximal triangle-freeness and does not claim that an arbitrary unsaturated template with one or two mixed types is handled. The remaining question is whether a least-support saturated counterexample can force substantial deviations at every six-cycle rather than just at some.
