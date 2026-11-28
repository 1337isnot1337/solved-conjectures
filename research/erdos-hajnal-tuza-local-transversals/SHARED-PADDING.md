# Large external triple intersections are necessary in a dense-core counterexample

Partial progress on [Erdős–Hajnal–Tuza's local transversal problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019),
[Erdős #616](https://www.erdosproblems.com/616). The target is the
whole function of $`r`$, not a single uniformity. The hypothesis
below is a particular structural model for potential examples,
not an assertion that every extremal hypergraph has it.

Let $`\mathcal F`$ be an $`r`$-uniform family with transversal
number greater than $`t`$, such that any edges whose union has
size at most $`3r-3`$ have a common vertex. Suppose some core
$`M`$ of size $`3t+1`$ meets every edge in at least $`2t+1`$
vertices. For every $`t`$-set $`T\subset M`$, transversal
number $`>t`$ supplies an edge avoiding $`T`$. Its core
intersection must be exactly $`M\setminus T`$. There may
be several such edges, and their exterior parts need not be
disjoint. Write $`W_E=E\setminus M`$.

**Proposition.** Assume $`1\le z\le\lfloor(t-1)/3\rfloor`$ and
$`r\le5t+z`$. Fix a $`z`$-set $`Z\subset M`$, and any three
pairwise disjoint $`(t-z)`$-sets $`P_1,P_2,P_3`$ in $`M\setminus Z`$.
If $`E_i`$ avoids $`Z\cup P_i`$ for $`i=1,2,3`$, then
```math
|W_{E_1}\cap W_{E_2}\cap W_{E_3}|\ \ge\ t-2z .
```
This holds for every choice of the three edges above.

In particular, at $`r=5t+s`$ with
$`1\le s\le\lfloor(t-1)/3\rfloor`$, taking $`z=s`$ forces exterior
triple intersections of size at least $`t-2s`$ for every core
sunflower triple of this form. If no exterior triple intersection
is larger than $`\lfloor(t-1)/3\rfloor`$, this whole range is
impossible, and the classical dense-core threshold
$`5t+1+\lfloor(t-1)/3\rfloor`$ remains sharp under this broader
assumption. In particular we do not need pairwise disjoint padding.
For padding with no shared point in any three distinct edges,
the original threshold is attained by the private-padding example.

## Proof

The core common to the first three edges is
```math
P_4=M\setminus(Z\cup P_1\cup P_2\cup P_3),\qquad
|P_4|=(3t+1)-z-3(t-z)=2z+1.
```
Put $`C=W_{E_1}\cap W_{E_2}\cap W_{E_3}`$ and $`c=|C|`$.
Suppose $`c\le t-2z-1`$. Find $`E_4`$ avoiding $`P_4`$, all of
$`C`$, and some subset $`Z'\subseteq Z`$ of maximum size subject
to $`|P_4|+c+|Z'|\le t`$. Such an edge exists because this
forbidden set has size at most $`t`$. The four edges have no
common vertex: every common point of the first three lies in
$`P_4\cup C`$ and the fourth edge misses it all.

The identity $`3z+1\le t`$ implies $`|Z'|\ge z-c`$ (with
the inequality vacuous if $`c>z`$); the other three edges avoid
all of $`Z`$. Thus their union inside the core has at most
$`(3t+1)-z+c`$ vertices. Each exterior part has at most
$`r-(2t+1)`$ vertices; the common $`c`$ exterior vertices
were already counted three times among the first three,
so the exterior union has size at most $`4(r-2t-1)-2c`$.
The overall union has size at most
```math
4(r-2t-1)+(3t+1)-z-c
=4r-5t-3-z-c
\le 3r-3.
```
This contradicts the local hypothesis and proves the proposition.

For the stated sharpness under the triple-overlap cap, take
$`z=\lfloor(t-1)/3\rfloor`$. The necessary $`t-2z`$ exceeds $`z`$
because $`t\ge3z+1`$. For $`r\le5t`$ the general EHT upper bound
already gives transversal number at most $`t`$. The original
private-padding construction attains transversal number $`t+1`$
once $`r\ge5t+1+z`$.

## What remains

This result recovers the private-padding threshold from an
avoidance argument in which exterior sharing can help only
if it is large and present across every designated triple.
It does not rule out heavily shared padding, nor does it force
an arbitrary extremal example to have a dense core. The
next route is to use the large-triple constraint simultaneously
over many overlapping choices of $`Z`$, with the original
transversal condition still imposing avoidance for mixed
core/exterior $`t`$-sets.

References: [Erdős–Hajnal–Tuza, JCTA 58 (1991), 78–84,
Theorems 3 and 6 and Section 3](https://doi.org/10.1016/0097-3165(91)90074-Q).
The exact rounding and the private-padding threshold, including
values already implied by the source, are reconstructed in this
[prior report](https://api.scinet.pub/f/e18b081e-6e0d-4664-a08e-3f2013f0897a).
No finite parameter is claimed as new.
