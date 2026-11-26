# Meylender–Thalmaier conjecture

The proposed optimizing trapezoid in Conjecture 6.1 is not optimal. For each fixed first truncation leg $`a\in(0,1)`$, it is worse than an explicit parallelogram whenever the second leg $`b<1`$ is sufficiently close to $`1`$. The separate [strict inequality proof](STRICT-BOUND.md) proves that every ratio in this family is strictly below one.

## Problem and four test shapes

A. Balitskiy, I. Mitrofanov and A. Polyanskii, [*Triangle covering problems and the Viterbo inequality in the plane*](https://arxiv.org/pdf/2603.12495v2), arXiv:2603.12495v2, §6.2, pp. 25–26, Conjecture 6.1 and Figure 11, report the conjecture from numerical work of Lou Meylender and Thomas Thalmaier. For every square truncated at one corner, the proposed maximizing shape for
```math
 S(K,Q)=\frac{c(K\times Q)^2}{2|K||Q|}
```
is the trapezoid $`K_0`$ pictured there or its central reflection, with translations immaterial. Here $`c`$ is the Ekeland–Hofer–Zehnder capacity and vertical bars denote planar area. We disprove the maximizing assertion even modulo arbitrary positive dilations, under which $`S`$ is unchanged.

Set $`a,b\in(0,1)`$, $`L=a+b-ab`$, and
```math
 Q=[0,1]^2\cap\{(x,y): bx+ay\le L\}.
```
This removes a right triangle of legs $`a,b`$, so $`|Q|=1-ab/2`$. By Definition 3.2 and Theorem 3.3 in the source, $`c(K\times Q)\ge1`$ exactly when $`K`$ contains a translate of every $`Q`$-normal triangle or segment of $`Q`$-perimeter one. The length of an oriented closed polygonal loop is the sum of the support function $`h_Q`$ on its oriented edge vectors; it is unchanged by translation of $`Q`$. Thus the fact that our coordinates place the origin on the boundary rather than in the interior has no effect.

The outward side directions are $`\pm e_1,\pm e_2,(b,a)`$. The two opposite pairs give horizontal and vertical unit segments, since $`Q`$ has width one in each coordinate direction. The only three directions with an inclusion-minimal positive dependence are $`-e_1,-e_2,(b,a)`$, with positive weights $`b,a,1`$. Their support values are $`0,0,L`$. With $`A=b/L`$ and $`B=a/L`$, the two nondegenerate shapes are therefore
```math
 R=\mathop{\mathrm{conv}}\{(0,0),(A,0),(0,-B)\},\qquad -R.
```
Indeed the loop $`0\to(0,-B)\to(A,0)\to0`$ has the required oriented directions and length one. The opposite cyclic ordering of these three directed edges gives the negative triangle up to translation.

## An exact parallelogram cover

To place these shapes, reflect first in the horizontal axis and consider the parallelogram
```math
 P'=\{(x,y): |x+y|\le\tfrac12,\quad |y+(a-1)x|\le\tfrac12\}.
```
Its area is $`1/(2-a)`$ by the determinant of the displayed linear coordinates. Each centered horizontal or vertical unit segment lies in $`P'`$. For the reflected $`R`$, the two ranges of its vertices in those coordinates are
```math
 [0,\max(A,B)],\qquad [(a-1)A,B].
```
The first range has length at most one because $`L\ge a,b`$. The second has length exactly one because
```math
 B+(1-a)A=\frac{a+(1-a)b}{L}=1.
```
A translation can center both ranges simultaneously, since the map to the two linear coordinates is invertible. Thus $`P'`$ contains a translate of the reflected $`R`$, and central symmetry gives the other triangle.

Undo the horizontal reflection to get $`P`$, a $`Q`$-cover, so $`c(P\times Q)\ge1`$. On any vertical line, the first strip bounds the length of a vertical segment in $`P`$ by one. Thus no contraction $`P/s`$, $`s>1`$, is a $`Q`$-cover. The capacity scales linearly in a single factor, $`c((sP)\times Q)=s c(P\times Q)`$: express that transformation as ordinary dilation by $`\sqrt{s}`$ followed by $`(x,y)\mapsto(\sqrt{s}x,y/\sqrt{s})`$, which is symplectic in the two Lagrangian factors. The covering criterion therefore gives $`c(P\times Q)=1`$. In particular
```math
 S(P,Q)^{-1}=\frac{2-ab}{2-a}
           =1+\frac{a(1-b)}{2-a}.
```

## Strictly better than the proposed trapezoid

The source's parameters $`\alpha,\beta,\gamma`$ are not the cut legs $`a,b`$. The cut line meets the extensions of the two sides through $`(0,0)`$ at $`(L/b,0)`$ and $`(0,L/a)`$, so
```math
 \alpha=1-b/L,\qquad \beta=1-a/L,\qquad \gamma=1-\alpha-\beta.
```
The formula immediately following Conjecture 6.1 gives
```math
 S(K_0,Q)^{-1}
 =1+\frac{(\alpha^2+\beta^2)\gamma^2}{1-\alpha^2-\beta^2-\gamma^2}.
```
Fix $`a\in(0,1)`$ and let $`b\uparrow1`$. The parameters converge to $`(0,1-a,a)`$, whose denominator $`1-(1-a)^2-a^2=2a(1-a)`$ is positive. Hence the proposed trapezoid's inverse ratio converges to $`1+a(1-a)/2>1`$, while the parallelogram's inverse ratio converges to $`1`$. Continuity gives strict improvement for every fixed $`a`$ and all sufficiently large $`b<1`$, all of which are genuine pentagons.

For a concrete interior example take $`a=1/2`$, $`b=9/10`$, $`L=19/20`$. Then $`(\alpha,\beta,\gamma)=(1,9,9)/19`$, and
```math
 S(P,Q)^{-1}=\frac{31}{30}
 <\frac{4340}{3971}=S(K_0,Q)^{-1}.
```
The inequality follows by cross multiplication, $`130200-123101=7099>0`$. Taking reciprocals proves the counterexample to optimality. No numerical optimization is required. An [independent pentagonal fixture](PENTAGON.md) gives a second exact example with different truncation parameters.

## Priority and scope

The August 2026 primary revision still poses Conjecture 6.1. Searches for the exact conjecture name, number, geometry, and counterexamples found no previous resolution. The [MathDB record](https://mathdb.com/p/373593/meylender-thalmaier-optimal-cover-conjecture-for-truncated-s) also had no posted solutions when checked. This does not establish exclusive priority.

The ratios of our explicit competing covers are still strictly below one. The [strict inequality proof](STRICT-BOUND.md) settles that separate clause. The actual optimizers and the distinct half-symmetric Viterbo question are not determined. The Haim-Kislev–Ostrover counterexample to unrestricted Viterbo uses regular pentagons and does not settle this conjecture.
