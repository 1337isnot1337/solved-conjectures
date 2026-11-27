# Exact interval threshold

**Theorem.** Barrett–Evans–Hall–Kempton's dandelion conjecture holds
for every order $`n\ge 65`$. In fact all minimizers over complementary
pairs of connected simple graphs are the generalized dandelions,
up to complementation. This improves the [effective threshold 500](EFFECTIVE-LEAF-THRESHOLD.md)
and reduces the no-double-leaf regime to a finite range. The later
[finite interval certificate](FINITE-INTERVAL.md) and [small-order enumeration](SMALL-REMAINDER.md) cover the other general orders except 11 through 20. The [anchored proof](PROOF.md) covers those orders in the diameter-three domain.

The proof below and its [exact interval verifier](verify_effective_interval.py)
run on scalar inequalities, not on any enumeration of graphs on
65 or more vertices. The same finite rational check covers every
order at once.

## Set up the bounds

Write $`N=65`$. Suppose $`x=\lambda _2(G)\le  y=\lambda _2(G^c)`$ and
$`x+y\le  D=691/500+1/N`$; this includes every candidate at or below
the dandelion value by [Theorem 4.4](https://arxiv.org/pdf/2201.04225#page=16).
Take the Fiedler maxima $`a_l=M=|a|_\infty `$,
$`b_h=H=|b|_\infty `$, positive by choice of signs. Write
$`d_l=\deg _G(l)`$, $`e_h=\deg _{G^c}(h)`$.

We use the three [coordinate and star inequalities](EFFECTIVE-LEAF-THRESHOLD.md#coordinate-inequalities).
For a coordinate at least $`m>0`$ in absolute value and own eigenvalue
at most $`u`$, the degree upper bound is the largest integer $`k`$ with
$`k\le  u`$ or $`k/(k-u)^2\ge  m^2`$. For a vertex with at most $`k`$
missing edges the opposite bound is
```math
 B(k,u)=\frac{\sqrt  k}{N-k-u}.
```
We only evaluate this bound with a positive denominator. One almost
universal star can lose at most $`T(k)U^2`$ from its unit energy, where
$`T(k)=Nk/(N-k)`$. Both expressions use order $`N`$ in the adverse
direction and remain valid at every $`n\ge  N`$.
Every square root is rounded in the conservative direction using
integer square root at denominator $`10^7`$.

Divide $`0\le  x\le  D/2`$ into 150 equal closed intervals. In a
given interval start with $`x\in[x_L,x_U]`$, $`y\le  y_U=D-x_L`$.
Try a split $`H=c`$ from the listed rational grid, with two branches
$`H\ge  c`$ and $`H\le  c`$. On each branch also split $`d_l=1`$ and
$`d_l\ge 2`$; write $`p=1,2`$ respectively. If $`H\ge  c`$, its
own-degree bound limits $`e_h`$; the $`G`$-star at $`h`$ then gives
a lower bound on $`M`$. If $`H\le  c`$, the complete-pair identity
gives
```math
    M^2\ge  (1-4x_U c^2)/(4y_U).
```
This limits $`d_l`$. The row at $`l`$ gives at least one neighbour
with coordinate at least $`(1-x_U/p)M`$, hence bounded own-degree.
The $`G^c`$-stars of $`l`$ and that neighbour are edge-disjoint;
their combined lower bound gives a lower bound on $`H`$. If the
single star at $`l`$ is stronger, use that one. A star bound that
would divide by $`N-k\le 0`$ is simply skipped.

## Two sharpenings

Let $`m,h_0`$ denote the resulting lower bounds on $`M,H`$, and
$`A,B`$ initial bounds on $`|a_h|,|b_l|`$. Every $`G`$-neighbour
$`w`$ of $`l`$ has $`a_w\ge (1-x_U)M`$, not merely the maximizer.
Use its resulting degree bound $`j`$ in the opposite row of $`l`$,
giving the improved upper bound
```math
    |b_l|\le  d_l\,B(j,y_U)/(N-d_l-y_U)
```
whenever the right side can be bounded with positive denominators.
Using $`A<(1-x_U)m`$ proves $`l\ne h`$ and $`lh\notin E(G)`$.
The row at $`h`$ now tightens $`x_U`$ to at most $`D-1+B/h_0`$.

At this point only an upper bound for $`a_h`$ itself is needed.
If the bound on $`e_h`$ is 1, its only missing edge in $`G`$ is
$`hl`$; the mean-zero equation gives $`a_h<0`$.
Otherwise, every additional $`G^c`$-neighbour $`v`$ of $`h`$ satisfies
$`b_v\ge  (2-y_U)h_0-B`$. When positive, this bounds
$`\deg _{G^c}(v)`$, hence $`|a_v|\le  A_v`$. With $`e`$ the upper
bound on $`e_h`$, the signed mean-zero equation yields the valid
nonnegative replacement
```math
    A \gets  \min\{A, \max(0,(e-1)A_v-m)/(N-e-x_U)\}.
```
If no additional neighbour exists, the same nonnegative bound is
valid because $`a_h<0`$.

## Closing a branch

Let $`Z=a_z=\max_{u\ne l} a_u`$. The row at $`l`$ gives
$`Z\ge (1-x_U/p)m`$, an own-degree bound on $`z`$, and hence an
opposite-coordinate bound $`B_z`$. The earlier $`a_h`$ comparison
ensures $`z\ne h`$. If $`2-(B+B_z)/h_0>y_U`$, the row at $`h`$
forces $`z\sim  h`$ in $`G`$. The row at $`z`$ then gives
$`(2-x)Z\le  M+A`$.

For $`p=2`$, this is inconsistent whenever
$`(2-x_U)(1-x_U/2)>1+A/m`$. For $`p=1`$, the inequality
$`1-A/((1-x_U)m)>x_U`$ ensures $`z=w`$, the unique neighbour of $`l`$:
otherwise the row at $`z`$ has no negative term and contains the
edge to $`h`$. Then $`(2-x)(1-x)\le 1+A/m`$ tightens $`x_L`$,
and $`y_U`$ can be tightened correspondingly.

If $`h`$ is not a $`G^c`$-leaf, its second Fiedler maximum $`b_v`$
is at least $`(2-y_U)H-B`$. When this exceeds the bounds on
$`|b_l|,|b_w|`$, the vertex $`v`$ is distinct from $`l,w,h`$.
The resulting bound on $`|a_v|`$ shows $`w\not\sim v`$ in $`G`$:
if adjacent, the row at $`w`$ would give
$`(3-x)(1-x)\le 1+(A+|a_v|)/M`$.
Thus $`v`$ is a $`G^c`$-neighbour of $`l,w`$, and the row at $`v`$
gives $`(3-y)b_v\le  H+B+B_z`$. This is inconsistent whenever
```math
  ((3-y_U)(2-y_U)-1)h_0>(4-y_U)B+B_z.
```
The positive coefficient makes the same contradiction valid for
$`H\ge  h_0`$.

At $`N=65`$ the verifier closes all 600 branches, four for each
interval, via first-coordinate bounds $`173`$, the initial split
$`60`$, the first leaf $`220`$, the tightened coordinate interval
$`127`$, or the second leaf $`20`$. Every candidate therefore has
leaves on both sides. The [existing exact comparison](MISSING-LEAF.md)
then proves the dandelion minimum and classifies equality.

[Coordination issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
