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
