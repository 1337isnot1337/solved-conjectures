# Split-and-trim perturbations at an Erdős bipartization extremizer

A second-order test for [Erdős Problem 23](https://www.erdosproblems.com/23). Ordinary direct copies of neighborhoods cannot create new edges on a saturated triangle-free graphon. This version permits trimming old crossing edges to open disjoint attachments, while keeping the first-order error controlled. It applies to a global maximizer with finitely many optimum signs, and does not establish that every maximizer has this property.

## Statement

Let a zero-one triangle-free graphon W of mass one globally maximize the minimum unordered monochromatic mass B>0. Suppose it has finitely many optimum measurable sign cuts, up to null sets and overall sign. For a sign f set Delta_f(x)=-f(x)(Wf)(x), its one-vertex crossing margin. Use a measurable source set S, a measurable endpoint set U, a number a>0, and a kernel T on S by the full space, satisfying:

1. Every optimum sign f has Delta_f≥a on S∪U, almost everywhere.
2. T is nonnegative, T≤W on its domain, and T is supported on S by U. It removes only edges opposite in every optimum sign, meaning T(x,y)>0 implies f(x)f(y)=-1 under each such cut, almost everywhere.
3. For almost every source x, its trimmed mass integral T(x,y) dy is at most a/4.

Write R(x,y)=W(x,y)−T(x,y) on S by the old space. Let H be a symmetric triangle-free kernel on S by S with W|_(S times S)≤H≤1. It must satisfy the disjointness condition

    H(x,x') > 0  implies  integral R(x,y) R(x',y) dy = 0

almost everywhere. Then **some** optimum f of W cuts all the added kernel H−W|_(S times S), up to null sets. In other words it is impossible for each old optimum to leave positive monochromatic mass on the added edges.

In particular, if a positive-mass set of new edges can be placed between sources of the same optimum signature, and the guards and disjointness conditions above hold, W is not a global maximizer. An optimum signature is the finite vector of a vertex's signs in the old optimum cuts. Original edges inside the copied layer are permitted: they automatically have disjoint attachments by triangle-freeness. The full H must still be triangle-free, including triangles that use both old and new edges of that layer.

## High-margin disagreements cost linearly

An optimum sign f has nonnegative margin almost everywhere. This follows by optimizing over measurable relaxed cuts in [-1,1], whose infimum agrees with true signs. At a maximum with finitely many optimum signs, each relaxed optimum is itself a sign: the [rounding argument](GRAPHON-EXTREMIZERS.md) shows that its fractional region is independent, and on that region independently prescribed sign changes at an optimum preserve the cost. A fractional region of positive measure in a graphon probability space would therefore give infinitely many sign optima.

It follows by weak L² compactness and compactness of the W-operator that every sequence of near-optimum signs approaches the finite optimum set in L¹. Indeed a subsequence staying a fixed distance away has a weak limit which is optimum, hence a sign. The L² norms of both the sequence and the limit are one, so that weak convergence improves to strong convergence, a contradiction.

Write delta=C_W(g)−B for the unordered cost gap of a sign g, and let f be a nearest optimum. The fields Wg and Wf differ pointwise by at most 2 mass({g≠f}). For small enough delta, this bound is less than a/4. Whenever g differs from f on S∪U, the local gain density for flipping g is therefore at least a/2. The [linear local defect estimate](SATURATED-GRAPHON-EXTREMIZER.md) bounds the integral of positive local gain by delta/d_min, where d_min is the essential infimum of the original degree and is at least 4B. Consequently the measure of disagreement on S∪U is at most 2 delta/(a d_min). In particular, the unordered or directional monochromatic mass in T under (g,g) is O(delta): T was cut by f, and the two endpoints of any such changed edge lie in S∪U.

The same field bound shows that if a clone of x chooses its sign against g on the old layer, its strictly cheaper sign is f(x), with gap at least a/2. The original field margin was at least a, changing g from f shifts it by less than a/4, and the trim shifts it by at most a/4. This holds on all of S, including its exceptional O(delta) disagreement set.

## Exact expansion after splitting the source mass

For 0<epsilon<1, replace the original mass on S by a fraction 1−epsilon of itself, and put its removed epsilon part on a new copy of S. Old edges use W, new-to-old edges use R, and new-to-new edges use H. This graphon is triangle-free: a triangle with one new vertex would contradict triangle-freeness for W, one with two new vertices would violate disjointness, and the two unmixed cases hold by the assumptions. Total vertex mass is unchanged.

For a cut (g,tau) on the two layers, let m_K(s,t) be the directional integral of K over equal signs from its source and target space. Its form depends on the domain of K. Write C_K(s) for the unordered monochromatic cost on a symmetric square. The new loss is exactly

    C_W(g)
    + epsilon [m_R(tau,g)−m_(W|_(S times full))(g,g)]
    + epsilon² [C_(W|_(S times S))(g)
                 −m_(R|_(S times S))(tau,g)+C_H(tau)].     (1)

The linear subtraction counts the two incident corners at first order, and the positive old-old quadratic term restores their double count. For g sufficiently close to optimal and f chosen above, the bracket on the linear line is at least

    −K delta + (a/2) mass({x in S: tau(x) differs from f(x)}),

with a fixed K independent of g and tau. To see this, using g on the copied S would remove only the T mass monochromatic under (g,g), which is O(delta). Switching the copy from g to its cheaper sign f changes costs on only O(delta) source mass. Any subsequent departure from the cheaper f sign then pays at least a/2 per unit mass.

If every optimum f misses positive added mass, suppose for contradiction that (1) can be at most B for arbitrarily small epsilon, as global maximality requires. Even if one works with infima, cuts with cost at most B+epsilon³ suffice. Boundedness of all coefficients first forces delta=O(epsilon), making the linear estimate applicable. That estimate and boundedness of the quadratic coefficient sharpen the conclusion to delta=O(epsilon²) and mass({tau≠f} in S)=O(epsilon). Pass to a sequence with the same nearest f, which is possible because there are finitely many optima. Then g→f in L¹ and tau→f|_S in L¹. The quadratic bracket tends to

    C_(W|_(S times S))(f) − 2 C_(W|_(S times S))(f) + C_H(f)
      = C_(H−W|_(S times S))(f) > 0,

since T was always cut by f. The combined zero and first order excess is bounded below by (1−K epsilon) delta≥0 for small epsilon. The positive quadratic term contradicts cost at most B+epsilon³. This proves the test.

## Finite exact variant

The same expansion works for a finite global maximizer on a weighted support, even though a finite probability space itself has atoms. Split any chosen source vertex into copies with proportional masses. Assume the trimmed old edges are cut in all old optima, the post-trim preferred clone signs are strict and agree with the old source signs, and H adds only edges to the old source-induced graph while meeting the triangle conditions above. The strictly positive cost gap to any non-optimal old sign assignment immediately takes the place of the graphon compactness and margin argument. The leading optimum extension has zero linear discrepancy and exactly the displayed additional quadratic cost. Thus there must be an old optimum cutting all additions.

This supplies a way to try second-order perturbations with nontrivial attachments, distinct from [the independent-attachment law](INDEPENDENT-ATTACHMENT-LAW.md), whose copied full neighborhoods cannot introduce any new edge on a saturated support. Finding guarded trims that force some missed addition for every old optimum remains open, as does removing the finite-optimum hypothesis in the graphon statement.
