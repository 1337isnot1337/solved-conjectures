# Increasing rays and the remaining draw obstruction

This is a structural analysis of the game in [issue 224](https://github.com/1337isnot1337/solved-conjectures/issues/224),
not a solution of the prize problem. It does not claim novelty for the elementary
lemmas below. The exact rules and current offer are on the
[sponsor's page](https://althofer.de/collatz-prizes.html), updated 5 November 2026.

For a positive integer $`x`$, let $`o(x)`$ be its odd part. At an odd state
$`n>1`$, the successors are $`o(3n-1)`$ and $`o(3n+1)`$.

## 1. Exactly one increasing edge

Define $`I(n)`$ and $`D(n)`$ to be the larger and smaller successors. Then

```math
I(n)=\begin{cases}(3n-1)/2,&n\equiv1\pmod4,\\
(3n+1)/2,&n\equiv3\pmod4.
\end{cases}
```

The other numerator is divisible by four. Consequently, for odd $`n>1`$,

```math
D(n)\leq\frac{3n+1}{4}<n<I(n).
```

Both successors are coprime to three, since neither $`3n-1`$ nor $`3n+1`$
is divisible by three and division by powers of two preserves that property.
Thus multiples of three occur only as starting positions.

## 2. Exact increasing-ray decomposition

The map $`I`$ is a bijection from odd integers greater than one to odd integers
greater than one that are not divisible by three. Its inverse is

```math
J(m)=\begin{cases}(2m+1)/3,&m\equiv1\pmod6,\\
(2m-1)/3,&m\equiv5\pmod6.
\end{cases}
```

Indeed, $`I(4a+1)=6a+1`$ and $`I(4a+3)=6a+5`$, and these are precisely
the two residue classes in the asserted image. For $`m>1`$, the inverse
satisfies $`1<J(m)<m`$. Iterating $`J`$ must therefore stop at an odd
multiple of three; it cannot end at one. Uniqueness of the inverse makes
that root and the number of inverse steps unique.

Every odd integer greater than one consequently belongs to exactly one ray

```math
r,\ I(r),\ I^2(r),\ldots,\qquad r\equiv3\pmod6.
```

Under the coordinate $`n=2k+1`$, the increasing map becomes

```math
k\longmapsto\left\lceil\frac{3k}{2}\right\rceil.
```

The decreasing edge has the useful expression

```math
D(n)=\begin{cases}
o(I(n)+1),&n\equiv1\pmod4,\\
o(I(n)-1),&n\equiv3\pmod4.
\end{cases}
```

These identities do not give an induction on ray roots. For example,
$`17`$ is on the ray rooted at $`3`$, while $`D(17)=13`$ is on the ray
rooted at $`9`$:

```math
3\to5\to7\to11\to17,\qquad9\to13.
```

Thus the decreasing edge can increase the root, even though it decreases
the numerical state.

## 3. Why finite strategy certificates are the correct object

Treat state one as a terminal loss for the player to move: the preceding
player has already won. A finite certificate labels a state W when at least
one child is P, and P when both children are W. Each cited child has strictly
smaller certificate rank. These rules prove an actual winning strategy for
the indicated player by induction on the rank.

Conversely, every winning strategy in this game has a finite-depth certificate.
To see this, unfold its strategy tree. At the winning player's turns retain the
chosen move; at the opponent's turns retain both moves. A winning strategy
allows no infinite branch. A finitely branching rooted tree of unbounded depth
has an infinite branch: choose recursively a child whose subtree has unbounded
depth, which exists because there are only finitely many children. Therefore
the strategy tree has bounded depth. Label its vertices from the leaves upward
to obtain precisely a finite W/P certificate.

This is a completeness statement for the union over all finite certificate
searches. It does not make one bounded numerical search complete. A state with
an unexamined successor is not certified to be a draw.

## 4. Constraints on a hypothetical draw set

Let $`\mathcal D`$ consist of states from which neither player has a winning
strategy. Equivalently, these states have no finite W or P certificate.
Every draw state has no P successor and has at least one draw successor:
a P successor would make it W; two W successors would make it P. Selecting a
draw successor at each turn therefore keeps the game in the draw set.

If $`d=\min\mathcal D`$ existed, then $`D(d)<d`$ would be determined.
It cannot be P, so it is W. Hence $`I(d)`$ is a draw. This proves that a
minimal draw must take its increasing edge to continue drawing; it does not
prove that the entire increasing ray consists of draws, since later decreasing
edges may themselves reach draw states.

There is a second necessary condition when $`3\nmid d`$. The unique
increasing predecessor $`J(d)<d`$ is determined. Its increasing successor
is a draw, so it cannot be P. It must therefore be W through its other
successor, which is P. Explicitly,

```math
o(d+1)\text{ is P if }d\equiv1\pmod6,
\qquad
o(d-1)\text{ is P if }d\equiv5\pmod6.
```

We have not derived a contradiction from these conditions.

## 5. A general argument that would be invalid

Having one increasing and one decreasing edge is not enough to exclude draws.
For comparison, consider states $`0,1,2,\ldots`$, terminal $`0`$, the
single move $`1\to0`$, and moves $`j\to j-1`$ or $`j\to j+1`$ for
$`j\geq2`$. State one is W, while every state at least two is a draw.
Each player can avoid zero forever by moving upward whenever necessary;
choosing $`2\to1`$ would give the opponent an immediate win.

Any successful argument for Althöfer's game must use more of its arithmetic
than the two monotonicity inequalities. The increasing-ray decomposition
identifies that arithmetic but has not yet supplied the missing termination
argument.
