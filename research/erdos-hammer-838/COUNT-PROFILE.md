# Exact counting recurrences and size profile for steep substitution

This note uses the steep replacement $`B[Q]`$ and notation of
[STEEP-SUBSTITUTION.md](STEEP-SUBSTITUTION.md). It concerns only that
explicit construction, not the global extremum.

For a set $`P`$ put $`U_P(z)=\sum_{A\text{ cup}}z^{|A|}`$, and define
$`D_P(z),F_P(z)`$ analogously for caps and convex-position subsets.
These polynomials omit the empty set. For $`n=|Q|`$, the exact
recurrences are
```math
\begin{aligned}
U_{B[Q]}(z)&=D_Q(z)\frac{U_B(nz)}{nz},
\\ D_{B[Q]}(z)&=U_Q(z)\frac{D_B(nz)}{nz},
\\ F_{B[Q]}(z)&=|B|F_Q(z)+U_Q(z)D_Q(z)
               \frac{F_B(nz)-|B|nz}{(nz)^2}.
\end{aligned}
\tag{1}
```
The quotients are polynomials.

The chain and polygon rules in the preceding note give necessity.
For sufficiency of the chain rule, start with a center cup, replace
its final point by an arbitrary micro cap (thus a transformed cup),
and choose any representative from each other occupied cluster.
The cross slopes strictly increase by triple-orientation preservation,
the last cross slope is smaller than every internal slope, and internal
slopes strictly increase. This is a cup; the cap case reverses the
roles of the endpoints and the inequalities. The supports on one
cluster are also included in the first two formulas.

For the polygon rule, take any convex subset of at least two centers.
Choose singletons at the intermediate centers and transformed caps
and cups at the leftmost and rightmost centers, respectively. Fix the
resulting subset's two global abscissa endpoints. The two hull paths
of the center subset determine the upper and lower mixed paths. Each
cross path has strictly monotone slopes because orienting any triple
from distinct clusters agrees with its center triple. Prepending the
left internal cap preserves strict decrease on the upper path;
appending the right internal cup preserves strict increase on the
lower path. No other internal edges are used. All chosen intermediate
points lie on the appropriate sides of the endpoint chord, again by
orientation preservation. Non-endpoint left-cluster points are
strictly above the chord, because their secants to the leftmost point
are steeper than that chord. Non-endpoint right-cluster points are
strictly below, by the same comparison against the rightmost point.
Thus these two paths are indeed the upper and lower hull paths and
all their points are vertices. This includes the two-center case.
With exactly one center, the number is simply $`|B|F_Q(z)`$.

Consequently each occupied center set of size $`j`$ contributes
$`(nz)^{j-1}`$ times the appropriate opposite micro chain polynomial
in the first two formulas, or $`(nz)^{j-2}U_Q(z)D_Q(z)`$ in the mixed
polygon case. The representation is unique, proving (1).

## Quadratic size profile

Use $`B=B_{r,r}`$ with fixed integer $`r\ge1`$;
$`M=\binom{2r}{r}`$, $`\ell=\log_2 M`$. Then
```math
\begin{split}
 & [z^j]U_B,[z^j]D_B\ge1\quad(1\le j\le r+1),
 \\ & [z^j]F_B\ge1\quad(1\le j\le 2r).
\end{split}
```
These are all supported degrees: under the classical split,
$`B_{a,b}`$ attains its cup bound $`a+1`$ whenever $`b>0`$, by taking
a maximal left cup and one right point, and symmetrically attains
its cap bound $`b+1`$ whenever $`a>0`$. A left cup of size $`r`$
and right cap of size $`r`$ in the split of $`B_{r,r}`$ give
$`2r`$ points in convex position, since all cross slopes are above
all internal slopes and the two interior pieces lie on opposite sides
of the endpoint chord.

Let $`Q_0`$ be a singleton and $`Q_{t+1}=B[Q_t]`$. For
$`1\le k\le 2rt`$, as $`t`$ grows with fixed $`r`$, equation (1) gives
uniformly
```math
 \log_2 [z^k]F_{Q_t}(z)
 = \ell\left( kt-\frac{k^2}{4r}\right)+O_r(t).
 \tag{2}
```
There are no convex subsets of size $`>2rt`$ for $`t\ge1`$.

Here are details for the error term and the maximization. Each chain
in a repeatedly expanded polynomial from (1) follows one spine, with
a choice of $`a_j\in\{0,\dots,r\}`$ at each level $`j=t-1,\dots,0`$,
accounting for $`a_j`$ singleton selections at that level and weight
$`M^{j a_j}`$. The final singleton contributes degree $`1`$. The
non-$`M`$ factors are all positive integers bounded by a constant
depending on $`r`$, and there are at most $`(r+1)^t`$ degree patterns.
For a mixed convex subset there is an initial spine of one-cluster
steps (each with factor $`M`$), and then a split at a level $`j`$.
It has $`0\le b\le 2r-2`$ singleton choices at level $`j`$, weighted by
$`M^{jb}`$, and two chain spines over the remaining levels. The
degree consists of the singleton choices plus the two final
endpoints. There are at most
$`t(2r-1)(r+1)^{2t}`$ patterns and each non-$`M`$ factor is bounded
in terms of $`r`$. The single-cluster prefix adds at most $`t`$
to the exponent of $`M`$.

For an upper bound with $`s=k-2`$, relax the per-level number of
singleton choices to $`2r`$ at every level and fill the largest
weights $`t-1,t-2,\ldots`$ first. Their weight is
```math
 W(s)=s(t-1)-\sum_{i=0}^{s-1}\left\lfloor\frac{i}{2r}\right\rfloor
     = kt-\frac{k^2}{4r}+O_r(t).
```
For a lower bound, split immediately, fill the same weights but
allow at most $`2r-2`$ at the first level, and split the choices
remaining at every later level between the two chains, at most
$`r`$ each. For $`s\le 2rt-2`$ there is enough capacity and
at most two units move below their locations in the relaxed solution,
decreasing weight by at most $`2t`$. Every such pattern has
positive coefficient. The $`k=1`$ case follows directly from
$`|Q_t|=M^t`$. This proves (2). Maximizing capacity likewise proves
the asserted degree bound.

For $`L_t=\log_2|Q_t|=t\ell`$ and $`k/L_t\to\alpha`$ in
$`0<\alpha<2r/\ell`$, equation (2) gives
```math
 \lim_{t\to\infty}
 \frac{\log_2 [z^k]F_{Q_t}(z)}{L_t^2}
 =\alpha-\frac{\ell}{4r}\alpha^2 .
```
Thus as $`r\to\infty`$ the leading curve tends to
$`\alpha-\alpha^2/2`$ for $`0<\alpha\le1`$. The construction's own total
count has limit $`r/\ell`$ for fixed $`r`$ (set $`k=2rt`$;
also apply the upper bound), which tends to $`1/2`$.
This does not establish optimality among arbitrary point sets.
