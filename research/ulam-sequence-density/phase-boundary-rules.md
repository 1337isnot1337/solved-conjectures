# The two boundary intervals in the phase recurrence

Let $`0<\varepsilon<1/12`$ and let $`\phi(n)=n\theta\bmod1`$. Assume
all Ulam terms above $K$ have phase in the interval
$`C=[1/3-\varepsilon,2/3+\varepsilon]`$. Split it into the open
interval $`J=(1/3+2\varepsilon,2/3-2\varepsilon)`$ and its two
closed boundary intervals $L$ and $R$, with $L$ on the lower side.

For $n>2K$, put $`c(n)=\sum_{s\in U\cap[1,K]}u(n-s)`$. It counts
each representation using a term at most $K$ once. Let $r_L(n)$ and
$r_R(n)$ count the distinct unordered pairs representing $n$ with
both summands above $K$ in the indicated phase interval.

For every such target whose phase is in $C$, the full rule tests
exactly one representation. The count is $c(n)$ in $J$, is
$`c(n)+r_R(n)`$ in $L$, and is $`c(n)+r_L(n)`$ in $R$.

In fact $C+C$ misses $J$. For a target in $L$, two phases from $C$
can reach it only after wrapping once around the circle. Their sum
before wrapping is at least $4/3-\varepsilon$, while each is at most
$2/3+\varepsilon$. Each is therefore at least $2/3-2\varepsilon$ and
belongs to $R$. For a target in $R$, their sum is at most
$2/3+\varepsilon$ without wrapping. Each is at least
$1/3-\varepsilon$, so each is at most $1/3+2\varepsilon$ and belongs
to $L$. The inequalities separating the wrapped and unwrapped portions
use $4\varepsilon<1/3$. Thus the missing long-pair counts inside $C$
occur only between the two boundary intervals. Any term above $2K$
whose previous gap exceeds $K$ must arise from a pair in the opposite
boundary interval, since $c(n)=0$ in that case.

Separate numerical scales give a narrower interval with the same
short rule. If all terms above $K$ lie in $C_\varepsilon$ and all terms
above $T\ge K$ lie in $C_\eta$, any pair of terms above $K$ at a target
$n>2T$ uses one member from $C_\eta$. Its phase lies in
$`C_\varepsilon+C_\eta`$, which misses the central third trimmed by
$\varepsilon+\eta$ at each end. Under Gibbs's conjecture one can let
$\eta$ tend to zero with $K$ fixed. The symmetric trim by
$2\varepsilon$ is needed only when the two summands have the same
known phase tolerance.

## The full rule forces a pair outside the two restart windows

Assume Gibbs's approximate confinement with
$`1/3<\theta<1/2`$. Fix a window radius $H\ge1$. Consider two
distinct sufficiently large terms $a,b$ each preceded by at least
$H$ omitted integers, with phases sufficiently close to the same
endpoint $`\beta\in\{1/3,2/3\}`$. Then one of $a+b$ and $a+b+1$
must have a representation using neither the pair $a,b$ nor the pair
$1,a+b$. In that representation the two summands cannot both lie in
windows of radius $H$ centered at $a$ and $b$, in either order.

Indeed if $a+b$ has multiple representations, use any second one.
Otherwise the greedy rule selects $a+b$. The phases of $a+1$,
$b+1$ and $a+b+1$ lie outside the closed central third with positive
margin, since both $\beta+\theta$ and $2\beta+\theta$ do so modulo 1.
Approximate confinement eventually excludes all three. The latter
exclusion requires a second pair besides $1,a+b$. A local pair at
either target would have nonnegative offsets from the two window
centers, because the preceding positions are empty. For $a+b$ the
offsets would both have to be zero. For $a+b+1$ one would have to
be one, contrary to the exclusion of $a+1$ and $b+1$. As shown by
the [gap-limit argument](phase-gap-limits.md), any sequence of gap
lengths tending to infinity has a subsequence with the required
phases. The assertion uses both the inclusion and omission parts of
the full rule.

## A finite extinction with full uniqueness at every selected term

Take $K=20,000$, $\varepsilon=1/80$ and the rational phase
$`\theta=350477575/856371966`$. Keep the genuine sequence through
49,999,999. Starting at 50,000,000, keep exactly the 72 offsets listed
in [the phase probe](phase_probe.cpp). The last is 1555. All terms
above $K$ lie in $C$. At every target above $2K$ in $J$ the full
exact-one rule holds. Every selected nonseed also has exactly one
representation by two distinct selected terms, including at the two
selected offsets in the boundary intervals. Omitted targets outside
$J$ are free in this test.

The verifier checks confinement in the genuine prefix, then checks
the core equality through the end of the last $K$-step memory. At
each selected boundary target it scans all smaller possible summands
against the edited membership word and counts the full representations.
No later core target can see any small-shift predecessor after the
memory has emptied. Thus retaining the selected-term condition for the
full rule still permits finite extinction if the omitted exterior
targets are free.

The same check succeeds with $K=100,000$ and $\varepsilon=1/130$.
It preserves the same genuine prefix and keeps a different list of
457 offsets ending at 7842. Both certificates were found by solving
finite Boolean constraints. The replay checks the resulting lists
directly with integer arithmetic.

Starting with zero memory, inserting a single selected position at
phase $1/3$ also gives a finite response. Force the recurrence on $J$
for $K=20,000$ and $\varepsilon=1/80$ and set every other exterior bit
to zero. The verifier gets 81 selected
positions including the seed, ending at offset 2991. Phase $2/3$ gives
65 positions ending at offset 1226. Both responses clear the memory.
With $q=856371966$, the start $q/3$ has phase $1/3$ and exceeds the
extinction cutoff. Repeating that response at $`q/3+qj^2`$ for
nonnegative integers $j$ gives an infinite completion of natural
density zero. It satisfies confinement and the full core rule. Its
nonseed pulse entries are all in $J$, so each of them has one full
representation. The prescribed starts are new free boundary selections.
The full original rule at the starts and the omitted exterior targets
is still needed to determine the genuine tail.

The last terms of the first two pulses have exactly one representation
each. Their sum also has exactly one representation in this relaxation.
It exceeds every sum using a term before the pulses, is too large for
two terms in the first pulse and too small for two in the second. A
pair from both pulses reaches it only if both terms take the largest
offset. The next pulse starts beyond the sum. Its phase is outside
$C$, since $J+J$ is disjoint from $C$ modulo 1. This supplies an exterior
singleton even with both summands fully verified as selected terms.
