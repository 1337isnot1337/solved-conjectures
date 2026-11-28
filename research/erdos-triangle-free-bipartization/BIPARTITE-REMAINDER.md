# Erdős’s deletion bound for graphs with a bipartite remainder

**Theorem.** Let \(G\) have odd girth at least the odd integer \(g\ge5\). Suppose deleting one vertex \(v\) leaves a bipartite graph. Assign nonnegative vertex weights of total \(N\), and let edge \(xy\) cost \(w_xw_y\). Then the minimum deletion cost to make \(G\) bipartite is at most \(N^2/g^2\). This also holds for every graph homomorphic to such a \(G\), where \(N\) is now the total weight of the homomorphic preimage. With positive weights, equality in the original graph requires a balanced blow-up of \(C_g\) whose class containing \(v\) is the singleton \(v\).

This is an exact, all-order case of the original [Erdős deletion problem](https://www.erdosproblems.com/23), including its higher odd-girth form. The bipartite remainder can be arbitrarily dense and have unbounded order, width and connectivity. It need not be a path bundle or admit a circular representation. The unrestricted conjecture is not solved here.

## One component away from \(v\)

Discard zero weights by taking the support; if \(v\) is gone the support is already bipartite. Write \(a=w_v>0\). In a connected component \(H\) of \(G-v\), let \(A,B\) be the two sets of neighbors of \(v\) on the opposite shores of \(H\). If either is empty, \(H\cup\{v\}\) contributes no deletion cost. Otherwise the distance in \(H\) from \(A\) to \(B\) is at least \(g-2\): any shortest such path has odd length and closes with two incident edges of \(v\) to form an odd cycle.

Partition \(H\) into \(g-1\) groups: \(A\) at distance zero from itself, the individual distance layers through distance \(g-3\), and the final group of all vertices at distance at least \(g-2\). Let their masses be \(u_1,\ldots,u_{g-1}\). Deleting the edges across any consecutive boundary separates \(A\) from \(B\), at cost at most the corresponding \(u_i u_{i+1}\). Each part still bipartite can then be oriented so that all its attachments to \(v\) cross. The other two available deletions are the edges \(vA\) or \(vB\), at costs bounded by \(a u_1\) and \(a u_{g-1}\), respectively. (The second may be a strict bound since only \(B\) attaches.) Denote the actual optimal cost on \(H\cup\{v\}\) by \(c_H\). Every one of the listed products is at least \(c_H\).

Pair the \(g-1\) groups consecutively: every pair has total mass at least \(2\sqrt{c_H}\). Alternatively reserve the first and last groups, each of mass at least \(c_H/a\), and pair the \(g-3\) intermediate groups consecutively. Thus
```math
w(H)\ge(g-1)\sqrt{c_H},
\qquad
w(H)\ge(g-3)\sqrt{c_H}+2c_H/a.
```
For \(c_H=0\) these inequalities hold without making any partition.

## All components and equality

Optimal cuts on the component extensions can independently be complemented to agree on \(v\). Thus the global optimum is \(b^2=\sum_H c_H\). Moreover \(\sum_H\sqrt{c_H}\ge b\). Sum both bounds to obtain
```math
N-a\ge(g-1)b,
\qquad
N-a\ge(g-3)b+2b^2/a.
```
If \(a\ge b\), the first inequality gives \(N\ge gb\). If \(0<a<b\), the second gives the same inequality strictly, since \(t+2/t>3\) for \(0<t<1\) with \(t=a/b\).

For equality with positive mass, \(a=b>0\); at most one component contributes positive \(c_H\), and any additional component of positive mass would make the total bound strict. In the single component, both endpoint groups must have mass \(b\) and each successive paired group has both masses \(b\), by equality in the displayed pairing bounds. Every boundary must also use its whole product capacity; otherwise a cheaper separating cut exists. Finally \(B\) must be the entire last group, or cutting \(vB\) is cheaper. The layer construction then gives exactly a complete cycle blow-up with equal group masses. Conversely, such blow-ups attain the bound: independently sample one representative per class from any cut to get a weighted cut of the quotient cycle in expectation; some cycle edge is always missed.

For a homomorphism to the one-vertex remainder class, aggregate the weights over fibres and apply the theorem to that target. Each target cut pulls back to a cut of missed cost no greater than the product-weighted cost on the target, whether or not preimage edge pairs are complete.

## Source distinction

The exact question is Erdős’s deletion conjecture, stated for a pentagon in the [1988 paper](https://www.renyi.hu/~p_erdos/1988-12.pdf) and in its higher odd-girth form as [Conjecture 14.12 in Füredi–Simonovits](https://www.renyi.hu/~miki/FurediSimW.pdf). [Komlós](https://doi.org/10.1007/BF01215920) gives the correct general order of magnitude without the sharp constant. [Grzesik–Kielak](https://arxiv.org/abs/1806.09953) resolve the neighboring question about the number of shortest odd cycles, not the edge-deletion bound. The argument here only uses the layer cuts of a bipartite remainder and accounts for the common vertex once across all components. It is not a replacement for those general results.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
