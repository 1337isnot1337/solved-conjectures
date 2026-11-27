# Erdős–Hajnal’s ordinal-square chromatic problem

The primary question in [Erdős Problem 919](https://www.erdosproblems.com/919)
is **independent of ZFC, relative to the consistency of a huge cardinal**.
More precisely it is equivalent in ZFC to the first, cardinal-local
question of [Erdős Problem 918](https://www.erdosproblems.com/918).
The positive direction is relatively consistent by Baumgartner
and the negative direction by Foreman–Laver. Both models can satisfy GCH.

The new step is a transfer that preserves the chromatic number and
the **order-type**, not just cardinality, requirement. The separate
follow-up in Problem 919 with global chromatic number \(\aleph_1\)
is reduced to ordinary countable chromatic incompactness at
\(\aleph_2\); this note does not claim its unrestricted ZFC status.

## The transfer theorem

Let \(\kappa\) be any regular uncountable cardinal and let \(\mu\) be
an infinite cardinal. Fix a chromatic number \(\theta\le\kappa\).
The following existence statements are equivalent in ZFC:

1. There is a graph \(H\) on \(\kappa\) vertices with
   \(\chi(H)=\theta\) and \(\chi(H[X])\le\mu\) whenever
   \(|X|<\kappa\).
2. There is a graph \(G\) on the ordinal \(\kappa^2=\kappa\cdot\kappa\)
   with \(\chi(G)=\theta\) and \(\chi(G[S])\le\mu\) whenever the
   inherited order type of \(S\) is strictly below \(\kappa^2\).

For \(2\Rightarrow1\), forget the order and relabel the vertices by
\(\kappa\). A subset of cardinality less than \(\kappa\) has order
type less than the initial ordinal \(\kappa\), and in particular
less than \(\kappa^2\).

For \(1\Rightarrow2\), label the vertices of \(H\) by ordinals below
\(\kappa\). Give \(\kappa\times\kappa\) its lexicographic order, with
the first coordinate indexing a row. Given \(\alpha<\gamma\), put
an edge between \((\alpha,\beta)\) and \((\gamma,\delta)\) if and
only if
\[
  \{\alpha,\gamma\}\in E(H)\quad\text{and}\quad \gamma<\beta.
\]
There are no edges within a row. This uses the edge condition
\(\gamma<\beta\) from the example immediately before the question
on p. 29 of [Erdős's original paper](https://www.renyi.hu/~p_erdos/1969-13.pdf),
but keeps only the pairs allowed by a separately supplied base graph.

### Global chromatic number

Projecting onto the first coordinate gives a homomorphism to \(H\).
Conversely, if \(G\) had a proper colouring with fewer than
\(\theta\) colours, it would use fewer than \(\kappa\) colours.
By regularity, in each row \(\alpha\) some colour \(i_\alpha\)
occurs cofinally in the second coordinate. If \(\alpha<\gamma\)
are adjacent in \(H\) and \(i_\alpha=i_\gamma\), choose
\(\beta>\gamma\) of colour \(i_\alpha\) in row \(\alpha\), and
any point of colour \(i_\gamma\) in row \(\gamma\). These points
are adjacent. Thus \(\alpha\mapsto i_\alpha\) properly colours
\(H\) with fewer than \(\theta\) colours, a contradiction.
So \(\chi(G)=\theta\).

### Every smaller order type

For \(S\subseteq\kappa\times\kappa\), write
\(S_\alpha=\{\beta:(\alpha,\beta)\in S\}\).
If \(\kappa\) many rows have size \(\kappa\), each has order
type \(\kappa\) and those rows alone contain a copy of the ordinal
sum \(\kappa\cdot\kappa\). Hence if \(\operatorname{otp}(S)<\kappa^2\),
the full rows form a set of size less than \(\kappa\), which is
bounded by regularity. Choose \(\rho<\kappa\) so that they all
lie below \(\rho\). For each remaining row \(\alpha\ge\rho\),
the set \(S_\alpha\) is bounded in \(\kappa\). Set
\[
  b(\alpha)=\sup\{\beta+1:\beta\in S_\alpha\}<\kappa
\]
there, and set \(b(\alpha)=0\) for \(\alpha<\rho\).

Choose a strictly increasing continuous sequence
\(\langle c_\xi:\xi<\kappa\rangle\), cofinal in \(\kappa\), of
closure points of \(b\), with \(c_0\ge\rho\). Here \(c\) is a
closure point if \(b(\alpha)<c\) for all \(\alpha<c\). The
closure points form a club: above any starting ordinal, iterate
the operation of taking a strictly larger ordinal above all the
\(b\)-values on the current initial segment, and take the
supremum after \(\omega\) steps. Regularity keeps this point
below \(\kappa\), and limits of closure points are closure
points as well.

If \(\alpha\in[c_\xi,c_{\xi+1})\), every selected second
coordinate in that row is below \(c_{\xi+1}\), so there is no
edge of \(G[S]\) from that band to any later band. Each band
involves fewer than \(\kappa\) rows. Its projection to \(H\)
therefore gives a proper \(\mu\)-colouring, and the same palette
can be reused across all bands. The initial segment of rows
below \(c_0\) also projects to a graph on fewer than \(\kappa\)
vertices; give it a separate palette of size \(\mu\) to avoid
cross-edges from these initial rows. Since \(2\cdot\mu=\mu\) in
cardinal arithmetic for infinite \(\mu\), this properly colours
all of \(G[S]\). Noninduced subgraphs cannot require more colours.

## Independence of the primary question

Apply the equivalence with \(\kappa=\theta=\aleph_2\) and
\(\mu=\aleph_0\).

- [Baumgartner, *Generic graph construction*, JSL 49 (1984),
  234–240](https://doi.org/10.2307/2274106) proves, relative to
  consistency of ZF, that ZFC + GCH can have an \(\aleph_2\)-vertex
  graph of chromatic number \(\aleph_2\) every subgraph of size at
  most \(\aleph_1\) of which is countably chromatic. Apply the
  transfer to that graph in the same model.
- [Foreman and Laver, *Some downwards transfer properties for
  \(\aleph_2\)*, Adv. Math. 67 (1988), 230–238](https://doi.org/10.1016/0001-8708%2888%2990041-2)
  show, relative to a huge cardinal, consistency with GCH that
  every graph of size and chromatic number \(\aleph_2\) contains
  an \(\aleph_1\)-vertex subgraph of chromatic number \(\aleph_1\).
  This rules out the cardinal-local graph and hence, by the converse,
  the ordinal-square graph. The precise two source results are
  also stated in [Lambie-Hanson and Rinot, Results 2.1–2.2](https://arxiv.org/pdf/1708.06929#page=5).

This is a relative-independence resolution of the exact primary
statement, not an unconditional existence assertion.

## The \(\aleph_1\) follow-up

The transfer with \(\theta=\aleph_1\) says it suffices and is
necessary to find a graph on \(\aleph_2\) of chromatic number
\(\aleph_1\) all of whose smaller-cardinality subgraphs are countably
chromatic. In this assertion one can replace “of chromatic number
\(\aleph_1\)” by “uncountably chromatic.”

Indeed, let \(H\) satisfy the latter. Take the categorical graph
product \(H\times K_{\aleph_1}\): two pairs are adjacent if both
coordinate pairs are adjacent. Projection to \(K_{\aleph_1}\)
gives the global upper bound \(\aleph_1\), and projection to \(H\)
preserves all smaller-cardinality bounds. If its vertices could be
properly coloured with countably many colours, for each \(u\in V(H)\)
choose a colour occurring on uncountably many \((u,\xi)\).
Adjacent \(u,v\) cannot receive the same chosen colour: choose
distinct \(\xi,\eta\) in their corresponding colour fibres.
The chosen colours would countably colour \(H\), a contradiction.
The product still has cardinality \(\aleph_2\).

Consequently both CH (the ordinary Erdős–Hajnal shift example)
and PFA (Todorčević's ordinary \(\aleph_2\)-chromatic example)
give positive answers to the order-type follow-up. See
[Lambie-Hanson–Rinot, Results 2.1](https://arxiv.org/pdf/1708.06929#page=5)
and the construction in
[Todorčević, Theorem 8.6](https://www.math.toronto.edu/~stevo/dichotomies4.pdf#page=13).
Neither restriction on the universe is needed for the equivalence
or the product argument.

[Tracking issue #971](https://github.com/1337isnot1337/solved-conjectures/issues/971).
