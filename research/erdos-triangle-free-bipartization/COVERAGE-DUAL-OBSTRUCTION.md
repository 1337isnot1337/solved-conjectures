# Erdős's triangle-free bipartization conjecture

## Collapse all unclipped coverage tests to one weighted-independence problem

A reduction for the open [Erdős #23](https://www.erdosproblems.com/23), using the [exact sampler](EXACT-INDEPENDENT-LAW-SAMPLER.md). This is not a resolution. Work on a mass-one weighted finite graph or graphon and use unordered masses. Let e be the edge mass in the unresolved density band, B the minimum missed mass, and put

    K = 25e−2,    lambda = K/2,    H = (1+K)/4.

Here K is positive throughout the middle band. Let g be the constant density 1 if there is a stationary optimum law. Alternatively, fix a particular optimum cut f with B>0 and take g=m_f/(2B). The latter is a probability density, and it needs no stationarity. Set alpha_h to the maximum independent-set mass for weight function h (or its supremum). Define

    D(g,lambda) = inf {alpha_(g+u) : u>=0 is bounded, integral u=lambda}.

If D(g,lambda)>=H, then B<=1/25. In particular, any counterexample with stationary optimum law must admit a bounded weight h>=1, with integral h=1+lambda, for which alpha_h<H. There is no required finite list of weight profiles. This is one weighted-independence test across **all** choices of the cutoff and mean, not a sufficient test at just one fixed coverage floor.

### Derivation

For a law with coverage p write c=ess inf p and m=integral g p. On an edge p(x)+p(y)<=1. If the graph has positive degree almost everywhere then c<=1/2 and p lies in [c,1−c]. The proof also applies after modifying p on an isolated set to p=1/2: isolated vertices can be included with any probability, without breaking independence. For c<1/2 take l=1/(1−2c) in the exact sampler. Averaging over the stationary cut law, or using the chosen optimum, gives

    B [2+(4m−1)/(1−2c)] <= e.                         (1)

If c=1/2, then p=1/2 on all nonisolated vertices and the sampler applies for arbitrarily large l. Its left coefficient is 2+l, forcing B=0. For c<1/2 the coefficient in (1) is at least 25e exactly when m+lambda c>=H.

The set P of attainable coverage functions is convex and compact in the weak L2 topology; see [the compactness argument](MIXED-INDEPENDENT-LAW-CUT.md#test-existence-of-the-law-by-weighted-independence). For every bounded p in P,

    integral g p + lambda ess inf p
       = inf_(u>=0 bounded, integral u=lambda) integral (g+u)p.

The infimum uses u concentrated on positive-measure sets where p is within an arbitrarily small distance of its essential infimum. For each such u, the functional on P is weakly continuous and affine. For each p, it is affine on the convex domain of u, with the norm topology of L2. The compact-convex minimax theorem interchanges sup and inf (only P needs compactness). By definition, the supremum over P for fixed u is alpha_(g+u). The supremum over P on the left is attained because it is an infimum of continuous functions, hence upper semicontinuous. Thus D(g,lambda) is exactly the best m+lambda c. The argument for an isolated set does not affect g in the fixed-cut case. In the stationary case B>0 itself implies positive degree almost everywhere. This proves the certificate and the claimed necessary weight witness.

### Which inequality this leaves open

It is not necessary to show the lower bound alpha_h>=H for all possible weighted triangle-free graphs with density in the band. Indeed the [Clebsch graph](https://iuuk.mff.cuni.cz/~samal/papers/clebsch/clebsch.pdf) is a counterexample to that stronger assertion, even though it satisfies the conjecture with room to spare. A viable structural proof must exploit properties of a global maximizer beyond density, or split off families where this sampler does not suffice, or improve the sampler itself.
