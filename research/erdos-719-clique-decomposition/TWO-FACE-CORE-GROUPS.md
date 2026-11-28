# Erdős–Sauer conjecture

**Joint repair in the two-indispensable-face regime.** Suppose a maximum packing $M$ of $k$-sets, $k\ge4$, has exactly two indispensable faces at every member. Then the repair cost in the [forced-tree analysis](INDISPENSABLE-FACES.md) can be paid once per group rather than once per uncovered set. The remaining numerical condition is stated as an exact face-selection problem, with explicit savings for the first selected face in each group.

For $C\in M$, write $`I_C=\{a_C,b_C\}`$ for the two omitted vertices corresponding to its indispensable faces. Put $K_C=C\setminus I_C$ and let $v_C$ be the common private replacement vertex. Group the members of $M$ by the ordered data $(K_C,v_C)$. Within one group the pairs $I_C$ are disjoint, since the packed sets already share the common $(k-2)$-set $K_C$.

Call a multi-contact set external if its contacts include a nonindispensable face of some member of $M$. Let $S$ be any selection of nonindispensable original packing faces hitting all external sets. Let $b_S$ be the number of groups having a member hit by one of its own selected faces in $S$. Then
```math
\tau\le |S|+2|M|-b_S.
```
In particular the exact Erdős–Sauer bound follows in this regime whenever one can make $|S|-b_S\le(k-3)|M|$.

## Proof

A multi-contact set $T$ not already covered by $S$ can be taken to have all contacts indispensable. In the forced-tree argument every allowed-arrow set is then a singleton, since $|I_C|=2$ and the actual contact omission accounts for one of the two choices. Failure of augmentation forces a bidirected sink tree, which now has exactly two vertices. In the notation $C_i=T-x_i+y_i$ and $C_j=T-x_j+y_j$ this says that the common replacement vertex $v$ is the same, $`I_{C_i}=\{y_i,x_j\}`$, and $`I_{C_j}=\{y_j,x_i\}`$. Consequently
```math
K_{C_i}=K_{C_j}=T\setminus\{x_i,x_j\},\qquad
T=K_{C_i}+\{x_i,x_j\}.
```
The two extra vertices come from distinct pairs within a single group. This is a simultaneous structural description of all the sets not handled by the external selection.

For a group $(K,v)$ of size $m$, collect its $2m$ distinct paired endpoints. If it has no selected original face in $S$, take all $2m$ faces $K+x$ for those endpoints. This covers every packed member of that group, all its private neighbors, and every cross-pair set $`K+\{x,y\}`$ between its distinct pairs.

If some $C$ in the group has a selected original face in $S$, it is already covered. Take the $2m-2$ faces $K+x$ belonging to the other pairs, and add $K+v$. Every private neighbor contains $K+v$. Every cross-pair set has an endpoint outside the one omitted pair, and so it is hit as well. Thus the second construction uses only $2m-1$ faces. If more than one group can cover the same set, duplicate coverage cannot hurt. Sum the costs over the groups and add the external set $S$.

A singleton group can always take all its nonindispensable faces without exceeding its local budget once that group is credited. Large groups are different: taking every nonindispensable face of every member can still exceed the bound. In particular the [local obstruction gadget](LOCAL-REPAIR-OBSTRUCTION.md) explains why a choice that uses no external faces where none are required is important. The argument does not show that a suitable external selection or a useful two-face maximum packing always exists.
