# Erdős–Tuza’s rainbow disjoint-triangles problem

Erdős and Tuza singled out the disjoint union of two triangles among the graphs for which the balanced rainbow question was open. The host is $K_{6d+1}$, with each of six colors occurring on exactly $d$ edges at each vertex. Necessarily $d$ is even. The question asks for two vertex-disjoint triangles whose six edges use all six colors. The all-cliques result claimed by Kitamura in September 2026 concerns a different family of target graphs. [Erdős–Tuza (1993), p. 81](https://doi.org/10.1016/S0167-5060(08)70377-7) · [Clemen–Wagner, introduction](https://arxiv.org/abs/2303.15476) · [Problem 811 discussion](https://www.erdosproblems.com/forum/thread/811) · [Issue 809](https://github.com/1337isnot1337/solved-conjectures/issues/809)

## Every partition of the palette into three classes occurs on a triangle

**Theorem.** Partition the six colors of any balanced coloring of $K_{6d+1}$, $d>0$, into three nonempty groups in any prescribed way. There is a triangle with one edge from each group. In particular, any two prescribed colors occur together on some rainbow triangle.

**Tool.** A complete graph colored without a tricolored triangle has a partition into at least two nonempty parts such that every pair of parts is joined monochromatically, and at most two colors occur between parts. This is Gallai’s decomposition. We apply it to the three colors obtained after merging each prescribed group. [Gyárfás–Simonyi, Theorem A](https://www.renyi.hu/~simonyi/galcol.pdf)

**Equal groups.** For group sizes $2,2,2$ all three degrees are $2d$. If there were a Gallai partition, each part would contain all neighbors of an omitted color for each of its vertices and have size at least $2d+1$. A vertex in any other part sees the entire part in a single color, which has degree $2d$. This is impossible.

**Groups of sizes $1,2,3$.** Call the colors of the merged graph small, medium and large, with respective degrees $d,2d,3d$. In any Gallai partition, each part has at least $d+1$ vertices, since at least one color is absent between parts. Hence the small color cannot appear between parts. Every part has size at most $3d$, since an outside vertex sees it in a single color. If a part had no medium neighbor among the parts, all its small and medium edges would be internal, forcing at least $3d+1$ vertices. It must have exactly one medium neighbor, since two parts each of size at least $d+1$ exceed the medium degree. Thus the parts pair off by medium edges. Every vertex sees all vertices outside its pair in the large color. Each pair therefore has size at least $(6d+1)-3d=3d+1$, so there is exactly one pair. In that case small and large neighbors are internal to each part, exceeding the maximum part size. This rules out a Gallai partition.

**Groups of sizes $1,1,4$.** Write $A,B$ for the two colors of degree $d$ and let $H$ be their union. Its components have at least $2d+1$ vertices. We show that every component has at most $3d$ vertices if no desired triangle exists. In a component on $h$ vertices, apply Gallai’s decomposition to the induced complete graph using $A,B$ and the remaining merged color $C$. At least one of $A,B$ occurs between parts, since $H$ is connected there. If either of $A,B$ were absent between parts, every part would have size at least $d+1$, preventing either color from occurring between parts. Thus both $A,B$ occur between parts and $C$ is absent there. Every part has size at most $d$, since an outside vertex sees it in $A$ or $B$. All $h-1-2d$ neighbors of each vertex in $C$ within this component are internal to its part. Hence $h-2d\le d$. Finally, $6d+1$ cannot be the sum of component sizes between $2d+1$ and $3d$. Two components have at most $6d$ vertices, and three have at least $6d+3$. This proves the theorem.

## Consequence for palette constructions

A *palette* is the three-element set of colors on a rainbow triangle. The palette family of a lexicographic product on a common color set is the union of the two input families. A triangle using two outer blocks repeats a cross-edge color. The other possibilities read a triangle in one of the factors. Thus a balanced base can be amplified into a counterexample by taking all its powers if its palette family is intersecting. Conversely, a pair of complementary palettes in one base can be realized in two different blocks of its square. This lexicographic criterion predates this investigation. [July 2026 report, Lemma E](https://www.erdosproblemaday.com/report/811)

An intersecting family of triples on six colors extends to one choosing a single triple from every complementary pair. There are $2^{10}$ such maximal families before relabeling. The theorem excludes any family that misses a prescribed three-group partition. A further obstruction excludes the star consisting of all triples containing one designated color. To see this, the total number of monochromatic two-edge paths is $6(6d+1)\binom d2$. Each nonrainbow triangle contains at least one of these, so the number of rainbow triangles is at least

```math
{6d+1\choose3}-6(6d+1){d\choose2}=(6d+1)(3d^2+2d).
```

At most $(6d+1)d(6d-1)/2$ triangles contain an edge of the designated color, strictly fewer. The subtraction counts each monochromatic triangle three times, which is valid for this lower bound.

The [exact enumeration](palettes.py) reduces the 1,024 maximal families to 13 isomorphism classes and then to **three** surviving classes. It uses permutations of six labels, set containment and integer arithmetic. The full problem remains open. In a single host two complementary palettes can be represented by intersecting physical triangles, so this classification controls lexicographic-power constructions in particular.
