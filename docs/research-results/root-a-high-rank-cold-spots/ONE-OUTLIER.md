# Exact minimizing translates on all lines with one exceptional coordinate

In the ordinary Euclidean realization of the primal lattice $`A_{N-1}`$ with roots of squared length two, fix a positive scale $`\alpha`$. Restrict the translated Gaussian mass to the union of the classes with at least $`N-1`$ mutually congruent coordinates modulo one. Its minimizers are exactly the deepest central classes, in every rank. These are the classes of common coordinate residue $`k/N`$ for $`k`$ nearest to $`N/2`$. The exceptional coordinate may be anywhere on the circle. The restriction reaches beyond the locus of paired displacements about a deep class; the unrestricted finite-rank problem is open. [Source family](https://arxiv.org/html/2502.08819v2#S1.SS6)

## Reduction to one final half-cell

Set $`M=N-1`$ and $`\beta=\alpha N/M`$. After permutation and a root-lattice translation, any such translate is $`(t/M,\ldots,t/M,-t)`$ with $`t`$ taken modulo $`M`$. Indeed take equal real lifts of the first $`M`$ residues and compensate the integer sum of lift changes in the last coordinate. Completing squares on the first $`M`$ integer coordinates conditional on their sum $`l`$ gives exactly

```math
h(t)=\sum_{l\in\mathbb Z} g_M(l)e^{-\beta(l-t)^2}.
```

Here $`g_M(l)`$ is the mass of the central coset with sum $`l`$ relative to its common center $`l/M`$, so it is even and $`M`$-periodic. The [all-central theorem](ALL-CENTRAL.md) proves it is strictly decreasing in the folded index $`0,\ldots,\lfloor M/2\rfloor`$. With $`M=1`$ it is constant and the one-dimensional Jacobi product proves the claim directly. Take $`M\ge2`$ from now on.

Let $`u_s(t)`$ and $`v_s(t)`$ be the heat convolutions on the circle of length $`M`$ of the unweighted and $`g_M`$-weighted masses at the $`M`$ integer classes. At $`s=1/(4\beta)`$ their ratio $`E_s(t)`$ equals $`h(t)/\Theta_\beta(t)`$, where $`\Theta_\beta`$ is the period-one Gaussian sum. The monotone likelihood ratio for the folded Neumann heat kernel, as in the all-central proof, makes $`E_s`$ nonincreasing on $`[0,M/2]`$ for every $`s>0`$, keeping the weights fixed as $`s`$ varies. It is strictly decreasing in the derivative sense in the interior. Indeed $`E_s`$ solves the heat equation with drift $`2(\partial_t\log u_s)\partial_t E_s`$. Its spatial derivative solves a linear parabolic equation with a smooth zeroth-order term on strips bounded away from heat time zero. By the strong maximum principle a zero of this nonpositive derivative in the interior at positive time would make the ratio constant at an earlier positive time. Injectivity of circle heat convolution (all Fourier multipliers are nonzero) would force the initial masses proportional. The strict ordering of the central levels excludes this.

By reflection take $`t\in[0,M/2]`$. Reflection and integer shifts preserve $`\Theta_\beta`$ and can move any point into the final interval $`[M/2-1/2,M/2]`$ at a greater or equal folded coordinate. More precisely take the greatest coordinate in $`[0,M/2]`$ having the same distance from an integer; it lies in that final interval. The strict decrease of $`E_s`$ lowers $`h`$ whenever this move is nontrivial. If $`M`$ is odd this final half-cell starts at an integer and ends at a half-integer. The Jacobi product shows that $`\Theta_\beta`$ is strictly decreasing there. Thus $`t=M/2`$ is the unique minimizing folded coordinate. It gives common residue $`1/2`$, as required for even $`N`$.

## The number of critical points in odd ambient dimension

Let $`M=2r`$. We use a zero bound for any positive $`M`$-periodic weights $`a_l`$ on the integers. Their Gaussian sum $`h(z)=\sum_l a_l e^{-\beta(l-z)^2}`$ is entire, $`M`$-periodic, and satisfies

```math
h(z+i\pi/\beta)=e^{\pi^2/\beta-2\pi iz}h(z).
```

Indeed the extra factor $`e^{2\pi il}`$ in each summand equals one. The meromorphic log derivative $`v=h'/h`$ is $`M`$-periodic and changes by $`-2\pi i`$ under the vertical period. Choose a translated period rectangle with no zero on its boundary. The integral of $`v`$ around it is $`2\pi i M`$: the two vertical integrals cancel and the two horizontal ones differ by exactly that amount. The argument principle counts $`M`$ zeros of $`h`$ with multiplicity. Its values on the real axis are positive.

The derivative $`v'`$ is elliptic for these two periods. Each distinct zero of $`h`$ gives it a double pole, so the number of poles counted with multiplicity is at most $`2M`$. Since it has a pole it is nonconstant. An elliptic function has as many zeros as poles on the period torus, by the argument principle again. On the real $`M`$-circle, $`v`$ is real and its zeros agree with those of $`h'`$ with their multiplicities. Cyclic Rolle's theorem gives at least as many real zeros of $`v'`$ counted with multiplicity: retain multiplicity minus one at each zero and one between each two consecutive zeros, including the interval across the period. Thus $`h'`$ has at most $`2M`$ real zeros counted with multiplicity. This bound requires no limiting argument about heat time.

For $`0\lt t\lt r`$, at every integer and half-integer $`h'(t)<0`$ because the period-one normalization has zero derivative and $`E_s'(t)<0`$. At

```math
t_k=\frac{Mk}{N}\in(k-1/2,k),\qquad 1\le k\le r,
```

all coordinates of the translate are congruent. Coordinate permutations fix its class and the sum-zero tangent space has no nonzero invariant vector, so $`h'(t_k)=0`$. For each $`k\lt r`$, the negative signs at both endpoints of $`(k-1/2,k)`$ require at least two zeros counted with multiplicity in that interval, since it contains $`t_k`$. The final open interval $`(r-1/2,r)`$ contains at least one zero $`t_r`$. Reflection supplies the same number on the other side of $`r`$, while $`0`$ and $`r`$ themselves are zeros of $`h'`$ by symmetry. The total lower bound is $`2(2(r-1)+1)+2=4r=2M`$. The upper bound is attained, and the last interval therefore has exactly one zero, simple. Its derivative changes from negative to positive there. The minimum is at $`t_r`$ and its reflection, precisely the two deepest central classes when $`N`$ is odd. This sign count also covers $`r=1`$, where there are no earlier intervals.

Codex derived the reduction and the independent elliptic-function zero bound in the WadeDavis research session. The standing full-dimensional question still includes configurations with two or more distinct coordinates outside any repeated block of size $`N-1`$.

[Independent review](ONE-OUTLIER-REVIEW.md) · [Exact finite checks](check_central_order.py)
