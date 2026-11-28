# A failed compatibility invariant for Alexandersson's natural-descent conjecture

Date: 20 November 2026. This is **not a proof or disproof** of [Alexandersson's conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/116). It is an exact obstruction to a natural stronger statement used as a possible induction hypothesis.

## Result

For a partition $`\lambda`$, let $`Q_{\lambda,r}(t)`$ enumerate the natural descents of standard Young tableaux of shape $`\lambda`$ whose *largest entry* lies in row $`r`$, indexed from zero at the top. The full natural-descent polynomial is $`N_\lambda(t)=\sum_r Q_{\lambda,r}(t)`$.

A family of real-rooted polynomials $`Q_{\lambda,r}`$ would be *compatible* if every nonnegative linear combination were real-rooted. A common way to prove the full conjecture would be to show that the corner-row refinements are pairwise compatible, then induct via the corner-deletion recurrence. **This proposed stronger invariant is false already for $`\lambda=(4,3,1)`$.**

Direct enumeration of all $`70`$ standard Young tableaux gives

```math
Q_{(4,3,1),0}(t)=t+8t^2+10t^3+2t^4,\qquad
Q_{(4,3,1),2}(t)=1+6t+6t^2+t^3.
```

Both are actual nonzero refinements: rows $`0`$ and $`2`$ end in removable corners.

Their *positive* combination is

```math
2Q_{(4,3,1),0}(t)+Q_{(4,3,1),2}(t)
=4t^4+21t^3+22t^2+8t+1.
```

A direct exact calculation yields

```math
\mathop{\mathrm{disc}}_t(4t^4+21t^3+22t^2+8t+1)=-6571<0.
```

The nonzero negative discriminant of a real quartic implies exactly two real and two nonreal conjugate roots. Hence the two row-refined polynomials are **not compatible** and cannot form a uniformly interlacing family. Any induction using such compatibility for *every partition* needs a different invariant.

For comparison, the third nonzero refinement is

```math
Q_{(4,3,1),1}(t)=7t+20t^2+8t^3,
```

and the full target polynomial is

```math
N_{(4,3,1)}(t)=1+14t+34t^2+19t^3+2t^4,
```

which is real-rooted. Thus the obstruction does not itself refute Alexandersson's original conjecture.

## Exact recurrence and independent enumeration

The recurrence used to obtain each row polynomial is

```math
Q_{\lambda,r}(t)=\sum_j t^{[j>r]}Q_{\lambda-e_r,j}(t),
```

where $`r`$ must be a removable corner and $`j`$ ranges over rows of the predecessor shape carrying its previous largest entry. The empty shape supplies the initial value. The exponent is one precisely when the next entry is placed in a strictly higher row.

The displayed polynomials were checked a second way by **explicitly enumerating all 70 sequences of row insertions** that grow the Ferrers diagram while remaining a partition and tallying the descent count and final row. This check does not use the polynomial recurrence. The discriminant is exact integer arithmetic and does not rely on a floating root plot.

## Bounded counterexample screening (not a solution)

A separate exhaustive shape traversal generated all **177,969 partitions** of sizes $`1`$ through $`39`$, computed the exact descent polynomial coefficients via the recurrence and numerically screened their roots. No nonreal-root candidate was confirmed before the size-40 stage of the run was stopped by an execution limit. Because that search used floating root screening, it **does not certify exact real-rootedness** for those shapes; it can only suggest candidates for an exact Sturm check. The original universal conjecture remains open in this work.

These finite checks are diagnostic evidence, not a claimed solution and not an extension to an “$`n`$-th case” target. The single symbolic quartic obstruction is the mathematically complete finding here.
