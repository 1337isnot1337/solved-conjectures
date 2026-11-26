# Gravgaard–Lee’s large-digit Lüroth sumset conjecture

**Theorem.** For all integers $k\ge2$,
```math
 \left(0,\frac1{k-1}\right]\ \subseteq\ L_{\ge k}+L_{\ge k},
```
where $L_{\ge k}$ consists of real numbers with infinite Lüroth expansions all of whose digits are at least $k$. The two expansions can be chosen so that their digits are strictly increasing even when interleaved. This proves [Gravgaard–Lee, Conjecture 2.12](https://arxiv.org/html/2506.12513v2#S2.SS2).

## Proof

For a current Lüroth prefix, write $s$ for its truncated value and $P$ for its positive remaining scale, initially $(s,P)=(0,1)$. Appending digit $d$ adds $P/d$ to $s$ and replaces $P$ by $P/[d(d-1)]$. This is the Lüroth series formula.

We build two prefixes whose sum approaches a given $x\in(0,1/(k-1)]$ from below. Let $z>0$ be the difference between $x$ and the sum of their current truncated values. On a prefix with scale $P$, whenever $0<z\le P$, select
```math
 d=\left\lfloor \frac Pz\right\rfloor+1
 \quad\Longrightarrow\quad
 \frac P d\lt z\le\frac P{d-1}.
```
Thus the new residual $z'$ and the new scale $P'$ satisfy
```math
 0\lt z'=z-\frac P d\le P'=\frac{P}{d(d-1)}
 \quad\text{and}\quad z'\le\frac zd.
 \tag{1}
```
The first estimate uses $z\le P/(d-1)$. The second uses $P\ge(d-1)z$. The strict inequality ensures that even when $P/z$ is an integer the residual stays positive; the construction does not terminate.

Initially $z=x\le 1$ is at most both scales. Whenever the residual is at most both scales, (1) bounds the new residual by the updated scale and, since $z'\le z$, also by the unchanged one. This maintains the invariant. Moreover, if we update the other scale $Q$ next, its next digit is at least $d+1$, because
```math
 \frac Q{z'}\ge \frac z{z'}\ge d.
```
The very first digit is at least $k$ because $1/x\ge k-1$. Alternating forever therefore gives two infinite digit strings with interleaved digits strictly increasing from a value at least $k$. Their truncated values converge to their Lüroth series values, and the residual tends to zero by $z'\le z/d\le z/2$, so those two series sum to $x$.

Both series give genuine Lüroth expansions in the source's convention. An infinite string of digits at least $2$ gives each tail in $(0,1]$: positivity is immediate, and the upper bound follows because every $f_d(t)=1/d+t/[d(d-1)]$ preserves $[0,1]$. Thus a digit $d$ places the number in $(1/d,1/(d-1)]$, exactly its digit interval. In particular, the proof does not introduce zero or any finite expansion to obtain the asserted inclusion. The included set has intervals of positive length, as desired. $\square$

## Source and scope

The primary source is Gravgaard and Lee, [*Decomposition of real numbers into sums of Lüroth sets*](https://doi.org/10.1142/S1793042126500958), *International Journal of Number Theory* 22 (2026), 1931–1968; exact statement in [arXiv v2, §2.2](https://arxiv.org/html/2506.12513v2#S2.SS2). Their Theorem 2.11 proves Hausdorff dimension one, not interval containment. Their discussion immediately preceding it gives a counterexample to a direct use of [Shulga's continued-fraction construction](https://arxiv.org/html/2411.17379v2#S3) with the intended Lüroth digit bounds. The proof here uses positive Lüroth prefix increments and updates both sides from below, using the residual bound (1) to control both prefix scales.

Searches for the exact conjecture, arXiv identifier, journal title and authors, and for two-summand Lüroth decompositions with a uniform lower digit bound did not surface a prior proof of this claim. This is a bounded priority check, not an assertion that no earlier proof exists. The result does not settle the mixed upper/lower-bounded conjecture (Conjecture 2.6).

Gravgaard’s later [2026 PhD thesis, Chapter 4, PDF page 85](https://data.math.au.dk/publications/phd/2026/math-phd-2026-mbg.pdf#page=85) also lists the conjecture without a proof.
