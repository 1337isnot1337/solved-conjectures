# Chvátal’s toughness conjecture

**Partial research.** Graphs with a partition into $q\ge2$ twin classes are Hamiltonian at toughness at least $q-1$, and at toughness $q-2$ for $q\ge5$. There is also an absolute bound for sufficiently large blow-ups of arbitrary quotients. The proof reserves a tree of class transitions and uses Hall’s theorem to fill the remaining visits. The unrestricted absolute-threshold conjecture remains open. [Issue #390](https://github.com/1337isnot1337/solved-conjectures/issues/390)

## Target and sources

A graph is $t$-tough if $`|S|\ge t\,c(G-S)`$ whenever deleting $S$ leaves more than one connected component. Chvátal’s conjecture asks whether there is an absolute $t$ for which every $t$-tough finite graph on at least three vertices has a Hamilton cycle. The separate threshold-two assertion was refuted by Bauer, Broersma and Veldman. Shan’s November 2026 preprint gives a threshold for sufficiently dense almost-regular graphs and leaves the unrestricted question open. [Chvátal, 1973](https://doi.org/10.1016/0012-365X(73)90138-6) · [Bauer–Broersma–Veldman](https://ris.utwente.nl/ws/portalfiles/portal/6708998/Bauer00not.pdf) · [Shan, 2026](https://arxiv.org/abs/2611.12519)

The starting point is Ganian’s quotient characterization of Hamilton cycles for neighborhood diversity. The work here supplies a toughness-based way to find a spanning connected set of class transitions and fill the remaining multiplicities, for arbitrary class sizes. The November 24, 2026 source check did not establish priority for these sufficient conditions. [Ganian](https://arxiv.org/abs/1201.3091)

## Reserve a quotient tree and fill the remaining visits

Partition the vertices of $G$ into $q$ nonempty classes. Each class is a clique or independent, and each pair of distinct classes is completely joined or has no edges between them. Write $w_i$ for the sizes. The quotient $H$ has one vertex per class, an edge for every complete join, and a loop at each clique class of size at least two. These loops encode a transition between distinct original vertices of the same class. Ignore loops when taking a spanning tree. The number of classes in a smallest such partition is the neighborhood diversity.

A Hamilton cycle projects to a strongly connected directed multigraph supported on quotient transitions, of outdegree and indegree $w_i$ at each class $i$. Conversely an Euler circuit in any such multigraph visits class $i$ exactly $w_i$ times, counting departures. Assign the distinct original vertices of that class bijectively to those visits. The successive transitions, including the closing transition, are all valid edges of $G$. Since $|V(G)|\ge3$, this is a Hamilton cycle. This is the quotient reasoning in Ganian’s algorithmic characterization. [Ganian](https://arxiv.org/abs/1201.3091)

Suppose a spanning tree $T$ of $H$ satisfies $d_T(i)\le w_i$. Reserve one directed transition in each direction along every edge of $T$. Let $w_i'=w_i-d_T(i)$ be the residual numbers of departures and arrivals. Form a bipartite graph with $w_i'$ left and $w_i'$ right copies of each class $i$, allowing an edge between two copies when the quotient allows that transition. A perfect matching supplies the residual transitions. If $N(J)$ is the set of quotient neighbors of $J$, allowing a loop to count a class as its own neighbor, Hall’s criterion is $w'(J)\le w'(N(J))$ for every class set $J$. It suffices to check entire classes because copies on the same side have identical neighbor sets.

It further suffices to check independent, loopless class sets $I$. Indeed, for arbitrary $J$, let $I=J\setminus N(J)$. It is independent and loopless and has all its neighbors in $N(J)\setminus J$, so

```math
w'(J)-w'(N(J))=w'(I)-w'(N(J)\setminus J)
\ \le\ w'(I)-w'(N(I)).
```

Write $D(U)=\sum_{i\in U}d_T(i)$ for any class set $U$. Assume $q\ge2$. If $w'(I)>0$ for an independent loopless $I$, then $w(I)\ge2$, because any single vertex in a class of weight one uses its full degree budget in the tree. Deleting all classes in $N(I)$ leaves at least $w(I)$ isolated vertices. Therefore for $t$-tough $G$,

```math
w'(N(I))-w'(I)
\ \ge\ (t-1)w(I)-2(q-1)+2D(I).
```

Here $D(I)+D(N(I))\le2(q-1)$ because the sets are disjoint, and toughness gives $`w(N(I))\ge t\,w(I)`$. This proves all the residual Hall inequalities at $t\ge q-1$, since $D(I)\ge1$. With the spanning tree reserved, the directed support is strongly connected and the Euler circuit construction applies.

## Find a tree within the class budgets

Assume either $q\ge2$ and $t\ge q-1$, or $q\ge5$ and $t\ge q-2$. Complete graphs already have Hamilton cycles. Otherwise deleting all but a nonadjacent pair shows that the number $n$ of original vertices is at least $2t+2$. Call a class large in this argument if $w_i\ge2$, and let $s$ be the number of singleton classes. There is at least one large class, so $s\le q-1<2t$. The quotient induced by the large classes is connected, since deleting the singleton vertices costs less than $2t$ and cannot disconnect $G$.

Grow a tree on the large classes first, starting with any one. At a stage with included class set $U$, call a class saturated if its current tree degree equals $w_i$ and let $S$ be the saturated set. Some included class is unsaturated since $w(U)\ge2|U|$ and the degree sum is $2(|U|-1)$. If no unsaturated class has a join to an uninserted large class, deleting the classes in $S$ and all singleton classes separates the unsaturated classes from the uninserted large classes. Both sides are nonempty whenever another insertion is needed. The cost is $D(S)+s$, where $D(S)$ here uses the current tree degrees. If $|U|=1$, this costs $s<2t$. Otherwise every included class has tree degree at least one, and at least one is unsaturated, so the cost is at most $2(|U|-1)-1+s$. Since $|U|\le q-s-1$, this is at most $2q-s-5<2t$ under either hypothesis. This contradicts toughness. Thus the next class can always be attached at an unsaturated class, respecting both budgets.

After inserting all large classes, attach the singleton classes one at a time as leaves. When $U$ is the current class set, $n\ge2q-2$ and the remaining classes are singletons, so

```math
w(U)-2(|U|-1)=n-(q-|U|)-2(|U|-1)\ge q-|U|>0
```

until all classes have been attached. There is an unsaturated class. Failure to attach would disconnect the unsaturated side from the remaining classes by deleting just the saturated classes. That cost is zero for $|U|=1$ and at most $2(|U|-1)-1\le2q-5<2t$ otherwise. This is impossible. The finished tree is within all class budgets. Together with Hall’s inequalities this proves the stated bound at $t\ge q-1$. A positive-toughness graph with a single class and at least three vertices is a clique.

## The threshold $q-2$ and large blow-ups

Let $q\ge5$ and $t\ge q-2$. For a noncomplete graph, every nonuniversal vertex has at least $2t$ neighbors, since deleting its neighbors separates it from a nonneighbor. Universal vertices also have degree at least $2t$ by $n\ge2t+2$. If $n\le4(q-2)$, Dirac’s degree condition proves Hamiltonicity. Assume $n>4(q-2)$ and use the tree constructed above.

In the residual Hall inequality, $w(I)\ge3$ gives a nonnegative right side since $(q-3)\cdot3-2(q-1)+2=q-5\ge0$. If $w(I)=2$ with positive residual, $I$ is one class of size two and of tree degree one. It needs one residual transition to a neighbor. If all its neighbors were saturated, then $w(N(I))=D(N(I))\le2q-3$. If any other class survives deletion of $N(I)$, the two isolated vertices of $I$ and that class give at least three components, forcing $w(N(I))\ge3(q-2)>2q-3$. If no other class survives, then $w(N(I))=n-2>4(q-2)-2\ge2q-3$. Thus some neighbor has positive residual and Hall’s condition holds here as well. When $w(I)=1$ the residual is zero. This proves the threshold $q-2$ for $q\ge5$.

For an absolute threshold on a different class, assume $t\ge2$, all classes have size at least $q-1$, and every loopless class has size at least $2(q-2)$. Any quotient spanning tree is then within budget. Each independent loopless set with positive residual has $w(I)\ge2(q-2)$ and $D(I)\ge1$, so the residual Hall bound is nonnegative. This covers $2$-tough blow-ups with arbitrarily many classes when the class sizes meet the given bounds.

## Exact controls and scope

For checking toughness on such a graph it suffices to delete whole classes. Starting from a cut, restore the removed vertices of each partially retained class. If the class has a surviving neighbor, the restored vertices attach to the component of a surviving twin. If it has none, they either stay in the clique component or add isolated vertices. Thus restoring partial classes cannot decrease the component count, and it reduces the deletion cost.

Exact checks used path quotients with weights $(1,6,21,6)$ and $(1,6,15,21,6)$, with the last class independent and the other classes cliques. Checking all whole-class cuts gave toughness exactly three in both cases. Reserving the path transitions and filling the residual counts produced Euler circuits with exactly 34 and 49 departures distributed at the stated class sizes. Every transition was checked against the quotient, including the closing transition. The examples exercise a singleton class, a nontrivial independent class, and both linear thresholds.

The general obstruction is the absence of a small twin quotient or large class sizes for an arbitrary tough graph. The proof gives a family of verified sufficient conditions and does not provide an absolute toughness threshold for the unrestricted conjecture.
