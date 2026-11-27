# Erdős–Faudree–Ordman’s clique-partition ratio problem

This is a reduction and explicit interval, not an evaluation of the sharp
constant. The ratio concerns covering or partitioning **edges** by cliques.
Let $`R_n`$ be the maximum of $`\mathop{\mathrm{cp}}(G)/(n^2\mathop{\mathrm{cc}}(G))`$
over $`n`$-vertex graphs with at least one edge, and let $`R=\limsup_n R_n`$.

[Chung’s survey, problem 66](https://fanchung.ucsd.edu/ep.pdf#page=16)
states this question. The
[Erdős–Faudree–Ordman paper, Example 1](https://www.renyi.hu/~p_erdos/1988-04.pdf)
gives $`R\ge 1/64`$. [Ning’s 2026 work](https://arxiv.org/abs/2609.20305)
answers the different question about the difference and explicitly separates
it from the ratio in §1. No exact evaluation of the ratio was located by
searches for the original authors and paper, the survey and Memphis
problem references, or the ratio and known constant.

## An exact lower certificate

For $`n=7t`$, take $`U`$ a clique of size $`3t`$ and let the other $`4t`$
vertices form four cliques of size $`t`$ with no edges between them.
Join all vertices of $`U`$ to all vertices of the four cliques. Its cover
number is four: no clique can meet two of the peripheral parts, and each
peripheral part together with $`U`$ is one covering clique.

For a partition clique, let $`i`$ be its number of vertices in $`U`$ and
let $`j`$ be its number outside $`U`$. Then

```math
ij-\binom{i}{2}-2\binom{j}{2}\le1.
```

This follows from Lemma 3 of the 1988 paper, or directly: for fixed $`j`$,
the first two terms are maximized at $`i=j`$ or $`i=j+1`$, with value
$`j(j+1)/2`$. The full expression is then at most $`j(3-j)/2\le1`$.
Summing over the partition gives

```math
\mathop{\mathrm{cp}}(G)\ge 12t^2-\binom{3t}{2}-8\binom t2
=\frac{7t^2+11t}{2}.
```

Pad with at most six isolated vertices to get the same asymptotic
lower bound at every order. Consequently $`\liminf_n R_n\ge1/56`$. This changes the ratio of the central and
peripheral parts in the published construction. It does not supply the
matching upper bound.

## Finite template programs

For $`q\in\{1,\ldots,13\}`$, assign a type to each nonempty subset of
$`[q]`$. The empty type may be omitted: an isolated vertex never changes
either edge parameter, and reduces the normalized ratio. Two distinct
vertices are adjacent exactly when their types intersect, so each type
forms a clique. If a graph is covered by $`q`$ cliques, its nonisolated
vertices have precisely this form: a vertex records the cliques containing
it and every edge must have some common covering index.

For a template and proportions $`x_A\ge0`$ with $`\sum_A x_A=1`$, let
$`e_{AB}=x_Ax_B`$ for distinct intersecting types, and
$`e_{AA}=x_A^2/2`$. These are limiting edge counts divided by $`n^2`$.
The rows of the following program are these unordered edge categories.
Fix $`L\ge2`$. Each column is an occupancy vector $`u`$ of nonnegative
integers with $`2\le |u|\le L`$, supported on mutually intersecting types.
Its edge vector $`a(u)`$ has coordinates $`u_Au_B`$ and
$`\binom{u_A}{2}`$, respectively. Define

```math
F_{q,L}(x)=\min\left\{\sum_u z_u:
              \sum_u z_u a(u)=e(x),\quad z_u\ge0\right\}.
```

This is always feasible using single-edge columns. A coordinate with
$`x_A=0`$ forces every column that uses that type to have zero mass:
a clique with at least two vertices and a vertex of type $`A`$ must use
an edge involving that type.

For blow-ups of this template whose normalized counts converge to
$`x`$, their minimum number of cliques of order at most $`L`$ **divided by
$`n^2`$** converges to $`F_{q,L}(x)`$.

**Lower bound.** Any such integral partition gives a feasible vector at the
actual edge counts divided by $`n^2`$. All coefficients lie in
$`[0,1/2]`$, since each column uses at least one edge per clique.
Take a convergent subsequence and pass to the limiting counts.

**Upper bound.** Fix an optimum $`z`$ and $`0<\eta<1`$. Independently
assign each edge to a profile $`u`$ with probability
$`(1-\eta)z_ua(u)_{AB}n^2/m_{AB}`$, where $`m_{AB}`$ is the actual count
of edges of its category. Give it no profile with the remaining
probability. For categories with $`e_{AB}>0`$, the sum is at most one
for all sufficiently large $`n`$ since $`m_{AB}/n^2\to e_{AB}`$.
For zero categories give all their edges no profile. Each profile with
positive $`z_u`$ has all its used edge-category probabilities bounded
away from zero.

Fix a positive-mass profile $`u`$ of order $`k\ge3`$. In the hypergraph
whose vertices are edges of this profile, hyperedges are copies of
$`K_k`$ using just these assigned edges and having profile $`u`$. Write
$`T_u`$ for the expected number of those copies. By symmetry of the
underlying type classes, the conditional expected number of copies
through a given edge of category $`AB`$, conditional on its assignment
to $`u`$, is

```math
\frac{T_u a(u)_{AB}}{m_{AB}\Pr(AB\text{ assigned to }u)}
=\frac{T_u}{(1-\eta)z_u n^2}.
```

Thus this expected degree is identical for every category used by the
profile. It has order $`n^{k-2}`$: the number of possible copies is of
order $`n^k`$, and all probabilities used are bounded away from zero.

These degrees concentrate simultaneously around their common expectation.
Conditional on a fixed edge being assigned to $`u`$, changing another
edge sharing one endpoint with it can change the degree by at most
$`O(n^{k-3})`$; a disjoint changed edge contributes at most
$`O(n^{k-4})`$ when $`k\ge4`$ and zero when $`k=3`$. The sum of squared
change bounds is $`O(n^{2k-5})`$. The bounded-differences inequality gives
failure probability $`\exp(-\Omega(n^{1/2}))`$ at relative error
$`n^{-1/4}`$, so a union bound works over every edge and finite profile.
The maximum codegree is $`O(n^{k-3})`$, since any two distinct graph
edges together specify at least three vertices of a clique.

[Pippenger–Spencer](https://doi.org/10.1016/0097-3165(89)90074-5)
now gives a matching covering all but $`o(n^2)`$ vertices of each
profile hypergraph. In fact the almost-regular hypergraph can have its
edges partitioned into $`(1+o(1))`$ times its common degree in matchings,
so one matching covers a $`1-o(1)`$ fraction of its vertices. Graph-edge
pools of different profiles are disjoint. Order-two profiles need
no matching. The expected count of graph edges assigned to each
profile is $`(1-\eta)z_u\binom{k}{2}n^2`$ and independent assignments
give concentration at error $`o(n^2)`$. Use leftover or unassigned
edges as singletons. The total clique count divided by $`n^2`$ is
at most $`(1-\eta)\sum_u z_u+\eta\sum_{AB}e_{AB}+o(1)`$.
First let $`n\to\infty`$, then $`\eta\to0`$.

## The explicit witness has limiting ratio exactly one fifty-sixth

For the four equal peripheral parts and central proportion three sevenths,
the preceding rounding lemma already shows that the lower certificate
is tight for **this template**. For each peripheral part, in units of
one forty-ninth of the total squared order, buy the following profiles:

| Vertices in the center | Vertices in that peripheral part | Clique count in these units |
| --- | --- | --- |
| 2 | 2 | 3/16 |
| 3 | 2 | 5/16 |
| 1 | 1 | 3/8 |

In these units this spends three crossing edges and one half of an
internal edge in each peripheral part. It spends a total of nine
halves of an internal edge in the center across all four parts.
The clique costs sum to seven halves in these units. Thus this
template's normalized clique partition number tends to one
fourteenth and its normalized ratio tends to one fifty-sixth.

## Effective bracketing of the original extremum

A clique of size $`m>L`$ has a fractional partition into $`L`$-cliques
by giving the same weight $`1/\binom{m-2}{L-2}`$ to every $`L`$-subset.
The fractional cost is $`\binom m2/\binom L2`$. Thus if the restriction
to clique size at most $`L`$ is imposed only on the fractional program,
the cost of transforming any integral optimum is at most the original
partition count plus $`|E(G)|/\binom L2`$. In particular, for every
sequence of template blow-ups converging to proportions $`x`$,

```math
F_{q,L}(x)-\frac1{2\binom L2}
\le \liminf_n\frac{\mathop{\mathrm{cp}}(G_n)}{n^2}
\le \limsup_n\frac{\mathop{\mathrm{cp}}(G_n)}{n^2}
\le F_{q,L}(x).
```

Now put $`B_L=\max_{1\le q\le13}\max_x F_{q,L}(x)/q`$. The ordinary
Erdős–Goodman–Pósa bound $`\mathop{\mathrm{cp}}(G)\le n^2/4`$ shows that
graphs with cover number at least 14 do no better than $`1/56`$.
For each smaller cover number, every candidate sequence has a subsequence
with convergent proportions. Conversely, every fixed $`q,x`$ is realized
at all sufficiently large orders by rounding the proportions, with
cover number at most $`q`$. Therefore

```math
\max\left\{\frac1{56},B_L-\frac1{2\binom L2}\right\}
\le \liminf_n R_n \le R \le B_L.
```

Here $`B_L\ge1/56`$ by the explicit four-cover example and the upper
bound at fixed proportions. This proves the limsup is a limit and
gives a finite calculation with an explicit vanishing error. It does
not give an exact value of that limit.

The calculation can use rational arithmetic in principle. The dual
is $`\max_y y\cdot e(x)`$ with
$`y\cdot a(u)\le1`$ for every column. The single-edge constraints
$`y_{AB}\le1`$ ensure the dual polyhedron contains no lines, so each
finite optimum is attained at a vertex. It suffices to enumerate
its rational vertices. For each form, maximize the rational quadratic
$`y\cdot e(x)`$ on the simplex by enumerating supports. Any maximum is
stationary in the relative interior of its support, where the
stationarity equations plus $`\sum_Ax_A=1`$ are linear with rational
coefficients. On the solution set within that face, the quadratic
is constant: for a symmetric quadratic matrix $`M`$, stations
$`x,x'`$ satisfy $`Mx=\lambda\mathbf 1`$ and
$`Mx'=\lambda'\mathbf1`$ on the support, and symmetry gives
$`\lambda'=x^TMx'=x'^TMx=\lambda`$. Feasible stations can be found
with rational linear programming, then evaluated exactly.

The open step is to turn these bracketing programs into a sharp
closed certificate or to find an exact larger extremizer.
