# Entropy and permanent minima on a face

Research checkpoint, 20 November 2026 (America/Chicago). This note gives an exact reformulation of the minimization problem on an arbitrary Birkhoff face. It does not characterize cohesive or barycentric supports, resolve Brualdi's family, or add a solved conjecture. No historical-priority claim is made. An [independent internal review](face_entropy_review.md) found no mathematical gap.

## Definitions and prior input

Let $`D`$ be a binary square matrix with positive permanent, and let $`\Omega(D)`$ be the face of doubly stochastic matrices supported by $`D`$. For a doubly stochastic matrix $`P`$, let $`\nu_P`$ be the unique maximum-entropy probability law on permutations with marginal matrix $`P`$. Define

```math
S(P)=-\sum_{i,j}p_{ij}\log p_{ij},\qquad
I(P)=S(P)-H(\nu_P),\qquad 0\log0=0.
```

The quantity $`I`$ and its pair-row and pair-column averaging theorem are from Sra's [2026 manuscript](https://hexagonmath.org/pdf/2611.00118v1), Sections 2 and 3. Maximum-entropy Gibbs parametrization and finite entropy duality are classical inputs, also proved there. The face reformulation below is a deduction; it is not attributed as a new conjecture resolution.

The ordinary Gibbs permutation law of $`P`$ is

```math
\mu_P(\sigma)=\frac{\prod_i p_{i,\sigma(i)}}{\mathop{\mathrm{per}}P}.
```

It is defined on the permutations supported by $`P`$. Write its marginal matrix as

```math
M(P)_{ij}=
\frac{p_{ij}\mathop{\mathrm{per}}P(i\mid j)}{\mathop{\mathrm{per}}P}.
```

Both $`P`$ and $`M(P)`$ are doubly stochastic and have the same support. Every positive edge of a doubly stochastic matrix belongs to a supported permutation, by its Birkhoff decomposition.

## Exact residual

The maximum-entropy law $`\nu_P`$ has the same support as $`\mu_P`$. Indeed, on the active face one can mix a feasible law with a sufficiently small positive weight on each supported permutation, while keeping the prescribed marginal matrix. Entropy maximization then assigns positive mass to each such permutation.

Using the marginals of $`\nu_P`$ gives

```math
\begin{aligned}
D(\nu_P\Vert\mu_P)
&=-H(\nu_P)-\sum_{i,j}p_{ij}\log p_{ij}
  +\log\mathop{\mathrm{per}}P\\
&=I(P)+\log\mathop{\mathrm{per}}P.
\end{aligned}
```

Consequently

```math
\boxed{\quad
\log\mathop{\mathrm{per}}P
=-I(P)+D(\nu_P\Vert\mu_P).
\quad} \tag{1}
```

In particular, entropy averaging alone gives a lower bound for the permanent. It gives no upper bound for the Lih--Wang interpolation: the nonnegative relative-entropy term in (1) also changes with the matrix.

## A support-preserving direction

Work in the relative interior of the active face of $`P`$. There is a matrix $`B`$, positive on this support and zero elsewhere, whose Gibbs law is $`\nu_P`$. For a tangent matrix $`X`$ supported on this face, finite Gibbs duality gives

```math
dI(P)[X]=\sum_{i,j}X_{ij}\log\frac{b_{ij}}{p_{ij}}.
\tag{2}
```

This follows either by differentiating the entropy maximum or from the smooth finite exponential family after removing its affine redundancies. Constants from the derivative of $`S`$ vanish because the row sums of $`X`$ are zero.

Take

```math
X=P-M(P).
```

This direction has zero row and column sums. For sufficiently small parameters of either sign, $`P+tX`$ stays positive on exactly the active support, so it is feasible in $`\Omega(D)`$. Formula (2) yields

```math
\boxed{\quad
dI(P)[P-M(P)]
=D(\nu_P\Vert\mu_P)+D(\mu_P\Vert\nu_P)\ge0.
\quad} \tag{3}
```

To verify the equality, expand the two relative entropies. Their sum is the expectation of $`\log(\nu_P/\mu_P)`$ under $`\nu_P-\mu_P`$. The normalization constants cancel; the edge marginals are $`P-M(P)`$.

The same direction decreases the logarithm of the permanent:

```math
\begin{aligned}
d\log\mathop{\mathrm{per}}P[P-M(P)]
&=n-\sum_{p_{ij}>0}\frac{M(P)_{ij}^{\,2}}{p_{ij}}\\
&=-\sum_{p_{ij}>0}\frac{(M(P)_{ij}-p_{ij})^2}{p_{ij}}
\le0.
\end{aligned} \tag{4}
```

Both derivatives vanish exactly when $`M(P)=P`$, equivalently when $`\nu_P=\mu_P`$. The equivalence uses uniqueness of the entropy-maximizing law: every Gibbs law maximizes entropy among laws with its own marginals. Equations (3) and (4) are identities, not a convergence theorem for an iteration or flow.

## Global face duality

The function $`I`$ is continuous on the Birkhoff polytope, including its boundary. One finite-dimensional justification is as follows. The maximum entropy under prescribed marginals is upper semicontinuous by compactness of the probability simplex. For the other direction, restrict to any simplex in a finite triangulation of the marginal polytope. Barycentric coordinates are continuous there. For marginals converging to a point in this simplex, a feasible maximizing law at the limit can be mixed with laws at the simplex's vertices, with total added mass tending to zero, to realize the nearby marginals. Entropy continuity supplies the lower limit. There are finitely many simplices, so a subsequence argument gives continuity globally.

Thus $`I`$ attains its maximum on $`\Omega(D)`$. Let $`P_*`$ be a maximizer. Applying (3) in its active face forces $`\nu_{P_*}=\mu_{P_*}`$; otherwise the feasible positive direction would increase $`I`$. Formula (1) then gives

```math
\log\mathop{\mathrm{per}}P_*=-I(P_*).
```

For every $`A\in\Omega(D)`$, (1) also gives

```math
\log\mathop{\mathrm{per}}A\ge-I(A)\ge-I(P_*).
```

Therefore

```math
\boxed{\quad
\min_{A\in\Omega(D)}\log\mathop{\mathrm{per}}A
=-\max_{P\in\Omega(D)}I(P).
\quad} \tag{5}
```

The two optimizer sets coincide. We have proved that every entropy maximizer is a permanent minimizer. Conversely, (4) forces $`M(A)=A`$ at any permanent minimizer, so (1) and (5) give $`I(A)=\max I`$.

## What this leaves open

For an active binary support, cohesiveness is equivalent to attainment of the maximum of $`I`$ in the relative interior of its Birkhoff face. Barycentricity is equivalent to the matching barycenter maximizing $`I`$ on that face. These are exact equivalent optimization problems, not combinatorial classifications.

In Brualdi's family the earlier permanent argument already gives an extra-zero directed acyclic graph at a hypothetical boundary minimizer. The direction in (3) vanishes at that minimizer; it cannot itself remove an extra zero. Proving interior entropy attainment would still require a new argument.

No concavity of $`I`$ on arbitrary Birkhoff faces, no monotonicity under simultaneous row-and-column averaging, and no global convergence of (4) are asserted. None follows from Sra's pair-averaging theorem as used here.

## Elementary check

For $`P=\bigl[\begin{smallmatrix}a&1-a\\1-a&a\end{smallmatrix}\bigr]`$, the two permutation laws are
$`\nu_P=(a,1-a)`$ and
$`\mu_P=(a^2,(1-a)^2)/(a^2+(1-a)^2)`$.
Thus $`I(P)=h(a)`$, (1) is a direct two-term relative-entropy identity, and (5) says $`\min\mathop{\mathrm{per}}P=1/2=\exp(-\max h)`$.
This example checks the normalizations; the unrestricted claim is proved above.
