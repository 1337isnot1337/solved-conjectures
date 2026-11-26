# Fractional general position conjecture for square grids

**Exact even-order theorem.** For every even $`n\ge4`$,

```math
\mathop{\mathrm{gp}}_f(P_n\square P_n)= \max_{0\le t\le n/2}\frac{2(n^2-2t(t+1))}{2n-2t-1}.
```

This proves the complete even-order assertion of [Conjecture 5.38](https://arxiv.org/html/2501.19385v5#S5.SS4), not just an asymptotic estimate or finitely many grid sizes. The exact odd-order assertion is separate.

## 1. The rank graph and its linear potential

Put $`N=n-1`$. In rotated coordinates $`u=i+j-N`$ and $`v=i-j`$, the grid consists of the points with $`|u|+|v|\le N`$ and $`u+v\equiv N\pmod2`$. A northeast corner-to-corner path advances $`u`$ by one and changes $`v`$ by one at every step; the other orientation exchanges $`u`$ and $`v`$.

Choose $`t`$ attaining the displayed maximum, put $`L=N-t`$, and put

```math
W=\frac{n^2-2t(t+1)}{2(2n-2t-1)}.
```

Comparing the objective at $`t`$ with its two neighbors gives $`t\le W\le t+1`$: passing from $`t`$ to $`t+1`$ removes $`4(t+1)`$ vertices from the numerator and subtracts four from the denominator in the definition of $`W`$. The analogous comparison with $`t-1`$ gives the other bound. For $`n\ge4`$ neither endpoint $`t=0`$ nor $`t=n/2`$ is a maximizer: at the former $`W>1`$ and at the latter $`W \lt t`$, so the indicated neighboring value is larger. In particular $`1\le t \lt n/2`$.

On the signed rank set $`\{-L,\dots,L\}`$, make a graph joining $`u,v`$ when $`(u,v)`$ is an allowed grid point. It is bipartite (since $`N`$ is odd) and connected: even ranks meet rank $`1`$, and odd ranks meet rank $`0`$. Its sum of degrees is $`n^2-2t(t+1)`$, since it counts exactly the grid outside the four truncated corner triangles. Let $`d_u`$ denote the rank degree. Solve the graph Laplacian equations

```math
d_u h_u-\sum_{v\sim u}h_v=W-d_u/2.
```

The right-hand side sums to zero, so a solution exists. Averaging the solution under reflection makes $`h_{-u}=h_u`$. On an allowed pair of active ranks define

```math
P(u,v)=\tfrac12+h_{|u|}-h_{|v|}.
```

Its row sum is $`W`$, and $`P(u,v)+P(v,u)=1`$. On active rows $`|u|\le L`$, set $`P(u,v)=0`$ if $`|v|>L`$. We next prove nonnegativity and justify a path flow with these row marginals.

## 2. Boundary recurrence and interlacing of the potential

Write $`h_a`$ for the nonnegative ranks. Rows of the same parity with $`0\le a\le t+1`$ have identical neighbor sets, and thus identical potentials. This uses the fact that at $`a=t+1`$ the allowance $`|v|\le L-1`$ excludes only the parity not permitted in that row.

For $`t\le a\le L`$ put $`x_a=P(a,N-a)`$ on the sloping boundary, and write $`B=N-a`$. When $`a`$ increases by two, the neighbor set loses precisely the two extreme entries $`\pm B`$. The equal row-sum equations give

```math
h_{a+2}-h_a=\frac{2x_a}{B-1}\qquad(t\le a\le L-2).
```

Since $`x_{N-a}=1-x_a`$, applying the same difference to the opposite boundary rank yields

```math
x_{a+2}-x_a=\frac{2x_a}{B-1}+ \frac{2(1-x_{a+2})}{a+1}.
```

For the final two rows, all allowed neighbors are in the parity-specific constant range, so

```math
x_L=\frac{W}{t+1},\qquad x_{L-1}=\frac{W}{t+2}.
```

Reflection then gives $`x_t,x_{t+1}\ge0`$. The recurrence writes each $`x_{a+2}`$ as a positive multiple of $`x_a`$ plus a positive constant, so all $`x_a\ge0`$. Reflection gives $`x_a\le1`$ as well.

Set $`q_a=(a+1)(N-a+1)`$ and $`z_a=q_ax_a`$. The boundary recurrence is

```math
z_{a+2}-z_a=2(N-a-1),\qquad z_a=Na-a^2/2+C_{a\bmod2}.
```

The two final rows give $`z_L=(L+1)W`$, $`z_{L-1}=LW`$. Consequently the difference of the two constants, taken in the order of these final ranks, is $`W-t-1/2`$, of magnitude at most $`1/2`$. Hence $`z_{a+1}-z_a\ge N-a-1=B-1`$. To show $`x_{a+1}\ge x_a`$, subtract $`x_a(q_{a+1}-q_a)`$ from that difference. If $`q_{a+1}-q_a=B-a-1`$ is nonnegative, use $`x_a\le1`$; otherwise use $`x_a\ge0`$. The resulting quantity is nonnegative, as required.

Thus $`h_{a+2}-h_a`$ is nonnegative and is itself nondecreasing in $`a`$, including the initial zero part, because $`2x_a/(N-a-1)`$ is nondecreasing. In particular the increments $`\Delta_a=h_{a+1}-h_a`$ satisfy

```math
\Delta_{a+2}\ge\Delta_a.
```

No assertion of monotonicity between adjacent parities is needed. The nondecreasing potentials within each parity also show that each entry in an active row is at least its boundary entry: for $`a\ge t`$ use $`x_a`$, and for earlier rows use the same-parity row among $`t,t+1`$. Every active entry is therefore in $`[0,1]`$, using the complement identity for the upper bound.

## 3. Exact legal transport between consecutive rows

For active $`a`$ let $`B_a`$ be the largest nonnegative allowed $`v`$ in row $`a`$ (with $`|v|\le L`$). Consecutive $`B_a`$ differ by one. For a signed row let $`T_a(b)`$ be the sum of its masses at positions at least $`b`$. A sufficient and necessary condition for the equal-mass rows $`a,a+1`$ to admit a coupling moving by at most one is

```math
T_{a+1}(b+1)\le T_a(b)\le T_{a+1}(b-1)
```

for each integer $`b`$ of the old row parity. This is the cumulative-distribution criterion for coupling equal quantiles. The opposite parities make each permitted move exactly one.

For the first inequality take nonnegative $`b`$. Compare the entries at positions $`b,b+2,\dots`$ in row $`a`$ with positions one higher in row $`a+1`$. At common supported positions the new-minus-old differences are $`\Delta_a-\Delta_v`$. The parity-stride monotonicity shows that their signs can switch only from nonnegative to nonpositive as $`v`$ increases. The new support cannot continue beyond the old support shifted by one, so any remaining differences are nonpositive. The full tail difference at the least nonnegative position is nonpositive by reflection symmetry and equal total $`W`$: it compares the positive mass of one row to the positive mass plus possibly part or all of the center in the other. A sequence of differences that is first nonnegative and then nonpositive, with nonpositive sum, has every tail sum nonpositive. This proves the first inequality for nonnegative $`b`$.

For the second inequality take positive $`b`$, and instead compare with positions one lower in the new row. The new-minus-old differences at common positions are $`\Delta_a+\Delta_{v-1}`$, so their signs can switch only from nonpositive to nonnegative. The shifted new support cannot end earlier, so remaining differences are nonnegative. The tail difference at the least positive coordinate is nonnegative by reflection symmetry and equal totals. All its later tails are therefore nonnegative. Reflection transforms these two comparisons into one another with the index change $`b\mapsto 2-b`$, so they imply the full inequalities (the second at $`b=0`$ is the first at $`b=2`$).

For outer rows $`a>L`$, use mass one at every position, plus surplus $`W-(N-a+1)\ge0`$ split equally between the two extreme positions (all at the unique position when $`a=N`$). This supplies row sum $`W`$. The first outer row has width $`t-1`$, while the last active row has width $`t`$ and constant mass $`W/(t+1)\le1`$. In the comparison with a shift up by one, differences are nonnegative until the last old position drops, and the tail starts nonpositive by symmetry. In the comparison with a shift down by one, every old positive position has a new entry of at least its mass. The same interlacing follows. Between two outer rows of widths $`b`$ and $`b-1`$ with $`b\ge2`$, positive tails shifted up by one lose one interior unit and gain $`1/2`$ at the boundary, or become empty. Positive tails shifted down gain $`1/2`$. The stated inequalities follow again by reflection; a width-one row couples directly to the singleton. Reflect these couplings in time for negative ranks.

Draw one uniform quantile through all the rows. We obtain a distribution of northeast corner paths with total weight $`W`$ and through-flow $`P`$, including the specified outer through-flows. Reflect the paths by swapping the two rotated coordinates to obtain the other orientation, also of total weight $`W`$. On active-active positions the two weights add to one. On every other position one coordinate is outer and its contribution is at least one. Thus this is a fractional geodesic cover of total weight $`2W`$, proving the upper bound $`\mathop{\mathrm{gp}}_f\le4W`$. The lower bound is Fitzpatrick–Janssen–Nowakowski's [corner-truncation labeling](https://cdn.dal.ca/content/dam/dalhousie/pdf/faculty/computerscience/technical-reports/CS-2004-02.pdf), Lemma 2.1.

This proof uses exact symbolic recurrences for arbitrary even size; a linear solver was useful in discovering the potential but is not needed for the theorem. It does not extend by simply replacing the cutoff on odd grids: there the two parity classes of the rank graph disconnect, and only one of them need saturate the bound. Coordination: [#909](https://github.com/1337isnot1337/solved-conjectures/issues/909).
