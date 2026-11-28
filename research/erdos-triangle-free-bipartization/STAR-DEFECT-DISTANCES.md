# The sharp distance-moment bound for star-shaped defects

Fix an optimal cut of a positively vertex-weighted triangle-free graph $`G`$. An edge costs the product of its endpoint weights. Let $`B`$ be the crossing graph and $`M`$ the missed edges. Suppose all edges of $`M`$ are incident to a common vertex $`v`$. Then
```math
\Gamma=\sum_{xy\in M}w_xw_y\bigl(d_B(x,y)+1\bigr)^2
\le \left(\sum_{x\in V(G)}w_x\right)^2 .
```
In particular the original [Erdős deletion bound](https://www.erdosproblems.com/23), and its sharp higher odd-girth variant, follow for this cut. The result proves the stronger distance-moment inequality proposed by [Ferudun, §7](https://arxiv.org/html/2606.28041v1) in the one-center case, with no assumptions on the structure of $`B`$. The [bipartite-remainder result](BIPARTITE-REMAINDER.md) already proves the absolute deletion bound under a weaker hypothesis; here the new ingredient is the squared distance on every individual missed edge, including mixed distances in a single graph. This is also different from the [crossing spider case](SPIDER.md), which allows broader defect support but requires a particular crossing graph.

## Pair the distance layers in two ways

Assume the total defect weight is positive. Divide vertex weights by the square root of that total, so the defect weights now sum to one. Let $`a`$ be the new weight of $`v`$, and $`N`$ the new total vertex mass. Each defect neighbor has an even finite crossing distance from $`v`$: a disconnected crossing component would allow an improving flip, and $`B`$ is bipartite. The distance is at least four by triangle-freeness. Let $`t_j`$ be the defect mass of those at distance $`2j`$, so $`t_1=0`$, $`\sum_j t_j=1`$, and put $`U_j=\sum_{k\ge j}t_k`$. Write $`s_i`$ for the mass of the crossing-distance layer $`i`$ about $`v`$.

Flipping a prefix of layers shows that its departing crossing capacity, at most $`s_i s_{i+1}`$, is at least the weight of all defects ending beyond distance $`i`$. Also $`t_j\le a s_{2j}`$. Thus each pair $`(s_{2j-1},s_{2j})`$ has sum at least $`2\sqrt{U_j}`$, and $`s_1\ge1/a`$. If $`S=2\sum_j\sqrt{U_j}`$, direct pairing yields $`N\ge a+S`$.

For an alternate pairing choose $`J`$ with $`t_J=\max_j t_j`$. Reserve $`s_1`$ and $`s_{2J}`$. Up to layer $`2J-1`$, use the shifted pairs $`(s_{2j-2},s_{2j-1})`$ for $`2\le j\le J`$; each also has sum at least $`2\sqrt{U_j}`$ by the corresponding prefix flip. After $`2J`$, use the original pairs. This yields the second estimate
```math
N\ge a+(1+t_J)/a+S-2.
```

## A quantitative triangle-inequality gap

Write $`L=(\sum_j t_j(2j+1)^2)^{1/2}`$ and $`\Delta=1+S-L`$. Then
```math
\Delta\ge (1-\max_j t_j)/2,
```
strictly if the law $`t`$ is not concentrated at one index.

For details, use vectors $`u_j=(\sqrt{t_k}\,1_{k\ge j})_{k\ge1}`$, $`j\ge0`$. Their norms are $`\sqrt{U_j}`$, with $`u_0=u_1=u_2`$; the sum $`u_0+2\sum_{j\ge1}u_j`$ has norm $`L`$, and its term norms sum to $`1+S`$. The triangle-inequality gap can only decrease when terms are dropped, by applying the triangle inequality to the full sum after adding back the omitted terms.

Let $`j`$ be the last index with $`U_j\ge1/2`$; write $`s=U_j`$, $`t=U_{j+1}`$, so $`1-\max t_k\le 1-s+t`$. If $`j\ge3`$, keep the initial $`5u_0`$ plus $`2u_j,2u_{j+1}`$. The gap is at least
```math
5+2\sqrt{s}+2\sqrt{t}-\sqrt{25+24s+32t}\ \ge\ (1-s+t)/2.
```
For the scalar inequality, subtract the right side. The remainder is strictly concave separately in $`s,t`$ on $`[1/2,1]\times[0,1/2]`$: for the $`s`$ derivative use $`(25+24s+32t)/s\ge49>288^{2/3}`$; for $`t>0`$ use $`(25+24s+32t)/t\ge106>64`$. Its minimum is therefore at a corner. At $`(1,0)`$ it is zero; at the other corners the inequalities reduce respectively to $`\sqrt{37}<19/4+\sqrt2,\ \sqrt{65}<27/4+\sqrt2,\ \sqrt{53}<9/2+2\sqrt2`$, all strict by squaring. If $`j=2`$, then $`s=1`$, and the initial $`5u_0`$ already includes $`2u_j`$. Retain it plus $`2u_{3}`$ instead. The gap is at least $`5+2\sqrt{t}-\sqrt{25+24t}\ge t/2`$ on $`[0,1/2]`$, by the same concavity and endpoint checks, strictly when $`t>0`$. In both cases with a nonconcentrated law the selected parameters are not the zero-gap corner.

## Finish

If $`a\ge1`$, then $`N\ge a+S\ge L`$. Otherwise put $`\varepsilon=1-a>0`$ and $`d=1-\max_j t_j`$. If $`\Delta\ge\varepsilon`$, the same bound $`a+S`$ suffices. If $`\Delta<\varepsilon`$, subtract $`L`$ from the shifted pairing estimate and multiply the difference by $`a`$. The resulting lower bound is
```math
a\Delta+\varepsilon+\varepsilon^2-d
\ge \varepsilon+\varepsilon^2-(2-a)\Delta
=(1+\varepsilon)(\varepsilon-\Delta)>0 .
```
This proves $`N^2\ge L^2`$, which is the asserted inequality after undoing normalization.

When the defect mass is positive, equality forces the law $`t`$ to be concentrated: for a mixed law the triangle gap is strict, and even at $`\Delta=\varepsilon`$ the shifted bound is then strict. In the concentrated case equality requires $`a=1`$ and all nonempty layers through the one defect distance to have mass one, with no extra mass. Every consecutive layer boundary must be complete by its prefix constraint; the terminal group must be complete to $`v`$ by $`t_J=a s_{2J}=1`$. Thus equality is exactly a balanced complete blow-up of the corresponding odd cycle with $`\{v\}`$ as its root class.

Since every missed edge closes an odd cycle with its shortest crossing path, all distance factors are at least the odd girth. The sharp distance-moment estimate therefore implies the stated Erdős deletion bound under the one-center hypothesis, not in the unrestricted case.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
