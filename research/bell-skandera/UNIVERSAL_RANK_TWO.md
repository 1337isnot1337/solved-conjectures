# Bell–Skandera: the triangle inequality in every degree

**Scope.** All real-rooted integer polynomials with constant coefficient one and nonnegative coefficients satisfy the Kruskal–Katona inequality from edges to triangles. This supplements the lower-third result and does not settle the full face-vector question.

Write $`F(t)=\sum_{i=0}^d c_i t^i`$, with coefficients beyond $`d`$ equal to zero. Let $`K_2(m)`$ be the maximum number of triangles allowed by $`m`$ edges in the Kruskal–Katona theorem. We prove $`c_3\le K_2(c_2)`$.

## A simple rank-two estimate

For integer $`m\ge1`$, write $`m=\binom a2+r`$ with $`0\le r<a`$. Then $`K_2(m)=\binom a3+\binom r2`$. For real $`x\ge2`$ satisfying $`m=\binom x2`$, write $`B(m)=\binom x3=m(\sqrt{1+8m}-3)/6`$. This function is convex, by differentiating twice. Bounding it by the secant between the inputs $`\binom a2`$ and $`\binom{a+1}2`$ gives
```math
 B(m)-K_2(m)\le \frac{r(a-r)}2\le \frac m4.
```
Indeed the second inequality is equivalent to $`(a-2r)(a-2r-1)\ge0`$. In particular,
```math
 K_2(m)\ge \frac{m(x-3)}3,\qquad
 K_2(m)\ge \frac{m(\sqrt{2m}-9/4)}3,
```
where the second bound uses $`x\ge\sqrt{2m}+1/2`$. This rank-two estimate is also part of Shing–Xie's proof of their all-rank approximation; the calculation here is self-contained.

## Reduction to irreducibles

Every factor over $`\mathbb Z[t]`$ has constant term $`\pm1`$. Normalize each to constant term 1; its roots are negative, so its coefficients are positive. Every such factor satisfies $`c_2\le\binom{c_1}2`$ by Newton–Maclaurin or the variance argument in [LOW_RANK.md](LOW_RANK.md). If each factor also satisfies the edge-to-triangle inequality, its truncated coefficient vector $`(1,c_1,c_2,c_3)`$ is realized by a simplicial complex, using Kruskal–Katona. The join of these complexes has a face polynomial agreeing with $`F`$ through $`t^3`$; its own three-element faces obey the desired inequality. It therefore suffices to prove the result for each irreducible factor.

Degrees at most two are immediate. For degree three, Maclaurin gives $`m=c_2\ge3`$ because $`c_3\ge1`$, and $`c_3\le(m/3)^{3/2}`$. The second rank-two estimate gives $`K_2(m)\ge(m/3)^{3/2}`$ for $`m\ge8`$, since
$`\sqrt{8}(\sqrt2-1/\sqrt3)=4-\sqrt{8/3}>9/4`$.
At $`m=3,4,5,6,7`$, the exact $`K_2(m)`$ values are $`1,1,2,4,4`$, and the integer upper bounds $`\lfloor(m/3)^{3/2}\rfloor`$ are $`1,1,2,2,3`$, respectively.

## Irreducible degree at least four

As in the lower-third proof, [Smyth's trace theorem](https://aif.centre-mersenne.org/item/10.5802/aif.975.pdf#page=2) gives $`c_1/d\ge R=7/4`$: outside five exceptions $`c_1/d>1.7719`$, and the degree-four exceptions both have trace 7. This applies to the monic irreducible polynomial $`x^dF(-1/x)`$, whose roots are the positive reciprocal parameters of $`F`$.

Put $`a_i=c_i/\binom di`$, $`D=d-2\ge2`$, $`q=a_3/a_2`$, $`L=a_2/q^2`$. Newton's ratio inequalities give
```math
 L\ge \max(1,R/q,q^{-d}).
```
By the first rank-two estimate and $`c_3/c_2=qD/3`$, it is sufficient that $`\binom{3+qD}2\le c_2`$, equivalently
```math
 U(q):=\frac{(D+2/q)(D+3/q)}{(D+1)(D+2)}\le L.
```
At $`q=R`$, this holds with $`U(R)\le1`$, because $`3R>5`$ and $`2R^2>6`$; $`U`$ decreases with $`q`$. Set $`q_0=R^{-1/(d-1)}`$ and $`\theta=q_0^{-1}`$. Since $`1\le\theta\le R^{1/3}<121/100`$, we have
```math
 q_0 U(q_0)=\frac{D^2/\theta+5D+6\theta}{(D+1)(D+2)}\lt R.
```
For $`D=2`$ the numerator is increasing in $`\theta\ge1`$; its value at $`121/100`$ is $`400/121+10+726/100<21`$. For $`D\ge3`$ the numerator is at most $`D^2+5D+726/100`$; subtracting this from $`R(D+1)(D+2)`$ gives $`3D^2/4+D/4-94/25>0`$.

The function $`\log(qU(q))`$ is convex in $`\log q`$, so the two endpoint bounds give $`U(q)\le R/q\le L`$ on $`[q_0,R]`$. For $`q<q_0`$, $`q^d U(q)`$ is increasing and at $`q_0`$ is at most $`Rq_0^{d-1}=1`$, giving $`U(q)\le q^{-d}\le L`$. This exhausts all $`q>0`$ and completes the proof.
