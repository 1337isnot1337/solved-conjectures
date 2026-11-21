# Barycentric matrices: the stationarity obstruction

Research checkpoint, 20 November 2026 (America/Chicago). No full solution of Problem 15 is claimed.

## Target and source status

[Minc Problem 15](https://yair-lavi.com/mincs-list/problem-15/index.html) asks for a characterization of all binary supports $`A`$ whose doubly stochastic face has minimum permanent at its barycenter $`B=b(A)`$. The live page remains open. It gives a necessary condition: for fully indecomposable $`A`$, $`B`$ is stationary exactly when its supported matching counts factor into a row factor and a column factor. It proves sufficiency only for specified classes, including simplex faces.

The fresh route considered here was to extend that finite stationarity test to a full characterization, perhaps by adding a curvature condition. Stationarity alone fails even on regular edge-transitive supports. The obstruction below belongs to Fischer and Hwang's 1996 family, not to this campaign.

## Exact covariance form of the Hessian

Suppose $`B`$ is a stationary barycenter with positive entries throughout the active support. The supported products $`\prod_i b_{i,\pi(i)}`$ are then constant across the allowed permutations, by the known matching-count factorization criterion. Thus the Gibbs law associated with $`B`$ is the uniform law on those permutations. Let $`M`$ denote a matching with this law, and let $`D`$ be a real tangent direction, with zero row and column sums and zero outside the support. Put $`z_{ij}=d_{ij}/b_{ij}`$ on the support.

Direct expansion gives

```math
\frac{\mathop{\mathrm{per}}(B+tD)}{\mathop{\mathrm{per}}B}
=\mathbb E\prod_{e\in M}(1+tz_e).
```

Since the matching marginals are $`B`$, the linear term is $`\sum_e b_ez_e=\sum_e d_e=0`$. Differentiating twice yields

```math
\frac{D^2\mathop{\mathrm{per}}(B)[D,D]}{\mathop{\mathrm{per}}B}
=\mathop{\mathrm{Var}}\left(\sum_{e\in M}z_e\right)
-\sum_e b_ez_e^2.
```

Therefore local minimality requires a covariance lower bound on the tangent space. It is not a consequence of the matching marginals alone.

## The classical cyclic block family

Let $`P_m`$ be the cyclic permutation matrix and let $`K_2`$ be the $`2\times2`$ all-ones matrix. For $`m\geq4`$, set

```math
H_m=(I_m+P_m)\otimes K_2,
\qquad B_m=H_m/4.
```

The support automorphisms are transitive on edges. Cyclic translation handles block positions; independent permutations within each two-element block handle individual entries; the part-preserving reflection on block indices, row $`i\mapsto-i`$ and column $`j\mapsto1-j`$, exchanges the two types of allowed block. Consequently every supported edge has matching marginal $`1/4`$, so $`B_m`$ is the barycenter. Its supported cofactors are constant, and it is stationary.

Consider the feasible segment

```math
B_m(t)=\frac14\bigl((1+t)I_m+(1-t)P_m\bigr)\otimes K_2,
\qquad -1\leq t\leq1.
```

Every matching sends the same number $`c\in\{0,1,2\}`$ of rows from each block to the next block. The three transfer weights are $`2a^2,4ab,2b^2`$, where $`a=(1+t)/4`$ and $`b=(1-t)/4`$. Hence

```math
\mathop{\mathrm{per}}B_m(t)
=8^{-m}\left((1+t)^{2m}+(1-t)^{2m}+2^m(1-t^2)^m\right).
```

In particular,

```math
\frac{\frac{d^2}{dt^2}\mathop{\mathrm{per}}B_m(t)|_{t=0}}
{\mathop{\mathrm{per}}B_m}
=\frac{2m(4m-2-2^m)}{2+2^m}<0\qquad(m\geq4).
```

The inequality follows at $`m=4`$, and $`2^m-4m+2`$ strictly increases thereafter. Thus $`B_m`$ is not a local minimum despite satisfying the exact stationarity criterion.

I. Fischer and S.-G. Hwang studied precisely this family in *Certain nonbarycentric cohesive matrices*, Linear Algebra Appl. **239** (1996), 185–200, [DOI 10.1016/S0024-3795(96)90011-7](https://doi.org/10.1016/S0024-3795(96)90011-7). Their disconnected minimizer sets gave the negative solution of Minc's old Problem 16. The exact family and attribution are confirmed in [Cheon–Wanless 2005](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), printed pages 337–338, with the bibliographic reference on page 339. The publisher's indexed abstract identifies the same family; its complete 1996 text was not retrieved in this pass. The calculation above is an independent short reconstruction, not a priority claim.

The inequalities research lane independently checked the transfer formula, edge transitivity and derivative sign. No numerical search or Lean verification was needed.

## Remaining global gap

Adding positive local curvature does not provide an easy general sufficiency theorem. The support $`K_n-I_n`$ has stationary barycenter $`(K_n-I_n)/(n-1)`$ and is a known local minimum; proving it globally minimizing is exactly the open zero-diagonal minimum conjecture [C44](https://yair-lavi.com/mincs-list/conjecture-44/index.html). Therefore a full characterization based on stationarity and local minimality would also have to resolve that obstruction. No such local-to-global argument has been established here.

The search included both web engines for stationary and locally minimizing barycenters, edge-transitive supports and cofactor-factorization criteria, followed by the primary survey and the cited publisher record. These searches found the classical counterexample above, not a new full characterization.
