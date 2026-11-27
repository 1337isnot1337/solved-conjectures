# Sharp triple density at the first uncountable cardinal

Cinna Davis proves relative independence of simultaneous attainment at the first uncountable cardinal. The [source and review](DENSITY-REVIEW.md) distinguish this refinement from the higher parameter mentioned after Theorem 10.5.

We ask whether there exists a triple system $`H`$ on $`\omega_1`$ without an uncountable independent set such that every $`n`$-point set spans at most
```math
q(n)=\left\lfloor (n-1)^2/4\right\rfloor
```
triples, for every positive integer $`n`$. [Erdős–Galvin–Hajnal (1975)](https://users.renyi.hu/~p_erdos/1975-24.pdf) give the universal lower profile in Corollary 3.6, and obtain equality under CH in Theorem 10.5 and Corollary 10.7. We show that simultaneous attainment is independent of ZFC, assuming ZFC is consistent.

## Failure of simultaneous attainment

Use the model of [Todorčević (1983)](https://doi.org/10.1090/S0002-9947-1983-0716846-0) in which every two-bounded coloring of $`[\omega_1]^2`$ partitions $`\omega_1`$ into countably many rainbow sets; see [Abraham–Cummings–Smyth, Theorem 2 and Remark 4](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf) for the exact attribution.

Suppose $`H`$ has no uncountable independent set and every six points contain at most six triples, as the proposed profile requires. For distinct $`a,b,f`$ let
```math
Z(a;b,f)=\{z:abz,afz\in H\}.
```
If $`Z(a;b,f)`$ were uncountable, choose $`c,d,e`$ spanning a triple in it. On $`\{a,b,f,c,d,e\}`$ there are at least seven triples: $`cde`$ and the six triples consisting of $`ab`$ or $`af`$ with one of $`c,d,e`$. Thus each common co-neighborhood $`Z(a;b,f)`$ is countable.

Take a continuous cofinal sequence of countable ordinals closed under the countable-valued map obtained by taking the union of the three possible $`Z(a;b,f)`$ for each input triple. Such ordinals exist above every countable bound by iterating the closure operation countably many times, and increasing limits of closed ordinals remain closed. This gives successive countable blocks. Choose an uncountable $`S`$ with at most one point in each block, for example one least point per block. For each $`z\in S`$ the link of $`z`$ on earlier points of $`S`$ is a matching: if two edges were $`ab`$ and $`af`$, all three lower points would be below the left endpoint of $`z`$'s block, and closure would put $`z`$ below it as well.

Color the two pairs $`xz,yz`$ with a new common color for every triple $`xyz`$ in $`H[S]`$ with $`x\lt y\lt z`$. The assignment is well defined: within one lower link the edges are a matching, and the larger endpoint distinguishes pairs assigned by different links. Give the remaining pairs distinct singleton colors. The resulting pair coloring is two-bounded. An uncountable rainbow set in $`S`$ contains no triple of $`H`$, contrary to the hypothesis. Therefore every $`H`$ in this model with no uncountable independent set has at least seven triples on some six vertices. In particular no witness attains the sharp profile.

## Attainment

Theorem 10.5 and Corollary 10.7 of the original paper give attainment in any model of CH. See also [the separate research note](https://github.com/1337isnot1337/solved-conjectures/blob/1f63736eadb308d42fba6e300587bfec6aba0fca/research/erdos-galvin-hajnal-sharp-triple-density/COHEN-AND-STICK.md) for attainment after adding one Cohen real, and for a simple construction from stick. This establishes both consistency directions for the original sharp profile, not just for an ordered matching subclass.
