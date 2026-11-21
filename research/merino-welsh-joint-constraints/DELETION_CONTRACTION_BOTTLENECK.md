# The remaining deletion–contraction inequality

Research continuation for [Merino–Welsh issue 44](https://github.com/1337isnot1337/solved-conjectures/issues/44), 21 November 2026. This note gives a conditional induction step and identifies its remaining mixed-count requirement. It does not prove the candidate coupling or Merino–Welsh. The formal data below are not claimed to come from graphs.

Use the notation and loop conventions of `PAIR_COUPLING.md`. In particular, `u,v` are distinct marked terminals,

```math
D=A(X)-A(X/(u=v)),\qquad C=C(X),\qquad
t=t(X),\qquad F=tR_X(u,v),
```

and the unproved candidate is

```math
DC\ge 2t^2\,2^{-2F/t}. \tag{C}
```

Every terminal quotient retains all resulting loops when its acyclic-orientation count is evaluated. The ordinary graph is connected, loopless and bridgeless. This note concerns finite graphs and unit-resistance edges.

## 1. Grouping a parallel class

Suppose `G` contains exactly `m` parallel edges between `x,y`, and let `H` be the result of deleting the entire class. Let `K=H/(x=y)`. Assume that `H,K` are connected, loopless and bridgeless, and that identifying `x,y` does not merge the marked terminals `u,v`. Thus `{x,y}!={u,v}`. The terminals may share one endpoint with the class.

Put `s=2^m-1`. The exact grouped recurrences are

```math
D_G=D_H+D_K,\qquad C_G=C_H+sC_K,
\qquad t_G=t_H+mt_K,\qquad F_G=F_H+mF_K. \tag{1}
```

Acyclic orientations force all parallel edges to point in the same direction. Hence `A_G=A_H+A_K`. Applying the same identity after terminal identification and subtracting gives the `D` identity. The excluded terminal-merging case is exactly the case in which that additional quotient would turn the grouped edge itself into a loop. Loops produced for other reasons in a terminal quotient still have to be retained.

For the totally cyclic count, deletion–contraction of one edge gives a contraction term with `m-1` loops. Those loops each contribute a factor two. Iterating gives the geometric sum `1+2+...+2^(m-1)=2^m-1`. A spanning tree or a spanning two-forest uses at most one edge of the parallel class. If it uses one, there are `m` choices and contraction gives the corresponding object in `K`. The two-forest bijection preserves terminal separation precisely because the endpoints of the grouped edge are not the two marked terminals.

These are the usual orientation and tree recurrences underlying the two-terminal formulas in [Noble–Royle](https://arxiv.org/abs/1303.6416), now keeping the marked terminal-separation statistic `F` and comparability statistic `D` explicit.

## 2. A conditional step for every sufficiently large class

Assume (C) holds for `H` and `K`, with the inherited terminal labels. Write `R_H=F_H/t_H`, `R_K=F_K/t_K`. Cauchy–Schwarz gives

```math
\sqrt{D_GC_G}
\ge\sqrt{D_HC_H}+\sqrt{s}\sqrt{D_KC_K}
\ge\sqrt2\left(t_H2^{-R_H}+\sqrt{s}\,t_K2^{-R_K}\right).
```

If `sqrt(s)>=m`, the final expression is at least

```math
\sqrt2\left(t_H2^{-R_H}+m t_K2^{-R_K}\right)
\ge\sqrt2(t_H+mt_K)
  2^{-(F_H+mF_K)/(t_H+mt_K)}.
```

The last step is Jensen's inequality for `2^(-x)`, with positive weights `t_H` and `m t_K`. By (1), squaring proves (C) for `G`.

The coefficient condition is

```math
2^m-1\ge m^2. \tag{2}
```

It holds for `m=1` and every integer `m>=5`. For the latter range, its difference is positive at five, and the successive difference `2^m-2m-1` is positive and increasing from that point. It fails for `m=2,3,4`.

This proves a grouped-edge closure lemma under explicit child hypotheses. It does not provide those hypotheses automatically, and it does not settle the parallel pairs that survive the existing minimum-counterexample reductions for Merino–Welsh.

## 3. The corresponding path-subdivision step

Let a base graph `J` have an edge `e=xy`, and let `G` replace it by a path of `m` edges through new degree-two vertices. Assume the marked terminals lie among the old vertices and are not the pair `{x,y}`. Put `H=J-e`, `K=J/e`, and again require both children to be connected, loopless and bridgeless with distinct marked terminals.

Then

```math
D_G=sD_H+D_K,\qquad C_G=C_H+C_K,
\qquad t_G=m t_H+t_K,\qquad F_G=mF_H+F_K. \tag{3}
```

For the acyclic count, the `2^m-2` non-directed path orientations cannot participate in a directed cycle and each accompanies any acyclic orientation of `H`. The two directed path orientations together contribute `A(J)=A_H+A_K`. This gives `A_G=sA_H+A_K`; subtracting its terminal-quotient version gives the `D` identity. In a totally cyclic orientation, every new degree-two vertex has one incoming and one outgoing edge. Thus the whole path is directed consistently and subdivision does not change `C(J)=C_H+C_K`.

A spanning tree either omits exactly one edge of the replacement path, with `m` choices and a tree of `H`, or contains the entire path and corresponds to a tree of `K`. For terminal-separating spanning two-forests, the same alternatives apply. Omitting two path edges would isolate an internal path component; that component contains neither terminal and cannot be one of the two required terminal components. This proves the last recurrence.

Now Cauchy–Schwarz gives

```math
\sqrt{D_GC_G}
\ge\sqrt{s}\sqrt{D_HC_H}+\sqrt{D_KC_K}.
```

The same comparison (2), followed by Jensen with weights `m t_H,t_K`, proves (C) for `G` from the two child inequalities when `m=1` or `m>=5`.

This statement concerns an actual subdivided path whose internal vertices avoid the terminals. It does not identify every matroid series class with such a path while preserving the marked data. No unrestricted series-class reduction follows from (3).

## 4. The exact mixed term for a parallel pair

For general `m`, (1) gives the identity

```math
D_GC_G
=\left(\sqrt{D_HC_H}+\sqrt{s}\sqrt{D_KC_K}\right)^2
 +\left(\sqrt{sD_HC_K}-\sqrt{D_KC_H}\right)^2. \tag{4}
```

The second square measures the difference between the two relevant ratios of orientation counts. Let

```math
R_G=\frac{F_H+mF_K}{t_H+mt_K},
\qquad
J=\left(\sqrt{sD_HC_K}-\sqrt{D_KC_H}\right)^2.
```

The precise missing condition at this induction step is

```math
J\ge
\left[
 2(t_H+mt_K)^2 2^{-2R_G}
 -\left(\sqrt{D_HC_H}+\sqrt{s}\sqrt{D_KC_K}\right)^2
\right]_+, \tag{5}
```

where `[z]_+=max(z,0)`. Formula (5) is equivalent to the desired parent inequality after using the exact identity (4); it is not asserted to be an easier or already known theorem.

If one uses only the two child lower bounds and discards their positive slack, a sufficient, stronger condition is

```math
J\ge 2\left[
(t_H+mt_K)^2 2^{-2R_G}
-\left(t_H2^{-R_H}+\sqrt{s}\,t_K2^{-R_K}\right)^2
\right]_+. \tag{6}
```

For the relevant parallel-pair case, `m=2,s=3`. The two same-terminal child estimates produce the coefficient `sqrt(3)` in place of the required coefficient two. A proof must recover the difference from the square `J`, from strictness in a child inequality, or from additional graph identities. The corresponding subdivision identity has mixed square `(sqrt(sD_HC_K)-sqrt(D_KC_H))^2` as well, with the coefficient `sqrt(s)` attached to the first child's product instead of the second.

## 5. Why the child inequalities do not alone force the mixed term

Here is an exact formal family. Let `T` be a positive multiple of 48 and prescribe

```math
\begin{array}{c|ccccc}
 & A&D&C&t&F\\ \hline
H & 3T/2&T/2&T&T&T\\
K & 3T/4&3T/8&4T/3&T&T.
\end{array} \tag{7}
```

All displayed counts are nonnegative integers, with the orientation counts even. The two marked-terminal couplings are equalities:

```math
\frac{D_HC_H}{t_H^2}
=\frac{D_KC_K}{t_K^2}
=\frac12=2^{1-2R_H}=2^{1-2R_K}.
```

Both ordinary Merino–Welsh child inequalities hold: their `AC/t^2` values are `3/2` and one. The elementary contraction monotonicities `A_K<A_H` and `C_K>C_H` also hold. The latter are natural here because the acyclic quotient corresponds to incomparable `x,y` orientations, while every totally cyclic orientation remains totally cyclic after identification. The resistances of the marked terminal pair agree, consistent with a zero transfer voltage for the identified pair.

The parallel-pair recurrences would nevertheless produce

```math
D_G=7T/8,\qquad C_G=5T,\qquad t_G=3T,
\qquad F_G=3T,
```

and hence

```math
\frac{D_GC_G}{t_G^2}=\frac{35}{72}\lt\frac12
=2^{1-2R_G}.
```

Even the auxiliary child coupling for the edge-endpoint pair would not immediately exclude these numbers: its resistance is `t_K/t_H=1`, and its formal comparability count in `H` is `A_H-A_K=3T/4`, giving ratio `3/4>=1/2`. This does not assert consistency for every other terminal pair, much less graph realizability.

The family only shows that the two same-terminal child inequalities, their ordinary Merino–Welsh inequalities, and these elementary monotonicities cannot imply (5) by scalar algebra alone. No graph with data (7) has been constructed. Additional restrictions from a common parent graph can exclude such formal data. In particular, contraction can create new `u,v` reachability through the newly identified vertex, so comparing `D_H` with `D_K` involves joint reachability information for `u,v,x,y`; it is not a simple inclusion of the two comparability events.

## 6. Remaining task

The known safe deletion–contraction step and the grouped formulas above make the induction concrete. Its unresolved part includes short parallel classes and short subdivisions, together with cases where a deletion produces bridges, a contraction produces loops, or the marked terminals merge. Existing Merino–Welsh reductions still leave parallel and series pairs, so the proved large-class step does not remove the main bottleneck.

A credible next theorem would bound the mixed term (5) using actual joint orientation information in the parent graph, with enough strength to cover the two-edge case. Alternatively, a graph realizing a violation of the full candidate would close this proposed route. Merely extending the finite graph screen or adding more independently constrained scalar child values does not supply that information. No full resolution or additional resolution count follows from this note.
