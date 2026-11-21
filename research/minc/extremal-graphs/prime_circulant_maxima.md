# Circulant maxima when the line sum does not divide the order

**Theorem.** For every sufficiently large prime \(n\), a binary matrix of order \(n\) with all line sums \(k\) has strictly larger permanent than every circulant with those line sums, simultaneously for **every** \(2\le k\le n-2\). For the other positive line sums \(1,n-1,n\), all matrices are equivalent under row and column permutations to a circulant. This gives an eventual classification of the prime orders of [Minc Problem 12](https://yair-lavi.com/mincs-list/problem-12/). The threshold is not effective in this proof. General composite orders remain open.

Let \(d_n=n!/n^n\), let \(J=J_n\) have entries \(1/n\), and normalize each candidate to a doubly stochastic matrix \(A=G/k\). Write \(B=A-J\) and \(P(B)=\operatorname{per}A/d_n\). It suffices to exclude every hypothetical sequence of arbitrarily large prime exceptions by taking a subsequence on which \(k/n\) converges.

## Densities at most one half

When \(k/n\to0\), the [entropy and codegree bound](entropy_codegrees.md) proves the result, including bounded degrees. When \(k/n\to\alpha>0\), all prime circulants have \(P(B)=O_\alpha(1)\). Indeed every nontrivial character enumerates all \(n\) equally spaced roots of unity. For a fixed direction the \(k\) largest real projections are obtained on \(k\) consecutive roots. Hence the modulus of the normalized character average is at most \(\sin(\pi k/n)/(k\sin(\pi/n))\), which tends to \(\sin(\pi\alpha)/(\pi\alpha)<1\) if \(0<\alpha<1\). The centered matrix has bounded Frobenius norm squared \(n/k-1\), so the [uniform coefficient bound](../real-radius/hilbert_schmidt_limit.md) applies.

If \(k\le\lfloor n/2\rfloor\), the direct sum of two regular blocks of orders \(\lfloor n/2\rfloor,\lceil n/2\rceil\) has \(P(B)\ge d_{\lfloor n/2\rfloor}d_{\lceil n/2\rceil}/d_n\), of order \(\sqrt n\). If \(k/n\to1/2\) from above, use the *complement* of this two-block construction at degree \(r=n-k\). The normalized complement \(G/k\) has a centered singular value \(r/k\to1\): the normalized zero pattern fixes the two class constants, and on the globally centered subspace \(B\) equals \(-r/k\) times its centered normalization. The [two-class entropy bound](positive_density_minimum.md) forces \(P(B)\to\infty\) for dense regular matrices with centered singular norm tending to one. One can apply its rectangle bound directly here, pairing the first row class with the second column class. The omitted two rectangles have total weight \(o(n)\), and both class sizes are comparable to \(n\).

## Complement degrees at positive density

Now suppose \(k/n\to\alpha\in(1/2,1)\). Put \(r=n-k\), \(u=r/k\), \(x=k/r=1/u\), and let \(Z\) be the normalized zero pattern (binary complement divided by \(r\)). Then \(B=-u(Z-J)\). Let \(s_i\) denote the singular values of \(Z\) after removing one copy of the constant singular direction. They lie in \([0,1]\), and \(\sum_i s_i^2=x\). Since \(u\) stays bounded below one and \(B\) has vanishing maximum row and column Euclidean norms, the [determinant approximation](../real-radius/hilbert_schmidt_limit.md) gives, uniformly on this sequence,
\[
 2\log P(B)=\sum_{\ell\ge1}\frac{u^{2\ell}}{\ell}\sum_i s_i^{2\ell}+o(1). \tag{1}
\]

For a prime circulant, Fourier inversion and [Pollard's energy bound](entropy_codegrees.md) at size \(r\) give
\[
 \sum_i s_i^{2\ell}\le\sum_i s_i^4\le
       \frac{n(2r^3+r)}{3r^4}-1,\qquad \ell\ge2. \tag{2}
\]
Indeed \(\operatorname{tr}((Z^TZ)^2)\) is \(n/r^4\) times the additive energy, and the constant character contributes one.

Write \(x\to x_0>1\). An unrestricted zero pattern can have at least \(a=\lfloor x_0\rfloor\) nonconstant singular values tending to one. When \(x_0\) is nonintegral, choose \(a+1\) balanced classes, each eventually of size at least \(r\), with a regular block in each. When \(x_0\) is integral, use \(a+1\) balanced classes and degree \(r_0=\min(r,\lfloor n/(a+1)\rfloor)\) in each. Complete the graph to degree \(r\) by adding \(r-r_0\) disjoint perfect matchings from its regular complement. The difference of the two normalized matrices in operator norm is at most \(2(r-r_0)/r=o(1)\). This also handles approaching the integer from below. The \(a\) block-constant directions orthogonal to the global constant consequently have singular values tending to one, by the min–max principle.

The right side of (2) tends to \(b=(2x_0-1)/3\), and \(a>b\) for every \(x_0>1\): if \(1<x_0<2\) then \(b<1\), while on \([m,m+1)\) with \(m\ge2\) one has \(b<(2m+1)/3\le m\). For the competitor, the liminf of each moment of order \(2\ell\), \(\ell\ge2\), is at least \(a\). All these moments are bounded by \(x\), and the geometric weights in (1) have uniformly summable tails. The first moment term in (1) is exactly the same on both sides. Comparing the remaining series gives a strictly positive limiting lower bound on the log ratio to the best circulant.

## Vanishing complement density

It remains to handle \(r\ge2\), \(r/k=u\to0\). We need an error smaller than \(u^3\), including for bounded \(r\). Define \(T_4(B)=\operatorname{tr}((B^TB)^2)\). For two binary degree-\(k\) supports with normalized centered matrices \(B,B'\),
\[
 P(B)-P(B')=\left(\frac14+o(1)\right)
             [T_4(B)-T_4(B')]+o(u^3). \tag{3}
\]
All the errors are uniform along the stated regime.

Here are the coefficient details. Write \(\sigma_j(B)\) for the sum of its order-\(j\) subpermanents and \(a_{n,j}=(n)_j/n^j\). Expansion gives \(P(B)=\sum_j\sigma_j(B)/a_{n,j}\). Each row or column has the same multiset of entries, which take the two values \(u/n,-1/n\). For supports with the same \(n,k\), write \(\Delta\) for a difference. Then
\[
 \Delta\sigma_j=0\quad(j\le3),\qquad
 \Delta\sigma_4=\tfrac14\Delta T_4,\qquad
 \Delta\sigma_5=2(u-1)\Delta T_4/n. \tag{4}
\]

For a verification, sum products over ordered lists of \(j\) pairs with distinct row and column labels and divide by \(j!\). Impose row and column distinctness separately by partition-lattice inclusion-exclusion. Any singleton block gives zero by centering. Through order three the only nonconstant-degree terms thus reduce to sums of powers of individual entries. At order four, the partition types without singletons are \(4\) and \(2+2\). If one side is \(4\), uniform line power sums fix the contraction. Two identical pairings also have fixed contraction. The six ordered pairs of distinct pairings give \(T_4\), each with coefficient \(1/24\).

At order five the possible types are \(5\) and \(3+2\). A type \(5\) on either side again gives a fixed contraction. For two \(3+2\) partitions, classify by the intersection size of the two triples. Intersection three gives the product of two entry power sums. Intersection one gives \(\sum_{ij} b_{ij}(\sum_q b_{iq}^2)(\sum_p b_{pj}^2)=0\). Intersection two gives \(\sum_{ipjq}b_{ij}^2 b_{iq} b_{pj} b_{pq}\). The pointwise identity \(b_{ij}^2=(u-1)b_{ij}/n+u/n^2\) and centering reduce this to \((u-1)T_4/n\). There are \(10\cdot6\) such choices and their partition weights are \(4/120\), giving (4).

For order six let \(H=B/\sqrt u\). Then \(\|H\|_F=1\), \(\|H\|_{\rm op}\le\sqrt u\), and the largest row or column Euclidean norm is \(1/\sqrt n\). By the [small-operator coefficient limit](../real-radius/hilbert_schmidt_limit.md), \(P(zH)\to\exp(z^2/2)\) locally uniformly. The sixth coefficient of \(P(zB)\) is consequently \(u^3(1/48+o(1))\), independent to leading order of the support. The uniform coefficient bound in the same proof gives \(|[z^j]P(zH)|\le K\) for every \(j\) once \(\|H\|_{\rm op}\le1/2\) (use \(R=1\)). Thus the entire tail from degree seven is \(O(u^{7/2})\). Together with (4) and \(a_{n,j}\to1\) for fixed \(j\), this proves (3).

For the competitor use \(\lfloor n/r\rfloor\) balanced regular zero blocks. There are at least \(\lfloor n/r\rfloor-1=\lfloor x\rfloor\) nonconstant singular values of \(Z\) equal to one. For the circulant use (2). The fourth-trace gain divided by \(u^3\) is at least
\[
 u\left(\lfloor x\rfloor+1-\frac{(x+1)(2+1/r^2)}3\right)
 \ \ge\ \frac{1-1/r^2}{3}-O(u)
 \ \ge\ \frac14-O(u).
\]
Equation (3) proves strict improvement even when \(r=2\). This completes the prime-order theorem.

Wanless's earlier results answer fixed degree or fixed complement degree at large orders. The live catalogue records thresholds for selected fixed degrees and complete answers on particular lines. Neither statement is uniform over the growing degrees on prime orders. Searches on prime cyclic shifts, maximum permanent, additive energy, sparse and complementary regimes, and the papers linked in the catalogue located no earlier uniform prime-order classification. Historical priority is unverified. [Wanless](https://users.monash.edu.au/~iwanless/papers/complementDM.pdf) · [Cheon and Wanless](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf) · [Pollard](https://doi.org/10.1112/jlms/s2-8.3.460)

The [exact identity checks](verify_prime_identities.py) compare orders four and five of the expansion across 240 integer coefficient arrays, compare the Bernoulli difference formula with direct subset summation, and check the energy bound on 5,199 cyclic supports. The [whole-matrix checker](verify_prime_maxima.cpp) counts every prime-order-17 circulant up to affine relabelling at five selected degrees. For example at degree seven the 75 representatives have largest permanent 246,529,859, while the two-block construction gives 643,559,371. At degree fifteen the values are 45,226,435,601,207 and 45,231,870,581,760. These examples exercise both ends of the argument.
