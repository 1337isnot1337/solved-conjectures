# Perpendicular bisectors and reflected pairs in Erdős Problem 654

This is a partial result for the [unrestricted catalogue question](https://www.erdosproblems.com/654), tracked in [issue 922](https://github.com/1337isnot1337/solved-conjectures/issues/922). In the argument below $`P`$ has no four points on a circle. An additional no-four-collinear hypothesis suffices for the same average and maximum conclusion as the [published general-position proof](../../results/erdos-general-position-pinned-distances/PROOF.md). The unrestricted catalogue question permits arbitrarily many collinear points. [Erdős, 1987, p. 168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2)

## A second-moment identity

Let $`n`$ be the size of $`P`$, and write $`M=\binom n2`$. For each unordered pair $`e`$ of distinct points let $`k(e)`$ be the number of points of $`P`$ on its perpendicular bisector. For a line $`L`$ write $`r_L`$ for the number of points on $`L`$ and $`b_L`$ for the number of unordered pairs reflected into each other across $`L`$. All sums below can be restricted to lines with $`r_L\ge2`$ or $`b_L>0`$. Double counting yields

```math
\sum_e\binom{k(e)}2=\sum_{L}\binom{r_L}2 b_L,
\qquad \sum_L\binom{r_L}2=M.
```

Indeed, fixing two pins first determines their joining line $`L`$. The permissible base pairs are precisely its reflected pairs. Define the exceptional contribution

```math
E(P)=\sum_{L:\,b_L\ge2}\binom{r_L}2(b_L-1).
```

It follows that $`\sum_e\binom{k(e)}2\le M+E(P)`$. If two distinct pairs reflect across the same line, they are disjoint. In coordinates with the line vertical the pairs are $`(u\pm a,v)`$ and $`(u\pm b,w)`$ for $`a,b>0`$. If $`v\ne w`$, a unique center $`(u,t)`$ solves $`a^2+(v-t)^2=b^2+(w-t)^2`$, giving a forbidden circle. Thus all the reflected pairs on an exceptional line lie on one common line perpendicular to it.

## Consequence for near equality

Let $`A_j`$ count positive pin-radius classes containing exactly $`j`$ points, summed over all pins. Here $`1\le j\le3`$. Write $`D=\sum_{p\in P}d_P(p)`$ and $`N=n(n-1)=2M`$. The exact counts are

```math
3D-N=2A_1+A_2,
\qquad \sum_e k(e)=A_2+3A_3=N-A_1-A_2.
```

Combining the second-moment identity with $`(k-2)^2=2\binom{k}{2}-3k+4`$ gives

```math
\sum_e(k(e)-2)^2\le2E(P)+3(A_1+A_2).
```

Suppose a sequence with $`n\to\infty`$ satisfies $`D\le(1/3+o(1))n^2`$ and $`E(P)=o(n^2)`$. Then $`A_1+A_2=o(n^2)`$ and the last display implies $`\sum_e\lvert k(e)-2\rvert=o(n^2)`$ by Cauchy–Schwarz. Let $`k_3(e)`$ count only pins whose circle through both points of $`e`$ contains exactly three points of $`P`$. Since $`\sum_e(k(e)-k_3(e))=A_2`$, also $`\sum_e\lvert k_3(e)-2\rvert=o(n^2)`$.

Sample uniformly an ordered quadruple consisting of a pin and the three points on one of its multiplicity-three positive circles. For any specified ordered pair in two base positions there are $`k_3(e)`$ completions. For any specified pair in the pin and a base position there are exactly two completions if that pin-base incidence belongs to a triple, and zero otherwise. There are $`6A_3=2N-o(n^2)`$ quadruples. Consequently each two-coordinate projection is at total variation distance $`o(1)`$ from the uniform law on ordered pairs of points of $`P`$. The compactness, rigidity, and support arguments of [the published proof](../../results/erdos-general-position-pinned-distances/PROOF.md) use only these projection laws, equal distances, and planar geometry. They rule out such a sequence.

In particular, if no four points are collinear, then every $`b_L\le1`$ and $`E(P)=0`$. There are absolute $`c>0`$ and $`n_0`$ such that every set with both no four collinear and no four cocircular, of every order $`n\ge n_0`$, satisfies $`D>(1/3+c)n^2`$. Averaging gives the corresponding maximum pinned bound. More generally, the sequential contradiction above shows that there are absolute $`c,\delta>0`$ and $`n_0`$ such that the same conclusion holds whenever $`E(P)\le\delta n^2`$ and $`n\ge n_0`$. If there were no such constants, choosing $`c=\delta=1/j`$ and $`n_0=j`$ would give the prohibited sequence.

A hypothetical counterexample to the full catalogue question must therefore have $`E(P)`$ of quadratic order or larger. No estimate ruling out the simultaneous occurrence of such an exceptional contribution and near-total triple occupancy is claimed here.
