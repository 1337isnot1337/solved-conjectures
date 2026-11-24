# Review of the auxiliary finite-fiber verifier

Reviewed file: [AUXILIARY_FINITE_FIBER_ATTEMPT.md](AUXILIARY_FINITE_FIBER_ATTEMPT.md).

Status: the exact verifier, bounded-depth conversion, and Kummer variant pass this independent written audit. Polynomial completeness of the proposed incidence family remains unproved. The review does not extend the finite-prefix theorem to arbitrary continuous universal quantifiers.

## 1. Finiteness survives specialization

A monic equation of positive degree in its newest variable gives a free module over the preceding quotient ring, with the usual powers of that variable as a basis. Iterating this observation proves the stated rank product for the full triangular algebra over the parameter ring. After any complex specialization, each successive monic polynomial has a root, and only finitely many roots. Thus the witness fiber and its polynomial output image are nonempty finite sets.

This argument covers repeated roots and nonreduced fibers. It does not require a discriminant to be nonzero. The explicit warning about exponentially many coefficients in a displayed monic polynomial is necessary: finite freeness is a geometric property, not a free circuit operation.

## 2. Continuous quantifier order and soundness

The prefix
```math
\exists(\zeta,\rho,c)\ \forall(t,w)\ \exists w'
```
with the stated guards expresses exactly the setwise inclusion $`S_t+h(t)\subseteq S_{\zeta t}`$. Each source output has a witness $`w`$, and the final witness may depend on that source witness. No shared selection function is assumed.

Iteration yields $`S_t+\delta\subseteq S_t`$, where $`\delta=\mathop{\mathrm{per}}(X)-y`$. Translation is injective, so an inclusion of a finite set in a translate of itself has equal cardinalities and is equality. Repeated translation is impossible for a nonempty finite subset of $`\mathbb C`$ unless $`\delta=0`$. This proves soundness on arbitrary complex matrices, including cancellation.

The displayed interpolating cyclic primitive proves only the stated exponential-size completeness. No polynomial-size incidence-and-output family is constructed.

## 3. Bounded degree and bounded dependency depth

For a layer equation of degree $`d_j`$, a list of $`d_j`$ roots with multiplicity determines its full monic factorization. The identity can be checked at $`d_j+1`$ distinct scalars because both sides have degree at most $`d_j`$. Repeated list entries correctly cover collisions.

The list is chosen before that layer's universal labels and after every earlier layer's labels. This order is required. Inductively, every genuine full solution appears along at least one universal label path. Therefore the finite prefix is sound, and actual complete root lists prove the converse. An invalid-label guard must not replace the checks on valid extensions; the draft states this qualification.

Along a path there are at most $`\sum_j d_j\le qd`$ root coordinates and $`q`$ final target coordinates. Re-evaluating the equation circuits at the sample points costs $`O(dL)`$; forming their numerical products costs $`O(\sum_j d_j^2)\le O(qd^2)`$. Entry selection and the final output checks add polynomial cost. These counts do not hide a full root tree inside a single witness tuple.

There are $`k+1`$ finite universal stages if the initial orbit-index stage is counted. The cited finite-prefix theorem thus has an exponent of the stated order $`C(k+3)`$. With all basic resources polynomial in $`m`$, its bound is incompatible with the adopted permanent lower bound for $`k=o((\log m)^{1/3})`$. This does not exclude polynomially many layers.

## 4. Kummer equations

For $`w_j^{2^{r_j}}=A_j`$, first choose one root $`u_j`$, then universally choose the root-of-unity label. If $`A_j\ne0`$, multiplication of $`u_j`$ by all powers of a primitive root enumerates every root. If $`A_j=0`$, $`u_j=0`$ is forced and all labels map to the unique root. Both cases are sound without a division by $`A_j`$ or by $`u_j`$.

Repeated squaring and binary labels use polynomial resources under the stated bound on $`\sum_j r_j`$. The primitive roots are shared existential parameters with explicit tests. Linear coordinates with $`r_j=0`$ are handled separately. The same dependency order and finite-prefix obstruction therefore apply even when the finite free rank is exponential.

## 5. Limits

The argument does not triangularize a general coupled zero-dimensional system, compute its eliminating polynomial, or construct short complete root lists for arbitrary exponentially high-degree equations. Deep root dependencies cannot be moved across their universal labels without changing the quantifiers or introducing a large root table. The exact missing construction is a complete polynomial-size finite incidence family outside the proved bounded-depth enumeration cases.
