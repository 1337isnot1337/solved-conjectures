# The small-average-norm question for Laplace eigenfunctions

**Result.** The round three-sphere admits a real orthonormal Laplace eigenbasis \((u_j)\), ordered by nondecreasing eigenvalue, for which
\[
   \sum_{j\le N}\|u_j\|_{L^1(\mathbb S^3)}
      =O\!\left(N^{5/6}[\log(2+N)]^2\right).
\]
Thus no universal lower bound of the form \(N/(\log N)^c\), with any fixed \(c\), holds for arbitrary manifolds and eigenbases. This answers the second question of §43 in [Stefan Steinerberger's *Some Open Problems*, March 31, 2026 revision](https://faculty.washington.edu/steinerb/openproblems.pdf), pp. 43–44. For the same manifold, standard individual bounds give a lower bound \(\gtrsim N^{5/6}\) for every eigenbasis, so the exponent obtained here is optimal. The separate upper-average \(L^\infty\) question in the same section is already covered by [Han's Theorem 1.2](https://arxiv.org/html/2609.14023v3) and is not a new result here.

We use normalized area measure throughout, which affects only constants. Searches for the precise §43 question and for a full spherical-harmonic basis with decaying average \(L^1\) did not identify an earlier version of this construction or conclusion. Some previous work constructs large \(L^p\), \(p>2\), bases from Gaussian beams; that does not by itself give an upper bound on their \(L^1\) norms.

## 1. A holomorphic basis with small average \(L^1\)

Write \(z_1=\sqrt t e^{i\theta_1}\), \(z_2=\sqrt{1-t}e^{i\theta_2}\) on \(\mathbb S^3\subset\mathbb C^2\). The normalized measure is the product of uniform measure on \([0,1]\) for \(t\) and independent uniform angle measures. Fix a harmonic degree \(k\ge1\), and put \(m=k+1\). A normalized basis of the degree-\(k\) holomorphic homogeneous polynomials on the sphere is
\[
  F_j(z)=\sqrt{m\binom{k}{j}}\, z_1^jz_2^{k-j},\qquad 0\le j\le k.
\]
Orthogonality follows by the angles, and normalization follows from \(\int_0^1\binom{k}{j}t^j(1-t)^{k-j}\,dt=1/m\).

For large \(k\), take an even integer \(B\asymp\sqrt k\). Partition the lower half of the index set into consecutive full blocks of length \(B\), starting at zero, and mirror these blocks by \(j\mapsto k-j\) in the upper half. Keep any remaining central indices and the first and last full blocks as individual monomials. Their number is \(O(B)\). In each other block \(I=\{a,\ldots,a+B-1\}\), use the normalized discrete Fourier basis of linear combinations of the \(F_j\), namely the functions \(B^{-1/2}\sum_{r=0}^{B-1} e^{2\pi i l r/B}F_{a+r}\), \(0\le l<B\). This is an orthonormal basis of the full holomorphic subspace.

At fixed \(t\), the absolute amplitudes of \(F_j\) are
\[
  A_j(t)=\sqrt{m\binom{k}{j}t^j(1-t)^{k-j}}.
\]
They form a nonnegative unimodal sequence in \(j\), since consecutive binomial probabilities have a decreasing ratio. The Fourier combination differs in modulus from \(B^{-1/2}\left|\sum_{r=0}^{B-1} A_{a+r}(t)e^{ir\theta}\right|\) only by a shift in the uniform angle \(\theta=\theta_1-\theta_2\). By Abel summation, its angular \(L^1\) norm is at most
\[
  \frac{C\log(2+B)}{\sqrt B}\max_{j\in I}A_j(t).
\]
Indeed all one-sided Dirichlet kernels of lengths at most \(B\) have \(L^1\) norm at most \(C\log(2+B)\) by their geometric sum formula, and the coefficient endpoint plus total variation of a nonnegative unimodal block is at most three times its maximum.

For \(0<j<k\) and \(0<t<1\), Stirling's bounds, with \(s=j/k\), give
\[
 A_j(t)\le C k^{1/4}[s(1-s)]^{-1/4}\exp[-kD(s\Vert t)/2]
 \le C k^{1/4}[s(1-s)]^{-1/4}\exp[-k(s-t)^2].
\]
Here \(D(s\Vert t)=s\log(s/t)+(1-s)\log((1-s)/(1-t))\); at \(s=t\) it and its derivative in \(s\) vanish, and its second derivative is \(1/[s(1-s)]\ge4\). This proves the last inequality directly.

For a lower-half block of the form \(\{hB,\dots,(h+1)B-1\}\) with \(h\ge1\), the prefactor is at most \(Ck^{1/4}(k/(hB))^{1/4}\). The integral of \(\exp[-k\operatorname{dist}(t,I/k)^2]\) over \(t\in[0,1]\) is \(O(B/k+k^{-1/2})=O(k^{-1/2})\): replace the discrete \(I/k\) by its interval hull and use the two Gaussian tails. It follows that
\[
  \int_0^1\max_{j\in I}A_j(t)\,dt
  \le Ck^{-1/4}(k/(hB))^{1/4}.
\]
The same estimate holds for the mirrored block by symmetry. Summing over all blocks and using \(\sum_{h\le Ck/B}h^{-1/4}=O((k/B)^{3/4})\) gives a total \(O(k^{1/4})\). Each block has \(B\) basis functions, and each exceptional monomial has \(L^1\le1\). Hence the average \(L^1\) norm over the entire holomorphic basis is at most
\[
   \frac1m\left[O(B)+
       O\!\left(\sqrt B\log(2+B)\,k^{1/4}\right)\right]
     =O(k^{-1/2}\log(2+k)).
\]

## 2. Transfer to the whole eigenspace

Identify \(\mathbb S^3\) with \(\mathrm{SU}(2)\) by
\[
 g(z)=
 \begin{pmatrix}z_1&-\overline{z_2}\\ z_2&\overline{z_1}\end{pmatrix}.
\]
Normalized area is Haar measure: multiplication on either side acts orthogonally on \(\mathbb R^4\). Let \(\rho\) be the irreducible degree-\(k\) symmetric power of the standard unitary representation, on the \(m\)-dimensional Hermitian space \(V=\operatorname{Sym}^k(\mathbb C^2)\). Write \(b=(1,0)^{\otimes k}\) and use a conjugate-linear first slot. The functions
\[
     F_v(g)=\sqrt m\,\langle v,\rho(g)b\rangle
\]
for standard unit symmetric tensors are exactly the monomials above. The map is conjugate-linear, so the Fourier combinations from Section 1 are obtained from an orthonormal basis \((v_i)_{i=1}^m\) of \(V\), up to reversing the packet index.

By Schur orthogonality the \(m^2\) functions
\[
    U_{ij}(g)=\sqrt m\,\langle v_i,\rho(g)v_j\rangle
\]
are orthonormal over \(\mathbb C\). They lie in harmonic degree \(k\): the orbit of \(b\) spans \(V\) by irreducibility, hence each coefficient is a finite linear combination of right translates of the holomorphic degree-\(k\) harmonic \(F_{v_i}\). Right translations preserve that degree. The degree-\(k\) harmonic space in four real coordinates has dimension \(\binom{k+3}{3}-\binom{k+1}{3}=m^2\), so this is a full complex basis.

Put \(q_h=\rho(h)b\). The representation average \(m\int q_h\otimes q_h^*\,dh=I\) follows from irreducibility and trace. Insert it in the coefficient, use the triangle inequality and set \(h'=g^{-1}h\) in the inner Haar integral:
\[
 \begin{aligned}
 \|U_{ij}\|_1
 &\le m^{3/2}\int\!\int
     |\langle v_i,q_h\rangle|\,
     |\langle q_h,\rho(g)v_j\rangle|\,dg\,dh\\
 &=\sqrt m\,\|F_{v_i}\|_1\|F_{v_j}\|_1.
 \end{aligned}
\]
Thus the mean norm of this level's complex eigenbasis is at most \(\sqrt m\) times the square of the mean holomorphic norm, hence \(O(k^{-1/2}[\log(2+k)]^2)\).

## 3. A real basis and the spectral sum

The antiunitary \(J_0(z_1,z_2)=(-\overline{z_2},\overline{z_1})\) commutes with the standard \(\mathrm{SU}(2)\) action. Its degree-\(k\) symmetric power \(J\) commutes with \(\rho\) and maps the standard tensor of index \(j\) to \((-1)^{k-j}\) times that of index \(k-j\). The monomials kept aside are mirror-invariant as a set. In a Fourier block, reversing the order of the indices and conjugating the coefficients preserve a packet after changing an overall phase, and multiplication by \((-1)^j\) shifts packet index by \(B/2\), since \(B\) is even. Thus \(J\) permutes the representation basis up to phases. Since
\[
   \overline{\langle v_i,\rho(g)v_j\rangle}
          =\langle Jv_i,\rho(g)Jv_j\rangle,
\]
complex conjugation permutes the matrix-coefficient basis up to phases as well. Each singleton orbit can be phased to give a real function. Each other orbit consists of an orthogonal pair which, after choosing phases, can be written \(U,\overline U\); replace it by \((U+\overline U)/\sqrt2\) and \((U-\overline U)/(i\sqrt2)\). This gives a real orthonormal basis, increasing the sum of \(L^1\) norms by at most a factor \(\sqrt2\).

The degree levels are ordered by their distinct eigenvalues \(k(k+2)\). Summing the per-level upper bound \(O(k^{3/2}[\log(2+k)]^2)\) through degree \(K\) gives \(O(K^{5/2}[\log(2+K)]^2)\). There are \(\asymp K^3\) modes through level \(K\), so the claimed \(N^{5/6}\log^2 N\) upper bound holds for every initial segment, including one cut in the middle of a level.

For comparison, the standard \(L^4\) Sogge bound on \(\mathbb S^3\), stated for example in [Han, equation (1.1)](https://arxiv.org/html/2609.14023v3), is \(\|u\|_4\lesssim k^{1/4}\) for each unit degree-\(k\) mode. The interpolation inequality \(1=\|u\|_2\le\|u\|_1^{1/3}\|u\|_4^{2/3}\) implies \(\|u\|_1\gtrsim k^{-1/2}\); hence the total for every basis is \(\gtrsim N^{5/6}\). No claim is made here about removing the remaining logarithms at this smaller, normalized scale.
