# Erdős’s perturbed-squares irreducibility conjecture: a logarithmic-loss theorem

Let $Q=\{n^2:n\ge0\}$. For $R\subset\mathbb Z_{\ge0}$ define
\[
 e(X)=|(R\triangle Q)\cap[0,X]|.
\]
For any fixed $0<\kappa<K$, where $K$ is the Landau–Ramanujan constant, if, for every sufficiently large $X$,
\[
 e(X)\le \kappa\frac{\sqrt X}{\sqrt{\log X}},
\]
then $R$ has no representation $A+B$ with $A,B\subset\mathbb Z_{\ge0}$ and $|A|,|B|\ge2$. This also rules out eventual equality to such a nonnegative-factor sumset, since a finite symmetric difference can be absorbed by replacing $\kappa$ with any larger constant still below $K$.

This is partial progress toward Erdős's conjecture, which allows $e(X)=o(\sqrt X)$ without the logarithmic loss. [Yip's Combinatorica article, §1](https://arxiv.org/html/2501.16620v3#S1) states the conjecture and cites the previous bound of [Sárközy and Szemerédi, *On the sequence of squares*, Matematikai Lapok 16 (1965), 76–85, Theorem II](https://real-j.mtak.hu/9363/1/MTA_MatematikaiLapok_1965.pdf#page=78), which allows $e(X)=o(\sqrt X/2^{(3+\epsilon)\log X/\log\log X})$. The original article formulates total primitivity (including eventual equality). The stray $k$ in Yip's displayed Conjecture 1.1 plays no role in the assertion about squares. The old proof's square-swap count is explicitly reused below. The new step is combining it with scale- and gap-sensitive bounds on both sides of the square-incidence graph. No earlier proof at this bound was found in the sources checked; this does not settle the full conjecture.

## 1. Two elementary graph facts

Suppose $R=A+B$ and put $D(T)=\max_{1\le d\le T}\tau(d)=T^{o(1)}$, using the usual divisor bound. For any two distinct fixed members $b,b'$ of $B$, the number of $a$ such that $a+b$ and $a+b'$ are both squares is at most $\tau(|b-b'|)$: factor their difference as $(v-u)(v+u)$ with nonnegative roots $u<v$. Hence any graph of square sums on $m$ distinct $A$-vertices and $n$ distinct $B$-vertices in $[0,T]$ has edge count $g$ satisfying
\[
 g\le m+n\sqrt{mD(T)},\qquad
 g\le n+m\sqrt{nD(T)},\qquad
 g\le m+n+\sqrt{D(T)}(mn)^{3/4}.
\tag{1}
\]
Indeed $\sum_{a}\binom{\deg(a)}2\le\binom n2 D(T)$ and Cauchy–Schwarz give the first; the other orientation gives the second. If $g>m+n$, bound the positive remainder by the geometric mean of the two nonlinear upper bounds to get the third; otherwise the third is immediate.

Write $A(t)=|A\cap[0,t]|$, and similarly for $B$. Fix two distinct $b,b'\in B$. For all but finitely many $a$, at least one of $a+b,a+b'$ is nonsquare, and each nonsquare value occurs from at most two $a$ under those two fixed shifts. Thus
\[
 A(t)\le 2e(t+O(1))+O(1),\qquad B(t)\le 2e(t+O(1))+O(1).
\tag{2}
\]
If $e(t)=o(\sqrt t)$, a fixed positive fraction of the squares up to $t$ are present for large $t$. Their representations use vertices in $[0,t]$, so one may choose at least $(1-o(1))\sqrt t$ square edges. Let $m=\max(A(t),B(t))$ and $n=\min(A(t),B(t))$. Then $m=o(\sqrt t)$, and the first inequality of (1) gives $n\ge t^{1/4-o(1)}$. In particular both sets are infinite.

## 2. The Sárközy–Szemerédi swap forces one very large part

By the classical Landau–Ramanujan theorem, there are $(K+o(1))t/\sqrt{\log t}$ positive integers up to $t$ that are sums of two nonnegative squares, for a constant $K>0$. Any such sum uses squares at most $t$. Let $e_-(t)$ count missing squares and $e_+(t)$ count added nonsquares, so $e=e_-+e_+$. If we remove $e_-(t)$ squares, we lose at most $e_-(t)(\lfloor\sqrt t\rfloor+1)$ distinct sums of two squares. Let $S_t=(R\cap Q)\cap[0,t]$. Under the hypothesis with $\kappa<K$,
\[
 |(S_t+S_t)\cap[0,t]|\gg t/\sqrt{\log t}.
\tag{3}
\]

For each $s\in S_t$ fix one representation $a_s+b_s=s$. For every distinct sum $w=s+s'$ in (3), choose one pair of such squares, and swap its two $B$-coordinates:
\[
 w=(a_s+b_{s'})+(a_{s'}+b_s).
\]
Both crossed outputs are nonnegative and sum to $w\le t$, so both lie in $R\cap[0,t]$. If either is nonsquare, $w$ is in the sumset of the nonsquare part of $R\cap[0,t]$ with $R\cap[0,t]$. There are at most $e_+(t)(\lfloor\sqrt t\rfloor+1+e_+(t))$ such values. This and the missing-square contribution together are at most $e(t)(\lfloor\sqrt t\rfloor+1)+e_+(t)^2\le (\kappa+o(1))t/\sqrt{\log t}$. Thus $\gg t/\sqrt{\log t}$ values have both crossed outputs square.

If $a_s\ne a_{s'}$, fix the ordered pair of $A$-coordinates. The two pairs of squares $(s,a_{s'}+b_s)$ and $(a_s+b_{s'},s')$ have the same fixed nonzero difference, so for those coordinates there are at most $D(2t)^2$ choices for $w$. If $a_s=a_{s'}$ and $b_s\ne b_{s'}$, fixing the ordered pair of $B$-coordinates gives at most $D(2t)$ choices for the pair $(s,s')$, by their fixed nonzero difference. If both coordinate pairs agree, $s=s'$ and there are $O(\sqrt t)$ sums. It follows that
\[
 A(t)^2D(2t)^2+B(t)^2D(2t)+O(\sqrt t)\gg t/\sqrt{\log t}.
\]
Consequently $\max(A(t),B(t))\ge t^{1/2-o(1)}$. Together with §1 this gives, for all sufficiently large $t$,
\[
 A(t)B(t)\ge t^{3/4-o(1)}.
\tag{4}
\]

The Landau–Ramanujan input can be replaced by elementary square energy if one assumes $e(X)=o(\sqrt X/\log X)$. Indeed the energy of squares up to $t$ is $O(t\log t)$: write $u_1^2+u_2^2=u_3^2+u_4^2$ as equality of two products of integers of magnitude $O(\sqrt t)$. The zero-product cases contribute $O(t)$. For positive products $ab=cd$ with all values at most $M=2\sqrt t$, write $a=gr,c=gs$ with $r,s$ coprime and $b=su,d=ru$. Counting $g,u\le M/\max(r,s)$ and then summing over $\max(r,s)$ gives $O(M^2\log M)$. Cauchy–Schwarz then gives $|S_t+S_t|\gg t/\log t$, enough for the same swap argument (changing the cutoff $w\le t$ to $w\le2t$).

## 3. Local isolation contradicts (4)

Take the squares in $[X/2,X]$ that lie in $R$ and have no other element of $R$ within $\delta\sqrt X$, with a fixed sufficiently small $\delta>0$. There are $\gg\sqrt X$ of them: distinct squares in the relevant interval are separated by more than $2\delta\sqrt X$, and each nonsquare in $R\cap[0,2X]$ can spoil at most one. For each such isolated square choose one pair $(a,b)\in A\times B$ summing to it. Each chosen coordinate is itself isolated inside its own set at distance $\delta\sqrt X$: any other element closer than that, added to the opposite fixed coordinate, would give an element of $R$ too close to the isolated square.

Count first pairs with $a\ge b$, so $a\ge X/4$. Split $b$ into dyadic bins $[Y,2Y)$, $Y$ a power of two; place $b=0$ in a separate finite bin. Write $m_Y,n_Y$ for the numbers of used $A$- and $B$-vertices in the bin. Let $h_T=\delta\sqrt T/2$. For each used $a$, the set $a+(B\cap[0,h_X])$ consists of $B(h_X)$ distinct sums; the sets for different used $a$ lie in disjoint intervals $[a,a+h_X]$, and each interval contains at most one square by $a\ge X/4$. These sums are all at most $2X$. Thus
\[
 m_Y\bigl(B(h_X)-1\bigr)\le e(2X).
\tag{5}
\]
Likewise the different used $b$ in a dyadic bin have disjoint intervals $[b,b+h_Y]$ with at most one square each (since $b\ge Y$). They lie in $[0,3Y]$ and contain $b+(A\cap[0,h_Y])$, yielding
\[
 n_Y\bigl(A(h_Y)-1\bigr)\le e(3Y).
\tag{6}
\]
For every sufficiently large $Y$, both factor counts in the denominators are at least 2, by §1. For the finitely many remaining bins, including zero, $n_Y=O(1)$ so their total edge count is $o(\sqrt X)$ by (5) and $e(2X)=o(\sqrt X)$.

Since $Y\le X$ and $B(h_X)\ge B(h_Y)$, equations (4)–(6) give for large dyadic $Y$
\[
 m_Yn_Y\ll \frac{e(2X)e(3Y)}{A(h_Y)B(h_Y)}
 \le X^{1/2}Y^{1/8+o(1)}.
\tag{7}
\]
Here we only used $e(T)=O(\sqrt T)$ in the numerator, and $h_Y\asymp\sqrt Y$. The $o(1)$ exponent may equivalently be replaced by any fixed small positive number with a corresponding fixed constant, uniformly across large dyadic bins.

The third bound in (1), with $T=X$, now contradicts the number of isolated squares. In fact $\sum_Yn_Y\le B(X)=o(\sqrt X)$ by (2), and (5) gives
\[
 \sum_Ym_Y\ll\frac{e(2X)\log X}{B(h_X)-1}=o(\sqrt X)
\]
by $B(h_X)\ge X^{1/8-o(1)}$. The sum of nonlinear terms by (7) and geometric dyadic summation is
\[
 \sqrt{D(X)}\sum_{Y\le X}(m_Yn_Y)^{3/4}
 \le X^{3/8+o(1)}\sum_{Y\le X}Y^{3/32+o(1)}
 \le X^{15/32+o(1)}
 =o(\sqrt X).
\]
Hence the orientation $a\ge b$ contributes $o(\sqrt X)$ chosen pairs. Interchanging $A,B$ gives the same bound for the other orientation. This contradicts the $\gg\sqrt X$ isolated squares. No assumption that the factors are balanced is used.

## 4. Representational concentration without the logarithmic hypothesis

As a separate observation, suppose only that $A+B$ contains a fixed positive fraction of the squares up to $X$ for all sufficiently large $X$. For the rectangle $A\cap[0,X/2]$ by $B\cap[0,X/2]$ with $m\ge n\ge2$, its size $mn\gg\sqrt X$ follows by covering squares up to $X/2$, so $m\gg X^{1/4}$. Equations (1) show that the square-edge fraction is at most $1/n+\sqrt{D(X)/m}$. Thus the nonsquare multiplicity mass up to $X$ is $\gg\sqrt X$, and if both factors are infinite, all but an $o(1)$ fraction of pairs in this rectangle have nonsquare sums. If $e_+(X)=|(R\setminus Q)\cap[0,X]|=o(\sqrt X)$ and $r(t)$ is the sum representation function, Hölder in particular forces
\[
 \sum_{\substack{t\le X\\t\notin Q}}r(t)^p\gg_p\frac{X^{p/2}}{e_+(X)^{p-1}}
 \quad(p>1).
\]
This rules out uniformly bounded nonsquare multiplicity under the full $o(\sqrt X)$ perturbation hypothesis, but does not alone control the error support.

## 5. Necessary power-law sizes under the full conjectural hypothesis

Suppose hypothetically only that $R=A+B$ with $|A|,|B|\ge2$ and $e(X)=o(\sqrt X)$. Then the lower bound in §1 and the local construction in §3, without using the swap in §2, force the precise growth exponents
\[
 A(t)=t^{1/3+o(1)},\qquad B(t)=t^{1/3+o(1)}.
\tag{8}
\]

To prove this, count the same isolated squares and dyadic orientations as in §3. Globally the sum of the linear terms $m_Y+n_Y$, over both orientations, is $o(\sqrt X)$: the proof there used only (2), (5) and the lower bound $A(t),B(t)\ge t^{1/4-o(1)}$ from §1. The finitely many low bins contribute $o(\sqrt X)$ edges. Hence for every sufficiently large $X$ some remaining bin, in one of the orientations, has
\[
 g_Y-m_Y-n_Y\gg\sqrt X/\log X.
\tag{9}
\]
Here there are only $O(\log X)$ bins and the sum of these differences is $\gg\sqrt X$.

If both original factor counts are at least $t^{\lambda-o(1)}$ with $1/4\le\lambda\le1/3$, then (5) and (6) show
\[
 m_Y\le X^{1/2-\lambda/2+o(1)},\qquad
 n_Y\le Y^{1/2-\lambda/2+o(1)}\le X^{1/2-\lambda/2+o(1)} .
\]
The two oriented bounds (1) and (9) now give both $m_Y,n_Y\ge X^{1/4+\lambda/4-o(1)}$, since $D(X)=X^{o(1)}$. It follows that the original factor counts at $X$ obey that stronger lower exponent. Starting from $\lambda=1/4$, the iteration $\lambda\mapsto1/4+\lambda/4$ approaches $1/3$. Taking any fixed finite number of iterations proves $A(t),B(t)\ge t^{1/3-o(1)}$.

For the upper exponent, the third inequality (1) with (9) gives $m_Y n_Y\ge X^{2/3-o(1)}$. On the other hand (5), (6) and the new lower exponent give $m_Yn_Y\le X^{1/2}Y^{1/6+o(1)}$, so $Y\ge X^{1-o(1)}$. Reusing (5) and (6) without substituting the denominator gives
\[
 A(h_Y)B(h_Y)\ll \frac{e(2X)e(3Y)}{m_Yn_Y}\le X^{1/3+o(1)}.
\]
Both factors at $h_Y=X^{1/2-o(1)}$ are at least $X^{1/6-o(1)}$, so each is at most $X^{1/6+o(1)}$. For arbitrary large $t$, apply this at $X=t^{2+\epsilon}$ for any fixed $\epsilon>0$. Then $h_Y\ge t$ eventually, and monotonicity bounds $A(t),B(t)$ by $t^{1/3+\epsilon/6+o(1)}$. Letting $\epsilon\downarrow0$ proves (8).

**A lower limit, not just a lower upper limit.** Equation (8) makes the all-square crossed-output count in §2 at most $t^{2/3+o(1)}$ at every large $t$. The Landau–Ramanujan count and the remaining counts in that argument therefore give
\[
 (K+o(1))\frac{t}{\sqrt{\log t}}
 \le e(t)(\lfloor\sqrt t\rfloor+1)+e_+(t)^2+t^{2/3+o(1)}.
\]
Consequently any hypothetical decomposition with $e(X)=o(\sqrt X)$ must in fact satisfy
\[
 \liminf_{X\to\infty}\frac{e(X)\sqrt{\log X}}{\sqrt X}
 \ge K,
\]
since $e_+(t)^2=o(e(t)\sqrt t)$ under the global perturbation hypothesis. Thus the conjecture holds even assuming only $e(X)=o(\sqrt X)$ globally and $e(X_j)=o(\sqrt{X_j}/\sqrt{\log X_j})$ along an arbitrary unbounded sequence. The missing regime is one in which perturbations are at least this large at every sufficiently large scale.
