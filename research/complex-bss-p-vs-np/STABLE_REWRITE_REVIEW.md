# Independent review of stable rewrites and row normalization

Research review, 23 November 2026 (America/Chicago). Reviewed the complete current
[`STABLE_REWRITE_FRONTIER.md`](STABLE_REWRITE_FRONTIER.md).
No remaining defect found after the admissible-open hypothesis in Section
2 was repaired. This is written internal review, not formal verification
or a claim that all stable-rewrite approaches fail.

## Padding and a globally correct wrapper

The equations `g_i=f_i+z h_i` and `g_(N+1)=z` have precisely the stated
zero set for every parameter value. The added variable is forced to zero,
and all remaining equations reduce to the original system. The
construction and its stated syntactic decoder have polynomial size. The
wrapper recognizes only this explicitly retained format, decodes it, and
otherwise uses the original decider. Its correctness is global; no
semantic recognition of an arbitrary hidden padding is assumed.

On this family the wrapper can ignore every padding parameter. Therefore
the same generic branch equation and its same cofactor can survive these
rewrites. This refutes an inference from answer invariance to normalized
branch polynomials. It does not exclude a different rewrite that is
actually used to obtain additional information. The retained invertible
row-matrix variant has the same scope, with inversion charged on its
stated nonsingular open set.

## The domain repair

The original Section 2 assumed only a nonempty admissible open set. That
was insufficient: `D(R)` is nonempty and misses the target hypersurface.
An unspecified open could also require a guard of uncontrolled circuit
size, preventing a claimed small saturated presentation.

The repaired version assumes a supplied small guard `H_0` with `R` not
dividing `H_0`, and admissible open `D(H_0)`. The composite first rejects
`H_0=0`. It therefore decides `V(R) intersect D(H_0)` on all parameter
inputs. That set is dense in the irreducible hypersurface, so a generic
accepting path has equality polynomials divisible by `R`. Its guard
product includes `H_0` and is not divisible by `R`. Correctness gives
exactly the stated saturated presentation, with the admissibility cost
charged.

Discarding tests that vanish identically after parameter substitution is
legitimate. At least one other zero test must remain; otherwise the
accepting cell contains an ambient open set and cannot lie in the proper
hypersurface. This proves a nonzero multiple `R^e Q` without imposing any
unstated restriction on `Q`.

## The supplied-certificate normalization

Let `u f=1` and put `P_0=fu`. Then `P_0^2=P_0`. Direct block
multiplication gives

```math
\begin{pmatrix}I-P_0&f\\u&0\end{pmatrix}^{\!2}
=\begin{pmatrix}I&0\\0&1\end{pmatrix},
\qquad
\begin{pmatrix}I-P_0&f\\u&0\end{pmatrix}
\binom f0=\binom01.
```

All entries are polynomial in the unknowns with coefficients in the
specified parameter localization. The matrix is invertible at every
unknown tuple for every permitted parameter value, so its row action
preserves the common zero set. Its entry circuits have the claimed
`O(s_f+s_u+N^2)` bound.

Over the fraction field, `u f=1` decomposes the original vector space as
`ker(u)` plus the line spanned by `f`. The extended matrix acts identically
on the first summand and exchanges `(f,0)` with the added basis vector.
Its determinant is `-1`, and the identity descends to the localization.
No large elimination determinant is evaluated.

## Pole scope

The universal certificate's parameter denominator is a multiple of `R`,
so this matrix is undefined on the accepting hypersurface. Extension
there cannot be inferred from its use on the rejecting open. The example
`f=(1,x)` and `u=(1+x/q,-1/q)` is an exact identity with arbitrary
artificial parameter poles. Its displayed pole divisor is not intrinsic,
even though a pole-free alternative exists in this elementary case.

The constant determinant is consistent with all entry poles canceling; it
supplies no resultant value. A separate extension, gluing, or normalized
divisor extraction theorem is still needed, with its circuit costs
proved. This matches the scope of the conditional case-split lemma in
[`FULL_PARTITION_CERTIFICATE_ATTEMPT.md`](FULL_PARTITION_CERTIFICATE_ATTEMPT.md):
supplied short certificates permit explicit operations, while decision
correctness has not supplied the required certificates.
