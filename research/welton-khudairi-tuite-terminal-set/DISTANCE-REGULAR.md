# Terminal sets in distance-regular and rank-metric graphs

**Partial result for the [Welton–Khudairi–Tuite terminal-set conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/869).** Every Delsarte clique in a distance-regular graph is terminal. All finite alternating-forms graphs, including the odd-dimensional family, have terminal sets. The same is true of the symmetric rank-two graphs over odd fields. The arguments work at arbitrary diameter.

A set is terminal if it is in general position and each vertex outside is the endpoint of a geodesic containing two vertices of the set. We use the following immediate observation: if a vertex has nonconstant distances to a clique, two of those distances differ by exactly one, and the corresponding clique edge witnesses terminality for that vertex.

## Delsarte cliques

Let \(G\) be distance-regular of valency \(k>0\), diameter \(D\), and least eigenvalue \(\tau<0\). The orthogonal projector \(E_\tau\) onto this eigenspace is a polynomial in the adjacency matrix. Its entries depend only on distance; write them as \(e_0u_i\) in distance \(i\), with \(e_0>0\) and \(u_0=1\). The normalized distance coefficients satisfy \(u_1=\tau/k\) and the usual three-term recurrence
\[
c_i u_{i-1}+a_i u_i+b_i u_{i+1}=\tau u_i.
\]
Every coefficient \(u_i\) is nonzero. For clarity, the tridiagonal matrix \(L\) of the recurrence is the equitable quotient for the distance partition around one vertex, so its eigenvalues are graph eigenvalues. It contains \(\tau\), by the stated nonzero eigenvector, so \(\tau\) is its least eigenvalue. Conjugate \(L\) by \(\operatorname{diag}((-1)^i)\), negate it, and add a large scalar multiple of the identity. The resulting irreducible nonnegative matrix has Perron vector \(((-1)^i u_i)_i\), up to scale; its entries are strictly positive because \(u_0=1\).

For a clique \(C\) of size \(c\) one has
\[
\|E_\tau\mathbf1_C\|^2=e_0c\bigl(1+(c-1)\tau/k\bigr).
\]
Thus at the Delsarte size \(c=1-k/\tau\) the projector annihilates \(\mathbf1_C\). No \(x\notin C\) can be equidistant at distance \(i\) from \(C\), since the \(x\)-coordinate of \(E_\tau\mathbf1_C\) would be \(e_0cu_i\ne0\). Hence \(C\) is terminal. The spectral facts and clique bound are classical; see [Brouwer–Cohen–Neumaier](https://aeb.win.tue.nl/drg/index.html). The endpoint-witness conclusion follows directly from them.

### Explicit elementary cliques

- **Johnson graphs.** In \(J(v,k)\) assume \(2k\le v\) by complementation. Fix \(A\) of size \(k-1\); all sets \(A+e\), \(e\notin A\), form a clique. The distance from \(X\) to \(A+e\) is \(k-|X\cap A|-\mathbf1_{e\in X}\). Every \(k\)-set \(X\) contains at least one and omits at least one element outside \(A\); hence the distances vary.
- **Grassmann graphs.** In the graph of \(k\)-subspaces of a \(v\)-dimensional space, assume \(2k\le v\) by the annihilator duality. Fix a \((k-1)\)-space \(A\), and take the clique of \(k\)-spaces \(Y\) containing \(A\). Such \(Y\) correspond to quotient lines in \(V/A\). The dimension of \(X\cap Y\) exceeds \(\dim(X\cap A)\) by one exactly when the quotient line lies in \((X+A)/A\). The latter is nonzero and proper, as its dimension is between \(1\) and \(k\), while \(\dim V/A\ge k+1\). The distance is \(k-\dim(X\cap Y)\), so it varies. This distance formula follows by exchanging one dimension at a time while increasing the intersection.
- **Classical dual polar graphs.** Vertices are maximal totally singular or isotropic \(k\)-spaces, with adjacency given by intersection dimension \(k-1\). Fix a totally singular \((k-1)\)-space \(A\) contained in at least two vertices, and take the clique of all maximal extensions. For a vertex \(X\) write \(w=\dim(X\cap A)\). Maximality gives \(A\cap X^\perp=A\cap X\), since a vector of \(A\) orthogonal to \(X\) could otherwise enlarge \(X\). The pairing of \(A\) and \(X\) therefore has rank \(k-1-w\), and \(\dim(X\cap A^\perp)=w+1\). The image of \(X\cap A^\perp\) in \(A^\perp/A\) is exactly one singular quotient line. Precisely the clique extension associated with this line intersects \(X\) in dimension \(w+1\); all the others give \(w\). Again the distance is codimension of intersection. To see the upper bound in that formula, for distinct \(X,Y\) take \(y\in Y\setminus X\); \(X\cap y^\perp\) is a hyperplane containing \(X\cap Y\), and adjoining \(y\) gives an adjacent vertex with larger intersection with \(Y\). The reverse bound is immediate. A one-vertex graph is trivial.
- **Bilinear forms graphs.** Use linear maps \(V\to U\), with \(d=\dim V\le\dim U\) by transpose duality. The graph distance is rank of difference, since rank is subadditive and a rank-\(r\) matrix is a sum of \(r\) rank-one matrices. Choose a hyperplane \(H\subset V\); all maps with zero restriction to \(H\) form a clique. For any \(X\) all differences to this clique restrict to \(X|_H\). The value on a fixed complement vector can be chosen arbitrarily. It can lie in \(\operatorname{im}(X|_H)\) or outside, since \(\dim\operatorname{im}(X|_H)\le d-1<\dim U\). The rank differs by one in the two cases.

## A diametral-fiber lemma

Suppose a finite graph of diameter \(D\ge2\) has a partition into cliques such that for every distinct pair \(C,C'\) of fibers, either every cross distance equals \(D\), or **each** vertex in \(C'\) has nonconstant distances to \(C\) and conversely. Choose an inclusion-maximal family of fibers whose pairwise cross distances are all \(D\). Their union is in general position: a triple either lies in one clique, has distances \(1,D,D\), or has distances \(D,D,D\). Any unselected fiber has a selected partner of the second kind by maximality, so each of its vertices has an endpoint witness from that partner. This proves terminality. For \(D\le1\), use the whole vertex set.

### Alternating forms graphs at all ranks

Let \(V\) have dimension \(d\) over a finite field of any characteristic. Vertices are alternating forms, with adjacency when their difference has rank two. The distance is half the rank of the difference: an alternating form has even rank and is a sum of that many half-rank-two blocks under the standard symplectic block decomposition. The diameter is \(\lfloor d/2\rfloor\).

Fix a hyperplane \(H\) and partition the forms by restriction to \(H\). Every fiber is a clique because a nonzero difference vanishing on \(H\times H\) has rank two. For two fibers let \(Q\) be the difference of their restrictions and let \(K\) be its radical. Fix one vertex in either fiber; while varying a vertex in the other, the cross functional from a complement vector to \(H\) ranges over all of \(H^*\). Split \(H\) into the radical \(K\) and a nondegenerate complement. A change of the complement vector eliminates its pairing with the nondegenerate part. The residual form on the complement line plus \(K\) has rank zero or two according as the residual cross functional is zero or nonzero on \(K\).

If \(K\ne0\), both ranks occur, so every cross row in both directions varies. If \(K=0\), the rank is always \(d-1\); this happens only when \(d\) is odd, and gives constant distance equal to the diameter. Apply the fiber lemma. In particular for even \(d\) just one fiber suffices; in odd dimension choose a maximal family of restrictions with pairwise nonsingular differences. This avoids assuming that a single fiber is terminal in odd dimension.

### Symmetric forms with rank-two adjacency

Over a finite field of odd characteristic, use all symmetric forms with adjacency for nonzero differences of rank at most two. Congruence diagonalization shows the graph distance is \(\lceil\operatorname{rank}/2\rceil\) and the diameter is \(\lceil d/2\rceil\). Use the same fibers over a hyperplane \(H\); a nonzero difference vanishing on \(H\times H\) has rank at most two, so each is a clique.

For fixed restriction difference of rank \(r\), choose a complement to its radical and eliminate the cross functional on that complement as above. Varying the complementary diagonal entry gives ranks \(r\) and \(r+1\) with zero residual cross functional. If the radical is nonzero, use a cross functional nonzero there to get rank \(r+2\); the residual block has a nonsingular \(2\times2\) minor and all other directions in its radical. These values yield different graph distances if \(r\) is even, or if the radical is nontrivial. In the remaining case \(r=d-1\) is odd and the two possible ranks \(d-1,d\) give the same distance \(d/2\), the diameter. Thus the fiber lemma applies here too.

## Scope and references

The forms and polar metrics are standard; see the [distance-regular reference](https://homepages.cwi.nl/~aeb/math/bcn/) and [van Bon–Brouwer on the bilinear and dual polar graphs](https://ir.cwi.nl/pub/1536/1536D.pdf). The new construction in the odd alternating case is the maximal family of diametrally separated full restriction fibers. Searches in the [original terminal paper](https://oro.open.ac.uk/98050/9/98050final.pdf), [general-position survey](https://arxiv.org/abs/2501.19385), and literature on terminal sets in forms graphs and in finite polar geometry did not locate a published terminal-set statement for these families. We do not claim that the standard rank facts, Delsarte bounds, or the underlying cliques are new. The unrestricted existence conjecture remains open here.
