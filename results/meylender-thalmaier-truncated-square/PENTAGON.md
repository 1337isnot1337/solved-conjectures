# Meylender–Thalmaier conjecture

**Result.** The proposed optimizing trapezoid in Conjecture 6.1 is not optimal. An explicit rational pentagonal cover has a larger systolic ratio for a unit square with truncation legs $`1/10`$ and $`9/10`$. The counterexample does not settle the separate assertion that all systolic ratios in this family are strictly less than one.

## Source and notation

A. Balitskiy, I. Mitrofanov and A. Polyanskii, [*Triangle covering problems and the Viterbo inequality in the plane*](https://arxiv.org/pdf/2603.12495v2), arXiv:2603.12495v2, §6.2, pp. 25–26, Conjecture 6.1 and Figure 11, report the conjecture arising from the computations of Lou Meylender and Thomas Thalmaier. The proposed maximizing shape for each truncated-square $`Q`$ is the trapezoid $`K_0`$ shown there or its central reflection. The paper also proposes the separate strict bound $`c(K\times Q)^2/(2|K||Q|)<1`$ for every $`K`$. Here $`c`$ is the Ekeland–Hofer–Zehnder capacity and vertical bars denote planar area.

Definition 3.2 and Theorem 3.3 of the same source give the covering criterion: $`c(K\times Q)\ge1`$ exactly when $`K`$ contains a translate of each $`Q`$-normal triangle and segment of $`Q`$-perimeter one. The polygonal length of an oriented closed loop is the sum of the support function $`h_Q`$ of $`Q`$ evaluated on its successive edge vectors. This length is unchanged by translation of $`Q`$, so coordinates are allowed to put the origin on its boundary.

## The required four shapes

Let $`a=1/10,\ b=9/10,\ L=a+b-ab=91/100`$, and let
```math
 Q=[0,1]^2\cap\{(x,y): bx+ay\le L\}.
```
Thus $`Q`$ is a unit square missing a right triangle of legs $`a,b`$, and $`|Q|=191/200`$. Its outward normal directions are $`\pm e_1,\pm e_2`$ and $`(b,a)`$. The only opposite pairs are the coordinate axes, and since $`Q`$ has width one in each of the two coordinate directions, the required degenerate triangles are horizontal and vertical unit segments.

The only positive dependence of three distinct outward directions not containing an opposite pair is among $`-e_1,-e_2,(b,a)`$. Their weights have ratio $`b:a:1`$. The support function vanishes on the two negative coordinate directions and has $`h_Q(b,a)=L`$. Thus the two nondegenerate normal triangles, up to translation, are
```math
 R=\mathop{\mathrm{conv}}\{(0,0),(90/91,0),(0,-10/91)\},\qquad -R.
```
For $`R`$, follow $`0\to(0,-10/91)\to(90/91,0)\to0`$ to see the normalized edge directions and length. The other cyclic order of the same three directed edges produces the negative triangle up to translation. This lists every $`Q`$-normal shape.

## A better cover

For simpler coordinates first reflect in the horizontal axis. Write $`A=90/91`$ and $`B=10/91`$; the reflected pair of triangles has legs $`(A,0),(0,B)`$ and their negatives. Translate the two unit segments and those two triangles to the following positions:
```math
\begin{array}{c|l}
 \text{horizontal segment}&(-2/3,1/25),\ (1/3,1/25)
 \\ \text{vertical segment}&(-1/9,-7/15),\ (-1/9,8/15)
 \\ \text{positive triangle}&(-3/5,-1/50),\ (-3/5+A,-1/50),\ (-3/5,-1/50+B)
 \\ \text{negative triangle}&(1/3,1/25),\ (1/3-A,1/25),\ (1/3,1/25-B).
\end{array}
```
Let $`K'`$ be their convex hull. Its vertices, in counterclockwise order, are
```math
 (-2/3,1/25),\quad(-1/9,-7/15),\quad(1/3,-159/2275),\quad
 (177/455,-1/50),\quad(-1/9,8/15).
```
For a short check, every proposed vertex is in the table, all five consecutive oriented edge determinants are positive, and each tabulated point not among the five vertices has all five oriented edge determinants positive. More explicitly, for $`(1/3,1/25),(-3/5,-1/50),(-3/5,409/4550),(-179/273,1/25)`$ respectively, the minimum oriented determinant over the five edges is $`82/102375,\ 1/2250,\ 353/68250,\ 37/6825`$. The shoelace formula gives
```math
 |K'|=\frac{1092843}{2070250}.
```
Let $`K`$ be the horizontal reflection of $`K'`$, to undo the reflection on the two triangles. Then $`K`$ contains translates of all four required shapes, so the covering criterion gives $`c(K\times Q)\ge1`$. Moreover its vertical coordinate span is exactly one. For any $`s>1`$, $`K/s`$ cannot contain a unit vertical segment, so the covering criterion gives $`c((K/s)\times Q)<1`$. The capacity is homogeneous of degree one under scaling just $`K`$: the dilation of both factors by $`\sqrt{s}`$, followed by $`(x,y)\mapsto(\sqrt{s}\,x,y/\sqrt{s})`$, sends $`K\times Q`$ to $`(sK)\times Q`$. This and the capacity axioms give $`c((sK)\times Q)=s\,c(K\times Q)`$. It follows that $`c(K\times Q)=1`$.

## Comparison with the conjectured optimizer

Use the source's parameters $`\alpha,\beta,\gamma`$, not the two lengths of the removed corner. The cut line meets the extensions of the two sides through $`(0,0)`$ at $`(L/b,0)`$ and $`(0,L/a)`$. Thus the source's ratios are
```math
 \alpha=1-b/L=\frac1{91},\qquad
 \beta=1-a/L=\frac{81}{91},\qquad
 \gamma=1-\alpha-\beta=\frac9{91}.
```
The inverse systolic ratio of the source's trapezoid, given immediately after Conjecture 6.1, is
```math
 \frac{2|K_0||Q|}{c(K_0\times Q)^2}
 =1+\frac{(\alpha^2+\beta^2)\gamma^2}{1-\alpha^2-\beta^2-\gamma^2}
 =\frac{783100}{753571}.
```
Our exact inverse ratio is
```math
 \frac{2|K||Q|}{c(K\times Q)^2}
 =\frac{208733013}{207025000}
 <\frac{783100}{753571}.
```
Indeed the difference between the last two fractions in decreasing order is $`582795817/18839275000>0`$. Taking reciprocals proves strict improvement. The comparison also excludes all translates, central reflections, and positive homothetic copies of $`K_0`$, so it is independent of the implicit capacity-one normalization of the optimizing shape.

The point coordinates, polygon area, and fractions are replayable using [check_pentagon.py](check_pentagon.py), which uses only integer and rational arithmetic.

## Priority and scope

The primary reference's August 2026 revision still states the conjecture. Searches for the exact name, geometry, conjecture number, and claimed trapezoid counterexamples did not locate an earlier result. The [MathDB problem record](https://mathdb.com/p/373593/meylender-thalmaier-optimal-cover-conjecture-for-truncated-s) independently labels it open and listed no solutions when inspected. These checks do not establish exclusive priority. The earlier Haim-Kislev–Ostrover counterexample to unrestricted Viterbo uses regular pentagons, which are not squares truncated at one corner. Our ratio remains strictly below one. In particular, it neither refutes the truncated-square strict subclaim nor settles the actual optimizer, the half-symmetric Viterbo question, or Wetzel's ringworm problem.
