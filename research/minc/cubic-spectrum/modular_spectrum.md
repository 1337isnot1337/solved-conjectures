# Permanent values of 3-regular matrices

Let $\Pi_3(n)$ be the set of permanents of binary $n$-square matrices having exactly three ones per row and column. **For every integer $q\ge2$ and every $n\ge79q^2$, $\Pi_3(n)$ contains representatives of every residue class modulo $q$.** The matrices can all be chosen with connected bipartite support. The [construction](residues.py) takes an order, modulus and residue and returns the three column neighbors of each row. In particular there is no persistent congruence obstruction at any fixed modulus, even among connected graphs. This gives modular information about [Greenstein's problem](https://yair-lavi.com/mincs-list/problem-3/index.html); different integers can have the same residue. The full integer spectrum remains undetermined.

## Replacing an auxiliary edge

Let $F_0=0,F_1=1,F_{j+1}=F_j+F_{j-1}$ also at negative indices. The Möbius ladder on $2l$ vertices consists of a cycle with every vertex joined to its antipode. For odd $l\ge3$ it is simple cubic bipartite, with $l$ vertices on each side. Mark one cycle edge $e$. The numbers of perfect matchings avoiding and using it, respectively, are
```math
a_l=F_{l+1}+1,\qquad b_l=F_{l-1}+1.
```
Indeed the [classical matching formula](https://arxiv.org/abs/2003.09602) gives total $F_{l-1}+F_{l+1}+2$. The number using a specified antipodal edge is $F_l$, since deleting its endpoints leaves a two-row ladder of length $l-1$. At its endpoint the other two edges are cycle edges interchanged by reflection, so $b_l=(F_{l-1}+F_{l+1}+2-F_l)/2=F_{l-1}+1$ as an integer identity. Subtract from the total to get $a_l$.

Take $T$ to be the least even multiple of the Fibonacci period modulo $q$. One has $4\le T\le6q$: for $q>2$ the period is already even by the determinant $-1$ of the Fibonacci step and the [Freyd–Brown bound](https://www.mathpages.com/home/kmath078/kmath078.htm) gives the upper bound. For $q=2$ take $T=6$. For every positive $l\equiv-1\pmod T$ with $l\ge3$,
```math
(a_l,b_l)\equiv(F_0+1,F_{-2}+1)=(1,0)\pmod q.
```

In a bipartite graph of maximum degree three and equally many vertices on each side, pair the missing row slots with missing column slots arbitrarily. These auxiliary edges may be parallel. Replace each auxiliary edge $u v$ by its own copy of the ladder with $e$ removed, linking $u$ to the right end of $e$ and $v$ to its left end. The resulting graph is cubic, simple if the original graph was simple, and bipartite. The two links of any one ladder are either both matched or both unmatched, since its interior has equal numbers of left and right vertices. No links contributes $a_l$ internal completions; two links contribute $b_l$. Consequently modulo $q$ only the original graph's perfect matchings contribute, with weight one each. This is a reduction preserving the matching count modulo $q$ for any simple balanced subcubic input.

## Realizing a chosen residue at the specified order

Choose $1\le t\le q$ representing the requested residue, using $q$ for residue zero. Take a directed graph on two tracks $u_1,\dots,u_t$ and $v_1,\dots,v_t$. Include the forward edges on each track, every edge $u_i\to v_i$, the return edge $v_t\to u_1$, and a loop at each vertex except $u_1,v_t$. Use separate left and right copies of each vertex, and make a bipartite edge for each arc. Its perfect matchings are the directed cycle covers. Such a cover must use the return edge and a path from $u_1$ to $v_t$, crossing between the tracks exactly once. All other vertices use their loops. There are exactly $t$ perfect matchings, $2t$ vertices per side, $5t-3$ edges, and $t+3$ missing slots on each side. Its maximum degree is three. The formula includes $t=1$.

With $l=T-1$ the order after filling all slots is $n_t=2t+(t+3)l$. We may add any $h\ge0$ isolated matched pairs to the input without changing its permanent. The order after filling then increases by $h(1+2l)$. Extending a single ladder by a multiple of $T$ increases the order by that multiple and preserves its signature modulo $q$. For a requested order $n$, pick the unique $0\le h<T$ for which $n-n_t-h(1+2l)$ is divisible by $T$; here $1+2l\equiv-1\pmod T$. The remainder is nonnegative whenever
```math
n\ge 2q+(q+3)(T-1)+(T-1)(2T-1).
```
Using $T\le6q$ makes the right side at most $78q^2+q-2\le79q^2$. Thus one ladder extension gives the exact requested order.

The filling can keep the final graph connected. Every component of the input is balanced because the input has a perfect matching. No component is already cubic: the non-return part of the two-track graph is connected for $t\ge2$ (the track loops join its successive positions), and has deficient vertices, while the return edge forms an isolated matched pair. For $t=1$ both edges are isolated. Alternatively, in each component of the input the maximum vertex index along the tracks gives an endpoint of degree less than three unless the component is a single edge. Reserve one missing slot of each color per component, pair these across the components in a cycle, then pair the rest. Each replacement ladder remains connected after deletion of a cycle edge. This proves the connected version as well.

[Shevelev's spectrum paper](https://doi.org/10.1155/2013/289829) studies upper integer values and special matrix classes. The ladder total and the Fibonacci period bound used here are prior results. The [exact checker](verify_residues.py) independently enumerates small ladder and two-track matchings, tests connected cubic realizations at the order bound, and computes complete graph permanents directly in sample constructions.
