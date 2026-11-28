# Blocks and small separators

Partial results for [Erdős Problem 23](https://www.erdosproblems.com/23). The sharp weighted inequality is closed under joining graphs at cut vertices. A saturated least-support counterexample to the full conjecture must be 3-connected. This neither proves the conjecture for all 3-connected supports nor requires that a support stay saturated during an arbitrary block decomposition.

## Weighted closure under vertex gluing

Suppose graphs G_i share exactly one vertex v, have no other overlap, and have no edges between their vertex sets outside v. Assume each satisfies beta <= c N² for arbitrary nonnegative vertex weights, where beta is unordered minimum monochromatic product edge mass. Then their union satisfies the same inequality with the same c. In particular a graph satisfies it if each of its blocks satisfies it.

Let w be the mass of v, t_i the total mass of its i-th branch outside v, and s=sum_i t_i. Ignore zero-mass branches; if s=0 the result is immediate. In the i-th graph, rescale all non-v masses by s/t_i, leaving v at mass w. Each attachment edge to v increases in mass by s/t_i, and every internal edge by (s/t_i)² >= s/t_i. Thus the minimum cost in the rescaled graph is at least s/t_i times the original branch minimum. Its total vertex mass is s+w, so the original branch contributes at most (t_i/s)c(s+w)². The branch-optimal cuts can be aligned by reversing cuts as needed to give v the same sign. Summing yields the claim. Iterating along the block-cut tree gives the block version; disjoint components can also be combined, since the sum of their squared masses is at most the whole squared mass.

For example this gives the sharp bound for any triangle-free graph whose blocks individually map to triangle-free induced-P6-free templates, even if the whole graph is not induced-P6-free. The same argument transfers any fixed coefficient c, not just 1/25.

## Small separators of saturated templates

A saturated triangle-free graph has a common neighbor for every nonadjacent pair. Let S be a vertex separator. For x outside S call N(x) intersect S its profile. If x,y lie in two different components of G-S, their profiles must intersect: a common neighbor of x and y cannot be outside S. In particular every exterior profile is nonempty.

If an edge lies in each of two different components, take their endpoints x0,x1 and y0,y1. The profiles of x0,x1 are disjoint, and those of y0,y1 are disjoint, by triangle-freeness. But all four intersections between an x-profile and a y-profile are nonempty. These intersections are pairwise disjoint subsets of S, so |S| >= 4. Thus for |S| <= 3 there is at most one component containing an edge; the other components are singleton vertices whose degree is at most |S|.

For |S|=1 every exterior vertex sees the sole separator vertex, and the graph is bipartite. Suppose S={a,b}. If ab is an edge, all profiles are singletons. Their intersection rule forces every exterior vertex to see the same one of a,b: compare first with a vertex in another component, then with one in the first component. They are therefore independent, and the graph is bipartite. If ab is absent, the profiles are {a}, {b}, {a,b}. Map a and b to labels 0 and 3 of a pentagon, and the three profile classes to 1, 2, and 4, respectively. All edges to the separator respect the labels. The only possible edge outside it is between {a} and {b} profiles, which also respects the labels. The graph maps to a pentagon and satisfies the sharp weighted bound.

Therefore every saturated least-support counterexample is 3-connected. If it has a three-vertex separator, one component after deletion is a singleton of degree exactly three: smaller degree is already excluded by the degree-root result. The separator is then independent, since it is this vertex's entire neighborhood. The constraints from [the degree-three-root analysis](DEGREE-THREE-ROOT.md) apply. In particular, a saturated least-support counterexample of minimum ordinary degree at least four would have to be 4-connected.
