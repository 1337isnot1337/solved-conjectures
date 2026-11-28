# Erdős bipartization with one-shore attachments

**Theorem.** Let \(G\) be a triangle-free graph with an independent set \(C\) such that \(G-C\) is bipartite. Suppose no odd cycle meets \(C\) exactly once. Then the deletion bound in [Erdős Problem 23](https://www.erdosproblems.com/23) holds: \(\beta(G)\le N^2/25\), also for arbitrary nonnegative product vertex weights with total mass \(N\).

Equivalently, each vertex of \(C\) sees at most one bipartite shore of each connected component of \(G-C\). If it sees both shores, a shortest path between an opposite-shore pair of neighbors gives an odd cycle through that vertex. The converse follows by deleting the sole \(C\)-vertex from an odd cycle. There is no limit on the number or sizes of components, and the components need not be complete bipartite. This removes the tail-attachment restriction from the earlier [component certificate](TRIPARTITE-COMPONENTS.md) when no repair edges need to be deleted.

## Three cut comparisons

Normalize the total vertex mass to one. Write \(c=\mu(C)\), \(L=1-c\), and let \(l_i=a_i+b_i\) be the total mass of the \(i\)-th bipartite component with its two shore masses. Let \(q_i\) be its internal edge mass, and \(x_i,y_i\) the two edge masses from \(C\) to its shores. Set \(Q=\sum_i q_i\) and \(R=\sum_i(x_i+y_i)\), so \(e=Q+R\).

1. The cut with \(C\) on one side and all components on the other costs \(Q\).
2. With all of \(C\) on one side, either put both shores of a component on the opposite side or make them opposite and choose the cheaper orientation. This gives
   ```math
   \beta\le\sum_i\min(q_i,x_i,y_i)
      \le\frac14\sum_i l_i\min(l_i,c). \tag{1}
   ```
   In fact \(q_i\le a_i b_i\le l_i^2/4\). The one-shore condition gives \(x_i/a_i+y_i/b_i\le c\) for positive shore masses, hence \(\min(x_i,y_i)\le c a_i b_i/l_i\le cl_i/4\). Components with an empty shore contribute zero and satisfy the same inequality.

3. Independently orient the two largest components by mass with fair signs. In every other component keep its shores opposite and choose the orientation to make the total signed attachment mass from \(C\) nonnegative. After these choices put each vertex of \(C\) on its individually cheaper side. For a vertex of \(C\), let \(u,v\ge0\) be its weighted degrees into the two random components and \(B\) its signed degree into the other components. The one-shore condition makes the random contribution exactly \(\varepsilon_1 u+\varepsilon_2 v\) for independent fair signs. Its expected absolute value after adding \(B\) is
   ```math
   \frac{\max(|B|,u+v)+\max(|B|,|u-v|)}2
     \ge\frac{u+v+|B|}2.
   ```
   Integrate and use \(\int_C|B|\ge \sum_{i>2}|x_i-y_i|\), by the deterministic choices. The expected cost is at most half the total attachment mass minus half the integrated expected absolute signed degree. No internal component edges are lost. Thus
   ```math
   \beta\le\frac R4+\frac12\sum_{i>2}\min(x_i,y_i)
      \le\frac R4+\frac c8(L-l_1-l_2). \tag{2}
   ```
   Pad with zero-mass components if needed.

By [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179), it suffices to consider \(e\le4/25\), which overlaps their proven dense range. Their theorem transfers to vertex product weights by the usual independent blow-up for rational weights and continuity for real weights. If \(\beta>1/25\), bound 1 yields \(Q>1/25\), so \(R<3/25\). Bound (1) implies \(c(1-c)>4/25\), hence \(1/5<c<4/5\). Bound (2) now implies
```math
 l_1+l_2<L-\frac{2}{25c}=:s.
```
The packing inequality below then contradicts (1).

## Packing inequality

Let \(1/5\le c\le4/5\), \(L=1-c\), \(a=2/(25c)\), \(s=L-a\), and \(h=s/2\). For nonnegative decreasing masses \(l_i\) of sum \(L\), if \(l_1+l_2\le s\) then
```math
 \sum_i l_i\min(l_i,c)\le 4/25. \tag{3}
```
We prove this using only one-dimensional convexity. Throughout \(0<h\le c\) (the latter is \(3c^2-c+2/25\ge0\)). Put \(x=l_1\).

If \(c\ge3/10\) and \(x\le h\), all terms are bounded in sum by \(hL\le4/25\). The latter difference is \(-(5c-1)(5c^2-9c+2)/(50c)\), nonnegative in this range. If instead \(1/5\le c\le3/10\) and \(x\le h\), the maximum sum of squares under the cap \(h\) is obtained by packing coordinates at the cap and at most one remainder. This follows by moving weight from the smaller to the larger of any two interior coordinates until one reaches an endpoint. Now \(3h\le L\le4h\), since \(4/25\le cL\le6/25\). Thus the bound is \(3h^2+(L-3h)^2\le4/25\): subtracting this expression from \(4/25\) gives
```math
 -\frac{(5c-1)(125c^3-225c^2+90c-12)}{625c^2}\ge0.
```
The cubic is concave on \([1/5,3/10]\); its tangent at \(1/4\) has value \(-103/64\) and slope \(15/16\), so the cubic is negative on the interval.

For \(x\ge h\), all remaining coordinates are at most \(s-x\le h\le c\). A simple upper bound for the sum is
```math
 f(x)=x\min(x,c)+(L-x)(s-x).
```
It is convex on each side of \(x=c\). The values at \(x=s\) and at \(x=c\), when that point is in the range, are at most \(4/25\). Indeed, for \(c\le2/5\), \(f(s)=cs=c(1-c)-2/25\le4/25\); for \(c\ge2/5\), \(s\le c\) and \(s\le2/5\), so \(f(s)=s^2\le4/25\). The point \(c\) can be in the range only when \(c\le2/5\), and
```math
 c\bigl(f(c)-4/25\bigr)=(c-1/5)(c-2/5)(5c-1)\le0.
```
When \(c\ge3/10\), this finishes by also checking \(f(h)=hL\). When \(c\le3/10\), it handles \(x\ge c\), and on \([h,c]\) we use the sharper cap packing. In this interval \(2(s-x)\le L-x\le3(s-x)\): at the first endpoint the left inequality is \(3h\le L\); for the right inequality it suffices that \(c\le s-a/2\), equivalent to \(2c^2-c+3/25\le0\) on \([1/5,3/10]\). So the square sum of the remaining coordinates is at most \(2(s-x)^2+(L-x-2(s-x))^2\). Adding \(x^2\) gives a convex quadratic on \([h,c]\). At \(h\) its value is the cap bound already checked; at \(c\) it is no larger than \(f(c)\), because each packed coordinate is at most \(s-c\). This proves (3).

The balance of the argument is that a counterexample must concentrate enough mass in its bipartite components to defeat (1), but simultaneously spread that mass far enough beyond its two largest components to defeat (2). The packing inequality rules out both at once. In the unrestricted problem a vertex of \(C\) can see both shores of the same component; the random signs in (2) no longer give its full attachment degree as a coefficient. This theorem therefore does not resolve the unrestricted conjecture.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
