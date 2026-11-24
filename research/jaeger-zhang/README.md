# Jaeger–Zhang conjecture

**Status.** Partial results on cycle windings and planar dual contraction. The conjecture at the unrestricted odd-girth threshold remains open. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/598)

## Exact statement and sources

For every integer $`k\ge 1`$, every finite planar graph of odd girth at least $`4k+1`$ should admit a homomorphism to $`C_{2k+1}`$. This is the planar dual of the corresponding odd-cut restriction of Zhang's modulo-orientation conjecture. A bounded search on 2026-11-24 by the original statement, planar odd-cut dual, and cycle target found no later full resolution. Naserasr's version 1, Theorem 2 and Corollary 5, gives the universal $`4k+3`$ threshold. His §7.2 explicitly leaves $`4k+1`$ open for $`k\ge 2`$. The known nonplanar counterexamples to Jaeger's flow conjecture do not resolve this planar statement. The repository branches, issue tracker and PRs showed no earlier package on the exact target. Priority for the results below is provisional. [Zhang, Conjecture 5.2](https://doi.org/10.1002/jgt.10040) · [Li, Shi and Wang, Conjecture 1.1](https://doi.org/10.1016/j.ejc.2024.103941) · [Naserasr, 2026 v1](https://arxiv.org/abs/2611.08862v1) · [Han, Li, Wu and Zhang](https://doi.org/10.1016/j.jctb.2018.01.002)

## Cycle lengths that can obstruct tightening

Fix $`k\ge1`$ and put $`q=4k+1`$, $`L=2k+1`$. Call a length $`\ell`$ admissible for an obstruction if there is a positive integer $`j`$ with
```math
\ell\equiv j\pmod 2,\qquad jq<2\ell<j(q+1).
```

**Theorem.** Let $`G`$ be a finite planar graph of odd girth at least $`q`$. If no simple cycle of $`G`$ has an admissible length, then $`G\to C_L`$. In particular, it suffices that the circumference is at most $`10k+2`$. It also suffices that the circumference is at most $`12k+3`$ and there is no cycle of length $`10k+3`$. A forest has circumference zero.

**Proof.** Use Naserasr's Theorem 2 on the all-negative signature and normalize the circumference of the color circle to one. Let $`x(v)\in\mathbb R/\mathbb Z`$ be the resulting colors. On each oriented edge $`uv`$ choose the real number $`w_{uv}`$ with $`|w_{uv}|<1/q`$ and $`x(v)-x(u)\equiv 1/2+w_{uv}\pmod1`$. Reversal gives $`w_{vu}=-w_{uv}`$. The use of cycle winding numbers for circular coloring is established. [Naserasr, Pujol and Wang](https://arxiv.org/abs/2606.25644)

For a traversal of a simple cycle $`C`$ of length $`\ell`$, put $`j=\left|2\sum_{uv\in C} w_{uv}\right|`$. Telescoping the colors modulo one shows that $`j`$ is an integer congruent to $`\ell`$ modulo two. Also $`jq<2\ell`$. A cycle could violate $`\left|\sum_C w_{uv}\right|\le \ell/(q+1)`$ only at an admissible length. Hence this latter inequality holds for every simple cycle.

Put $`c=1/(q+1)`$. In the graph with both directions of every edge, give arc $`uv`$ length $`c-w_{uv}`$. Directed circuits of length two have total length $`2c`$. Every other directed simple circuit has nonnegative length by the cycle inequality. The same holds for every closed walk by decomposition into simple directed circuits. Shortest-path distances $`z(v)`$ from a new source with zero-length arcs to every vertex are consequently finite and satisfy $`z(v)-z(u)\le c-w_{uv}`$. Applying this inequality in both directions gives
```math
|w_{uv}+z(v)-z(u)|\le c .
```
Thus the new phases $`x(v)+z(v)\pmod1`$ have differences in $`[k/L,(k+1)/L]`$ modulo one on every edge. Multiplying phases by $`L`$ and rounding down gives integral colors whose differences modulo $`L`$ are $`k`$ or $`k+1`$. Indeed an integral shift by a multiple of $`L`$ can place the scaled real difference in $`[k,k+1]`$, and rounding down the endpoints preserves those integer bounds. Multiplying the integral colors by $`-2`$ modulo $`L`$ sends the edge differences to $`1`$ or $`-1`$, yielding the required map.

For the length claims write $`\ell=2kj+a`$. The admissibility conditions become $`j/2<a<j`$ and $`a\equiv j\pmod2`$. There is no such $`a`$ for $`j\le4`$. For $`j=5`$ the only choice is $`a=3`$, giving $`10k+3`$. For $`j\ge6`$, $`\ell>jq/2\ge 12k+3`$. This proves both claims.

The difference-constraint argument also gives an exact test for each fixed initial winding class. Tightening by real vertex potentials is possible if and only if each cycle passes the winding inequality. Necessity follows by telescoping the potentials. It is possible that moving to a different winding class removes an obstruction.

An additional consequence applies when all cycle lengths of $`G`$ and $`q`$ are divisible by a positive integer $`d`$. An obstructing cycle would have $`0<2\ell-jq<j`$, with the middle term a multiple of $`d`$. Therefore $`j\ge d+1`$ and $`2\ell>(d+1)q`$. If $`2\operatorname{circ}(G)\le(d+1)q`$, the required map exists.

## Contraction of parallel paths in the dual

Use the established notion of strong $`\mathbb Z_L`$-connectivity. A multigraph has this property if every zero-sum specification of outdegree minus indegree modulo $`L`$ is realized by an orientation. This is equivalent, since $`L`$ is odd, to the usual definition using a compatible specification of outdegrees. Contracting such a connected subgraph preserves the existence of a modulo-$`L`$ orientation. The contraction and lifting principle is standard. [Li, Lai and Luo](https://doi.org/10.1137/16M1055189) · [Modulo orientations and matchings in graphs](https://doi.org/10.1016/j.disc.2022.112877)

Consider a union of $`r\ge 2`$ paths between two distinct terminals, internally vertex-disjoint from one another. Replace the edge $`e`$ on each path by $`a_e\ge1`$ parallel edges. For a path $`P_i`$ set
```math
\delta_e=\max(0,L-a_e-1),\qquad D_i=\sum_{e\in P_i}\delta_e .
```

**Theorem.** If this multigraph is strongly $`\mathbb Z_L`$-connected, then
```math
D_i<L\ \text{for all }i,\qquad
\sum_{i=1}^{r}(L-D_i-1)\ge L-1 .
```
These conditions are sufficient if $`L`$ is prime or $`r=2`$. For any odd $`L`$, the following is sufficient. Require $`D_i<L`$ for all $`i`$. For each divisor $`d>1`$ of $`L`$, put $`h=L/d`$ and
```math
s_i(d)=\sum_{e\in P_i}\left\lfloor\delta_e/d\right\rfloor,\qquad
R_i(d)=\sum_{e\in P_i}(\delta_e\bmod d),\qquad
b_i(d)=\left\lfloor \frac{R_i(d)}{h-s_i(d)}\right\rfloor.
```
It suffices that $`\sum_i(d-b_i(d)-1)\ge d-1`$ for every such $`d`$. The denominator is positive since $`D_i<L`$.

**Proof.** Reference each bundle in the direction from the first terminal to the second. The net orientation of a bundle with multiplicity $`a_e`$ ranges over $`-a_e,-a_e+2,\ldots,a_e`$ modulo $`L`$. Multiply all nets and prescribed demands by the inverse of two modulo $`L`$. The allowed bundle nets become a cyclic interval of length $`\min(L,a_e+1)`$, with a complementary interval of length $`\delta_e`$. On a path, the difference between successive bundle nets is fixed by the prescribed demand at their common vertex. Once the first net is fixed, every later net is its translate by a fixed partial sum. Conversely, arbitrary translates for the later bundles can be imposed by choosing the internal demands. Thus the first net on path $`P_i`$ lies in a set $`A_i`$ which is the complement of a union of cyclic intervals of lengths $`\delta_e`$. The first interval's position is fixed and the other positions are freely prescribed. The possible net at the first terminal is precisely the sumset $`A_1+\cdots+A_r`$. The demand at the second terminal is then automatic from the zero-sum requirement.

If $`D_i\ge L`$, place the intervals consecutively around the cyclic group, starting with the fixed one if it is nonempty. Their union can cover the group, so some compatible boundary demand has no realization. If $`D_i<L`$, then $`|A_i|\ge L-D_i`$. The same consecutive placement makes $`A_i`$ a cyclic interval of exactly that size. For these choices the terminal sumset is an interval of size $`\min\{L,1+\sum_i(L-D_i-1)\}`$, proving necessity of the second condition. Cauchy–Davenport gives the same bound from below for a prime modulus. When $`r=2`$, the necessary inequality implies $`|A_1|+|A_2|\ge L+1`$. Every translate of $`-A_2`$ then meets $`A_1`$, giving sufficiency for any odd modulus. [Cauchy–Davenport and Kneser, formal statements and proofs](https://isa-afp.org/entries/Kneser_Cauchy_Davenport.html)

For the divisor condition project to $`\mathbb Z_d`$. A cyclic interval of length $`\delta_e`$ in $`\mathbb Z_L`$ contains $`\lfloor\delta_e/d\rfloor`$ members of every fiber, and one more member for exactly $`\delta_e\bmod d`$ fibers. Absence of a projected residue from $`A_i`$ requires that all $`h`$ members of its fiber be covered. Summing interval counts, it requires at least $`h-s_i(d)`$ of the $`R_i(d)`$ extra members, counted with multiplicity. Thus at most $`b_i(d)`$ residues are absent. If the full sumset were proper, its stabilizer would be a proper subgroup of index some $`d>1`$. In the quotient by that subgroup, each partial sum also has trivial stabilizer, since any period of a partial sum is a period of the final sum. Iterating Kneser's two-set theorem gives a lower bound of $`1+\sum_i(|\operatorname{proj}(A_i)|-1)`$ for the sumset size. This is at least $`d`$ by the divisor condition, a contradiction. [DeVos, proof of Kneser's addition theorem](https://arxiv.org/abs/1303.3539)

The composite-modulus distinction is necessary. Take $`L=15`$ and three paths of length five. Give the first two paths bundle multiplicity twelve and the third multiplicity thirteen. The deficits are $`(10,10,5)`$ and the excess-size sum is $`4+4+9=17\ge14`$. On either of the first two paths, place the five two-residue complementary intervals periodically with period three, leaving one residue class modulo three. On the third path, place the five one-residue intervals periodically, leaving two classes. Rotating each placement to accommodate its fixed first interval leaves the same number of classes. The sumset occupies at most two classes modulo three, and so some terminal demands fail.

For a multicycle this gives the exact rule $`\sum_e\max(0,L-a_e-1)\le L-1`$. A bundle of $`L-1`$ parallel edges is itself contractible since its possible net fills the group. In a $`q`$-regular plane dual with no such bundle, a triangle of total multiplicity at least $`4k`$ is contractible by the multicycle rule. The rule for multiple paths can also contract patches when no individual cycle passes that rule. For example, when $`L=7`$, take three paths of length two with four parallel edges per bundle. Each path has deficit four. Every pair has deficit eight, while the three-path excess-size sum is six, giving strong $`\mathbb Z_7`$-connectivity.

For a composite example let $`L=9`$ and take four paths of length two with five parallel edges per bundle. Each path has two deficits of three. The condition at $`d=9`$ holds with equality, and at $`d=3`$ each allowable path set projects onto every residue, so the divisor test passes. Each two-path cycle has deficit twelve and each single bundle has multiplicity five. Fractional spanning-tree packing is at most $`40/5=8<9`$, by the singleton partition. Thus in this example the patch criterion applies even though neither a subcycle nor the whole patch meets the respective cycle or spanning-tree threshold. [Jafari, modular Nash–Williams theorem](https://arxiv.org/abs/2610.07034v4)

### Application to a plane dual

The orientation of a plane dual with zero net degree modulo $`L`$ corresponds to a $`C_L`$-coloring of the primal. Assign the differences $`\pm1`$ to primal edges according to the orientations on their dual edges. The balance at dual vertices is the zero-sum condition around primal face boundaries. Summing faces shows the condition on every closed primal walk, so these differences integrate to vertex colors modulo $`L`$. Conversely a coloring gives such an orientation from its edge differences.

Contract any connected dual subgraph meeting the path criterion and discard loops. If the quotient can be oriented, orient the remaining patch using demands opposite to the contributions of its external edges. The demand sums to zero by the balance at the contracted vertex. This lifts inductively through any sequence of such operations. The odd-cut lower bound remains valid in each quotient because a quotient cut is the original cut of the union of its vertex parts. Planarity also persists. Every odd simple cycle of a quotient's plane dual bounds an odd cut of the quotient, so the first theorem can be applied to that plane dual. Consequently a minimum-order counterexample on the dual side contains no contractible parallel-path patch of the displayed type. Showing that enough patches always exist, or excluding the residual winding obstructions by other means, remains open.

## Verification

The symbolic audit checks the normalization of the strict circular bound, parity on both traversals of a cycle, integer rounding of the tightened phases, the sign of the terminal demands, and the distinction between a missing residue in a quotient and a missing individual net. The contraction argument uses the original cut on the union of each quotient's parts.

Run `python3 research/jaeger-zhang/verify.py` from the repository root. Exact controls passed for 940 path types, 5,358 prime-modulus or two-path patches, the three stated larger parallel-path examples, and 150 odd-girth parameters. The general implications use the written proofs and the cited theorems. The partial results have no independent review or formal verification.
