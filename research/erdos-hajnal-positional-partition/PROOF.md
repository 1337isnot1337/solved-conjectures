# Erdős–Hajnal’s positional partition problem

**Historical research note.** The original problem and the full threshold below follow from the published 1968 pair-shift theorem. [Prior-resolution review](AUDIT.md#prior-resolution-decision-27-november-2026-utc) · [Issue receipt](https://github.com/1337isnot1337/solved-conjectures/issues/979#issuecomment-7210026543)

**Answer to the 1968 Problem 5: no.** More generally, let $`V`$ be
an infinite linearly ordered set, let $`\mu`$ be an infinite cardinal,
and let $`1\le t\lt k<\omega`$. The following are equivalent:

1. The $`k`$-element subsets of $`V`$ can be partitioned into at most
   $`\mu`$ classes so that any two members of a class with at least
   $`t`$ common elements give every common element the same rank.
2. $`|V|\le 2^\mu`$.

Here ranks are taken in increasing order within each finite set; no
compatibility of the linear order on $`V`$ with the binary labels used
below is needed.

## The obstruction

Suppose $`c:[V]^k\to\mu`$ is such a coloring. For a fixed
$`t`$-element set $`P`$, define its profile $`F_P`$ on the color set:
$`F_P(i)`$ is the set of ranks occupied by the elements of $`P`$ in any
$`k`$-set of color $`i`$ containing $`P`$, or a separate absent symbol if
there is no such set. This is well-defined: any two possible extensions
have color $`i`$ and share at least the $`t`$ members of $`P`$. The alphabet
has $`\binom{k}{t}+1`$ symbols, so there are at most $`2^\mu`$ profiles.

Fix a $`(t-1)`$-element set $`D`$. Distinct extensions $`P=D\cup\{u\}`$
and $`Q=D\cup\{v\}`$ have different profiles. Indeed, choose a $`k`$-set
$`Z`$ containing $`P\cup Q`$, possible because $`t+1\le k`$. In the single
color $`i=c(Z)`$, the values $`F_P(i)`$ and $`F_Q(i)`$ are distinct:
different subsets of the same ordered set occupy different rank sets.
Thus $`u\mapsto F_{D\cup\{u\}}`$ is injective on $`V\setminus D`$.
This proves $`|V|\le 2^\mu`$.

## The boundary construction

Conversely, inject $`V`$ into $`\{0,1\}^\mu`$. For each ordered
$`k`$-set $`Z=(z_0,\ldots,z_{k-1})`$, choose a finite set of coordinates
$`I(Z)`$ separating the $`k`$ binary labels. One distinguishing
coordinate for each pair suffices. Color $`Z`$ by $`I(Z)`$ together with
the ordered list of the $`k`$ labels restricted to $`I(Z)`$.
There are at most $`\mu`$ such colors, since $`\mu`$ is infinite.
If a vertex occurs in two sets with the same color, its restricted
label must occupy the same position: the displayed restricted labels
are distinct. This gives agreement even for a single common element.

## Exact source and a second proof for triples

[Erdős and Hajnal, *On chromatic number of infinite graphs* (1968),
pp. 83–98](https://www.renyi.hu/~p_erdos/1968-04.pdf) defines a
$`k`$-partition in Definition 2.1 (p. 84) and defines similar position
in Definition 4.2 (p. 92): each common element has the same rank in
both ordered sets. Both phrases refer to that same rank requirement in
[Problem 5, p. 96](https://www.renyi.hu/~p_erdos/1968-04.pdf#page=14).
The authors ask for a countable coloring of all triples of the initial ordinal
$`\alpha`$ when $`2^{\aleph_0}<\alpha\le 2^{2^{\aleph_0}}`$. They give a
construction at the continuum, not above it. Apply the theorem with
$`k=3`$, $`t=2`$, and $`\mu=\aleph_0`$. It answers the full stated range.

One can also fix the least point $`a`$ and color pairs $`x\lt y`$ above it by
the color of $`\{a,x,y\}`$. The pairs $`\{x,y\}`$ and $`\{y,z\}`$ for
$`x\lt y\lt z`$ cannot have the same color, since $`y`$ has rank 2 in
$`\{a,x,y\}`$ and rank 1 in $`\{a,y,z\}`$. This is a coloring of the
ordinary shift graph. The negative result therefore also follows from
the bound for shifts of pairs, already established as the $`k=2`$ case
of Theorem 1 in the same paper. This is an alternate derivation, not
a new shift graph theorem. The paper expressly asks the positional
question after proving that theorem; possible later publication of
the implication is a separate historical question under audit.

[Tracking issue #979](https://github.com/1337isnot1337/solved-conjectures/issues/979).
