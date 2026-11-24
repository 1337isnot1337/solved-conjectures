# Labelle's simply laced Toda unimodality conjecture: graph associahedra

**Structural partial, not a resolution.** [Labelle, arXiv:2502.10655v4, Conjecture 7.3](https://arxiv.org/html/2502.10655v4#S7.Thmconjecture3), predicts unimodality of $N_\alpha=(q)_\alpha^2\mathfrak J_\alpha$ for every positive-root-lattice vector in a simply laced finite root system. Version 4 explicitly restricts the scope after the known non-simply-laced counterexample (so the [earlier refutation of version 3](https://www.trureturing.org/research/labelle-2025-toda-numerator-unimodality-refutation/) has a distinct scope). The author's type $A$ all-ones case already yields Narayana numbers. Here the fermionic recursion identifies every binary vector in every simply laced type, including $D_n,E_6,E_7,E_8$, with the $h$-polynomial of a graph associahedron.

Let $S$ be the support of a vector $\alpha$ with all simple-root coordinates $0$ or $1$. Use the induced Dynkin forest on $S$, and write $c(T)$ for the number of connected components of its induced subgraph on a subset $T\subseteq S$. The empty set has $c(\varnothing)=0$. Then
$$
 N_\alpha(q)=h(\operatorname{Asso}(S);q),
$$
where for a disconnected forest $\operatorname{Asso}(S)$ means the Cartesian product of its connected graph associahedra and $h$ is the $h$-polynomial of the dual simplicial boundary. The empty product has $h=1$.

## Normalized fermionic recursion

Write $N_S$ for the Toda numerator of the vector $\alpha_S=\sum_{i\in S}\alpha_i$. The exponent $(\alpha_T,\alpha_T)/2$ in [Labelle's Definition 1.1](https://arxiv.org/html/2502.10655v4#S1.Thmdefinition1) is $|T|-|E(T)|=c(T)$, since all roots on the support have squared length $2$ and the induced graph is a forest. Also $(q)_{\alpha_T}=(1-q)^{|T|}$. Multiplying the recursion by $(1-q)^{2|S|}$ and moving the self-term to the left gives
$$
 (1-q^{c(S)})N_S(q)=
 \sum_{T\subsetneq S}q^{c(T)}(1-q)^{|S|-|T|}N_T(q).
$$
The Toda numerators factor across connected components of $S$: take the product of the inclusive fermionic recursions for the components. The bilinear exponent and denominator both factor, and uniqueness of the recursion then identifies that product with the common answer. Thus for nonempty connected $S$ one needs just
$$
 N_S(q)=\sum_{T\subsetneq S}
 q^{c(T)}(1-q)^{|S|-|T|-1}\prod_{C\in\operatorname{cc}(T)}N_C(q).
$$

## The same recurrence for tubings

For connected $S$, the simplicial complex dual to [Carr–Devadoss's graph associahedron](https://arxiv.org/abs/math/0407229) has faces the tubings, with vertices the nonempty proper connected subsets of $S$. Two tubes are compatible when they are nested, or are disjoint with no connecting edge. Let $f_S(x)$ count tubings by number of tubes, including the empty tubing.

For any tubing, the maximal tubes are disjoint and pairwise nonadjacent; their union is a proper subset $T\subsetneq S$ because $S$ is connected and one maximal tube may not equal $S$. They are exactly the components of the induced graph on $T$. Conversely, given a proper $T$, make its components the maximal tubes, and choose an arbitrary tubing of each component to sit below it. Hence
$$
 f_S(x)=\sum_{T\subsetneq S}x^{c(T)}\prod_{C\in\operatorname{cc}(T)}f_C(x).
$$
Set $h_S(q)=(1-q)^{|S|-1}f_S(q/(1-q))$. Each component $C$ has dimension $|C|-1$; substituting in the last display gives exactly the connected Toda recurrence above. The recursive definitions and the initial cases agree, proving the identity.

Graph associahedra are simple polytopes, so their $h$-coefficients are unimodal by the polytopal $g$-theorem (or Hard Lefschetz). Their Cartesian products remain simple. Consequently the complete binary-coordinate case of the revised conjecture follows, though unrestricted higher coordinates remain open. The same recurrence, and thus the identity, makes sense on every finite forest if only binary inputs are used, regardless of whether the forest is a Dynkin diagram.

