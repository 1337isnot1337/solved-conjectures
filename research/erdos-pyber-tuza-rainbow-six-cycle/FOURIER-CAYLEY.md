# Fourier supersaturation for normal Cayley colorings

**Theorem.** Let \(G\) be any compact group with probability Haar measure and no nontrivial continuous homomorphism to the two-element group. For \(m\ge6\), let \(f_1,\ldots,f_m:G\to[0,1]\) have integrals \(1/m\), sum to one, be inverse-symmetric, and be invariant under conjugation. For each color order the corresponding rainbow cycle integral is at least
\[
m^{-m}\bigl[1-(m-1)(2/3)^{m-2}\bigr]>0.
\]
In particular for six colors it is at least \(6^{-6}/81\). Fractional colors are allowed. The estimate is uniform over \(G\), including disconnected compact groups with no quotient of order two.

**Finite consequences for Erdős #811.** Every sufficiently large completely balanced normal Cayley coloring of \(K_{6t+1}\) has a rainbow six-cycle, for every finite group and every choice of conjugation-invariant inverse-symmetric classes. There is also no normality requirement if the group has no irreducible complex representation of dimension five. Both families in fact have order \(n^6\) labeled rainbow cycles for every prescribed color order. Neither condition is known for arbitrary balanced colorings.

The elementary spectral argument below is separate from the [connected abelian inverse-Kneser argument](CONNECTED-CAYLEY.md), which also handles three to five colors.

## Two Fourier estimates

Put \(g_i=m f_i\), so each \(g_i\) has integral one. For an irreducible unitary representation \(\pi\) of dimension \(d_\pi\), write \(M_i(\pi)=\int g_i(x)\pi(x)^*\,d\mu(x)\). Fourier inversion at the identity for products of these bounded densities gives the sum of \(d_\pi\operatorname{tr}(M_1(\pi)\cdots M_m(\pi))\), possibly read in reverse order according to the Fourier convention. The trivial representation contributes one. Absolute convergence follows by using Hilbert–Schmidt Cauchy–Schwarz for two factors and bounded operator norms for the rest; Parseval bounds the square sums. Equivalently one can first apply Plancherel to two pieces of the convolution. The inversion is valid for measurable input because a convolution of two bounded densities on a compact group is continuous. The rainbow integral itself is the corresponding convolution at the identity, using successive Cayley edge differences.

First, let \(\chi\) be a nontrivial one-dimensional character. The \(M_i(\chi)\) are real by inverse symmetry. Since the \(f_i\) sum to one, their absolute coefficients satisfy
\[
\frac1m\sum_i|M_i(\chi)|\le\int |\Re\chi(x)|\,d\mu(x)\le\frac23.
\]
Indeed the image of \(\chi\) is either the circle or a finite cyclic group of odd order \(q\ge3\). Haar pushes forward to Haar. The circle average is \(2/\pi\). For odd \(q\) the average is \(1/(q\sin(\pi/(2q)))\): multiplication by two permutes residues, and the sum of the absolute cosines is the symmetric cosine sum on indices \(-(q-1)/2,\ldots,(q-1)/2\) with step \(\pi/q\). The expression is at most its value \(2/3\) at \(q=3\), since \(\sin z/z\) decreases for \(0<z\le\pi/2\).

Second, for a central \(g_i\), Schur’s lemma makes \(M_i(\pi)=a_i(\pi)I\), with real scalar. When \(d_\pi\ge2\), the same argument and the character \(L^2\) norm give
\[
\frac1m\sum_i|a_i(\pi)|
\le d_\pi^{-1}\int|\Re\operatorname{tr}\pi(x)|\,d\mu(x)
\le d_\pi^{-1}\le\frac12.
\]

## Multiply the coefficients and charge their energy

For nonnegative \(b_1,\ldots,b_m\) with average at most \(r_0\), the arithmetic-geometric mean and the quadratic mean give
\[
\prod_i b_i\le r_0^{m-2}\frac1m\sum_i b_i^2.
\]
Use this at each nonprincipal representation with \(b_i=|a_i(\pi)|\) and \(r_0=2/3\). The trace times dimension is \(d_\pi^2\prod_i a_i\) in the scalar setting. Thus the total nonprincipal contribution in absolute value is at most
\[
(2/3)^{m-2}\frac1m\sum_i \sum_{\pi\ne1}d_\pi\|M_i(\pi)\|_{\rm HS}^2
\le (2/3)^{m-2}(m-1).
\]
The last step is Parseval, since \(\int g_i^2\le m\int g_i=m\). Rescale by \(m^{-m}\) to prove the theorem. For \(m=6\) the error is \(80/81\), and the bound improves for larger \(m\).

## Finite balanced colorings and the nonnormal extension

In a finite group of order \(n=6t+1\), take \(f_i=1_{D_i}\), where the six sets partition \(G\setminus\{e\}\) and each has size \(t\). Normalize \(g_i=(n/t)f_i=6L f_i\), with \(L=n/(n-1)\). For the scalar bounds, \(r_0\) becomes \(2L/3\), because the sum of the \(f_i\) is bounded by one. The Parseval energy bound becomes \(6L-1\). Since \((2L/3)^4(6L-1)\to80/81<1\), the central case follows for all sufficiently large orders.

Now do not assume conjugation invariance. Every \(M_i(\pi)\) is still self-adjoint. In an odd-order finite group every nontrivial irreducible representation is of complex type: its Frobenius–Schur indicator is zero, because squaring permutes the group and the nontrivial character has average zero. Therefore for distinct dual representations \(\pi,\overline\pi\), a real mean-zero function \(h\) has equal Hilbert–Schmidt contributions at the two. Parseval for \(h=g_i-1\) gives
\[
2d_\pi\|M_i(\pi)\|_{\rm HS}^2\le\|g_i-1\|_2^2\le6L-1.
\]
So if \(d_\pi\ge7\), the operator norm of each \(M_i(\pi)\) is at most \(\sqrt{(6L-1)/14}\), which is below \(2L/3\) for large \(n\). Irreducible dimensions of a finite group divide its order. Since \(n\equiv1\bmod6\), the only possible degree strictly between \(1\) and \(7\) is \(5\).

If there is no such degree, take any \(d_\pi\ge7\). In the trace bound use Hilbert–Schmidt at the two factors of smallest Hilbert–Schmidt norm and operator norm at the remaining four factors. Cyclically splitting the product at the two special factors and applying Hilbert–Schmidt Cauchy–Schwarz gives
\[
\left|\operatorname{tr}\prod_{i=1}^6 M_i(\pi)\right|
\le (2L/3)^4\,\frac16\sum_i\|M_i(\pi)\|_{\rm HS}^2.
\]
For the one-dimensional representations retain the scalar estimate. Summing with Parseval gives the same strictly positive lower bound after normalizing for the finite tables.

The convolution formula counts \(\Omega(t^6)\) labeled closed walks. A repeated vertex among the six positions accounts for at most \(\binom62n^5\) labelings even when ignoring colors. Thus the lower bound produces order \(n^6\) simple cycles, not just closed walks.

## Scope

For the finite normal case this improves the [earlier central-residue and inverse-product analyses](NORMAL-CAYLEY.md); no classification of small product sets is needed. For nonnormal Cayley colorings of odd-order groups, the only representation degree not controlled by this argument is five. The unrestricted graph problem still lacks a reason why arbitrary color operators should have this kind of Fourier decomposition. [Original Erdős–Tuza chapter](https://doi.org/10.1016/S0167-5060(08)70377-7) · [Problem #811](https://www.erdosproblems.com/811).
