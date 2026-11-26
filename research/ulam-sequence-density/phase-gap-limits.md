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
