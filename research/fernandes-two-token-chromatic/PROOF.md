# Fernandes et al.’s two-token chromatic conjecture

**False.** There is an eleven-vertex graph with chromatic number six
whose two-token graph has chromatic number five.

Conjecture A.1 of [Fernandes, Lintzmayer, Peña, Santos, Trujillo-Negrete
and Zamora](https://repositorio.unab.cl/server/api/core/bitstreams/545a6b1b-f821-46c6-b3ee-d832e4f99dda/content#page=12)
predicts that the two-token graph $`F_2(G)`$ has lower chromatic number
than $`G`$ only if $`G`$ is an even complete graph. Token configurations
are unordered pairs of different vertices. Two configurations are
adjacent if they share one vertex and their other two vertices form
an edge of $`G`$.

## Five cycle factors give the coloring

Use vertices 0 through 10. The cycles below are cyclic lists;
the last entry connects back to the first. When a row has two
cycles, it means their disjoint union.

| Color | Cycles |
| --- | --- |
| 0 | (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10) |
| 1 | (0, 2, 10, 8, 5, 9, 7, 3, 1, 6, 4) |
| 2 | (0, 3, 6, 9), (1, 8, 4, 2, 5, 7, 10) |
| 3 | (0, 5, 10, 4, 1, 9, 3, 8, 6, 2, 7) |
| 4 | (0, 6, 10, 3, 5, 1, 7, 4, 9, 2, 8) |

Each row spans all eleven vertices. Reading consecutive pairs
including the wraparounds gives all 55 unordered pairs exactly
once. Give a configuration the color in that table, regardless
of whether its pair is an edge of $`G`$.

Let $`D`$ be the graph of two-step pairs from the table: for each
cycle include the pair formed by stepping forward twice from
each entry. Define $`G`$ as the complement of $`D`$. If two different
configurations with a common vertex have the same color,
their other endpoints are the predecessor and successor
of the common vertex in one listed cycle. They are a two-step
pair and are not adjacent in $`G`$. This proves the displayed
coloring is proper on $`F_2(G)`$.

## Six colors are necessary for the base graph

The two-step graph $`D`$ is triangle-free. To check it by hand,
group vertices as follows. The groups are independent in $`D`$;
every pair of groups is either completely joined or anticomplete.
The last column gives all joined groups.

| Group | Vertices | Joined groups |
| --- | --- | --- |
| A | 0, 8 | D, E, J |
| B | 1, 5 | C, F, J |
| C | 4, 7 | B, D, E |
| D | 6, 9 | A, C, F |
| E | 2 | A, C |
| F | 3 | B, D |
| J | 10 | A, B |

The group graph is the cycle A–E–C–B–F–D–A with the extra
edge C–D and the two-edge path A–J–B. None of these additions
makes a triangle. Since the groups themselves are independent,
$`D`$ is triangle-free. Hence every independent set of $`G`$ has
size at most two. Eleven vertices then require at least six colors.

Fixing a token at any vertex $`v`$ induces a copy of the graph
$`G-v`$ inside $`F_2(G)`$. In particular, the displayed five-coloring
colors $`G-v`$ with five colors, and giving $`v`$ a new color gives
a six-coloring of $`G`$. Also $`G-v`$ cannot have fewer than five
colors, since otherwise this extension would color $`G`$ with at
most five. Consequently

```math
\chi(G)=6,\qquad \chi(F_2(G))=5.
```

The proof checks a single explicit counterexample to the whole
universal statement. No claim of smallest order is made, and
neither solver output nor a large census is needed to verify it.
The same cycle lists are in [certificate.json](certificate.json).
Run `python verify.py` to check the full pair partition, the
complement’s triangle-freeness and all 279 token adjacencies.
