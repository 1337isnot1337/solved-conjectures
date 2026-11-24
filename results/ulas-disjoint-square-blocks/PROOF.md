# Ulas’s conjecture on products of disjoint blocks

**Theorem.** For every fixed integer \(\ell\ge2\), there is an integer \(R_\ell\) such that for every integer \(r\ge R_\ell\), there are infinitely many collections of exactly \(r\) pairwise disjoint intervals of positive integers, each of length \(\ell\), whose product is a square.

This proves Ulas’s Conjecture 4 (p. 333), which asks for a common block length \(\ell\ge5\) and for every fixed sufficiently large block count, where the threshold can depend on \(\ell\). The proof gives infinitely many distinct collections; it does not require that the least integer used tend to infinity along this family. It does not claim a uniform threshold as the block length grows (Erdős #930), nor does the theorem cover an arbitrary prescribed mixed-length list.

Write \(P_\ell(x)=\prod_{i=1}^{\ell}(x+i)\). The structure of the proof is to construct an infinite family at one fixed cardinality \(r_0\), then fill out all residue classes modulo \(r_0\) using finite square products far away from any fixed initial segment.

## 1. Infinitely many solutions at a fixed cardinality

Choose a positive integer \(A\) with
\[
\sum_{d\mid A}\frac1d>\ell.
\]
This is possible by taking a primorial and using \(\prod_{p\le z}(1+1/p)\to\infty\), which follows from the divergence of the prime reciprocal sum.

For each divisor \(d\) of \(A\), and each \(b=\ell j\) with \(j\ge0\) and \(d(b+\ell)\le N\), consider the vector over \(\mathbb F_2\) whose first \(N\) coordinates indicate the points
\[
\{d(b+1),d(b+2),\ldots,d(b+\ell)\}\subseteq\{1,\ldots,N\}.
\]
Append one coordinate for each prime \(p\mid A\), with entry \(\ell v_p(A/d)\bmod2\). The number of vectors is
\[
\sum_{d\mid A}\left\lfloor\frac{N}{\ell d}\right\rfloor
=\frac N\ell\sum_{d\mid A}\frac1d+O_A(1)>N+\omega(A)
\]
for large \(N\). Therefore a nonempty subset \(\mathcal F\) of the indexed vectors sums to zero. Its cardinality \(r_0\) is fixed.

For each chosen pair \((d,b)\), use the interval of integers
\[
[(A/d)t+b+1,\ (A/d)t+b+\ell].
\]
The corresponding polynomial \(P_\ell((A/d)t+b)\) has roots \(-d(b+i)/A\) for \(1\le i\le\ell\). Every root in the product over \(\mathcal F\) has even multiplicity by the first \(N\) coordinates. The product has positive square leading coefficient, by the appended prime coordinates. Thus it is a square in \(\mathbb Q[t]\). At integer \(t\) its value is an integer and a rational square, hence an integer square.

For different \(d\) the slopes \(A/d\) differ, so the corresponding intervals are disjoint for all sufficiently large \(t\). For equal \(d\), the chosen distinct \(b\)'s differ by at least \(\ell\), so their intervals are always disjoint. All intervals move to infinity as \(t\to\infty\). This supplies infinitely many solutions with exactly \(r_0\) blocks, beyond any prescribed lower endpoint.

## 2. An odd block count is always possible beyond any lower endpoint

We claim that for fixed \(\ell\) there is \(c_\ell>0\) such that every completely multiplicative function \(\chi:\mathbb Z_{>0}\to\{-1,1\}\) satisfies
\[
\#\{0\le n\le X-\ell:\chi(P_\ell(n))=1\}\ge c_\ell X
\tag{1}
\]
for all sufficiently large integers \(X\), uniformly in \(\chi\).

Let \(B\) be the left-hand count and \(G(n)=\chi(P_\ell(n))\). If \(\chi(n+1)\ne\chi(n+\ell+1)\), then \(G(n)\ne G(n+1)\), so one of the adjacent block values is \(+1\). There are at most \(2B\) such indices \(0\le n<X-\ell\). Set \(n=\ell m-1\). By complete multiplicativity, \(\chi(\ell m)\ne\chi(\ell(m+1))\) iff \(\chi(m)\ne\chi(m+1)\). Thus at most \(2B\) adjacent sign changes occur among \(1\le m\le Y=\lfloor X/\ell\rfloor-1\).

By [Granville–Soundararajan, *The spectrum of multiplicative functions*, Corollary 1](https://annals.math.princeton.edu/2001/153-2/p04), the mean of every real completely multiplicative function valued in \([-1,1]\) on an initial segment of length \(M\) is bounded below uniformly by \(-0.656999\ldots+o(1)\) as \(M\to\infty\). In particular \(\#\{m\le M:\chi(m)=1\}\ge c M\) for an absolute \(c>0\) and all large \(M\). Apply this to \(M=Y-\ell+1\). Unless one of the \(\ell-1\) following steps is a sign change, a start \(m\) with \(\chi(m)=1\) gives \(G(m-1)=1\). The exceptional starts are at most \(2(\ell-1)B\). Hence \(B\ge c(Y-\ell+1)-2(\ell-1)B\), yielding (1).

Now fix an integer lower endpoint \(T\). Divide the integers in \((T,X]\) into consecutive cells of a fixed length \(L\), dropping the last partial cell. Choose \(L\) large enough depending only on \(\ell\) that \((\ell-1)/L<c_\ell/4\). In each cell, choose independently and uniformly one interval of length \(\ell\) lying entirely within that cell. They are automatically pairwise disjoint.

By (1), for each fixed sign character \(\chi\) on the primes at most \(X\), extended completely multiplicatively to the positive integers, at least \((c_\ell/2)X\) of the available choices are \(\chi\)-positive for all sufficiently large \(X\) depending on \(T\). Indeed, the discarded initial and terminal parts cost \(O(T+L)\), and the start positions crossing cell boundaries cost at most \((\ell-1)X/L\). All cells have \(L-\ell+1\) equally likely choices. Thus the probability that \(\chi\) is \(-1\) on all chosen block products is at most
\[
\exp\!\left(-\frac{c_\ell X}{2(L-\ell+1)}\right).
\]
There are \(2^{\pi(X)}=\exp(o(X))\) characters on the primes at most \(X\). The union bound shows that for large \(X\), some selected collection admits no \(\chi\) equal to \(-1\) on each block product.

Let \(V\) be the matrix over \(\mathbb F_2\) with one column per selected interval, recording its prime-exponent parities. The all-ones vector does not lie in the row space of \(V\), since such a row functional is exactly a character equal to \(-1\) on every block. As the row space is the orthogonal complement of \(\ker V\), there is an odd-weight vector in \(\ker V\). Its chosen subset is a square product of an odd number of disjoint length-\(\ell\) intervals entirely above \(T\).

## 3. No odd prime divides all available block counts

For completeness, fix an odd prime \(q\) and lower endpoint \(T\). Choose as many disjoint consecutive length-\(\ell\) blocks as possible inside \((T,X]\), so their number \(M=\lfloor(X-T)/\ell\rfloor\). Their exponent parity matrix has at most \(\pi(X)=o(M)\) rows. Its kernel \(C\subseteq\mathbb F_2^M\) therefore has dimension \(k>M/2\) for large \(X\).

A binary linear code of dimension \(k>M/2\) cannot have every weight divisible by \(q\). To see this, select a generator matrix and write its columns as \(c_j\in\mathbb F_2^k\). Let \(N_a\) denote the multiplicity of a column \(a\). If all weights were divisible by \(q\), then for every \(x\in\mathbb F_2^k\),
\[
\sum_{j=1}^M(-1)^{x\cdot c_j}\equiv M\pmod q.
\]
Multiply by \((-1)^{x\cdot a}\) and sum over \(x\). For each \(a\ne0\), character orthogonality yields \(2^k N_a\equiv0\pmod q\). Since \(q\) is odd, each present nonzero column type has multiplicity at least \(q\). There must be at least \(k\) such types because the generator matrix has rank \(k\). Thus \(M\ge qk\), contrary to \(k>M/2\). A square product of disjoint intervals above \(T\) with a number of blocks not divisible by \(q\) follows.

## 4. Fill out all sufficiently large cardinalities

For every integer \(T\ge0\), let \(S_T\subseteq\mathbb Z/r_0\mathbb Z\) consist of the residues of the numbers of blocks of square-product collections above \(T\). The \(S_T\) are nested decreasing subsets of a finite group and all contain zero by §1. Thus they stabilize to a set \(S\).

The stabilized set is closed under addition: realize one residue above the stabilization threshold, then realize the second with every interval above the maximum integer used by the first. The collections are disjoint, and their square products multiply to a square. Since \(S\) is a nonempty subsemigroup of a finite group, it is a subgroup. For each prime \(q\mid r_0\), §§2–3 give a residue in \(S\) not divisible by \(q\), so \(S\) is not contained in any proper subgroup of the cyclic group. Consequently \(S=\mathbb Z/r_0\mathbb Z\).

Choose one fixed finite collection for each residue class, with cardinality \(r_a\) in class \(a\). For any sufficiently large \(r\equiv a\pmod{r_0}\), write \(r=r_a+jr_0\) with \(j\ge1\). Append \(j\) disjoint copies of the polynomial family of §1 to that fixed collection, using parameters \(t,t^2,\ldots,t^j\). For sufficiently large integer \(t\), the polynomial copies are mutually disjoint by their distinct scales and lie above the fixed intervals. Each copy contributes a square product. All solutions are distinct as \(t\) increases, since the largest endpoint tends to infinity. This proves the theorem.

## 5. Attribution and priority boundary

- [Ulas, *On products of disjoint blocks of consecutive integers* (2005), pp. 331–334](https://www.e-periodica.ch/view/ens-001/2005/51/417) gave infinite equal-length solutions at length four for several cardinalities. His [Conjecture 4, p. 333 (publisher OCR)](https://www.e-periodica.ch/download/ens-001:2005:51/ocr-fulltext) fixes a common length at least five and asks for infinitely many solutions at every sufficiently large fixed cardinality. [Bauer–Bennett, *On a question of Erdős and Graham*](https://www.math.ubc.ca/~bennett/Erdos-Graham.pdf), Introduction, records the latter proposed sufficiency and their Theorem 2.2 handles length four. Their Theorem 2.1 gives certain mixed-length cases with blocks of length two or three. [Bennett–van Luijk](https://personal.math.ubc.ca/~bennett/BeVL-Oct18-2011b.pdf), Theorem 1.1, treats length five and every \(r\ge5\); their introduction records a stronger version with prescribed mixed lengths and a threshold depending only on their maximum.
- [Skałba, *Products of disjoint blocks of consecutive integers which are powers* (2003)](https://doi.org/10.4064/cm98-1-1), Theorem 2, proves many numerical solutions when the number of blocks is allowed to vary. It does not supply a fixed cardinality supporting infinitely many solutions at every length, much less all sufficiently large cardinalities. Our first step is its numerical parity idea applied instead to rational affine factors as well as the leading coefficients, and §§2–4 supply the exact-cardinality upgrade.
- [Yıldız–Gürel, *On a Problem of Erdős and Graham* (2020)](https://doi.org/10.1007/s00574-019-00158-9) extends the polynomial-parametrization techniques of Bennett–van Luijk and gives examples at lengths six and seven. These prior results are not a theorem at every fixed length and all sufficiently large fixed cardinalities.
- The recent [literature assessment for Erdős #363](https://erdosproblems.ai/wiki/problems/diophantine_problems/E0363) explicitly distinguishes Skałba's variable-count theorem from the still-open sufficiently-large fixed-count Ulas conjecture. This theorem concerns the latter only. The Erdős–Graham finiteness assertion was already refuted, and the separate problem #930 with \(r\) fixed before the lengths grow is not resolved.
- Independent audit and primary-source comparison inform this draft; further review is welcome. No Lean verification or exhaustive priority claim.
