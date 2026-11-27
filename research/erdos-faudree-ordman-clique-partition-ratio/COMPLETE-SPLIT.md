# Fixed-density complete split graphs

This note gives an exact leading coefficient in the classical
clique-minus-a-clique family, as a separate application of the
profile rounding in [REDUCTION.md](REDUCTION.md). The cover number
in this family grows linearly, so it is not an extremal candidate
for the clique-partition ratio in [issue #990](https://github.com/1337isnot1337/solved-conjectures/issues/990).

Let G be the join of a clique A and an independent set B, with
$`|A|/n\to a=1-b`$ and $`|B|/n\to b\in(0,1)`$. Put
$`k=\lfloor1/b\rfloor`$ and $`\theta=1/b-k`$. Then

```math
\lim_{n\to\infty}\frac{\mathop{\mathrm{cp}}(G)}{n^2}
 =ab\left(\frac{1-\theta}{k}+\frac{\theta}{k+1}\right).
```

The two adjacent block orders, rather than an unrestricted
real-valued order, are essential. If $`1/b`$ is an integer,
the expression reduces to $`ab^2`$ and attains the classical
quadratic Cauchy–Schwarz lower bound. In the range $`b\ge1/2`$
it agrees with the known exact large-hole result of
Pullman and Donald.

## Integer supporting inequality

Write C for the number of crossing edges and D for the number
of internal edges of A. A mixed clique has one vertex in B and
r vertices in A. It contributes r to C and $`\binom r2`$ to D.
For every nonnegative integer r,

```math
2kr-2\binom r2 = k(k+1)-(r-k)(r-k-1)\le k(k+1).
```

The resulting clique inequality is valid for pure cliques as well:
they contribute no crossing edges, so their left side is
nonpositive. Summing over an exact edge partition proves the
finite lower bound

```math
\mathop{\mathrm{cp}}(G)\ge
\left\lceil\frac{2kC-2D}{k(k+1)}\right\rceil.
```

Choosing k as above and passing to the limit gives the advertised
coefficient, by $`2D/C\to 1/b-1`$.

## A matching asymptotic packing

In units n squared, use mixed profiles with respectively k and k+1
vertices from A, each with exactly one vertex from B. Give them
weights $`ab(1-\theta)/k`$ and $`ab\theta/(k+1)`$. This spends exactly
ab units of crossing edges. Its internal load in A is

```math
\frac{ab}2\left((1-\theta)(k-1)+\theta k\right)
 =\frac{ab}2(1/b-1)=a^2/2.
```

The total cost equals the lower bound. To turn it into exact
partitions with at most an arbitrarily small quadratic error,
split the actual edges randomly into profile pools after scaling
the displayed weights by a common factor less than one. The
fixed-profile rounding proof in [REDUCTION.md](REDUCTION.md)
applies verbatim: it uses only complete adjacency on the edge
categories used by each allowed profile, and the within-B
category is absent. In particular, the conditional expected
degree for an assigned edge is the same across the two used
categories. Round by an almost perfect matching on each pool
and cover the leftover edges individually. Let the scaling
factor tend to one after the order tends to infinity.

## Prior work and scope

[Erdős, Faudree and Ordman (1988), Theorems 1–2](https://www.renyi.hu/~p_erdos/1988-04.pdf)
give the Cauchy–Schwarz lower bound and the $`m^2+o(m^2)`$ upper
bound for an independent-hole size $`m`$ above square root of the
order. They also record a report of unpublished results of Rose.
[Cavers, §2.5](https://uwaterloo.ca/combinatorics-and-optimization/sites/default/files/uploads/documents/mike-cavers.pdf)
surveys the asymptotic small-hole regime and the Pullman–Donald
exact formula in the large-hole regime, and directs the reader
to Monson, Pullman and Rees for more about smaller fixed densities.
[Rees (1986)](https://doi.org/10.1016/0012-365X(86)90098-1)
gives an improved finite lower bound and exact families
via pairwise balanced designs. The integer lower bound above is
not presented as new. The calculation here is a proof of the
full fixed-density asymptotic by elementary fractional profiles
and dense matching; it makes no claim to an exact finite formula
or priority over every design-theoretic derivation. This is a
side calculation, not a resolution of the main ratio problem.
