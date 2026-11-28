# Completing a minimal tree packing at its four endpoints

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This studies the branching-to-paths step in the [bounded-degree tree packing](PAIRED-PATH-LOWER-BOUND.md). It gives exact completion tests and an edge-connectivity guarantee, not a proof of either Hamilton decomposability or the extremal upper bound.

Let $`H`$ be a simple bipartite graph of maximum degree at most four, with $`e(H)=2(|V(H)|-1)`$ and $`e_H(X)\le2|X|-3`$ for every proper $`X\subset V(H)`$ of size at least two. Such an $`H`$ is a generic rigidity circuit. It arises from the tree-packing argument by taking an inclusion-minimal qualifying support. Assume it has at least four vertices. Removing any one vertex gives at most $`2(|V(H)|-1)-3`$ edges, so every vertex has degree at least three. Summing degrees shows exactly four vertices have degree three and all others have degree four. Denote the four degree-three vertices by $`Z`$.

In any decomposition of $`H`$ into two spanning paths, the four endpoint slots must occur exactly once at each vertex of $`Z`$: the union is degree four except for endpoint deficits; there are four deficits of one each. Write $`L,R`$ for the bipartition. Subtracting its degree sums gives $`4(|L|-|R|)=|Z\cap L|-|Z\cap R|`$. Thus either all four terminals are in one class and that class is larger by one, or the classes are equal and the terminal split is two and two.

## Unbalanced case: one added vertex

Add a vertex adjacent to the four terminals. The resulting $`G`$ is simple bipartite and 4-regular, and it is essentially 6-edge-connected, meaning every cut with both shores of size at least two has at least six edges. To see this, use the shore not containing the added vertex; its vertex set is a proper subset of $`V(H)`$ and has size at least two. The cut has size $`4|X|-2e_H(X)\ge6`$. The path pair exists exactly when $`G`$ has a Hamilton decomposition: delete the added vertex from the two Hamilton cycles, or close the two spanning paths through it. This regular completion and its rigidity connection are discussed in [Király–Péterfalvi](https://doi.org/10.1016/j.disc.2012.03.031).

## Balanced case: two closing matches

There are two matchings between the two left and two right terminals. For either matching, add its two edges as separate labelled edges, even if a matching edge already exists in $`H`$. This gives a bipartite quartic multigraph $`G`$. The path pair with the corresponding endpoints exists exactly when $`G`$ admits a Hamilton decomposition that puts the two added edges in different cycles. Indeed, each path in the balanced bipartition has opposite-colour endpoints and closes with one matching edge. Conversely delete the added edge from each cycle. Thus either completion can be tested, but an arbitrary Hamilton decomposition of one completion does not suffice.

**Additional conclusion.** If the terminals in $`Z`$ are pairwise nonadjacent in $`H`$, at least one of the two balanced completions is simple and essentially 6-edge-connected.

For a shore $`X`$ with both shores of size at least two, let $`z=|X\cap Z|`$. Its cut size in $`H`$ is at least $`6-\min(z,4-z)`$, by applying the circuit inequality on both shores. For $`z=0,4`$ this already gives six; for $`z=1,3`$ a matching adds at least one crossing. For $`z=2`$ a potential bad cut has original size four. If its two terminals have the same bipartition colour on a shore, both matchings add two crossings. If they have opposite colours, exactly one matching fails to add crossings. The only way to block both completions is therefore by two four-edge cuts that separate the terminals into the two different mixed-colour pairings.

Suppose those cuts exist. Partition the graph into their four corners $`A=S\cap T,\ B=S\setminus T,\ C=T\setminus S,\ D=V(H)\setminus(S\cup T)`$, using one shore $`S`$ from the first cut and one shore $`T`$ from the second. Each corner has exactly one terminal. Opposite corners have terminals of the same bipartition colour. Write $`c(X)`$ for the cut size in $`H`$. Double counting crossing edges gives

```math
c(A)+c(D)+2e_H(B,C)=8,\qquad
c(B)+c(C)+2e_H(A,D)=8.
```

A singleton corner has cut size three; a larger corner has cut size at least five by the circuit bound. Each pair of opposite corners therefore contains a singleton. If every corner were a singleton, the terminals would be the entire vertex set and independence would give no edges. If three corners are singletons, each has at least three neighbours yet can see only the one larger corner, by terminal independence. In the identities, the diagonal of two singletons has cut sum six; the opposing intercorner edge count is one. For explicit labels take $`A`$ large and $`B,C,D`$ singleton. Then $`e_H(A,D)=1`$ and $`e_H(B,C)=0`$. The vertex of $`D`$ would need two further neighbours among the other terminals to have degree three, contrary to independence.

If exactly two corners are singletons, they are adjacent in the corner square. Relabel by swapping the two cuts and/or their shores so that $`B,D`$ are the singletons. The identities force $`c(A)=c(C)=5`$ and $`e_H(B,C)=e_H(A,D)=0`$. Put $`k=e_H(B,D)`$, $`i=e_H(A,B)`$, $`j=e_H(A,C)`$. Then $`i+k=3`$ and $`i+j=5`$, so $`j=2+k`$. The cut of $`A\cup B`$ has size $`j+k=2+2k=4`$, giving $`k=1`$. Again two terminals are adjacent. The contradiction proves that at least one matching avoids all bad cuts. Independence also ensures its new edges are not parallel to old ones. This proves the additional conclusion.

If the four terminals have pairwise distance at least $`h`$ in $`H`$, the new edges in a balanced completion cannot create a cycle of length less than $`h+1`$. A new simple cycle uses one or both new edges and contains an old path between distinct terminals. The proof of the completion theorem does not force the terminals of a minimal tree packing to be separated. Even when they are separated and the completion is highly connected, one must still force a decomposition with the closing edges in different cycles.
