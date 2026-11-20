# Ferroni–Morales–Panova conjecture: linear-coefficient monotonicity obstruction

**Status:** rigorous counterexample to an auxiliary *monotonicity strategy*, **not** to Ferroni–Morales–Panova's Conjecture 7.1. Both posets below satisfy its predicted coefficient positivity. This is part of the ongoing work in [issue #105](https://github.com/1337isnot1337/solved-conjectures/issues/105).

## Statement

Let c₁(P)=[t]Ω(P;t). It is tempting to try to establish c₁(P)≥0 for every width-two P by starting with two disjoint chains, for which c₁=0, and proving that c₁ cannot decrease as cross-chain comparabilities are added.

**Proposition.** This monotonicity assertion is false **even for connected width-two posets and the addition of one cross-chain relation**.

## Exact counterexample and proof

Let P have five elements and defining relations

- a₁<a₂;
- b₁<b₂<b₃;
- b₂<a₂;

and no other cross-chain comparabilities. Let Q be obtained from P by additionally imposing b₃<a₂. These posets both have width exactly two (a₁ and b₃ are incomparable in both), and both are connected. The relation b₃<a₂ is consistent with P and is the only new order relation not already implied by transitivity.

We claim the exact order polynomials are

\[
\boxed{\Omega(P;t)=\frac{t(t+1)(t+2)(7t^2+9t+4)}{120}},\tag{1}
\]

\[
\boxed{\Omega(Q;t)=\frac{t(t+1)(t+2)(t+3)(4t+1)}{120}}.\tag{2}
\]

**Direct counting proof.** For P, fix the value u=f(a₂). There are u choices for f(a₁). Fix v=f(b₂)≤u; there are v choices for f(b₁), and t-v+1 choices for f(b₃). Therefore, for each positive integer t,

\[
\Omega(P;t)=\sum_{u=1}^{t}u\sum_{v=1}^{u}v(t-v+1)
=\frac16\sum_{u=1}^{t}u^2(u+1)(3t+2-2u).\tag{3}
\]

For Q, fixing u=f(a₂) gives u choices for f(a₁) and \(\binom{u+2}{3}\) choices for a weakly increasing triple f(b₁)≤f(b₂)≤f(b₃)≤u. Thus

\[
\Omega(Q;t)=\sum_{u=1}^{t}u\binom{u+2}{3}.\tag{4}
\]

Power-sum identities give (1) and (2). Independently, (3) and (4) yield the evaluations at t=0,1,2,3,4,5:

\[
(\Omega(P;t))=(0,1,10,47,152,392),\qquad
(\Omega(Q;t))=(0,1,9,39,119,294).
\]

Both order polynomials have degree at most five; the degree-five expressions (1) and (2) agree at six distinct integers, proving the identities by polynomial uniqueness.

Their linear coefficients are respectively

\[
c_1(P)=\frac{2\cdot4}{120}=\frac1{15},\qquad
c_1(Q)=\frac{2\cdot3\cdot1}{120}=\frac1{20}.
\]

Therefore \(P\subset Q\) as order relations but \(c_1(Q)<c_1(P)\). The reverse monotonicity assertion is also false: the two-element antichain has c₁=0, while the two-element chain has c₁=1/2. Consequently c₁ has **no universal monotonicity direction** under adding comparabilities, even within width at most two. QED.

## Scope and next step

This eliminates the strategy of transferring the c₁≥0 inequality solely by monotonicity along the process of adding cross-chain order relations. It does **not** imply that the c₁≥0 conjecture is false: all coefficients in (1) and (2) are nonnegative. It is a structural obstruction and should not appear in the repository's catalogue of solved named conjectures.

Reproduce through independent exact ideal-grid recurrences and direct combinatorial sums:

    python3 research/ferroni-morales-panova-width-two/verify_monotonicity.py

The stronger still-open objective is to establish the endpoint matrix-logarithm sign for **all** grid ideal-regions, as in [PROGRESS.md](PROGRESS.md). An approach using a local relation-addition recursion needs extra correction terms capable of absorbing both upward and downward changes of c₁. No literature-priority claim is made for this elementary counterexample.
