# The two elliptic families do not exhaust rational square chains

Status: research. This note proves that the two displayed elliptic families and their Hadamard images do not exhaust rational 16-root square chains. It does not classify arbitrary chains or resolve tau. The restricted prefix theorems are in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md) and [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md).

## 1. The two elliptic families do not exhaust rational 16-root chains

The following eight absolute root representatives were computed by
Michael E. Paul and reported in Andrew Bremner, *When Can
`(((X^2-P)^2-Q)^2-R)^2-S^2` Split into
Linear Factors?*, Experimental Mathematics 17(4) (2008), 385--390,
Table 1, entry 4, printed page 387. Bremner credits Paul for the table
on printed page 388:

```math
(A,B,C,D,E,F,G,H)=
(5093,9217,9677,4153,8473,6253,3167,10043).
\tag{1.1}
```

The primary table was checked at
<https://scispace.com/pdf/when-can-x-2-p-2-q-2-r-2-s-2-split-into-linear-factors-3nneuzjm0b.pdf>.
The finite root example is not new. The nonmembership certificate
below is an additional check of the scope of our family theorems.

### Proposition 1.1

The roots in (1.1) give a nondegenerate square chain with 16 distinct
integer roots. Its root set is not a rational scaling of a root set
from either of the two displayed Bremner elliptic families, even
after arbitrary root labels and signs. It is also not a rational
scaling of a Hadamard transform of either family.

**Proof of the square-chain claim.** Direct integer multiplication gives

```math
A^2+B^2=C^2+D^2=E^2+F^2=G^2+H^2=110891738
```

and

```math
A^2B^2+C^2D^2=E^2F^2+G^2H^2=3818690399830322.
```

The reconstruction in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md), equation (1.6), therefore gives

```math
\begin{aligned}
P&=55445869,
\\ Q&=1164899189250000,
\\ R&=446227095550009520724687360000,
\\ S&=-359659829363407799927500800000.
\end{aligned}
\tag{1.2}
```

Pairing factors, exactly as in that reconstruction, proves

```math
\left(((x^2-P)^2-Q)^2-R\right)^2-S^2
   =\prod_{a\in\{A,B,C,D,E,F,G,H\}}(x^2-a^2).
\tag{1.3}
```

The eight numbers in (1.1) are positive and pairwise distinct, so
(1.3) has 16 distinct integer roots.

**Necessary relation for the two original families.** Both displayed
families satisfy

```math
A-C-E+G=0.
\tag{1.4}
```

Indeed, their polynomial formulas for these four entries give
`A-C=E-G=-4(a+b)c^2` identically. Thus membership in either family,
under any root labels, signs, and common nonzero rational scaling,
requires a signed relation on four distinct absolute root values.

No such relation exists in (1.1). A relation with three terms of
one sign and one of the other would require three positive entries
to sum to a fourth. But the sum of the three smallest entries is

```math
3167+4153+5093=12413>10043=\max(A,\ldots,H).
```

A relation with two terms of each sign would equate two sums of
distinct entries. The complete list of the 28 unordered pair sums is

```text
7320, 8260, 9246, 9420, 10406, 11346, 11640,
12384, 12626, 12844, 13210, 13370, 13566, 13830,
14196, 14310, 14726, 14770, 15136, 15470, 15930,
16296, 17690, 18150, 18516, 18894, 19260, 19720.
```

All are different. A relation with all four terms of the same sign
is impossible because every entry is positive. This excludes (1.4)
for every assignment of signs and distinct absolute roots.

**Necessary relation after Hadamard transformation.** Write the four
first-level pairs of a family chain as `(a_i,b_i)` and their Hadamard
images as

```math
u_i=a_i+b_i,\qquad v_i=a_i-b_i.
```

The inverse formulas are

```math
a_i=(u_i+v_i)/2,\qquad b_i=(u_i-v_i)/2.
\tag{1.5}
```

Relation (1.4) selects one entry from each of the four pairs. After
substitution of (1.5) and multiplication by two, it becomes a signed
relation involving all eight transformed representatives, each with
coefficient `+1` or `-1`. For example, choosing the first entry in
each pair gives

```math
u_1+v_1-u_2-v_2-u_3-v_3+u_4+v_4=0.
```

Choosing second entries or changing their signs changes only these
eight signs. A nondegenerate Hadamard image has eight distinct
nonzero absolute root representatives, as proved in [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md).
Consequently membership in a transformed family requires a signed
relation on all eight numbers in (1.1).

There is no such relation. Their total is 56076, so a signed relation
is equivalent to a subset summing to 28038. Every entry is odd and
28038 is even, so the subset must have even size. A two-element
subset has sum at most `10043+9677=19720<28038`; by taking complements,
a six-element subset is also impossible. The empty and full subsets
are excluded. The only remaining possibility is a four-element subset.

Modulo 5, five entries are 3 and three entries are 2. A four-element
subset therefore contains `j` entries congruent to 3 with `1<=j<=4`,
and its sum is congruent to `8+j`. The possible residues are
`4,0,1,2`, whereas `28038` is 3 modulo 5. This contradiction excludes
the eight-term relation. All these relations are homogeneous, so
nonzero rational scaling cannot affect the conclusion. QED.

The standard-library script `bremner_family_scope_checks.py` verifies the
pair norms, product identity, reconstructed coefficients, all roots,
the 28 distinct pair sums, and the parity/modulo-5 certificate. It is
a check of this specific exact witness, not evidence extrapolated
from a finite search.

### 1.1 The missing classification is a larger rational-point problem

Arbitrary centered degree-16 rational split square chains correspond
to nondegenerate rational points of

```math
\begin{aligned}
A^2+B^2&=C^2+D^2=E^2+F^2=G^2+H^2,
\\ A^2B^2+C^2D^2&=E^2F^2+G^2H^2,
\end{aligned}
\tag{1.6}
```

up to root labels, signs, and scaling. The two elliptic families
are particular curves in this larger variety. At a nondegenerate
point, the four defining equations have independent gradients:
the first three are independent on the three separate later pairs;
if the fourth gradient were in their span, comparison of its `A`
and `B` coordinates would force `A^2=B^2`, a contradiction. Hence
the affine solution cone has local dimension four and its
projectivization has dimension three there.

Dimension alone would not classify its rational points. Proposition
1.1 gives the stronger concrete conclusion needed here: the union
of the two known curves and their Hadamard images does not exhaust
even the known rational points. A theorem about pairings drawn from
those two families therefore cannot be promoted to a theorem about
all rational degree-16 chains. The missing problem is control of
prefix fibers over all nondegenerate rational points of (1.6),
including the explicit point (1.1), and then a rule uniform in depth.

