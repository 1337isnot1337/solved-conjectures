# Connected pieces in a unit-area-triangle-free set

Let $A$ be a bounded measurable planar set avoiding triangles of area one, and $K$ its closed convex hull. Write $|B|$ for planar area. A connected subset $C$ of $A$ satisfies
```math
 |K|\,|\overline{\mathrm{conv}} C|\le\pi^2 .
```
Consequently any disjoint measurable connected pieces $C_i$ satisfy $\sum_i |C_i|^2\le\pi^2$. If $A$ is a union of at most $k$ measurable connected sets, even overlapping, then $|A|\le\pi\sqrt{k}$. This estimates how fragmented a hypothetical sequence of large avoiding sets must be.

To prove the first bound assume $K$ has positive area. For any $z\in A$, the signed double areas $\det(v-u,z-u)$ for $(u,v)\in C^2$ form a connected subset of the real line containing zero. It omits both $2$ and $-2$. For fixed $u,v$, the resulting absolute bound extends to $z\in K$ by affinity. Subtract at two points of $K$ to obtain
```math
 |\det(v-u,z-w)|\le4\qquad (u,v\in C,\ z,w\in K).
```
Put $D=\overline{\mathrm{conv}} C$. Taking convex hulls extends the chord condition to $v-u\in D-D$. If $J$ denotes a quarter-turn, this says $J(D-D)\subseteq4(K-K)^\circ$, where the superscript denotes the polar about the origin. Brunn–Minkowski gives $|D-D|\ge4|D|$ and $|K-K|\ge4|K|$. The planar Blaschke–Santaló inequality gives $|K-K|~|(K-K)^\circ|\le\pi^2$, since the difference body is centrally symmetric. Combining the three bounds proves the assertion. For disjoint pieces sum $|C_i|^2\le |C_i|\pi^2/|K|$. In the union of $k$ pieces use both $|A|\le|K|$ and $|A|\le k\pi^2/|K|$. [Blaschke–Santaló and Brunn–Minkowski inequalities](https://webusers.imj-prg.fr/~dario.cordero/Docs/articles/interpolations_CE-K.pdf).

## Pieces meeting a convex curve

There is an absolute area bound, independent of the number of pieces, if $A$ is a union of connected pieces whose closures all meet the boundary of one convex body contained in $K$. This includes arbitrarily many disjoint disks with centers in convex position. In the collinear center case take their common center segment in the proof.

Choose a triangle of maximal area $T>0$ in $K$. Its vertices may be chosen in the closure of $A$, by maximizing the affine signed determinant one coordinate at a time. Use affine coordinates in which its vertices are $(0,0),(1,0),(0,1)$. Since the marked triangle is maximal, comparing any point of $K$ with each coordinate edge puts $K$ in $[-1,1]^2$. Physical areas are $2T$ times coordinate areas. If $T\le1$ this already gives $|A|\le8$.

For $T>1$, apply the chord inequality above with $z-w$ equal to each marked coordinate edge. The two coordinate differences of any pair in the same connected piece have absolute value at most $2/T$. The piece and its closure have diameter at most $h=2\sqrt2/T$ in these coordinates.

The chosen convex boundary now has perimeter $L\le8$. For instance, its total horizontal and vertical variations are each at most four. The area of the $h$-neighborhood of any rectifiable curve of length $L$ is at most $2hL+\pi h^2$. This follows first for polygonal paths by sweeping a disk along each segment. For a general curve use successively finer inscribed polygonal paths of length at most $L$ with the covering radius enlarged by their uniform approximation error. Every piece lies in this neighborhood, and hence
```math
 |A|\le 2T(2hL+\pi h^2)\le64\sqrt2+16\pi .
```
No optimization of this constant is needed. More generally the same calculation applies to any rectifiable curve that meets the closures, with its actual length measured in the marked triangle coordinates. Thus a sequence of avoiding configurations with area tending to infinity requires unbounded length for every such connecting curve in this normalization.

Mauldin's reduction permits arbitrarily many convex pieces with unrestricted placement. The estimates leave that case open. [Mauldin, Section 5](https://sites.math.unt.edu/~mauldin/papers/no153.pdf) · [Erdős problem 352](https://www.erdosproblems.com/352).
