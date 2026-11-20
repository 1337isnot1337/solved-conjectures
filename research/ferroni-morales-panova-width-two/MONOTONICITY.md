# Ferroni–Morales–Panova conjecture: linear-coefficient monotonicity obstruction

**Status:** rigorous counterexample to an auxiliary *monotonicity strategy*, **not** to Ferroni–Morales–Panova's Conjecture 7.1. Every poset exhibited below satisfies its predicted coefficient positivity. This is part of the ongoing work in [issue #105](https://github.com/1337isnot1337/solved-conjectures/issues/105).

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

Therefore \(P\subset Q\) as order relations but \(c_1(Q)<c_1(P)\). The reverse monotonicity assertion is also false: the two-element antichain has c₁=0, while the two-element chain has c₁=1/2. Consequently c₁ is not universally nondecreasing when cross-chain relations are added. The reverse failure, still within connected width-two posets, is proved below. QED.

## Opposite direction: an increase within the same connected width-two class

The reverse monotonicity assertion fails without passing through a chain or a disconnected poset.

Define R by the chains \(a_1<a_2\), \(b_1<b_2<b_3\), plus cross relations \(a_1<b_1\) and \(a_2<b_3\), with their transitive consequences. Define S by adding **only** \(b_1<a_2\) to R. Both have exactly width two: in S the pair \(a_2,b_2\) remains incomparable. Both have a unique minimal element \(a_1\) and a unique maximal element \(b_3\), and are thus connected.

**Proposition.** For these posets,

\[
\boxed{\Omega(R;t)=\frac{t(t+1)(t+2)(t+3)(3t+2)}{120}},\tag{5}
\]

\[
\boxed{\Omega(S;t)=\frac{t(t+1)(t+2)(t+3)(2t+3)}{120}}.\tag{6}
\]

Hence \(c_1(R)=1/10\) while \(c_1(S)=3/20\), so \(c_1\) **increases** when one cross-chain relation is added.

**Direct counting proof.** For a weakly order-preserving map \(f\colon R\to[t]\), fix \(x=f(a_1)\) and \(y=f(b_3)\), and put \(r=y-x+1\). In R the middle variables consist of the free element \(a_2\), with \(r\) possible values, and an independent weakly increasing pair \(b_1\le b_2\), with \(\binom{r+1}{2}\) possibilities. For fixed interval length \(r\), there are \(t-r+1\) choices of \(x\). Thus

\[
\Omega(R;t)=\frac12\sum_{r=1}^{t}(t-r+1)r^2(r+1).\tag{7}
\]

In S the middle variables are \(b_1\le a_2\) and \(b_1\le b_2\), with \(a_2,b_2\) incomparable. For a fixed value of \(b_1\), the two upper variables can be chosen independently. The number of middle assignments on an interval of length \(r\) is \(\sum_{s=1}^{r}s^2=r(r+1)(2r+1)/6\). Therefore

\[
\Omega(S;t)=\frac16\sum_{r=1}^{t}(t-r+1)r(r+1)(2r+1).\tag{8}
\]

Power sums give (5)–(6). Alternatively the two sums at \(t=0,1,2,3,4,5\) equal respectively

\[
(0,1,8,33,98,238),\qquad (0,1,7,27,77,182).
\]

The order polynomials have degree at most five; (5) and (6) match the six integer evaluations, and hence agree identically. Taking the coefficient of \(t\) gives the claimed strict increase. QED.

**Combined conclusion:** Even when both the initial and final posets are connected and have width *exactly* two, adding a single cross-chain relation can either increase or decrease \(c_1\). Equations (1)–(8) provide exact five-element examples of both signs. All four displayed order polynomials still have nonnegative coefficients and furnish **no counterexample** to the named conjecture.

## Scope and next step

This eliminates the strategy of transferring the c₁≥0 inequality solely by monotonicity along the process of adding cross-chain order relations. It does **not** imply that the c₁≥0 conjecture is false: all coefficients in (1) and (2) are nonnegative. It is a structural obstruction and should not appear in the repository's catalogue of solved named conjectures.

Reproduce through independent exact ideal-grid recurrences and direct combinatorial sums:

    python3 research/ferroni-morales-panova-width-two/verify_monotonicity.py

The stronger still-open objective is to establish the endpoint matrix-logarithm sign for **all** grid ideal-regions, as in [PROGRESS.md](PROGRESS.md). An approach using a local relation-addition recursion needs extra correction terms capable of absorbing both upward and downward changes of c₁. No literature-priority claim is made for this elementary counterexample.
