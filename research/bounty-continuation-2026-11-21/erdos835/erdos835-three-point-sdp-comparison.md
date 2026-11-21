# Erdős 835: comparison with the published three-point code SDP

Date: 2026-11-21. Status: primary-source scope comparison and a consequence of
the explicitly proved cubic feasibility calculation. No coloring, full
nonexistence proof, or bounty completion is claimed.

## 1. Exact published relaxation being compared

The principal source is Alexander Schrijver,
[*New code upper bounds from the Terwilliger algebra and semidefinite programming*](https://homepages.cwi.nl/~lex/files/codes.pdf),
IEEE Transactions on Information Theory 51 (2005), 2859–2866. The author-hosted
paper was read directly, especially Section III.B, equations (60)–(67).

For constant-weight codes, that section uses one matrix conditioned on an
anchor belonging to the code and another conditioned on the anchor not
belonging to the code. Equation (64) is their equivalent block-diagonal
positive-semidefinite formulation. Equation (65) lists normalization,
entrywise bounds, triple symmetry, and forbidden-distance constraints.
Equation (67) maximizes the code-size expression.

The claim proved below concerns **exactly this 2005 constant-weight
relaxation**, specialized to word length $`2k`$, weight $`k`$, and minimum Hamming
distance four. It does not identify every method informally called a
“three-point SDP,” and it makes no claim about arbitrary stronger code or
coloring hierarchies.

The input is the explicit formal moment system in
[the cubic feasibility note](erdos835-cubic-feasibility-barrier.md).
Its conditional covariance matrices are positive semidefinite for all even
$`k\ge2`$, and its equality-pattern probabilities are nonnegative for all even
$`k\ge14`$. The discussion below uses the latter uniform range.

## 2. Variables and normalization

Put $`p=k+1`$, $`N=\binom{2k}k`$, and $`\mathcal V=\binom{[2k]}k`$. Write

```math
 K_{AB}=\frac1p+kE_{AB}
```


for the formal same-color pair probability, and write $`\tau_{ABC}`$ for the
all-same probability called $`t_{ABC}`$ in the cubic note. Here $`E`$ is the
orthogonal projector onto the top Johnson eigenspace.

For a fixed anchor $`A`$ and vertices $`B,C`$, define Schrijver's orbit indices by

```math
 \begin{split}
 i&=|A\setminus B|,& j&=|A\setminus C|,\\
 a&=|(A\setminus B)\cap(A\setminus C)|,&
 b&=|(B\setminus A)\cap(C\setminus A)|.
 \end{split}
```


The eight Venn counts, in binary order, are

```math
 (k-i-j+b,\ j-b,\ i-b,\ b,\ a,\ i-a,\ j-a,\ k-i-j+a).
 \tag{1}
```


The indices range only over feasible Venn orbits: $`0\le i,j\le k`$ and every
entry of (1) is nonnegative. An impossible tuple is not an independent SDP
variable.

For each feasible tuple, set

```math
 y_{ij}^{a,b}=\tau_{ABC}.                                \tag{2}
```


This is well-defined because the tensor is invariant under permutations of the
ground set. In particular,

```math
 y_{i0}^{0,0}=K_{AB}\quad\text{when }|A\setminus B|=i.
 \tag{3}
```


The normalization is conditional, not the unconditional probability of three
members of one fixed color. To distinguish them, introduce formal binary
code moments for a fixed color:

```math
 \rho=\Pr(X_A=1)=1/p,\quad
 \Pr(X_B=X_C=1)=K_{BC}/p,\quad
 \Pr(X_A=X_B=X_C=1)=\tau_{ABC}/p.
 \tag{4}
```


Dividing the last expression by $`\rho`$ gives (2), exactly the normalization
of the in-code conditional matrix in Schrijver's equation (60). No actual
random code is asserted by this notation.

## 3. Both Schrijver matrices are positive semidefinite

Let

```math
 M_A^+=(\tau_{ABC})_{B,C\in\mathcal V},\qquad
 M_A^-=\left(\frac{K_{BC}-\tau_{ABC}}k\right)_{B,C\in\mathcal V}.
 \tag{5}
```


These are the conditional second-moment matrices for $`X_A=1`$ and $`X_A=0`$,
respectively. Indeed, (4) gives

```math
 \rho M_A^+ +(1-\rho)M_A^-=K/p.
```


The two corresponding mean vectors are

```math
 m_A^+=K(A,\cdot),\qquad m_A^-=\frac{\mathbf1-m_A^+}{k}.
 \tag{6}
```


To compare with the cubic note, write $`e_A=E(A,\cdot)`$,
$`F_A=E\mathop{\mathrm{diag}}(e_A)E`$, and
$`\kappa=k(k-1)(k+2)/2`$. That note proves

```math
 C_A=\frac{k}{p}E+\kappa F_A-k^2e_Ae_A^{\mathsf T}\succeq0,
 \qquad
 Q_A=E-\frac{p(k+2)}2F_A\succeq0.                       \tag{7}
```


Direct substitution in (5) and (6) yields

```math
 \begin{split}
 M_A^+&=C_A+m_A^+(m_A^+)^{\mathsf T},\\
 M_A^-&=\frac1{k^2}C_A+\frac{k-1}{k}Q_A
             +m_A^-(m_A^-)^{\mathsf T}.
 \end{split}                                           \tag{8}
```


Thus **both** conditional matrices are positive semidefinite. Checking only
the in-code matrix would have missed a standard constraint; equation (8)
shows that the existing calculation also covers the out-of-code one.

Schrijver's two block families in (64) are congruent block decompositions of
$`M_A^+`$ and a positive scalar multiple of $`M_A^-`$. Hence (8) certifies every
block, without numerically constructing or testing those blocks.

The matrices here are restricted to the weight-$`k`$ layer. The source embeds
that layer into a tensor product of two Boolean subset spaces; all additional
rows and columns are zero. This embedding adds no positivity condition.

## 4. Every listed scalar constraint is satisfied

The verification below uses the five nonnegative equality-pattern
probabilities from the cubic note:

```math
 \tau,\quad
 q_{AB|C}=K_{AB}-\tau,\quad
 q_{AC|B}=K_{AC}-\tau,\quad
 q_{BC|A}=K_{BC}-\tau,\quad
 u=1-K_{AB}-K_{AC}-K_{BC}+2\tau.
```


* **Normalization, (65)(i).** Equation (2) at $`A=B=C`$ is one.
* **Upper and lower bounds, (65)(ii).** Nonnegativity gives
  $`0\le\tau\le K_{AB},K_{AC},K_{BC}`$. Also
  $`1-K_{AB}-K_{AC}+\tau=q_{BC|A}+u\ge0`$, which is the displayed
  inclusion-exclusion bound in the source. Permutations give the other versions.
* **Triple symmetry, (65)(iii).** Our tensor is symmetric in $`A,B,C`$.
  The three Johnson distances are $`i,j,i+j-a-b`$, and the triple symmetric
  difference has size $`k+2a-2b`$. These invariants recover (1) up to a permutation
  of the three sets. Therefore all source equalities with the same $`a-b`$ and a
  permutation of the three distances hold.
* **Forbidden distances, (65)(iv).** With Hamming minimum distance four,
  the only nonzero forbidden distance within the weight layer is two.
  It corresponds to one Johnson distance equal to one. The cubic note proves
  $`\tau=0`$ if any pair is adjacent, so every required variable is zero.

These are all the constraints in the published program (64)–(67). The
construction does not rely on integrality of its formal triple counts.

## 5. The objective attains the Johnson bound

The objective in Schrijver's equation (66) becomes

```math
 \sum_{i=0}^k\binom ki^2 y_{i0}^{0,0}
 =\sum_{B\in\mathcal V}K_{AB}
 =\frac Np,                                               \tag{9}
```


because $`E\mathbf1=0`$. Thus the explicit feasible point attains
$`\binom{2k}k/(k+1)`$.

For completeness, the same quantity bounds the objective of the entire
published relaxation, not merely our candidate. For any feasible variables,
let $`L_{BC}=y_{d(B,C),0}^{0,0}`$ be the pair matrix. The two semidefinite
constraints imply $`L\succeq0`$ by adding their unscaled matrices. The
normalization gives $`\mathop{\mathrm{tr}}L=N`$, the forbidden-distance constraint
gives $`L_{BC}=0`$ on Johnson edges, and orbit invariance makes its row sum the
objective $`S`$.

Let $`\mathsf A`$ be the Johnson adjacency matrix. Its degree is $`k^2`$ and its
smallest eigenvalue is $`-k`$. Splitting off the constant vector and using
$`L\succeq0`$ gives

```math
 0=\mathop{\mathrm{tr}}(\mathsf A L)
 \ge k^2S-k(N-S).
```


Hence $`S\le N/(k+1)`$. Combining this with (9) proves:

> For every even $`k\ge14`$, Schrijver's 2005 constant-weight SDP
> (equations (64)–(67)) for $`A(2k,4,k)`$ has value exactly
> $`\binom{2k}k/(k+1)`$.

This is a limitation of that specified relaxation. It is not the assertion
$`A(2k,4,k)=\binom{2k}k/(k+1)`$, and even that code-size equality would not by
itself partition the whole layer into the required color classes.

## 6. An augmented one-anchor moment matrix is also covered

A second primary source was checked to prevent conflating Schrijver's matrices
with all later refinements: Monique Laurent,
[*Strengthened semidefinite programming bounds for codes*](https://ir.cwi.nl/pub/11664/11664D.pdf),
Mathematical Programming 109 (2007), 239–261. Section 3.1, equations (23)–(24),
uses a moment matrix indexed by the constant, single vertices, and pairs
containing one fixed anchor. This general graph construction includes a
stronger coupling of the conditional matrices.

The candidate also supplies this particular matrix. Both augmented conditional
matrices

```math
 Z_A^\pm=
 \begin{pmatrix}
 1&(m_A^\pm)^{\mathsf T}\\
 m_A^\pm&M_A^\pm
 \end{pmatrix}
```


are positive semidefinite by (8). Let $`X=(X_B)_{B\in\mathcal V}`$ and
$`H=X_AX`$. The formal matrix of $`(1,X,H)`$ is

```math
 Y_A=
 \begin{pmatrix}
 1&(\rho\mathbf1)^{\mathsf T}&(\rho m_A^+)^{\mathsf T}\\
 \rho\mathbf1&K/p&\rho M_A^+\\
 \rho m_A^+&\rho M_A^+&\rho M_A^+
 \end{pmatrix}.                                         \tag{10}
```


For a linear form $`c+v^{\mathsf T}X+w^{\mathsf T}H`$, its formal quadratic form
in (10) is

```math
 \rho\,(c,v+w)^{\mathsf T}Z_A^+(c,v+w)
 +(1-\rho)\,(c,v)^{\mathsf T}Z_A^-(c,v)\ge0.
```


Thus (10) is positive semidefinite, including its mean row. Nonnegative binary
three-vertex probabilities are obtained by grouping the nonnegative
color-equality probabilities and distributing colors uniformly. They satisfy
the ordinary degree-three inclusion-exclusion bounds as well.

This paragraph proves the stated one-anchor matrix claim directly. It does
not assert that every constraint in every strengthened formulation has been
checked, or identify a bound merely by its informal “three-point” name.
Laurent's further refinements and full fourth-order code/coloring moment
matrices must be compared individually before extending the scope.

## 7. Priority and remaining work

Schrijver's conditional matrices, their block diagonalization, and Laurent's
one-anchor moment construction are established prior work. Our initial
covariance calculation is an explicit feasibility calculation within that
existing machinery; the generic idea of conditioning is not new.

The direct correspondence above establishes the precise published relaxation
covered by the calculation. The bounded literature search did not locate an
earlier statement of this exact uniform value for the displayed parameter
family, but that is not a priority claim. No broader novelty assertion is made.

The full Erdős 835 question remains whether one actual coloring exists for
some integer $`k>2`$. The feasible SDP point is not a coloring or a random code.
No bounty submission or payment claim has been made on the basis of this calculation.
