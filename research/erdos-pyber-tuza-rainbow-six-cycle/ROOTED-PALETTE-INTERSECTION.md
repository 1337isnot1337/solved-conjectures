# Rooted triangle palette families always intersect

This is a constraint for [Erdős #811](https://www.erdosproblems.com/811), not a solution to the rainbow-six-cycle case. Together with the [rooted complement obstruction](ROOTED-TRANSVERSALS.md), it gives intersecting, complement-free local palette families at almost every pair of roots in a zero-cycle graphon.

**Theorem.** In any balanced six-color graphon, for almost every pair of vertices there is a rainbow triangle palette occurring with positive rooted density at both vertices. More quantitatively, let $R_\delta(x)$ be the set of palettes with rooted density strictly greater than $\delta$. For $0<\delta<7/2880$,
```math
\mu^{\otimes2}\{(x,y):R_\delta(x)\cap R_\delta(y)=\varnothing\}\le480\delta.
```
In finite completely balanced colorings the qualitative assertion holds for every pair of vertices as soon as there are at least five colors.

## Overlap from a poorly tagged edge

Use $t=1/6$ for each row degree. For fixed roots $x,y$ and a hue $a$ on their mutual edge, write $v_a(x,y)$ for the probability over a random vertex $z$ that the three edges of the triangle $xyz$ are rainbow, conditional on hue $a$ at $xy$. In the fractional setting, sample the two colors on $xz,yz$ independently conditional on $z$; in a deterministic kernel this is just their actual color pair.

Let $U_i$ be the event in this extended probability space that both sampled hues are $i$, and let $U$ be their union. Write $u_i=\mu(U_i)\le t$ and $u=\sum_i u_i$. Each disagreement between the two labels either involves $a$ or contributes to $v_a(x,y)$. Each label equals $a$ with probability $t$. Hence
```math
u\ge1-2t-v_a(x,y).
```

Take two independent extended vertices $z,w$. If they fall in different classes $U_i,U_j$, any color on $zw$ other than $i,j$ makes a triangle of the same rainbow palette at both roots. Cross pairs have probability $u^2-\sum_i u_i^2$. The ordered mass of cross pairs whose edge has the first endpoint's label is at most $tu$ by row balance; the same holds for the second endpoint. This remains true under the auxiliary sampling because projection onto the original vertex space preserves its probability law. Thus the probability of the same rainbow palette at the two roots is at least
```math
u^2-\sum_i u_i^2-2tu\ge u(u-3t).
```
For $v_a(x,y)\le1/12$ we get $u\ge7/12$, so the common rainbow probability is at least $7/144$. Split it among the twenty palettes. Some common palette has both rooted densities at least $7/2880$.

Now consider a pair whose two threshold families are disjoint. For every possible hue of its edge we must have $v_a(x,y)>1/12$. Furthermore any rainbow triangle on that edge uses a palette that has rooted density at most $\delta$ at one endpoint. In the entire triangle-sampling space, the measure of triangles for which a specified endpoint has rooted density at most $\delta$ in their palette is at most $20\delta$, by integrating the twenty rooted functions over their low-density sets. Either endpoint gives a combined bound $40\delta$. The disjoint-threshold pairs have conditional rainbow-triangle extension probability above $1/12$, so their measure is at most $480\delta$. Taking $\delta$ to zero proves the almost-everywhere assertion.

## A finite strengthening

Let a coloring of $K_{mt+1}$ with $m$ hues be completely balanced, with positive integer color degree $t$. Suppose $x,y$ have no common rooted rainbow palette, and call the hue of $xy$ equal to $a$. No rainbow triangle uses this edge. Among the $mt-1$ other vertices, every disagreement of the two incident labels involves $a$. Each root has only $t-1$ edges of hue $a$ other than $xy$. Thus the set $U$ of agreeing vertices has size at least $(m-2)t+1$.

Partition $U$ into equal-label classes $U_i$, each of size at most $t$. On different classes every edge must have one of the two class labels, since otherwise it gives the same rainbow palette at both roots. Each unordered cross edge is then chargeable to exactly one of its endpoints, the endpoint whose label agrees. No vertex receives more than $t$ charges. Therefore
```math
|U|^2-\sum_i |U_i|^2\le 2t|U|.
```
Since $\sum_i |U_i|^2\le t|U|$, this forces $|U|\le3t$, a contradiction for $m\ge5$.

## Consequences and limitation

In the zero-cycle setting, group roots by their exact positive rainbow palette family. Every pair of types of positive measure must share a palette, each type meets all pairing transversals and avoids complementary palettes, and (by finite palette count) this restricts the joint type supports, not just each type in isolation. It does **not** prohibit complementary palettes at different roots: two types can share a third palette while realizing opposite complementary ones. Nor does it imply that a common palette extends on the edge between those roots.

The [source paper](https://doi.org/10.1016/S0167-5060(08)70377-7), [the modern balanced-coloring paper](https://doi.org/10.1002/jgt.23063) and the [public working report](https://www.erdosproblemaday.com/report/811) were checked for the matching rooted-palette assertion; their rainbow triangle counts and global palette results do not give a shared rooted palette for each pair. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
