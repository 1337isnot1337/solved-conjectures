# Forcing preservation for the countable chromatic incompactness witness

This is a conditional preservation theorem for the open
$`\aleph_1`$ follow-up of Erdős–Hajnal’s ordinal-square problem.
It does not prove that every universe has the required graph.

Suppose a ground model has an uncountably chromatic graph
$`G`$ on $`\omega_2`$ whose subgraphs on fewer than $`\aleph_2`$
vertices are all countably chromatic. If the ground-model
continuum is at least $`\aleph_2`$, then the same graph works
after adding arbitrarily many Cohen reals or arbitrarily many
random reals. In particular, the known PFA witness gives examples
in these extensions even when their continuum exceeds $`\aleph_2`$
by arbitrarily much. The [published transfer and product argument](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-hajnal-ordinal-square-chromatic/PROOF.md#the-aleph_1-follow-up)
then supply exact chromatic number $`\aleph_1`$ on $`\omega_2^2`$.

## A degree-of-linkage criterion

If a forcing notion has the property that every subset of at most
$`|V(G)|`$ conditions is covered by countably many classes of
pairwise compatible conditions, it cannot add a countable proper
coloring of $`G`$. Indeed, suppose a condition forces that a
name is such a coloring. For each vertex $`v`$ choose a stronger
condition $`p_v`$ deciding its color $`k_v`$. Cover the chosen
conditions by countably many linked classes and assign to $`v`$
the pair consisting of its class index and $`k_v`$. If adjacent
vertices received the same pair, their compatible conditions
would force those two vertices to have the same color. Thus the
pairs give a countable coloring in the ground model already.

Both forcings below have the countable chain condition, so
$`\omega_2`$ stays regular. In either extension any new vertex subset
of size at most $`\aleph_1`$ is bounded in $`\omega_2`$. It is
therefore still countably chromatic by restricting a ground-model
coloring of the corresponding initial segment of $`G`$.

## Cohen forcing

Any family of at most $`\aleph_2`$ finite conditions together
mentions at most $`\aleph_2`$ coordinates. Choose an injection
from their union into binary sequences, using the assumption on
the ground-model continuum. For a condition, choose a common
finite prefix length that separates the sequences attached to
its different coordinates. Group conditions by this length
and by the finite table of prefixes with their assigned bits.
There are countably many such codes. Two conditions of the
same code agree on every coordinate they share and so are
compatible.

## Random forcing

Here conditions are positive-measure events modulo null sets
in a product of independent fair bits. Each can be approximated
arbitrarily closely in measure by a finite-cylinder event.
For a family of at most $`\aleph_2`$ conditions, only
$`\aleph_2`$ coordinates are used by their chosen approximations.
As before, inject these coordinates into binary sequences.

For each condition $`P`$ choose a rational
$`0<a<\mu(P)/2`$ and a finite-cylinder event $`C`$ with
$`\mu(P\triangle C)<a^2/4`$. Its measure exceeds $`a`$.
Order its finitely many coordinates by separated prefixes
at a common finite length, and encode the exact Boolean
predicate defining $`C`$ in this order. Group conditions
by the rational $`a`$, prefix length, list of prefixes and Boolean
predicate. There are countably many codes.

Suppose $`P,Q`$ receive the same code, with approximations
$`C,D`$. Any coordinate they share occupies the same place
in the two lists, because the prefixes distinguish coordinates
within each list and are ordered identically. Conditional on
the shared bits, the other bits are independent and each event
has the same conditional probability $`h`$. Therefore

```math
\mu(C\cap D)=\mathbb E[h^2]\ge(\mathbb E[h])^2\ge a^2.
```

Removing the two approximation errors leaves positive measure
in $`P\cap Q`$, so they are compatible. This proves the required
local countable linkage without assuming the full forcing,
which may have arbitrarily many coordinates, is countably linked.

The PFA starting point is
[Todorčević, Theorem 8.6](https://www.math.toronto.edu/~stevo/dichotomies4.pdf#page=13);
see also [Lambie-Hanson and Rinot, Result 2.1](https://arxiv.org/pdf/1708.06929#page=5).
The lower bound on the ground-model continuum in this preservation
argument matters: the ordinary CH shift-graph witness becomes
countably chromatic once at least $`\aleph_2`$ distinct reals can be
used to label its indices. No claim is made for arbitrary extensions
or for arbitrary ground models with large continuum.
