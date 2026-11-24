# Bounded-error threshold on the mixed group

The [elementary proof](PROOF.md) resolves Ma–Tang Problem 4.1. This supplement improves the remainder there. The first refinement is self-contained; the sharper one uses Yang Yu's four-basis theorem in characteristic three.

**Theorem.** Let \(N=3\cdot2^d\). Using Yu's theorem,
\[
 f(N)=\log_2 N+\log_2\log N+O(1).
\tag{1}
\]
Without Yu, the argument below gives the explicit lower bound
\[
 f(N)\ge \log_2 N+\log_2\log N-\log_2\log\log\log N-O(1).
\tag{2}
\]
Both use the same group \(\mathbb F_2^d\times\mathbb F_3\). The upper bound in (1) holds universally by Erdős–Rényi.

## 1. A partial Walsh-spectrum extension criterion

For \(m=2^r\) and a set of frequencies \(B\subseteq\mathbb F_2^r\), set \(b=|B|\) and let
\[
 v(t)=\big((-1)^{a\cdot t}\big)_{a\in B}\in\mathbb F_3^B
 \qquad(t\in\mathbb F_2^r).
\]
If \(b=0\), any Boolean-valued function meets the zero constraints. Otherwise, these columns span \(\mathbb F_3^B\): the Walsh rows are mutually orthogonal under summation over \(t\), and each squared norm is \(m\ne0\) in \(\mathbb F_3\). A set of basis columns \(\{v(t):t\in I\}\) thus exists. Every translate \(I+s\) is also a basis since translation multiplies each row by \((-1)^{a\cdot s}\).

**Elementary form.** If \(m/b\ge\log_2 b+2\), then the columns form an additive basis: each element of \(\mathbb F_3^B\) is the sum of some subset of the columns. To see this, let \(X_t\in\{0,1\}\) be independent fair bits and set \(Z=\sum_t X_t v(t)\). The absolute value of the Fourier coefficient at \(\xi\in\mathbb F_3^B\) is
\[
 |\widehat{\mathcal L(Z)}(\xi)|=2^{-w(\xi)},\qquad
 w(\xi)=\#\{t:\xi\cdot v(t)\ne0\},
\]
since the nontrivial third-root average with 1 has absolute value \(1/2\). Let \(w_s(\xi)\) count the nonzero pairings over \(I+s\); each \(t\) is in \(b\) such translates, so \(\sum_s w_s=bw\). Hölder over the \(m\) translates gives
\[
 \sum_{\xi\ne0} 2^{-w(\xi)}
 \le \prod_s\left(\sum_{\xi\ne0}2^{-(m/b)w_s(\xi)}\right)^{1/m}
 = (1+2^{1-m/b})^b-1<1.
\]
The equality uses the basis property: the \(b\) pairings are an invertible linear transformation of \(\xi\), and each nonzero ternary coordinate has two choices. The strict inequality follows from \(b\,2^{1-m/b}\le1/2\) and \(e^{1/2}<2\). Fourier inversion then gives strictly positive probability at every \(Z\).

**Four-basis form.** If \(m/b\ge4\), the same conclusion follows from [Yang Yu, *Note on the Additive Basis Conjecture*, arXiv:2510.01300v2](https://arxiv.org/html/2510.01300v2), Theorem 3 and its additive-basis consequence. For each \(S\subseteq\mathbb F_2^r\), the rank of the columns in \(S\) is at least \(|S|b/m\): each \(|(I+s)\cap S|\) is at most this rank, and the mean of the intersection sizes equals \(|S|b/m\). Hence
\[
 |\mathbb F_2^r\setminus S|\ge (m/b)\big(b-\operatorname{rank}(S)\big)
 \ge4\big(b-\operatorname{rank}(S)\big).
\]
By Edmonds's matroid base-packing theorem there are four disjoint bases among the indexed columns. (The same conclusion also follows directly from the minimum-support condition in Yu, Theorem 7(A).) Yu's result gives the asserted coverage. Explicitly, for a target \(z\) this permanent-rank conclusion supplies a nonzero squarefree term of degree \(2b\) in \(\prod_{i=1}^b [1-(L_i(X)-z_i)^2]\), where \(L_i(X)\) is the \(i\)-th coordinate of the sum of the indexed columns weighted by \(X\). The Combinatorial Nullstellensatz gives a Boolean \(X\) on which that polynomial is nonzero, exactly a subset sum hitting \(z\).

Thus both forms show that any prescribed values on \(B\) can be realized by the unnormalized Walsh coefficients
\[
 \widehat f(a)=\sum_t f(t)(-1)^{a\cdot t}
\]
of some function \(f:\mathbb F_2^r\to\{0,1\}\), regarding the sums as elements of \(\mathbb F_3\).

## 2. The exceptional frequencies and a missing residue

Use the random variables in the [base proof](PROOF.md): the \(r\)-dimensional kernel is represented by independent uniform column types \(\ell_j\in\mathbb F_2^r\) conditioned on full rank, and the \(c_j\in\mathbb F_3\) are independent. Conditioning costs \(o(1)\) as before. Let \(B\) consist of the nonzero frequencies whose bin \(\{j:\ell_j=a,\ c_j\ne0\}\) has size zero or one. Each bin count has distribution \(\mathrm{Bin}(k,2/(3m))\) before conditioning.

A feasible partial spectrum has \(\widehat f(a)=0\) at empty bins and \(\widehat f(a)=1\) at singleton bins, for \(a\in B\). Under either extension criterion choose a Boolean function \(f\) with this partial spectrum. In the fiber formula (5) from the base proof, choose the signs \((-1)^{u_j}\) so that at each nonzero frequency the signed inner sum equals \(\widehat f(a)/m\) in \(\mathbb F_3\). This is the coefficient itself, since \(-1/2=1\) in \(\mathbb F_3\). This is possible at empty and singleton bins by the specified values and \(m=\pm1\bmod3\). At every bin with at least two nonzero terms their signed sum runs over all three residues, since two independent signs contribute \(2,0,-2\) and the remaining signs may be fixed arbitrarily. Coefficients for different bins are independent choices. The zero-frequency coefficient need not be matched. By Walsh inversion the resulting second-coordinate value equals \(f(t)\) plus a constant in \(\mathbb F_3\), so it omits at least one residue throughout this full first-coordinate fiber. Coverage therefore fails.

For (2), take \(r=\lfloor\log_2(d/(10\log\log d))\rfloor\) and \(k=d+r\). Write \(\lambda=2k/(3m)\). The binomial probability of size at most one is at most \((1+\lambda e^{2/(3m)})e^{-\lambda}\). Here \(\lambda\ge(20/3)\log\log d\), and thus \(\mathbb E b\ll m(\log\log d)/(\log d)^6\) (the expression is decreasing in this range). By Markov, \(b\le m/(\log d)^2\) with probability \(1-o(1)\). The elementary extension criterion applies. Formula (2) follows by taking logs as in the base proof, noting that \(\log\log d=\log\log\log N+o(1)\).

For (1), take \(r=\lfloor\log_2(d/100)\rfloor\) and \(k=d+r\), so \(m\asymp d\) and \(\lambda\ge 200/3\). Thus \(\mathbb E b\le m/100\) for large \(d\). Changing one pair \((\ell_j,c_j)\) changes at most two bin indicators; the Efron–Stein variance bound gives \(\operatorname{Var} b\le2k=O(m)\). Consequently \(b\le m/4\) with probability \(1-o(1)\), and the four-basis form applies. This remains true after conditioning on the relevant ranks and distinctness in the original subset sample. Coverage therefore fails with probability \(1-o(1)\) at \(k=d+\log_2d-O(1)=\log_2 N+\log_2\log N-O(1)\). The universal upper bound of Erdős and Rényi, *Probabilistic methods in group theory* (1965), [Theorem 2](https://www.renyi.hu/~p_erdos/1965-15.pdf), completes (1).

The characteristic-three input is used only for the bounded remainder in this supplement. The main limsup theorem, and even (2), are independent of that preprint.

## 3. Many missing points, and arbitrary fixed odd factors

The original constant-fiber proof also gives a quantitative count of missing points, without the four-basis input. At its choice \(r=\lfloor\log_2(d/(10\log d))\rfloor\), with high probability no nonzero-frequency bin has exactly one occupied index. For a bin of size \(s\ge2\), the number of sign patterns with vanishing sum in \(\mathbb F_3\) is
\[
 \frac{2^s+2(-1)^s}{3}\ge\frac{2^s}{4}.
\]
This follows by filtering through the three additive characters, since the two nontrivial character sums of a single signed \(\pm1\) are \(-1\). The inequality for odd \(s\) uses \(s\ge3\); the even case is immediate. Thus at least \(2^k4^{-(m-1)}\) vectors \(u\in\mathbb F_2^k\) satisfy all balance conditions, with the signs of \(c_j=0\) and the zero-frequency bin unrestricted. Balancing is invariant under translation by \(K\), since translating by a kernel vector multiplies all signs in a bin by the same sign. Each constant fiber consists of \(m=2^r\) vectors; each misses two distinct group elements. Hence at least \(2^{d+1}4^{-(m-1)}\) group elements are absent, with high probability. This is \(N\exp(-O(\log N/\log\log N))\) along \(N=3\cdot2^d\).

For any fixed nontrivial finite abelian group \(H\) of odd order, the constant-fiber proof generalizes to \(\mathbb F_2^d\times H\). Choose the \(c_j\) uniformly in \(H\). Independently for each nonzero-frequency bin, further divide its occupied indices by the nonzero sign class \(\{c,-c\}\) of \(c_j\). For a fixed type and class the count is \(\mathrm{Bin}(k,2/(m|H|))\). Take \(m=2^r\asymp_H d/\log d\) with sufficiently small proportionality constant. With high probability all positive sub-bin counts are at least the maximum order of an element of \(H\). Indeed the mean of each count is at least \(C_H\log d\), and a union bound over \(O_H(m)\) sub-bins and each fixed smaller count is \(o(1)\) for large \(C_H\). In each nonempty sub-bin, the assigned terms can freely be \(c\) or \(-c\). Use opposite pairs for even counts; if the count is odd, take \(\operatorname{ord}(c)\) copies of \(c\), then pair the rest. Thus the signed sums vanish on all nonzero frequencies. Formula (5) still holds in \(H\) by interpreting multiplication by \(1/2\) as the inverse of the automorphism \(h\mapsto2h\). A whole first-coordinate fiber reaches just one of \(|H|\) points. This gives the elementary second-order lower bound with the same \(-\log_2\log\log N-O_H(1)\) error along \(N=|H|2^d\). The bounded-error refinement above uses \(H=\mathbb F_3\).
