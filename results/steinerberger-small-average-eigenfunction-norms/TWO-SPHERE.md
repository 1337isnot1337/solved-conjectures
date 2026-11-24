# An optimal small-\(L^1\) basis on the round two-sphere

The [variable-width packet construction](POINTWISE.md) also yields a real orthonormal Laplace eigenbasis on the round two-sphere such that every unit degree-\(k\) member has
\[
  \|u\|_p\asymp_p k^{\,1/4-1/(2p)}
          \qquad (1\le p\le\infty,\quad k\ge1).
\]
In particular \(\|u\|_1\asymp k^{-1/4}\), the universal smallest order. The selected profile for \(2<p\le6\) is the largest possible order. For \(p>6\) the displayed selected profile is not the maximal Sogge growth. The sharp small-\(L^1\) order also implies the optimal cumulative growth \(\asymp N^{7/8}\) for this basis. This is a supplement to the original question, not a separate conjecture count.

Put \(m=2k+1\) and use \(V=\operatorname{Sym}^{2k}(\mathbb C^2)\) with unitary action \(\rho\) of \(\mathrm{SU}(2)\). Let \(b=(1,0)^{\otimes 2k}\) and let \(e\) be the unit symmetric tensor with \(k\) copies of each standard coordinate vector. The standard torus \(T=\{\operatorname{diag}(e^{i\theta},e^{-i\theta})\}\) fixes \(e\), and it is its only weight-zero line. Let \(v_1,\dots,v_m\) be the pointwise-small holomorphic packet basis in the companion note, applied to degree \(2k\) on \(\mathbb S^3\). Set
\[
 F_v(g)=\sqrt m\,\langle v,\rho(g)b\rangle,\qquad
 U_i(g)=\sqrt m\,\langle v_i,\rho(g)e\rangle .
\]
We have \(\|F_{v_i}\|_1\lesssim k^{-1/2}\) individually. By the invariance of \(e\), the \(U_i\) descend to \(\mathrm{SU}(2)/T\).

Here is a direct check that the quotient functions are the degree-\(k\) spherical harmonics with their standard norm. In the coordinates \(g(z)\) of the companion proof, right multiplication by \(T\) multiplies its first column \(z=(z_1,z_2)\) by a common phase. The Hopf map
\[
 \mathcal{H}(z)=
   \left(2\Re(z_1\overline{z_2}),\
         2\Im(z_1\overline{z_2}),\
         |z_1|^2-|z_2|^2\right)
\]
maps the unit three-sphere onto the unit two-sphere with precisely these fibers. Its coordinates are the entries of the traceless Hermitian matrix \(2zz^*-I\) on the unit sphere, so it is equivariant for the induced rotation action. Hence normalized Haar measure pushes forward to normalized area. As real quadratic polynomials on \(\mathbb R^4\), its components are harmonic and satisfy
\(\nabla\mathcal{H}_r\cdot\nabla\mathcal{H}_s=4|z|^2\delta_{rs}\), directly from the three formulas. The chain rule therefore shows that the pullback of each degree-\(k\) homogeneous harmonic polynomial on \(\mathbb R^3\) is a degree-\(2k\) harmonic polynomial on \(\mathbb R^4\). This pullback is injective. The \(T\)-fixed subspace on the right side has dimension \(m\), since in the full Schur matrix-coefficient basis of degree \(2k\) exactly the column with \(e\) is \(T\)-fixed. The pullback of the degree-\(k\) harmonics also has dimension \(2k+1=m\), so the spaces agree. Schur orthogonality thus makes the descended \(U_i\) a full complex orthonormal basis of degree \(k\).

The identity \(m\int \rho(h)b\otimes(\rho(h)b)^*\,dh=I\) gives, as in the three-sphere argument,
\[
 \|U_i\|_1\le\sqrt m\,\|F_{v_i}\|_1\|F_e\|_1,
 \qquad
 \|U_i\|_\infty\le\sqrt m\,\|F_{v_i}\|_1\|F_e\|_\infty .
\]
For the second inequality simply bound the second factor in the same integral uniformly in \(g,h\), instead of integrating it. The weight-zero amplitude is an explicit middle monomial:
\[
 |F_e|=\sqrt{m\binom{2k}{k}}\,[t(1-t)]^{k/2}.
\]
Its maximum is \(O(k^{1/4})\) by the central binomial estimate, and its \(L^1\) norm is \(O(k^{-1/4})\), since
\((4t(1-t))^{k/2}\le \exp(-2k(t-\tfrac12)^2)\) and \(t\) is uniform on \([0,1]\). We obtain the individual bounds \(O(k^{-1/4})\) in \(L^1\) and \(O(k^{1/4})\) in \(L^\infty\).

The antiunitary \(J\) permutes the packet basis up to phases and fixes the line through \(e\). Thus conjugation permutes the descended matrix coefficients up to phases, and the same realification as before preserves the individual norms up to \(\sqrt2\). Interpolating the two upper bounds with the unit \(L^2\) norm gives the stated upper profile. For \(1\le p\le2\), the universal Sogge bound \(\|u\|_6\lesssim k^{1/6}\) and interpolation of \(L^p,L^6\) around \(L^2\) give \(\|u\|_p\gtrsim k^{1/4-1/(2p)}\). For \(p>2\), interpolate the constructed small \(L^1\) norm with \(L^p\): the unit \(L^2\) norm forces the same matching lower order. Finally the degree-\(k\) multiplicity is \(2k+1\), so summing \(k^{-1/4}\) by degree gives the claimed cumulative order, including mid-degree prefixes.

[Han, Theorem 1.3](https://arxiv.org/html/2609.14023v3#S1) independently obtains a full maximally growing low-exponent basis for 2<p≤6. The individual small-L¹ upper bound, the selected L∞ order and the full profile are the distinct assertions here.
