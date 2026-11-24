# Why low-dimensional resultant slices cannot be rescued by natural symmetries

Date: 23 November 2026. Scope: a **proved obstruction lemma** relevant to the still-open complex BSS problem in [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248). Not a lower bound for arithmetic circuit complexity and not a resolution of Bürgisser's conjecture.

## 1. Ambient variety and symmetry group

Write \(V_n\) for the affine coefficient space of all \(n+1\) homogeneous quadrics in \(n+1\) variables. Its dimension is

```math
N_n=(n+1)\binom{n+2}{2}=\frac{(n+1)^2(n+2)}2.
```

Let \(R_n\) be the absolutely irreducible multivariate quadratic resultant and \(H_n=V(R_n)\subset V_n\). Thus

```math
\dim H_n=N_n-1.
```

There are two natural algebraic group actions preserving \(H_n\):

- \(B\in\operatorname{GL}_{n+1}(\mathbb C)\) changes the projective variables by \(x\mapsto Bx\), simultaneously in all quadrics.
- \(A\in\operatorname{GL}_{n+1}(\mathbb C)\) mixes the quadrics by \(q_i\mapsto\sum_j A_{ij}q_j\).

Both operations preserve existence of a nonzero common projective zero. Their product acts algebraically on the coefficient space and has dimension

```math
\dim G_n=2(n+1)^2.
```

## 2. Symmetry-orbit masking lemma

**Proposition.** Let \(S\subseteq H_n\) be a constructible family of resultant-zero coefficient tuples, with Zariski-closure dimension at most \(d\). Suppose

```math
d+2(n+1)^2<N_n-1.
```

Let \(Y=\overline{G_n\cdot S}\) be its Zariski-closed symmetry saturation in \(V_n\). Then:

1. \(Y\subsetneq H_n\).
2. There exists a polynomial \(Q_n\in\mathbb C[V_n]\) such that \(Q_n|_Y=0\) but \(R_n\nmid Q_n\).
3. For every integer \(k\ge0\), the nonzero multiple
   \[
   F_{n,k}=R_n Q_n^{k+1}
   \]
   satisfies \(\partial^\alpha F_{n,k}(u)=0\) for every \(u\in Y\) and every multiindex \(\alpha\) with \(|\alpha|\le k\).
4. Consequently, bounded-order jet data of an **arbitrary nonzero multiple** of \(R_n\), sampled only on the symmetry saturation \(Y\), cannot be guaranteed to reveal a nonzero transverse derivative of \(R_n\).

**Proof.** The action map \(G_n\times S\to V_n\), \((g,s)\mapsto g\cdot s\), is algebraic on each constructible stratum. The dimension of its image closure cannot exceed the dimension of the domain:

```math
\dim Y\le \dim G_n+\dim\overline S
\le 2(n+1)^2+d.
```

By hypothesis, \(\dim Y<\dim H_n\). Since \(G_n\) preserves \(H_n\), its saturation \(Y\) is contained in \(H_n\); hence \(Y\subsetneq H_n\).

Because \(Y\) is a proper Zariski-closed subset of the irreducible hypersurface \(H_n\), the vanishing ideals satisfy \(I(H_n)\subsetneq I(Y)\). Here \(I(H_n)=(R_n)\), as \(R_n\) is irreducible in characteristic zero. Pick \(Q_n\in I(Y)\setminus(R_n)\); it is nonzero and not divisible by \(R_n\).

For any \(u\in Y\), \(Q_n(u)=0\). The multivariate product rule applied to \(Q_n^{k+1}\) shows every partial derivative of order at most \(k\) has at least one undifferentiated factor \(Q_n\), hence vanishes at \(u\). The same is true after multiplication by \(R_n\), again by the product rule. As the polynomial ring is a domain, \(R_nQ_n^{k+1}\ne0\). QED.

### Quantitative consequence for slices

For one fixed point \(S=\{u\}\), the dimension hypothesis holds already when \(n\ge3\), because

```math
2(n+1)^2 < \frac{(n+1)^2(n+2)}2-1.
```

More generally, any family with \(d=O(n^2)\) satisfies the hypothesis for sufficiently large \(n\), whereas the coefficient hypersurface has dimension \(\Theta(n^3)\). Thus natural projective-coordinate changes and linear mixing of equations, even taken together, **cannot make a single \(O(n^2)\)-dimensional special slice Zariski dense** in the resultant hypersurface.

## 3. Meaning for the BSS separation strategy

The [resultant-exclusion criterion](RESULTANT_EXCLUSION.md) asks for a lower bound on \(L(F)\) for *every* \(F=R_nQ_n\ne0\). A strategy that studies only low-order derivatives along one special family of resultant-zero inputs and all of its natural symmetry images has a blind spot. Under the dimension hypothesis, an adversarial \(Q_n^{k+1}\) suppresses all its order-\(k\) jets without killing the multiple globally.

This strengthens the existing [finite-jet cofactor-masking objection in issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248): it explains when **the entire natural symmetry orbit of a family** can be masked simultaneously.

**Limits.** This is an information-theoretic/existence obstruction, not a complexity lower bound. The polynomial \(Q_n\) obtained from the ideal \(I(Y)\) is not shown to have a small arithmetic circuit. Thus the proposition does not refute a recovery theorem restricted to *low-complexity* multiples \(F\), nor does it refute algorithms inspecting \(F\)'s circuit structure or sampling points outside \(Y\). It also does not apply if a proposed family is Zariski dense in \(H_n\), or if extra non-symmetry parameters raise its dimension enough.

Any application to a particular BCJS encoding must first prove that the selected special coefficient tuples lie in \(H_n\), compute the dimension of their closure, and verify the exact group of transformations it uses. The current proposition does not assume those facts of a specific encoding.

## 4. Concrete next subproblem

For a candidate permanent-encoding family \(S_n\subset H_n\), determine whether the union of all *allowed* easy deformations (not merely \(G_n\)) is Zariski dense in \(H_n\). If the image has dimension \(<N_n-1\), the obstruction above applies to arbitrary multiples. If it is dense, analyze whether the permanent-encoding initial form remains recoverable at generic points and whether arbitrary cofactors can still be eliminated at polynomial computational cost.

Source for resultant irreducibility, degree, and zero locus: P. Bürgisser, [*Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*](https://arxiv.org/html/2606.25121v2), Section 3. The symmetry actions and dimension argument are written out here; no claim of novelty is made for general orbit-dimension or vanishing-ideal facts.
