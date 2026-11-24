# Independent review of the common-scale BSS soft compiler

Written review, 23 November 2026 (America/Chicago). Reviewer: the fresh PH-bridge worker. This is an internal mathematical review, not a formal verification or novelty assessment.

I read the complete combined draft after its common-scale rewrite. The final argument is split into [FULL_DECIDER_SOFT_COMPILER.md](FULL_DECIDER_SOFT_COMPILER.md) and the tests in [SOFT_TRANSITION_ORDER_JUMPS.md](SOFT_TRANSITION_ORDER_JUMPS.md), Sections 4--6.

## Positive theorem

The stated polynomial-size simulation is valid for the stated standard finite-control BSS tape model. In `T` steps, a padded buffer of `n+O_M(T)+O_M(1)` coordinates contains every accessible cell. Computing and masking the finitely many candidate instructions at each step costs `O_M(n+T)` gates per transition. Inactive divisions must be replaced by the total inverse before masking; the draft does this. The active instruction then agrees with the original machine, while every inactive candidate has a finite value. This justifies the exact augmented circuit and its `O_M(T(n+T)+n+1)` size.

For an incoming holomorphic germ `z_epsilon=z_0+O(epsilon)`, the common-scale replacements

```math
\delta_\epsilon(z)=\frac{\epsilon}{z^2+\epsilon},
\qquad
\iota_\epsilon(z)=\frac{z^3}{z^4+\epsilon}
```

preserve the invariant. At `z_0!=0` both denominators are units. At `z_0=0`, their denominators are `epsilon` times units, and the outputs are respectively `1+O(epsilon)` and `O(epsilon^2)`. Ordinary arithmetic preserves holomorphicity and `O(epsilon)` error. Therefore the complete output is the exact Boolean result plus `O_x(epsilon)` at every fixed input. Finitely many nonzero rational gate denominators give one sufficiently small punctured disc for each fixed input.

No hierarchical deformation exponents are needed. The radius is allowed to depend on the input, and the proof correctly makes no joint-neighborhood claim.

## Exact checks of the appended examples

For `D=2^s` and

```math
H_\epsilon=\frac{\epsilon}{(1-b_\epsilon^D)^2+\epsilon},
```

direct subtraction gives

```math
H_\epsilon-\frac{\epsilon}{1+\epsilon}
=\frac{\epsilon(2b_\epsilon^D-b_\epsilon^{2D})}
 {(1+\epsilon)((1-b_\epsilon^D)^2+\epsilon)}.
```

At a false input `b_epsilon=O(epsilon)`, the difference has order at least `D+1`. At a true input `b_epsilon=1+O(epsilon)`, the denominator of `H_epsilon` is `epsilon` times a unit and the output tends to one. The operation uses `s` ordinary squarings and one zero-test replacement. If acceptance is nondense, the generic rational expansion is also `O(epsilon)` before the padding: any nonzero coefficient of order zero or less would persist on a nonempty open set and contradict the fixed-input limits there. Thus the prefix-only limitation is sound. It does not cover an algorithm using the entire circuit.

For the common-scale two-test example at `x=1`, the degree-six denominator in `y` is monic and tends coefficientwise to `y^6`. All its roots approach zero. A common numerator/denominator root for nonzero `epsilon` would have both `y^2=-epsilon` and `y^3=-epsilon`, hence `y=1,epsilon=-1`. Consequently for all sufficiently small nonzero parameters the approaching denominator roots are actual poles, despite the correct fixed-input limit at the false input `(1,0)`.

## Scope

No gap was found in the stated simulation or examples. Their conclusions concern pointwise rational-germ limits and limitations of generic-prefix data. They do not compute a normalized boundary equation, a field-valued trace, or an exponentially indexed coefficient. They do not establish the requested complex BSS separation.

## Additional review: the supplied-denominator criterion

I subsequently read the supplied-denominator criterion, now Section 5 of the compiler note, added after the first review. It is a valid sufficient condition. For a supplied polynomial numerator and denominator `A,B` having the correct pointwise indicator limit on an irreducible `R=0`, their generic orders satisfy `a>b`. The additional local nonvanishing hypothesis on this particular `B` excludes every irreducible factor `Q!=R` of the initial coefficient `B_b`: choose a transverse complex line through a smooth point of `Q` off `R` and off the other factors. The final draft proves root persistence directly from factorization into linear factors. If no root of `q_epsilon` lies within radius `rho`, then its coefficients satisfy `|c_e| <= |c_0| binom(L,e) rho^(-e)`, where `L` is a fixed degree bound. But `c_0` tends to zero while the first nonzero limiting coefficient `c_e` does not. This is a contradiction and uses no charged root enumeration. Correctness forces `R|B_b`, since otherwise a point of `R=0` with `B_b!=0` would have limit zero. Hence `B_b=cR^k`.

The ratio `B(c_0+u(x-c_0),epsilon)/B(c_0,epsilon)` has constant coefficient one in `u`, with no approximation in that assertion. Its degree-`D` truncation tends to the corresponding truncation of `(R(c_0+u(x-c_0))/R(c_0))^k`. Finite formal logarithm, multiplication by `1/k`, and finite exponential therefore recover the normalized jet of `R`. Gatewise truncated arithmetic costs `O(S(D+1)^2)`, and direct finite log/exp costs `O((D+1)^3)`, as stated. The scalar `k` may be used nonuniformly, and the proof does not claim to discover it or compute `B_b` as a separate circuit.

This is a conditional normalization criterion for the supplied denominator. Local boundedness of the rational output alone does not give it, and replacing a supplied fraction by a reduced one is not assumed to preserve circuit size. The current soft compiler does not prove the criterion's hypothesis.

The added fraction-pair clearing at the end of Section 3 is also valid. Each arithmetic gate introduces only a bounded number of shared polynomial gates. At division, the denominator update is `Q_1 P_2`; the actual divisor `P_2/Q_2` is a nonzero fixed-input germ, so `P_2` is a nonzero polynomial in the deformation parameter at that input. Induction gives a supplied pair of linear shared size with a nonzero specialized denominator germ at every input. No reduced-fraction assumption enters.
