# Clebsch cores with arbitrary triangle-free attachments

This gives an all-order structural sufficient condition for the sharp bound in [Erdős #23](https://www.erdosproblems.com/23). A complete balanced Clebsch blow-up occupying at least $17/20$ of the vertex mass suffices, regardless of the triangle-free graph attached to it. The result also gives a test for unequal core weights and for some incomplete cores. It does not resolve the unrestricted conjecture.

Use vertex weights of total one and charge an edge the product of its endpoint weights. Let $p$ be twice the total edge mass, $C$ the core and $\nu$ the exterior vertex mass. Let $\tau$ be the largest, over the four-point types described below, of the minimum mass of a core class in that type. If there is no such nonempty four-point type, take $\tau=0$. The exact certificate is
$
\beta(G)\le p/10+(2/5)\tau\nu+\nu^2/5.
\tag{1}
$

## Core cuts and all possible attachment types

Use the standard folded-cube model: the Clebsch labels are the even binary strings of length five, with an edge when the two strings differ in four coordinates. In a core blow-up each label represents an independent class. The five coordinate cuts miss each core edge exactly once.

An exterior vertex's set $I$ of occupied neighbor labels is independent in the Clebsch template if the core is complete: neighbors in consecutive template labels would have an edge and make a triangle. The rest of the proof only uses that independence property and the Clebsch constraint on internal core edges, so it also covers incomplete cores with the same attachment restriction.

Translate any nonempty $I$ by one of its labels, to include the zero string. Each other label then has weight two, and the corresponding two-subsets of coordinates meet pairwise. Either all these pairs share a coordinate, or the full pair family is exactly the three edges of a triangle: if $\{a,b\},\{a,c\}$ occur but a pair omits $a$, it must be $\{b,c\}$; no other pair can meet all three. In the first case $I$ lies within Hamming distance one of a binary center (take the shared singleton in the translated model). A singleton also has such a center. In the second case $I$ is a four-point type: on two coordinates it is constant, and on its three varying coordinates it has the pattern of the zero string and the three pairs of a triangle, up to translation.

## Assigning exterior vertices to cuts

For each of the five core cuts, independently of what other vertices do, pick a side for each exterior vertex. For a centered type, use the opposite of its center bit. Then every edge to this exterior vertex from the core is monochromatic in at most one cut.

For a four-point type, use the opposite of the constant bit in the two constant coordinates. In the other three cuts, choose the side that minimizes monochromatic mass from this vertex to the core. Write its four weighted neighborhood masses in increasing order $a\le b\le c\le d$. The three varying coordinates make the three different equal-cardinality splits of the four labels. Thus the sum of these losses, divided by the exterior vertex weight, is
$
(a+b)+(a+c)+\min(a+d,b+c)
\le (a+b+c+d)+2a.
$
The premium over the usual one-fifth average is therefore at most $2a/5$; the smallest adjacency mass is at most the smallest size of the four core classes, hence at most $\tau$.

Sum over all vertices and core edges. If $Y$ is the edge mass strictly exterior to the core, the mean of the five total cut losses is at most
$
(p/2-Y)/5 +(2/5)\tau\nu+Y.
$
Weighted Mantel gives $Y\le\nu^2/4$, which proves (1). For a balanced complete core, $\tau\le (1-\nu)/16$. If $p\le0.3197$ and $\nu\le3/20$, formula (1) is at most $0.0396575<1/25$. Above that density apply [Balogh–Clemen–Lidický's dense tail](https://arxiv.org/abs/2103.14179) via rational vertex blow-ups and continuity. The core criterion thus gives a strict margin throughout the open density band.

## Why the tetrahedral premium cannot simply be eliminated

For a uniformly weighted complete Clebsch core, all five coordinate cuts are maximum cuts, and there are no others up to exchanging sides. For completeness, the characters of the even subgroup are represented by coordinate subsets modulo complement. Its five generators are the weight-four words. The adjacency eigenvalues are $5,1,-3$, according as the character takes value $-1$ on zero, two, or four generators. In particular the least eigenspace is spanned by exactly the five coordinate characters. The Rayleigh bound gives cut size at most $32$ out of $40$. A maximizing sign vector lies in that least eigenspace, so it has the form $\sum_i a_i\chi_i$. Its square is identically one. The ten products $\chi_i\chi_j$, $i<j$, are distinct nonconstant characters: two distinct two-subsets cannot differ by the full five-set. Hence each $a_i a_j=0$, and the cut is a coordinate cut.

Any distribution missing at most one fifth of each core edge must therefore use these five cuts with equal probabilities. A new vertex adjacent to all four vertices of a four-point type has, in three of the five cuts, two neighbors on either side. On average at least $6/5$ incident edges are missed, whereas the one-fifth requirement on each of the four would give at most $4/5$. Thus the natural one-fifth fractional edge cover cannot extend over all independently attached new vertices while retaining the same fixed core guarantee. The graph with the apex remains triangle-free.

The folded-cube model and the use of the Clebsch graph in triangle-free max-cut are standard; see [Brouwer–Haemers](https://aeb.win.tue.nl/2WF02/spectra.pdf) and [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179). The scope here is the exact attachment classification, the weighted penalty and its large-core consequence, not a new result for the bare Clebsch graph.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
