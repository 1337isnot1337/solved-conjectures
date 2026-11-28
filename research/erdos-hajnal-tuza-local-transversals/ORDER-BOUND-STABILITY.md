# Stability at the minimum exterior-order bound

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At the moving first jump, if a hypothetical example is
close to the known order lower bound, its minimum-pair
petals are almost uniquely determined by the cut.
This is a restriction on the structure of small potential
examples, not a fixed-parameter computation.

Assume $`r=5t+1`$, $`\tau>t`$, and the local span condition,
and suppose the ground set has size $`3t^2+12t+1+h`$.
Fix any minimum pair $`A,B`$, and put $`X=A\cap B`$.
Say an edge is an $`x`$-witness if it avoids
$`X\setminus\{x\}`$. For a witness $`E`$, its petal is
$`E\setminus(A\cup B)`$.

All petals for one fixed $`x`$ lie in a set of size at
most $`3t+h`$. Any two such petals overlap in at least
$`3t-h`$. Moreover the sets formed by taking the union
of all petals for each separate $`x`$ are pairwise
disjoint. If $`h=0`$, the petal of an $`x`$-witness is
unique and the $`t+1`$ petals partition the complement
of every minimum pair.

These conclusions follow directly from [petal saturation](NEAR-THRESHOLD-PETALS.md):
every petal has size $`3t`$, any two petals for
different singleton cuts are disjoint, and
$`|A\cup B|=9t+1`$. Fix one representative petal for
each of the other $`t`$ cuts. The remaining ground set
outside $`A\cup B`$ after removing those petals has
size $`3t+h`$ and contains every petal for $`x`$.
The overlap bound and disjointness of the cut unions now follow.
In fact the sum of their excess sizes beyond $`3t`$
is at most $`h`$, so at most $`h`$ singleton cuts at
a given minimum pair can have nonunique petals.

## Consequence for secondary petals at equality

At $`h=0`$, fix one $`E_x`$ for each $`x`$ and let
$`W_x=E_x\setminus(A\cup B)`$. For each $`x`$, the pair
$`A,E_x`$ is also minimum. Its singleton witness at $`x`$
can be taken to be $`B`$, whose exterior part for that
pair is $`B\setminus(A\cup E_x)`$. Therefore the other
$`t`$ singleton petals at $`A,E_x`$, one for each
point of $`A\cap E_x\setminus\{x\}`$, partition
```math
V\setminus(A\cup E_x\cup B)
 =\bigsqcup_{y\ne x}W_y .
```
This holds for **every** choice of those secondary
witnesses, and also with $`A,B`$ exchanged.
The partitions give exact cross-incidence constraints
for any equality-order construction.

In particular at equality, for every minimum pair $`A,B`$
and vertex $`v\notin A\cup B`$, some minimum neighbor
containing $`v`$ is adjacent to both $`A`$ and $`B`$:
choose the cut whose unique petal contains $`v`$.
Thus in any nontrivial component of the minimum-pair
graph, the edges containing a fixed ground-set vertex
form a dominating set of the component. Indeed for any
edge $`A`$ of the component avoiding that vertex, either
one of its neighbors already contains it, or one of the
common witnesses just described does. With defect $`h`$,
the same local assertion fails at at most $`h`$ ground-set
vertices for any specified minimum pair, since the fixed
$`t+1`$ representative petals omit only $`h`$ points
of its complement.
