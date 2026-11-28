# Bouttier's Bessel-coefficient question: integral tree-shape weights

This is a partial result toward [Bouttier's Problem 11, Oberwolfach Report 2/2026, pp. 150–151](https://ems.press/content/serial-article-files/53596?nt=1#page=70). Bouttier asks for a simple combinatorial interpretation of the coefficients $`k_n`$ of $`-B'(w)/B(w)`$, where $`B(w)=J_1(2\sqrt w)/\sqrt w`$, or of $`a_n=(n+1)!(n+2)!k_n`$. Global integrality is classical: see [F. T. Howard, *Integers Related to the Bessel Function* $`J_1(z)`$ (1985)](https://www.fq.math.ca/Scanned/23-3/howard.pdf), linked by [OEIS A131490](https://oeis.org/A131490). The shape-by-shape positive integrality below is stronger than global integrality and follows directly from Bouttier's recurrence. It does not give an unweighted combinatorial class counted by $`a_n`$.

## Statement

For an unordered rooted full binary tree shape $`T`$ with $`N=n+1`$ leaves, let $`L_v`$ be the number of descendant leaves at an internal vertex $`v`$. Let $`s(T)`$ be the number of internal vertices whose two rooted subtrees are isomorphic. Define
```math
 W(T)=\frac{N!(N+1)!}{2^{s(T)+1}\prod_{v\ \mathrm{internal}}(L_v+1)}.
```
Then each $`W(T)`$ is a positive integer. Moreover
```math
 a_n=\sum_T W(T),
```
where the sum ranges over all such unordered tree shapes.

Bouttier's recurrence is $`k_0=1/2`$ and
$`k_n=(n+2)^{-1}\sum_{i=0}^{n-1}k_i k_{n-1-i}`$ for $`n\ge1`$. It gives a sum over plane full binary trees: each leaf contributes $`1/2`$, and every internal vertex contributes $`1/(L_v+1)`$. By induction on the two child subtrees, there are $`2^{n-s(T)}`$ plane orders realizing the unordered shape $`T`$: a vertex adds a factor 2 if its subtrees are nonisomorphic; otherwise the ordered subtree-pair enumeration already counts every orientation once. Summing the weights over these plane orders and multiplying by $`N!(N+1)!`$ gives $`W(T)`$.

## Laminar counting

For an integer $`m\ge3`$, mark the internal vertices $`v`$ with $`L_v\equiv-1\pmod m`$. We claim
```math
 \#\{\text{marked vertices}\}\le
 \left\lfloor\frac{N}{m}\right\rfloor+
 \left\lfloor\frac{N+1}{m}\right\rfloor.                         \tag{1}
```
Order just the marked vertices by ancestry to get a forest. First consider a marked vertex with $`L_v=km-1`$. Its $`d`$ immediate marked descendants have disjoint subtrees, with leaf counts $`k_i m-1`$. We prove by induction that at most $`2k-1`$ marked vertices are at or below $`v`$. For $`d=0`$, this is $`1\le2k-1`$. For $`d=1`$, the child has strictly fewer leaves, so $`k_1\le k-1`$ and the induction gives $`1+(2k_1-1)\le2k-2`$. For $`d\ge2`$, disjointness gives
```math
 k-\sum_i k_i\ge-\left\lfloor\frac{d-1}{m}\right\rfloor.
```
Since $`2\lfloor(d-1)/m\rfloor\le d-2`$ for $`m\ge3,d\ge2`$, the induced count bound $`1+2\sum_i k_i-d\le2k-1`$ follows. To see the displayed floor inequality, put $`d-1=qm+r`$. If $`q=0`$ it is immediate; otherwise $`d-2=qm+r-1\ge3q-1\ge2q`$.

Let the forest have $`d`$ roots with leaf counts $`k_i m-1`$. The count is at most $`2\sum_i k_i-d`$. Write $`N=qm+r`$, $`0\le r<m`$. By disjointness $`\sum_i k_i\le q+\lfloor(r+d)/m\rfloor`$. To obtain (1), it suffices to show
```math
 2\left\lfloor\frac{r+d}{m}\right\rfloor-d\le \mathbf{1}_{r=m-1}.
```
If $`t=\lfloor(r+d)/m\rfloor=0`$, this is immediate. If $`t\ge1`$, then $`2t-d\le r-(m-2)t\le r-(m-2)`$; this is at most zero for $`r\le m-2`$ and at most one otherwise. This proves (1).

## Divisibility for each tree

For any odd prime $`p`$, apply (1) at every $`m=p^j`$, $`j\ge1`$. The sum of the left sides is the $`p`$-valuation of $`\prod_v(L_v+1)`$. The sum of the right sides is the $`p`$-valuation of $`N!(N+1)!`$.

For $`p=2`$, apply the same argument at $`m=4,8,\ldots`$. At the first power $`m=2`$, the marked vertices have odd leaf counts and are disjoint from the symmetric vertices, whose two equal-size subtrees give even leaf counts. There are exactly $`N-1`$ internal vertices. Therefore the number of odd-leaf internal vertices plus $`s(T)+1`$ is at most $`N`$, which equals $`\lfloor N/2\rfloor+\lfloor(N+1)/2\rfloor`$. This pays for the $`2^{s(T)+1}`$ factor and the first layer of valuations of $`\prod_v(L_v+1)`$. All prime valuations of the denominator are thus at most those of the numerator.

For example, at $`n=3`$, the balanced and comb shapes have weights 4 and 12, respectively, summing to 16. At $`n=4`$, the corresponding plane-tree weights need not individually be integral; the plane comb has weight $`120/16`$. The grouping by unordered shape is essential to this assertion.
