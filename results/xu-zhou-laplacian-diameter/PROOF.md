# Xu–Zhou’s Laplacian diameter conjecture

**Result.** Xu–Zhou’s Conjecture 1.1 holds for every admissible integer parameter \(c\). No computation is used.

**Source and scope.** Leyou Xu and Bo Zhou, [*Diameter vs. Laplacian Eigenvalue Distribution*](https://journals.uwyo.edu/index.php/ela/article/download/8757/6821), *Electronic Journal of Linear Algebra* **40** (2024), 774–787, [DOI 10.13001/ela.2024.8757](https://doi.org/10.13001/ela.2024.8757), Conjecture 1.1 on p. 775; equivalently [arXiv:2401.03777v2](https://arxiv.org/abs/2401.03777v2), Conjecture 5.1. For a connected simple graph \(G\) on \(n\) vertices of diameter \(d\ge2\), write \(m_G[a,b]\) for the number of Laplacian eigenvalues in the closed interval \([a,b]\), with multiplicity. The conjecture says that, whenever \(0\le c\le d-2\) and \(\max\{2,c\}\le d\le n-2-c\),
\[
  m_G[n-d+2-c,n]\le n-d+c.
\]
The earlier Ahanjideh–Akbari–Fakharan–Trevisan conjecture was the \(c=0\) assertion and was already [proved by Xu–Zhou in 2023](https://doi.org/10.1016/j.laa.2023.08.013). Additional parameter slices were already known, including the main theorems of the 2024 paper. No general resolution of its Conjecture 1.1 was found in the searches described in [PRIORITY.md](PRIORITY.md).

## 1. A spectral lemma for chains of cliques

Let \(H\) have nonempty layers of sizes \(a_1,\ldots,a_\ell\), with every edge within layers and between consecutive layers, and no other edges. Put \(a_0=a_{\ell+1}=0\) and \(t=\sum_{i=1}^{\ell}(a_i-1)\). We prove that \(H\) has **at most \(2t\) Laplacian eigenvalues at least \(4\)**.

The subspace of vectors constant on each layer is invariant under the Laplacian; its invariant orthogonal complement has dimension \(t\). The latter therefore contributes at most \(t\) eigenvalues to the count. For a vector whose value on layer \(i\) is \(x_i\), the shifted quadratic form on the former is
\[
  \sum_{i=1}^{\ell-1} a_i a_{i+1}(x_i-x_{i+1})^2
      -4\sum_{i=1}^{\ell}a_i x_i^2.
\]
Under the invertible real substitution \(x_i=(-1)^i z_i/a_i\), this is the quadratic form of a symmetric tridiagonal matrix \(Q\) with adjacent off-diagonal entries \(+1\) and diagonal
\[
  Q_{ii}=\frac{a_{i-1}+a_{i+1}-4}{a_i}.
\]
By invariance of inertia under congruence, counting eigenvalues at least \(4\) on the layer-constant subspace amounts to counting nonnegative eigenvalues of \(Q\), including zero.

Mark indices as follows:

1. Every index of size \(2\) marks itself.
2. Every index of size at least \(3\) marks each present adjacent index.
3. Also mark any still unmarked index of size at least \(3\) with two neighbors of size \(2\).

The first two rules spend at most \(t\) marks with multiplicity: a layer of size \(2\) spends one, and one of size \(a_i\ge3\) spends at most two, no more than \(a_i-1\). To account for rule 3, each added index has a left neighbor marked twice by the first two rules (by itself and by that index). These left neighbors are distinct for distinct added indices. Thus the set \(S\) of marked indices has \(|S|\le t\).

Let \(W\) be the coordinate subspace \(z_i=0\) for \(i\in S\). We show \(Q\) is nonpositive on \(W\). Any remaining layer of size at least \(3\) is isolated in the unmarked index path, since it marked its neighbors. It has no adjacent layer of size at least \(3\), which would have marked it, or two adjacent layers of size \(2\), which would have marked it by rule 3. Its diagonal entry is therefore strictly negative. All other remaining layers have size one. If a size-one index remains, every adjacent deleted layer has size at most two, and every adjacent remaining layer has size one. Thus its diagonal \(a_{i-1}+a_{i+1}-4\) is at most minus its degree in the unmarked index path: each surviving neighbor contributes \(-1\) in the expression \((a_{i-1}-2)+(a_{i+1}-2)\), whereas a deleted or absent neighbor contributes at most zero. Each block of consecutive remaining size-one layers is therefore bounded above in quadratic forms by minus the ordinary path Laplacian on that block. This proves nonpositivity on \(W\).

We must also exclude a zero eigenvalue from using up an extra dimension. If index \(1\) is unmarked, the leftmost consecutive unmarked block is negative definite: it is either an isolated large layer with negative diagonal, or a size-one path block with at least one strict diagonal inequality at index \(1\), from \(a_0=0\). The latter strict inequality makes the quadratic form negative on every nonzero constant vector in the kernel of that block’s path Laplacian. A global kernel vector of \(Q\) lying in \(W\) has zero restriction to this first block, because the next index, if present, is marked and hence zero. If instead index \(1\) is marked, this kernel vector already has \(z_1=0\). In either case \(z_1=0\). The first-row equation and successive tridiagonal equations now imply \(z_2=z_3=\cdots=z_\ell=0\). Thus \(W\cap\ker Q=\{0\}\).

The nonnegative spectral subspace of \(Q\) intersects \(W\) trivially: a vector of the intersection must have quadratic form zero by nonpositivity on \(W\), so within the nonnegative spectral subspace it belongs to \(\ker Q\). Hence that spectral subspace has dimension at most \(\operatorname{codim} W=|S|\le t\). Together with the orthogonal complement’s contribution of at most \(t\), this proves the lemma.

## 2. Apply the lemma to the diameter problem

Choose endpoints at distance \(d\) and take the distance layers from one endpoint; all \(d+1\) layers are nonempty and no edge goes between nonconsecutive layers. Complete within layers and between consecutive layers to obtain a clique-chain \(\widehat G\). This only increases the Laplacian in the positive semidefinite order, because each added edge contributes \((e_u-e_v)(e_u-e_v)^T\). In particular any subspace with a strict upper Rayleigh bound for \(\widehat G\) has the same bound for \(G\).

The surplus of \(\widehat G\) over one vertex per layer is \(n-d-1\ge c+1\). Keep one representative in each layer and \(c+1\) more vertices, obtaining an induced clique-chain \(H\) on \(n'=d+c+2\) vertices with surplus \(c+1\). By the lemma, at least \(n'-2(c+1)=d-c\) of its eigenvalues are strictly below \(4\).

Take their spectral subspace and extend each vector by zero outside \(H\). For any nonzero vector \(z\) in that extended subspace, the extra Laplacian energy in \(\widehat G\) is a sum of squared coordinates of \(z\), one for each edge to a deleted vertex. There are at most \(n-n'\) such edges incident to each retained vertex. Consequently
\[
  z^T L(G)z\le z^T L(\widehat G)z
     <(4+n-n')\|z\|_2^2=(n-d+2-c)\|z\|_2^2.
\]
The min–max principle gives at least \(d-c\) eigenvalues of \(L(G)\) strictly below \(n-d+2-c\). At most \(n-d+c\) can belong to the conjectured closed interval, as claimed.

## 3. A sharp infinite family

The factor \(2t\) in the clique-chain lemma is exact. Take \(\ell\ge4t+1\), with layer size two at positions \(3,7,\ldots,4t-1\) and size one at all other positions. Each size-two layer has one internal zero-sum eigenvector with eigenvalue \(4\): its two vertices have their one common-layer edge and one neighbor in each of the adjacent singleton layers. The resulting \(t\) eigenvectors have disjoint supports and are orthogonal to the layer-constant subspace.

For a size-two layer at position \(i\), the three indices \(i-1,i,i+1\) have diagonal entries all equal to \(-1\) in \(Q\). The vector with coordinates \((1,\sqrt2,1)\) on that triple is a positive direction, since the triple's matrix takes it to \((\sqrt2-1)\) times itself. Distinct such triples are separated by an intervening index, so the associated vectors are pairwise uncoupled in the tridiagonal form. They span a \(t\)-dimensional positive subspace. The lemma gives exactly \(2t\) eigenvalues at least \(4\) for these graphs.

Set \(d=\ell-1\), \(c=t-1\), and \(n=\ell+t=d+c+2\). The clique-chain has diameter \(d\), and the conjecture in this case asks for at most \(2t\) eigenvalues at least \(4\). Thus it is attained for an infinite family with unbounded \(c\).
