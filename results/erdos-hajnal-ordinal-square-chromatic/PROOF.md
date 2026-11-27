# Erdős–Hajnal’s ordinal-square chromatic problem

The primary question in [Erdős Problem 919](https://www.erdosproblems.com/919)
is **independent of ZFC, relative to the consistency of a huge cardinal**.
More precisely it is equivalent in ZFC to the first, cardinal-local
question of [Erdős Problem 918](https://www.erdosproblems.com/918).
The positive direction is relatively consistent by Baumgartner
and the negative direction by Foreman–Laver. Both models can satisfy GCH.

The new step is a transfer that preserves the chromatic number and
the **order-type**, not just cardinality, requirement. The separate
follow-up in Problem 919 with global chromatic number $`\aleph_1`$
is reduced to ordinary countable chromatic incompactness at
$`\aleph_2`$; this note does not claim its unrestricted ZFC status.

## The transfer theorem

Let $`\kappa`$ be any regular uncountable cardinal and let $`\mu`$ be
an infinite cardinal. Fix a chromatic number $`\theta\le\kappa`$.
The following existence statements are equivalent in ZFC:

1. There is a graph $`H`$ on $`\kappa`$ vertices with
   $`\chi(H)=\theta`$ and $`\chi(H[X])\le\mu`$ whenever
   $`|X|<\kappa`$.
2. There is a graph $`G`$ on the ordinal $`\kappa^2=\kappa\cdot\kappa`$
   with $`\chi(G)=\theta`$ and $`\chi(G[S])\le\mu`$ whenever the
   inherited order type of $`S`$ is strictly below $`\kappa^2`$.

For $`2\Rightarrow1`$, forget the order and relabel the vertices by
$`\kappa`$. A subset of cardinality less than $`\kappa`$ has order
type less than the initial ordinal $`\kappa`$, and in particular
less than $`\kappa^2`$.

For $`1\Rightarrow2`$, label the vertices of $`H`$ by ordinals below
$`\kappa`$. Give $`\kappa\times\kappa`$ its lexicographic order, with
the first coordinate indexing a row. Given $`\alpha<\gamma`$, put
an edge between $`(\alpha,\beta)`$ and $`(\gamma,\delta)`$ if and
only if
```math
  \{\alpha,\gamma\}\in E(H)\quad\text{and}\quad \gamma<\beta.
```
There are no edges within a row. This uses the edge condition
$`\gamma<\beta`$ from the example immediately before the question
on p. 29 of [Erdős's original paper](https://www.renyi.hu/~p_erdos/1969-13.pdf),
but keeps only the pairs allowed by a separately supplied base graph.

### Global chromatic number

Projecting onto the first coordinate gives a homomorphism to $`H`$.
Conversely, if $`G`$ had a proper colouring with fewer than
$`\theta`$ colours, it would use fewer than $`\kappa`$ colours.
By regularity, in each row $`\alpha`$ some colour $`i_\alpha`$
occurs cofinally in the second coordinate. If $`\alpha<\gamma`$
are adjacent in $`H`$ and $`i_\alpha=i_\gamma`$, choose
$`\beta>\gamma`$ of colour $`i_\alpha`$ in row $`\alpha`$, and
any point of colour $`i_\gamma`$ in row $`\gamma`$. These points
are adjacent. Thus $`\alpha\mapsto i_\alpha`$ properly colours
$`H`$ with fewer than $`\theta`$ colours, a contradiction.
So $`\chi(G)=\theta`$.

### Every smaller order type

For $`S\subseteq\kappa\times\kappa`$, write
$`S_\alpha=\{\beta:(\alpha,\beta)\in S\}`$ and
$`F=\{\alpha:|S_\alpha|=\kappa\}`$. If $`|F|=\kappa`$, the
full rows alone form the ordinal sum of $`\kappa`$ copies of
$`\kappa`$, so $`S`$ has order type $`\kappa^2`$. Consequently
$`\mathop{\mathrm{otp}}(S)<\kappa^2`$ forces $`|F|<\kappa`$.

In fact we prove the stronger local bounds
```math
 \chi(H[F])\le \chi(G[S])\le \max\{\mu,\chi(H[F])\}.
```
For the lower bound, a proper colouring of $`G[S]`$ with fewer
than $`\chi(H[F])`$ colours uses fewer than $`\kappa`$ colours.
The same cofinal-colour argument on the rows of $`F`$ would give
such a colouring of $`H[F]`$. For the upper bound, colour all
points in rows of $`F`$ by projecting to $`H[F]`$.

Now use a separate palette for the other rows. On the set of
nonfull row indices put a projected edge between $`\alpha`$ and
$`\gamma`$ whenever an edge of $`G[S]`$ joins these two rows.
For any nonfull row $`\alpha`$, its selected second coordinates
are bounded in $`\kappa`$, by regularity. Every later projected
neighbour of $`\alpha`$ is below this bound, by $`\gamma<\beta`$;
earlier neighbours are below $`\alpha`$. Thus each projected
vertex has fewer than $`\kappa`$ neighbours. Each connected
component has size less than $`\kappa`$: its successive
finite-distance balls have size less than $`\kappa`$, since a
union of fewer than $`\kappa`$ sets each of size less than
$`\kappa`$ has size less than $`\kappa`$, and their countable
union does too. Colour the points in each component using a
$`\mu`$-colouring of the restriction of $`H`$ to its row indices.
Reuse this palette in different components, which have no
intervening edges. Together with the disjoint full-row palette
this gives the upper bound, since $`\mu`$ is infinite.

For a smaller order type $`|F|<\kappa`$, so $`\chi(H[F])\le\mu`$.
The bounds prove the required conclusion. Noninduced subgraphs
cannot require more colours.

## Independence of the primary question

Apply the equivalence with $`\kappa=\theta=\aleph_2`$ and
$`\mu=\aleph_0`$.

- [Baumgartner, *Generic graph construction*, JSL 49 (1984),
  234–240](https://doi.org/10.2307/2274106) proves, relative to
  consistency of ZF, that ZFC + GCH can have an $`\aleph_2`$-vertex
  graph of chromatic number $`\aleph_2`$ every subgraph of size at
  most $`\aleph_1`$ of which is countably chromatic. Apply the
  transfer to that graph in the same model.
- [Foreman and Laver, *Some downwards transfer properties for
  ℵ₂*, Adv. Math. 67 (1988), 230–238](https://doi.org/10.1016/0001-8708%2888%2990041-2)
  show, relative to a huge cardinal, consistency with GCH that
  every graph of size and chromatic number $`\aleph_2`$ contains
  an $`\aleph_1`$-vertex subgraph of chromatic number $`\aleph_1`$.
  This rules out the cardinal-local graph and hence, by the converse,
  the ordinal-square graph. The precise two source results are
  also stated in [Lambie-Hanson and Rinot, Results 2.1–2.2](https://arxiv.org/pdf/1708.06929#page=5).

This is a relative-independence resolution of the exact primary
statement, not an unconditional existence assertion.

## The $`\aleph_1`$ follow-up

The transfer with $`\theta=\aleph_1`$ says it suffices and is
necessary to find a graph on $`\aleph_2`$ of chromatic number
$`\aleph_1`$ all of whose smaller-cardinality subgraphs are countably
chromatic. In this assertion one can replace “of chromatic number
$`\aleph_1`$” by “uncountably chromatic.”

Indeed, let $`H`$ satisfy the latter. Take the categorical graph
product $`H\times K_{\aleph_1}`$: two pairs are adjacent if both
coordinate pairs are adjacent. Projection to $`K_{\aleph_1}`$
gives the global upper bound $`\aleph_1`$, and projection to $`H`$
preserves all smaller-cardinality bounds. If its vertices could be
properly coloured with countably many colours, for each $`u\in V(H)`$
choose a colour occurring on uncountably many $`(u,\xi)`$.
Adjacent $`u,v`$ cannot receive the same chosen colour: choose
distinct $`\xi,\eta`$ in their corresponding colour fibres.
The chosen colours would countably colour $`H`$, a contradiction.
The product still has cardinality $`\aleph_2`$.

Consequently both CH (the ordinary Erdős–Hajnal shift example)
and PFA (Todorčević's ordinary $`\aleph_2`$-chromatic example)
give positive answers to the order-type follow-up. See
[Lambie-Hanson–Rinot, Results 2.1](https://arxiv.org/pdf/1708.06929#page=5)
and the construction in
[Todorčević, Theorem 8.6](https://www.math.toronto.edu/~stevo/dichotomies4.pdf#page=13).
Neither restriction on the universe is needed for the equivalence
or the product argument.

[Primary question tracking issue #971](https://github.com/1337isnot1337/solved-conjectures/issues/971) · [Follow-up #975](https://github.com/1337isnot1337/solved-conjectures/issues/975).
