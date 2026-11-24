# An obstruction to a common interlacer for Jacobi–Stirling descent polynomials

**Scope: barrier to a stronger approach, not a resolution of the Gessel–Lin–Zeng conjecture.** The [original conjecture](https://arxiv.org/abs/1201.0622), Conjecture 15, asks only that the equal-weight sum over all deletion sets of a given size be real-rooted. [Ma–Wang, Theorem 2 and Corollary 2](https://arxiv.org/html/2610.03111v1#S4) prove a stronger statement, real-rootedness for every nonzero nonnegative combination over that level, for five boundary families. That stronger statement does not extend to all levels. This note identifies the rootwise extreme deletion schedules and gives an exact counterexample to the extension.

Let `A_(k,S)(x)` count the Jacobi–Stirling permutations with the barred letters indexed by `S⊆[k]` deleted, weighted by descents. We use the convention of Ma–Wang, removing the initial factor `x` in the original Gessel–Lin–Zeng Ehrhart numerator convention. Ma–Wang's equations (8)–(10) show that inserting the next barred maximum, or inserting the next unbarred maximum pair together, acts by
```
T_L f(x)=(1+Lx)f(x)+x(1−x)f'(x),
```
where `L` is the word length before insertion. Inserting a barred letter increments `L` by 1; inserting a pair increments it by 2. Starting with the empty word and polynomial 1, process the symbols in increasing order, inserting an undeleted barred letter and then that symbol's pair. This recurrence produces `A_(k,S)`. The first insertion gives `T_0(1)=1`; every later one has `L>deg f`, increments degree by 1 and adds simple negative roots interlacing the old ones, by [Ma–Wang, Lemma 2](https://arxiv.org/html/2610.03111v1#S4).

## Rootwise extremal schedules

For fixed `k` and `i=|S|`, deleting the first `i` bars maximizes every sorted root of `A_(k,S)`, while deleting the last `i` minimizes every sorted root. To prove this, suppose `f` has simple negative roots `r_1<...<r_d` and `L>d`. At a root of `T_L f`, the equation is
```
1/x + L + (1−x) Σ_j 1/(x−r_j) = 0.
```
The derivative of the left side with respect to `x` is
```
−1/x² − Σ_j (1−r_j)/(x−r_j)² < 0.
```
The derivative with respect to `L` is 1, and with respect to any `r_j` it is `(1−x)/(x−r_j)²>0`. The roots of `T_L f` are therefore strictly increasing in `L` and in each input root, by implicit differentiation, including the case of degree 0 with no input roots. This implies coordinatewise monotonicity when comparing two ordered input root vectors and two parameters: interpolate linearly and use the interlacing intervals, which persist for every intermediate ordered input and every `L>d`.

The `j`th retained barred letter, from symbol `s_j`, is inserted at event number `s_j+j−1`, since `s_j−1` pairs and `j−1` bars precede it. The retained indices `s_j` are coordinatewise largest if the first `i` bars are deleted, smallest if the last `i` are deleted. Thus the number `b_r` of bars inserted after the first `r` events is smallest for earliest deletions and largest for latest deletions, at every `r`. The word length after those events is `2r−b_r`, so the corresponding parameters `L` satisfy the same pointwise extremes in reverse order. The operator monotonicity inductively proves the asserted rootwise extremes.

## Exact failure of a common interlacer

Set `k=14`, `S={1,…,8}`, `U={7,…,14}`, and `R=A_(14,S)+150 A_(14,U)`. Exact iteration of the preceding insertion operator and evaluation at the integer point `−5` give
```
R(−5)   = −23905785654288389623695626304
R'(−5)  =  60727894241595633504811120896
R''(−5) = −171391484722356580954477028832
R'(−5)^2 − R(−5) R''(−5)
         = −409370957724475548783255073854126061762898141879377754112 < 0.
```
The [standard-library checker](check.py) computes this in integer arithmetic. For a real-rooted polynomial `R` away from its roots, logarithmic differentiation gives `(R')²−RR''=R²Σ_{r:R(r)=0}(x−r)^(−2)≥0` at every real `x`. The certificate proves that this positive combination of the two extremes is not real-rooted. In particular, no common interlacer exists for all fixed-deletion polynomials at `(k,i)=(14,8)`, since any family of real-rooted equal-degree polynomials with positive leading coefficient and a common interlacer has all nonnegative linear combinations real-rooted.

The equal-weight sum in Conjecture 15 is not the polynomial `R`. This only excludes extending the strongest Ma–Wang approach unchanged to all deletion levels, and leaves the original conjecture open.
