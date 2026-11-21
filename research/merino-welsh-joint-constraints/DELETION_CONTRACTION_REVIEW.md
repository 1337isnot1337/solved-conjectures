# Independent review of the deletion–contraction bottleneck

Reviewed 21 November 2026 against `DELETION_CONTRACTION_BOTTLENECK.md`. The displayed reductions and formal obstruction pass this review under the stated safe-child hypotheses. They do not prove the proposed coupling or exhibit a graph counterexample.

For a full parallel class of size `m`, acyclic orientations have only one common direction, totally cyclic deletion–contraction contributes the loop-weight sum `2^m-1`, and trees or separating two-forests choose at most one class edge. Contracting that chosen edge preserves terminal separation because the marked terminals remain distinct. These give all four recurrences in (1). Retaining loops in the additional terminal quotient is necessary for the `D` identity.

The Cauchy–Schwarz and exponential Jensen step uses weights `t_H` and `m t_K`. It closes precisely when the supplied coefficient `sqrt(2^m-1)` is at least `m`. The stated integer range `m=1` or `m>=5` is correct. The same reasoning with the two child roles exchanged proves the actual path-subdivision statement. Its two-forest argument needs the hypothesis that no internal path vertex is a terminal: omitting two path edges creates an internal component containing neither terminal, which is incompatible with a terminal-separating forest having exactly two components. The note correctly does not extend this argument to arbitrary abstract series classes.

Expansion verifies the exact mixed-square identity (4). Since that square is nonnegative, (5) is equivalent to the parent coupling; substituting only the child lower bounds gives the sufficient condition (6), rather than an equivalent reformulation. The subdivision mixed square is also as displayed.

For the formal family (7), I independently obtained

```math
R_H=R_K=1,\qquad
D_HC_H/t_H^2=D_KC_K/t_K^2=1/2,
```

```math
A_HC_H/t_H^2=3/2,\qquad A_KC_K/t_K^2=1.
```

Both contraction monotonicities hold. The formal edge-endpoint comparability ratio is `(A_H-A_K)C_H/t_H^2=3/4` at resistance `t_K/t_H=1`, which exceeds its required bound `1/2`. The parallel-pair parent has `D_G=7T/8`, `C_G=5T`, and `t_G=F_G=3T`, hence

```math
D_GC_G/t_G^2=35/72<1/2.
```

Taking `T` a positive multiple of 48 makes the displayed counts integral with the specified even orientation counts. These arithmetic checks establish only failure of implication from the listed scalar hypotheses. They do not establish simultaneous realizability of the orientation, tree, forest, or four-terminal data by any graph. The note states that limit explicitly.

No mathematical correction was identified. No additional finite graph search or formal verification was used.
