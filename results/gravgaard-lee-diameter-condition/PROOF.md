# Large-digit Lüroth sums: the diameter condition suffices

Let $k_1,\ldots,k_n\ge2$ be integers and put
$$
 a_i=\frac{k_i-1}{k_i(k_i-1)-1}.
$$
If $\sum_i a_i\ge1$, then the sum of the actual infinite-expansion sets is
$$
 L_{\ge k_1}+\cdots+L_{\ge k_n}=\left(0,\sum_i a_i\right].
 \tag{1}
$$
This answers the explicit question following [Gravgaard–Lee, Theorem 2.3](https://arxiv.org/html/2506.12513v2#S2.SS1): their digit-bound separation condition is not needed. The conclusion is the entire positive hull, not merely coverage modulo one. If $\sum_i a_i<1$, the hull is too short to cover all residues.

## 1. A merging principle

For a compact real set $C$ of positive diameter let $g(C)$ denote its largest bounded gap length, or zero for an interval. Let $\tau(C)$ be its thickness and $\gamma(C)=\tau(C)/(1+\tau(C))$ its normalized thickness, with $\gamma=1$ for an interval. Thickness is the supremum over gap-splitting presentations of the infimum of the shorter-bridge-to-gap ratio.

We use the two-set case of [Astels’ sumset theorem](https://www.maths.tcd.ie/EMIS/journals/ERA-AMS/1999-01-015/1999-01-015.tex.html), stated as Proposition 3.4 in Gravgaard–Lee. If
$$
 g(C)\le \operatorname{diam}(D),\qquad
 g(D)\le \operatorname{diam}(C),
 \tag{2}
$$
then $\gamma(C+D)\ge\min(1,\gamma(C)+\gamma(D))$, and $C+D$ is the full sum of the hulls if $\gamma(C)+\gamma(D)\ge1$. Astels uses generalized Cantor sets, any compact sets obtained by removing open gaps from a finite closed interval, so the theorem applies to grouped sums even when they have interior.

When (2) holds, we also have
$$
 g(C+D)\le\min(g(C),g(D)).
 \tag{3}
$$
Indeed the $C$-translates of the hull of $D$ cover the hull of the sum because that hull has width $\operatorname{diam}(D)\ge g(C)$. If a bounded gap of $C+D$ contains a point of one such translated hull, the entire gap is within that translated hull: both endpoints of the translated hull are in $C+D$. Hence the gap is no bigger than a gap of $D$. The symmetric argument gives (3). Finally,
$$
 g(C)\le \operatorname{diam}(C)\frac{1-\gamma(C)}{1+\gamma(C)}.
 \tag{4}
$$
In any presentation the two bridges at a gap of length $g$ contribute at least $2g$ times the thickness of that presentation, and both remain inside the hull. Take the supremum over presentations and use $\tau=\gamma/(1-\gamma)$.

**Merging lemma.** Suppose compact sets $C_i$ have diameters $0<a_i\le2/5$ and satisfy $\gamma(C_i)\ge a_i$ and $g(C_i)\le a_i^2$. If $\sum_i a_i\ge1$, their sum is the full sum of their hulls.

Start with singleton groups, and merge two groups whenever their two summed sets satisfy (2). The weight of a group is the sum of the $a_i$ in that group, which equals its diameter. Until some group attains weight $1$, Astels’ theorem shows that a group of weight $s$ has normalized thickness at least $s$. By (3), each grouped gap is at most the square of the least original member's $a_i$, hence strictly below the group's weight.

If some group attains weight at least $1$, its sum is an interval of width at least $1$ by Astels. The other groups all have gaps of length at most $(2/5)^2<1$, so adding their sets one at a time preserves the full interval property. Otherwise suppose no further merge is possible, with weights $1>s_1\ge s_2\ge\cdots>0$. There must be at least two groups. For an adjacent pair, the smaller group's gap is strictly below the larger group's diameter. Thus inability to merge gives
$$
 s_{i+1}<g_i\le s_i^2,\qquad
 s_2<g_1\le t:=\frac{s_1(1-s_1)}{1+s_1}
$$
where the last bound uses (4). Each subsequent term after $s_2$ is at most $s_2$ times the previous term. As a result,
$$
 \sum_{i\ge2}s_i\le\frac{s_2}{1-s_2}
 \le\frac{t}{1-t}
 =\frac{s_1(1-s_1)}{1+s_1^2}
 <1-s_1.
$$
This contradicts the total weight. The merging lemma follows.

## 2. The compact closures

Fix $k\ge3$ and write $B=L_{\ge k}$, $S=\overline B$, $a=(k-1)/(k(k-1)-1)$, $r_d=1/[d(d-1)]$ and $f_d(u)=1/d+r_du$. The hull of $S$ is $[0,a]$, since its constant $k$ string attains $a$ and strings whose first digit tends to infinity approach 0. More exactly,
$$
 S=B\cup\{f_w(0): w\text{ is a finite word with all digits at least }k\},
 \tag{5}
$$
where the empty word is included. To see this, from a converging sequence of members of $B$, successively extract subsequences with each next digit fixed if possible. If a next digit instead tends to infinity, the limit is the finite prefix applied to 0. If digits can be fixed indefinitely, the prefix hull diameters tend to zero, and the infinite string gives the limit. Conversely every $f_w(0)$ is a limit of allowed expansions.

The gap between consecutive digit hulls $[1/(d+1),f_{d+1}(a)]$ and $[1/d,f_d(a)]$ has length
$$
 1/d-f_{d+1}(a)=(1-a)r_{d+1}\qquad(d\ge k).
$$
Inside each cylinder present these gaps from right to left, each time splitting off one right digit interval and leaving all larger digits as the left bridge. Apply the same prescription inside separated digit cylinders. This is a binary gap-splitting tree, whose breadth-first enumeration presents every bounded gap. Along any infinite retained path the diameters shrink to zero, either by increasing prefix length or by sending the remaining first digit to infinity. The right bridge at a root gap has width $a r_d$, so its bridge-to-gap ratio is at least $a/(1-a)$. The left bridge $[0,f_{d+1}(a)]$ has ratio $(d+a)/(1-a)$, also at least $a/(1-a)$. Affine scaling preserves these ratios for descendants. Hence
$$
 \gamma(S)\ge a,\qquad
 g(S)\le(1-a)r_{k+1}<a^2.
$$
The last inequality follows from $a>1/k$ and $r_{k+1}<1/k^2$. For all $k_i\ge3$ we have $a_i\le2/5$, so the merging lemma applies and the compact sum equals $[0,\sum_i a_i]$.

If some $k_i=2$, its compact closure is $[0,1]$. Each other summand's closure has largest gap less than $1$, so adding its translates of any interval of width at least $1$ fills the entire sum of the hulls. Thus in this case also the compact sum is $[0,\sum_i a_i]$.

## 3. Removing all finite tails

Write $B_i=L_{\ge k_i}$ and $S_i=\overline{B_i}$. Every excluded point of $S_i\setminus B_i$ has the form $f_w(0)$. Such a point is isolated from the left within $S_i$. For $k_i\ge3$ this follows from the gap immediately below the last digit cylinder in the prefix, or the hull endpoint 0 for the empty word. When $k_i=2$ the only excluded point is 0.

Fix $x\in(0,\sum_i a_i]$. Approach $x$ from below by points $t_j$ of the compact sum, using a representation $t_j=\sum_i y_{i,j}$ with $y_{i,j}\in S_i$. Take a convergent subsequence in the compact product, with coordinate limits $y_i$. Then $x=\sum_i y_i$. At least one $y_i$ belongs to $B_i$: otherwise each limit would be left-isolated in its coordinate set, so for all large $j$, each $y_{i,j}\ge y_i$ and $t_j\ge x$, a contradiction.

Use a genuine summand $y_i$ to repair any excluded summand $y_h=f_w(0)$. Keep $w$ fixed on side $h$, with positive scale $Q$, and keep a sufficiently long prefix on side $i$, with positive scale $P\le Q/k_h$. After these prefix translations the exact residual to be split between the two sides is a positive number $z\le P a_i\le P/(k_i-1)$, namely the original tail on side $i$.

For completeness the two-prefix Lüroth greedy rule is as follows. At a step with scale $R$ and residual $u$ satisfying $0<u\le R$, append digit $d=\lfloor R/u\rfloor+1$. This subtracts $R/d$ from the residual and updates the scale to $R/[d(d-1)]$. The new residual is positive, no larger than the new scale, and at most $u/d$. Alternate between sides. Since the residual is initially no larger than both scales, it remains no larger than both. At each subsequent step the unchanged other scale was at least the preceding residual, so its quotient by the new residual is at least the preceding digit. Thus the interleaved digits are strictly increasing.

Run this rule starting on side $i$. Its first digit is at least $k_i$ by $z\le P/(k_i-1)$. The second side's first digit is at least $k_h$ because its scale is $Q$ and the residual is at most $P\le Q/k_h$. Later digits are larger on both sides. The two new tails are infinite, positive and genuinely allowed; the residual tends to zero, so their sum preserves the target. Repeating finitely often eliminates all excluded summands. This proves (1) without replacing any finite tail by an inadmissible zero expansion.

## Source, equality, and status

Gravgaard–Lee’s [arXiv v2 §2.1](https://arxiv.org/html/2506.12513v2#S2.SS1) and [Gravgaard’s 2026 thesis, Chapter 4, PDF pp. 82–83](https://data.math.au.dk/publications/phd/2026/math-phd-2026-mbg.pdf#page=82) explicitly leave the necessity of the separation condition open when the total diameter is greater than one. We use the same underlying Astels theorem as the authors, but apply its normalized-thickness inequality iteratively to compatible groups, then remove finite tails using the two-prefix rule. This treats the exact equality case as well. Contrary to the assertion after their Theorem 2.3, nontrivial equality in the diameter condition is possible even under their separation condition: take 53 copies of $k=62$ and 20 copies of $k=138$. The relevant denominators are $3781$ and $18905=5\cdot3781$, and $53\cdot61+4\cdot137=3781$.

This is an explicit follow-up question in the source, not a separately numbered conjecture. Bounded searches for the article and unrestricted unequal lower-bound sums found no earlier proof; that is not a priority guarantee.

The [Lean formalization](FORMALIZATION.md) verifies the full statement using direct cylinder refinement and the same positive-tail repair.
