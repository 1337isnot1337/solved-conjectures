# Erdős–Hajnal’s ordered rectangle rainbow problem

**ZFC counterexample to Problem 6(A).** There is a three-coloring of
the pairs of $`\omega_1`$ that takes all three colors between every
two uncountable vertex sets, yet has no $`x\lt y\lt z`$ with
$`c(x,y)=0`$, $`c(y,z)=1`$ and $`c(x,z)=2`$. This also refutes the
ordered-pattern implication under the weaker condition $`(\gamma)`$
from 6(B). It does not avoid all rainbow triangles.

## The general signed construction

Let $`C`$ be any set of colors of cardinality at most $`\aleph_1`$
and split it into two nonempty parts $`C_+,C_-`$.
There is a coloring $`c:[\omega_1`$^2\to C] with both of the following
properties:

1. For every uncountable $`A,B\subseteq\omega_1`$, every color occurs
   on some unordered pair with one vertex in $`A`$ and one in $`B`$.
2. For any finite or countably infinite edge-colored pattern on
   an ordinal-ordered set of vertices of order type at most $`\omega`$,
   it embeds in $`c`$ by a strictly increasing vertex map if and only
   if the following orientation has no directed cycle: orient a
   specified edge upward in the pattern's order for a color in
   $`C_+`$, and downward for a color in $`C_-`$. Unspecified pairs
   impose no restriction.

Take an injection $`r:\omega_1\to\mathbb R`$ with an uncountable preimage
of every nonempty rational open interval. This can be arranged:
partition $`\omega_1`$ into countably many uncountable sets and
assign one to each rational interval, then choose the real labels
injectively by recursion of length $`\omega_1`$. At every stage
only countably many reals have already been used.

By [Moore's half-graph theorem](https://arxiv.org/abs/math/0501524),
there is a coloring $`h:[\omega_1`$^2\to\omega_1] with this property:
for all uncountable $`A,B\subseteq\omega_1`$ and all $`q<\omega_1`$,
there are $`x\in A,y\in B`$ with $`x\lt y`$ and $`h(x,y)=q`$.
Fix surjections $`s_\pm:\omega_1\to C_\pm`$. For $`x\lt y`$, set
$`c(x,y)=s_+(h(x,y))`$ if $`r(x)\lt r(y)`$ and
$`c(x,y)=s_-(h(x,y))`$ if $`r(x)>r(y)`$.

## All unordered rectangles are multicolored

Any two uncountable sets of distinct real labels have disjoint
rational intervals that meet the respective sets uncountably.
Indeed the points of either set having a neighborhood with only
countably many points of that set form a countable set, by the
countable base of the real line. Choose distinct remaining points
from the respective sets and disjoint intervals around them.
Thus there are uncountable $`A'\subseteq A,B'\subseteq B`$ whose
real labels are separated, say $`r[A'`$\lt r[B']]. Given any positive
color, take a preimage under $`s_+`$ and use Moore with the earlier
end in $`A'`$ and the later end in $`B'`$. Given any negative color,
take a preimage under $`s_-`$ and use Moore with the earlier end
in $`B'`$ and the later end in $`A'`$. The case of reversed real
separation swaps the names. This proves property 1 and, by taking
$`A=B`$, also proves all colors occur on every uncountable square.

## Exact pattern criterion

Every realized pattern has an acyclic orientation: following an arc
strictly increases the real label, which is impossible around a
directed cycle. Conversely, extend the acyclic orientation to a
linear order on its vertices (take the transitive closure and a
linear extension). Assign pairwise disjoint rational open intervals
in that real order, possible for every countable linear order.
For example, enumerate its elements and successively insert a bounded
interval in the appropriate gap between the finitely many intervals
already chosen, leaving positive space between their closures.
Each vertex now has an uncountable reserve of ordinal labels in
its interval.

We use a consequence of Moore's property. For any uncountable
$`A,B`$ and fixed $`q<\omega_1`$, all but countably many $`x\in A`$
have uncountably many $`y\in B`$ with $`x\lt y`$ and $`h(x,y)=q`$.
Otherwise choose an increasing interleaving
$`a_i\lt b_i\lt a_{i+1}`$ for $`i<\omega_1`$, with $`a_i`$ from the
uncountable bad set and $`b_i\in B`$ outside the countable union of
the forward $`q`$-neighborhoods of $`a_j`$ for $`j\le i`$.
This is possible at each stage by regularity of $`\omega_1`$.
There would be no forward edge of color $`q`$ from the chosen
$`a_i`$'s to the chosen $`b_i`$'s, contrary to Moore's property.

Choose the pattern vertices in their specified ordinal order, one
at a time. For each required color between the current vertex and
a future vertex, choose a preimage under the appropriate $`s_\pm`$.
Discard the countably many exceptions for each future reserve,
relative to that preimage. There are only countably many reserves.
Now choose the current vertex above all previous choices from its
still uncountable reserve, and replace each constrained future
reserve by its uncountable set of forward neighbors with the
required $`h`$-value. Every choice is made after only finitely
many earlier stages. The real intervals ensure the prescribed
signs, and the chosen values of $`h`$ ensure the prescribed colors.
This proves property 2. We do not claim the embedding conclusion
for a pattern order type larger than $`\omega`$.

## The printed problem

[Erdős and Hajnal (1968), pp. 96–97](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=14)
ask whether condition $`(\alpha)`$ in 4.3, the unordered
uncountable-rectangle condition, already gives every prescribed
**ordered** triangle in 4.4. In the construction take
$`C_+=\{0,1\}`$, $`C_-=\{2\}`$. The prescribed edges
$`xy:0`$, $`yz:1`$, $`xz:2`$ orient as $`x\to y\to z\to x`$.
The same conclusion follows directly from transitivity of the
real order. The stronger hypothesis $`(\beta)`$ of 4.4 uses
a countably infinite first test set; our example only addresses
the weaker hypotheses, as asked.

Hajnal's 2008 [Fact 2.3](https://www.impan.pl/shop/publication/transaction/download/product/88684)
already uses the Sierpiński–Moore composition with a larger palette
to omit an unordered rainbow complete graph. The present
application is an ordered obstruction and the spectrum argument
proves an exact realization criterion for this construction. No
priority is claimed for the composition itself. The unordered
existence question in 6(B), separate from this result, has
[prior consistent counterexamples](https://doi.org/10.1017/jsl.2021.56).

[Tracking issue #980](https://github.com/1337isnot1337/solved-conjectures/issues/980).
