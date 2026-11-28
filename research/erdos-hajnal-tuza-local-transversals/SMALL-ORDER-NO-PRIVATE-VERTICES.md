# Small-order examples have almost no private vertices

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At the moving first jump, equality in the elementary
ground-set lower bound forces **every vertex to be shared**.
More generally the number of private vertices is linear in
the excess order, even though the family itself may be large.

Assume $`r=5t+1`$, $`t\ge6`$, $`\tau>t`$, and the local span
condition. Count only vertices belonging to some edge, and
write the ground-set order as $`3t^2+12t+1+h`$.
Then the number of vertices belonging to exactly one edge is at most
```math
\left(6+\frac4t\right)h .
```
For any specified minimum pair, at most
$`(3+2/t)h`$ private vertices are outside its union.

## Proof

For any minimum pair, one may pick a singleton-cut witness
at each of the $`t+1`$ points in its intersection.
Their $`3t`$-point exterior petals are disjoint, so they omit
exactly $`h`$ points outside the pair. This is the basic
[order-bound partition](ORDER-BOUND-STABILITY.md).

Fix a minimum pair $`A,B`$, and let $`X=A\cap B`$.
Choose witnesses $`E_x`$ for all $`x\in X`$, and write
$`W_x=E_x\setminus(A\cup B)`$.
Let $`p_x`$ count the private vertices in $`W_x`$.
Take distinct $`x,y\in X`$ and a private vertex
$`v\in W_x`$. Its only incident edge is $`E_x`$;
therefore it belongs to none of $`A,B,E_y`$.

The two pairs $`A,E_y`$ and $`B,E_y`$ are both minimum
by saturation. Choose representative petals for each
of these pairs. If both systems cover $`v`$, the
witness containing $`v`$ must in each case be $`E_x`$.
Hence $`E_x`$ is a singleton witness for all three
pairs $`A,B`$, $`A,E_y`$, $`B,E_y`$. In particular
$`A,B,E_y`$ are minimum neighbors of $`E_x`$, and
their three traces in $`E_x`$ meet pairwise in
singletons. Their triple intersection is empty:
the pair of traces from $`A,B`$ meet at $`x`$, while
$`E_y\cap X=\{y\}`$. This is the forbidden
[linear trace triangle](FORBIDDEN-LINEAR-TRACE-TRIANGLES.md),
a contradiction.

For each fixed $`y`$, both representative systems
omit only $`h`$ vertices outside their pairs.
The preceding argument shows every private vertex
in $`W_x`$ with $`x\ne y`$ is in at least one of
their omitted sets. Thus $`\sum_{x\ne y}p_x\le2h`$.
Summing over $`y`$ gives $`t\sum_xp_x\le2h(t+1)`$.
Including the at most $`h`$ unrepresented vertices
outside $`A\cup B`$ proves the outside bound.

Finally choose a second minimum pair neither of whose
edges is $`A`$ or $`B`$. To obtain one, use the pair
$`A,E_x`$ and a singleton witness $`F`$ for some
point of $`(A\cap E_x)\setminus\{x\}`$. Then $`F`$
differs from $`A,B,E_x`$, and $`E_x,F`$ are a minimum
pair. Any private vertex in $`A\cup B`$ is absent
from both $`E_x,F`$. Thus every private point is
outside at least one of these two minimum pairs.
Applying the outside bound twice proves the result.

This does not rule out equality in the order bound:
an equality example would have to realize all
required partitions using shared points only.
