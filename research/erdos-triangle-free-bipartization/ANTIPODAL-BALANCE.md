# Antipodal balance and a sharp-cut obstruction at every odd girth

This note concerns the circular model for the [Erdős deletion conjecture](https://www.erdosproblems.com/23). Fix odd \(q\ge3\), and write \(g=q+2\). Put positive vertex masses summing to one on a circle of circumference one. Allowed edges have shorter distance greater than \((q-1)/(2q)\); their costs are endpoint-mass products. All upper bounds below permit arbitrary deletion of allowed edges. They do not presuppose degree regularity or bound the number of vertices.

## A cut bound from antipodal balance

Let \(\mu\) be the weighted vertex measure and \(\mu^\pi\) its translate by half a turn. Put \(r=\|\mu-\mu^\pi\|_{\rm TV}\), where total variation is the supremum of the absolute difference on events (so \(0\le r\le1\)). Then some geometric semicircle cut has missed cost at most
```math
\frac{[1+(\sqrt2-1)r]^2}{2q^2}.
```
In particular every antipodally symmetric weighting satisfies the Erdős bound at all \(g\ge7\), even with irregular degrees and edges missing. More generally, the result suffices if
```math
r\le \frac{\sqrt2\,q/(q+2)-1}{\sqrt2-1}.
```
The right-hand side tends to one as the odd girth grows. The proof only needs a potentially smaller, coarse imbalance defined below.

Project by doubling angles modulo one and choose \(q\) equally spaced seams in the projected circle, none through a vertex. Number the intervening cells cyclically. With respect to either lift of the initial seam, write \(a_i,b_i\) for the masses in the two lifts of cell \(i\), and set \(s_i=a_i+b_i,\ t_i=a_i-b_i\). The coarse imbalance is \(\sum_i|t_i|\le r\), since these signed masses are \((\mu-\mu^\pi)\) evaluated on one lift per cell; choosing the positive lifts realizes their absolute sum as a difference on one event. The same proof works with any chosen seams, so one can minimize this coarse imbalance over the angular offset.

At the seam between \(i\) and \(i+1\), take the cut into the two original geometric semicircles with endpoints over that seam. If an allowed edge is missed, its two endpoints in one semicircle have clockwise separation greater than \((q-1)/(2q)\) and at most \(1/2\), in their order inside that semicircle. Their projected short arc has length less than \(1/q\) and straddles the seam. Thus the endpoints lie in the two neighboring projected cells. The candidate cell products come in complementary sheet pairs. Depending on the seam and initial lift, their sum is either \(a_i a_{i+1}+b_i b_{i+1}\) or \(a_i b_{i+1}+b_i a_{i+1}\). Consequently the missed edge cost is at most
```math
\frac{s_i s_{i+1}+|t_i t_{i+1}|}{2}
\le \frac{\sqrt{s_i^2+t_i^2}\sqrt{s_{i+1}^2+t_{i+1}^2}}{2}.
```
The minimum of the \(q\) adjacent norm products is at most the square of the mean norm: first use the geometric mean of the products, then arithmetic–geometric mean on the norms. On \(0\le |t_i|\le s_i\), the chord bound for the convex function \(\sqrt{s_i^2+x^2}\) gives
\(\sqrt{s_i^2+t_i^2}\le s_i+(\sqrt2-1)|t_i|\).
Sum over the cells to obtain the result.

## No unrestricted theorem using only geometric semicircles

For every odd \(g\ge5\) there is a weighted \(C_g\) at this angular threshold for which every geometric semicircle misses at least \(1/(g^2-1)\), but the true optimum is \(1/(g+1)^2\). This extends the [fixed semicircle obstruction](FIXED-HEINIG-ROTATIONS.md) beyond the triangle-free threshold.

Put point \(v_j\) at phase \(jq/[2(q+1)]\) modulo one, for \(0\le j\le q+1\). Let \(l\) be a positive index difference. If \(l\) is even, the shorter distance is \(l/[2(q+1)]\); among these even differences only \(l=q+1\) exceeds the allowed threshold. If \(l\) is odd, the shorter distance is \((q+1-l)/[2(q+1)]\); only \(l=1\) exceeds the threshold. So the graph is exactly the displayed path closed by its two antipodal endpoints. Give the even positions mass \(1/(g+1)\) and the odd positions mass \(1/(g-1)\). Every path edge then costs \(1/(g^2-1)\), and the antipodal closing edge costs \(1/(g+1)^2\). Every semicircle cut separates the antipodal endpoints and, by odd parity, misses a path edge. The optimal unrestricted cut crosses the path and leaves only its closing edge. Use half-open semicircles throughout so that the claim also applies when an endpoint lies on the cut boundary.

Thus every counterexample search based on angular cuts must distinguish failure of a geometric cut family from failure of the Erdős bound itself. The [one-sector obstruction](TWO-SECTOR-CUTS.md) addresses a different family from these angular semicircles.
