# Independent review of the simplicial ternary-minimality obstruction

Reviewed on 21 November 2026 by the demath_zzz research agent.

Authored note: [erdos774-simplicial-minimality-obstruction.md](simplicial-minimality-obstruction.md). Implementation inspected: [check_erdos774_simplicial_minimality.py](check_erdos774_simplicial_minimality.py).

Conclusion: Sections 1–8 give a valid uniform construction inside the actual simplicial boundary matrices. No correction to its algebra, counts, ternary minimality, circuit statement, or join transfer was found. The construction is a counterexample to a proposed proof shortcut. It is not a solution of Erdős 774 or a completed bounty.

The review below is a proof audit, not an extrapolation from the recorded small instances. No additional finite computation was run.

## 1. The annulus and identifications are legitimate simplicial constructions

For the six triangles in the displayed annulus chain, interior edges cancel in pairs and the remaining boundary is the outer oriented triangle boundary minus the inner oriented triangle boundary. Using two annuli with one private intermediate triple gives twelve triangles and two boundary loops.

Every new triangle contains a private intermediate vertex. Consequently:

- No triangle can degenerate when different inner triples are identified with a shared loop: outer, intermediate, and inner vertices belong to disjoint sets.
- Different holes cannot create the same triangle after the identification, because their intermediate triples are different.
- A non-loop edge touching an inner vertex has an intermediate endpoint private to its hole. It cannot accidentally become a shared edge between holes.
- Old sphere edges remain incident to two triangles, including when both adjacent old faces are replaced.

The annulus dual graph is connected through edges away from its boundary. Gluing the two annuli along the intermediate ring preserves that property, and the patch meets every outer edge. Replacing sphere faces therefore preserves connectivity of the full surface's triangle-adjacency graph when the designated shared-loop edges are excluded.

Thus the use of an abstract simplicial complex, rather than a quotient cell complex, is justified. This is the important geometric step in transferring the generic matrix obstruction.

## 2. Counts and signs

A bipyramid over an $`L`$-cycle has $`L+2`$ vertices, $`3L`$ edges, and $`2L`$ triangular faces. Replacing one face by the two-annulus patch adds eleven faces and, before boundary identification, six vertices and eighteen edges.

For the central surface, $`L=2m+2`$ and there are $`4m`$ holes. Hence it has $`48m+4`$ triangles and $`78m+6`$ edges before shared-loop identifications. Each of the $`m`$ negative surfaces starts from an octahedron, has six holes, and contributes 74 triangles and 120 edges before identification.

There are $`10m`$ holes, so $`30m`$ boundary-edge copies become $`6m`$ distinct shared edges. The $`2m`$ caps add triangles but no new edges. This gives

```math
f_2=(48m+4)+74m+2m=124m+4,
```

```math
f_1=(78m+6)+120m-(30m-6m)=174m+6.
```

The private vertex counts are $`14m+4`$ centrally and $`24m`$ on the negative surfaces. Adding $`6m`$ shared-loop vertices gives $`f_0=44m+4`$.

A puncture contributes minus its inner loop, so reversing the identification orientation realizes a positive matrix entry. This matches the generator's sign convention. The caps have positive boundary orientation.

## 3. Kernel reduction and minimality

Every nonshared edge belongs to exactly two triangles of one surface. Its cycle equation forces the coefficients of those triangles to have the same ratio to the surface's signed fundamental chain. Connectedness of the private-edge dual graph propagates a single scalar throughout the surface. Caps are separate one-triangle groups.

Therefore every cycle has a unique coefficient vector $`x`$ on the surface groups. The only remaining boundary equations are the disjoint shared-loop equations, which are exactly

```math
x_0-2x_{j,1}+x_{j,2}=0,
\qquad
3x_0-4x_{j,1}+x_{j,4}=0.
```

Writing $`a=x_0`$ and $`b_j=x_{j,1}-a`$ gives

```math
x_{j,1}=a+b_j,\quad
x_{j,2}=a+2b_j,\quad
x_{j,4}=a+4b_j.
```

This proves rational nullity $`m+1`$. The reduction is also integral because each surface coefficient is the ratio of an integer triangle coefficient to a sign. It preserves ternarity in both directions because triangle groups are disjoint and all surface-chain coefficients are signs.

For a ternary vector, $`a,b_j`$ are integers, and the displayed four values have range $`4|b_j|`$. A ternary vector has range at most two, so all $`b_j=0`$. Only the zero vector and the two constant nonzero vectors remain. Their expanded cycles use every triangle. This proves full-support ternary minimality, even though the rational kernel is larger.

Setting one $`b_j=1`$ and all other parameters, including $`a`$, to zero gives the proposed 76-triangle rational circuit. Its coefficients have magnitudes one, two, and four, so the primitive height is four. On that support the rational kernel is one-dimensional, and deleting any triangle forces the corresponding nonzero group scalar to vanish. The claimed circuit minimality follows. Different indices use disjoint groups.

## 4. Join transfer and growing-parameter quantifiers

Let $`B`$ contain $`r=k-2\ge2`$ new vertices and $`\tau=\partial e_B`$. Each joined facet has $`3+(r-1)=k`$ vertices.

For a fixed base triangle, boundary rows retaining all three base vertices and deleting two vertices of $`B`$ force the facet coefficients to be a scalar multiple of the coefficients of $`\tau`$. This includes $`r=2`$, where the single equation forces opposite coefficients. The other boundary rows, which retain two base vertices, impose precisely the original base-cycle equations. Thus the asserted full-kernel isomorphism is valid over the rationals and preserves integer coefficients and ternarity.

The vertex count is $`k+44m+2`$, the support size is $`(124m+4)(k-2)`$, and the nullity remains $`m+1`$. Embedding these facets among all $`k`$-subsets of a larger vertex set does not alter dependencies supported entirely on them.

For each fixed $`C>0`$, put $`k=\lfloor n/(C\log n)\rfloor`$ and $`m=\lfloor(n-k-2)/44\rfloor`$. Eventually $`k\ge4`$, $`m\ge1`$, and the embedding inequality holds. Since $`k=o(n)`$, one has $`m\sim n/44`$. This establishes unbounded, indeed linear, rational nullity at the precise critical scale. No parameter varying with $`n`$ has been silently treated as fixed.

## 5. What the example does not prove

It disproves the unqualified identifications “ternary-minimal support equals rational circuit” and “ternary-minimal supports have bounded rational nullity,” even for these simplicial boundary matrices.

Its own dissociated coloring number is exactly two. The full support is the only forbidden nonzero ternary support, so splitting it into any two nonempty parts works. Every proper subset is dissociated. Taking separated copies does not change this limitation.

Thus neither the construction nor its linear nullity lower bound proves an unbounded coloring number, a divergence of minimal-support local incidence, or a resolution of Erdős 774. The authored note states those limits correctly.

## 6. Conditional check of the appended Gaussian calculation

Section 9 explicitly treats the stable-lattice Gaussian theorem and the stability of the normalized exterior-root lattice as external inputs. I have not independently re-proved those inputs in this review.

Conditional on them, the displayed macroscopic-tail estimate is algebraically correct. With $`t^2=(\log q)/(2\pi)`$, one has $`e^{-\pi t^2|S|}=q^{-|S|/2}`$. For supports of size at least $`\rho N`$, extracting the other factor $`q^{-\rho N/2}`$ leaves the theta sum. Also $`\theta_K(t)=\theta_{K/\sigma}(\sigma t)`$, and monotonicity permits the lower bound $`\sigma\ge\sigma_0`$ used there.

The full weighted-sum lower bound from disjoint elementary cycles is also correct: each cycle independently has coefficient zero, plus one, or minus one, and disjoint facet supports make all resulting vectors distinct. The factor for each cycle is $`1+2q^{-(k+1)}`$. The prior fixed-constant packing asymptotic therefore gives divergence of that all-vector sum, compatible with a vanishing macroscopic tail.

This conditional calculation still leaves small and intermediate minimal supports untreated. No new consequence for the number of dissociated colors follows.
