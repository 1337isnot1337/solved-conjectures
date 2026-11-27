# Preserving large-biclique exclusions in the labelled-star transfer

This supplements the [continuum rainbow-star proof](PROOF.md).
The same transfer can preserve the exclusion of large balanced
bicliques. With this observation, the classical generalized
Specker templates give witnesses to the original continuum
problem with no uncountable balanced biclique.

## 1. A biclique projects to a biclique

In the transfer theorem, orient the template (B) by a
well-ordering of its vertices. Recall that each vertex of
the output (G) has at most (mu) neighbours in the union
of all earlier fibres, because its incoming code has size at
most (mu).

First suppose (mu) is an infinite cardinal, and put
(kappa=mu^+). In any (K_{kappa,kappa}) of (G),
with sides (A,D), no one fibre contains (kappa) members
of (A). Indeed, if (V_u) did, no member of (D) could
belong to that same fibre (which is independent), or to a
later one (the incoming cap of (mu) would be violated).
But then all (kappa) members of (D) would be earlier
neighbours of any one of the specified members of (V_u),
again violating the cap. The same holds for (D).
Since (kappa=mu^+), fewer than (kappa) fibres of
individual size less than (kappa) hold at most (mu)
members. Each side must therefore project onto (kappa)
different template vertices. The projected sides are disjoint
and have all cross edges, so (B) contains (K_{kappa,kappa}).

If instead (mu=k<omega), the graph (G) always excludes
(K_{k+1,k+1}). In such a finite biclique take a vertex whose
fibre has maximal index. All (k+1) vertices in the opposite
part must be in earlier fibres, which exceeds the incoming cap.

This finite assertion gives a strengthened version of the
[countable odd-girth supplement](https://github.com/1337isnot1337/solved-conjectures/issues/1020):
for any (kge1) and (g<omega), choose as template a finite
graph of girth greater than (g) and chromatic number exactly
(k+1). Such graphs follow from Erdős’s high-girth theorem
by deleting vertices until the chromatic number is (k+1).
The transfer with (lambda=aleph_0) gives, simultaneously,
a countably infinite rainbow star in every (k)-colouring,
(K_{k+1,k+1})-freeness, ordinary chromatic number exactly
(k+1), and odd girth greater than (g).

## 2. The Specker template has no full-size balanced biclique

Let (kappa) be a regular uncountable cardinal and
(nge1). The generalized Specker graph (GS_n(kappa))
is defined in [EGH75, Definition 8.2, p. 456](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=32).
Its vertices are strictly increasing tuples of ordinals below
(kappa) of length (L=n^2+n+1). Vertices (x,y) are adjacent
when their entries follow the alternating inequalities
[
x_n<y_0<x_{n+1}<y_1<cdots<x_{L-1}<y_{n^2},
]
or when (x,y) follow the reversed role assignment. In the
former role assignment we say (x) leads.

Suppose there are sides (A,D) of size (kappa) with all
cross edges. In each side choose a longest prefix of a tuple
which has (kappa) extensions in that side. This can have
length zero but cannot have length (L). Pass to tuples
extending this prefix. By maximality of its length, each
particular next coordinate has fewer than (kappa)
extensions. Regularity of (kappa) implies that, in each
side, the first coordinate after the fixed prefix can be
chosen above any given ordinal below (kappa). Call all
coordinates after the prefix `free`.

Choose (xin A) and (yin D) so that all free coordinates
of (x) are above all fixed coordinates of both sides, and
all free coordinates of (y) are above those of (x). The
role assignment with (y) leading would require
(y_{L-1}<x_{n^2}), impossible. Since (x) leads, the last
part of the inequalities is
[
x_{L-2}<y_{n^2-1}<x_{L-1}<y_{n^2}.
]
Thus (y_{n^2-1}) is fixed and (y_{n^2}) is free. Also
(x_{L-2}) is fixed. The fixed prefixes chosen in (A,D)
must therefore have lengths (L-1) and (n^2), respectively.

Choose another cross pair but now with all free coordinates
of (D) before those of (A), still after all fixed
coordinates. The same argument interchanges the prefix
lengths. This requires (L-1=n^2), contrary to (nge1).
So (GS_n(kappa)) has no (K_{kappa,kappa}).

## 3. Consequence for the original problem

For any infinite (mu), take (B=GS_n(mu^+)) as
in the main proof. Successor cardinals are regular in ZFC.
Both the template and its well-ordered transfer exclude
(K_{mu^+,mu^+}). At (mu=aleph_0) this gives a
continuum-sized labelled-star witness with no
(K_{aleph_1,aleph_1}), even when CH fails.

This additional exclusion does not assert that no countable
balanced biclique occurs. Nor does it exclude (C_4);
it concerns the balanced bipartite obstruction at the
first cardinal larger than the allowed vertex palette.
