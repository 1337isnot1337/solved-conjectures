# Cavey–Lee's conjecture: divisibility and the remaining positivity problem

Research checkpoint, 21 November 2026. **The full conjecture remains unresolved.**
The argument below establishes all the proposed factors and integrality of the
quotient. It does not establish nonnegative quotient coefficients. This is not a
new completed-conjecture count.

## 1. Exact target

Ian Cavey and Yi-Lin Lee, *Domino Tilings, Domino Shuffling, and the Nabla
Operator*, [arXiv:2501.17765v1](https://arxiv.org/html/2501.17765v1),
Conjecture 5.1, asks that for every partition λ of Durfee rank r,

```math
P_\lambda(z;q,t)=Q_\lambda(z;q,t)
 \prod_{i,j\geq0,\ i+j\lt r}(z+q^it^j),
\qquad Q_\lambda\in\mathbb Z_{\geq0}[z,q,t].
```

The source's Theorem 1.1 gives, for N equal to the size of λ,

```math
P_\lambda(z;q,t)=\operatorname{sgn}(\lambda)
 \sum_{d=0}^N\langle\nabla s_\lambda,h_de_{N-d}\rangle z^d.
```

Theorem 1.3 already proves the full assertion for square partitions. No square
case is claimed here as new. The source's path formula proves that P has
nonnegative integer coefficients for every λ, but this alone does not prove
positivity after division.

## 2. A consequence of the super-Macdonald kernel theorem

Work over the field of rational functions in independent parameters u,v. Let
Pμ and Qμ be the dual ordinary Macdonald bases, and write g_d=Q_(d). For
nonnegative integers a,b, let the (a,b) fat hook consist of the partitions μ
with μ_(a+1) at most b.

**Lemma 1.** If μ belongs to this fat hook, Qμ belongs to the span of products

```math
g_{\alpha_1}\cdots g_{\alpha_a}
 e_{\beta_1}\cdots e_{\beta_b},
\qquad \alpha_i,\beta_j\geq0.
```

Here g_0=e_0=1, so fewer factors are allowed.

**Proof.** Put U equal to a finite alphabet of a independent variables and V
equal to one of b independent variables. Apply the plethystic substitution

```math
A=U-\frac{1-u}{1-v}V
```

to the first alphabet in the Macdonald Cauchy identity. It gives

```math
\sum_\mu P_\mu[A;u,v]Q_\mu[X;u,v]
 =\Omega\!\left[UX\frac{1-v}{1-u}-VX\right]
 =\prod_{x\in U}\left(\sum_{d\geq0}g_d[X;u,v]x^d\right)
  \prod_{y\in V}\left(\sum_{d\geq0}(-1)^de_d[X]y^d\right).
```

The super-Macdonald kernel theorem states that Pμ[A] vanishes exactly for
partitions outside the (a,b) fat hook, and that the remaining Pμ[A] are
linearly independent. The theorem is due to Sergeev and Veselov, Theorem 5.6
of [arXiv:0707.3129v2](https://arxiv.org/pdf/0707.3129), published in
*Communications in Mathematical Physics* 288 (2009), 653–675. Their second
parameter is inverted relative to the ordinary Macdonald convention used
here; rescaling the second finite alphabet gives the displayed substitution.
For the standard parameter convention, compare Atai–Hallnäs–Langmann,
[*Super-Macdonald Polynomials: Orthogonality and Hilbert Space Interpretation*](https://research.chalmers.se/publication/525449/file/525449_Fulltext.pdf),
equations (31)–(38) and the discussion of the parameter convention.

In each fixed total degree, linear independence means that coefficient
extraction in U,V spans the dual of the span of these finitely many Pμ[A].
Consequently each Qμ with μ in the hook is a linear combination of the U,V
coefficients on the right side. Those coefficients are exactly the products
in the lemma, up to signs. This proves the claim. ∎

**Lemma 2.** If μ belongs to the (a,b) fat hook, then every Schur function
occurring in Qμ[X(1−u);u,v] has Durfee rank at most a+b.

**Proof.** The generating function defining the Macdonald row functions is

```math
\sum_{d\geq0}g_d[X;u,v]w^d
 =\Omega\!\left[wX\frac{1-v}{1-u}\right].
```

Hence g_d[X(1−u);u,v]=h_d[X(1−v)]. Both this function and
e_d[X(1−u)] are linear combinations of products h_c e_(d−c), because

```math
h_d[X(1-v)]=\sum_{c=0}^d(-v)^{d-c}h_c[X]e_{d-c}[X],
```

and the analogous elementary identity exchanges h and e. By Lemma 1, the
transformed Qμ is therefore a linear combination of products of at most
a+b complete functions and at most a+b elementary functions.

Put m=a+b. A product of m complete functions is, by repeated Pieri, a
linear combination of Schur functions with at most m rows. Multiplying
successively by m elementary functions adds m vertical strips. Each row
below the first m rows consequently has length at most m. Every resulting
partition has its (m+1)st part at most m, so its Durfee rank is at most m.
This argument is about support and does not require the scalar coefficients
in the preceding expansions to be positive. ∎

## 3. Support of the inverse modified-Macdonald transition

Write

```math
s_\lambda[X]=\sum_{\mu\vdash N}c_{\lambda\mu}(q,t)
 \widetilde H_\mu[X;q,t].
```

**Lemma 3.** If the Durfee rank of λ exceeds a+b and μ_(a+1) is at most b,
then c_(λμ)=0.

**Proof.** Put u=q and v=t⁻¹. By definition, the modified Macdonald
polynomial Htildeμ[X;q,t] is a nonzero scalar multiple of
Pμ[X/(1−v);u,v]. Replace X by X(1−v) in the displayed expansion. The
coefficient c_(λμ), up to a nonzero scalar depending only on μ, becomes

```math
\left\langle s_\lambda[X(1-v)],Q_\mu[X;u,v]
 \right\rangle_{u,v}
 =\left\langle s_\lambda[X],Q_\mu[X(1-u);u,v]
 \right\rangle.
```

The last inner product is the ordinary Hall product. The equality follows
on power sums from the defining multiplier

```math
\langle p_\rho,p_\rho\rangle_{u,v}
 =z_\rho\prod_k\frac{1-u^{\rho_k}}{1-v^{\rho_k}}.
```

Lemma 2 makes the Hall inner product zero. ∎

Thus every μ occurring in the inverse transition for a rank-r Schur
function contains the staircase with row lengths r,r−1,…,1. Indeed, if μ
omitted its zero-based cell (i,j), it would satisfy μ_(j+1) at most i.
When i+j<r, Lemma 3 would force its coefficient to vanish.

## 4. All the conjectured factors

For a homogeneous symmetric function F of degree N define

```math
\mathcal E_z(F)=\sum_{d=0}^N\langle F,h_de_{N-d}\rangle z^d.
```

The standard modified-Macdonald evaluation

```math
\widetilde H_\mu[1-w;q,t]
 =\prod_{(i,j)\in\mu}(1-wq^it^j)
```

implies, by setting w=−1/z and multiplying by z^N, that

```math
\mathcal E_z(\widetilde H_\mu)
 =\prod_{(i,j)\in\mu}(z+q^it^j).
```

Here cells have zero-based column and row coordinates. By the definition
of nabla and the source's Theorem 1.1,

```math
P_\lambda(z;q,t)=\operatorname{sgn}(\lambda)
 \sum_{\mu\vdash N}c_{\lambda\mu}(q,t)
 q^{n(\mu')}t^{n(\mu)}
 \prod_{(i,j)\in\mu}(z+q^it^j).
```

Every nonzero summand contains the conjectured triangular product by
Lemma 3. This proves divisibility over Q(q,t)[z]. The divisor is monic
in z and belongs to Z[q,t,z], while Pλ belongs to Z[q,t,z]. Monic
polynomial division therefore gives a quotient in Z[q,t,z], with zero
remainder because the remainder also vanishes over the fraction field.

The resulting complete statement is

```math
\frac{P_\lambda(z;q,t)}
 {\prod_{i,j\geq0,\ i+j\lt r}(z+q^it^j)}\in\mathbb Z[q,t,z]
\quad\hbox{for every partition }\lambda.
```

## 5. What is still missing

The displayed Macdonald sum has rational, potentially signed transition
coefficients. It does not give a nonnegative expansion of the quotient.
The facts that P has nonnegative coefficients and its divisor is a product
of positive binomials do not settle this: (z+1)(z²−z+1)=z³+1 is an
elementary obstruction to that inference.

The source's square-shape domino-shuffling proof may suggest an appropriate
positive model after division, but no extension to all boundary shapes is
established here. The full Conjecture 5.1 remains open in these notes.

## 6. Exact counterexample screen and source status

The accompanying C++ enumerator implements the source's pairwise disjoint
Schröder paths and its exact area/dinv definitions. A standard-library Python
checker performs monic division over integer coefficient dictionaries. It
matches the source's square formula for sizes 1,2,3 and q,t symmetry for
every inspected partition. An exact screen found no counterexample among
142 partitions of sizes 10–12 with rank at least 2 and 65 partitions of
sizes 10–14 with rank at least 3; these sets overlap. These finite passes
are not a proof of positivity, and the independent mathematical audit of
the general divisibility argument is still pending.

Initial priority coverage includes the original full preprint, the published
FPSAC extended abstract (SLC 93B.80, 2025), both author publication pages,
the October 2026 UMass seminar abstract, both web search engines, repository
issue history, and global GitHub issue search. No full resolution was found
in those sources. Global GitHub code search was temporarily rate limited
during this checkpoint; that gate remains incomplete. The divisibility
argument is a consequence of the credited 2009 kernel theorem, and no
exclusive priority for this consequence is asserted.
