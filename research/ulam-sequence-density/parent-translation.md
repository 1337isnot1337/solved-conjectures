# Counting terms between an Ulam number and its larger parent

For an accepted term $`n=p+q`$ with its distinct parents $`p<q`$,
write $`A(x)=|U\cap[1,x]|`$ and define the deficit

```math
\Delta(p,q)=A(p)+A(q)-A(p+q).
```

A related proposed estimate is recorded in the
[parent-translation route](https://www.proofatlas.ai/collaboration/ulam-sequence-density/).
The factor 2 with smaller-parent cutoff 4096 fails at genuine pairs.
The [longer audit](long-prefix-audit.md) also refutes factor 2 at
cutoff 8192. The same comparison argument applies to estimates with a
larger cutoff or constant after checking an appropriate finite base.

## Counterexamples through one billion

Two exact generators agree at every integer through $10^9$ and count
73,976,842 members there. This agrees with the published finite count.
[Gibbs and McCranie, Table 1](https://vixra.org/pdf/1711.0134v1.pdf)

There are exactly two violations of $`\Delta(p,q)\le2\sqrt p`$ with
$`p\ge4096`$ in this range. Each pair is checked directly for uniqueness.

| Target | Smaller parent | Larger parent | $A(p)$ | $A(q)$ | $A(p+q)$ | Deficit |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 569,375,099 | 4,118 | 569,370,981 | 384 | 42,116,954 | 42,117,203 | 135 |
| 581,862,197 | 4,118 | 581,858,079 | 384 | 43,039,552 | 43,039,793 | 143 |

Both squared deficits exceed $`4\cdot4118=16472`$. The second gives
the maximum ratio $`143/\sqrt{4118}`$ among these smaller parents
through one billion. With smaller parents at least 8,192, the largest
ratio is $`179/\sqrt{9193}`$ at target 412,934,115, below 2.

## The comparison argument

**Proposition.** Assume $`\Delta(p,q)\le3\sqrt p`$ for every actual
parent pair with $`p\ge8192`$. Then the lower natural density of $U$
is at least $1/10000$.

Set $`L=8192`$, $`T=(20L)^2`$, and $`F(x)=x/10000+(21/4)\sqrt x`$.
The exact [phase probe](phase_probe.cpp) checks $`A(x)\ge x/15`$ for
all integers from $L$ through $10^8$, giving $`A(x)\ge F(x)`$
there. It counts 7,399,353 terms through $10^8$, which exceeds
$F(2T)$. Monotonicity covers the rest of the finite base range up to
$T+L$.

Induct on accepted terms $n>T+L$. When $`p\ge L`$, both parents
satisfy the induction inequality and

```math
A(n)\ge F(p)+F(q)-3\sqrt p\ge F(n).
```

The last inequality follows from
$`\sqrt p+\sqrt q-\sqrt{p+q}\ge(2-\sqrt2)\sqrt p`$ and
$`(21/4)(2-\sqrt2)>3`$. When $p<L$, the larger parent satisfies
$q>T$ and $`A(n)\ge A(q)+1`$. The increase of the comparison
function is at most

```math
F(q+p)-F(q)\le p/10000+\frac{21p}{8\sqrt q}
\le L/10000+21/160<1.
```

This gives $`A(n)\ge F(n)`$ at every accepted term from $L$ onward.
For an arbitrary cutoff $x$, the first accepted $n>x$ has
$`A(x)=A(n)-1`$, which proves the lower density implication.

## Exact replays

The [shorter probe](phase_probe.cpp) tests the bounds below through
$10^8$ by integer comparison.

| Parents tested through target $10^8$ | Bound checked | Largest positive deficit divided by $\sqrt p$ | Target |
| --- | ---: | ---: | ---: |
| All | 4 | $57/\sqrt{339}$ | 1,137,338 |
| $`p\ge4096`$ | 2 | $127/\sqrt{4118}$ | 89,941,075 |

The [billion-position replay](parent_translation_scan.cpp) counts all
pairs up to saturation at two. Targets in the open middle third must
use at least one outlier from that phase band. For other targets it
first tries the early smaller summands and then the possible interior
pairs from sorted phase buckets. If $x$ is below $1/3$, both interior
phases must sum to $1+x$ and each lies between $1/3+x$ and $2/3$.
If $x$ is above $2/3$, each lies between $1/3$ and $x-1/3$.
Targets exactly at either endpoint have no interior pair. The replay
also tests all pairs involving outliers that were skipped earlier.

Run from a scratch directory with the absolute checkout path set in
`repo` and a C++20 compiler. The bit vector uses native 64-bit words,
with one membership bit per integer including zero.

```sh
c++ -std=c++20 -O3 "$repo/research/ulam-sequence-density/parent_translation_scan.cpp" -o ulam-scan
./ulam-scan 1000000000 members1b-packed.bin
```

For the independent replay, use Knuth's implementation of Gibbs's
algorithm with its default phase approximation. The [CWEB change
file](knuth-parent-translation.ch) adds output of the settled bits and
the six requested prefix counts. It also counts missing targets and
adjacent pairs of misses. It preserves the original decisions.
The source used has SHA-256
`fbb7b8b8d523c2afd012bf641ee4619fc8b2b7f6b118a4e87b18cdc2e962d189`.
[Knuth's source](https://www-cs-faculty.stanford.edu/~knuth/programs/ulam-gibbs.w)

```sh
curl -fsSLO https://www-cs-faculty.stanford.edu/~knuth/programs/ulam-gibbs.w
cp "$repo/research/ulam-sequence-density/knuth-parent-translation.ch" .
ctangle -bp ulam-gibbs.w knuth-parent-translation.ch
cc -std=gnu99 -O3 ulam-gibbs.c -lm -o ulam-gibbs
./ulam-gibbs m0 74000000
cmp members1b-packed.bin knuth-members1b-packed.bin
```

The little-endian bit vector has SHA-256
`6cef45b1b92d24e3ac686d2bc346f82bab744facb5b8df74f947d71c6b68e7ea`.
The independent replay finds 186,241,265 unrepresented integers from
3 through one billion, with no two consecutive. This extends the
earlier [adjacent-target test](pair-counts.md).

The inclusion part of the full rule is essential to this route. Keep
a long genuine prefix ending in its two latest terms $p,q$ with
$`p\ge L`$. Append only $p+q$ after $q$. It has exactly one old pair
because it is the largest sum of distinct members. All selected
terms in this finite word therefore have their required unique
representations. Its local increment at $p+q$ is one, so the
deficit is $`A(p)-1`$, violating the proposed bound whenever
$`A(p)>1+3\sqrt p`$. The omitted compulsory terms before $p+q$
are the additional constraint. An all-scale bound on the parent
deficit and a convergence argument for the actual sequence remain
open.
