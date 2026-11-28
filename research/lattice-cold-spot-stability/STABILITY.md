# Stable cold spots from first moments

The subsequent [all-scale theorem](dual-a-universal/PROOF.md) identifies all minimizers of the dual type-A family for every positive parameter. [Independent review](dual-a-universal/REVIEW.md) · [Reproducible checks](dual-a-universal/verify.py)

This note strengthens the stability implication in Bachoc, Moustrou, Vallentin and Zimmermann, [*Polarization of lattices: stable cold spots and spherical designs*](https://doi.org/10.1017/fms.2026.10169), Forum of Mathematics, Sigma **14** (2026), e25. Their Theorem 1.2 assumes spherical $`2`$-designs on shells about each deep hole, under the single deep-hole orbit hypothesis. We need only spherical $`1`$-designs. This resolves the eventual stability question for $`A_n^*`$ left open in their §1.6; the all-parameter universality question is not asserted here.

## Statement

Let $`L\subset\mathbb R^d`$ be a full-rank lattice, and define
```math
 P_\alpha(z)=\sum_{x\in L}e^{-\alpha\|x-z\|^2},\qquad \alpha>0.
```
A deep hole of $`L`$ is a maximizer of $`z\mapsto \mathop{\mathrm{dist}}(z,L)`$. Let $`\rho`$ be the covering radius. A shell about $`c`$ is *balanced* if $`\sum_{\|x-c\|=r}(x-c)=0`$, which is the spherical $`1`$-design condition.

**Theorem.** Suppose every shell about every deep hole is balanced. Then for all sufficiently large $`\alpha`$, the entire set of minimizers of $`P_\alpha`$ consists of the deep holes with lexicographically minimal shell-cardinality sequences, compared in order of increasing radii over the union of their shell radii. Thus the minimizer set is eventually independent of $`\alpha`$. If all deep holes are equivalent under affine lattice isometries, then every deep hole is a minimizer for all sufficiently large $`\alpha`$.

In the single-orbit setting, this balance criterion is also necessary for stability, by Bachoc et al., Theorem 1.1. Indeed, any stable cold spot must be a deep hole and a critical point for all sufficiently large $`\alpha`$; the stated result identifies precisely such stable critical points by balance.

## Proof

Fix a balanced deep hole $`c`$ and write $`X=\{x-c:x\in L,\ \|x-c\|=\rho\}`$ for its nearest difference vectors. Then $`0`$ lies in the interior of $`\mathop{\mathrm{conv}}X`$. Otherwise a separating or supporting hyperplane provides a unit vector $`u`$ with $`\langle x,u\rangle\le0`$ for all $`x\in X`$. Moving to $`c+\varepsilon u`$ increases the squared distances to all nearest points by at least $`\varepsilon^2`$. All other points remain strictly farther than $`\rho`$ for sufficiently small $`\varepsilon`$, by discreteness and the positive gap to the next shell. This contradicts maximality of the covering radius. Therefore there are constants $`\eta,\lambda>0`$ such that for every unit $`u`$,
```math
 \max_{v\in X}\langle v,u\rangle\ge\eta,\qquad
 \sum_{v\in X}\langle v,u\rangle^2\ge\lambda.
```
The first follows from the inradius of the convex hull about zero, the second from full span and compactness. Also fix
```math
 B=\sum_{v\in L-c} e^{-(\|v\|^2-\rho^2)}<\infty,
```
so $`P_\alpha(c)\le B e^{-\alpha\rho^2}`$ for $`\alpha\ge1`$.

Let $`\tau=\|y\|`$. If $`C/\alpha\le\tau\le\eta`$, a single nearest point yields
```math
 P_\alpha(c+y)\ \ge\ e^{-\alpha\rho^2} e^{2\alpha\eta\tau-\alpha\tau^2}
 \ \ge\ e^{-\alpha\rho^2}e^{\eta C}>P_\alpha(c)
```
after choosing a constant $`C>0`$ with $`e^{\eta C}>B`$.

For $`0<\tau\le C/\alpha`$, group the sum by shells about $`c`$:
```math
 e^{\alpha\tau^2}P_\alpha(c+y)
 =\sum_r e^{-\alpha r^2}\sum_{\|v\|=r,\ v\in L-c} e^{2\alpha\langle v,y\rangle}.
```
By balance and Jensen, each inner sum is at least its cardinality. On the nearest shell the exponents have absolute value at most $`2\rho C`$, so the second-order lower bound $`e^t\ge1+t+e^{-2\rho C}t^2/2`$ gives an additional $`2e^{-2\rho C}\lambda\alpha^2\tau^2`$ beyond the cardinality. Consequently
```math
 \frac{P_\alpha(c+y)}{P_\alpha(c)}
 \ \ge\ e^{-\alpha\tau^2}\left(1+D\alpha^2\tau^2\right),
 \qquad D=2e^{-2\rho C}\lambda/B>0 .
```
For $`\alpha\ge C^2`$ one has $`\alpha\tau^2\le1`$. Using $`e^s\le1+(e-1)s`$ on $`[0,1]`$, this ratio is strictly larger than one once $`D\alpha>e-1`$. Thus $`c`$ is a strict minimizer on a punctured neighborhood of a radius independent of all sufficiently large $`\alpha`$.

There are only finitely many deep holes modulo $`L`$: the lattice Voronoi cell is a bounded polytope cut out by finitely many relevant lattice vectors, and a strictly convex squared norm attains its maximum only at vertices. Apply the preceding argument to finite representatives, and select a common positive neighborhood radius and a common threshold. On the complementary compact subset of the torus $`\mathbb R^d/L`$ the distance to $`L`$ is at most $`\rho-\delta`$ for some $`\delta>0`$. A single nearest summand bounds $`P_\alpha`$ below there by $`e^{-\alpha(\rho-\delta)^2}`$, which is eventually larger than the value at a deep hole. Within a punctured deep-hole neighborhood the potential is larger than at that deep hole. Hence for sufficiently large $`\alpha`$ all minimizers are deep holes.

At two deep holes $`c_1,c_2`$, write $`P_\alpha(c_i)=\sum_r N_i(r)e^{-\alpha r^2}`$, combining the radius sets and allowing zero counts. If these sequences first differ at $`r_0`$, the sign of their difference is eventually the sign of $`N_1(r_0)-N_2(r_0)`$. Indeed, divide by $`e^{-\alpha r_0^2}`$; the remaining tail tends to zero by dominated convergence, using absolute convergence at $`\alpha=1`$. If they never differ, the values are identically equal. The finite comparison of hole types is therefore eventually fixed. This proves the theorem.

## Application to $`A_n^*`$

Set $`N=n+1`$, $`H=\{x\in\mathbb R^N:\sum x_i=0\}`$, and let $`\pi`$ be orthogonal projection onto $`H`$. Then $`A_n^*=\pi(\mathbb Z^N)`$: pairing with every $`e_i-e_j`$ is integral exactly when all coordinate differences are integers. The Voronoi cell of $`0`$ is the convex hull of all coordinate permutations of
```math
 w=\frac1{2N}(N-1,N-3,\ldots,1-N).
```

To see this, for $`S\subset [N]`$ write $`p_S=\pi(\mathbf1_S)`$. The inequalities against these projected indicator vectors are
```math
  \sum_{i\in S}z_i\le \frac{|S|(N-|S|)}{2N}.
```
They imply all Voronoi inequalities. Indeed, subtract the minimum integer coordinate from an integer vector $`m`$, and express it as a sum of nested indicator vectors. The pairwise scalar products of their projections are nonnegative, so $`\|\pi(m)\|^2`$ is at least the sum of their squared norms. Summing the indicator inequalities therefore gives $`2\langle z,\pi(m)\rangle\le\|\pi(m)\|^2`$. To establish the convex hull description, take any linear functional and order its coefficients decreasingly. Summation by parts bounds it by its value at $`w`$ in that order because every partial sum of $`w`$ attains the displayed subset bound. Each permutation of $`w`$ satisfies those bounds, so the two convex sets have identical support functions. Strict convexity of squared norm shows that the deep holes modulo $`A_n^*`$ are exactly the permutations of $`w`$; they are one affine-isometry orbit. Their common squared covering radius is $`\|w\|^2=(N^2-1)/(12N)`$.

Let $`C`$ cyclically shift the last coordinate into the first, and every other coordinate one position forward. Then $`w-Cw=e_1-\mathbf1/N=\pi(e_1)\in A_n^*`$. Thus $`z\mapsto Cz+w-Cw`$ preserves the lattice and fixes $`w`$. Each shell about $`w`$ has its sum of difference vectors fixed by $`C`$, while the fixed subspace of $`C`$ on $`H`$ is zero. All these shells are balanced. This applies to every deep hole by the isometry orbit, so they are exactly the cold spots of $`A_n^*`$ for all sufficiently large $`\alpha`$.

## Scope

The argument does not classify universal cold spots on $`A_n^*`$, nor does it address the general mixed case of several inequivalent deep-hole types only some of which have balanced shells. The published source explicitly asked about $`A_n^*`$ and noted that its shells have first-moment balance without second-moment isotropy. The new step above is the direct uniform-neighborhood argument reducing eventual stability to first moments in the single-orbit setting, and its all-balanced multi-orbit extension. Exact-phrase and citation searches found no previous result of this scope. No priority assertion follows from that search alone.
