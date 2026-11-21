# Sun’s disjoint cosets conjecture

Sun offers $200 for the first complete solution. Given $k\ge2$ pairwise disjoint left cosets $g_iH_i$ of finite-index subgroups of a group $G$, must $\gcd(n_i,n_j)\ge k$ for some $i\ne j$, where $n_i=[G:H_i]$? Factoring out the normal core of the intersection preserves all indices and disjointness and reduces the problem to finite groups. The following results are partial. [Sponsor's statement and prize](https://mathoverflow.net/questions/316709/a-challenging-problem-on-disjoint-cosets) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/231)

## Removing private prime factors

For a set of primes $\Pi$, write $(n)_\Pi$ for the largest divisor of $n$ supported on $\Pi$. Suppose every prime dividing two or more of the indices belongs to $\Pi$. If a finite $G$ has a subnormal series whose factors each have order supported entirely on $\Pi$ or entirely outside $\Pi$, then
```math
\sum_i \frac1{(n_i)_\Pi}\le1.
```
In particular this holds for every finite solvable group and every such $\Pi$. It also applies to every subfamily, using its own set of repeated primes.

**Proof.** Choose the given series $G=G_0\triangleright G_1\triangleright\cdots\triangleright G_m=1$. Descend through the tree of left cosets one level at a time, starting at $G$. A node $xG_s$ has its children indexed by $Q=G_s/G_{s+1}$. For any original coset $g_iH_i$ still meeting the node, choose a point $y$ of the intersection. The intersection is $y(H_i\cap G_s)$, so the children it meets form one left coset in $Q$ of the image of $H_i\cap G_s$. Its relative index
```math
c_{is}=\frac{[G_s:G_{s+1}]}{[H_i\cap G_s:H_i\cap G_{s+1}]}
```
is independent of the current node, divides $|Q|$, and satisfies $\prod_s c_{is}=n_i$ by telescoping.

At a $\Pi$-level choose a child uniformly. Every surviving coset $i$ survives this step with probability $1/c_{is}$. At a $\Pi'$-level the relative indices are pairwise coprime, since each $c_{is}$ divides $n_i$ and no prime outside $\Pi$ divides two indices. A child meeting every live coset then exists. Indeed the map $Q\to\prod_j Q/K_j$ for subgroups of pairwise coprime indices is surjective as a map of sets. Its image size is $[Q:\bigcap_j K_j]$, a multiple of every index and at most their product, so it equals their product. Choose any child in the simultaneous intersection. This preserves every live coset. [Lean proof of simultaneous intersection](CoprimeCosets.lean) Consequently the probability of finishing in coset $i$ is the product of the reciprocals of its $\Pi$-level indices, namely $1/(n_i)_\Pi$. Disjointness gives the inequality.

## When the pairwise gcds are prime powers

For any finite **solvable** group the conjectured bound holds if each pairwise gcd has at most one distinct prime divisor. More generally, a counterexample with this gcd pattern in an arbitrary finite group would have to have a prime $p$ dividing **all** the indices and a nonabelian simple composition factor of order divisible by $p$.

To see this, first note that disjoint cosets cannot have coprime indices, by the simultaneous intersection argument above. For each prime dividing at least two indices, form the block of indices divisible by that prime. Each pair of indices now lies in exactly one block. Assume every pairwise gcd is less than $k$. Every block prime is then less than $k$, so the number of blocks is strictly less than $k$. This forces a block containing all $k$ indices. In fact, otherwise every index lies in at least two blocks, since the pairs involving that index have to be covered. If $B$ is the point-by-block incidence matrix, $BB^t$ is the all-ones matrix plus a diagonal matrix with positive entries (each diagonal entry added is one less than the point degree). It has rank $k$ over the reals, contradicting the number of columns. This is the incidence-matrix proof of the de Bruijn–Erdős inequality. [Babai and Frankl, §4](https://people.cs.uchicago.edu/~laci/babai-frankl-book2022.pdf)

The prime $p$ of the full block is the only prime dividing any two indices. If all composition factors have order a power of $p$ or coprime to $p$, the first result gives $\sum_i p^{-v_p(n_i)}\le1$. Order the $p$-parts as $b_1\le\cdots\le b_k$. If $b_{k-1}<k$, the first $k-1$ reciprocals already sum to at least one, and the last is positive. Thus $b_{k-1}\ge k$, giving the required pair. A composition factor of mixed order divisible by $p$ is necessarily nonabelian simple.

For arbitrary index patterns the incidence blocks can intersect in two or more points, so the off-diagonal entries in the rank argument need not equal one. For arbitrary groups the series can have factors mixing shared and private primes. Both cases remain part of the sponsor's problem. Zhu studies small numbers of cosets. Fornal and Sun obtain an asymptotic large-gcd bound for integer residue classes. [Zhu](https://arxiv.org/abs/0807.2207) · [Fornal and Sun](https://arxiv.org/abs/2607.24655)

The same conclusion holds for groups with any number of nonabelian composition factors isomorphic to $A_5$ when these are the only nonabelian composition factors. [Local measures and exact finite check](simple-factors.md)

For normal subgroups of arbitrary groups the prime-power-gcd conclusion also holds. For normal subgroups, or arbitrary subgroups of finite nilpotent groups, squarefree pairwise gcds allow a transfer to integer residue classes with identical moduli. [Proof and quantitative bound](squarefree-gcds.md)

There is an exact bound in the squarefree transfer when each index uses at most two shared primes, an additive logarithmic bound for arbitrary two-prime indices, and a projection constraint when many cosets share an index. [Proofs](few-primes.md)

The search for a nonnilpotent counterexample includes a replayable GAP export, a SAT checker, and a positive control using Menon's construction. [Method and completed searches](small-groups.md)
