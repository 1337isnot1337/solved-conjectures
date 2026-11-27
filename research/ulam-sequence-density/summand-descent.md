# Descent from the smallest available Ulam summand

For a represented target $n$, let $m(n)$ be its smallest available
summand and put $`g(n)=n-m(n)`$. Both summands are Ulam terms and
$`m(n)<g(n)`$. Suppose $`f=m(n)>2`$ and let $`f=a+b`$ be the
unique pair for $f$, with $`a<b`$.

Both $n-a$ and $n-b$ have at least two distinct unordered
representations. The first is represented by $b,g(n)$ and the second
by $a,g(n)$. If either target were itself Ulam, adjoining the
removed summand would represent $n$ with a summand smaller than $f$.
Thus both targets are omitted, and their displayed representations
force the full rule to give at least two pairs at each.

Iterate the map $`n\mapsto n-b`$ until $`m(n)\le L`$, for fixed
$`L\ge2`$. Each step at least halves the smallest available
summand, since $`m(n-b)\le a<f/2`$. The largest available summand
is nondecreasing since $`(n-b)-m(n-b)\ge n-b-a=g(n)`$.
Every represented target with smallest summand above $L$ reaches a
crowded target with a summand at most $L$.

## Counting the preimages at a density record

For a cutoff $X$, each represented target through $X$ belongs to the
preimage of one terminal target. Count the terminal target itself
in that preimage. There are at most $`A(L)A(X)`$ terminal targets.
Consequently a uniform bound on the average preimage size along an
unbounded sequence of integer density records would bound the
ratio of crowded targets to Ulam terms along those records. The
[record-low theorem](record-lows.md) would then give positive lower
natural density. This requires an average over terminal targets.

A uniform bound on the *maximum* preimage size would already imply
bounded gaps. To see this, take a term $x$ followed by a gap of length
$`G<x`$. For each Ulam term $`s<G`$, the target $x+s$ has smallest
summand $s$. A smaller summand would require a Ulam term strictly
inside the gap and larger than $x$. The descent stays within the
gap and replaces $s$ by its own smaller parent at each step. There
are $A(G-1)$ starting targets and at most $A(L)$ terminal ones.
Some terminal target therefore has preimage size at least
$`A(G-1)/A(L)`$. For all gaps after the two seeds the inequality
$G<x$ follows from the sum of the two largest preceding terms.
Hence unbounded gaps force unbounded maximum preimage sizes for
every fixed $L$.

## Exact prefix measurement

The [phase probe](phase_probe.cpp) evaluates the smallest summand at
every represented target through ten million. It checks the descent
inequalities and the omission of each computed child. The exact
phase partition searches both sides of every possible pair for a
target inside the middle third. Outside it the probe searches the
smaller summand in increasing order. In total 8,138,684 targets have
at least one restricted representation in this prefix.

| $L$ | Represented targets with $m(n)>L$ | Largest preimage through ten million |
| ---: | ---: | ---: |
| 2 | 6,657,954 | 100 |
| 69 | 1,270,428 | 19 |
| 256 | 239,826 | 11 |
| 1,024 | 25,838 | 4 |
| 4,096 | 5,414 | 3 |

The middle column counts all represented targets above the summand
cutoff, including those with exactly one pair. The average preimage
bound needed at unbounded record scales is open.
