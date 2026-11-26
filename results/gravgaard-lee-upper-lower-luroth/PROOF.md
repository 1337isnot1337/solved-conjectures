# Gravgaard–Lee’s upper/lower Lüroth sumset conjecture

**Theorem.** For every integer $k\ge2$, put
```math
 a=\frac{k-1}{k(k-1)-1}.
```
Then $L_{\le k}+L_{\ge k}=(a,1+a]$. In particular the sumset represents every real residue modulo $1$, proving [Gravgaard–Lee, Conjecture 2.6](https://arxiv.org/html/2506.12513v2#S2.SS1) in its full all-$`k`$ scope.

Here $L_{\le k}$ consists of Lüroth expansions with digits from $2$ through $`k`$, and $L_{\ge k}$ consists of infinite Lüroth expansions with digits at least $`k`$. In particular the latter does not include $0$.

## 1. An oriented gap lemma

Suppose compact sets $C,D\subset\mathbb R$ have gap presentations constructed by splitting closed intervals: whenever a gap is removed from its parent interval, the two remaining closed intervals are its left and right *bridges*. Their endpoints lie in the corresponding compact set, and all gaps inside a bridge are removed later. Suppose each gap of $C$ has left/right bridge-to-gap length ratios at least $\ell_C,r_C$ respectively, and similarly for $D$. Assume their convex hulls intersect, neither set is contained in a bounded gap of the other, and
```math
 \ell_C r_D\ge1,\qquad r_C\ell_D\ge1. \tag{1}
```
Then $C\cap D\ne\varnothing$.

This is the oriented form of the Newhouse gap argument, as in [Moreira, Proposition II.1](https://ems.press/content/serial-article-files/17542?nt=1) for strict cross-products of lateral thicknesses. We give the presentation-level proof with nonstrict inequalities, because the relevant right-side product below equals 1. Suppose the sets are disjoint. They have positive distance $\epsilon$. Some point of $D$ must lie in the hull of $C$: otherwise either the hulls are disjoint, or all of the hull of $C$ lies inside a gap of $D$. Such a point belongs to a gap $U$ of $C$. There is another point of $D$ outside $U$ by the hypothesis excluding containment in a bounded gap. After reflecting both sets if necessary, take this second point to be to the right. The right endpoint of $U$ therefore belongs to a gap $V$ of $D$, and the gaps cross:
```math
 u_{\mathrm L}\lt v_{\mathrm L}\lt u_{\mathrm R}\lt v_{\mathrm R}.
```
The right bridge of $U$ and left bridge of $V$ have length product at least $|U||V|$ by (1). Thus either the former reaches strictly past $v_{\mathrm R}$, or the latter reaches strictly past $u_{\mathrm L}$, since the distances from the respective starting endpoints to be crossed are strictly smaller than $|V|$ and $|U|$. In the first case replace $U$ by the gap of $C$ containing $v_{\mathrm R}$; it is inside that right bridge, and it crosses $V$ in the reverse orientation. In the second case replace $V$ by the gap of $D$ containing $u_{\mathrm L}$, with the same conclusions. Both new gaps exist by disjointness and are later in their presentations. The other crossed orientation works using the other inequality of (1). This process cannot continue indefinitely: every crossing gap has width at least $2\epsilon$ because it contains an endpoint of a gap of the other set, whereas there are only finitely many gaps of width $\ge2\epsilon$ in either compact hull. This proves the lemma.

For a sum $C+D$ tested at a value $t$, apply this result to $C$ and $t-D$. Reflection interchanges left and right bridges, so the products in (1) become the same-side products $\ell_C\ell_D$ and $r_Cr_D$ for the summands.

## 2. Gap presentations for the two Lüroth sets

Write $A=L_{\le k}$, $B=L_{\ge k}$ and $S=\overline B$. The case $k=2$ is immediate from $`A=\{1\}`$ and $B=(0,1]$, so assume $k\ge3$. Put $W=1-a$, and let
```math
 f_d(t)=1/d+r_dt,\qquad r_d=\frac1{d(d-1)}.
```
These are the inverse Lüroth branches. The positive tail convention makes the $d$-interval $(1/d,1/(d-1)]$. The first-level intervals below are hulls of branch sets, not claims that each point of an interval belongs to the digit set.

The compact set $A$ has hull $[a,1]$, with endpoints the constant $`k`$ and constant $2$ expansions. The set $S$ has hull $[0,a]$; its maximum is the constant $`k`$ expansion and its minimum is approached by letting the first digit grow. More precisely,
```math
 S=B\cup\{f_w(0): w\text{ is a finite word of allowed digits}\}, \tag{2}
```
where the empty word is allowed and $f_w$ is the corresponding composition. To verify (2), take a convergent sequence in $B$. Successively extract a subsequence with each next digit fixed if possible. If one instead takes a subsequence with the next digit tending to infinity, its value tends to $f_w(0)$ for the fixed prefix $w$. If digits can be fixed at every step, the limit belongs to the closed hull of each fixed prefix; their diameters tend to zero, so it is the number of the resulting infinite expansion. Conversely each $f_w(0)$ is approached by appending a digit tending to infinity and then any infinite allowed tail.

In either set use the right-to-left gap presentation. At the root, split off the rightmost digit interval, then split off the next rightmost from the remaining left bridge, and so on. Apply the rule inside each digit interval after that interval is separated, rescaled by its increasing affine prefix map. This is a binary interval-splitting tree even for $S$: a remaining root-level tail interval containing all digits $d+1,d+2,\ldots$ is one left child and is split in its own right. Present the gaps in order of increasing tree depth, breaking ties arbitrarily. Every gap appears: along an infinite retained path, either the digit prefix grows indefinitely and the scale tends to zero, or the path eventually runs down a remaining tail and its diameter tends to zero. All endpoints concerned lie in the compact set. Thus this presentation gives the bridges actually used in the oriented gap lemma.

For $A$, the root-level gap separating digits $d$ and $d+1$ is
```math
 (f_{d+1}(1),f_d(a))=(1/d,1/d+a r_d),\quad 2\le d\le k-1.
```
Its right bridge is $[f_d(a),f_d(1)]$, giving the ratio $W/a$. The left bridge is $[a,1/d]$, giving the ratio
```math
 \frac{(d-1)(1-ad)}a.
```
The numerator is concave in $d$, so the minimum is at $2$ or $k-1$. At $k-1$ the ratio is $(W/a)(r_k/r_{k-1})=(W/a)(k-2)/k$, because $f_k(a)=a$. At $2$ the ratio is no smaller: the needed $a\le2/(k+2)$ is equivalent to $k(k-3)\ge0$. This proves
```math
 r_A=W/a,\qquad \ell_A=(W/a)(k-2)/k
 \quad\text{as valid lower bounds}. \tag{3}
```

For $S$, the first-level gap between $d$ and $d+1$ is
```math
 (f_{d+1}(a),f_d(0)),\qquad d\ge k,
```
of width $W r_{d+1}$. Its right bridge is $[f_d(0),f_d(a)]$, of width $a r_d$. Its left bridge is $[0,f_{d+1}(a)]$, of width $(d+a)r_{d+1}$. Ratios are unchanged under prefix affine maps, so this proves the lower bounds
```math
 r_S=a/W,\qquad \ell_S=(k+a)/W. \tag{4}
```

In particular $r_A r_S=1$ and $\ell_A\ell_S=(k-2)(k+a)/(ka)>1$. Every gap in $A$ has width at most $a/2<a=\mathop{\mathrm{diam}}(S)$, and every gap of $S$ has width at most $W r_{k+1}<W=\mathop{\mathrm{diam}}(A)$; non-root gaps are scaled versions of root gaps. Consequently the oriented gap lemma gives
```math
 A+S=[a,1+a]. \tag{5}
```

## 3. Removing the finite-prefix endpoints

It remains to show that the closure in (5) is not needed for any $x\in(a,1+a]$. We first record three facts.

1. Every endpoint $e=f_w(0)$ in (2) is isolated from the left *within* $S$. This is trivial for the empty word. Otherwise the gap to the left of the last digit's root interval, mapped by the earlier digits in $w$, is directly to the left of $e$. All the counted digits have a next larger allowed digit, so this gap always exists.
2. If $b\in A$ is a left accumulation point of $A$, its expansion contains infinitely many digits less than $`k`$. Indeed if it eventually uses only $`k`$, it is either $a$ or the left endpoint of a prefix interval, with an open gap just to its left in $A$. For each position with digit $d<k$, keep the preceding prefix and replace $d$ by $d+1$; let $C$ be the corresponding full copy of $A$ in that cylinder. The hull of $C$ lies strictly to the left of $b$ because the two child hulls are separated by a positive gap. As the changed position tends to infinity, these cylinders approach $b$, and
```math
 \mathop{\mathrm{diam}}(C)\ge r_k(b-\min C). \tag{6}
```
Indeed if the scale of the common prefix is $P$, the whole parent hull has width $PW$ and the changed child has width $P r_{d+1}W\ge P r_k W$.
3. Every bounded gap of $S$ that contains a positive real $u$ has width at most $2u^2$. For a root gap between $d$ and $d+1$, we have $u>1/(d+1)$ and its width is $W r_{d+1}\le2u^2$. Every other gap is inside a first-digit hull $[1/d,f_d(a)]$, where $u\ge1/d$ and the whole hull has width $a r_d\le2u^2$.

Fix $x\in(a,1+a]$. Let $J_x$ be the set of limits of the second summand along representations $t=b+y$ with $b\in A$, $y\in S$, $t<x$ and $t\to x$. It is nonempty by (5) and compactness, and is a compact subset of $S$: it is the intersection over $n\ge1$ of the closures of the sets of such $y$ with $x-1/n<t<x$. In particular it has a greatest element $e$. If $e\in B$ we are done, because closedness of $A$ gives $x-e\in A$.

Otherwise $e=f_w(0)$ by (2). Write $f_w(u)=e+Qu$ with $Q>0$ (and $Q=1$ for the empty word), and put $b=x-e\in A$. By definition of $J_x$ there are $t_j<x$ with $t_j\to x$ and representations $b_j+y_j=t_j$ with $y_j\to e$. Fact 1 gives $y_j\ge e$ eventually, so $b_j<x-e=b$ while $b_j\to b$. Thus Fact 2 applies.

Choose one of the cylinders $C$ in Fact 2 sufficiently close to $b$. Let
```math
 M=\frac{b-\min C}{Q}>0,\qquad
 D_t=\frac{t-e-C}{Q}.
```
At $t=x$, $D_x$ lies in a strictly positive interval of upper endpoint $M$, and its hull width is at least $r_kM$ by (6), and at most $M$. For all $t$ near $x$, the hull of $D_t$ lies in $(0,2M)$, is bounded away from zero, and has the same width. Choose $C$ sufficiently close for $2M<a$ and $8M^2<r_kM$. By Fact 3 it cannot fit in a gap of $S$, since any gap containing a point of this hull has width at most $8M^2$. Conversely, the hull of $S$ is wider than the whole hull of $D_t$.

Their hulls overlap. The set $D_t$ is a reflected scaled copy of $A$, so the orientation products with $S$ are exactly the same-side products in (3)–(4), both at least $1$. Hence there is $u_t\in S\cap D_t$ for every such $t$. This gives a representation of $t$ with first summand in $C$ and second summand $e+Qu_t\in S$, because prefixing $w$ preserves $S$. These second summands stay a fixed positive distance above $e$. Taking $t\uparrow x$, a subsequential limit gives an element of $J_x$ greater than $e$, a contradiction.

We have proved $A+B\supseteq(a,1+a]$. The reverse inclusion follows from $A\subseteq[a,1]$ and $B\subseteq(0,a]$. This finishes the exact sumset result. $\square$

## Source and scope

The exact conjecture is [arXiv v2, Conjecture 2.6](https://arxiv.org/html/2506.12513v2#S2.SS1), and appears as Conjecture 2 in [v1](https://arxiv.org/html/2506.12513v1). The article was published in *International Journal of Number Theory* 22 (2026), 1931–1968 ([DOI](https://doi.org/10.1142/S1793042126500958)). Their Theorem 2.5 gives the prior weaker upper digit bound $k+2$. Their §5 calculates ordinary thickness for finite Lüroth digit alphabets. The argument here makes separate use of left and right gap bridges, and handles the exclusion of finite endpoints in the infinite alphabet. The authors’ Conjectures 2.2 and 2.12 concern different sumsets. The continued-fraction analogue, their Conjecture 2.7, already appears as [Astels, Corollary 1.0.3](https://dspacemainprd01.lib.uwaterloo.ca/server/api/core/bitstreams/970d5bc3-28c1-42b3-a3ff-610a0a5e8206/content#page=11), and is not a novelty claim here.

Gravgaard’s later [2026 PhD thesis, Chapter 4, PDF page 83](https://data.math.au.dk/publications/phd/2026/math-phd-2026-mbg.pdf#page=83) reproduces Conjecture 2.6 and the preceding weaker theorem, not a resolution. Bounded searches by title, DOI, arXiv ID, exact conjecture number and mixed digit conditions found no earlier exact resolution. This is not a priority guarantee.
