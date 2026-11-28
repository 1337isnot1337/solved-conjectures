# Fractional general position conjecture for square grids

The [transport construction](ASYMPTOTIC.md) in [#909](https://github.com/1337isnot1337/solved-conjectures/issues/909) gives a bounded rather than square-root additive error:
```math
\mathop{\mathrm{gp}}_f(P_n\square P_n)=(4-2\sqrt2)n+O(1).
```
The exact conjectured formula remains open. The new observation is that every level curve of the transport density, when parametrized in the right direction, has speed at most one. Its rounding discrepancies can therefore be covered by a constant number of actual grid paths at each deficit level.

## Finite potential throughout the open window

Use the notation $L=1/\sqrt2$, $w=1-L$ and the finite positive numbers $h_i$ in Section 1 of the transport construction. Normalize the first bin potential to one. Every bin entirely in $[0,w]$ sees the identical row $c_{ij}=1$ for all $j$, so its potential equals one. The potentials are nondecreasing in the bins.

Along a subsequence their step interpolations converge in $[1,\infty]$ at all rational positions. The limiting potential is finite throughout $[0,L)$. Otherwise there is a transition $a_0\in[w,L)$ above which the potentials diverge and below which their limits are finite. On almost every pair $a<a_0<b$ the orientation fraction assigned to the lower endpoint tends to zero, by bounding the two potentials with rational positions strictly between them and the transition. Integrate the constant row demands over $[0,a_0]$. The internal allocation is always half the total internal cell weight, and, by dominated convergence, the cross allocation to those rows vanishes. This would give
```math
wa_0=\tfrac12\mathop{\mathrm{area}}(D\cap[0,a_0]^2),
```
contrary to the strict subset inequality. Thus the limiting potential $h$ is finite on the open window; there $r(a,b)=h(a)/(h(a)+h(b))$.

Put $k=\log h$. It equals zero on $[0,w]$ and is continuous on $[0,L)$. Indeed the row equation there is
```math
\int_0^{B(a)} \frac{1}{1+\exp(k(b)-k(a))}\,db=w,\qquad B(a)=\min(L,1-a).
```
For fixed $a$ the left side is continuous and strictly increasing as a function of the scalar $k(a)$, and $B(a)$ varies continuously. Comparing one-sided limits proves continuity, first using the equation on rational positions and then extending. At $a=w$ the same uniqueness holds and the common earlier solution is zero. As $a\uparrow L$, the row tends to density one on $[0,w]$, so $k(a)\to\infty$, since $k(b)=0$ on that interval.

## The potential is convex

For $w<a<L$, the implicit-function theorem on the row equation gives
```math
k'(a)=\frac{p(a,B(a))}{J(a)},\qquad
J(a)=\int_0^{B(a)}p(a,b)(1-p(a,b))\,db.
```
The denominator is positive. The numerator is nondecreasing, since $a$ increases and $B(a)$ decreases. Also $J(a)=w-\int p(a,b)^2db$ is nonincreasing. To see the latter, compare two rows $a<a'$. The density weakly increases on their common interval $[0,B(a')]$ and loses precisely the same mass on the right tail. On the common interval the old density is at least $p(a,B(a'))$; on the tail it is at most that number. The integral of its square therefore cannot decrease: the square gained on the common interval is at least this number times the moved mass, and the square lost on the tail is at most this number times that mass. It follows that $k'(a)>0$ and is nondecreasing. Together with the constant initial segment this makes $k$ convex throughout.

## Each discrepancy level fits on constantly many paths

Let $h_n=1/(n-1)$. Away from the exceptional strips of the rounding construction, the coverage deficit is at most the sum of the two row oscillations
```math
r(a,b-h_n)-r(a,b+h_n),\qquad r(b,a-h_n)-r(b,a+h_n).
```
The exceptional strips have bounded widths in integer rotated coordinates: those around the two zero coordinates, those around the clipping levels $\pm L(n-1)$, and the grid boundary. They are contained in a constant number of grid rows, columns and rotated rank lines, each a subset of one geodesic. Cover those strips separately at constant cost.

Consider the first oscillation, and write it as the integral over $\lambda\in(0,1)$ of the indicator that the row of $r$ crosses level $\lambda$ in $[b-h_n,b+h_n]$. Work first in a quadrant of the rotated coordinates, where $a,b\ge0$. Put $\ell=\log(\lambda/(1-\lambda))$. Since $r(a,b)\ge\lambda$ exactly when $k(b)\le k(a)-\ell$, every crossing vertex lies within $h_n$ in the $b$ coordinate of the threshold curve
```math
b=\beta(a)=k^{-1}(k(a)-\ell),
```
where the strictly increasing inverse on $(0,\infty)$ is given the endpoint value $k^{-1}(0)=w$.

If $\ell<0$, the curve is defined for the entire window and lies at or above $a$. It is nondecreasing and 1-Lipschitz: on the increasing segment of $k$ its derivative is $k'(a)/k'(\beta(a))\le1$ by convexity, and on the constant segment the curve is constant. For $\ell=0$ the curve is $\max(a,w)$ with the same property. If $\ell>0$, only the rows with $k(a)\ge\ell$ can cross. There $\beta(a)\le a$, and $\beta'(a)\ge1$ by convexity. Its inverse is 1-Lipschitz, including the endpoint by continuity. After extending that inverse constantly beyond its domain, a $\le h_n$ vertical displacement from the curve implies a $\le h_n$ horizontal displacement from the inverse curve.

In either case, at each discrete rank of the relevant orientation every crossing vertex is at distance at most one in the other integer coordinate from a speed-one trajectory. Extend the trajectory constantly outside its given rank interval, and clip it to the diamond boundary; clipping preserves the Lipschitz property and cannot increase distance to a legal vertex of that rank. Round it to the two parity-compatible nearest integers, using the two different tie conventions to produce two legal geodesics as in the transport construction. At a given rank these two paths include every legal position within one of the unrounded trajectory (spacing of eligible positions is two). Thus at most two paths cover the crossing vertices in each quadrant. Reflecting across the axes covers all four quadrants at cost at most eight for that level. The same holds for the second oscillation after swapping coordinates.

Give each such level cover its Lebesgue weight, or sum over the finitely many intervals formed by the actual level values for the grid. It covers the full sum of oscillations at cost at most sixteen. Adding the constant exceptional-strip cost to the base cover of weight $2(n-1)w$ yields the desired $O(1)$ error after doubling. The [Fitzpatrick–Janssen–Nowakowski lower bound](https://cdn.dal.ca/content/dam/dalhousie/pdf/faculty/computerscience/technical-reports/CS-2004-02.pdf) with rounded optimal truncation has the same leading constant and bounded error.
