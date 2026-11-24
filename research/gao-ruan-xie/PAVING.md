# Gao–Ruan–Xie conjecture: all paving matroids

**Status:** General conjecture open; theorem proved below for all paving matroids in arbitrary rank and cardinality. This is partial progress, not a resolution of the whole named conjecture. External review and priority verification remain pending. Issue #300. Research date: 2026-11-23.

## Statement and sources

The inverse Z-polynomial of a matroid is denoted \(Y_M(t)\). Gao, Ruan and Xie, [The inverse Z-polynomial of a matroid](https://arxiv.org/abs/2507.01332), Conjecture 1.5, conjecture that its coefficients are log-concave with no internal zeros. Their Theorem 1.6 proves this for sparse paving matroids. Gao, Li and Xie, [Equivariant inverse Z-polynomials of matroids](https://arxiv.org/abs/2601.17314), Theorem 1.7, give a general paving relaxation formula. We use these published coefficient formulas, not a new definition of the polynomial. Searches through 2026-11-23 located neither a general resolution of Conjecture 1.5 nor a previous proof of the following all-paving result. This is a provisional literature assessment.

**Theorem.** For every paving matroid \(M\), the coefficients of \(Y_M(t)\) are positive and strictly log-concave at every internal index.

This extends the sparse-paving theorem to arbitrary stressed hyperplanes and their distributions. The proof does not assume any bound on rank, cardinality, or the number or size of hyperplanes.

## Proof

Write \(r=\operatorname{rk}M\), \(n=|E|\), and \(y_i=[t^i]Y_M(t)\). The polynomial is palindromic of degree \(r\) by Gao–Ruan–Xie Lemma 2.2. Ranks zero and one give \(1\) and \(1+t\), respectively, after deleting loops as prescribed by the definition. For rank two let \(\ell\ge2\) be the number of rank-one flats. The lattice is that of \(U_{2,\ell}\), and the uniform formula gives \((y_0,y_1,y_2)=(\ell-1,\ell,\ell-1)\), so the assertion holds. Henceforth \(r\ge3\); a paving matroid of this rank is loopless.

Every \((r-1)\)-subset is independent and belongs to exactly one hyperplane. Sum over all hyperplanes \(H\), put \(h=|H|\), \(w_H=\binom{h}{r-1}\), and \(W=\binom{n}{r-1}\). Thus
\[
r-1\le h\le n-1,\qquad \sum_H w_H=W.
\tag{1}
\]
Distinct hyperplanes intersect in at most \(r-2\) elements.

### Coefficients away from the even middle

By GRX Theorem 1.1, for \(0\le i\le\lfloor r/2\rfloor\), the uniform coefficient is
\[
u_i(n)=\binom ni\binom{n-i-1}{n-r}
=W\binom{r-1}{i}\frac{n-r+1}{n-i}.
\]
GLX Theorem 1.7 implies \(y_i=u_i(n)-\sum_{H:h\ge r}u_i(h)\), except when \(r=2k,\ i=k\), which will be handled separately. Extend the summands to \(h=r-1\) by zero, using the displayed rational expression. All denominators are positive in the range under consideration. Subtract using (1) and the identity
\[
\frac{n-r+1}{n-i}-\frac{h-r+1}{h-i}
=\frac{(r-1-i)(n-h)}{(n-i)(h-i)}.
\]
It follows that
\[
y_i=\frac{(r-1)\binom{r-2}{i}}{n-i}f_i,\qquad
f_i=\sum_H w_H\frac{n-h}{h-i}>0.
\tag{2}
\]
In particular these coefficients are positive.

Whenever all three indices \(i-1,i,i+1\) lie in (2)'s range, \(f_{i-1}\le f_i\) and
\[
\frac{f_{i+1}}{f_i}\le\frac{r-1-i}{r-2-i}
\]
since \(h\ge r-1\), and each individual summand ratio is \((h-i)/(h-i-1)\). Combining with the adjacent-binomial ratio yields
\[
\frac{y_{i-1}y_{i+1}}{y_i^2}
\le\frac{i}{i+1}\frac{(n-i)^2}{(n-i)^2-1}<1.
\tag{3}
\]
The strict inequality is equivalent to \((n-i)^2>i+1\). It holds because \(1\le i\le\lfloor r/2\rfloor-1\) and \(n\ge r\).

For odd \(r=2k+1\), all lower-half indices satisfy (2). At the center, \(\binom{r-2}{k}=\binom{r-2}{k-1}\), so
\[
\frac{y_k}{y_{k-1}}=\frac{n-k+1}{n-k}\frac{f_k}{f_{k-1}}>1.
\]
With \(y_k=y_{k+1}\) and symmetry, this finishes odd ranks, including \(r=3\).

### Even rank: central increment

Let \(r=2k\ge4\) and \(C=\binom{2k-1}{k}\). The exceptional middle term in GLX Theorem 1.7 for a hyperplane of size \(h\ge2k\) is
\[
\delta_h=\frac{4h}{(2h-2k)(2h-2k+2)}
\binom{h-1}{k,k-1,h-2k}.
\]
Direct factorial cancellation gives
\[
\frac{\delta_h}{w_H C}
=\frac{h-2k+1}{(h-k)(h-k+1)}.
\]
Consequently \(u_k(h)-\delta_h=u_{k-1}(h)\), including the zero extension at \(h=2k-1\). The middle increment is independent of the hyperplane distribution:
\[
J:=\frac{y_k-y_{k-1}}C
=W\frac{n-2k+1}{(n-k)(n-k+1)}>0.
\tag{4}
\]
This proves strict log-concavity at the central index and positivity of \(y_k\). Only the index \(k-1\) and its reflection remain. With
\[
A=y_{k-1}/C=\frac{k f_{k-1}}{n-k+1},\qquad
B=y_{k-2}/C=\frac{(k-1) f_{k-2}}{n-k+2},
\]
we need \(A/B>1+J/A\). Since \(f_{k-1}\ge f_{k-2}\),
\[
\frac AB-1\ge\frac{n+1}{(k-1)(n-k+1)},\qquad
\frac JA=\frac{W(n-2k+1)}{k(n-k)f_{k-1}}.
\tag{5}
\]
It suffices to establish
\[
\frac{f_{k-1}}W\ge\frac{n-2k+2}{n}.
\tag{6}
\]
Indeed, substituting (6) in (5), the desired strict comparison reduces to positivity of
\[
(n-2k+2)k(n-k)(n+1)-n(n-2k+1)(k-1)(n-k+1).
\]
Writing \(n=2k+t\), this is
\[
2k^3+4k^2t+2k^2+4kt^2+6kt+2k+t^3+2t^2+t>0
\]
for \(k\ge2,t\ge0\).

### The hyperplane bound

To prove (6), put \(T=n-2k+2\), \(d=2k-1\), and let \(H_0\) have largest cardinality \(n-s\), so \(s\ge1\). The quantity on the left in (6) is the weighted average of \(g(h)=(n-h)/(h-k+1)\), with weights \(w_H/W\).

If \(s\ge T/2\), all \(h\le n-T/2\); the decreasing function \(g\) satisfies
\[
g(h)\ge\frac{T/2}{n-T/2-k+1}=\frac Tn.
\]
Suppose instead \(s<T/2\). Each other hyperplane meets \(H_0\) in at most \(2k-2\) elements and hence has size at most \(s+2k-2\). Thus
\[
g(|H_0|)=a:=\frac{s}{T+k-1-s},\qquad
g(|H|)\ge b:=\frac{T-s}{s+k-1}\quad(H\ne H_0),
\]
where \(b>a\) because \(s<T/2\).

Choose a uniform random \(d\)-subset of the ground set and let \(X\) count elements outside \(H_0\). Then
\[
p=\Pr(X>0)=1-w_{H_0}/W.
\]
By Cauchy–Schwarz, \(p\ge (\mathbb EX)^2/\mathbb EX^2\). The hypergeometric first and second factorial moments give
\[
\mathbb EX=\frac{ds}{n},\quad
\mathbb E[X(X-1)]=\frac{d(d-1)s(s-1)}{n(n-1)}.
\]
Consequently
\[
p\ge\frac{B_0}{A_0},\qquad
A_0=n(n-1+(d-1)(s-1)),\quad B_0=ds(n-1).
\]
The weighted average is therefore at least \(a+(b-a)B_0/A_0\).

For completeness, the algebra showing that this lower bound is at least \(T/n\) is as follows. Multiply their difference by the positive denominator \(nA_0(T+k-1-s)(s+k-1)\). Set \(u=T-2s>0\), so \(n=2k+2s+u-2\). The numerator factors exactly as
\[
u(k-1)(k+2s+u-1)(2k+2s+u-2)
\left(2s(k-2)+2s^2+(2s-1)u+1\right)>0.
\]
Every factor is positive under \(k\ge2,s\ge1,u>0\). This proves (6) in the remaining case.

The adjacent even-middle determinant is now strictly positive by (4)–(6); the other determinants are positive by (3) and palindromicity. This completes the proof.

## Audit and limitations

- The exceptional even coefficient is included explicitly; ignoring its correction would give an incomplete proof.
- Rank two is treated by the number of parallel classes, not the number of ground-set elements. Rank zero and one are treated separately.
- Equation (1) is a partition of all independent \((r-1)\)-subsets, including those in hyperplanes of minimum size \(r-1\).
- The proof uses the two published coefficient formulas. Both algebraic expansions are checked symbolically by the companion script; 224 deterministic, exact, small paving-lattice cases independently recompute the ordinary KL polynomial by palindromicity of Z, its incidence-algebra inverse, and Y from its definition. All agree with the relaxation formula and are strictly log-concave. These finite checks are auditing aids, not the proof of the universal claim.
- Direct sums of such matroids also have positive log-concave Y by multiplicativity and preservation of log-concavity under convolution. This does not establish the conjecture for arbitrary matroids.
- Do not count this as a resolution of GRX Conjecture 1.5. General non-paving matroids remain unaddressed. No claim of Lean verification or independent expert acceptance.
