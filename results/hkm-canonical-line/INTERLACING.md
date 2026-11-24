# A counterexample to the interlacing clause with both polytopes on the canonical line

[Higashitani–Kummer–Michałek, Conjecture 4.10(ii)](https://d-nb.info/1144744067/34) asks for canonical-line interlacing of the symmetric edge Ehrhart polynomials of a complete multipartite graph and the graph obtained by decrementing a largest part. The conclusion fails even when both polynomials individually have all their roots on the canonical line. Take
\[
G=K_{2,3,3,3,3},\qquad G'=K_{2,2,3,3,3}.
\]
This is a separate witness to the second clause of the same named conjecture, not an additional conjecture. The first clause has the [cocktail-party graph counterexample](PROOF.md).

## Exact counting

The membership characterization in (1) of the companion note applies without changes to all complete multipartite graphs with at least two nonempty parts: \(v\in tP_G\) if and only if its total positive mass is at most \(t\) and each part's absolute mass is at most \(t\). Indeed the argument uses only that all pairs of vertices in different parts are adjacent and any two in the same part have graph distance two.

Write \(A_n(p,q)\) for the number of integer vectors on \(n\) coordinates with positive mass \(p\) and negative mass \(q\). Write \(c(p,j)=\binom{p-1}{j-1}\) if \(p,j>0\), \(c(0,0)=1\), and \(c(p,j)=0\) in the remaining cases. By choosing the disjoint supports and then distributing positive and negative mass into compositions,
\[
A_n(p,q)=\sum_{i,j\ge0,\ i+j\le n}\binom ni\binom{n-i}{j}c(p,i)c(q,j).
\]
For \(N\) vertices and parts \(m_1,\ldots,m_k\), the count is then
\[
E_G(t)=\sum_{s=0}^t A_N(s,s)
-\sum_{j=1}^k\sum_{s=0}^t
 \sum_{\substack{0\le p,q\le s\\p+q>t}}
 A_{m_j}(p,q)A_{N-m_j}(s-p,s-q).
\]
Subtractions are disjoint because two parts of absolute mass greater than \(t\) would force total absolute mass greater than \(2t\).

The [exact checker](check_interlace.py) computes each \(E_G(t)\) through the relevant degree \(d=N-1\) to obtain \(h_j=\sum_{i=0}^j(-1)^i\binom{d+1}{i} E_G(j-i)\). This gives
\[
\begin{aligned}
h_G^*&=(1,143,5558,78206,498295,1627629,2902404,2902404,1627629,
498295,78206,5558,143,1),\\
h_{G'}^*&=(1,122,3974,46114,237849,613572,836892,613572,
237849,46114,3974,122,1).
\end{aligned}
\]

## Exact root placement

As before, shift \(w=2s+1\) and multiply the Ehrhart polynomial by \(2^d d!\). After \(w=iy\), multiply by \(i^{-d}\) and divide by the positive gcd of all integer coefficients. In degree 13 the resulting polynomial is \(y R(y^2)\), and in degree 12 it is \(S(y^2)\), with
\[
\begin{aligned}
R(u)={}&1278059u^6-203796502u^5+9911355597u^4-177499861396u^3\\
 &\quad +1199300771669u^2-3053747869302u+1935804366675,\\
S(u)={}&220013u^6-27129498u^5+972506139u^4-12127443724u^3\\
 &\quad +54197184723u^2-80729265978u+15445462725 .
\end{aligned}
\]
Both Sturm chains have degrees \(6,5,4,3,2,1,0\). At \(u=0\) both sign sequences are \(+,-,+,-,+,-,+\), and at \(+\infty\) they are both \(+,+,+,+,+,+,+\). Both sextics therefore have six distinct positive roots. Thus each original Ehrhart polynomial has all roots on the canonical line and all are simple; the odd-degree one has also the central root.

At \(u=441/100\), the sign sequence of the \(R\) chain is \(-,+,-,+,+,-,+\), with five variations, and the sequence of the \(S\) chain is \(-,-,+,-,-,+,+\), with three variations. Consequently \(R\) has exactly one root in \((0,441/100)\), but \(S\) has three. Thus of the positive ordinates \(y\) on the transformed imaginary axis in the interval \(0<y<21/10\), one comes from \(G\) and three from \(G'\). If they interlaced, there could not be three positive ordinates from \(G'\) before the second positive ordinate from \(G\): the positive roots of \(G'\) must lie in the successive gaps between the central root and the positive roots of \(G\). No disputed endpoints are involved, since no Sturm entry is zero at the tested ordinate. This disproves Conjecture 4.10(ii) separately.

Searches for the graph pair, the original interlacing clause, and later work did not locate this exact prior counterexample. See the companion note for the source, numbering, and related literature. No least-size or exclusive-priority claim is made.
