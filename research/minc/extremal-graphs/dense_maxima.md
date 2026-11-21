# Circulant maxima when the line sum does not divide the order

Let \(M(n,k)\) be the largest permanent of a binary matrix with all row and column sums \(k\), and \(C(n,k)\) the largest among the circulants. Write \(d_n=n!/n^n\). Fix an integer \(t\ge1\) and \(0<\eta<1\). Uniformly in the band
\[
t\le n/k\le t+1-\eta,\qquad
d=\max\{h:h\mid n,\ h\le t\},
\]
the maxima have the following orders of growth:
\[
\boxed{\displaystyle
\frac{M(n,k)}{k^n d_n}=\Theta_{t,\eta}(n^{(t-1)/2}),\qquad
\frac{C(n,k)}{k^n d_n}=\Theta_{t,\eta}(n^{(d-1)/2}).} \tag{1}
\]
In particular if \(t\nmid n\), the best unrestricted matrix beats **every** circulant by a factor comparable to \(n^{(t-d)/2}\), for all sufficiently large \(n\) in the band. For example at odd orders with \(n/k\) bounded between \(2\) and \(3-\eta\), the factor is comparable to \(\sqrt n\). When \(d=t\), (1) determines the power of \(n\) for both maxima and leaves their exact comparison open. [Minc Problem 4](https://yair-lavi.com/mincs-list/problem-4/) · [Minc Problem 12](https://yair-lavi.com/mincs-list/problem-12/)

## Permanent upper bound from a partition

Write \(J_m\) for the matrix with all entries \(1/m\). We use the [centered coefficient estimate](../real-radius/hilbert_schmidt_limit.md): for fixed \(L<\infty,\rho<1\), every real centered \(B\) with \(\|B\|_F\le L\), \(\|B\|_{\rm op}\le\rho\) satisfies \(|\operatorname{per}(J_m+B)|\le K(L,\rho)d_m\). This is obtained by summing estimate (2) there with \(\rho<R<1\). No row diffuseness or entrywise positivity is needed.

Let \(Q\) be a real positive semidefinite contraction with \(\|Q\|_F\le L\). Let \(E\) average separately over \(h\) classes of sizes \(m_g\), and set \(F=I-E\). If
\[
 I-Q\succeq c F,\qquad c>0, \tag{2}
\]
then
\[
 \operatorname{per}Q\le K(c,L,h)\prod_{g=1}^h d_{m_g}. \tag{3}
\]
Here \(\succeq\) is the positive semidefinite order. For a proof, split the space as \(\operatorname{ran}E\oplus\operatorname{ran}F\), write \(S=E(I-Q)E\) on the first space and \(K_0=FQE\). Positivity of \(I-Q-cF\) gives \(K_0\ker S=0\). Minimizing its quadratic form over the first variable gives
\[
 0\preceq D=FQF+K_0 S^\dagger K_0^T\preceq (1-c)F,\qquad Q\preceq E+D.
\]
The last inequality also follows by completing the square with \(S\). The added positive term has rank at most \(h\) and operator norm at most one, so \(\|D\|_F\le L+\sqrt h\).

Choose \(\epsilon=c/(2h)\). Split \(D=D_>+D_\le\) at eigenvalue \(\epsilon\). The high part has rank at most \((L+\sqrt h)^2/\epsilon^2\). In each class take the span of the restrictions of its eigenvectors and let \(P\) project onto the direct sum of these spans. All these restrictions have zero sum within their class, since \(D=FDF\). Thus \(P\preceq F\), its rank is bounded in terms of \(c,L,h\), and \(D_>\preceq(1-c)P\). For the low part, Cauchy–Schwarz applied to the sum of \(h\) vectors \(D_\le^{1/2}x_g\) gives \(D_\le\preceq h\,\operatorname{blockdiag}(D_\le)\). The block diagonal majorant
\[
 V=(1-c)P+h\,\operatorname{blockdiag}(D_\le)
\]
is centered within each block, has bounded Frobenius norm, and has operator norm at most \(1-c/2\). Now \(Q\preceq E+V\). The permanent is increasing in the positive semidefinite order: up to a fixed normalization it is the quadratic form of the tensor power on the symmetrization of \(e_1\otimes\cdots\otimes e_n\), and tensor powers preserve this order. Apply the centered estimate to each block of \(E+V\). This proves (3).

## A partition for any dense regular support

Normalize a candidate matrix to \(A=G/k\). Each of \(M=AA^T,A^TA\) is positive semidefinite, symmetric and doubly stochastic with entries at most \(1/k\). For \(Q=\sqrt M\), we have \(\|Q\|_F^2=\|A\|_F^2=n/k\) and \(\|Q\|_{\rm op}\le1\). We show along a subsequence that (2) holds for a partition with \(h\le t\) and class sizes comparable to \(n\).

Start with an arbitrary sequence in the stated band, with \(n\to\infty\). Take \(h\) maximal such that on a subsequence there are \(h\) classes of sizes bounded below by a positive multiple of \(n\) and with total crossing weight \(o(n)\) in \(M\). The one-class partition is available. Every class of size \(m\) satisfies \(m\le m^2/k+o(n)\) by the row sums and the entry bound. Hence \(m\ge k-o(n)\); in particular \(h\le t\). This bound holds for any admissible subsequence and justifies the maximum.

On this subsequence choose instead an \(h\)-partition minimizing total crossing weight subject to class sizes at least \(\lfloor n/(3(t+1))\rfloor\). The preceding partitions eventually satisfy this constraint, so the new crossing weight is \(o(n)\). Again every class has size at least \(k-o(n)\). Moving any one vertex is eventually allowed by the size constraint. If a vertex had more weight to another class than to the other vertices in its own class, moving it would decrease the crossing weight. Thus its internal weight including its loop is at least \(1/h\).

In a class, every subset \(U\) of size at most \(k/(2h)\) has weight to the rest of the class at least \(|U|/h-|U|^2/k\ge |U|/(2h)\). For larger \(U\) of at most half the class size there is also a uniform positive lower bound on this weight divided by \(|U|\), along the chosen subsequence. Otherwise both \(U\) and its class complement have macroscopic size and their cut is \(o(n)\) on a further subsequence. Splitting that class would contradict maximality of \(h\).

Reflect each class's external transition probabilities onto the diagonal to obtain an internal symmetric stochastic matrix. The conductance just proved and the finite reversible-chain Cheeger inequality give a uniform positive spectral gap on the orthogonal complement of the constants in each class. Adding back the nonnegative interclass Dirichlet energies shows \(I-M\succeq c'F\). Since \(0\preceq M\preceq I\), scalar functional calculus gives \(I-\sqrt M\succeq (I-M)/2\), as required in (2). The case of one class uses the same argument. [Levin and Peres, Theorem 13.10](https://pages.uoregon.edu/dlevin/MARKOV/mcmt2e.pdf)

By a singular value decomposition and Cauchy–Schwarz on the symmetrized tensor,
\[
 |\operatorname{per} A|\le
 \sqrt{\operatorname{per}\sqrt{AA^T}\;\operatorname{per}\sqrt{A^TA}}.
\]
Apply (3) separately to both matrices, taking further subsequences as necessary. Stirling's formula gives \(\prod_g d_{m_g}/d_n=O(n^{(h-1)/2})\) when \(h\) is fixed. This proves the unrestricted upper bound uniformly: if the ratio to its proposed upper order were unbounded, start the argument with a sequence along which it tends to infinity.

## Why divisors change the circulant bound

For a circulant, identify the step set \(S\) with a \(k\)-subset of \(\mathbb Z/n\). The singular values are the absolute values of \(b_\chi=k^{-1}\sum_{s\in S}\chi(s)\) over the characters, including the trivial character. Parseval gives \(\sum_\chi|b_\chi|^2=n/k\). On a subsequence, arrange the largest \(t+1\) magnitudes in decreasing order and take their limits. At most \(t\) limits equal one. Let \(H_n\) be the characters in these top positions having limit one. Its size \(h\ge1\) is fixed, and every other magnitude is bounded by a fixed \(\rho<1\).

Each character in \(H_n\) is within \(o(1)\) in \(L^2\) of a unit constant on the uniform measure of \(S\): the squared distance to the phase of its mean is \(2(1-|b_\chi|)\). Products and conjugates of two such characters have the same property. The gap \(\rho<1\) then forces closure of \(H_n\) under their quotients for all sufficiently large \(n\). Hence \(H_n\) is a subgroup and \(h\mid n\). Projection onto its character span is exactly averaging on the \(h\) cosets of its annihilator. Both positive square roots in the tensor bound are Fourier diagonal, with eigenvalues \(|b_\chi|\). They satisfy (2) for this projection with \(c=1-\rho\). Thus (3) gives \(O(d_{n/h}^h)=O(d_n n^{(h-1)/2})\), with \(h\le d\). The same subsequence contradiction proves uniformity when \(d\) varies among the finitely many possibilities.

## Matching lower bounds

For the unrestricted maximum, partition \(n\) into \(t\) parts differing by at most one. Every part has size at least \(k\). Each admits a binary \(k\)-regular block, for instance \(k\) consecutive cyclic shifts. Van der Waerden's theorem gives normalized permanent at least \(d_{m_g}\) in each block. Stirling's formula yields the first lower bound. For the circulant choose \(k\) steps in the subgroup of size \(n/d\). Its \(d\) cosets give blocks of equal size, hence normalized permanent at least \(d_{n/d}^d\). This proves (1).

Wanless established eventual component results for fixed degree or fixed complement degree. Brègman's bound in the present normalization gives power \((n/k-1)/2\) up to bounded factors in a compact density band; it does not give the integer and divisor exponents above. The earlier [finite core bound](maximum_core.md) concerns a different range. Searches on dense regular circulant maxima, polynomial factors, divisibility, and maximum permanents on cyclic supports located no previous version of (1) in the sources inspected. Historical priority is unverified. [Wanless](https://users.monash.edu.au/~iwanless/papers/complementDM.pdf) · [McKay and Wanless](https://doi.org/10.37236/1349) · [Cheon and Wanless](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf)
