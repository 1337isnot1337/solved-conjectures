# Linear Lipschitz retractions of consecutive finite-subset spaces

**Theorem.** For every real or complex normed space \(X\) and every integer \(n\ge2\), there is a convex-hull-preserving Lipschitz retraction
\[
 X(n)\longrightarrow X(n-1)
\]
with Lipschitz constant at most \(1+48(n-1)\), independently of the dimension or completeness of \(X\). Here \(X(n)\) is the space of nonempty subsets of \(X\) with at most \(n\) points, with the Hausdorff metric.

This answers Question 6.5 of [Leonid V. Kovalev, *Lipschitz clustering in normed spaces and barycentric spaces*, arXiv:2610.31555, §6](https://arxiv.org/html/2610.31555v1#S6). His Theorem 1.2 gives a previous \(O(n\log n)\) bound. The order \(n\) cannot be improved for any nonzero normed space, by the \(n-3\) lower bound in his Proposition 6.4, attributed there to [Akofor and Kovalev, Theorem 5.1](https://arxiv.org/abs/2005.13579). This note does not answer Question 6.6 for arbitrary target sizes.

## Construction

For a finite set \(A\), put an edge between distinct vertices at distance at most \(t\), and let \(C_a^A(t)\subset A\) be the component of \(a\) in that graph. For \(t<0\) all components are singleton. For \(|A|=n\) put \(\delta(A)=\min_{a\ne b\in A}\|a-b\|>0\), and define
\[
 T_A(a)=\int_1^2 \operatorname{avg}\bigl(C_a^A(u\delta(A))\bigr)\,du,
 \qquad r(A)=\{T_A(a):a\in A\}.
 \tag{1}
\]
For \(|A|<n\), set \(\delta(A)=0\) and \(r(A)=A\). The integrands in (1) are finite step functions, so the integrals are finite convex combinations in \(X\), including if \(X\) is not complete. Each closest pair lies in the same component for every scale in (1) and hence has equal output. It follows that \(r(A)\) has at most \(n-1\) points and lies in the convex hull of \(A\).

Any connected component \(C\) at scale \(t\ge0\) has diameter at most \((|C|-1)t\): a simple path between two vertices uses at most \(|C|-1\) graph edges. As each \(C_a^A(t)\) contains \(a\), this gives
\[
 d_H(A,r(A))\le 2(n-1)\delta(A).
 \tag{2}
\]

## Stability

Fix \(A,B\in X(n)\), and write \(\epsilon=d_H(A,B)\). If \(\max(\delta(A),\delta(B))\le2\epsilon\), the triangle inequality and (2) give
\[
 d_H(r(A),r(B))\le \epsilon+2(n-1)(\delta(A)+\delta(B))
                  \le (1+8(n-1))\epsilon .
\]
Otherwise swap \(A,B\) if needed so \(\delta=\delta(A)\ge\delta(B)=\delta'\) and \(\delta>2\epsilon\). There is a distance-\(\epsilon\) matching: each of the \(n\) points of \(A\) has a point of \(B\) within \(\epsilon\), and two different points of \(A\) cannot have the same such point. Therefore \(|B|=n\), and we may label the matched points \(a_i,b_i\) so that \(\|a_i-b_i\|\le\epsilon\). This changes every pairwise distance by at most \(2\epsilon\), and consequently \(0\le\delta-\delta'\le2\epsilon\). This is the matching observation also used in Kovalev's Lemma 4.2.

Fix a label \(i\) and \(u\in[1,2]\); set \(t=u\delta\), \(t'=u\delta'\). Regard all components now as sets of labels. Since \(0\le t-t'\le4\epsilon\), comparison of individual edges gives
\[
 S_-:= C_i^A(t-6\epsilon)
   \ \subseteq\ C_i^B(t')\ \subseteq\
 S_+:= C_i^A(t+2\epsilon).
 \tag{3}
\]
The component \(C_i^A(t)\) lies between the same two sets. Used with the \(a\)-positions, the labels \(S_+\) have geometric diameter at most
\((|S_+|-1)(t+2\epsilon)\le 3\delta|S_+|\),
by \(\delta>2\epsilon\). If \(S_-\subseteq S\subseteq S_+\), the mean of the \(a\)-positions on \(S\) differs from the mean on \(S_+\) by at most
\[
 \frac{|S_+|-|S|}{|S_+|}
                 \operatorname{diam}\{a_j:j\in S_+\}
 \le 3\delta (|S_+|-|S_-|).
\]
Apply this twice, to \(C_i^A(t)\) and to \(C_i^B(t')\). Changing the \(a\)-positions to the \(b\)-positions in the latter mean costs at most another \(\epsilon\). Hence the integrand difference in (1) is at most
\[
 \epsilon+6\delta\bigl(m_i(t+2\epsilon)-m_i(t-6\epsilon)\bigr),
 \qquad m_i(v)=|C_i^A(v)|.
\]
The step function \(m_i\) is nondecreasing from \(1\) to \(n\). A jump of size \(j\) contributes at most \(8\epsilon j\) to the integral of \(m_i(t+2\epsilon)-m_i(t-6\epsilon)\) over \(t\in[\delta,2\delta]\), since the jump is included only on an interval of length \(8\epsilon\). Thus, changing variables \(t=u\delta\) yields
\[
 \|T_A(a_i)-T_B(b_i)\|
 \le \epsilon+6\int_\delta^{2\delta}
             \bigl(m_i(t+2\epsilon)-m_i(t-6\epsilon)\bigr)\,dt
 \le (1+48(n-1))\epsilon .
\]
The matched output labels in both directions bound their Hausdorff distance by the same quantity. This proves the theorem.

## Scope and provenance

Single-linkage components and the cut scale already play a central role in Kovalev's Theorem 1.1. His \(\ell^\infty\) construction combines component midranges; those midranges are unavailable in a general normed space. Here ordinary component means preserve the ambient normed space. Their pointwise Hausdorff stability need not be dimension free; the cardinality-increment estimate and integration across the merge thresholds are what give the linear bound. The fallback to identity at smaller cardinalities works because the governing scale is the **first** merge and tends to zero as a set drops below cardinality \(n\). At a cut for general \(k<n-1\), the ordinary means can be sensitive to changes in multiplicities, so this proof does not automatically give the all-target-size bound.

Targeted searches for the exact source identifier and question, independently for better-than-\(n\log n\) consecutive retractions in arbitrary normed spaces, and for this use of component means did not locate an earlier solution. That is not a guarantee of priority.
