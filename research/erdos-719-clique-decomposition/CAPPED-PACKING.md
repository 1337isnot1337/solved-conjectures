# Erdős–Sauer conjecture

**Partial result: scale-free exactness for diffuse clique packings.** For every fixed uniformity $r\ge3$, there are constants $\theta_r,\eta_r>0$ such that any counterexample to [Erdős Problem 719](https://www.erdosproblems.com/719) must concentrate at least an $\eta_r$ proportion of its maximum fractional clique-packing weight above the cap $\theta_r$. This applies at every order and does not require a positive edge-density surplus above the Turán number.

Use $K=K_{r+1}^{(r)}$. Write $\nu(G)$ for the maximum number of edge-disjoint copies of $K$, and $\nu^*(G)$ for its fractional analogue, where each $r$-edge has capacity one. Write $\tau(G)$ for the minimum number of $r$-edges meeting all copies of $K$. The [earlier repository result](https://github.com/1337isnot1337/solved-conjectures/blob/0b069c98/docs/erdos-sauer-research.md) proves
\[
|E(G)|-\mathrm{ex}_r(n,K)\le\tau(G)\le\gamma_r\nu^*(G),
\qquad \gamma_3=20/7,\quad\gamma_r=r-1\quad(r\ge4).
\]
We reuse that argument without making a new claim for its density-based theorem.

## Capped packing and rounding

For $0<\theta\le1$, let $\nu^*_\theta(G)$ denote the maximum fractional packing mass subject also to the cap $f(C)\le\theta$ on the weight of each clique $C$. Given any $\epsilon>0$, there is a rational $\theta>0$ depending only on $r,\epsilon$ such that, for every $G$,
\[
\nu(G)\ \ge\ \nu^*_\theta(G)/(1+\epsilon).
\]
To prove this, form the auxiliary $(r+1)$-uniform hypergraph with the $r$-edges of $G$ as vertices and the boundaries of copies of $K$ as edges. Its pair-codegree is at most one: two distinct $r$-edges whose union has size $r+1$ determine the only possible common clique, and otherwise no clique contains them both.

Take a rational optimal solution to the capped program. For arbitrarily large multiples $D$ of its denominators, replace each auxiliary edge $C$ by $D f(C)$ parallel copies. This multihypergraph has maximum degree at most $D$ and pair-codegree at most $D\theta$. Choose $\theta$ no larger than the small-codegree constant in [Kahn’s asymptotic list edge-coloring theorem](https://www.researchwithrutgers.org/en/publications/asymptotically-good-list-colorings/) for rank $r+1$ and an error smaller than $\epsilon$. In its usual max-degree formulation one can add a disjoint degree-$D$ star of linear auxiliary edges, so that the maximum degree is exactly $D$ without increasing the maximum pair-codegree above $\max(1,D\theta)$. Restrict the resulting proper edge coloring to the original multihypergraph. Its largest color class gives a genuine packing of distinct cliques, of size at least $D\nu^*_\theta(G)/((1+\epsilon)D)$. Parallel copies cannot occur twice in a color class. This proves the bound uniformly in the original graph order, including small orders.

## Consequences near the Turán threshold

Take $\epsilon=(r/\gamma_r-1)/2$, and $\eta_r=(r-\gamma_r)/(2r)$. If
\[
\nu^*_{\theta_r}(G)\ \ge\ (1-\eta_r)\nu^*(G),
\]
the rounding and the strict fractional cover bound give
\[
r\nu(G)\ \ge\ \frac{r}{1+\epsilon}(1-\eta_r)\nu^*(G)
=\gamma_r\nu^*(G)\ \ge\ \tau(G).
\]
In particular this proves the original decomposition inequality for such $G$.

For every optimal fractional packing $f$, clipping its individual weights at $\theta_r$ is feasible for the capped program. Thus any counterexample must satisfy the stronger pointwise restriction
\[
\sum_{C}(f(C)-\theta_r)_+>\eta_r\nu^*(G)
\]
for **every** optimal $f$. This also implies at least $\eta_r\nu^*(G)$ individual cliques with weights above the cap, since each weight is at most one. The earlier density localization only implies $\nu(G)=o(n^r)$ along a sequence of growing counterexamples; it does not give this relative concentration conclusion.

A second exact criterion follows from the same argument by using the fractional packing of constant weight $1/D$ on every clique. Let $D$ and $d$ denote the largest and smallest *positive* numbers of cliques containing an active $r$-edge, and let $M$ be the number of active $r$-edges. If $D$ is sufficiently large and every active edge lies in at least $d\ge\rho_r(1+\epsilon)(r+1)D/r$ cliques, then
\[
\nu(G)\ge \frac{dM}{(r+1)D(1+\epsilon)},\qquad \tau(G)\le\rho_r M,
\]
where a uniform random simplex-free template gives $\rho_3=4/9$, $\rho_4=3/8$, and $\rho_r\le113/243$ for $r\ge5$ by [Basit–McGinnis–Simmons–Sinnwell–Zerbib, Lemmas 26 and 27 and Corollary 29](https://doi.org/10.37236/10829). Applying their cover bound to the subgraph consisting only of active edges covers all original cliques. These inequalities give $\tau(G)\le r\nu(G)$ again.

This leaves the general case of a sparse collection of cliques with a localized fractional-packing obstruction. A universal argument controlling the heavy part is not supplied here. The classical rounding theorem, the templates and the earlier strict coefficient are not claimed as new.
