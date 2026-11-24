# Compactness at the regular Morley shape

No degenerating sequence of outer tetrahedra can have dihedral-trisector Morley shapes tending to the regular tetrahedron. In particular the family of outer tetrahedra with a regular Morley tetrahedron is compact up to similarity. This excludes the degeneration obstacle in §18.4 of [Quang Hung Tran, arXiv:2609.06553v3](https://arxiv.org/html/2609.06553v3); it does not classify interior solutions or resolve Conjecture 8.1. The opposite-edge arbitrary-p-section variant is a different statement, addressed by [Bhattacharjee](https://hexagonmath.org/2610.00499).

## 1. Gram formulation and limits

Let \(n_i\) be the inward unit face normals, \(S_i\) their face areas normalized to sum one, and \(H=(n_i\cdot n_j)\). For interior dihedral angles \(\theta_{ij}\) write \(q_{ii}=1,\ q_{ij}=2\cos(\theta_{ij}/3)\), \(K=(q_{ij})\), and \(\varphi(q)=(3q-q^3)/2\); thus \(H=\varphi[K]\) entrywise. In a regular Morley tetrahedron of edge length \(L\), let \(t_i\) be vertex \(i\)'s distance to its matching outer face. Put \(d_i=t_i/(\sqrt2 L)\), \(D=\operatorname{diag}(d_i)\), and \(C=4I-J\) with \(J\) the all-ones matrix. Tran's Proposition 3.2 gives \(H=KDCDK\). Also \(HS=0\), and Propositions 9.1–9.2 give \(\max_i d_i/\min_i d_i<2/\sqrt3\) and \(d_i\le1/\sqrt2\).

Take a convergent subsequence of \((K,d,S)\) in the closed bounded box. Its limiting \(d_i\) are positive: otherwise the ratio bound forces all zero, contradicting the limiting diagonal \(H_{ii}=1\). The limiting \(S\ge0\) has sum one and \(HS=0\). Since \(C\) is positive semidefinite with kernel \(\mathbb R\mathbf1\), the Gram identity gives \(KS=\lambda D^{-1}\mathbf1\) for \(\lambda>0\). Choose \(W:\mathbb R^4\to\mathbb R^3\) with \(W^{\mathsf T}W=C\), and realize \(n_i=WDKe_i\). With \(L=1\), take inner vertices \(M_i=We_i/(2\sqrt2)\) and supports \(h_j=\sum_i d_iq_{ij}/(2\sqrt2)>0\). We obtain
\[
 n_j\cdot M_i+h_j=t_iq_{ij},\qquad t_i=\sqrt2 d_i,
 \tag{1}
\]
including at the limit. The area relation is \(\sum_iS_in_i=0\).

If all four limiting normals are distinct, \(K\) is invertible even before assuming full-rank \(H\) or positive \(S\). Tran Lemma 3.1 gives \(K=\sqrt3J-\sum_{m\ge1}c_mH^{\circ m}\), with \(c_m>0\) and absolute convergence including \(H_{ij}=\pm1\). On \(\mathbf1^\perp\), equality in the nonpositive quadratic form forces \(\sum_i z_i n_i^{\otimes m}=0\) for every \(m\ge1\), and also the zeroth moment vanishes. Polynomial interpolation separates the distinct normals, so \(z=0\). Thus \(K\) has three negative directions and the vector \(\mathbf1\) is a positive direction. Invertibility forces rank \(H=3\).

## 2. Rank one is impossible

Write the limiting normals as \(\sigma_i n\), where \(\sigma_i=\pm1\) and \(n\) has unit length. The two sign groups have limiting total areas \(1/2\) each. If their sizes are \(a,b>0\), the limiting \(K\) has entries 1 within groups and 2 across. Thus \(KS=(3/2)\mathbf1\) and all \(d_i\to d_0\) for a constant \(d_0\). Its squared value is \(1/(ab)\), since the quadratic form of \(C\) on each limiting unscaled column is the sum of squared pairwise differences, equal to \(ab\).

Along the sequence let \(w_i=\sigma_i n_i\), \(\varepsilon=\max_{i,j}\|w_i-w_j\|>0\), and pass to a subsequence on which \(v_i=(w_i-w_1)/\varepsilon\) converges. The limiting distances \(r_{ij}=\|v_i-v_j\|\) have maximum 1. Since \(1-\varphi(q)=(q-1)^2(q+2)/2\), the within-group \((q_{ij}-1)/\varepsilon\) tends to \(r_{ij}/\sqrt3\). Across groups \(q_{ij}=2+O(\varepsilon^2)\) since \(\varphi'(2)\ne0\). For \(i,j\) in the same group \(I\), the scaled difference \((n_i-n_j)/\varepsilon\) therefore tends to \((d_0/\sqrt3)Wz\), where \(z_\ell=r_{i\ell}-r_{j\ell}\) for \(\ell\in I\) and zero otherwise. The difference is perpendicular to the sum of the two unit normals, and \(C\) times the limiting \(K\)-column is a nonzero constant on \(I\). Hence \(\sum_{\ell\in I}z_\ell=0\).

Each within-group distance matrix thus has constant row sums. For size two this is automatic and for size three it forces all three distances equal. In either case \(z\) has only two possibly nonzero coordinates \(\pm r_{ij}\), so \(\|Wz\|^2=8r_{ij}^2\). Taking squared norms in the scaled difference gives \(r_{ij}^2=(8d_0^2/3)r_{ij}^2\); the factor is \(2/3\) or \(8/9\). All within-group distances vanish. Dotting the balance \(\sum_i S_i\sigma_iw_i=0\) with \(w_1\) gives \(\sum_i S_i\sigma_i=O(\varepsilon^2)\), since all \(w_i\cdot w_1=1-O(\varepsilon^2)\). Subtract the \(w_1\) term and divide by \(\varepsilon\) to get \(\sum_i S_i^0\sigma_i v_i^0=0\) in the limit. The two constant group values coincide because each group has area \(1/2\). This contradicts the maximum distance 1.

## 3. A planar Morley lemma; exclusion of rank two

Take three distinct normals in (1) spanning a plane \(P\) and having a nonzero nonnegative linear dependence. The orthogonal projections of their three matching \(M_i\) to \(P\) are equilateral. For a strictly positive dependence their lines \(n_j\cdot X+h_j=0\) bound a triangle containing the origin. The three systems \(n_j\cdot X+h_j=t q_{ij}\) specify its Morley vertices adjacent to the matching side, as the ratio of the distances is \(\sin(2\theta/3)/\sin(\theta/3)\). Thus classical planar Morley applies. For a merely nonnegative relation, approximate the three directions by distinct positively spanning triples in the same plane while keeping \(h_j\) fixed. The systems in \((X,t)\) remain uniquely solvable at the limit, since multiplication by the nonnegative dependence gives the strictly positive coefficient \(\sum_j S_jq_{ij}\) for \(t\), and the normals span \(P\). So the projections are limits of equilateral triangles. An orthogonal projection of a nondegenerate equilateral triangle to a plane in three-space cannot be a point. If its image is equilateral, the restriction to the original plane is a similarity; a common line direction is fixed, so the scale is one and the planes are parallel.

If rank \(H=2\), the invertibility result forces a repeated normal. There must be three distinct directions: two with a nonzero nonnegative balance are antipodal and have rank one. Say \(n_1=n_2\). The corresponding \(K\)-columns and supports agree, as do \(d_1=d_2\) by the area relation. Equation (1) makes the projections of \(M_1,M_2\) coincide. The planar lemma for the three distinct directions makes the three projected points equilateral. In fact the projection perpendicular to \(M_1M_2\) gives pairwise lengths \(\sqrt3/2,\sqrt3/2,1\), a contradiction.

## 4. Rank three with two positive areas

If the positive components of \(S\) are precisely \(S_1,S_2\), then \(n_1=-n_2\), both weights are \(1/2\), and \(n_1,n_3,n_4\) are independent. Use the planar lemma on triples \((1,2,3)\), \((1,2,4)\). The corresponding inner face planes are parallel to \(\operatorname{span}(n_1,n_3)\), \(\operatorname{span}(n_1,n_4)\); thus \(M_1M_2\parallel n_1\). Here \(q_{12}=2\), \(t_1=t_2\), and (1) gives \(M_2-M_1=n_1\), \(t_1=t_2=1\). For \(k=3,4\), subtracting in (1) gives \(n_1\cdot n_k=q_{2k}-q_{1k}\). The two adjacent dihedral angles are supplementary, so write
\[
 q_{1k}=\frac{\sqrt3(1+u)}{\sqrt{1+3u^2}},\qquad
 q_{2k}=\frac{\sqrt3(1-u)}{\sqrt{1+3u^2}},\qquad |u|\le1/3,
\]
by \(u=\tan(\pi/6-\theta_{1k}/3)/\sqrt3\). Equating \(\varphi(q_{1k})=-3\sqrt3 u(1-u^2)/(1+3u^2)^{3/2}\) to \(q_{2k}-q_{1k}\) gives \(u=0\) or \(9u^2=1\). The endpoints would make \(n_k\) parallel to \(n_1\). Thus all cross entries here are \(\sqrt3\), \(n_k\perp n_1\), and by the area relation \(t_3=t_4=\sqrt3/2\).

Put \(A=(M_1+M_2)/2\). Now \(n_3\) is minus the unit vector in direction \(M_3-A\), because it lies in the parallel face plane, is perpendicular to \(M_2-M_1\), and \(n_3\cdot(M_3-A)=-\sqrt3/2\). The same holds for \(n_4\). These two vectors have scalar product \(1/3\) by the tetrahedron geometry. By (1) the distance from \(M_4\) to outer face 3 is \(5\sqrt3/6\), so \(q_{34}=5/3\). But \(\varphi(5/3)=5/27\ne1/3\), a contradiction.

## 5. Rank three with three positive areas

Suppose positive \(S\) has support \(\{1,2,3\}\). Their normals positively span a plane \(P\), and \(M_1M_2M_3\) is parallel to \(P\). Let \(3\alpha_i\) be the outer planar triangle angles opposite side \(i\), so all \(\alpha_i>0\), summing to \(\pi/3\). The matching distances of the Morley points to their sides are
\[
 x_i=t_i=\sin(\pi/3+\alpha_i).
\]
Indeed the triangle on side \(i\) has base \(2R\sin3\alpha_i\), base angles \(\alpha_j,\alpha_k\), and altitude \(2R\sin3\alpha_i\sin\alpha_j\sin\alpha_k/\sin(\alpha_j+\alpha_k)\), where \(R\) is the planar circumradius. Divide by the classical [inner length](https://repub.eur.nl/pub/95398/MorleyAndCardioids.pdf) \(L=8R\prod\sin\alpha_i=1\) and use the triple-angle formula.

The centroid's distance to side \(i\) is, by (1) and elementary addition formulas,
\[
 y_i=\tfrac13(x_i+2\cos(\alpha_k)x_j+2\cos(\alpha_j)x_k)
      =x_i+\cos(\alpha_j-\alpha_k)/\sqrt3.
\]
The projection of \(M_4\) to the inner face plane is the centroid, so \(q_{i4}=y_i/t\) where \(t=t_4\). Dot the area balance with \(n_4\) to get
\[
 T:=t^2=\frac{\sum_i S_i y_i^3}{3\sum_i S_i y_i}.
\]
The distances of \(M_i\) for \(i=1,2,3\) to outer face 4 are \(b_i=x_i y_i/t\), with average \(\bar b\). The centroid-relative equilateral vertices have covariance sum \(I_P/2\), and the fourth inner vertex has height \(\sqrt{2/3}\). Hence the squared norm of \(n_4\), reconstructed from the four distances, is \(2\sum(b_i-\bar b)^2+(3/2)(t-\bar b)^2\). Set \(Z_i=x_i y_i\), \(B=\sum Z_i/3\); the square is
\[
 N(T)=\frac{2\sum_i(Z_i-B)^2+(3/2)(T-B)^2}{T}.
\]
The \(S_i\) equal the normalized side-length weights by uniqueness of the positive normal relation. Thus \(\sum S_i y_i=r\), the outer planar inradius, by partitioning the area into triangles. Jensen gives \(T\ge T_0=(r/L)^2/3\). Also \(x_i\ge\sqrt3/2,\ y_i\ge2/\sqrt3\), so \(B\ge1\), whereas \(T\le(1+1/\sqrt3)^2/3<1\). Differentiating shows \(N\) strictly decreases on this range. It suffices to prove
\[
 T_0-2\sum_i(Z_i-B)^2-\tfrac32(T_0-B)^2>0.
 \tag{2}
\]
Using \(r=4R\prod\sin(3\alpha_i/2)\), the inner length \(L\), and the triple-angle identity for cosine gives
\[
 T_0=\frac1{96}\prod_{i=1}^3\frac{(1+2\cos\alpha_i)^2}{1+\cos\alpha_i}.
\]

## 6. Exact sign certificate and completion

Relabel so that \(\alpha_2,\alpha_3<\pi/6\); at most one angle can be at least \(\pi/6\). Put \(\alpha_2=\pi/6-u,\ \alpha_3=v,\ \alpha_1=\pi/6+u-v\). Under \(\tan(u/2)=(2-\sqrt3)U,\ \tan(v/2)=(2-\sqrt3)V\), both \(U,V\in(0,1)\). The half-angle and addition formulas give \(\cos\alpha_i=C_i/d,\ \sin\alpha_i=S'_i/d\) with \(d=(1+\tan^2(u/2))(1+\tan^2(v/2))\). In the checker \(X_i=dx_i\), \(Y_i=d^2y_i\), \(Z'_i=X_iY_i=d^3Z_i\), and \(E=\sum Z'_i\). Put \(P_0=\prod(d+2C_i)^2,\ Q_0=96\prod(d+C_i)\); then \(T_0=P_0/(d^3Q_0)\). Multiply (2) by \(18d^6Q_0^2>0\) to get
\[
 F=18d^3P_0Q_0-4Q_0^2\sum_i(3Z'_i-E)^2-3(3P_0-Q_0E)^2.
\]
The [exact checker](check.py) verifies over \(\mathbb Q(\sqrt3)\) that all 625 tensor Bernstein coefficients of degree \((24,24)\) on \([0,1]^2\) are nonnegative, 620 strictly so. Every basis function is positive in the open square. This proves (2), so \(N(T)<1\), impossible for a unit normal.

Support of size one is impossible for unit normals. The only remaining limiting case is rank three with \(S>0\). Its off-diagonal \(q\) are strictly between 1 and 2: coincident or antipodal normals would give a kernel vector supported on two indices while the rank-three kernel is spanned by \(S>0\). Thus the limiting Gram point stays admissible. Normalizing the outer tetrahedra to inradius one, every triple of normals is independent (by the positive one-dimensional kernel). Their supporting planes at distance one reconstruct the tetrahedra continuously. This proves compactness modulo similarity.

For almost-regular inner shapes, normalize their largest edge to 1 and center the vertices so the limiting inner tetrahedron is regular. Proposition 9.1 gives the same distance ratios without regularity, and the projection argument through (22) of the source bounds \(t_i\) by the corresponding inner edge length. For inner barycentric coordinates \(\mu_i\), the exact relation \(n_j=W D K e_j\) holds with \(We_i=\sqrt2\nabla\mu_i\), by interpolating the signed face distances. The matrices \(W\) converge to the regular one. All limiting systems above follow; in the scaled rank-one differences \(W\to W^0\) is enough after subtraction, because the scaled column differences are bounded. The same nondegeneracy conclusion therefore holds when the inner shapes only approach regular. This yields a non-effective closed neighborhood of the regular shape whose preimage is compact modulo similarity, not a classification of interior configurations.
