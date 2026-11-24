# Cavey–Lee factorization when one parameter is 1

Let \(P_\lambda(z;q,t)\) be the domino-tiling polynomial in [Cavey–Lee, arXiv:2501.17765v1, (3) and Conjecture 5.1](https://arxiv.org/pdf/2501.17765#page=24). For every partition \(\lambda\) of Durfee rank \(r\),
\[
 \boxed{\quad
 \frac{P_\lambda(z;q,1)}
 {\displaystyle\prod_{j=0}^{r-1}(z+q^j)^{r-j}}
 \in\mathbb Z_{\ge0}[z,q].
 \quad}
 \tag{1}
\]
The product is exactly the specialization at \(t=1\) of the complete conjectured triangular product, including multiplicities. The proved \(q,t\) symmetry gives the analogous result for \(P_\lambda(z;1,t)\). This is a specialization, not a proof of the bivariate conjecture.

## A determinant of area-weighted Schröder paths

Use the source's nonintersecting Schröder paths. Put \(w=\lambda_1\), with start positions \((j,j)\) and endpoints \((e_j,e_j)\), \(0\le j<w\), where \(e_j=j+n_j\) and \(n_j\) is the border-strip length. At each border-removal stage for a current shape of width \(u\) and height \(v\), the positive path has \(j=w-u\) and \(e_j=w+v-1\); both width and height strictly decrease at each new stage. Thus each of the \(r\) positive paths starts before row \(w\) and ends at or after row \(w\). Their end positions decrease strictly in their start order. Other paths are zero-length markers.

For \(m\ge0\) let \(S_m=S_m(z;q)\) be the weight sum of single Schröder paths from \((0,0)\) to \((m,m)\) above \(y=x\), with north step at height \(h=y-x\) weighted \(q^h\), diagonal step weighted \(zq^h\), and east step weighted \(1\). These are exactly the local area and diagonal weights of Cavey and Lee, since the area entry of either a north or diagonal step is its starting height. Set \(S_m=0\) for \(m<0\). Translation by a diagonal vector preserves weights.

The Lindström–Gessel–Viennot lemma gives
\[
 P_\lambda(z;q,1)=\det\big(S_{e_k-j}\big)_{0\le j,k<w}.
 \tag{2}
\]
Indeed the north, east, and diagonal grid has no intersections in the interiors of different edges. In any disjoint family contributing to the determinant, each marker is paired to itself, otherwise its start belongs to one path and its end to a different path. The remaining starts all precede the remaining ends along the boundary \(y=x\), so the only disjoint matching is the nested one by the planar boundary order. This is the identity matching in the displayed indexing; its determinant sign is positive. For each fixed \(\lambda\) the relevant grid may be taken finite.

## The same moments as weighted Dyck paths

The ordinary generating series \(F_z(x)=\sum_{m\ge0}S_m(z;q)x^m\) obeys
\[
 F_z(x)=\frac{1}{1-zx-xF_z(qx)}. \tag{3}
\]
To see this, parameterize the walks by height \(y-x\). A first return to height zero is either one diagonal step, contributing \(zx\), or a north step, an elevated path, and an east step. An elevated path of semilength \(d\) gains \(q^d\) because it has \(d\) north and diagonal steps in total. The latter return has generating series \(xF_z(qx)\). A whole path is a sequence of returns.

These moments have the Stieltjes continued fraction with successive numerators \(a_hx\), where
\[
 a_{2i+1}=q^i(z+q^i),\qquad a_{2i+2}=q^{2i+1}\qquad(i\ge0). \tag{4}
\]
This is the specialization of the alternating functional equations for \(F,f\) in [Johann Cigler, *Ramanujan’s q-continued fractions and Schröder-like numbers*, (3.1)–(3.2)](https://homepage.univie.ac.at/johann.cigler/preprints/schroeder-rama.pdf#page=7). For a self-contained verification of the exact parameters, work over \(\mathbb Q(q,z)[[x]]\), and set \(G_z(0)=1\) and
\[
 [x^n]G_z(x)=\frac{(-1)^n q^{\binom n2}\prod_{i=0}^{n-1}(z+q^i)}
                  {\prod_{j=1}^n(1-q^j)}.
\]
Coefficient comparison gives \(G_z(x)=(1-zx)G_z(qx)-xG_z(q^2x)\), so
\(F_z(x)=G_z(qx)/G_z(x)\) by the unique solution of (3) with constant term 1. The coefficients also give
\[
 zG_z(qx)+G_z(q^2x)=(z+1)G_{z/q}(q^2x).
\]
Subtracting \(G_z(qx)\) from \(G_{z/q}(q^2x)\) and using this same identity at \(qx\) and the recurrence at \(qx\) yields
\[
 G_z(qx)=G_{z/q}(q^2x)- qxG_{z/q}(q^3x).
\]
Consequently
\[
 F_z(x)=\frac{1}{\displaystyle
     1-\frac{(z+1)x}{1-qxF_{z/q}(q^2x)}}.
\]
Iterate this identity, replacing \(z,x\) by \(z/q,q^2x\) after each pair. The coefficient of any fixed power of \(x\) stabilizes after finitely many pairs. The resulting numerators are just (4).

A Stieltjes continued fraction of this shape is the generating function of Dyck excursions with up-step weight 1 and down-step from height \(h\) weight \(a_h\). This follows directly by first-return decomposition recursively at each height. Thus \(S_m\) also counts weighted Dyck paths of \(2m\) steps from \((0,0)\) to \((2m,0)\) in time-height coordinates.

## The forced triangular factors

Use the Dyck model in (2), with starts \((2j,0)\) and ends \((2e_j,0)\). The paths live on the parity lattice \(u+h\) even. Its nearest-neighbor up/down edges do not intersect without a common endpoint. LGV applies again, and by the same boundary and marker argument (2) is the positive weight sum over nonintersecting Dyck families.

At odd time \(u=2w-1\), all \(r\) positive paths are active. Their heights are distinct positive odd numbers, so, sorted from lowest to highest, their heights are at least \(1,3,\ldots,2r-1\). For each \(i<r\), at least \(r-i\) paths must later descend from height \(2i+1\) to \(2i\) on their way to zero. Each such step contributes the factor \(a_{2i+1}=q^i(z+q^i)\). This gives the entire triangular factor product \(\prod_{i=0}^{r-1}(z+q^i)^{r-i}\) in every family weight. After removing those factors, every weight still belongs to \(\mathbb Z_{\ge0}[z,q]\). Summing proves (1).

Cavey–Lee already prove the full bivariate formula for square \(\lambda\), in Theorem 1.3. The continued fraction is classical as above; the contribution here is applying it to the endpoint minor for every \(\lambda\), through which the rank enforces all the specialized factors simultaneously. Searches by paper title, exact conjecture and this Schröder/LGV specialization found no earlier account of this application.
