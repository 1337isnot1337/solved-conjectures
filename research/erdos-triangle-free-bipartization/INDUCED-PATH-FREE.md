# The sharp Erdős bound for triangle-free induced-P₆-free graphs

**Theorem.** Every triangle-free graph with no induced six-vertex path can be made bipartite by deleting edges of total product cost at most $`N^2/25`$, where $`N`$ is the sum of arbitrary nonnegative vertex weights. The bound also holds for every graph homomorphic to such a graph. The balanced pentagon blow-up shows sharpness. This is a structural partial result for [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution for arbitrary triangle-free graphs.

## Reduce to the structural templates

[Chudnovsky–Seymour–Spirkl–Zhong, Theorem 1.1](https://web.math.princeton.edu/~pds/papers/P6/paper.pdf), classify connected triangle-free induced-$`P_6`$-free graphs without twins. The graph is Clebschian (an induced subgraph of Clebsch), climbable, an expansion of $`V_8`$, or has a nontrivial simplicial homogeneous pair. This is a structural theorem for unbounded order.

Twins can be merged while preserving the minimum product-weighted cut cost. Disconnected parts can be treated separately since the sum of squared component masses is at most $`N^2`$. For a homogeneous pair $`A,B`$, each is independent, their link is nonempty, and every external vertex is complete or anticomplete separately to each. An external vertex cannot see both sets, since it would complete a triangle with an existing $`AB`$ edge. Complete the $`AB`$ link to increase (or preserve) the minimum cost, and merge each of $`A,B`$ into one weighted vertex. The resulting simple graph is isomorphic to the induced graph obtained by keeping the endpoints of any original $`AB`$ edge and the exterior. Thus it is still triangle-free and induced-$`P_6`$-free, and is smaller. This step needs no clique gluing theorem and in fact does not use the simplicial part of the homogeneous-pair hypothesis.

An expansion of $`V_8`$ maps to the eight-vertex Möbius ladder, so [the weighted Möbius-ladder theorem](MOBIUS-ODD-GIRTH.md) gives the target. Every weighted Clebsch template satisfies the target by a short known comparison. Represent its vertices by four-bit words with edges at Hamming distances 1 and 4; equivalently use the even five-bit words with edges differing in exactly four coordinates (append the parity bit). The five coordinate cuts miss every edge exactly once, so the minimum cost is at most $`e/5`$, with $`e`$ the total unordered edge mass. This suffices for $`e\le N^2/5`$. At $`e\ge N^2/5`$, the classical [Erdős–Faudree–Pach–Spencer neighborhood bound](https://combinatorica.hu/~p_erdos/1988-12.pdf) $`e-4e^2/N^2\le N^2/25`$ suffices. Thus only climbable templates need a new argument.

## Climbable graphs: a weighted argument uniform in the template size

A full climbable template consists of two shores $`a_1,\dots,a_n`$ and $`b_1,\dots,b_n`$, every $`a_i b_j`$ with $`i\ne j`$, and independent vertices $`c_i`$ joined to $`a_i,b_i`$. The structural theorem also allows induced subgraphs of this template; give omitted vertices weight zero.

Normalize the total weight to one. Suppose this template has a weighting with $`\beta>1/25`$, and maximize $`\beta`$ over all its vertex weights before restricting to positive support. We denote vertex names and their masses by $`a_i,b_i,c_i`$ in the inequalities below. The [finite weight stationarity proof](BOUNDED-CODEGREE-TEMPLATES.md) shows there is a distribution of optimum cuts such that each positive-weight vertex has expected monochromatic degree $`2\beta`$. A vertex $`c_i`$ can always choose its cheaper side; its cost per unit mass is at most $`\min(a_i,b_i)`$. Thus an **active** index, meaning $`c_i>0`$, has both $`a_i,b_i\ge2\beta>2/25`$.

Write $`m_0=2/25`$, $`C=\sum_i c_i`$, and $`D=\max_{i\ {\rm active}}\min(a_i,b_i)`$, attained at index 1. The cut with the $`a`$- and $`b`$-shores opposite gives $`\beta\le DC`$, so $`C>1/(25D)`$. If there are $`k`$ active indices, their mass and $`C`$ therefore require
```math
 1>2D+\frac{1}{25D}+2m_0(k-1)
   \ge 2\sqrt{2/25}+2m_0(k-1).
```
This excludes $`k\ge4`$, independent of $`n`$.

For the inactive indices we may add their missing $`a_i b_i`$ edges because the corresponding $`c_i`$ have zero mass. Then merge all inactive $`a`$-vertices into one vertex $`a_*`$, and all inactive $`b`$-vertices into $`b_*`$. This only upper-bounds the original minimum cost. If $`k=0`$ the graph is bipartite, and if $`k=1`$ the completed template is a pentagon, allowing any of its five masses to vanish. For $`k=2`$, use the following explicit homomorphism into the four-bit Clebsch model, representing words as integers:
```math
 (a_1,a_2,a_*,b_1,b_2,b_*,c_1,c_2)\longmapsto(0,6,3,7,1,2,8,9).
```
All eleven edges have XOR Hamming weight one or four, by inspection.

It remains to treat $`k=3`$. Let $`S=1-2D-4m_0-C`$. This is the total mass of the inactive vertices and the six active endpoint masses in excess of the lower bounds $`D,D,m_0,m_0,m_0,m_0`$. Thus $`S\ge0`$, and the $`C`$ bound gives
```math
 S\le 1-4m_0-2\sqrt{2/25}<23/200,\qquad D<4/15.
```
For the last inequality, $`2D+1/(25D)`$ is increasing for $`D\ge4/15`$ and already exceeds $`1-4m_0`$ there.

Put both endpoints of index 1 on one side. Put both endpoints of indices 2 and 3 on the other side. Put every $`c_i`$ opposite its endpoints, so all their edges cross. The only loss among the active endpoints is $`a_2b_3+b_2a_3`$. Let $`L=a_*+b_*`$ and $`R=S-L`$. The excess endpoint masses sum to $`R`$, so
```math
 a_2b_3+b_2a_3\le 2m_0^2+m_0R+R^2/4 .
```
For example, the excess-times-excess term is at most the product of the combined increments on the two shores, hence at most $`R^2/4`$. Keep $`a_*,b_*`$ opposite, and average its two orientations relative to the already chosen active signs. Each inactive–active edge is then missed with probability $`1/2`$. Each active shore has mass at most $`D+2m_0+R`$, so these further losses are at most $`L(D+2m_0+R)/2`$. Consequently
```math
 \beta\le 2m_0^2+m_0S+S^2/4+LD/2-L^2/4.
```
If $`D\ge S`$, maximize the last two terms over $`0\le L\le S`$ at $`L=S`$, giving at most $`2m_0^2+S(m_0+D/2)<14/375<1/25`$. If $`D<S`$, they are at most $`D^2/4<S^2/4`$, and the resulting bound is below $`2289/80000<1/25`$. Either case contradicts the supposed counterexample. This completes the climbable argument and the structural proof.

Finally, a homomorphism from a weighted graph to any of these graphs lets us sum vertex masses in the fibers. The complete endpoint product between two adjacent target vertices upper-bounds the original cross-fiber edge mass. Pulling back a target cut therefore transfers the bound, even with arbitrary missing edges in the preimage.

The theorem uses structural classification, weight stationarity and cut comparisons, not an exhaustion of input graph orders. It does not show that arbitrary triangle-free extremizers are induced-$`P_6`$-free.

## An explicit strict gap throughout the open density band

The same class of homomorphic preimages in fact satisfies
```math
 \beta\le 799/20000=1/25-1/20000
 \qquad\text{when } e\le3197/20000
```
in total vertex mass one. This applies regardless of missing edges in the preimage.

For connected preimages of Clebsch or $`V_8`$, one has $`\beta\le e/5`$ directly on the original edges. For $`V_8`$, use the outer-cycle cut that misses all rungs and the four cuts that miss exactly one rail join each, as in [the ladder proof](MOBIUS-ODD-GIRTH.md). The five omitted edge sets partition the template. This also handles graphs mapping to expansions of $`V_8`$. The preceding structural reduction gives a homomorphism preserving every original edge, so it remains to prove the strict claim for climbable preimages. In fact the following argument works up to $`e\le17/100`$ for connected preimages.

Aggregate each homomorphism fiber to one template vertex, writing $`E_{uv}`$ for the actual edge mass between adjacent fibers, not the full product. The minimum over cuts of this edge-weighted template bounds the original minimum from above. Its edge weights obey $`E_{uv}\le w_u w_v`$. Any version with some masses reduced and the affected edges reduced to the corresponding product capacities therefore obeys the sharp theorem already proved. In the climbable template write $`d_i=\min(a_i,b_i)`$ and call $`c_i`$ light when $`d_i<h=3/40`$. Let $`L_{\rm light}`$ be the total light $`c_i`$ mass.

Suppose the template with actual edge masses has $`\beta>1/25-1/20000`$. Remove $`t=\min(L_{\rm light},1/20)`$ mass from these light $`c_i`$, scaling both incident edge weights proportionally at each affected vertex. The rest has cut cost at most $`(1-t)^2/25`$. In a maximizing cut of the rest, each affected $`c_i`$ chooses its cheaper side, and restoring its mass changes neither the cheaper side nor the per-unit cost bound $`h`$. A class removed completely can be placed on its cheaper side after restoration. This gives
```math
 \beta\le (1-t)^2/25+ht\le 1/25-3t/1000.
```
Therefore $`t<1/60`$, so $`L_{\rm light}<1/60`$. Remove **all** light $`c_i`$; the remaining edge-weighted graph must still have $`\beta'>1/25-1/20000-h/60=387/10000`$.

Let $`b=387/10000`$, and $`D`$ be the greatest $`d_i`$ of the remaining active indices. The shore cut gives $`C>b/D`$ for their total $`c`$-mass $`C`$; thus $`k`$ active indices require mass greater than $`2\sqrt{2b}+2h(k-1)`$. This exceeds one at $`k=4`$, so $`k\le3`$. If $`k\le2`$, the remaining graph maps to Clebsch (adding inactive $`AB`$ edges is used only for the mapping). Its actual edge mass is at most $`17/100`$, so its cost is at most $`17/500<b`$.

If $`k=3`$, repeat the previous three-index cut comparison with $`m_0`$ replaced by $`h`$. Allow $`S=1-2D-4h-C`$ as an upper bound for all spare mass, even if the remaining total is less than one. The same proof gives
```math
 \beta'\le 2h^2+hS+S^2/4+LD/2-L^2/4,\qquad
 0\le L\le S\le 7/10-2D-b/D.
```
Using the actual spare mass instead of $`S`$ first only strengthens the bound; the displayed right side is increasing in $`S`$. Here $`S<18/125=0.144`$ and $`D<57/200=0.285`$, by AM–GM and by evaluating the increasing function $`2D+b/D`$ at $`57/200`$. If $`D<S`$, the right side is at most $`2h^2+hS+S^2/2<0.0325`$. If $`D\ge S`$, it is at most $`2h^2+S(h+D/2)`$. For $`D\le21/100`$ this is at most $`0.03717<b`$. For $`D>21/100`$, the upper bound $`7/10-2D-b/D`$ on $`S`$ decreases and is less than $`12/125=0.096`$ at $`21/100`$. The bound is then at most $`0.03213<b`$. This contradiction proves the strict result for connected preimages.

Finally, a disconnected preimage with $`\beta>799/20000`$ would have a component of mass $`r>799/800`$, since the sharp bound per component gives $`\beta\le(\sum r_i^2)/25\le(\max r_i)/25`$. This largest component has normalized edge mass at most $`(3197/20000)/r^2<17/100`$, so the connected strict result applies there. The other components add at most $`(1-r)^2/25`$. Since $`r>799/800`$,
```math
 (799/20000)r^2+(1-r)^2/25\le799/20000.
```
This proves the uniform gap and still makes no assumption about the order of the input graph.

### Stability under edits, and an induced-path density consequence

The disconnected argument worked in fact whenever $`e\le33/200`$, since $`(33/200)/(799/800)^2<17/100`$. Thus every middle-band counterexample is more than $`1/20000`$ in unordered product edge-edit distance from a graph homomorphic to a triangle-free induced-$`P_6`$-free graph. Indeed edits of that much change both $`e`$ and $`\beta`$ by at most $`1/20000`$, and leave the edited graph's density below $`33/200`$. The uniform gap there then gives the desired bound back on the original graph.

There is also an absolute positive lower bound on the labeled induced-$`P_6`$ density of every middle-band counterexample. Otherwise take a sequence of their graphons with induced-$`P_6`$ density tending to zero and pass to a cut-convergent subsequence by compactness. The limit remains triangle-free, lies in the same closed density band, and has $`\beta\ge1/25`$ by cut continuity. Its induced-$`P_6`$ density is zero. Finite random samples from that limit are therefore almost surely triangle-free and induced-$`P_6`$-free, so have the strict bound for sufficiently large sample sizes as their densities and cut values converge. This is a contradiction. The argument gives a uniform qualitative density floor, not a numerical value or an upper bound on the induced-$`P_6`$ density of extremizers.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
