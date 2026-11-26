# Fractional general position conjecture for square grids

**Theorem (asymptotic resolution).** For square Cartesian grids,
$$\operatorname{gp}_f(P_n\square P_n)=(4-2\sqrt2)n+O(\sqrt n).$$
In particular the lower bounds in [the survey's Conjecture 5.38](https://arxiv.org/html/2501.19385v3#S5.SS4) are asymptotically optimal, with ratio tending to one, instead of the published upper/lower gap of about 1.0082. The **exact** conjecture for every order remains open.

The lower bound follows from [Fitzpatrick, Janssen and Nowakowski](https://cdn.dal.ca/content/dam/dalhousie/pdf/faculty/computerscience/technical-reports/CS-2004-02.pdf), Lemma 2.1, with the integer corner truncation parameter nearest to $(1-1/\sqrt2)n$. We prove a matching leading constant by a transport construction for their two-orientation fractional path cover. A cover of total weight $P$ implies $\operatorname{gp}_f\le 2P$ by summing every path constraint against its nonnegative cover weight. No duality theorem or numerical optimum is needed for the upper bound.

## 1. A fractional orientation with uniform row mass

Set $L=1/\sqrt2$, $w=1-L$, and
$$D=\{(a,b)\in[0,L]^2:a+b\le1\}.$$
We need a function $r(a,b)\in[0,1]$ that is nondecreasing in $a$, nonincreasing in $b$, and satisfies $r(a,b)+r(b,a)=1$. Its restriction $p(a,b)=1_D(a,b)r(a,b)$ will have constant row integral $w$.

Divide $[0,L]$ into $M$ intervals of length $\Delta=L/M$ and let $c_{ij}$ be the fraction of cell $i,j$ lying in $D$. Assign the weight $\Delta^2 c_{ij}$ of each unordered pair $i\ne j$ to its two endpoints in any proportions. For a loop assign its fixed diagonal weight $\Delta^2 c_{ii}/2$ to its own endpoint. Require every endpoint to receive $w\Delta$. Total demand is exactly total supply, since $\operatorname{area}(D)/(2L)=w$.

The cut criterion for this assignment (a max-flow from edges to their two endpoints) is that each subset of endpoints has internal edge and loop weight at most its total demand. If the union of their intervals has measure $s$, its internal weight is half the area of $D$ inside the Cartesian square of that union. That area is largest for the initial interval $[0,s]$, since decreasing either coordinate can only increase the indicator of $D$. This rearrangement follows, for example, by mapping the uniform measure on the given set increasingly from $[0,s]$, which moves each coordinate weakly to the right. The resulting ratio of internal weight to $s$ is
$$\frac{\operatorname{area}(D\cap[0,s]^2)}{2s}=
\begin{cases}
s/2,&s\le1/2,\\
1-s/2-1/(4s),&1/2\le s\le L.
\end{cases}$$
It strictly increases up to $L$ and equals $w$ there. Thus all nontrivial subset inequalities are strict. In particular allocations can be made strictly positive at both ends of every positive edge: reserve a sufficiently small amount at both ends of each edge, then apply the same cut criterion to the residual instance. There are only finitely many strict slacks.

Among the feasible allocations, maximize the sum of the binary entropies of the split proportions, weighted by the positive edge weights. The maximum is interior on every positive edge, since moving towards an interior allocation increases entropy at infinite one-sided derivative if an edge is at an endpoint. First-order optimality under the row equations shows that the proportions assigned to endpoint $i$ have the form $h_i/(h_i+h_j)$ for positive $h_i$. Indeed the entropy derivative on edge $ij$ is the log of the ratio of the two complementary allocations, while the gradient of the row constraints on that variable is the difference of the two endpoint unit vectors. This gives
$$\Delta\sum_j c_{ij}\frac{h_i}{h_i+h_j}=w.$$
For $i<k$ we have $c_{ij}\ge c_{kj}$ for every $j$. If $h_i>h_k$, the sums would be strictly ordered in the wrong direction, since row $k$ is nonempty. Thus the $h_i$ are nondecreasing. Extend the ratio to all pairs of points by the interval indices, including outside $D$.

Choose a subsequence as $M$ tends to infinity on which these ratios converge at all pairs of rational coordinates in $[0,L]$. This gives a coordinate-monotone $r$ on rational pairs with the stated complement identity at every such pair. For every fixed rational $a$, extend the monotone function of the second coordinate to real $b$. At its continuity points the original step functions converge by the rational squeeze; the exceptional points are countable. The cell fractions tend to $1_D(a,b)$ off the row boundary. Dominated convergence gives $\int_0^L p(a,b)\,db=w$ at every rational row we will use. The monotonicity in $a$ persists on the overlap of all these rows, almost everywhere in $b$.

## 2. Transport on a diamond

Use $a$ as an absolute time coordinate. For rational $0\le a<L$, take the probability density $p(a,b)/w$ on nonnegative $b$, with support in $[0,B(a)]$ where $B(a)=\min(L,1-a)$. If $a<a'<L$, the unnormalized cumulative row masses $F_a$ satisfy
$$F_a(b)\le F_{a'}(b)\le F_a(b+a'-a).$$
For the first inequality, the integrand increases on the common domain and the support shrinks. For the second, first take $b\le B(a')$. The mass gained on $[0,b]$ is at most the total gained on the common domain, which equals the old mass on $[B(a'),B(a)]$. This removed interval has length at most $a'-a$. By monotonicity of the older density in $b$, it has no more mass than $[b,b+a'-a]$ in the old row. If $b>B(a')$, then $b+a'-a\ge B(a)$, and the result follows as both sides equal $w$.

Use the same uniform random quantile at all times. The inequalities imply that the nonnegative position moves inward at speed at most one as $a$ increases. As $a$ approaches $L$, the support intervals approach $[0,w]$, and the densities $p\le1$ of total mass $w$ tend in $L^1$ to $1_{[0,w]}$. At $a=L$ use that uniform row. For $L<a\le1$, clamp this position to $1-a$. The speed bound continues to hold, and now the unnormalized row has density one on $[0,1-a)$, with excess mass at its boundary. Attach an independent fair sign to the entire trajectory, and use absolute time $a=|u|$ for signed times $u\in[-1,1]$. Then the signed position is supported in $|v|\le 1-|u|$ and changes by at most the change in time. Only finitely many rational times are needed for each discrete grid, together with the defined outer rows.

## 3. Round the trajectories to actual geodesics

Put $N=n-1$. For grid coordinates $0\le i,j\le N$, define integer rotated coordinates $u=i+j-N$, $v=i-j$. They form the diamond $|u|+|v|\le N$, with $u+v\equiv N\pmod 2$. At each integer $u$ sample the trajectory at time $u/N$. Round its real signed position times $N$ to the nearest integer $v$ of the required parity, with ties rounded upward. Consecutive rounded values differ by exactly one in absolute value. For example this follows by expressing the rounding through the floor of $(N+u+Nv_{\rm real}+1)/2$: the numerator excluding the additive constant increases by between zero and two in one step, so the rounded first grid coordinate increases by zero or one. The parity and the diamond bounds are preserved. The resulting route is a monotone geodesic between one pair of opposite corners.

Use this distribution of paths with total weight $Nw$, and use the reflected distribution, which swaps $u$ and $v$, with the same weight for the other orientation. In the interior of a row, the contribution of the first distribution to a vertex $(u,v)$ is $N/2$ times the integral of the unnormalized unsigned-row density on its signed interval of width $2/N$. The coefficient follows from the random fair sign and the normalization by $w$. The finite set of grid paths receives the corresponding push-forward weights.

Except for $O(n)$ vertices, neither coordinate is zero, neither normalized absolute coordinate is within $2/N$ of $L$, and the normalized absolute coordinate sum is less than $1-2/N$. For a vertex with both absolute coordinates below $L$, the two contributions differ from $r(a,b)$ and $r(b,a)$, respectively, by at most the row oscillations over the respective intervals of width $2/N$. Within a fixed row and a fixed sign these intervals have disjoint interiors since eligible integer values of $v$ have fixed parity. Monotonicity makes the sum of their oscillations at most one. Thus the total error contribution over all rows and both signs is $O(n)$, also for the reflected orientation. For points with one absolute coordinate above $L$, that orientation alone has row density one throughout the rounding interval, so already covers such a nonexceptional vertex with weight one. The two absolute coordinates cannot both exceed $L$. In all cases the total residual deficit, summed over vertices, is $O(n)$, using $r(a,b)+r(b,a)=1$ on the rational interior centers and counting at most one deficit per exceptional vertex.

## 4. Cover the deficits at square-root cost

Any set of $k$ vertices of a square grid can be covered by at most $2\sqrt{k}$ monotone geodesics of the two orientations. Sort the vertices lexicographically in original grid coordinates. The second-coordinate sequence has an increasing or decreasing subsequence (one direction can be weak) of size at least $\sqrt{k}$ by the usual increasing/decreasing rank argument. That subsequence fits on one monotone path. Remove it and iterate: the potential $2\sqrt{k}$ drops by at least one per nonempty step.

Write $d_x\in[0,1]$ for the unfilled deficit at vertex $x$. At level $t\in(0,1]$, cover the set of vertices with $d_x\ge t$ by the preceding bound, and give these covers weight $dt$ (equivalently take the finite sum over intervals between distinct deficits). This fills every deficit for a total cost at most
$$2\int_0^1\sqrt{|\{x:d_x\ge t\}|}\,dt
 \le 2\sqrt{\sum_x d_x}
 =O(\sqrt n).$$
The full path cover therefore has weight at most $2Nw+O(\sqrt n)$, which proves the theorem.

## Scope and priority

The original [2006 paper](https://dblp.org/rec/journals/ajc/FitzpatrickJN06) already supplies the corner truncation lower bound and two simultaneous flows. The new steps here are the threshold-domain entropy orientation, its speed-one coupling, and the rounding with a deficit cover. Searches for the exact conjecture, its 2006 source, fractional isometric path covers of square grids, and the exact leading constant found the published upper/lower gap described in the source and the survey, not this limit theorem. This search does not establish external priority. The finite conjecture that specific even or odd weights are exactly optimal is **not** proved by the asymptotic argument. Coordination: [#909](https://github.com/1337isnot1337/solved-conjectures/issues/909).
