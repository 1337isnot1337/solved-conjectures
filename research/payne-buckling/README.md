# Payne’s buckling conjecture: cyclic symmetry and even indices

Tracking issue: [#335](https://github.com/1337isnot1337/solved-conjectures/issues/335).

**Status:** A spectral comparison for all finite rotational symmetries, including infinitely many even indices; not a resolution of the arbitrary planar case. Priority for this partial is unverified.

Let \(\Omega\) be a nonempty bounded open subset of \(\mathbb R^2\), invariant under rotation through \(2\pi/N\) for an integer \(N\ge2\). Center coordinates at the center of rotation. Denote by \(\lambda_i\) the Dirichlet Laplace spectrum on \(H_0^1(\Omega)\) and by \(\Lambda_i\) the clamped buckling spectrum on \(H_0^2(\Omega)\), both indexed from one with multiplicities. Payne's conjecture is \(\lambda_{k+1}\le\Lambda_k\).

**Main consequence.** If \(N\) is even, then Payne's inequality holds whenever \(N\nmid k\). If \(N\) is odd, it holds whenever \(2N\nmid k\). In either case the universal odd-index result and the tied case \(\Lambda_k=\Lambda_{k+1}\) also remain available. The theorem below gives a possibly larger index shift from the multiplicity profile of the first \(k\) buckling modes.

## Quantitative statement

First suppose \(\Lambda_k<\Lambda_{k+1}\). Let \(E\) be the complex span of the first \(k\) buckling modes. Let \(R\) act by \(R u(x)=u(Q^{-1}x)\), where \(Q\) is counterclockwise rotation through \(2\pi/N\); set \(\zeta=e^{2\pi i/N}\). Write \(E_j=\{u\in E:Ru=\zeta^j u\}\) and \(d_j=\dim_{\mathbb C}E_j\) for \(j\in\mathbb Z/N\mathbb Z\). Conjugation maps \(E_j\) to \(E_{-j}\), so \(d_j=d_{-j}\). Put
\[
\begin{split}
 g^+_\ell &= (d_{\ell-1}-d_\ell)_+
       +\mathbf 1_{\{2\ell=1,\ d_\ell\text{ odd}\}},\\
 g^-_\ell &= (d_{\ell+1}-d_\ell)_+
       +\mathbf 1_{\{2\ell=-1,\ d_\ell\text{ odd}\}},\\
 G &= \sum_{\ell\in\mathbb Z/N\mathbb Z}\max(g^+_\ell,g^-_\ell),
\end{split}
\]
where equality of residues is modulo \(N\), and \(x_+=\max(0,x)\).

**Theorem.** If \(G>0\), then \(\lambda_{k+G}\le\Lambda_k\). If \(G=0\), the same-index strict inequality \(\lambda_k<\Lambda_k\) still holds but this argument makes no shifted claim. More generally the construction applies to the full buckling spectral subspace at any threshold, with \(k\) its dimension, when \(k\ge1\).

If \(d_\ell\) is not constant, some difference \(d_{\ell-1}-d_{\ell}\) is positive, so \(G\ge1\). A constant profile requires \(N\mid k\). For odd \(N\), a constant profile of odd dimension per character gives \(G=2\): the two equations \(2\ell=\pm1\) have distinct solutions. Therefore \(G=0\) in the odd-\(N\) case requires \(2N\mid k\). If \(\Lambda_k=\Lambda_{k+1}\), no choice of a symmetry-invariant partial eigenspace is needed for Payne's one-step claim: \(\lambda_{k+1}<\Lambda_{k+1}=\Lambda_k\) by the same-index inequality. This handles the missing strict gap case in the main consequence.

## Proof

For \(t>\Lambda_k\) define on \(H_0^1(\Omega;\mathbb C)\) the Hermitian form
\[
 q_t(u,v)=\int_\Omega \nabla u\cdot\overline{\nabla v}-
 t\int_\Omega u\overline v
\]
and its complex bilinear companion \(b_t(u,v)=q_t(u,\overline v)\). The following argument uses the first-order identity from Levitin and Polterovich, arXiv:2609.12235v2, §2.1; the new step is the cyclic projection and combination of trial spaces.

For \(u\in E\), the buckling variational forms give \(\|\Delta u\|_2^2\le\Lambda_k\|\nabla u\|_2^2\). Cauchy–Schwarz applied to \(\|\nabla u\|_2^2=\langle-\Delta u,u\rangle\) shows \(q_t(u,u)<0\) for \(u\ne0\). At \(t=\Lambda_k\) it still gives strict inequality: equality would force \(-\Delta u=\Lambda_k u\); extending \(u\in H_0^2(\Omega)\) by zero gives a global compactly supported solution, which vanishes by Fourier transform. This proves the same-index strict comparison, also at a tied index by taking any first \(k\) buckling eigenfunctions.

Set \(T_\pm=\partial_1\pm i\partial_2\). The operators send \(H_0^2\) to \(H_0^1\) and commute with the constant-coefficient derivatives. The zero extension and the Fourier multipliers \(i\xi_1\mp\xi_2\) give
\(\|T_\pm u\|_2^2=\|\nabla u\|_2^2\) and
\(\|\nabla T_\pm u\|_2^2=\|\Delta u\|_2^2\).
Thus \(T_\pm\) are injective on \(E\), and \(q_t[T_\pm u]<0\) for every nonzero \(u\in E\). Integration by parts yields \(b_t(T_\pm u,v)=-b_t(u,T_\pm v)\) for \(u,v\in H_0^2\). The form \(b_t(T_\pm u,v)\) is therefore skew-symmetric.

For the definition \(Ru(x)=u(Q^{-1}x)\), the chain rule gives \(RT_+=\zeta^{-1}T_+R\) and \(RT_-=\zeta T_-R\): indeed \(\nabla(Ru)(x)=Q(\nabla u)(Q^{-1}x)\), and \((Qv)_1+i(Qv)_2=\zeta(v_1+iv_2)\). In what follows call the operator shifting character by \(+1\) \(T^\uparrow=T_-\), and the one shifting by \(-1\) \(T^\downarrow=T_+\).

The rotation leaves \(q_t\) invariant, so different character spaces in \(H_0^1\) are \(q_t\)-orthogonal. In target character \(\ell\), consider
\[
 K^\uparrow_\ell=\{v\in E_{\ell-1}:q_t(T^\uparrow v,w)=0\text{ for all }w\in E_\ell\}.
\]
Its dimension is at least \((d_{\ell-1}-d_\ell)_+\). If \(2\ell=1\), then \(E_{\ell-1}=E_{-\ell}=\overline{E_\ell}\). The kernel condition becomes \(b_t(T^\uparrow v,z)=0\) for every \(z\in E_{\ell-1}\). When \(d_\ell\) is odd this skew-symmetric form has a nonzero kernel. Here the rank-count term vanishes because \(d_{\ell-1}=d_\ell\), so the two conditions together give \(\dim K^\uparrow_\ell\ge g^+_\ell\). Likewise the image of a corresponding kernel under \(T^\downarrow\) in target \(\ell\) has dimension at least \(g^-_\ell\).

In each target \(\ell\), choose only the operator with the larger guarantee; no orthogonality between the two images in the **same** character is asserted. Its injective image is a negative trial space and orthogonal to \(E\). The chosen images for different target characters are mutually orthogonal. Their orthogonal sum with \(E\) therefore has dimension at least \(k+G\) and is \(q_t\)-negative. The Dirichlet min–max principle gives \(\lambda_{k+G}<t\). Let \(t\downarrow\Lambda_k\).

## A connected even-index example not covered by the tie case

Let \(B\) be a unit disk centered at the origin, with first two buckling eigenvalues \(\alpha<\beta\). The strict gap follows from simplicity of the first disk mode; see Friedlander's disk computation in the 2004 paper below. Choose \(0<\rho<1\) with \(\rho^2>\alpha/\beta\). Let \(\Omega_0\) be the disjoint union of \(B\) and three disks of radius \(\rho\), centered at the vertices of a sufficiently large equilateral triangle about the origin. The buckling spectra of a disjoint union form the multiset union of the component spectra, and disk dilation multiplies the spectrum by \(\rho^{-2}\). Hence
\[
 \Lambda_1(\Omega_0)=\alpha<
 \Lambda_2(\Omega_0)=\Lambda_3(\Omega_0)=\Lambda_4(\Omega_0)
 =\rho^{-2}\alpha<\Lambda_5(\Omega_0)=\beta.
\]
Connect the satellite disks to \(B\) by adding the open \(\varepsilon\)-neighborhood of the three segments joining their centers to the origin, obtaining a connected \(C_3\)-invariant \(\Omega_\varepsilon\). For fixed \(j\), \(\Lambda_j(\Omega_\varepsilon)\to\Lambda_j(\Omega_0)\) as \(\varepsilon\downarrow0\): monotonicity gives the upper bound. For the lower bound, zero-extend the first \(j\) buckling modes, taken gradient-orthonormal, to one fixed containing ball. Their Laplacian norms are uniformly bounded. They are bounded in \(H^2\) by Plancherel and Poincaré, thus subsequential limits are weak in \(H^2\) and strong in \(H^1\). Every limit vanishes almost everywhere outside the closed disks because the added segments and the boundaries have area zero. By the trace characterization on the separated smooth disks the limits are in \(H_0^2(\Omega_0)\). Strong \(H^1\) retains gradient-orthonormality, and weak lower semicontinuity on every linear combination gives the desired lower bound by min–max. Therefore \(\Lambda_4(\Omega_\varepsilon)<\Lambda_5(\Omega_\varepsilon)\) for small \(\varepsilon\). The rotational theorem gives \(\lambda_5(\Omega_\varepsilon)\le\Lambda_4(\Omega_\varepsilon)\) at an even index and a true buckling gap.

## Source and scope audit

- L. E. Payne, [Inequalities for eigenvalues of membranes and plates](https://www.jstor.org/stable/24900370), 1955, formulated the buckling comparison. This is not Payne's nodal line conjecture or the Payne–Pólya–Weinberger gap-ratio problem.
- [Levitin and Polterovich, arXiv:2609.12235v2](https://arxiv.org/html/2609.12235v2) establish the conjecture for every odd index and explain the explicit even-index obstruction to using only ordinary skew-symmetry. Theorem 1 and Remarks 3–5 are the relevant source. This note uses their trial-space construction, rather than claiming a new proof method for the odd case.
- [Friedlander, 2004](https://doi.org/10.17323/1609-4514-2004-4-2-369-375) proves \(\lambda_3\le\Lambda_1\) under fourfold symmetry, and shows that stronger comparison fails on general planar domains. The quantitative profile result recovers this classical case. For a simple first mode the two adjacent character spaces add two directions; for a two-dimensional first eigenspace the theorem at the end of the cluster \(k=2\) adds at least one direction; and if the first cluster has size at least three the same-index comparison suffices. This classical conclusion is not a novelty claim.
- [Liu's purported all-index result](https://arxiv.org/abs/2109.02561) was formally withdrawn for a proof error; [Friedlander's critique](https://arxiv.org/abs/2109.08821) identifies the issue. [Buoso et al., October 2026](https://arxiv.org/html/2610.20097v1), Introduction, explicitly retain the general even-index planar case and produce counterexamples only for broader manifold classes. Searches for cyclic-character, rotational-symmetry, and even-index buckling comparisons found no earlier exact profile statement. This is not an exhaustive priority proof.
- The balanced profile, with even rank per character when \(N\) is odd, is a real limitation of this count: \(G=0\). This neither disproves the conjecture in those cases nor proves that symmetry methods cannot settle them.
