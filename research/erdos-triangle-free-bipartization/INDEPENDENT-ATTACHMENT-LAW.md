# An optimal-cut law tested by every independent attachment

A variational condition for the full [Erdős bipartization conjecture](https://www.erdosproblems.com/23), not limited to a fixed graph class. Write B for the unknown supremum of the minimum unordered monochromatic mass over all finite triangle-free supports with product vertex weights summing to one. The sharp conjecture is B=1/25.

## Near maximizers: a quantitative finite statement

For any finite weighted triangle-free graph G write beta for its minimum cut loss. For any 0<epsilon<1, there is a probability law on cuts of G of cost at most

    beta + epsilon/[2(1-epsilon)]

such that, simultaneously for **every** independent set I of G,

    E[min(mass(I on plus), mass(I on minus))]
      <= [B-(1-epsilon)^2 beta]/[epsilon(1-epsilon)].       (1)

In particular, if beta approaches B along a sequence and epsilon is the square root of B-beta, then the same law consists of asymptotically optimum cuts, and the right side is 2 beta+O(sqrt(B-beta)). If beta=B in a finite graph, take epsilon down to zero to get the exact statement below.

To prove (1), consider an arbitrary probability distribution p on the independent sets I of G. Extend G by adding one vertex x_I of weight epsilon*p(I) for each such set, adjacent exactly to the old vertices of I. The new vertices have no edges among themselves. Rescale all old vertex weights by 1-epsilon. The extension is triangle-free precisely because every attachment set is independent.

Given an old cut sigma, minimize the signs of the new vertices individually. The resulting loss in the extension is exactly

    (1-epsilon)^2 cost_G(sigma)
      +epsilon(1-epsilon) sum_I p(I) min(mass(I on plus),mass(I on minus)).

On an optimum old cut the new contribution is at most epsilon(1-epsilon)/2. Thus the extended minimum may be sought among the old cuts within epsilon/[2(1-epsilon)] of beta. The extension is still an allowed finite graph, so its minimum cannot exceed B. Using cost_G(sigma)>=beta, for every p there must be a cut from that restricted set with its p-weighted average attachment value at most the right side of (1). Finite zero-sum minimax now gives a **common** law on restricted cuts bounding each independent attachment simultaneously.

## Exact consequences at a finite global maximizer

If a finite weighted graph attains B, the cuts in (1) are optimum when epsilon is sufficiently small (the old cut set is finite). By compactness of the probability simplex, letting epsilon tend to zero gives a law such that

    E[min(mass(I on plus), mass(I on minus))] <= 2 B

for every independent I. For I=N(x), the minimum is exactly the monochromatic degree of x in an optimum cut, because flipping x alone cannot improve it. The weighted average of those degrees is 2B in every optimum cut. Hence each positive-weight vertex achieves **equality** with this same law:
    
    E[monochromatic degree of x]=2B for all x,
    E[abs(mass(I on plus)-mass(I on minus))] >= mass(I)-4B
        for every independent I.

The second row differs from stationarity merely under reweighting a fixed support. It holds for independent sets that are not neighborhoods, because one may change graph supports by adjoining new vertices. Its simultaneous quantifier is essential: choosing a cut separately for each new attachment does not give this conclusion.

For the balanced pentagon blow-up, the uniform law on its five minimum cuts realizes the bounds. Any independent set meets at most two nonadjacent classes. Its mass on the two signs can be split only in two of the five cuts, and the smaller attachment in those cuts is at most 1/5, so the expected minimum is at most 2/25. For a full neighborhood equality holds.

As one possible way to use the row, if an independent set contains a neighborhood N(x), the attachment cost cannot decrease on adding the remaining vertices. It has the same expectation since the neighborhood already attains 2B, so there is zero gain in almost every cut of the law. In any such cut where N(x) has strictly unequal sign masses, all further vertices of the independent set must be on its majority side. In a maximal triangle-free support the neighborhood is already maximal independent, so this specific application is vacuous; inequalities on other independent sets remain available.

No assumption is made that the full supremum is attained by a finite support. The quantitative near-maximizer statement is included to avoid that unjustified step. It and the exact finite corollary are necessary conditions only.


## Near-maximizing laws also have nearly constant expected monochromatic degree

Let gap=B-beta, delta=epsilon/[2(1-epsilon)], and set

    L = (gap/epsilon + beta*epsilon)/(1-epsilon),
    R = sqrt(8 e delta),

where e is the unordered total edge mass of G. With the law in (1), let m_sigma(x) be the monochromatic degree of x in the chosen cut. Then

    integral | E[m_sigma(x)] - 2 beta | d mass(x) <= 2L + 2R.     (2)

In particular this bound tends to zero when beta tends to B and epsilon is chosen to be sqrt(gap). The exact laws satisfying all attachments and the usual stationarity law can therefore be used jointly in limiting arguments, without assuming finite attainment.

For an individual cut of cost at most beta+delta, put g(x)=(2 m_sigma(x)-d(x))_+ and G=integral g. Independently flip each vertex with g(x)>0 with probability q. The expected improvement is at least qG-2q²e: the first term is the sum of the single-vertex improvements, and the correction for both endpoints flipping on an edge is bounded below by minus twice its mass times q². Taking q=G/(4e)<=1/2 when e>0 proves G²/(8e)<=delta, hence G<=R. For e=0 the conclusion is immediate.

The attachment value on N(x) is m_sigma(x)-g(x), whether or not the cut is exactly optimum. Its expected value f(x) is at most 2 beta+L by (1), and its weighted average is at least 2 beta-R because every chosen cut costs at least beta. Consequently the integral of |f(x)-2 beta| is at most 2L+R. Reintroducing g adds at most R, proving (2).

## An independent replacement inequality

For a finite global maximizer with the exact joint law, fix x and let S be any independent set disjoint from N(x). Delete N(x) intersect N(S) from N(x) and add S. This is an independent attachment, so its expected margin is at most the margin 2 B on N(x). In each optimum cut, x's own sign is on a minority side of the signed masses in its neighborhood; the difference between its neighborhood's larger and smaller sign masses is Delta_sigma(x)=d(x)-2 m_sigma(x). Adding the S mass on x's sign increases the smaller of the two masses by at least min(Delta_sigma(x), mass(S on x's sign)). Removing the conflicting neighbors costs at most their mass. Thus

    E[min(Delta_sigma(x), mass(S on the sign of x))]
        <= mass(N(x) intersect N(S)).                          (3)

This holds simultaneously for all roots and all independent replacements. When S is a single nonneighbor y, the right side is the common-neighbour mass, and the left is E[1_(sigma_y=sigma_x) min(Delta_sigma(x), weight(y))]. The inequality prices exchanges that do not preserve the original graph support. It has not been shown that these exchanges alone force the conjectured bound.


## Second-order template extension

There is a separate condition for a finite graph attaining the supremum. It can be tested by genuine new edges in an attachment layer, not only independent additions.

Let I_1,...,I_k be independent sets of G and let p_1,...,p_k be nonnegative weights summing to one. Suppose that over the old optimum cuts sigma the minimum of

    L_*(sigma) = sum_i p_i min(mass(I_i on plus), mass(I_i on minus))

is exactly 2B. Let H be any triangle-free graph on the attachment indices, with ij permitted only if I_i and I_j are disjoint. For every old optimum sigma with L_*(sigma)=2B, consider signs tau_i for H that individually minimize the loss of the attachment from I_i; either sign is permitted on a tie. Then **some** such pair sigma,tau makes H's monochromatic product edge mass, with vertex weights p_i, at most B.

Indeed, give the old vertices mass factor 1-epsilon, give vertex i of the new layer mass epsilon p_i, attach it to I_i, and put H on this layer. The resulting support is triangle-free. A triangle with one new vertex is prevented by independence of its attachment; a triangle with two new vertices is prevented by disjointness for H edges; triangles entirely in either layer are excluded by their hypotheses. For any pair of cuts its cost is exactly

    (1-epsilon)^2 cost_G(sigma)
      + epsilon(1-epsilon) L(sigma,tau)
      + epsilon² cost_H(tau),

where L is the actual attachment loss in original product units. There are finitely many cut pairs. For all sufficiently small positive epsilon, minimizing this expression first minimizes the old cost and then minimizes L among those pairs: any fixed positive gap in an earlier coefficient dominates the bounded later terms. The minimal earlier values are B and 2B by hypothesis. On these pairs the full cost reduces to

    B + epsilon² (cost_H(tau)-B).

It cannot exceed B at the extended optimum, so the claimed pair exists.

The first-order hypothesis is not empty: taking the old neighborhoods with their old vertex weights gives L_*(sigma)=2B for every old optimum cut. On a saturated support, disjoint neighborhoods of distinct vertices already force adjacency, so this obvious choice cannot insert a truly new edge on the replicated layer. Any use for the full conjecture needs alternative optimal attachments, or a quantitative near-optimal replacement. This also explains why making the layer separately triangle-free is not enough unless the attachment disjointness is checked.
