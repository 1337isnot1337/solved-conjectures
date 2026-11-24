# Independent review of the full-decider soft compiler

Reviewed 23 November 2026 (America/Chicago), against the full draft, now split into [FULL_DECIDER_SOFT_COMPILER.md](FULL_DECIDER_SOFT_COMPILER.md) and [SOFT_TRANSITION_ORDER_JUMPS.md](SOFT_TRANSITION_ORDER_JUMPS.md), Sections 4--6. This is a mathematical review by a separate model worker, not human refereeing or Lean verification.

## The positive simulation theorem

The compiler theorem is sound for the specified fixed-program BSS tape model. Unrolling the finite control with one-hot indicators incurs `O_M(T(n+T)+n+1)` arithmetic gates: only `n+O_M(T)+O_M(1)` tape locations can matter in `T` unit shifts, and the fixed instruction list has constant length. Totalized inverse gates make every inactive candidate computation finite. On the active instruction they agree with ordinary inversion because the machine is assumed total with defined executed divisions. The exact simulation therefore preserves the output bit.

The final shared-scale replacements are

```math
\delta_\epsilon(z)=\frac{\epsilon}{z^2+\epsilon},
\qquad
\iota_\epsilon(z)=\frac{z^3}{z^4+\epsilon}.
```

They preserve the invariant that each fixed-input value is a holomorphic germ equal to its exact value modulo `epsilon`. For a nonzero exact input, both denominators have nonzero constant term. For a zero exact input, the incoming series has order at least one; hence both denominators have leading term `epsilon` with coefficient one. The zero-test output is `1+O(epsilon)`, and the totalized inverse is `O(epsilon^2)`. Ordinary arithmetic preserves the invariant. Each replacement has constant charged size and uses only zero, one, the original machine constants, and the one common deformation parameter. No hierarchy of exponents, new size-dependent constants, or uncharged exponentiation is needed.

A nonzero rational germ has only finitely many zeros and poles away from zero near the origin. Taking the minimum radius over the finite list of gate denominators proves the actual punctured-disc statement for every fixed input. The radius is allowed to depend on that input; joint holomorphicity is neither assumed nor obtained.

## Exact normalization tests

The arbitrary-scale unsquared example in the test note, Section 4 has false-input order exactly `b` both for `y!=0` and for `y=0`, while its generic leading coefficient is `1/(xy)`. The true divisor `x=0` and false divisor `y=0` therefore both have signed pole order minus one. Direct subtraction gives the displayed numerator `epsilon^(a+b)x(y-1)` over the two denominators. Padding the comparison circuit to the same size removes circuit length as an irrelevant extra label in the prefix-only claim.

The common-scale construction in the test note, Section 5 is valid by appending the Boolean-preserving gates to the total straight-line simulation of Section 2 of [FULL_DECIDER_SOFT_COMPILER.md](FULL_DECIDER_SOFT_COMPILER.md) before making the replacements. This circuit-level concatenation, rather than a claim about every possible wholesale finite-control unrolling, gives exactly the displayed formula. Its difference from `epsilon/(1+epsilon)` has numerator `epsilon(2b_epsilon^D-b_epsilon^(2D))`. On false inputs `b_epsilon=O(epsilon)`, so the difference has order at least `D+1`; on true inputs `b_epsilon=1+O(epsilon)`, so the final output still tends to one. For a nondense accepted set the generic order statement follows from the fixed-input limits on an ambient open set. The power `D=2^s` uses `s` squarings. Thus two different nondense supports can have identical generic prefixes of exponential length in the added circuit size. This rules out the stated prefix-only recovery rule, not analysis of the complete circuit.

For the test note, Section 6 at `x=1`, the denominator is monic of degree six in `y` and tends coefficientwise to `y^6`. Its roots tend to zero. A common root with the numerator for nonzero `epsilon` would satisfy `y^2=y^3=-epsilon`, forcing `y=1,epsilon=-1`. Thus small nonzero deformation parameters give actual poles tending to the false input `(1,0)`. Correctness at every fixed input and holomorphic specialized germs therefore do not imply local joint boundedness off the accepted set.

## Scope

Pointwise convergence to the discontinuous acceptance indicator is not coefficientwise border computation of a polynomial. The compiler gives no reduced denominator, normalized boundary equation, algebraic certificate for all branches, or fixed-level complex polynomial-hierarchy definition of the permanent graph. Those implications remain unproved. The proof and examples support the stated positive simulation and the precise limitations above, without a claim of a complex BSS separation.

## Supplied-denominator sufficient condition

The compiler note, Section 5 is also sound with the explicit convention that the supplied numerator and denominator circuits are division-free. Generic false-input correctness forces the first deformation orders to satisfy `a>b`. If an irreducible factor of the first denominator coefficient differs from the boundary polynomial `R`, take a smooth point on that factor outside all other factors and outside `R`, then a transverse line. The elementary coefficient bound from the final text proves root persistence without a contour theorem: a degree-at-most-`L` polynomial with no root in `|t|<rho` has `|c_e|<=|c_0| binom(L,e) rho^(-e)`. In the stated degeneration its constant coefficient tends to zero but its coefficient of `t^e` tends to a nonzero value, a contradiction. This contradicts its stated local nonvanishing. Conversely, if the first denominator coefficient is nonzero at a true input, the order inequality makes the specialized limit zero there. Thus that coefficient is precisely a nonzero scalar times `R^k` for some positive integer `k`.

The finite-jet extraction does not secretly compute this initial coefficient. At a center where `R` is nonzero, the ratio of the original supplied denominator evaluated at `c_0+u(x-c_0)` and at `c_0` cancels its common deformation power and has constant `u` coefficient one. Finite logarithm, scaling by `1/k`, and finite exponential commute with the coefficientwise deformation limit in the truncated `u` ring. Each retained `u^j` coefficient has input-variable degree at most `j`, so setting `u=1` gives an actual degree-bounded polynomial circuit family. Gatewise truncation and the finite log/exp cost justify the stated polynomial border-size bound. The integer `k` is legitimately allowed as a nonuniform scalar constant; discovering it uniformly is not claimed.

The condition is on the particular supplied denominator, not only on poles of the reduced rational output. The distinction is essential because canceling arbitrary common factors at polynomial circuit cost has not been proved. This conditional extraction therefore identifies a sufficient missing normalization and does not assert that the soft compiler supplies it.

The final denominator-clearing paragraph in Section 3 has also been checked. Maintaining numerator-denominator pairs with shared subcircuits costs constant overhead per rational gate. At every fixed input the new denominator remains a nonzero polynomial in the deformation variable; in a division gate this uses the already-proved nonzero divisor germ. It supplies an unreduced pair of linear shared circuit size, not a reduced representation or the local nonvanishing property of the compiler note, Section 5.
