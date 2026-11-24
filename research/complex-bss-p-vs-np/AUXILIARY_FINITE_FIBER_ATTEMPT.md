# Auxiliary finite fibers and the cost of algebraic branching

Status: research attempt. A monic triangular incidence system gives an exact fixed-prefix verifier for setwise skew invariance. Polynomial completeness for permanent equality is not proved. A bounded-depth class of these systems reduces to the previously excluded finite-universal prefixes, with explicit witness counts. This note does not replace a general elimination or radical operation by a unit-cost step.

Use D=2^m, a primitive D-th root zeta, and the O(m^2)-gate digit/Ryser polynomial H_X from [SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md](SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md). Put h(t)=H_X(t)-y/D. Its sum over t^D=1 is per_m(X)-y. The primitives and inverse rho are shared existential witnesses, checked by zeta^D=1, zeta^(D/2) different from one, and zeta*rho=1.

## 1. A finite incidence family with no projection basepoints

Let c be a tuple of circuit parameters. For j=1,...,q, prescribe a positive integer d_j and a monic polynomial

```math
E_{t,j}(w_1,\ldots,w_j)
=w_j^{d_j}
 +\sum_{a=0}^{d_j-1}
   F_{j,a}(X,y,\zeta,\rho,c,t,w_1,\ldots,w_{j-1})w_j^a.
                                                               \tag{1}
```

The circuit template enforces monicity syntactically; it is not assumed only at generic certificate parameters. Let G_t(w) be a polynomial circuit in the same parameters and witnesses. Define

```math
V_t=\{w\in\mathbb C^q:E_{t,j}(w)=0\text{ for all }j\},
\qquad
S_t=\{G_t(w):w\in V_t\}.                                 \tag{2}
```

For every parameter specialization, V_t is finite and nonempty. Successively choose a root of each monic positive-degree univariate polynomial. There are at most product_j d_j choices, counted with algebraic multiplicity, so the number of distinct points is at most that product. Consequently S_t is finite and nonempty as well.

The same conclusion has a ring-theoretic form that keeps track of degeneracies. Over the polynomial ring in all parameters, adjoining w_j modulo the monic equation (1) gives a free module with basis 1,w_j,...,w_j^(d_j-1) over the preceding ring. Induction gives a finite free algebra of rank product_j d_j, with the expected monomial basis. Specialization preserves that rank. Roots may collide and the fiber algebra may become nonreduced, but points cannot escape to infinity through a vanishing leading coefficient. No divisions or generic parameter restrictions are used in (1)–(2).

For large d_j, a small circuit for (1) must be supplied and charged. The displayed coefficient sum is not a short representation when it has exponentially many independently supplied coefficients. Section 4 treats the separate case of explicitly small Kummer equations with exponential degree.

## 2. The exact continuous verifier

The desired setwise inclusion is

```math
S_t+h(t)\subseteq S_{\zeta t}\qquad(t^D=1).               \tag{3}
```

It is expressed by the prefix

```math
\exists(\zeta,\rho,c)\quad
\forall(t,w)\in\mathbb C^{q+1}\quad
\exists w'\in\mathbb C^q.                               \tag{4}
```

The verifier first checks the primitive-root and inverse equations. It then accepts when t^D differs from one or some E_(t,j)(w) is nonzero. Otherwise it checks

```math
E_{\zeta t,j}(w')=0\text{ for every }j,
\qquad
G_{\zeta t}(w')=G_t(w)+h(t).                             \tag{5}
```

Every element of S_t has a preimage w, so (4) implies (3). Conversely, (3) supplies the needed w' for every valid input witness w, while invalid witnesses are accepted by the guard. Thus the quantifier dependencies in (4) express exactly the inclusion. They do not ask the final witness w' to be a globally chosen function.

If the coordinate circuits and q have polynomial bounds, the verifier runs in polynomial BSS time. All field operations, divisions used to compute the checked inverse, and equality branches are charged. Repeated squaring computes t^D, and the finite systems are evaluated by their supplied circuits.

The finite nonempty sets (2) give soundness on all complex matrices: iterating (3) around the orbit yields S_t+(per_m(X)-y) subset S_t. A finite nonempty subset of C has no nonzero additive period. Therefore y=per_m(X).

Unrestricted completeness is easy but expensive. At a true input use the interpolated cyclic primitive q(t) from the original note, take one auxiliary equation w_1^2=0, and set G_t(w)=q(t). Its coefficient list and Horner circuit have size O(D). What remains unproved is a polynomial bound for some monic incidence-and-output certificate for every true input. The incidence representation could be more compact than an explicitly computed eliminating polynomial; no general elimination bound of the required form is assumed.

## 3. Bounded dependency depth and bounded branch degree are excluded

Suppose the witness coordinates are arranged in k layers. Each E_(t,j) depends only on its own new coordinate and coordinates in earlier layers, with no dependence on another new coordinate in the same layer. Assume d_j<=d, where q,d, the parameter count, and all circuit sizes are polynomially bounded in m. The number k is first treated as fixed.

### 3.1 A layer can be enumerated before choosing its labels

Once the values from earlier layers have been fixed, each equation in the next layer is a numerical monic univariate polynomial of known degree d_j. Existentially supply a list

```math
r_{j,1},\ldots,r_{j,d_j}
```

and check the polynomial identity

```math
E_{t,j}(z)=\prod_{a=1}^{d_j}(z-r_{j,a}).                 \tag{6}
```

Both sides are degree d_j. Evaluation at d_j+1 fixed distinct scalar z-values checks (6). Over C a root list with multiplicity exists for every such polynomial. Repeated entries are permitted, so singular fibers are covered exactly.

After that existential list has been fixed, universally choose one index a_j in {1,...,d_j} for each coordinate in the layer and set w_j=r_(j,a_j). This covers every distinct solution of the layer, with possible duplicate representations. The lists cannot depend on their own layer's universal labels. They may depend on labels and witness values in all earlier layers, which is the dependency needed for a triangular system.

### 3.2 The resulting prefix and its resources

First choose the shared parameters, then universally choose the m Boolean orbit bits defining t. Repeat the preceding root-list and label step for the k layers. End with the original local witness w' in (5). The prefix is

```math
\exists(\zeta,\rho,c)\quad
\forall b_t\quad
\exists R_1\ \forall b_1\quad
\exists R_2\ \forall b_2\quad\cdots\quad
\exists R_k\ \forall b_k\quad
\exists w'.                                             \tag{7}
```

Each universal block is finite. Boolean encodings of the indices use at most sum_j ceil(log_2 d_j) bits along a path; invalid labels can be ignored with a guard. The factorization equations must still be enforced on every valid prefix. Equivalently, formulate each challenge directly over the displayed finite index set and then encode it.

Along one path the root lists contain sum_j d_j<=qd complex coordinates. The final witness has q coordinates. No full exponentially large root tree is included in one witness block. The expanded tree is represented by the alternations and their dependencies.

Let L bound the total circuit size of the coordinate equations and output evaluations. A safe gate bound for all root-list checks along a path is O(dL+qd^2), including the products evaluated at all sample points. Selecting the entries and evaluating (5) adds polynomially many operations in q,d,L and m. Thus every resource except the number of layers remains polynomial.

For soundness of (7), induction on the layers shows that every w in V_t occurs along some universal label path: factorization (6) includes every root of the next coordinate equation. The final witness then proves (5) for that w. Conversely, (4) lets the existential choices use the actual complete root lists at each visited prefix, so (7) is complete whenever the original incidence certificate is valid.

For fixed k this is a finite-universal prefix covered by [TREE_KKT_FINITE_PREFIX_EXTENSION.md](TREE_KKT_FINITE_PREFIX_EXTENSION.md). The adopted permanent border lower bound therefore excludes polynomial completeness for these bounded-depth, bounded-branch-degree incidence certificates.

The quantitative version has the same restriction as that theorem: if its basic resources are polynomial in m, its border upper bound is of the form m^(C(k+3)) for an absolute constant C depending only on the transfer. Hence even k=o((log m)^(1/3)) is incompatible with the imported lower bound exp(Omega((log m)^(4/3))). No exclusion of polynomially many layers follows from this estimate.

## 4. Bounded-depth Kummer towers are excluded even at exponential degree

Large degree alone need not obstruct the finite enumeration. Suppose a coordinate equation has the form

```math
w_j^{2^{r_j}}=A_j(\text{earlier-layer coordinates}),     \tag{8}
```

where r_j and all circuit resources are polynomially bounded, and the sum of the r_j values is polynomial. Repeated squaring evaluates (8) using r_j multiplications.

Include a primitive 2^(r_j)-th root eta_j among the shared parameters, checked as for zeta. At the layer, existentially choose one scalar u_j satisfying

```math
u_j^{2^{r_j}}=A_j.
```

After u_j has been fixed, universally choose r_j Boolean bits defining an integer a_j, and set

```math
w_j=u_j\eta_j^{a_j}.                                  \tag{9}
```

All roots are covered. If A_j is nonzero, this is the usual complete root-of-unity orbit of any chosen root. If A_j=0, the equation forces u_j=0 and every label gives the single root zero. Thus repeated roots at the collision locus introduce no missing branch and no division by a vanishing quantity. Linear coordinates with r_j=0 may be handled directly.

The root lists of Section 3 are now replaced by one scalar per coordinate, and the challenge length is sum_j r_j. Equations (8)–(9), primitive-root checks, and output evaluations all have polynomial cost. With k dependency layers, the quantifier order is still (7). Therefore bounded-depth Kummer towers are excluded even though their finite free algebras can have exponentially large rank and their fibers can have exponentially many distinct points.

The conclusion uses an explicit short enumeration of the branches after shared roots have been chosen. It does not replace arbitrary high-degree polynomial roots by signs or roots of unity.

## 5. What the reduction does not cover

For a deep triangular system, the root list at a later coordinate depends on all earlier selected roots. Moving those existential choices to the end of the prefix allows them to depend on their own labels and destroys coverage: a final choice could represent the same branch for every label. Moving them all to the beginning requires an exponentially large table of roots for all earlier paths. Equations (7) preserve these dependencies rather than hiding that cost.

A general coupled zero-dimensional system of quadratic equations need not have any triangular monic presentation with polynomial size, bounded degree per step, or bounded dependency depth. An eliminating polynomial can have exponential degree; computing it and enumerating all its roots are additional costs. Such systems are not covered by the finite conversion proved above.

The remaining constructive possibility is a polynomial-size finite incidence family whose branches cannot be enumerated with a bounded-depth finite-choice protocol and whose projected sets are genuinely transported by the skew map. No complete construction of that kind is provided. Nor is there a proved reduction from every such system to the existing small-jet obstruction. The target HN_C separation remains unresolved.
