# A saturated graphon extremizer with a common independent-attachment law

An all-order reformulation for [Erdős Problem 23](https://www.erdosproblems.com/23). It does not assume a finite graph attains the supremum. Let B denote the supremum of the minimum unordered monochromatic product mass over finite weighted triangle-free graphs of total mass one.

**Conclusion.** There is a triangle-free zero-one graphon W attaining B such that almost every nonedge has positive common-neighbor mass. Its degree lies in [4B,1/2] almost everywhere. There is a single law on relaxed optimal cuts such that every measurable independent set I satisfies

    E min(integral_I (1+f)/2, integral_I (1-f)/2) <= 2B,

and the expected monochromatic degree of almost every vertex is exactly 2B. Here a relaxed cut is a function f with values in [-1,1]. A relaxed optimum has the same objective as an actual cut, and one can also choose the common law on actual signs, as explained below.

## Attainment and measurable saturation

By graphon compactness and continuity in cut distance, the class with triangle density zero is compact, and both the edge density and the minimum monochromatic mass are continuous on it. The graphon optimum is the finite supremum B by sampling approximation. These are standard dense graph limit facts; for the sampling step see also [Bender–Krauthgamer, Theorem 2.1](https://arxiv.org/html/2611.03205v1#S2) and use rounded finite samples. Pick an extremizer of largest edge density among all maximizers of B. Replacing every positive kernel value by one preserves triangle-freeness and can only raise both objectives, so this choice is zero-one almost everywhere.

There is no positive-measure set of vertices of zero degree. Otherwise restrict to the nonisolated vertices and renormalize their total mass to one: the deletion cost scales up by the reciprocal square of this mass, contradicting B>0. For almost every root x, N(x) is a measurable independent set by the triangle-free integral. A countable collection of such neighborhoods covers almost all vertices: draw independent uniform roots, and for each positive-degree vertex the probability of missing every drawn neighborhood is zero. Fubini gives a realization with the desired covering property. Removing overlaps by taking the first covering neighborhood gives a countable measurable partition into independent sets, up to a null set.

If zero-codegree missing pairs had positive measure, some product of two disjoint measurable independent sets U,V would contain a positive measure of them. Indeed use the countable partition; if the mass is within one class, split it into two parts using a dyadic threshold that separates a positive mass of distinct pairs. Add just those pairs between U and V as edges. One added edge cannot complete a triangle with two old edges, because each has old codegree zero. Two added edges in a triangle would force the remaining edge within U or within V; there were no old edges there and none was added. The new graphon is still triangle-free and cannot have lower minimum cost, while its edge density strictly increased. This contradicts the maximizing choice and proves saturation almost everywhere.

## Compact cuts and a simultaneous law

On the real L² space of the graphon, let K be its unit cube |f|<=1, with the weak topology. It is compact metrizable. The objective

    C_W(f) = (1/4) integral_(x,y) W(x,y) (1+f(x)f(y))

is weakly continuous: the integral operator with kernel W is compact, and its quadratic form is weakly continuous on bounded sets. Its minimum equals that over measurable signs in the infimum sense. In fact any f is the weak limit of signs with the same integrals over each cell of a successively finer dyadic partition; approximation by step functions checks the weak convergence. Thus the compact minimizer set in K is nonempty and has value B.

For a measurable independent I, write F_I(f) for the smaller of its two fractional sign masses. This is also weakly continuous. Fix any finite list I_1,...,I_k and any probability vector p. Add new independent atom classes of masses epsilon*p_i, attaching class i to all of I_i, and rescale W to mass 1-epsilon. The construction is triangle-free, so its optimum is at most B. Optimizing the new signs separately yields exactly

    (1-epsilon)² C_W(f) + epsilon(1-epsilon) sum_i p_i F_(I_i)(f).

Since the second term is between zero and epsilon(1-epsilon)/2, candidates for its minimum can be restricted to the compact set C_W(f)<=B+epsilon/[2(1-epsilon)]. As in the [finite law](INDEPENDENT-ATTACHMENT-LAW.md), the minimum of the displayed p-weighted attachment average on this set is at most 2B+B epsilon/(1-epsilon). Finite-dimensional minimax between p and probability laws on that compact set supplies one law satisfying each of the k inequalities. Let epsilon decrease to zero and use compactness of probability measures on K to obtain a law on optimum cuts for the finite list. The resulting closed constraints on the laws have the finite intersection property. Therefore one law on optimum cuts works simultaneously for all measurable independent I.

For any relaxed optimum f, its first variation against a general h in K gives <h-f,Wf>>=0. Choosing h=-sign(Wf) shows f(x)(Wf)(x)=-|(Wf)(x)| almost everywhere. Hence the monochromatic degree at x in the relaxed sign law,

    m_f(x) = (d(x)+f(x)(Wf)(x))/2,

equals F_(N(x))(f) almost everywhere for this zero-one kernel. The joint law bounds its mean by 2B, while its integral for each optimum f is 2B by the cut objective. Thus its mean equals 2B almost everywhere. For the interchange of this equality with the law one may choose jointly measurable representatives using dyadic conditional averages and their pointwise limits; the functions are bounded, so Fubini applies.

In particular d(x)>=4B almost everywhere since F_(N(x))<=d(x)/2. For any independent I of mass i, decompose the expected monochromatic edge mass over I, its complement, and the boundary. The degree identity yields expected monochromatic mass in the complement equal to B(1-2i), so i<=1/2. Taking I=N(x) gives d(x)<=1/2 almost everywhere.

## If actual signs are needed

Use the countable partition of the graphon into independent sets from the saturation proof. On one such set, the cost varies affinely with f, since its internal kernel is zero. At an optimum, wherever |f|<1 the current field Wf is zero almost everywhere by the first-order condition. Therefore replacing the values on that independent set by signs with conditional mean equal to f (using one independent uniform random threshold) preserves the cost exactly and preserves previous sets' signs. Do this in succession over the countable partition. The functions converge in L² to a sign function because the modified sets increase to full measure, so continuity of the cost gives an optimum sign in each realization. Each vertex was rounded at most once, and thus its conditional mean given the initial f equals that initial value. The functions F_I are concave in the two integrals defining them, so Jensen's inequality shows that this rounding does not increase any expected F_I. The same common law can consequently be made a law of actual optimum signs.

This gives exact stationary and independent-attachment constraints on one maximizer. It does not prove finite-step structure, nor justify a second-order finite-gap argument when the optimum cut set may have arbitrarily close competitors.


## A linear defect bound for near-optimum cuts

The independent neighborhoods bound the local flip defect **linearly** in the objective gap once weighted degrees are bounded below. This does not require finite chromatic number or a least-positive gap between cuts.

For any relaxed cut f define h(x)=|(Wf)(x)|+f(x)(Wf)(x), a nonnegative function. Put delta=C_W(f)-B. If I is independent, replace f on I by -sign(Wf). There is no quadratic term inside I, so this decreases the cost by exactly (1/2) integral_I h. Therefore integral_I h<=2 delta. Taking I=N(x) and integrating over the root gives

    integral d(x) h(x) <= 2 delta,
    integral h <= 2 delta / d_min,   d_min=ess inf d >= 4B.

For an actual sign cut, h/2 is exactly its positive single-vertex flip gain density. The same argument works on a finite fixed weighted support with positive minimum degree, with B replaced by its own optimum.

The average payoff of the original neighborhood attachment distribution is L_N(f)=(1/2) integral(d-|Wf|). Hence L_N(f)=2 C_W(f)-(1/2) integral h, and

    L_N(f) >= 2B - (1/d_min - 2) delta.                        (3)

Thus this distribution's attachment deficit is linear in the old cut's gap, even for a graphon. This controls one subtlety behind the [second-order layer argument](INDEPENDENT-ATTACHMENT-LAW.md), which cannot use finite gaps here. More generally suppose a test layer has an attachment average L_*(f)>=2B-K delta for all f and attains 2B on some optimum. Then the old and attachment terms in its full cost minus B have sum at least (1-epsilon)(1-(K+1)epsilon) delta. Compactness forces extended optimizers, as epsilon tends to zero, to approach old optimizers with L_*=2B. If new-layer cost is uniformly greater than B on that tight set, it remains so along the extended optimizers, contradicting maximality. In this argument the attachment layer can be finite, with compact and continuous cost in its finite sign variables. The inequality (3) supplies the needed error bound for the original neighborhood distribution, but those old neighborhoods cannot add genuinely new edges on a saturated graphon. A nontrivial replacement distribution remains to be found.


## Pentagon coverage after ignoring false-twin pairs

The measurable saturation also transfers a version of the [finite pentagon-covered reduction](PENTAGON-COVERED-SUPPORT.md). Identify false twins by equality of their neighborhood rows in L¹; this is a measurable relation. For almost every nonedge x,y, either they are false twins or they are both in pentagons with positive conditional product density.

In fact, if the edge mass between N(x) and N(y) is zero, almost every z in N(x) minus N(y) is a nonneighbor of y. Saturation would give that pair a positive common-neighbor mass, and hence z a positive degree into N(y). By Fubini this contradicts the zero link mass unless N(x) minus N(y) is null. The reverse difference is similarly null. Thus distinct rows of a nonedge give a positive mass of three-edge paths between its endpoints. Saturation also gives a positive mass of common neighbors. Every choice of such a path and such a common neighbor completes an induced pentagon, up to null sets, because every potential extra chord would make a triangle. This works for almost every prescribed two-edge path with non-twin endpoints, not merely for some common neighbor.

In addition almost every **edge** is in pentagons with positive conditional density. For this, no vertex of positive-measure support can have its neighborhood contained in a single false-twin class, outside a null set. The positive-measure twin classes are countable. Any such class T is independent, since otherwise the common row gives triangles, and adjacency from an exterior vertex to T is almost everywhere constant on T by equality of the rows and symmetry. For a fixed T, let L be the measurable set of vertices having N(y)=T up to null sets. It is independent and disjoint from T. If L had positive mass, remove it. For any cut of the remainder, one can first put T on a single better sign (its vertices still share the same external neighborhood, and no edges lie inside T), then put all of L opposite T. Thus removal does not change the unnormalized minimum deletion cost. Renormalizing the smaller graphon raises it, contrary to maximum B. Each such L is therefore null. A measure-zero twin class cannot contain the positive-degree neighborhood of a vertex. Now for almost every adjacent x,y there is positive mass of z in N(y) not sharing x's row, giving the previous pentagon completion of the path x-y-z. These are positivity statements; no uniform lower bound on the rooted completion densities is implied.
