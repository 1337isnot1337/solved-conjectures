# Regular weighted circular graphs: a complete quotient classification

This is a structural result for the complete circular models used in the Andrásfai approach to [Erdős #23](https://www.erdosproblems.com/23). It includes a rigidity statement for nearly regular graphs. It does not apply to arbitrary edge-deleted circular models.

Put positive masses on a finite set of distinct points on the unit circle. For a fixed angle parameter $0<a<1/2$, join points when their clockwise displacement lies in $(a,1-a)$. Assume no pair is exactly at a boundary displacement. Merge all vertices with identical open neighborhoods, add their weights, and use one original point to represent each merged class. This leaves a complete circle model, with the same weighted degree on each class as before. If the graph has no edges, its quotient is a single isolated vertex. Otherwise assume its weighted degrees differ by less than the smallest quotient weight. In particular, this holds for every positive-degree regular weighted model.

**Classification.** The quotient has $m$ vertices in cyclic order. There is an integer $J$ with $J-1<am<J$, and every vertex $i$ has exactly the neighbors
$
i+J,\ i+J+1,\ldots,i+m-J\pmod m.
\tag{1}
$
For exact regularity, if $k=m-2J+1$, the quotient weights are periodic with period $\gcd(m,k)$. Conversely the equally spaced model with these periodic weights is weighted regular.

## Proof by counting window events

The quotient is twin-free. It has no isolated vertex: a positive neighbor has degree at least the smallest quotient weight, while an isolated vertex would have degree zero. Sweep the moving open window $(x+a,x+1-a)$ clockwise as $x$ runs through one turn of the circle. Each point enters once and exits once. The $m$ consecutive gaps between vertices therefore contain a total of $m$ entrance events and $m$ exit events.

For each gap, the neighborhoods at its endpoints differ, since the endpoints are not twins. The far endpoint cannot simply have gained vertices or simply have lost vertices; either change would raise or lower its weighted degree by at least the smallest positive weight. It must have gained and lost at least one vertex, so the gap contains at least one event of each kind. Consequently every gap contains exactly one entrance and exactly one exit. None can occur at its endpoints by the strict-boundary assumption.

The first index in the moving neighbor block therefore advances by exactly one when its center advances by one. This is true even if a one-point block temporarily becomes empty between centers: the departing first point is replaced by its following point in cyclic order. Thus the constant first-neighbor offset is $J$. The last offset is $m-J$, since adjacency is symmetric. To identify $J$, use real lifts of the vertex positions, with $x_{i+m}=x_i+1$. At every center,
$
x_{i+J-1}-x_i<a<x_{i+J}-x_i .
$
Sum over one period. Each one-step gap is counted $J-1$ or $J$ times on the relevant side, so $J-1<am<J$.

Let $w_j$ be the quotient weights. When $i$ advances one step, the block loses weight $w_{i+J}$ and gains $w_{i+m-J+1}$. Exact regularity makes these equal, which is $w_j=w_{j+k}$. Its orbits are the residue classes modulo $\gcd(m,k)$, proving periodicity. The converse follows either by the same window difference or by summing a periodic sequence over a block of length $k$. More generally, if the degrees lie in an interval of width $\Delta$ smaller than the minimum quotient weight, then $|w_j-w_{j+k}|\le\Delta$ for all $j$. On each orbit the deviation from its mean is at most $(m/\gcd(m,k))\Delta$.

## The triangle-free circular threshold

For $a=1/3$, the order $m$ is not divisible by three. The nonempty reduced graph is exactly one of these two families:
- $m=3k-1$, with allowed clockwise offsets $k,\ldots,2k-1$; this is the usual Andrásfai graph.
- $m=3k+1$, with allowed offsets $k+1,\ldots,2k$.

In both families $\gcd(m,k)=1$, so exact weighted regularity forces the quotient weights to be uniform. An arbitrary full induced support of a product-weighted Andrásfai template has such a strict $a=1/3$ model. The classification therefore describes every positive-degree regular induced support, including supports with zero weight on the other original template vertices.

For either family the normalized deletion minimum is exactly $\lfloor k^2/4\rfloor/m^2$. For the upper bound use a contiguous split of the $m$ vertices into the two closest sizes. A block of size $s$ contributes $\binom{s-J+1}{2}$ edges when $s\ge J-1$, by counting offsets at least $J$ inside it. The two block sizes for $k\ge1$ obey this range and do not reach the upper offset boundary. The sum of the two binomial inputs is $k+1$, and they are as close as possible, so their edge sum is $\lfloor k^2/4\rfloor$.

For optimality, the complement is the $(J-1)$-st cycle power. [Vasilev's edge-isoperimetric theorem](https://arxiv.org/html/2601.06912v1), Theorem 1, maximizes interior edges of the power at each prescribed size by an interval. Both sizes attain their maxima simultaneously because the complement of a cyclic interval is another interval. Thus a fixed-size optimal cut of the original graph may be taken to be an interval. The within-interval edge count as a function of its size is discretely convex: the increment is the number of allowed positive offsets below that size, which cannot decrease. This makes the two closest sizes optimal. For $J=1$ the graph is just the edge on two points and the same formula holds directly. Uniform twin blow-ups transfer the weighted deletion minimum by sampling one representative independently from each class.

For $m=3k+1$ the exact value is always less than $1/25$, as $\lfloor k^2/4\rfloor/(3k+1)^2<1/36$. For $m=3k-1$ equality occurs only at $k=2$: $k=1$ gives zero, while $k\ge3$ gives $(3k-1)>5k/2$ and hence a strict bound. Therefore a regular complete circular model attains the pentagon bound only at the balanced pentagon quotient.

The geometric representation is standard; see [Bedenknecht–Mota–Reiher–Schacht, Lemma 2.1](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf). The exact cut-size step uses Vasilev's existing theorem. The new argument here is the window-event rigidity and its extension to every strict angular threshold. It neither assumes nor establishes the weighted formula on nonregular supports.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
