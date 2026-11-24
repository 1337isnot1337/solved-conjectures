# A reduced exact sum for the terminal-largest class at k=5

This is an exact reduction of the hook formula. The [residue proof](ode-proof.md) uses it to establish the specific differential equation. It replaces three nested shape coordinates by two indices.

Write $a_n=|\mathrm{Av}_n(A_{5,5})|$, and let $C_n=\binom{2n}{n}/(n+1)$. For $3\le t\le n+2$ put
$$
q=n+3-t,\qquad
A_t=\frac{t^2(t-2)(t-1)}{2t-3}\,\frac{\binom{2t-2}{t-1}}{(t!)^2},
\qquad
\beta_t=\frac{(t-2)(t-1)^2}{2(2t-5)}.
$$
Then the exact formula is
$$
a_n=C_n+\frac{n!}{2}\sum_{t=3}^{n+2}
   \frac{(t-3)! A_t}{q!}
   \sum_{a=1}^{q}\binom{q-1}{a-1}\binom{a+t-3}{t-3}(a^2-at+\beta_t).
\tag{1}
$$

For the proof, let $a,b,c$ be the three shifted row lengths of the transposed front shape. The exact hook formula in the companion note gives the Catalan residual from shapes of at most two rows. For each three-row front put $r=n+3-a-b-c\ge0$, allowing $r=0$ too. Sum over all permutations of the three coordinates and divide by six; repeated coordinates contribute zero. The summand apart from $n!/6$ is
$$
\frac{(a+b+c-3)!\,(a-b)^2(a-c)^2(b-c)^2\,abc}
 {r!\,a!^2b!^2c!^2(a+r)(b+r)(c+r)}.
$$
Expand the reciprocals of $(a+r)(b+r)(c+r)$ into partial fractions. By symmetry the three resulting sums coincide; the $a+r$ term cancels the Vandermonde square down to $(b-c)^2(b-a)(c-a)$. Its resulting expression extends by zero to triples with repeated coordinates: even after cancellation, each coordinate pair retains a vanishing difference.

For fixed $a$ and $t=b+c$, set $S_j=\sum_{b+c=t}(bc)^j/(b!^2c!^2)$. The sum over the pair is $(a^2-at)(t^2S_1-4S_2)+(t^2S_2-4S_3)$. The factorial-moment identity
$$
\sum_{b+c=t}\frac{(b)_{u}(c)_{v}}{b!^2c!^2}
=\frac{(t)_{u+v}}{(t!)^2}\binom{2t-u-v}{t-u}
$$
is Chu–Vandermonde, where $(b)_u$ denotes a falling factorial and both sides vanish when $u+v>t$. Expanding $j=1,2,3$ in falling factorials gives $t^2S_1-4S_2=A_t$ and $t^2S_2-4S_3=A_t\beta_t$ by simplification. For $t<3$ the pair contributes zero because $b,c>0$ and $b\ne c$. Finally $a+r=q$, and
$$
\frac{a(a+t-3)!}{q\,a!^2(q-a)!}
=\frac{(t-3)!}{q!}\binom{q-1}{a-1}\binom{a+t-3}{t-3}.
$$
This proves (1). For a fixed coefficient it has $O(n^2)$ summands, compared with $O(n^3)$ shape-length contributions from the direct hook sum.
