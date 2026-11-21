# Erdős 835: independent audit of the published SDP comparison

Date: 2026-11-21. Reviewed file: [the SDP comparison](erdos835-three-point-sdp-comparison.md). Coordination: [issue 236](https://github.com/1337isnot1337/solved-conjectures/issues/236).

Verdict: the comparison is correct for the specific published relaxations it identifies, using the separately reviewed cubic positivity theorem. No missing constraint was found in Schrijver's program (64)–(67). This is a feasibility barrier for those methods, not a coloring or a completed bounty.

## Primary sources actually inspected

I independently opened Alexander Schrijver's author-hosted [New code upper bounds from the Terwilliger algebra and semidefinite programming](https://homepages.cwi.nl/~lex/files/codes.pdf), read Section III.B, equations (60)–(67), and inspected the rendered page containing those equations.

I also opened Monique Laurent's [Strengthened semidefinite programming bounds for codes](https://ir.cwi.nl/pub/11664/11664D.pdf) and read the general-graph one-anchor formulation (23)–(25). This review does not certify every later refinement in that paper.

## Conditional matrices and normalization

Let $`p=k+1`$, $`N=\binom{2k}{k}`$, $`K_{BC}=1/p+kE_{BC}`$, and let $`\tau_{ABC}`$ be the cubic note's all-same-color probability. Binary membership in a fixed color has first moment $`1/p`$, pair moment $`K_{BC}/p`$, and triple moment $`\tau_{ABC}/p`$.

Therefore conditioning the anchor $`A`$ to be in the code gives

```math
M_A^+=(\tau_{ABC})_{B,C},\qquad m_A^+=K(A,\cdot).
```

Conditioning it to be out gives

```math
M_A^-=\left((K_{BC}-\tau_{ABC})/k\right)_{B,C},
\qquad m_A^-=(\mathbf1-m_A^+)/k.
```

The factor $`k=p-1`$ is correct.

Using $`e_A=E(A,\cdot)`$ and the cubic note's $`F_A,\kappa,C_A,Q_A`$, direct expansion gives

```math
M_A^--m_A^-(m_A^-)^\mathsf T
=\frac{k}{p}E-\frac{\kappa}{k}F_A-e_Ae_A^\mathsf T
=\frac1{k^2}C_A+\frac{k-1}{k}Q_A.
```

Both terms in the final expression are positive semidefinite. Thus the out-of-code condition is included, in addition to the in-code condition. The source's two block families are equivalent to the two unscaled conditional matrix families; a positive scalar does not change their positivity.

## Schrijver's scalar constraints

For feasible orbit indices $`i,j,a,b`$, the Venn profile in the reviewed note is correct:

```math
(k-i-j+b,\ j-b,\ i-b,\ b,\ a,\ i-a,\ j-a,\ k-i-j+a).
```

Only realizable Venn profiles index actual matrix orbits. Impossible index tuples should not be treated as additional independent variables.

The source's normalization is $`\tau_{AAA}=1`$. Its nonnegativity, upper bound and inclusion-exclusion condition follow from the five color-equality probabilities. In particular,

```math
1-K_{AB}-K_{AC}+\tau_{ABC}=q_{BC|A}+u_{ABC}\ge0.
```

For triple symmetry, the three Johnson distances are

```math
i,\quad j,\quad i+j-a-b,
```

and the triple symmetric-difference size is $`k+2a-2b`$. The three distances and $`a-b`$ recover the Venn profile up to a permutation of the three sets. This verifies exactly the symmetry condition in (65)(iii), not merely interchange of $`B,C`$.

At minimum Hamming distance four, the only positive forbidden distance in the constant-weight layer is two. That is Johnson adjacency, where the cubic note proves $`\tau=0`$. These checks cover (65)(i)–(iv).

## Objective and matching upper bound

The candidate's objective is $`\sum_B K_{AB}=N/p`$, since $`E\mathbf1=0`$.

For an arbitrary feasible point of the published relaxation, adding the two unscaled positive semidefinite matrices gives the orbit-invariant pair matrix $`L`$. It has trace $`N`$, row sum equal to the objective $`S`$, and zero entries on Johnson edges. If $`\mathsf A`$ is the adjacency matrix, its degree is $`k^2`$ and its least eigenvalue is $`-k`$. Splitting off the constant vector yields

```math
0=\mathop{\mathrm{tr}}(\mathsf A L)
\ge k^2S-k(N-S).
```

Thus $`S\le N/(k+1)`$. This upper bound matches the candidate and verifies the exact SDP value claimed in the reviewed note for every even $`k\ge14`$.

The inequality uses positive semidefiniteness, not an unstated integrality condition. Exact code size or a partition into color classes does not follow.

## Laurent's one-anchor augmented matrix

Laurent's (23)–(24) indexes the moment matrix by the constant, all single vertices, and pairs containing a fixed anchor. The reviewed $`Y_A`$ has exactly that block structure. Its conditional mixture formula is correct:

```math
\rho(c,v+w)^\mathsf T Z_A^+(c,v+w)
+(1-\rho)(c,v)^\mathsf T Z_A^-(c,v),
\qquad \rho=1/p.
```

Both augmented conditional matrices are positive semidefinite by the checked covariance identities. Repeated indices are consistent because $`M_A^\pm`$ have diagonals $`m_A^\pm`$, and the forbidden-edge moments vanish.

This verifies the displayed one-anchor matrix and its listed degree-three scalar constraints. It gives no certificate for a full fourth-order moment matrix or for every stronger code bound.

## Status

The exact published-relaxation comparison has been independently checked. Its mathematical conclusion remains limited to feasibility of those relaxations. The full Erdős 835 target remains unresolved by this work.
