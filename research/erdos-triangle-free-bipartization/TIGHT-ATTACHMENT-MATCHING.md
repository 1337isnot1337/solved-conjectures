# Matching constraints between tight independent attachments

A local structural consequence for [Erdős Problem 23](https://www.erdosproblems.com/23). Work in a zero-one triangle-free maximizing graphon, or a weighted graph with the [common optimum law](SATURATED-GRAPHON-EXTREMIZER.md). Normalize vertex mass to one, and write B for the optimum unordered missed mass. Call an independent set A tight if its expected smaller sign mass is 2B. Almost every full neighborhood is tight. A [guarded trimmed neighborhood](ONE-SIDED-TRIM-OBSTRUCTION.md) is also tight.

For two disjoint tight independent sets A,D, every vertex cover of their cross graph has mass at least

    2B + E[1_(opposite minority signs) min(G_A,G_D)],        (1)

where G_A,G_D are the absolute imbalances between their two sign masses in the sampled optimum. On a tie the choice of minority sign is irrelevant. In particular there is a fractional matching of size arbitrarily close to this lower bound (and at least this size for finite supports), even though the cross graph can be irregular.

For almost every original edge xy its two neighborhoods are disjoint and their minority signs can be taken to be f(x),f(y), respectively. Thus (1) gives a matching and vertex-cover condition on the middle of the rooted three-edge paths from x to y:

    cover(N(x),N(y)) >= 2B + E[1_(f(x)≠f(y)) min(Delta_f(x),Delta_f(y))],

with Delta_f(x)=d_W(x)−2 times the monochromatic degree at x. The same statement holds for two disjoint guarded trimmed rows, with their actual residual margins. This is not an upper bound on the bipartization problem by itself.

## Proof

For an independent set I write F_I for the smaller of its two sign masses. Given a fixed cut, the smaller sign mass in A union D is exactly F_A+F_D when their minority signs agree, and otherwise equals

    F_A + F_D + min(G_A,G_D).

If C is a measurable vertex cover of the cross graph, then (A union D) minus C is independent. Deleting C decreases each sign mass by at most mass(C), so its smaller sign mass is at least the displayed quantity less mass(C). Its expected smaller mass is at most 2B by the common attachment law, whereas E F_A+E F_D=4B. This gives (1).

The matching implication uses [Hladký–Hu–Piguet's graphon matching/cover duality](https://arxiv.org/abs/1606.03113), in its K2 case. To see that a fractional cover pays at least the bound, give it values a(x) in [0,1] with a(x)+a(y)≥1 on almost every cross edge. For a uniform threshold t, choose x in A when a(x)≥t, and y in D when a(y)≥1−t. For almost every t this is a vertex cover, because uncovered endpoints would have a(x)+a(y)<1. Its expected mass is the fractional cover cost. Therefore the infimum of fractional cover cost also has the bound (1); duality gives the supremum of matching mass. The same threshold proof and linear programming duality apply to vertex product weights on a finite support, with capacity equal to vertex mass on each vertex rather than to the edge products. No attainment of the graphon supremum is asserted.

More generally, for finitely many pairwise disjoint tight independent sets A_1,...,A_k, cover all edges within their union, retaining an independent set. Define for a fixed cut G_+ and G_- to be the sums of their sign imbalances over the sets whose majority signs are plus or minus, respectively. The combined smaller mass is then sum_i F_(A_i)+min(G_+,G_-). Consequently any such cover has mass at least

    2B(k−1) + E min(G_+,G_-).

There is no multiway fractional matching equality asserted for this last (generally nonbipartite) case.
