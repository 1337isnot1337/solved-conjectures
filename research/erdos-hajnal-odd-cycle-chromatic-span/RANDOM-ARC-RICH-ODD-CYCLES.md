# The complete-template random arc graphs have rich odd-cycle spans

Partial research on [Erdős–Hajnal's odd-cycle chromatic-span conjecture
(#640)](https://github.com/1337isnot1337/solved-conjectures/issues/1010).
This result rules out the typical complete-template random construction
used for the separate high-girth extraction problem as a source of
counterexamples to #640. It does not settle #640 for other arc graphs.

## Model and statement

Use the complete-template random multipartite model of
[Nguyen–Walczak, §4](https://arxiv.org/abs/2609.40192). There are
$`c\ge5`$ ordered independent parts $`V_1,\ldots,V_c`$ of decreasing
sizes $`n_i`$. Each vertex in $`V_i`$ independently chooses one
uniform out-neighbor in each $`V_j`$ with $`j>i`$; call the resulting
acyclic digraph $`D`$. Its arc graph $`A(D)`$ joins two arcs if the
head of one is the tail of the other. Define
```math
Y=\bigcup_{4\le j\lt c}V_j,\qquad m=|Y|.
```
Keep $`c`$ fixed during the size limit. Assume $`m\to\infty`$ and
```math
\frac{n_1}{n_2\log n_1}\to\infty,\qquad
\frac{n_2}{n_3\log n_2}\to\infty,\qquad
\frac{n_3}{m\log m}\to\infty.
```
Then with probability tending to one there is a simple odd cycle
in $`A(D)`$ containing **every arc of $`D[Y]`$** as a vertex.
All three hypotheses hold for the part sizes
$`n_i=L^{3^{c-1}-3^{i-1}}`$ in the proof of Nguyen–Walczak's
Theorem 4.1 as the integer scale $`L\to\infty`$ at fixed $`c`$.

In particular, with probability tending to one, the largest
odd-cycle span in $`A(D)`$ has chromatic number at least
$`\log_2(\chi(D)-4)`$ whenever $`\chi(D)>4`$. Indeed, the omitted
four parts $`V_1,V_2,V_3,V_c`$ are independent, and the
outgoing-color-set argument gives
$`\chi(D[Y])\le 2^{\chi(A(D[Y]))}`$.
For each fixed chromatic target the cited random construction gives
large $`\chi(D)`$ with probability bounded away from zero; one can
therefore use samples with unbounded odd-cycle span over increasing
targets. More strongly, regardless of how the chromatic number is
obtained, exceptional failures of the spanning statement have
probability tending to zero in this model. This does not say every
sample with high chromatic number has the property.

## Two independent connector pools

Put $`B=V_3`$, and divide $`B`$ in half into pools $`B_4,B_3`$.
Expose the choices from $`V_2`$ to $`B`$ first. With probability
tending to one, each $`b\in B`$ has at least two predecessors
in $`V_2`$: its mean is $`n_2/n_3\gg\log n_2`$ and a binomial
lower-tail bound and the union bound suffice. For each $`b\in B_4`$
fix two distinct predecessors $`a,a'`$ using only this exposure.
For each $`b\in B_3`$ fix one predecessor $`a`$.
None of the predecessor vertices is reused, since each vertex of
$`V_2`$ has exactly one out-neighbor in $`B`$.

For any selected vertex $`z`$ in $`V_2`$ or $`B_3`$, we obtain a
uniform target in $`Y`$ by first choosing $`j`$ from $`4,\dots,c-1`$
with probability $`n_j/m`$, and then using $`z`$'s model choice in
$`V_j`$. Use independent extra randomness for these part choices.
These targets are independent across selected vertices and independent
of the exposure from $`V_2`$ to $`B`$.

* At $`b\in B_4`$, the two targets $`u,v`$ of $`a,a'`$ supply the
  underlying four-edge connector $`u-a-b-a'-v`$.
* At $`b\in B_3`$, use the target $`u`$ of $`a`$ and the target $`v`$
  of $`b`$, obtaining the three-edge connector $`u-a-b-v`$.

Each pool samples independent pairs of uniform vertices of $`Y`$;
discard loops. Connectors attached to distinct $`b`$'s have
disjoint interiors.

## A spanning odd base cycle

The graph of unordered pairs from the long pool $`B_4`$ has
a Hamiltonian cycle with probability tending to one. For an
explicit comparison, among its $`M=|B_4|`$ independent samples
take the first $`N`$, where $`N`$ is independent Poisson of
mean $`M/2`$. The chance that $`N>M`$ tends to zero. In the
Poissonized graph, each unordered nonloop pair independently
occurs with probability $`1-\exp(-M/m^2)`$. Since
$`M/(m\log m)\to\infty`$, this probability is much larger
than $`\log m/m`$; use [Pósa's Hamiltonicity
theorem](https://doi.org/10.1016/0012-365X(76)90068-6).
Equivalently the Poissonized samples can be generated on an
infinite extension of the independent list and coupled to
the actual list on $`N\le M`$.

Condition on a chosen long-pool Hamiltonian cycle. A uniform
pair from the independent short pool hits one of its $`m`$
edges with probability $`2/m`$. So the probability that no
short connector hits a cycle edge is
$`(1-2/m)^{|B_3|}=o(1)`$. Route one hit edge with its short
connector instead of its long connector. Route the other
edges with their long connectors. The connectors have
pairwise disjoint interiors, so this makes a simple cycle
in the underlying graph of $`D`$, visiting every vertex
of $`Y`$ and having length $`4m-1`$.

## Lift and insert every core arc

With probability tending to one each vertex outside $`V_1`$
has at least $`c+1`$ predecessors in $`V_1`$. The smallest
mean is $`n_1/n_2\gg\log n_1`$, so this follows from a
binomial lower-tail bound and a union bound. These incoming
arcs have not been needed in the base cycle. Every vertex
before the last part also has an outgoing arc into $`V_c`$.

List the travel arcs of the base cycle cyclically. At a
connector vertex in $`V_2`$, consecutive travel arcs are
both outgoing, so insert one incoming arc from $`V_1`$.
At $`b\in B_4`$ they are both incoming, so insert the
outgoing arc into $`V_c`$. At the single used $`b\in B_3`$
the travel arcs already alternate.

At every $`u\in Y`$ the travel arcs are both incoming.
Between them insert all $`r`$ arcs of $`D[Y]`$ leaving $`u`$,
with a distinct incoming arc from $`V_1`$ between consecutive
such outgoing arcs. For $`r=0`$ insert the outgoing arc into
$`V_c`$ instead. In either case the number inserted at $`u`$
is odd. All inserted arcs are distinct and are not travel
arcs, as they either lie inside $`Y`$, or use the first or
last part. Distinct padding arcs may share a leaf endpoint;
the arc graph has arcs, not their endpoints, as its vertices.
Around every visit the incoming and outgoing incidences
alternate, giving adjacency for each consecutive pair in
the cyclic list. It is a simple cycle in $`A(D)`$.

There are $`4m-1`$ travel arcs. At connector vertices we
insert $`3(m-1)+1=3m-2`$ arcs, and the parity of the number
inserted in $`Y`$ is $`m\bmod 2`$. Hence the resulting cycle
has odd length, as claimed.

## Intersection with the original #108 construction

[Kohlmeyer–Kruer, §§3.1–3.4](https://hexagonmath.org/pdf/2611.00763v1)
use exactly this complete-template model, indexed from zero.
Fix their $`q,K,C,b,B`$ and let the scale $`R`$ in (5) grow above
its minimum in (4). The three ratio assumptions here then hold:
successive ratios are positive powers of $`R`$ while the logs
are $`O(\log R)`$. The four omitted parts in their indexing
are $`V_0,V_1,V_2,V_{C-1}`$.

Their size estimates and the bounds in Lemmas 3.4 and 3.5 are
uniform for all $`R`$ at least the stated minimum. In the
printed proof of Lemma 3.4, take
$`m=\lceil(1+1/h)x\rceil`$ for the number of offending edges;
this is required by the non-strict bad event and by the
displayed inequality $`hm\ge(h+1)x`$. With that rounding,
the bounds apply unchanged. Thus with probability at least
$`3/4`$ the base satisfies both $`\chi(D)>2q`$ and the
bounded-degree four-colorability premise; with probability
$`1-o(1)`$ it also has the rich odd-cycle span above. For large
enough $`R`$ these events have nonempty intersection.
Taking their degree cap $`K=d+\binom d2`$, $`d=C-1`$, exhibits
the two features simultaneously: all four-cycle-free ordinary
subgraphs of the arc graph are six-colorable, but one odd
cycle has induced span of chromatic number
greater than $`\log_2(2q-4)`$. This is an existence statement
within their random construction, not a claim about every
realization at the particular scale originally printed.

## Limits

The triangle-free **template** of [Nguyen–Walczak, §5](https://arxiv.org/abs/2609.40192)
is not the complete template analyzed here. In particular, a right-facing
vertex need not have an arc to $`V_c`$ in that model. When only the
arc graph itself is triangle-free, as in §4, that limitation does
not arise. The usual bounded-degree edge-subgraph pruning does not
control the induced span of a cycle, and the construction above shows
why the difference persists inside this random family, not just in
artificial pendant extensions.
