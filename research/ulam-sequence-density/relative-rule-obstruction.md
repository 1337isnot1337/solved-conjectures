# Sparse errors in the full representation rule can change the density

For every finite genuine prefix there is an extension $S$ of natural
density zero that disagrees with the full exact-one rule at only
$`O(\log A_S(N))`$ positions through $N$, where $`A_S(N)=|S\cap[1,N]|`$.
There is also such an extension with lower density zero and positive
upper density. In both examples all late terms have phase in the
open central third for a rational frequency. There are finitely many
exceptional selected positions outside the block starts, and every
late selected position within a block after its start is uniquely
represented.

Here the error count includes both an omitted singleton and a selected
site whose representation count differs from one. This addresses the
weaker task of transferring a density estimate from an approximate
rule. The genuine sequence requires zero errors after its two seeds.
[Conditional estimate for short-pair predictions](phase-relative-errors.md)

## Construction

Let $P$ be the prescribed genuine prefix through $M$ and choose
an integer $d>\max(M,3)$. Take the fixed beginning

```math
E=P\cup(P+3d)\cup\{d,2d\}.
```

The only members of $E$ divisible by $d$ are $d$ and $2d$.
Each other occupied residue has two representatives separated by
$3d$. All later selected positions have the form $1+dj$. In a block
starting at $`J_i\equiv0\pmod3`$, select the indices

```math
j=J_i+3t+e,\qquad 0\le t\lt L_i,\quad e\in\{0,1\}.
```

Choose the starts beyond $2\max E$ in integer time and separate
their index intervals by at least three unused indices. The word
in each block is $L_i$ repetitions of $110$. The lengths can be
chosen with $`L_i\ge2^{i^2}`$ in both examples. The tail phase for a
rational frequency $k/d$ with $`1/3<k/d<2/3`$ is exactly $k/d$.

## Error count

In residue 1 modulo $d$, two tail summands cannot represent a target.
Two fixed summands cannot reach a sufficiently large target. The only
mixed pairs that reach residue 1 use $d$ or $2d$. Thus the exact-one
rule there examines the two preceding index bits. It accepts the
pattern $110$ repeatedly following its first one. Each block costs
one error at the start, where there is no pair, and one at the end,
where a singleton is omitted to turn the word off.

For a mixed pair in another residue, replace its fixed summand by the
other representative of that residue and translate its tail summand
by $3d$ in the opposite direction. This gives a second pair except
possibly at the first or last two selected sites of the tail block.
Thus all mixed pairs can supply at most $4|P|$ singleton targets per
block outside residue 1.

For a pair using two different tail blocks, the sum index determines
the sum of the two offsets $e$ modulo three. If that sum is one,
exchanging the two values of $e$ gives another pair. If it is zero
or two, the number of pairs is the number of ways to write a fixed
integer as $t+t'$ in two intervals of lengths $L_i,L_j$. With both
lengths at least two, only the extremal sums have one representation.
There are therefore at most four singleton targets per pair of blocks.

Inside a single block, a sum with different offsets $e$ counts ordered
choices of their two indices $t,t'$. Only the two extremal sums have
one such pair. For equal offsets the indices must be distinct.
Every sum index $h$ with $`3\le h\le L_i-1`$ has the pairs $`(0,h)`$
and $`(1,h-1)`$. Reflecting the two indices handles the upper half.
There are at most four singleton targets for each equal-offset type,
and at most ten within the block overall.

If block $i$ is the latest started by $N$, later blocks cannot
supply a summand through $N$. Using the full block $i$ in these upper
bounds is valid because terms above the cutoff cannot contribute to
any sum at or below it. Each singleton from the tail must come from
a singleton in one of the counted types. Thus there are at most
$`O(1+|P|i+i^2)`$ errors. The previous complete block supplies at
least $`2L_{i-1}`$ selected terms, so this is $`O(\log A_S(N))`$
uniformly over all large cutoffs.

## Density choices

For density zero choose each $J_i$ larger than $i^2$ times the total
of all the block lengths through block $i$. Throughout the range
from the start of block $i$ to the next start, the counting ratio
is then $`O(i^{-2})`$.

For failure of convergence choose each $J_i$ larger than $i^2$ times
the total previous block length and take $`L_i=J_i^2`$. The ratios
just before the blocks tend to zero, and those at their ends tend
to $`2/(3d)`$. The global upper limit is $`2/(3d)`$ because the tail
is contained in the same periodic pattern of index residues zero
and one modulo three. Arbitrarily long windows lie within a block,
so the upper Banach density of either extension is $`2/(3d)`$.

## Keeping every selected term uniquely represented

For the genuine prefix through 8, one can also make **all** selected
nonseeds uniquely represented, with only $`O((\log A_S(N))^2)`$
omitted singletons through $N$. The extension can have zero natural
density or can have lower density zero and upper density $1/6$.

Use $d=4$ and the following fixed beginning.

```math
E=\{1,2,3,4,6,8,14,15,29,30,34,49,53,82\}.
```

The nonseed terms have unique pairs, in order,
$`(1,2),(1,3),(2,4),(2,6),(6,8),(1,14),(14,15),(1,29),`
$(4,30),(15,34),(4,49),(29,53)`$.
The only members in residue zero modulo four are 4 and 8. In
every other occupied residue modulo 12 there are two fixed terms.
The largest fixed term in residue three modulo four is 15.

Use blocks in residue one modulo four. A block starting at $a_i$
consists of the terms $`a_i+4(3t+e)`$ for $`0\le t\lt L_i`$ and
$`e\in\{0,1\}`$. Start the first block at $`a_1=97=82+15`$.
This is the largest pair sum of the fixed beginning in residue
one, with exactly one pair. Beyond that start, a target in the
block can receive a pair only from the two fixed shifts 4 and 8.
Their recurrence produces the block pattern.

Let $x_i$ be the final term of a block. Its last two terms are
$x_i-4$ and $x_i$. Put $`q_i=2x_i-4`$ and append the four auxiliary
terms

```math
q_i,\qquad q_i+4,\qquad q_i+12,\qquad q_i+16.
```

The first is the largest sum of distinct previously selected terms,
so its pair is unique. The other three follow the same two-shift
recurrence. No pair of old terms reaches past $q_i$. A new auxiliary
term has residue two, so it needs a summand of residue zero to
produce a later auxiliary term. The only such summands are 4 and 8.

Start the next residue-one block at $`a_{i+1}=q_i+16+15`$.
After $q_i$ and before the new block, a pair hitting residue one
can only use a new auxiliary term with a fixed residue-three term.
The largest such sum is $a_{i+1}$ and its pair is unique. From there
the two-shift recurrence again applies within residue one, because
the new block cannot combine with itself or with a residue-two
term to hit residue one, and all fixed-bridge sums fall at or below
its start. This proves uniqueness at every selected nonseed.

For omitted singleton counts, treat each auxiliary block as a
two-period block and each main block as an $L_i$-period block.
The two-block and same-block estimates above apply regardless of
the residues of the two starts. Each contributes a bounded number
of singletons. Fixed shifts 4 and 8 create an omitted singleton
only at a group's termination, apart from the finite initial
range. Each other fixed term has a mate with the same residue
modulo 12. Translating the second summand by the difference of
those mates preserves the pattern away from a bounded portion of
each block boundary. This gives $`O(i^2)`$ total omissions through
the first $i$ blocks and at intermediate cutoffs. For
$`L_i\ge2^i`$, the count is $`O((\log A_S(N))^2)`$.

The endpoint recurrence is $`x_{i+1}=2x_i+12L_{i+1}+19`$.
Choosing $`L_i=2^i`$ gives $`x_i\asymp i2^i`$ and density zero.
For oscillation, after a finite block continue with $`L_j=2^j`$
until the counting ratio is arbitrarily small. Then choose the
next block length much larger than its start. At the end of that
block the ratio approaches $1/6$. Repeating gives lower density
zero and upper density $1/6$, since the residue-one blocks have
local density at most $1/6$ up to endpoint errors and the number
of auxiliary terms through $N$ is $O(\log N)$.
