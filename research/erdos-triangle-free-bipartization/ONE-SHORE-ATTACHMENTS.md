# Erdős bipartization with one-shore attachments

**Theorem.** Let $`G`$ be a triangle-free graph with an independent set $`C`$ such that $`G-C`$ is bipartite. Suppose no odd cycle meets $`C`$ exactly once. Then the deletion bound in [Erdős Problem 23](https://www.erdosproblems.com/23) holds: $`\beta(G)\le N^2/25`$, also for arbitrary nonnegative product vertex weights with total mass $`N`$.

Equivalently, each vertex of $`C`$ sees at most one bipartite shore of each connected component of $`G-C`$. If it sees both shores, a shortest path between an opposite-shore pair of neighbors gives an odd cycle through that vertex. The converse follows by deleting the sole $`C`$-vertex from an odd cycle. There is no limit on the number or sizes of components, and the components need not be complete bipartite. This removes the tail-attachment restriction from the earlier [component certificate](TRIPARTITE-COMPONENTS.md) when no repair edges need to be deleted.

## Three cut comparisons

Normalize the total vertex mass to one. Write $`c=\mu(C)`$, $`L=1-c`$, and let $`l_i=a_i+b_i`$ be the total mass of the $`i`$-th bipartite component with its two shore masses. Let $`q_i`$ be its internal edge mass, and $`x_i,y_i`$ the two edge masses from $`C`$ to its shores. Set $`Q=\sum_i q_i`$ and $`R=\sum_i(x_i+y_i)`$, so $`e=Q+R`$.

1. The cut with $`C`$ on one side and all components on the other costs $`Q`$.
2. With all of $`C`$ on one side, either put both shores of a component on the opposite side or make them opposite and choose the cheaper orientation. This gives

   $`\displaystyle \beta\le\sum_i\min(q_i,x_i,y_i) \le\frac14\sum_i l_i\min(l_i,c). \qquad(1)`$

   In fact $`q_i\le a_i b_i\le l_i^2/4`$. The one-shore condition gives $`x_i/a_i+y_i/b_i\le c`$ for positive shore masses, hence $`\min(x_i,y_i)\le c a_i b_i/l_i\le cl_i/4`$. Components with an empty shore contribute zero and satisfy the same inequality.

3. Independently orient the two largest components by mass with fair signs. In every other component keep its shores opposite and choose the orientation to make the total signed attachment mass from $`C`$ nonnegative. After these choices put each vertex of $`C`$ on its individually cheaper side. For a vertex of $`C`$, let $`u,v\ge0`$ be its weighted degrees into the two random components and $`B`$ its signed degree into the other components. The one-shore condition makes the random contribution exactly $`\varepsilon_1 u+\varepsilon_2 v`$ for independent fair signs. Its expected absolute value after adding $`B`$ is

   $`\displaystyle \frac{\max(|B|,u+v)+\max(|B|,|u-v|)}2 \ge\frac{u+v+|B|}2.`$

   Integrate and use $`\int_C|B|\ge \sum_{i>2}|x_i-y_i|`$, by the deterministic choices. The expected cost is at most half the total attachment mass minus half the integrated expected absolute signed degree. No internal component edges are lost. Thus

   $`\displaystyle \beta\le\frac R4+\frac12\sum_{i>2}\min(x_i,y_i) \le\frac R4+\frac c8(L-l_1-l_2). \qquad(2)`$

   Pad with zero-mass components if needed.

By [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179), it suffices to consider $`e\le4/25`$, which overlaps their proven dense range. Their theorem transfers to vertex product weights by the usual independent blow-up for rational weights and continuity for real weights. If $`\beta>1/25`$, bound 1 yields $`Q>1/25`$, so $`R<3/25`$. Bound (1) implies $`c(1-c)>4/25`$, hence $`1/5<c<4/5`$. Bound (2) now implies
```math
 l_1+l_2\lt L-\frac{2}{25c}=:s.
```
The packing inequality below then contradicts (1).

## Packing inequality

Let $`1/5\le c\le4/5`$, $`L=1-c`$, $`a=2/(25c)`$, $`s=L-a`$, and $`h=s/2`$. For nonnegative decreasing masses $`l_i`$ of sum $`L`$, if $`l_1+l_2\le s`$ then
```math
 \sum_i l_i\min(l_i,c)\le 4/25. \tag{3}
```
We prove this using only one-dimensional convexity. Throughout $`0<h\le c`$ (the latter is $`3c^2-c+2/25\ge0`$). Put $`x=l_1`$.

If $`c\ge3/10`$ and $`x\le h`$, all terms are bounded in sum by $`hL\le4/25`$. The latter difference is $`-(5c-1)(5c^2-9c+2)/(50c)`$, nonnegative in this range. If instead $`1/5\le c\le3/10`$ and $`x\le h`$, the maximum sum of squares under the cap $`h`$ is obtained by packing coordinates at the cap and at most one remainder. This follows by moving weight from the smaller to the larger of any two interior coordinates until one reaches an endpoint. Now $`3h\le L\le4h`$, since $`4/25\le cL\le6/25`$. Thus the bound is $`3h^2+(L-3h)^2\le4/25`$: subtracting this expression from $`4/25`$ gives
```math
 -\frac{(5c-1)(125c^3-225c^2+90c-12)}{625c^2}\ge0.
```
The cubic is concave on $`[1/5,3/10]`$; its tangent at $`1/4`$ has value $`-103/64`$ and slope $`15/16`$, so the cubic is negative on the interval.

For $`x\ge h`$, all remaining coordinates are at most $`s-x\le h\le c`$. A simple upper bound for the sum is
```math
 f(x)=x\min(x,c)+(L-x)(s-x).
```
It is convex on each side of $`x=c`$. The values at $`x=s`$ and at $`x=c`$, when that point is in the range, are at most $`4/25`$. Indeed, for $`c\le2/5`$, $`f(s)=cs=c(1-c)-2/25\le4/25`$; for $`c\ge2/5`$, $`s\le c`$ and $`s\le2/5`$, so $`f(s)=s^2\le4/25`$. The point $`c`$ can be in the range only when $`c\le2/5`$, and
```math
 c\bigl(f(c)-4/25\bigr)=(c-1/5)(c-2/5)(5c-1)\le0.
```
When $`c\ge3/10`$, this finishes by also checking $`f(h)=hL`$. When $`c\le3/10`$, it handles $`x\ge c`$, and on $`[h,c]`$ we use the sharper cap packing. In this interval $`2(s-x)\le L-x\le3(s-x)`$: at the first endpoint the left inequality is $`3h\le L`$; for the right inequality it suffices that $`c\le s-a/2`$, equivalent to $`2c^2-c+3/25\le0`$ on $`[1/5,3/10]`$. So the square sum of the remaining coordinates is at most $`2(s-x)^2+(L-x-2(s-x))^2`$. Adding $`x^2`$ gives a convex quadratic on $`[h,c]`$. At $`h`$ its value is the cap bound already checked; at $`c`$ it is no larger than $`f(c)`$, because each packed coordinate is at most $`s-c`$. This proves (3).

The balance of the argument is that a counterexample must concentrate enough mass in its bipartite components to defeat (1), but simultaneously spread that mass far enough beyond its two largest components to defeat (2). The packing inequality rules out both at once. In the unrestricted problem a vertex of $`C`$ can see both shores of the same component; the random signs in (2) no longer give its full attachment degree as a coefficient. This theorem therefore does not resolve the unrestricted conjecture.

## A perturbation allowance

The same sharp $`1/25`$ conclusion holds if the one-shore condition can be restored by deleting edges of total mass at most $`\eta=10^{-9}`$. This is an explicit but unoptimized tolerance, independent of graph order and number of components.

Write $`\delta=1/4000`$. First strengthen (3): for $`c\in[1/5,4/5]`$, if $`l_1+l_2\le s-\delta`$, then
```math
 \sum_i l_i\min(l_i,c)\le 4/25-3\delta^2/4. \tag{4}
```
For each $`v\ge0,b>0`$ let $`H(v,b)=k b^2+(v-kb)^2`$ with $`k=\lfloor v/b\rfloor`$, the maximum square sum of total mass $`v`$ at cap $`b`$. On an interval with $`k=2`$ or $`3`$, the derivative in $`b`$ is $`2k((k+1)b-v)\ge0`$ and has slope at least 12. Thus reducing the cap by $`u`$ within the range $`2\le v/b<4`$ reduces $`H`$ by at least $`3u^2`$: there are at most two pieces, each contributing at least six times its squared length.

For $`c\ge3/10,x\le h`$, the old bound $`hL`$ is at most its value $`91/600`$ at $`3/10`$ (differentiate). It already has the required gap. Whenever the proof used $`f(x)`$ with $`x\ge h`$, its new upper bound is $`f(x)-\delta(L-x)`$, improving by at least $`\delta/10`$, since $`L-x\ge2/(25c)\ge1/10`$. This treats the entire $`x\ge h`$ range for $`c\ge3/10`$, and $`x\ge c`$ for smaller $`c`$.

For $`c\in[1/5,3/10]`$ and $`h\le x\le c`$, use $`H`$ on the tail of total $`L-x`$. Its previous cap $`s-x`$ is at least $`2/15`$ (minimize $`s-c=1-2c-2/(25c)`$ at an endpoint of the interval), and the previous ratio was between 2 and 3. The cap decreases by $`\delta`$; the new ratio is still less than 4, so the gap is at least $`3\delta^2`$. Finally, if $`x\le h`$, all coordinates but the largest are at most $`h-\delta/2`$ if $`x\ge h-\delta/2`$; otherwise all coordinates satisfy that cap. In either case the new sum of squares is at most $`h^2+H(L-h,h-\delta/2)`$. To see this, start the leading coordinate at $`\max(x,h-\delta/2)`$ and raise it to $`h`$, reducing the tail total accordingly. The leading square grows with slope at least $`2(h-\delta/2)`$, and $`H`$ decreases with slope at most that much in its total-mass argument. Because $`2\le (L-h)/h\le3`$ and $`h\ge1/5`$, reducing the old tail cap from $`h`$ by $`\delta/2`$ gives the gap $`3\delta^2/4`$. This proves (4).

To apply it, assume $`G`$ violates the bound and first use the [dense theorem](https://arxiv.org/html/2103.14179) to restrict to $`e\le3197/20000`$. Let $`G'`$ be its repaired graph. Then $`\beta(G')>1/25-\eta`$. The three cut comparisons for $`G'`$ give $`Q>1/25-\eta`$, $`R<2397/20000+\eta`$, and
```math
 \sum_i l_i\min(l_i,c)>4/25-4\eta,\qquad
 c(L-l_1-l_2)>803/10000-10\eta.
```
For $`c\in[1/5,4/5]`$ this implies the premise of (4), a contradiction. For $`c>4/5`$, the sum is at most $`L^2<1/25`$. For $`c<1/5`$, the first inequality implies $`cL>4/25-4\eta`$, so $`d=1/5-c<20\eta/3`$. Rescale all the component masses down to total $`4/5`$ and replace $`c`$ by $`1/5`$. The sum in (4) decreases by at most $`2d`$, because increasing $`c`$ helps and the summand is $`2`$-Lipschitz in the mass on $`[0,1]`$. The new sum remains above $`4/25-18\eta`$. The original upper bound on the two largest masses was $`1-c-(803/10000-10\eta)/c`$, an increasing function for $`c\le1/5`$, so after scaling the largest-two sum is at most $`2/5-\delta`$. Apply (4) at $`c=1/5`$ for the contradiction, using $`18\eta<3\delta^2/4`$.

In particular this gives a condition in terms of missing edges in the induced bipartite remainder. Put $`D=\sum_i(a_i b_i-q_i)`$. In a component, any vertex of $`C`$ with weighted shore degrees $`r,s`$ satisfies $`rs\le a_i b_i-q_i`$, since the two neighborhoods cannot have edges between them. For any $`t>0`$, delete the internal edges in components of mass at most $`t`$, costing at most $`tL/4`$. In bigger components delete each $`C`$-vertex's smaller shore attachment; by Cauchy–Schwarz this costs at most $`c\sqrt{LD/t}`$. Thus the theorem also applies whenever $`tL/4+c\sqrt{LD/t}\le\eta`$ for some $`t>0`$, without assuming a fixed number of components. Neither condition follows from triangle-freeness alone.

## Odd Kneser graphs and dominating pentagons

The theorem applies to **every graph homomorphic to an odd Kneser graph** $`KG(2k+1,k)`$, $`k\ge2`$, with arbitrary product weights. Its vertices are the $`k`$-subsets of a $`(2k+1)`$-element ground set, and disjoint sets are adjacent. Fix one element $`t`$. The vertices containing $`t`$ form an independent set $`C`$. The graph remaining after deleting $`C`$ is a matching: on the $`2k`$ other elements each $`k`$-set is adjacent only to its complement. A vertex of $`C`$ cannot be disjoint from both endpoints of one of those matching edges, since its other $`k-1>0`$ elements lie in their union. Thus the one-shore condition holds. In a homomorphic preimage the matching edges lift to separate bipartite blocks, possibly with further splits, and the same condition remains true. For $`k>2`$ the conclusion here is the ordinary $`N^2/25`$ bound, not the sharper higher-odd-girth conjecture.

In particular this proves the weighted bound for Petersen preimages, since the Petersen graph is $`KG(5,2)`$. This is not an odd-$`K_5`$-minor-free example: in the two-pentagon-and-spokes model, use the five spokes as the branch trees, put one pentagon on one color and the other on the opposite color, and note that their two cycles give complementary pairs of branch adjacencies. All inter-tree edges join equal colors, yielding an odd $`K_5`$ model. The one-shore theorem therefore gives a separate route from the odd-minor transfer.

A triangle-free, four-cycle-free template with a dominating pentagon $`v_0,\ldots,v_4`$ maps to Petersen. Every exterior vertex sees exactly one root: domination ensures at least one, while two neighboring roots make a triangle and two nonneighboring roots make a four-cycle using their intermediate root. Map every vertex attached to $`v_i`$ to the inner-spoke partner of $`v_i`$. There is no edge between two vertices assigned the same partner (triangle), nor between partners of consecutive roots (four-cycle). All remaining allowed edges match the inner pentagram. This also applies to any subgraph of an arbitrarily weighted blow-up of the template.

The usual $`2k+1`$ cuts by membership of individual ground-set elements are not enough to show the sharper $`N^2/(2k+1)^2`$ bound for $`k\ge3`$. To see this, choose disjoint $`k`$-sets $`A,B`$, with omitted element $`t`$, give $`A,B`$ mass $`1/4`$ each, and give their other $`2k`$ neighbors mass $`1/(4k)`$ each. Each of those neighbors contains $`t`$; they induce no edges, and each is attached to just its designated center $`A`$ or $`B`$. The support is a bipartite double star. For the membership cut at an element $`j`$, the only monochromatic edges are those whose union omits $`j`$. These cost $`1/16`$ when $`j=t`$, and $`1/(16k)`$ for every other $`j`$. The latter exceeds $`1/(2k+1)^2`$ for $`k\ge3`$. The actual optimum is zero. Thus the obstruction concerns the cut family, not Erdős's conjecture.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
