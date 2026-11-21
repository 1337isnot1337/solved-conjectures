# Independent review of the Nussbaum recurrent-completion reduction

Reviewed 21 November 2026. Source:
[recurrent completions and higher-face gap](recurrent-completions-and-higher-face-gap.md),
SHA256 `0b77b42a4ec63c2dbc7cd2dc53123c036c8c515c3bda49dd988eaa765ff899b6`.
The exact DNF criterion in the [target note](target-and-interpolation.md)
was also read. This review passes the mathematical arguments below. It does
not establish a full Nussbaum bound or a prize result.

## Recurrent classes and the quantitative bound

The inclusion $`g(Q_i)\subseteq Q_{i+1}`$ follows from information
monotonicity, since every Boolean completion of an input state is above it
in the information order. Iteration of $`g^p`$ inside $`Q_0`$ reaches a cycle.
On the resulting Boolean cycle of least length $`\ell`$, adding $`p`$ to the
exponent has exactly $`d=\gcd(p,\ell)`$ classes, each of size $`L=\ell/d`$.
Negative exponents in the displayed class notation are legitimate because
they refer only to this periodic cycle and can be represented by nonnegative
exponents. Thus every phase-$`r`$ face contains the same whole class $`C_r`$.

The hull of that class has dimension at least $`\lceil\log_2L\rceil`$.
Faces containing the hull reduce to subsets of its remaining coordinates;
orbit incomparability makes those subsets an antichain. The resulting
Sperner bound and its monotonicity in the remaining dimension are valid,
including dimension zero. Both sufficient conditions stated in the note,
$`d\leq2`$ using the two-anchor theorem and $`\ell\geq d^2`$ using the
hull estimate, follow. Neither condition is forced by this argument.

## Two limits of the reduction

The explicit formula using $`h_j=x_j\vee\neg x_j`$ has the claimed
$`\binom nk`$-cycle: on a state indexed by a $`k`$-set $`B`$, precisely the
inner term indexed by $`B`$ equals one, and all other terms equal $`*`$.
Every Boolean input maps to the all-one vertex. Distributive expansion
produces clauses with one literal per chosen variable, so none contains a
variable and its negation. The long formula cycle therefore coexists with
a single recurrent Boolean state.

The exact divisibility consequence is that the **formula period need not
divide the recurrent Boolean period**. This example has Boolean period one,
so it does not disprove the converse divisibility. The author made this
direction explicit after the initial review; the pinned source includes
that clarification. No mathematical claim changed.

The three anchors in the four-cube give 17 distinct squares: two pairs of
anchors have distance three and share no square, while the remaining pair
has distance two and shares exactly one. Equal-dimensional faces form an
antichain, and 17 representatives cannot be chosen from 16 vertices. This
refutes the unrestricted three-anchor Hall extension. No cyclic-orbit
realization of that family is asserted.

## Cartesian-product realization

Every remaining nonedge of the Cartesian product has an endpoint outside
the distinguished closed neighborhood. Its added coordinate creates only
the intended incompatibility and an already required incompatibility with
the distinguished vertex. The initial two coordinates handle pairs in
different neighbor cliques and introduce no false nonedge.

Private coordinates give each other face a completion in no other face.
The distinguished face also has a private completion, using initial bits
$`11`$ and zero elsewhere. Hence all faces are incomparable, and the
uncovered-completion condition of the DNF interpolation criterion holds.
Translation by one in every factor is a single cycle because the factor
orders are pairwise coprime; it preserves the compatibility graph. Applying
the criterion coordinate by coordinate is therefore justified.

The maximal cliques are exactly coordinate lines. Their stabilizers,
counts, and clique-cover number in the note are correct. The construction
uses at least $`2p`$ coordinates, so it supplies no violation of the required
period bound. Its role is to exclude a shortcut based only on minimum face
dimension and the proposed simple clique conditions.
