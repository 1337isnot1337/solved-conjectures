# Cioba–Savvas shutout number conjecture

Let $G$ be a finite simple graph. Maker moves first, and the players alternate claiming a previously unclaimed edge. Maker wins the shutout game with parameter $s$ as soon as some vertex has at least $s$ Maker edges and no Breaker edge. The win is checked immediately, including immediately after Maker's move. Write $\tau(s)$ for the least maximum degree of a graph on which Maker can force this immediate outcome. The paper defines $\sigma(s)$ via a *free $s$-star*, checked after Breaker's reply (Definition 2.2 and the convention of §2). Any free $s$-star is already an immediate shutout, so $\sigma(s)\ge\tau(s)$. The proof below establishes the lower bound for the stronger immediate game.

**Theorem.** If $s\ge2$, $D=\Delta(G)\ge1$, and
```math
2^{1-s}\ \le\ \frac{D^D}{(D+1)^{D+1}},
```
then Breaker has a winning strategy. In particular $\sigma(s)\ge\tau(s)>2^{s-3}$ for every $s\ge3$, and $\sigma(s)\ge 2^s/8$ for every positive integer $s$.

This proves the intended exponential lower bound in [Conjecture 3.2 of Cioba–Savvas](https://michailsavvas.github.io/documents/Shutout.pdf), and hence the weaker superlinear-power assertion of Conjecture 3.3. It does not decide the separate numerical Conjecture 3.4. The original journal article is [*Shutout Games on Graphs*, Mathematika 61 (2015)](https://doi.org/10.1112/S0025579314000382).

## A local risk region

For a nonnegative vertex vector $z$ and $U\subseteq V(G)$, set
```math
Q_U(z)=\sum_{\substack{I\subseteq U\\ I\text{ independent in }G}}
(-1)^{|I|}\prod_{v\in I}z_v.
```
Write $z\in\mathcal R(G)$ when $Q_U(z)>0$ for every $U$. In particular $Q_{\lbrace v\rbrace }(z)=1-z_v>0$, so every coordinate is less than one.

Here are the region facts used below. They are the clique-coordinate idea of [Chen–Chen–Yang, §§2–3](https://arxiv.org/html/2608.20644v1), included with proofs to make the shutout argument self-contained.

1. **Initialization.** If $0<x<1$ and every $z_v\le x(1-x)^D$, then $z\in\mathcal R(G)$. Use the recurrence
   ```math
   Q_{U\cup\{v\}}=Q_U-z_vQ_{U\setminus N(v)},\qquad v\notin U.
   ```
   Induct on $|U|$ to prove $Q_{U\cup\lbrace v\rbrace }/Q_U\ge 1-x>0$. By previously proved ratios, deleting at most $D$ neighbors of $v$ from $U$ shows $Q_{U\setminus N(v)}/Q_U\le (1-x)^{-D}$. Substitution proves the induction, with $Q_\varnothing=1$.

2. **Clique test.** Fix coordinates outside a clique $C$ and suppose their vector on $A=V(G)\setminus C$ lies in $\mathcal R(G[A])$. Then a nonnegative assignment on $C$ extends into $\mathcal R(G)$ exactly when
   ```math
   \sum_{v\in C} z_v R_v(A)<1,\qquad
   R_v(U)=Q_{U\setminus N(v)}/Q_U,\quad U\subseteq A.
   ```
   To see this, $R_v(U)$ is nondecreasing in $U$ inside a positive region. Induct for adding one vertex $w\notin U$. If $w\in N(v)$, the numerator is unchanged and the denominator decreases. Otherwise the ratio of the new expression to the old one is
   ```math
   \frac{1-z_wR_w(U\setminus N(v))}{1-z_wR_w(U)}\ge1.
   ```
   The denominator is positive, and the inequality uses the induction on the smaller comparisons up to $U$. This ratio calculation works for an outside $v$ even if its own coordinate is not assigned, since it is excluded from all the sets considered. An independent set can contain at most one point of the clique, so for any subset with outside portion $U$ its polynomial is $Q_U$ times one minus the sum of $z_vR_v(U)$ over the chosen clique vertices. The largest such sum occurs for all of $A$ and $C$, proving the test.

   In particular a coordinate can be decreased to zero with the remaining coordinates fixed, by taking a singleton clique.

## Breaker's strategy

Call a vertex **live** if its host degree is at least $s$ and Breaker has not claimed any edge there. At a position after Breaker's move, or at the start, let $r_v$ be the Maker degree and put
```math
z_v =
\begin{cases}
2^{\,r_v-(s-1)} & \text{if $v$ is live},\\
0 & \text{otherwise}.
\end{cases}
```
Breaker maintains $z\in\mathcal R(G)$. Initially this follows from the degree hypothesis and initialization with $x=1/(D+1)$. Whenever the invariant holds, every live vertex has $r_v\le s-2$.

Suppose Maker takes $uv$. This cannot win immediately: a live endpoint increases by just one, hence reaches at most $s-1$, and no other vertex can newly qualify. Every live endpoint still has an unclaimed incident edge, since it has host degree at least $s$, no Breaker edge and at most $s-1$ Maker edges.

If neither endpoint is live, Breaker plays any free edge if one remains, which may only lower risks. If exactly one endpoint is live, claim an incident free edge there and set its risk to zero. If both are live, consider two virtual replies on their coordinates:
```math
(z_u,z_v)\ \longmapsto\ (0,2z_v)\quad\text{or}\quad (2z_u,0).
```
Their average is the old pair. The other coordinates are unchanged in both replies. Because $uv$ is an edge of $G$, its endpoints are a clique and the single strict linear test in Fact 2 governs these two coordinates. The average satisfies that test, so at least one virtual reply satisfies it. Implement such a reply by claiming a free edge at the endpoint assigned zero. If the actual Breaker edge also touches another live vertex, the real risks only decrease from the virtual vector; Fact 2 for singletons allows this. In all cases the invariant is restored. If the game ends immediately after a Maker move, it still cannot have been a winning move.

Thus Maker never wins the immediate game under the claimed degree test. For $D\ge1$, the initialization test with $x=1/(2D)$ permits every initial coordinate at most $1/(4D)$, by Bernoulli's inequality. Hence the same strategy wins whenever $D\le 2^{s-3}$, yielding the exponential bound. The cases $s=1,2$ satisfy $2^s/8\le s\le\sigma(s)$ trivially. ∎

The 2026 degree-game paper supplies the dynamic region machinery. Its minimum-degree conclusion is a different objective. Here the new risk tracks a vertex only until it first receives a Breaker edge, and the one-step safety margin is what implements the virtual deletion by a legal response under the original immediate-win rule.
