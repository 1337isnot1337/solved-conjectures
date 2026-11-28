# Simultaneous shortcuts with an exact chord budget

This note develops a shortening step for the [Hamburger–Szegedy conjecture](README.md), [Erdős #642](https://www.erdosproblems.com/642). It gives an optimal rule for combining a supplied list of shortcuts. It does not establish that arbitrary high average degree supplies that list.

## Protected vertices and gap costs

Take a simple cycle $`C`$ in a simple graph $`G`$ and mark a subset $`U`$ of at least three vertices. The cyclic gaps are the paths of $`C`$ between consecutive marks. Let $`l_i`$ be their lengths in edges. A gap of length one lies in $`G[U]`$. For a longer gap define its toll to be $`l_i-2`$.

A shortcut pairs two gaps, both of length at least two. Write their ordered ports as $`(a,b)`$ and $`(c,d)`$ in the orientation of $`C`$. Delete both gap paths, including their interiors. Replace them by either $`ac,bd`$ (type 1) or $`ad,bc`$ (type 0), using existing edges of $`G[U]`$ not on $`C`$. A shortcut may offer just one type or both. Consider a list in which the gap endpoints of distinct shortcuts are all distinct, and all four ports within each shortcut are distinct. Every chosen sublist gives a 2-factor on the surviving vertices. The question is whether that 2-factor is a single cycle.

Let $`R`$ be such a single cycle and let $`J`$ denote the retained gaps of length at least two. There are $`|U|+\sum_{i\in J}(l_i-1)`$ vertices on $`R`$. Exactly $`|U|-|J|`$ of its edges lie in $`G[U]`$. Thus the chords of $`R`$ with both ends in $`U`$ alone suffice for the conjectured witness if and only if
```math
\sum_{i\in J}(l_i-2)\le e(G[U])-2|U|.
```
Additional chords outside $`G[U]`$ can help. This is not a test that all the chords of $`R`$ are insufficient. In particular a length-two gap has zero cost in the protected chord budget. If $`U`$ comes from the rotation patch in [the endpoint note](README.md), its surplus $`e(G[U])-2|U|`$ is greater than $`(d/3-2)|U|`$ when the minimum degree there is $`d`$.

## Exact connectivity test for simultaneous shortcuts

Index the supplied shortcuts by $`1,\ldots,k`$. Form a symmetric matrix $`M`$ over $`\mathbb F_2`$. Off the diagonal, put a one exactly when the two occurrences of one pair alternate with the two occurrences of the other around $`C`$. On the diagonal, put the type chosen for that shortcut. For a sublist $`S`$ of applied shortcuts, the number of components is
```math
1+\dim_{\mathbb F_2}\ker M[S,S].
```
Therefore the sublist gives a single cycle exactly when its principal matrix is nonsingular. The statement includes the empty sublist, with the empty matrix nonsingular by convention.

This is the extended [Cohn–Lempel circuit-nullity identity](https://arxiv.org/abs/0903.4405) in this setting. Here is a direct proof. Label the surviving arcs between consecutive removed gaps by binary variables. Assignments constant along the reconnected cycles form a vector space of dimension equal to the number of those cycles. At a removed gap, define its difference as the sum of the arc variables immediately before and after the gap. Both occurrences of a shortcut have the same difference, say $`z_j`$. For type 1, the incoming labels must agree with one another, and the outgoing labels must agree with one another. The first equality says that the sum of differences from the first gap inclusive to the second gap exclusive is zero. This is $`z_j`$ plus the sum of $`z_i`$ over pairs interlaced with $`j`$. For type 0, an incoming label must agree with the outgoing label at the other gap. Now the sum includes both occurrences of $`j`$, so only the interlaced pairs remain. In both cases the other equality follows because the gap differences agree. Conversely, any solution of these equations reconstructs all arc variables from one initial label. Consistency around the circle follows because every difference occurs twice. This gives one free bit plus the kernel.

## Optimize the savings, without searching through sublists

Assign a nonnegative weight to a shortcut equal to the sum of the tolls of its two gaps. First assume its type is fixed. Run the standard greedy maximum-weight basis algorithm on the columns of $`M`$: process shortcuts in descending weight and keep a column exactly when it is independent of those already kept.

This gives a maximum-weight sublist that leaves a single cycle. Every feasible sublist has independent columns, since its principal matrix is nonsingular. Conversely, for any basis of columns with index set $`S`$, the rows indexed by $`S`$ also form a basis of rows, by symmetry. If a linear combination of the columns indexed by $`S`$ vanishes on the rows $`S`$, it vanishes on every row, hence is trivial. Thus $`M[S,S]`$ is nonsingular. With nonnegative weights, any feasible independent set can be extended to a basis without loss. Greedy basis selection is therefore optimal, even though not every independent set is a feasible sublist.

If some types are flexible, put a distinct variable on their diagonal entries and take the column basis over the field of rational functions. For a fixed sublist, the determinant of its principal matrix is multilinear in those diagonal variables. A nonzero multilinear polynomial over $`\mathbb F_2`$ cannot vanish on the whole Boolean cube, as follows by induction on the number of variables. Hence the sublist is feasible for some choice of types exactly when that symbolic principal matrix is nonsingular. The same greedy optimum follows. One can recover binary types from its nonzero determinant by assigning variables one at a time to retain a nonzero polynomial. This is an algebraic characterization; no deterministic running-time bound for symbolic rank testing is claimed here.

In particular if every listed shortcut is flexible, the full list can be applied. Its principal determinant has the product of all diagonal variables with coefficient one. If every shortcut is instead fixed type 1, any independent set of the interlacement graph can be applied. If its maximum degree is $`\Delta`$ then a colour class saves at least a $`1/(\Delta+1)`$ fraction of the total listed toll. The greedy rule can save more. On the other hand, if $`k`$ fixed type-1 shortcuts all interlace mutually, their matrix is all ones and at most one can be applied. Many individually successful shortenings need not combine.

## What the certificate does and does not force

For each shortcut the two removed gaps and its two replacement edges form a simple cycle. Thus in a host of girth at least $`g`$, its toll is at least $`g-6`$. The important issue is compatibility, not just the size of the individual savings. If the greedy saving reduces the original toll to at most the protected surplus, it gives a witness for #642 on the shortened support.

The lollipop supplies a dense protected set and the edges between its vertices and their captured neighbors. It does not establish the existence of a port-disjoint shortcut list that saves the required toll. Treating all individually available shortcuts as compatible would be invalid, as the all-ones example shows. No new bound on the unrestricted extremal function is claimed.
