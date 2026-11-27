# The exponent is sharp for each fixed shift order

This is a scope check for the construction in
[the arbitrary-cardinal proof](ARBITRARY-CARDINAL-PROOF.md). It
is not a separate conjecture claim or a lower bound for all
graphs of large chromatic cardinal.

For fixed positive integer $k$, every infinite $k$-shift has
bipartization profile $\Theta_k(n^{1+1/k})$. The upper bound is
the finite orientation theorem. For the lower bound, first see
that the shift on $2k+1$ ordered points has an odd cycle. Start
at $(1,\ldots,k)$ and shift forward $k+1$ times through the
intervals of length $k$, ending at $(k+2,\ldots,2k+1)$. Then
shift backward $k$ times, prepending $k,k-1,\ldots,1$ in turn.
Every internal tuple on the backward part has a gap at $k+1$,
so it is distinct from the intervals on the forward part.
The internal backward tuples are different from one another
by their first coordinates. This gives a simple cycle of
length $2k+1$.

In any two-coloring of $S_k([m])$ for $m\ge2k+1$, every
$(2k+1)$-point ground subset therefore supplies at least one
monochromatic edge. Each edge comes from a unique
$(k+1)$-point ground set, and is counted in exactly
$\binom{m-k-1}{k}$ of these larger subsets. Double-counting gives
the lower bound
$$
\frac{\binom{m}{2k+1}}{\binom{m-k-1}{k}}
  =\frac{\binom{m}{k+1}}{\binom{2k+1}{k+1}}
$$
on the required number of deletions. The number of vertices is
$\binom mk$. For any sufficiently large $n$, take the largest
$m$ with $\binom mk\le n$ and extend the chosen vertex set to
$n$ vertices in the infinite shift. Restriction shows that
adding vertices cannot reduce the necessary deletions. Thus
the claimed lower bound holds uniformly in $n$ at fixed $k$.

It follows that a single ordinary shift order cannot give
arbitrarily slowly divergent $h_G(n)/n$; the shift order in the
arbitrary-cardinal theorem must depend on the requested exponent.
