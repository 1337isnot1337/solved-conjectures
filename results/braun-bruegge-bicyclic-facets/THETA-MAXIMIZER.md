# Braun–Bruegge's theta facet-maximizer conjecture

For every integer \(n\ge10\), the four triples listed in Braun and Bruegge's conjecture attain the maximum number of facets among all three-path graphs of total path length \(n+1\). More explicitly: the lone odd path has length \(1\) when \(n\) is even, the lone even path has length \(2\) when \(n\) is odd, and the two paths of the other parity differ by at most \(2\).

**Source.** Benjamin Braun and Kaitlin Bruegge, [*Facets of Symmetric Edge Polytopes for Graphs with Few Edges*](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf#page=24), J. Integer Seq. 26 (2023), Article 23.7.2, Conjecture 33; [arXiv:2201.13303v4](https://arxiv.org/abs/2201.13303v4), Conjecture 5.3. The question appears in a mixed-parity discussion, but its written statement is not restricted to mixed parity. We cover both readings. Repeated length-one paths are not needed for a simple graph; the formulas below also bound all such algebraic tuples.

## Counts and normalized bounds

For \(m\ge0\), let \(p_m(r)=2^{-m}\binom m{(m+r)/2}\) on integers with the admissible parity and magnitude, and zero otherwise. Write \(P_m=\max_r p_m(r)\). In particular \(p_0(0)=1\). Define \(F(x,y,z)=2^{x+y+z}\sum_r p_x(r)p_y(r)p_z(r)\) for three lengths of the same parity. This is the same-parity facet count from Proposition 22 and Corollary 25(i).

For mixed parity, call the two lengths of the same parity \(a,b\) and the exceptional one \(c\); write \(L=a+b+c=n+1\). The clauses of Corollary 25 give
\[
 N(a,b,c)=ab F(a-1,b-1,c)+c F(a,b,c-1).
\]
This remains correct with a length-one path: a contracted zero-length path enforces the common sum \(r=0\), precisely the product of the central coefficients of the remaining even cycles in Corollary 25(iii)–(v). This convention also covers the displayed tuples with more than one path of length one. Put \(U=2\pi\,2^{-L}N\), and let \(U_2,U_1\) denote the two normalized terms, respectively. Then
\[
 U_2=\frac{\pi ab}{2}\sum_r p_{a-1}(r)p_{b-1}(r)p_c(r),\qquad
 U_1=\pi c\sum_r p_a(r)p_b(r)p_{c-1}(r).
\]

For \(j\ge1\), the elementary Wallis bounds we need are
\[
 \sqrt{\frac{2}{\pi(2j+3/5)}}\le P_{2j}\le \sqrt{\frac{2}{\pi(2j+1/2)}},\qquad
 P_{2j-1}=P_{2j}.
\tag{1}
\]
Indeed \(P_{2j}=4^{-j}\binom{2j}j\), and consecutive terms of \(P_{2j}\sqrt{j+s}\) increase or decrease according as \(j(1-4s)+1-3s\) is positive or negative, by cross-multiplying their squares. At \(s=1/4\) they increase; at \(s=3/10\) they decrease for \(j\ge1\). Both sequences tend to \(1/\sqrt\pi\) by Stirling. The upper bound at \(j=0\) follows from the same increasing sequence; hence in particular
\[
 P_m\le\sqrt{\frac{2}{\pi(m+1/2)}}\quad (m\ge0).
\tag{2}
\]

## Minimum \(c\): exact formula and balancing

For \(c=1\) and even \(a,b\), direct expansion at \(r=0,\pm1\) gives
\[
 N(a,b,1)=\left(\frac{ab}{2}+1\right)\binom a{a/2}\binom b{b/2}.
\tag{3}
\]
For \(c=2\) and odd \(a,b\), write \(A=\binom{a-1}{(a-1)/2}\) and \(B=\binom{b-1}{(b-1)/2}\). The term \(F(a-1,b-1,2)\) is \(2AB[1+(a-1)(b-1)/((a+1)(b+1))]\); the case \(a=1\) or \(b=1\) gives its zero side term. Also \(F(a,b,1)=2AB[2a/(a+1)][2b/(b+1)]\). Therefore
\[
 N(a,b,2)=\frac{4ab(ab+5)}{(a+1)(b+1)}AB
 =\frac{ab+5}{4}\binom{a+1}{(a+1)/2}\binom{b+1}{(b+1)/2}.
\tag{4}
\]

Both counts strictly improve by transferring 2 from the larger of \(a,b\) to the smaller whenever their difference is at least 4. To see this, put \(C_i=\binom{2i}i\). The central-factor product is \(C_iC_j\), with \((i,j)=(a/2,b/2)\) in (3) and \(((a+1)/2,(b+1)/2)\) in (4). If \(i\ge j+2\) and \(d=i-j-1\), the transfer increases \(ij\) by \(d\) and changes the central-factor product by the ratio
\[
 \frac{C_{i-1}C_{j+1}}{C_iC_j}
 =1-\frac d{(2i-1)(j+1)}=1-\frac dQ.
\]
In (3) the other factor is \(2ij+1\); comparison with the transferred product is strict because
\(2Q-(2ij+2d+1)=2ij+2i-1>0\).
In (4) ignore the common factor \(1/4\), and put \(S=i+j\). The other factor is \(4ij-2S+6\). The corresponding difference
\(4Q-(4ij-2S+6+4d)=4ij+6i+2j-6\) is positive. This proves balancing.

For future comparisons, let \(U_*\) be the normalized value at the balanced pair and the parity-minimal \(c\). In (3), put \(x=(L-1)/2=(a+b)/2\). By (1) and \(|a-b|\le2\),
\[
 U_*=\frac\pi2(ab+2)P_aP_b
 \ge \frac{x^2+1}{x+3/5}>x-\frac35=\frac L2-\frac{11}{10}.
\tag{5}
\]
In (4), put \(x=(L-2)/2\). The corresponding bound is
\[
 U_*=\frac\pi2(ab+5)P_{a+1}P_{b+1}
 \ge \frac{x^2+4}{x+8/5}>x-\frac85=\frac L2-\frac{13}{5}.
\tag{6}
\]

## Excluding all other triples for \(L\ge144\)

Same-parity triples have normalized count at most \(2\pi\), since the product of three probability masses sums to at most one. Thus they are strictly below either lower bound (5) or (6) in this range.

Consider now a mixed-parity triple with \(c\) larger than the parity-minimum. By (2), summing away one factor and bounding the other two by their maximum gives
\[
 U_2\le \frac{ab}{\sqrt{(a-\tfrac12)(b-\tfrac12)}}\le\sqrt{(a+1)(b+1)},\qquad
 U_1\le \frac{2c}{\sqrt{(a+\tfrac12)(c-\tfrac12)}}\le\frac4{\sqrt3}\sqrt c .
\tag{7}
\]
In the last bound we can use whichever of \(a,b\) is smaller. The simplifications are \(a^2/(a-1/2)\le a+1\) for \(a\ge1\), \(a+1/2\ge3/2\), and \(c/(c-1/2)\le2\). If one of \(a,b\) is below 10, this gives
\[
 U\le(\sqrt{10}+4/\sqrt3)\sqrt{L+1}
 <\frac{11}{24}(L+1)<\frac L2-\frac{13}{5}\quad(L\ge144).
\]

If \(a,b\) are even and at least \(10\), \(c\) is odd and at least \(3\). Since \(P_{a-1}=P_a\) and \(P_{b-1}=P_b\), the estimate for \(U_2\) improves to
\[
 U_2\le\frac{ab}{\sqrt{(a+\tfrac12)(b+\tfrac12)}}\le\frac{a+b}{2}-\frac25 .
\]
This uses \(a^2/(a+1/2)\le a-2/5\) for \(a\ge2\), and the arithmetic-geometric mean. Keeping \(p_a,p_b\) instead for \(U_1\) gives \(U_1\le c/5\). It follows that \(U\le L/2-2/5-3c/10\le L/2-13/10\), strictly below (5).

Finally, if \(a,b\) are odd and at least \(11\), \(c\) is even and at least \(4\). For all nonzero even \(r\),
\[
 \frac{p_{a-1}(r)}{P_{a-1}}\le \frac{a-1}{a+1},
 \qquad
 \frac{p_{b-1}(r)}{P_{b-1}}\le \frac{b-1}{b+1},
\]
by the centered binomial ratio at \(r=2\) and monotonicity away from zero. The \(p_c\)-probability of \(r\ne0\) is at least \(5/8\), because the even sequence \(P_{2j}\) decreases and \(P_4=3/8\). With \(M_2=ab/\sqrt{(a-1/2)(b-1/2)}\), this improves (7) to
\[
 U_2\le M_2\left(1-\frac58\,\frac{2(a+b)}{(a+1)(b+1)}\right).
\]
The coefficient in parentheses is nonnegative, so substitution of the maximum bounds is legitimate. We have \(M_2\le(a+b)/2+3/5\) by \(a^2/(a-1/2)\le a+3/5\) for \(a\ge3\), while \(M_2\ge\sqrt{ab}\). Consequently
\[
 M_2\,\frac{2(a+b)}{(a+1)(b+1)}
 \ge 4\frac{ab}{(a+1)(b+1)}
 \ge 4(11/12)^2 .
\]
Keeping \(p_a,p_b\) for \(U_1\) gives \(U_1\le2c/11\). Combining these inequalities yields
\[
 U\le\frac L2-\frac{7c}{22}+\frac35-\frac52(11/12)^2
 \le \frac L2-\frac{37}{55}-\frac{605}{288}
 < \frac L2-\frac{13}{5}<U_* .
\]
This exhausts all triples at large total length.

## Finite base, exact arithmetic and priority

[check_maximizer.py](check_maximizer.py) checks every unordered positive triple of total \(11\le L\le143\), including all same-parity triples and the enlarged algebraic domain with duplicate ones. It checks 82,037 triples and finds no ties apart from permuting a proposed triple. It uses only integer binomial coefficients and exact comparisons of the facet counts above. No numeric approximation or maximizer heuristic enters the proof. The large-case argument and the finite base together prove the stated maximizers for every \(n\ge10\).

This is the stronger exact-maximizer conjecture, distinct from the comparison of mixed-parity facet counts to the wedge benchmark \(M(n)\) (journal Conjecture 32). The [prior report on arXiv Conjecture 5.1](https://www.trureturing.org/research/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1/) covers same-parity product sums and their transfers, explicitly not mixed parity. It is not used here. Focused searches by journal/arXiv numbers and the mixed-parity maximum did not locate a prior proof of Conjecture 33. The original paper reports SageMath testing through total length 535; the uniform large-length argument is the part that extends the result to all \(n\).
