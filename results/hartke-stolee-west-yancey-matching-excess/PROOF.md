# Divergence of the Hartke–Stolee–West–Yancey matching excess

Let $`p`$ be a positive integer. For even $`n`$, let $`f(n,p)`$ be the largest edge count of a finite simple graph on $`n`$ vertices with exactly $`p`$ perfect matchings, when such graphs exist. Dudek and Schmitt proved that $`f(n,p)=n^2/4+c_p`$ for all sufficiently large even $`n`$. Hartke, Stolee, West and Yancey asked whether $`m_p=\min_{q\ge p}c_q`$ tends to infinity. This is Conjecture 9.15 in their [public author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21).

**Theorem.** For every integer $`p\ge2`$, with $`N=1+\lfloor\log_2(p-1)\rfloor`$,
```math
c_p\ \ge\ \frac{\sqrt{8N+1}-3}{4}.
```
In particular $`c_p\to\infty`$, which is equivalent to $`m_p\to\infty`$. This resolves the stated divergence conjecture. It does not settle the stronger growth questions raised after it, or the separate conjectured exact upper bound on $`c_p`$.

## 1. From a directed path sum to matching excess

For a graph $`G`$ of even order $`n`$, write $`c(G)=|E(G)|-n^2/4`$. Add a new vertex $`x`$ adjacent to every old vertex and a new vertex $`y`$ adjacent only to $`x`$. Every perfect matching of the enlarged graph uses $`xy`$; deleting this edge gives an old perfect matching. The edge count increases by $`n+1`$, exactly the increase in $`n^2/4`$. Iterating proves $`c_p\ge c(G)`$ for every witness $`G`$ with exactly $`p`$ perfect matchings. Equivalently $`c_p`$ is the maximum excess across all feasible even orders. The least threshold $`n_p`$ is the smallest even order at which this maximum is attained, but we do not need to determine it.

Start with a directed graph on $`0,1,\ldots,R`$ with a loop at each vertex, all increasing arcs $`i\to j`$ for $`i<j`$, and extra return arcs $`j\to0`$ for a selected subset $`J\subseteq\{1,\ldots,R\}`$. We will optionally delete one increasing arc. Replace each index $`i`$ by two vertices $`l_i,r_i`$. Make all $`l_i`$ a clique and all $`r_i`$ an independent set; an arc $`i\to j`$, including a loop, gives one undirected cross-edge $`l_ir_j`$. The resulting graph is simple. Every perfect matching uses only cross-edges because the two classes have equal size and the right class is independent. Thus perfect matchings correspond bijectively to cycle covers of the directed graph.

Every nontrivial directed cycle uses a return arc and contains vertex 0. A cycle cover therefore either uses all loops or consists of a single increasing directed path $`0\leadsto j`$, followed by $`j\to0`$, with loops on all unused vertices. If $`w_j`$ is the number of increasing paths from 0 to $`j`$, the number of perfect matchings is exactly
```math
1+\sum_{j\in J}w_j.
```
With loops, clique edges, and all increasing arcs but no returns, the edge count is $`(R+1)+2\binom{R+1}{2}=(R+1)^2`$, so excess is zero. Returns add $`|J|`$ edges; a deleted increasing arc subtracts one.

With no deletion, $`w_j=2^{j-1}`$. Thus if $`w(t)`$ denotes the number of ones in the binary expansion of $`t`$, the authors' binary construction (Theorem 2.3 in the author manuscript) gives
```math
c_p\ge w(p-1).
```

Now choose any integer $`u\ge2`$, take $`R\ge u`$, and delete the increasing arc $`1\to u`$. For $`j<u`$ the path count stays $`2^{j-1}`$. For $`j=u`$ the only lost path is $`0\to1\to u`$. For $`j>u`$, the lost paths must use 1 and $`u`$ consecutively, so the only freely chosen interior vertices lie in $`u+1,\ldots,j-1`$, and their number is $`2^{j-u-1}`$. Hence
```math
 (w_1,\ldots,w_u)=(1,2,\ldots,2^{u-2},\,2^{u-1}-1),\qquad
 w_{u+h}=(2^u-1)2^{h-1}\quad(h\ge1).
```
The first $`u-1`$ weights represent every integer in $`[0,2^{u-1}-1]`$ as a subset sum. Including the last early weight shifts this interval by $`2^{u-1}-1`$, so all integers in $`[0,2^u-2]`$ are represented, including both endpoints. In the case $`u=2`$ the early weights are $`(1,1)`$, and the same conclusion holds.

For $`t=p-1`$, divide $`t=(2^u-1)Q+r`$, where $`0\le r<2^u-1`$. Use the early weights to represent $`r`$ and later weights to represent $`(2^u-1)Q`$ according to the binary expansion of $`Q`$. Take $`R=u+\operatorname{bitlength}(Q)`$, with $`\operatorname{bitlength}(0)=0`$. This gives exactly $`p`$ perfect matchings and excess at least $`w(Q)-1`$. Thus for every $`u\ge2`$,
```math
 c_p\ \ge\ w\!\left(\left\lfloor\frac{p-1}{2^u-1}\right\rfloor\right)-1.
 \tag{1}
```

## 2. Mersenne division of a sparse binary integer

Let $`t\ge1`$ have binary length $`N`$ and $`k=w(t)`$ ones. Set $`u=k+1`$ and $`M=2^u-1`$.

**Residue fact.** No positive integer with fewer than $`u`$ binary ones is divisible by $`M`$. Indeed, reduce the exponents of its powers of 2 modulo $`u`$. Whenever a position has at least two summands, replace two copies of $`2^i`$ by one copy of $`2^{(i+1)\bmod u}`$. This preserves the residue modulo $`M`$, decreases the number of summands, and does not remove the last summand. At termination there are between one and $`u-1`$ summands in distinct positions from 0 through $`u-1`$. Their sum is strictly between 0 and $`M`$, proving the fact.

Read the bits of $`t`$ from left to right in binary long division by $`M`$, allowing leading zeros in the quotient output. Each maximal nonempty zero run begins just after a prefix of $`t`$ with between one and $`k<u`$ binary ones. Its current remainder $`r`$ therefore satisfies $`1\le r<M`$. Consume $`u`$ zero bits together. This multiplies the remainder by $`2^u=M+1`$, so the next $`u`$ quotient bits encode the integer $`r`$, and the remainder is still $`r`$. Consequently each complete block of $`u`$ zeros in that run supplies at least one quotient one. No alignment to a fixed partition into $`u`$-bit blocks is required: consecutive long-division output positions are grouped exactly where the zero run begins.

There are at most $`k`$ such runs, including any run at the end; there is no leading zero run because the binary expansion begins with a one. Their lengths sum to $`N-k`$. Each run of length $`L`$ loses at most $`u-1=k`$ bits when partitioned into complete blocks, and the counted quotient positions are disjoint. Therefore
```math
w\!\left(\left\lfloor t/M\right\rfloor\right)\ \ge\
\frac{N-k-k^2}{k+1}=\frac{N}{k+1}-k.
```
The statement also holds for an all-ones expansion (there are no runs, and the right-hand side is nonpositive).

Set $`C=c_p`$ and $`t=p-1`$. The original binary construction gives $`C\ge k`$, and (1) gives $`C\ge N/(k+1)-k-1`$. Rearranging,
```math
N\le (C+k+1)(k+1)\le (2C+1)(C+1).
```
Solving this quadratic inequality yields the claimed bound. Since $`N`$ is nondecreasing and unbounded in $`p`$, the same explicit lower bound with $`N=\operatorname{bitlength}(p-1)`$ also holds for the minimum $`m_p`$ of the tail.
