# Finite tests for continuous universal blocks with nondense bad fibers

Status: the dimension argument and the explicit affine-witness counterexample were independently checked by the alternate-PH worker. This note gives a valid restricted conversion and an exact failure outside its hypotheses. It does not give a permanent protocol or eliminate arbitrary complex universal quantifiers.

## 1. A finite-sampling lemma

Let S be a constructible subset of C^P times C^r, with r>=1. Write S_a for its fiber over a in C^P. Assume

```math
S_a\ne\mathbb C^r
\quad\Longrightarrow\quad
\dim\overline{S_a}^{\mathrm{Zar}}\le r-1.                \tag{1}
```

Closed fibers satisfy (1). More generally, every fiber must be either the entire challenge space or nondense in it. A dense proper fiber is excluded.

Set ell=P+1. There is a nonempty Zariski-open set of tuples

```math
(\zeta_1,\ldots,\zeta_\ell)\in(\mathbb C^r)^\ell
```

such that, simultaneously for every a,

```math
S_a=\mathbb C^r
\quad\Longleftrightarrow\quad
\zeta_i\in S_a\quad(1\le i\le\ell).                 \tag{2}
```

**Proof.** Let T be the set of a with S_a not equal to C^r. It is the projection of the constructible complement of S, hence is constructible by Chevalley's theorem. Consider the constructible bad-sample incidence

```math
I=\{(a,z_1,\ldots,z_\ell):
a\in T,\ (a,z_i)\in S\text{ for every }i\}.
```

Its fiber over a in T is S_a^ell, which has dimension at most ell(r-1) by (1). The dimension-of-fibers inequality gives

```math
\dim I\le P+\ell(r-1)=\ell r-1.
```

The closure of its projected image in (C^r)^ell is therefore proper. Choose a tuple outside that closure. No bad parameter a passes all its tests, while a full fiber passes every test. This proves (2). The complement of that projected closure is the asserted nonempty open set. QED.

If r=0, the universal challenge space is one point and one test suffices. The proof makes no effectiveness claim about finding the sample tuple. Its ell*r entries are allowed nonuniform complex constants. The bound depends on parameter dimension, not the degrees or number of equations needed to describe S.

All parameters that vary between instances must be included in a. For a block occurring after earlier quantifiers, a includes the input, output, and all preceding existential and universal coordinates. One cannot omit free witness coordinates from P merely because their values will later be selected existentially.

## 2. Pure polynomial identities

Suppose S_a is defined by finitely many polynomial equalities E_j(a,z)=0. It is closed, so the lemma applies. If the E_j have small circuits, each sampled residual E_j(a,zeta_i) retains that circuit bound with the entries of zeta_i as constants.

This is a direct finite test of universal polynomial identity over a bounded-dimensional parameter family. It does not require listing the coefficients of E_j or bounding their degree. An exponentially long list of separate E_j is still an exponentially long list; the lemma only reduces the continuous challenge block. The finite-residual KKT argument can be used separately when appropriate.

## 3. A projective existential witness after the challenge

Let a have P coordinates, z have r coordinates, and [w] lie in projective q-space. Suppose

```math
S=\{(a,z):\exists[w]\in\mathbb P^q(\mathbb C)\quad
E_1(a,z,w)=\cdots=E_e(a,z,w)=0\},                  \tag{3}
```

where each E_j is homogeneous in w. The equations define a closed subset of (C^P times C^r) times P^q. Its projection is projective and therefore proper, so S is closed. In particular its fibers over a satisfy (1).

Choose ell=P+1 samples from Section 1. Then

```math
\forall z\in\mathbb C^r\ \exists[w]\in\mathbb P^q:
E(a,z,w)=0
```

is equivalent, for all a at once, to the conjunction of ell separate existential tests

```math
\exists[w_i]\in\mathbb P^q:
E(a,\zeta_i,w_i)=0\qquad(1\le i\le\ell).           \tag{4}
```

This conversion has no hidden exponential witness array. To encode each projective point by affine complex variables, introduce w_i and v_i, each with q+1 coordinates, and impose

```math
E(a,\zeta_i,w_i)=0,\qquad
\sum_{j=0}^{q}(v_i)_j(w_i)_j=1.                   \tag{5}
```

The normalization is feasible exactly when w_i is nonzero. Homogeneity makes the original equations well-defined on its projective class.

If E has e outputs with a shared circuit of size L, formula (5) uses 2 ell(q+1) new affine witness coordinates, ell(e+1) equations, and O(ell(L+q+1)) gates. In particular, for a=(x,y,c) with n input coordinates and p shared witnesses, P=n+1+p and ell=n+p+2. A graph presentation

```math
y=f(x)\Longleftrightarrow
\exists c\ \forall z\ \exists[w]\in\mathbb P^q:
E(x,y,c,z,w)=0
```

therefore gives a small nonuniform existential graph incidence when all displayed resources are polynomial. The singular-witness lemma applies to a polynomial-degree graph. Under the imported permanent border lower bound, this restricted projective-witness presentation cannot give the permanent graph.

This statement uses genuinely projective closed witness equations. Adding an open-chart requirement changes that condition, as Section 5 shows.

## 4. Iteration and its exact scope

A continuous universal block can be replaced by its finite tests whenever its full inner truth relation is constructible and satisfies (1) over all its preceding parameters. Other quantifiers inside that relation do not invalidate the dimension proof, but they must actually yield the stated fiber condition. Their presence alone does not establish it.

For a fixed number of such blocks, each with polynomially many preceding coordinates, each sample list has polynomial length. Eliminating from the inside outward preserves semantic equivalence for all preceding parameters. Expanding the resulting finite challenge tree introduces only a product of a fixed number of polynomial factors. Witness and circuit bounds remain polynomial whenever the leaf relation and existential blocks have polynomial resources.

A useful sufficient syntax is a finite positive formula of polynomial equalities with existential blocks ranging over projective spaces. Existential projective projection preserves closedness, and universal quantification preserves closedness because it intersects closed fixed-challenge slices. Thus every successive continuous universal block in that syntax has closed fibers. This is a nonuniform conversion, because the chosen sample constants need not be uniformly computable. General Boolean combinations and affine existential witnesses do not have this closure property.

The recursive tree-KKT note handles arbitrary finite challenge sets without requiring their cardinalities to be polynomial. The present sampling lemma has a different role: under (1), it supplies a polynomial-cardinality replacement for a continuous challenge. Neither argument establishes (1) for an arbitrary PH_C formula.

## 5. An exact graph formula that defeats fixed finite samples

The zero graph already has the following small formula:

```math
y=0
\quad\Longleftrightarrow\quad
\forall z\in\mathbb C\ \exists u\in\mathbb C:
y\big((z-y)u-1\big)=0.                             \tag{6}
```

If y=0, every u works. If y is nonzero, the challenge z=y makes the equation equal to -y=0, which is impossible. Thus (6) is exactly correct.

For a fixed y, the accepted challenge set is

```math
S_y=
\begin{cases}
\mathbb C,&y=0,
\\ \mathbb C\setminus\{y\},&y\ne0.
\end{cases}
```

Every bad fiber is dense and proper. Given any fixed finite set of sample challenges, choose a nonzero y outside it. Every sampled challenge then has the witness u=1/(z-y), so the sampled formula accepts that false output. This remains a counterexample even though the complete quantified relation is an exact, closed polynomial graph.

It also demonstrates the failure of unconstrained witness compactification. Homogenize u as u_1/u_0 and replace the affine witness by [u_0:u_1] in P^1. Equation (6) becomes

```math
y\big((z-y)u_1-u_0\big)=0.                         \tag{7}
```

For every y,z, the projective point [u_0:u_1]=[z-y:1] satisfies (7). At the excluded challenge z=y it is the point at infinity [0:1]. The compactified universal statement is therefore true for every y. Enforcing u_0 nonzero restores the original formula, but reintroduces an open condition and destroys the closed-image hypothesis needed in Section 3.

This counterexample concerns a fixed finite sample tuple independent of the preceding parameter y. A parameter-dependent test can choose z=y in this particular example. No impossibility of every adaptive discretization follows. For a general proposed conversion, however, such a parameter-dependent sampling rule needs its own small equations and proof; it cannot be replaced by a generic fixed tuple.

## 6. Dependencies

The only geometric inputs in Section 1 are Chevalley's constructibility theorem, the dimension-of-fibers inequality, and the fact that projection cannot increase the dimension of a constructible image. Section 3 additionally uses projective implies proper and proper images are closed.

These are the same background facts cited in the repository's existing notes: Stacks Project tag 054K for Chevalley's theorem and tag 01WC for projective implies proper. The circuit encoding, finite-sampling argument, graph formula, and compactification calculation are supplied explicitly here.

This note does not establish the missing permanent graph membership in PH_C or prove HN_C outside P_C.
