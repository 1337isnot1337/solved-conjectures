# Independent review of the triangular recurrence addendum

Date: 20 November 2026, America/Chicago. Reviewer: `minc_regular`.

Reviewed `research/minc/continuation-2026-11-20/sign/triangular_recurrence_invariant_gap.md` and its
checker. The seed obstruction, two-step formula, split quadratic form, and
corner identity are correct. The obstruction concerns the stated fixed
positive border and append operation. It does not rule out changing the
border, choosing a different seed, or taking multiple steps.

## Seed and source verification

The independent checker `triangular_recurrence_review.py` uses Ryser
inclusion-exclusion, rather than the author's subset dynamic program, and
rational Gaussian elimination for the determinant. It verifies

```math
\operatorname{per}A=\det A=256,\qquad
 (P_{\{j\}})_{j=1}^{8}=64(8,22,68,14,0,5,-11,8).
```

The modular argument in the note is valid. Modulo four, a putative target
$`\pm8`$ forces the signs of the coefficients five and minus eleven to
be opposite. Their combined contribution is then $`\pm16`$. Modulo
sixteen, the signs of twenty-two, sixty-eight and fourteen must coincide.
Their combined magnitude is 104, while all remaining contributions have
total magnitude at most 32. Thus the required magnitude eight is impossible.
The independent checker also verifies the complete finite signed-sum set.

The next order really is admissible. Wanless's
[*Permanents of matrices of signed ones*](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf),
printed page 431, lists $`T_{10}\{1,\ldots,5,8,9\}`$ with common absolute
permanent and determinant 512. This exact witness also passes the independent
checker. No new order of Wang's problem is being asserted.

Ingram--Razborov's
[*On the Range of the Permanent of (±1)-Matrices*](https://arxiv.org/html/2507.09433v1),
Section 6, Problem 4, asks whether allowing negative entries only on or above
the diagonal preserves the full permanent range. This confirms the source
boundary in the addendum; it does not supply exact attainment or a universal
triangular induction.

## Two-step identity and exact scope

For first-step signs $`w`$, second-step old-coordinate signs $`u`$, and
second-step entry $`\varepsilon`$ at the first new coordinate, two
applications of the one-step hierarchy give

```math
P''=2\varepsilon P+
 \sum_j(u_j+\varepsilon w_j)P_{\{j\}}+
 \sum_{j<k}(u_jw_k+u_kw_j)P_{\{j,k\}}.
```

The determinant multiplies by four. Splitting indices according to
$`u_j=\varepsilon w_j`$ cancels every mixed pair and gives exactly the
displayed split formula in the addendum. For $`u=-\varepsilon w`$,

```math
P''=2\varepsilon(P-Q),\qquad
 Q=\sum_{j<k}w_jw_kP_{\{j,k\}}.
```

When the seed is nonsingular and satisfies absolute permanent-determinant
equality, the two-step equality condition is exactly $`Q=-P`$ or $`Q=3P`$.
There is no existence argument for those signed quadratic values.

## Full replacement hierarchy for one restricted two-step rule

The following general identity makes explicit what a future invariant would
need to control. Take $`\varepsilon=1`$ and $`u=-w`$, and label the two
new coordinates $`\alpha,\beta`$, in that order. For any old replacement
set $`S`$, put

```math
a=|S|,\qquad
 F_S=\sum_{j\notin S}w_jP_{S\cup\{j\}},\qquad
 Q_S=\sum_{\substack{j<k\\j,k\notin S}}
                  w_jw_kP_{S\cup\{j,k\}}.
```

Then the entire two-step update is

```math
\begin{aligned}
 P''_S&=(a^2+a+2)P_S-2Q_S,\\
 P''_{S\cup\{\alpha\}}&=(a+1)(a+2)P_S-2F_S-2Q_S,\\
 P''_{S\cup\{\beta\}}&=(a+1)(a+2)P_S+2F_S-2Q_S,\\
 P''_{S\cup\{\alpha,\beta\}}&=(a+2)(a+3)P_S-2Q_S.
\end{aligned}
\tag{R}
```

To derive (R), first use
$`P'_S=aP_S+F_S`$ and
$`P'_{S\cup\{\alpha\}}=(a+2)P_S+F_S`$.
The second step has signs minus $`w`$ on old coordinates and plus one
on $`\alpha`$. In its double sum, each old pair occurs twice, producing
$`-2Q_S`$; the single sums cancel in the first and fourth lines and
leave the stated $`\mp2F_S`$ terms in the middle lines. This proves the
formulas for arbitrary order. The independent checker additionally compares
all four lines and all replacement sets against direct permanents for an
exact small input, as a convention check rather than the proof.

The corner identity
$`H_B(-1,\ldots,-1)=(-2)^N`$ follows from the first-row expansion and
$`\operatorname{per}B=1`$ for a lower unitriangular matrix. It holds
without assuming current permanent equality and therefore cannot by itself
maintain that equality at the origin.

## Verification and remaining gap

Both commands passed:

```sh
python research/minc/continuation-2026-11-20/sign/triangular_recurrence_invariant_gap.py
python research/minc/continuation-2026-11-20/reviews/triangular_recurrence_review.py
```

The missing result is a recursively preserved restriction on the full
replacement coefficients that forces the necessary signed sums or quadratic
values and reaches every admissible order. The unextendable seed proves that
current equality and determinant normalization alone are insufficient. The
two-step identities do not supply that invariant. No whole MINC problem is
resolved or counted by this review.
