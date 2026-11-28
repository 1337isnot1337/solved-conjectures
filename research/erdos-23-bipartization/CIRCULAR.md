# Erdős's triangle-free bipartization conjecture for circularly 3-colorable graphs

Write $D_2(G)$ for the fewest edge deletions needed to make $G$ bipartite. [Erdős's conjecture (Problem 23)](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/K3FreeToBipartite.html), stated in [Erdős–Faudree–Pach–Spencer (1988)](https://combinatorica.hu/~p_erdos/1988-12.pdf), asks whether $D_2(G)\le |V(G)|^2/25$ for all triangle-free graphs. We prove this bound for every graph with circular chromatic number strictly less than $3$, in particular for every graph homomorphic to an Andrásfai graph. The proof covers an additional, countable-order-free structural class described by a six-part partition. This is not a full solution of Problem 23. The bound is sharp within this class, by balanced blow-ups of the pentagon.

Related prior work: [Bedenknecht–Mota–Reiher–Schacht](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf) proved the **sparse-half conjecture** for graphs homomorphic to Andrásfai graphs. That selects one half with few edges; the bipartization problem concerns the sum of the edge counts in both parts of a single cut, without a half-size requirement. We use the established high-density tail of [Balogh–Clemen–Lidický, Theorem 2(b)](https://arxiv.org/pdf/2103.14179#page=2). [Ferudun's 2026 preprint](https://arxiv.org/abs/2606.28041) studies in-band finite orders and does not establish the unrestricted assertion. The [October 2026 research summary](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) records the separate Clebsch-homomorphism result and keeps the middle band open. [Bispo–Mendonça–Mota–Parente, LAWCG 2024, p.42](https://www.lawcg.mat.br/lawcg24/LAWCG2024-annals.pdf) concern sparse halves of vertex-deleted Vega blow-ups, not the sum of both sides of a cut. Searches using the exact circular and Andrásfai class terminology did not identify a previous bipartization proof for the class considered here.

## A six-part cut lemma

Use weighted graphs with nonnegative vertex weights summing to 1, and give each edge the product of its two endpoint weights. Write $m$ for the total edge weight and $\beta$ for the least same-side edge weight of a cut. Consider a triangle-free weighted graph with a partition into six independent sets $P_0,\ldots,P_5$, in cyclic order, and with no edges between consecutive parts. Let $U=P_0\cup P_2\cup P_4$ and $V=P_1\cup P_3\cup P_5$, with masses $p$ and $1-p$. Then
```math
 \beta\le\frac{\tfrac14+(p-\tfrac12)^2+m}{11}. \tag{1}
```
The only possible cross edges between $U$ and $V$ join opposite parts $P_i,P_{i+3}$.

Let $E_U$ and $E_V$ be the internal edge weights of these two induced graphs and put $E=E_U+E_V$. The three cuts separating a consecutive triple of parts from its complementary triple all cut any edge between opposite parts. For a possible edge between $P_i$ and $P_{i+2}$, exactly one of the three cuts puts its endpoints on the same side. Therefore the mean same-side weight of these cuts is $E/3$, giving $\beta\le E/3$.

For a triangle-free weighted graph of mass $x$ and edge weight $M$, there is a cut with same-side edge weight at most $x^2/4-M$. For completeness, choose a vertex of maximum weighted degree $\Delta$, and take its independent neighborhood as one class. If $B$ denotes the remaining set, of mass $x-\Delta$, the weighted sum of degrees on $B$ is $M+e(B)$, since the other class is independent. This is at most $\Delta(x-\Delta)$, so $e(B)\le x^2/4-M$.

Apply this to $G[U]$ and $G[V]$. Keeping their internal cuts fixed, there are two choices of relative orientation, and one leaves at most half the $m-E$ connector weight uncut. Hence
```math
 \beta\le \frac{p^2+(1-p)^2}{4}-E+\frac{m-E}{2}.
```
Taking the smaller of this bound and $E/3$ gives (1): the maximum of the smaller of these two affine functions of $E$ is their intersection. In particular, when $p=1/2$,
```math
 \beta\le \frac{1/4+m}{11}. \tag{2}
```

Combining (1) with Balogh–Clemen–Lidický proves the conjectured $\beta\le1/25$ whenever
```math
 |p-1/2|\le \sqrt{603/20000}.
```
This includes $p\in[1/3,2/3]$. Indeed at $m\le3197/20000=0.15985$ the bound follows from (1), using $1/4+603/20000+3197/20000=11/25$. If $m>3197/20000$, Theorem 2(b) of Balogh–Clemen–Lidický covers the graph: for rational weights blow up the vertices proportionately to obtain arbitrarily large unweighted graphs with normalized density at least $0.3197$ relative to $\binom{n}{2}$. Dividing the same-side edge count by $n^2$ and rounding the fractional classes gives the claimed weighted bound. Irrational weights follow by continuity and approximation with the strict density margin. The rounding is justified explicitly below; equality at the density boundary was already handled by (1).

## Circular graph embeddings admit a balanced partition

If the circular chromatic number is strictly less than 3, place the finitely many vertices on the circle of circumference 1 so that every edge joins two points at circular distance strictly greater than $1/3$. Conversely such positions are an equivalent formulation for a finite graph: the finite set of edge distances has minimum greater than $1/3$, giving a circular coloring with circumference smaller than 3 after rescaling. A graph homomorphic to the Andrásfai graph on $3d-1$ vertices has such positions by equally spaced placement, since its edges have minimum circular distance $d/(3d-1)>1/3$.

To treat atoms at sector boundaries, spread each vertex into a separate short interval of twins centered at its position, with continuous mass equal to its original weight. Make intervals sufficiently short that every pair across an original edge still has circular distance strictly greater than $1/3$. Keep different original vertices' twin copies separate as labeled fibers, even if their angular intervals overlap; edge presence is dictated by the original graph. Rotate a partition of the circle into six consecutive arcs of length $1/6$. The mass of its alternating union of three arcs is continuous in the angle (the angular distribution has no atoms), and a rotation by one sixth replaces it by its complement. By the intermediate value theorem there is an angle for which this mass is exactly $1/2$. No graph edge is inside one arc or between neighboring arcs, since such points are at circular distance at most $1/3$. The six-part lemma applies.

This need not be formulated as an infinite graph: divide each vertex's interval into its at most six pieces by the selected sectors, and use the resulting finite, weighted twin graph. Any cut of a weighted twin graph projects to a cut of the original weighted graph with at most the same cost. In fact, independently choose a color for each original vertex with the conditional probabilities given by its colored twin mass. There are no edges within its own fiber, and independence across original vertices makes the expected uncut edge weight exactly that of the twin cut. Some integral choice attains no more. This also gives the rounding used for the high-density blow-ups.

Thus every circularly 3-colorable graph in the strict sense satisfies the exact conjectured bound. It is sharp: the five equally weighted parts of a pentagon blow-up can be colored within parts by the same rounding principle, and every coloring of an odd cycle leaves at least one edge uncut.

## A robustness consequence

If at most $(603/200000)|V(G)|^2$ edges of a triangle-free graph $G$ can be deleted to leave a graph with circular chromatic number below 3, then $G$ already satisfies the conjectured cut bound. In normalized units let $\eta$ be the weight deleted. The high-density case $m>3197/20000$ is already known. Otherwise (2) applied to the remaining graph of edge weight $m-\eta$ gives
```math
 \beta(G)\le\eta+\frac{1/4+m-\eta}{11}
 =\frac{1/4+m+10\eta}{11}\le1/25 .
```

The structural theorem for maximal triangle-free graphs of minimum degree $>n/3$ (Andrásfai or Vega blow-ups) does not by itself improve the scope here: minimum degree $>n/3$ already implies the Balogh–Clemen–Lidický density threshold. The more general question of arbitrary weighted Vega blow-ups at lower density is not addressed by the proof, since the six-part template is 3-colorable.

## A further class: Vega graphs without their two axis vertices

The previous structural exclusion of general Vega graphs does not preclude some sharp extensions. Let $J_d$ be the induced subgraph of the standard Vega graph obtained by deleting its two axis vertices $x,y$, for $d\ge2$. In the notation of [Łuczak–Polcyn–Reiher, §4.1](https://onlinelibrary.wiley.com/doi/full/10.1002/jgt.22682), this consists of the Andrásfai core $\Gamma_d$, partitioned into its three consecutive classes $C_0,C_1,C_2$ of sizes $d,d,d-1$, and an outer 6-cycle. Write its outer vertices $a_i,u_i$ for $`i\in\{0,1,2\}`$, with all edges $a_i u_j$ for $i\ne j$, and with both $a_i$ and $u_i$ adjacent to all of $C_i$ and no other core vertices. **Every graph homomorphic to $J_d$ satisfies $D_2(G)\le |V(G)|^2/25$.** It suffices to check all weighted versions of $J_d$: a homomorphic image pulled back with class weights can only add edges, and a good cut of the weighted target gives a cut of the original graph.

First, deleting any single edge of the outer 6-cycle leaves a graph with circular chromatic number below 3. Put $N=3d-1$, $\delta=1/(3N)$ and place the core vertex $v$ at $v/N$. Set $L=(d-1)/N+1/3$. For label $i$ write an outer position as $i/3+\lambda$. The open ranges of $\lambda$ guaranteeing distance strictly greater than $1/3$ to every vertex in $C_i$ are
```math
 (L,L+2\delta),\quad
 (L+\delta,L+3\delta),\quad
 (L-\delta,L+4\delta)
```
for the three labels respectively, by considering the first and last core point in each consecutive class. Their common intersection has length $\delta$. Put all six $\lambda$ values in that intersection. For two successive labels mod 3 the corresponding outer edge is allowed precisely when the later label's $\lambda$ is larger. For the ring the resulting ordering constraints form the directed cycle
```math
 a_0\longrightarrow u_1\longrightarrow a_2\longrightarrow
 u_0\longrightarrow a_1\longrightarrow u_2\longrightarrow a_0.
```
Deleting any edge breaks this cycle, and increasing values in a topological order meet every remaining constraint.

Now let $J_d$ be weighted with total mass 1 and edge weight $m$. High density $m>0.16$ is already settled by Balogh–Clemen–Lidický. Assume $m\le0.16$, and write $a_i,u_i$ also for their respective weights. Let $\eta=\min_{i\ne j} a_i u_j$. If $\eta\le0.003$, delete that edge and apply the robustness consequence to the circular remainder; this proves the conjectured bound.

Otherwise all six ring edge weights exceed $0.003$. Let $t$ denote the core mass and $c$ the total weight of attachments between the core and the ring. A family of three cuts singles out one core class against the other two, putting each outer pair on the opposite side from its attached class. It cuts every attachment and leaves one third of the remaining weight on average. Thus we are done if $c\ge m-0.12$; assume $c<m-0.12\le0.04$.

If $t\le0.66$, color the core by (2), rescaled to its own weight, and color the ring bipartitely. With an appropriate relative flip, the attachments leave at most $c/2$ uncut. Since the core is triangle-free and has edge weight at most $t^2/4$, its use of (2) costs at most $t^2/22$. The total is therefore less than $0.66^2/22+0.04/2=0.0398<1/25$.

If $t>0.66$, write $w=1-t<0.34$ and $s_i=a_i+u_i$. All six ring edge weights are at least $\eta$, so
```math
 w-s_i=\sum_{j\ne i}(a_j+u_j)\ge
 2\eta(1/a_i+1/u_i)\ge8\eta/s_i.
```
Consequently $s_i\ge8\eta/w>0.024/0.34$ for every $i$, giving
$c\ge t\min_i s_i>0.66(0.024/0.34)>0.04$, a contradiction. This proves the claim for the full family $J_d$, but does not include Vega graphs with either axis vertex retained.
