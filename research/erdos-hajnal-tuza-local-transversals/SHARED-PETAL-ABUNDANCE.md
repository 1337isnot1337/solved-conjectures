# Many distinct shared vertices around minimum pairs

A new unconditional shared-support bound for [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019)
at the first moving jump $`r=5t+1`$, uniformly in $`t`$.

**Theorem.** Suppose $`t\ge4`$, the local span property holds,
and $`\tau>t`$. Put $`K=\min(\lceil t/2\rceil,t-3)`$.
Within distance five of any given minimum pair, there is a
minimum pair $`A,B`$ with at least $`K`$ distinct singleton-cut
witnesses that each contain a shared point outside $`A\cup B`$.
These $`K`$ outside points can be chosen distinct. Consequently
there are at least $`3t+1+K`$ shared vertices in the whole family.
If the minimum-pair graph has no adjacent pair of light edges,
this strengthens to $`4t+2`$ shared vertices. Here “shared” means
occurring in at least two edges; a **light** edge has at most
$`2t+1`$ shared vertices. Distance is in the graph of
minimum-intersection pairs; both endpoints of the output pair
are within the stated distance of the input pair.

## Singleton witnesses

At $`r=5t+1`$, [the petal inequalities](NEAR-THRESHOLD-PETALS.md)
give $`m=t+1,\delta=0`$. For any minimum pair $`A,B`$ and any
$`x\in A\cap B`$, a witness avoiding $`(A\cap B)\setminus\{x\}`$
exists. It meets each old edge in $`t+1`$ points and their
intersection in exactly $`x`$, by the equality statement in
[the heavy-edge distance note](MINIMUM-PAIR-HEAVY-DISTANCE.md).
In particular its $`2t+1`$ points inside $`A\cup B`$ are
shared, and it is heavy if and only if it has a shared point
outside $`A\cup B`$. Exterior parts of witnesses for different
$`x`$ are disjoint, by $`\delta=0`$.

## When two adjacent light edges exist

Start with a light minimum pair. Let $`M`$ be the union of
their projections to the shared vertices. It has size $`3t+1`$,
and the projections are $`M\setminus P,M\setminus Q`$ for
disjoint $`t`$-sets $`P,Q`$. Let $`\mathcal L`$ consist of
$`t`$-sets $`T\subset M`$ such that some light edge has shared
projection exactly $`M\setminus T`$.

For any disjoint pair $`I,J\in\mathcal L`$, any light representatives
are a minimum pair: private points cannot overlap, and the shared
projections intersect in $`t+1`$. For every $`t`$-subset $`T`$ of
$`M\setminus(I\cup J)`$, a singleton-cut witness has
$`E\cap M=M\setminus T`$, regardless of whether it is light:
it avoids $`T`$, and its overlaps of size $`t+1`$ with the
two light representatives force it to include every other
point of their shared projections. (Their private vertices
cannot occur in the witness.) If $`T\notin\mathcal L`$, that
witness must be heavy. Distinct missing $`T`$'s from the same
pair give disjoint petals and distinct shared exterior points.

No four distinct members of $`\mathcal L`$ can cover $`M`$
and share a point. Their original representatives would have
disjoint private padding of size $`3t`$ each, common
intersection empty, and span at most $`3t+12t=3r-3`$.

Suppose every light pair used below has fewer than $`K`$
missing choices, at most $`k=K-1`$. Start with $`P,Q`$ and
obtain a disjoint $`R\in\mathcal L`$, leaving spare point $`x`$.
Each of the following three collections has at least $`t-k`$
good choices:
```math
 \{P-p+x:p\in P\},\quad \{Q-q+x:q\in Q\},\quad
 \{R-u+x:u\in R\}.
```
All are obtained by holding the other two blocks fixed.
Choose $`p`$ good for the first, and distinct $`y,z`$ from
the other good positions in $`P`$, which is possible since
$`t-k\ge3`$. Replace $`P`$ temporarily by $`P-y+x`$, so
$`y`$ is spare. Among the $`t`$ choices of $`q\in Q`$, at most
$`k`$ yield $`Q-q+x\notin\mathcal L`$, and at most $`k`$
yield $`Q-q+y\notin\mathcal L`$, using the fixed disjoint
pair $`(P-y+x,R)`$ for the latter. Since $`t-2k>0`$,
choose $`q`$ good for both. Similarly, using $`z`$ as spare,
choose $`u\in R`$ so both $`R-u+x`$ and $`R-u+z`$ are good.

Now $`Q'=Q-q+y`$ and $`R'=R-u+z`$ are disjoint good
blocks. Their complement has size $`t+1`$ and contains
$`p,q,u,x`$. All $`t-3`$ of its $`t`$-subsets containing
these four points must be missing: with
$`P-p+x,\ Q-q+x,\ R-u+x`$ any such fourth block covers
$`M`$ and shares $`x`$. This contradicts $`k<K\le t-3`$.
Hence some tested pair has at least $`K`$ missing choices.
Every test used a pair within distance three of the starting
pair: $`R`$ is obtained in one step, the singly swapped
blocks within two, and $`Q',R'`$ within three.

## Starting anywhere, and counting the shared support

If the given minimum pair has no light singleton-cut witness
for any cut, it already has $`t+1`$ heavy witnesses. Otherwise
take a light witness $`E`$. If either original endpoint is
light it gives an adjacent light pair with $`E`$. If both
are heavy, try the pair consisting of $`E`$ and either
endpoint. Either that pair has $`t+1`$ heavy witnesses, or a
light witness adjacent to $`E`$ gives a light pair within two
steps. Applying the preceding subsection gives the radius
five. In the absence of any adjacent light pair, one of the
first two tested pairs therefore has $`t+1`$ heavy witnesses.

Finally every edge contains at least $`2t+1`$ shared vertices:
delete private vertices and use the elementary rank lower
bound for a [3-wise intersecting family](MINIMUM-RANK-RIGIDITY.md) with $`\tau>t`$.
The chosen minimum pair therefore has at least $`3t+1`$
shared vertices in its union. Its heavy singleton witnesses
supply at least $`K`$ (or $`t+1`$) more, in disjoint petals
outside the union. This establishes the support bound.
The unrestricted transversal conjecture remains open.
