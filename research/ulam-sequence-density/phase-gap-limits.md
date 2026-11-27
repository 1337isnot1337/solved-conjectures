# Limits of the phase model at long Ulam gaps

Let $u(n)$ be the indicator of the classical Ulam sequence $U$. The phase
results below assume Gibbs's approximate confinement conjecture with an
irrational frequency $\theta$. Write $`\phi(n)=n\theta\bmod1`$ on the circle,
and let $`B=(1/3,2/3)`$. For every $\varepsilon>0$ the conjecture puts all
but finitely many Ulam phases in the closed interval $C_\varepsilon$
from $1/3-\varepsilon$ to $2/3+\varepsilon$. It asserts no rate of
confinement. [Gibbs](https://vixra.org/pdf/1508.0045v2.pdf)

## Two possible limits immediately after arbitrarily long gaps

For $`\beta\in\{1/3,2/3\}`$, define $`v_\beta(0)=1`$, set
$`v_\beta(t)=0`$ for $t<0$, and compute recursively for $t>0$ by

```math
v_\beta(t)=\mathbf 1_B(\beta+t\theta)\,
   \mathbf 1_{\left\{\,\sum_{s\in U\cap[1,t]}v_\beta(t-s)=1\,\right\}}.
```

The argument of the phase indicator is taken modulo 1. If there are
arbitrarily long Ulam gaps, there are endpoints $x_j\in U$ of gaps
tending to infinity and a choice of $\beta$ for which the centered words
$`(u(x_j+t))_{t\in\mathbb Z}`$ converge to $v_\beta$ on every finite window.
In fact every sequence of endpoints of gaps tending to infinity has
a subsequence with one of these two limits.

For the proof, fix $\varepsilon$ small and choose $K$ so every term above
$K$ has phase in $C_\varepsilon$. A term ending a gap of length greater
than $K$ has both parents above $K$. A smaller parent $s\le K$ would put
the larger parent $x_j-s$ strictly in the gap. Hence for all large $j$
the phase $\phi(x_j)$ is in $`C_\varepsilon\cap(C_\varepsilon+C_\varepsilon)`$.
The intersection of these closed sets as $\varepsilon$ decreases to zero
is $`\{1/3,2/3\}`$. Extract a subsequence with $\phi(x_j)\to\beta$.

Each fixed positive offset $t$ has limiting phase $\beta+t\theta$ away
from the two endpoints by irrationality. If it lies outside $B$, eventual
confinement gives $`u(x_j+t)=0`$ for all sufficiently large $j$. If it lies
in $B$, choose $\varepsilon$ small enough that it and a neighborhood lie
outside $`C_\varepsilon+C_\varepsilon`$. Choose the corresponding $K\ge t$.
For all sufficiently large $j$, every representation of $x_j+t$ must use
one term $s\le K$. The other term is distinct from it because $x_j+t>2K$.
If $s>t$ the other summand is in the gap. The remaining possibilities
are exactly the terms $s\le t$ in the displayed formula. Induction on $t$
gives eventual equality at each nonnegative offset. Negative offsets
are eventually zero by the choice of gaps.

Only shifts $s$ with $\phi(s)\notin B$ can contribute in this recurrence.
Every selected site in the limiting word has phase in the closed band.
The sum of an interior phase and a closed-band phase misses the open
band. In particular, the [phase probe](phase_probe.cpp) computes both words
over a finite range from the genuine prefix. The counts include the seed
at offset zero.

| Largest offset | Count for $\beta=1/3$ | Count for $\beta=2/3$ |
| ---: | ---: | ---: |
| 100,000 | 7,382 | 7,558 |
| 1,000,000 | 74,038 | 74,048 |
| 10,000,000 | 739,569 | 740,453 |

These computations use $`\theta_0=350477575/856371966`$. Put
$`q=856371966`$ and $`L=10^7`$. The fraction is reduced and $L<q/3$, so
none of the relevant nonzero offsets lies on a gate boundary. Each
tested phase differs from either endpoint by at least $1/(3q)$ on
the circle. For any $\theta$ within $1/(6qL)$ of $\theta_0$, the
same gates apply up to $L$. The counts give exact finite predictions
under the displayed gap-limit hypothesis for those values of $\theta$.
The asymptotic counts in the two limiting words are open.

There is also an infinitude criterion. For $\beta=1/3$ it suffices that
infinitely many terms of $U$ have phase below $1/3$. For $\beta=2/3$
it suffices that infinitely many have phase above $2/3$. For example,
for $\beta=1/3$, test $t=s$ along the stated outliers. Their phases
approach $1/3$ from below, so the target phase is in $B$ for all large
$s$ and the seed gives a representation in the displayed recurrence.
If the limiting word had finite support, its other selected offsets
would be finitely many $a>0$, each of phase strictly inside $B$.
For each such $a$, if $s-a\in U$, its phase approaches the closed band.
The sum of this phase with the fixed interior phase at $a$ stays
outside $B$ for large $s$. Thus $v_\beta(s)=1$ for large $s$, a
contradiction. The proof at the upper endpoint uses target phases
approaching $1/3$ from above. This criterion gives no bound on gaps
within the limiting words.

## Atoms in the phase distribution among selected terms

Under the same approximate confinement, any atom in a subsequential
limit of the normalized phase distributions

```math
\mu_N=\frac{1}{A(N)}\sum_{n\in U\cap[1,N]}\delta_{\phi(n)}
```

lies at a selected phase of one of the two gap words with finite
support. Every selected phase of that finite word then has the same
atom mass. In particular, if both gap words have infinite support,
all subsequential limits of $\mu_N$ are atomless. This applies if
both sides of the central third contain infinitely many outliers.

To prove the statement, suppose along some subsequence $`\mu_N\to\mu`$
and $`\mu(\{x\})=w>0`$. Choose shrinking intervals about $x$ and a
further subsequence so their masses converge to $w$, and so the masses
of their translates by each fixed $t\theta$ converge to
$`\mu(\{x+t\theta\})`$. This is possible by choosing radii whose
translated endpoints avoid the countably many atoms of $\mu$, then
using a diagonal subsequence. Sample a uniform member of $U\cap[1,N]$
whose phase is in the shrinking interval and center its membership
word there. Extract a limit law $P$ on binary words $v$. The central
bit equals one. For each fixed integer $t$, changing the sample
count to a count of selected sites at offset $t$ gives

```math
wP(v(t)=1)\le\mu(\{x+t\theta\}).
```

The sites shifted past the sample endpoints contribute at most
$|t|/A(N)$ to the count. The phases on the right are distinct, so
the expected number of ones in $v$ is at most $1/w$. Almost every
word in this law has finite nonempty support.

At every fixed site of interior phase, the same finite-shift argument
as in the gap-limit proof passes the exact-one rule to this law. At
every fixed site outside the closed band it passes a zero. The first
one of a finite word therefore has phase $\beta$ at a band endpoint.
There is at most one endpoint on the orbit of $x$ because $\theta$ is
irrational. From that first one onward the word equals the corresponding
$v_\beta$, translated to start there. Thus all of its selected phases
are atoms of mass at least $w$ by the counting inequality. Applying
the same proof with each of those phases as the center reverses the
inequality and gives equality of their masses.

When both gap words are infinite, the distribution of preceding gap
lengths among the selected terms is tight. In fact

```math
\lim_{L\to\infty}\limsup_{N\to\infty}
\frac{\#\{i\ge2:u_i\le N,\ u_i-u_{i-1}>L\}}{A(N)}=0.
```

An endpoint after a gap longer than $L$ uses both parents above $L$.
Approximate confinement puts its phase arbitrarily close to one of
the two endpoints as $L$ grows, uniformly in the target. If the ratio
stayed bounded below along increasing $L$ and $N$, extract a weakly
convergent subsequence of $\mu_N$. Every fixed closed neighborhood of
the two endpoints would carry that much mass in the limit. Decreasing
the neighborhoods to the two points would give an atom. A density
proof using the empirical gap laws also needs control of the first
moment of the gap lengths.

## When a post-gap response would give a lower bound

The following criterion is unconditional. Suppose there are fixed
$c>0$ and $L\ge1$ such that for every preceding gap
$`g_i=u_i-u_{i-1}\ge L`$, the interval $`[u_i,u_i+g_i)`$ contains at
least $`c g_i`$ Ulam numbers. Then

```math
\underline d(U)\ge\frac{c}{6+3cL}.
```

To prove this, fix $N$ and stop before the first post-gap interval
whose right endpoint exceeds $N$. If its left endpoint is $u_i$,
then $`N<u_i+g_i\le3u_{i-1}`$ because successive Ulam numbers have
ratio at most two. The earlier gaps sum to more than $N/3-1$.
Discarding gaps shorter than $L$ loses at most $L A(N)$ in length.

From the remaining post-gap intervals choose the earliest, discard
the ones that intersect it and iterate from left to right. The
original preceding gaps of the discarded intervals lie entirely
inside the chosen interval. Indeed they start at or after the chosen
left endpoint, which is an earlier Ulam term. They end before its
right endpoint by intersection. The original gaps are disjoint, so
the total discarded gap length is at most the length of the chosen
interval. The chosen intervals are disjoint and account for at least
half the retained total. They contain at least
$`c(N/3-1-LA(N))/2`$ selected positions, giving the claimed bound.
This reduces the required count to a window proportional to the gap.
The gap-word theorem gives agreement on every fixed window when the
gap tends to infinity.

The [billion-position prefix](parent-translation.md) gives the
following exact tests. The replay includes every gap whose post-gap
interval is wholly inside the computed prefix.

| Minimum gap length | Gaps tested | Least count divided by length in the next window | Endpoint of the gap attaining the minimum |
| ---: | ---: | ---: | ---: |
| 100 | 323,692 | 1/100 | 413,955,454 |
| 200 | 18,900 | 7/210 | 237,842,638 |
| 300 | 1,527 | 15/315 | 33,312,639 |
| 400 | 95 | 25/425 | 358,952,480 |
| 500 | 67 | 37/530 | 432,151,627 |
| 600 | 8 | 84/1,083 | 966,291,200 |

An all-scale extension of the row with $L=300$ and $c=1/21$ would
give lower density at least $1/1026$. The larger-gap tests currently
have only finitely many instances. After producing the checked
packed prefix, run the [gap replay](gap_response.cpp).

```sh
c++ -std=c++20 -O3 "$repo/research/ulam-sequence-density/gap_response.cpp" -o ulam-gap-response
./ulam-gap-response members1b-packed.bin
```

There is also a scale-dependent version. If for some $`0<a\le1`$
and $c,d>0$ each sufficiently large gap $g$ ending at $u$ is followed
by at least $`d\lfloor cg^a\rfloor`$ selected sites in the interval
of length $`\lfloor cg^a\rfloor`$ starting at $u$, then
$`A(N)\gg N^a`$. Use gaps ending by $`N/(1+c)`$ so their post-gap
intervals are contained in $[1,N]$.
For a chosen post-gap interval of length $b$, its own preceding
gap has length $`O(b^{1/a})`$ and all the discarded gaps it covers
have total length at most $b$. If $B_0$ is the total chosen length,
summing gives the original total at most $`O(B_0^{1/a})`$.
The disjoint chosen intervals give $`A(N)\gg B_0`$. The original total is at
least $`N/(2+2c)-1-LA(N)`$, where $L$ bounds the excluded short gaps.
If this is less than $`N/(4+4c)`$, the short gaps already give a
linear bound. Otherwise $`B_0\gg N^a`$.

For a conditional application, write $`E(L)=\sup_{n\in U,\,n>L}
\mathop{\mathrm{dist}}(\phi(n),\overline B)`$. Suppose $`E(L)=O(L^{-\gamma})`$
for some $\gamma>0$ and $`\|3t\theta\|\ge\kappa t^{-\tau}`$ for
all positive integers $t$ and fixed $\kappa,\tau>0$. If both gap
words have positive lower natural density, then

```math
A(N)\gg N^{\min(1,\gamma/\tau)}.
```

In fact, a gap of length $g$ ends at a phase within $`2E(g-1)`$ of
an endpoint $\beta$. For $t>0$ the phase $\beta+t\theta$ has distance
at least $`\|3t\theta\|/3`$ from both endpoints. For
$`t\le\lfloor c g^{\min(1,\gamma/\tau)}\rfloor`$ with $c>0$ small,
this distance exceeds $`4E(g-1)`$. Consequently an exterior site is
zero by confinement. At an interior site, two summands at least $g$
are impossible by phase, and a short summand above $t$ puts its
partner in the gap. The exact-one decision through this window agrees
with the germ. Its assumed lower density supplies the required
post-gap counts. The rate of phase confinement and the lower
densities of the two germs are additional hypotheses here.

## Word complexity and limiting phase dynamics

Let $p_U(L)$ count distinct membership words of length $L$ in $U$. Under
the same phase hypothesis,

```math
\lim_{L\to\infty}\frac{\log p_U(L)}L=0.
```

To see this, fix $\varepsilon$ and $K$ as above. In positions above
$2K$, the phase forces zeros outside $C_\varepsilon$. In the open
interval $J_\varepsilon=(1/3+2\varepsilon,2/3-2\varepsilon)$ it
forces the exact-one rule with shifts in $`U\cap[1,K]`$. There
are at most $8L+1$ possible gate words of length $L$ marking these two
regions and the remaining boundary region. The four endpoints and
their translates partition the initial phase into at most $4L$
open intervals and $4L$ singleton endpoints. The boundary region
$`C_\varepsilon\setminus J_\varepsilon`$ has length $6\varepsilon$.
Irrational rotation visits it at most $`(6\varepsilon+o(1))L`$
times, uniformly in the initial phase. This follows by uniform
equidistribution for continuous functions and upper approximation of
the interval indicators. Given a gate word, the $K$ bits immediately
before it and these boundary bits determine all other bits. The at most
$2K$ starts below the threshold cost at most $2K$ additional words.
It follows that $`p_U(L)\le 2K+(8L+1)2^{K+(6\varepsilon+o(1))L}`$.
Take $L$ to infinity first, then $\varepsilon$ to zero.

The same argument with phase and membership sampled jointly gives an
infinite-memory recurrence for every interval-distribution limit. Center
the membership word at an index chosen uniformly from an interval whose
length tends to infinity and record its central phase. Each weak limit of
these probability laws is invariant under shifting the word and rotating
the phase by $\theta$. The phase marginal is Haar measure by uniform
equidistribution. At almost every site with phase $x$ outside $B$ the
membership indicator is zero. For almost every phase $x\in B$, the
indicator equals one exactly when one predecessor at lag $s$ is one
among the shifts $s\in U$ with $`x-\phi(s)\in B`$. The latter set
of shifts is finite for each $x\in B$. Choose $\varepsilon$ so that
$x$ is in the trimmed interval, then no $s>K$ can be in that set,
since $\phi(s)\in C_\varepsilon$. For fixed $\varepsilon$, the
finite-shift recurrence passes to a weak limit in the interior of the
trimmed interval. The phase endpoints for its tests and their countably
many shifts have Haar measure zero. Letting $\varepsilon$ decrease to
zero gives the assertion at all sites simultaneously. The zero word
satisfies this limiting recurrence at every phase. Excluding its
occurrence as an interval limit of the genuine sequence would require
more information about the full greedy rule.

## Limits of two finite approaches

The [two-point repeatable pulse](phase-confinement.md) has starts at
$a=2000072$ and $b=a+q$. In that relaxation, $a+b$ lies outside
$C_{1/50}$ and has exactly one representation. Any sum of two terms
before the pulses falls short, and an earlier term plus any of the first two
pulses falls short. The next pulse starts at $a+4q>a+b$. Among the
first two pulses, the starts are the only pair with sum $a+b$.
Thus the core constraints alone allow a pair whose target is outside
the proposed band and admits no second representation at any distance.

An unconditional finite certificate constrains the use of larger-parent
paths for a lower density bound. Direct an edge from the larger parent
to each accepted term and give it the length of the smaller parent.
All paths starting at a term at most one million and using only edges
of length at most one million stay below or at 4,780,104. The phase
probe verifies this by exact reachability up to six million. A first
reachable term beyond six million would have a reachable predecessor
strictly above five million, which the certificate excludes. The sieve
uses an exact phase partition to enumerate pairs. This certificate
depends on no phase conjecture. Positive lower density from such a
path would therefore require a later starting point or larger lags.
