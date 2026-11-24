# Independent review of the regular-value graph obstruction

Reviewed file: [REGULAR_VALUE_GRAPH_OBSTRUCTION.md](REGULAR_VALUE_GRAPH_OBSTRUCTION.md).

Status: the two obstruction statements and their resource bounds pass this independent written audit. They apply to rational expressions computed from the input, including adaptive Boolean regularity queries. They do not cover independently quantified parameters or an oracle returning arbitrary algebraic witnesses. No HN separation follows from the note.

## 1. Shifted query and validity semantics

For an unshifted numerator $`A(a,t)=P(a,t)-v(a)Q(a,t)`$, a regular-value query is exactly
```math
Q(a,\alpha(a)+u)\not\equiv0,\qquad
\mathop{\mathrm{ord}}_u A(a,\alpha(a)+u)
>
\mathop{\mathrm{ord}}_u Q(a,\alpha(a)+u).
```
If $`A`$ is zero, its order is infinity. The explicit nonzero-denominator guard is necessary. The regularity-only comparison uses the non-strict inequality.

A rational marked center can be substituted by a shared rational circuit. On the generic accepted path, all input-register denominators are nonzero modulo $`H=y-f(x)`$; clearing them therefore cannot hide a generic truth change on $`H`$. If the query itself has internal divisions in the auxiliary variable, its intermediate nonzero-rational-function requirements must also be tested, as the draft states. A failure of such a requirement is another zero-polynomial specialization and is handled by the same leading-coefficient argument.

A minor notation repair was requested: define $`A=P-vQ`$ before shifting, rather than saying it is already substituted and then writing $`A(a,\alpha+u)`$.

## 2. Every generic order change exposes a coefficient

In the localized coefficient ring, specialization to $`H`$ cannot lower the order of a nonzero polynomial in $`u`$. It preserves that order precisely when the first coefficient remains nonzero. If the specialization becomes zero, that first coefficient also vanishes.

The draft lists all zero cases correctly. An ambient zero polynomial remains zero after a defined restriction. An ambient nonzero denominator becoming zero on $`H`$ already gives a leading coefficient divisible by $`H`$. If the numerator $`P-vQ`$ is ambient zero, it cannot cause a new comparison change while the denominator remains valid. Consequently every actual generic change is witnessed by a nonzero ambient first coefficient that vanishes on $`H`$.

Clearing coefficient denominators multiplies by a factor not divisible by $`H`$, so the numerator of that first coefficient is still a nonzero multiple of $`H`$.

## 3. Border extraction and decision trees

For a division-free polynomial circuit $`B=u^k(b_0+u b_1+\cdots)`$, the family $`\epsilon^{-k}B(x,y,\epsilon)`$ converges coefficientwise to $`b_0`$. Its size bound is independent of $`k`$; even separately charging scalar powering costs only $`O(\log(k+1))=O(s)`$.

The use of the graph-factor degeneration lemma is sound. Dividing by $`u^k`$ is only an existence argument. At every fixed nonzero parameter, the hypersurface has the same zero set as the supplied small circuit $`B(\cdot,\epsilon)`$. The first coefficient has $`H`$ as a factor, which is exactly the degeneration hypothesis. No exact small circuit for that coefficient is asserted.

For a finite decision tree, each order predicate is constructible at each fixed size because it is a finite Boolean combination of coefficient conditions. There is therefore a path on a dense constructible subset of a dense sound accepted graph. If none of its tests differs from its ambient generic truth, finitely many nonempty open conditions and division domains give an ambient open set following the same accepting path, contradicting soundness. Ordinary equality changes give an exact small multiple; regularity changes give the border-small initial coefficient above.

This covers adaptive tests and arbitrary allowed complex constants. Charging the supplied query circuits and their construction is essential to the total-resource statement.

## 4. Direct rational limits and the fixed neighborhood

For the direct function statement, write $`Q=t^a(q_0(x)+tq_1(x)+\cdots)`$, $`q_0\ne0`$. If $`P`$ is zero, the conclusion is immediate. Otherwise generic finiteness of the limit forces $`\mathop{\mathrm{ord}}_tP\ge a`$. Choose $`b`$ with $`q_0(b)\ne0`$. After the common scalar power is canceled mathematically, the quotient is holomorphic on a fixed neighborhood of $`(b,0)`$.

For each small nonzero $`\epsilon`$, homogenizing the numerator and denominator to order $`d`$, then inverting the scalar-unit denominator, uses polynomially many circuit gates. The recurrence for the inverse homogeneous parts is correct. It never expands into the full list of multivariate monomials.

Holomorphy on the fixed neighborhood makes the Taylor coefficients converge as $`\epsilon\to0`$. Because the limit polynomial has degree at most $`d`$, its order-$`d`$ Taylor polynomial at $`b`$ is the entire polynomial. Translation back is harmless. The stated $`O((s+n+1)(d+1)^3)`$ bound is a valid coarse estimate.

## 5. Kronecker and principal-part checks

The base-$`m+1`$ encoding has no carries because every column count is at most $`m`$. Therefore the coefficient at $`\kappa=\sum_j(m+1)^{j-1}`$ is exactly the permanent. Successive powering costs $`O(m\log m)`$, and the kernel has total ordinary circuit size $`O(m^2)`$.

For $`m\ge2`$, there are nonzero coefficient polynomials strictly below and strictly above $`\kappa`$, witnessed by selecting respectively the first or last column in every row. Thus the normalized Laurent expression has genuine negative terms generically.

Any charged input-dependent small correction producing a polynomial regular limit equal to the permanent would contradict the direct-limit theorem and the standing lower bound. On the other hand, an unrestricted existential correction is unsound: subtracting the proposed $`y`$ from the whole Laurent expression makes the remainder $`y`$ for every input. Requiring only pole cancellation does not impose the intended negative-power normalization.

## 6. The quantified-witness distinction

The theorem does not apply after replacing rationally computed coefficients by arbitrary existential parameters. A leading coefficient may then vanish on a witness subvariety of $`(x,y,c)`$-space without having $`y-f(x)`$ as an input-space factor. Elimination of $`c`$ is a separate operation.

Likewise, the proof does not make a choice of an algebraic witness root, define a valuation ring, or extract an interior coefficient. The exact APS representation of a regular value is compatible with this obstruction: it supplies a predicate for the limit of a *given* rational expression and does not perform principal-part cancellation or aggregation for free.
