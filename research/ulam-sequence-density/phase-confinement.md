# Exact phase confinement implies positive natural density

Write $b(n)$ for the indicator of the classical Ulam sequence $U(1,2)$.
Let $`\phi(n)=n\theta\bmod 1`$ for a real $\theta$. Suppose there is a
set $B\subseteq\mathbb R/\mathbb Z$ that is a finite union of intervals
with rational endpoints and is sum-free, in the sense that
$`(B+B)\cap B=\varnothing`$. If all but finitely many Ulam numbers have
phase in $B$, then $U$ has positive natural density and eventually
bounded gaps.

## Reduction to a finite-state recurrence

Let $`F=\{s\in U:\phi(s)\notin B\}`$ and $K=\max F$. There is an
exception since the membership of 1, 2 and 3 is incompatible with all
three phases lying in a sum-free set. For $n>2K$ with $\phi(n)\in B$,
every representation of $n$ by distinct Ulam summands has exactly one
summand in $F$. Two summands outside $F$ have sum phase in $B+B$, and two
summands in $F$ have sum at most $2K$. Each $s\in F$ with $n-s\in U$
therefore contributes one distinct representation. For $n>2K$ with
$\phi(n)\notin B$, membership fails by the definition of $F$. Together
these facts give the exact update

```math
b(n)=\mathbf1_{\{\phi(n)\in B\}}
\mathbf1_{\left\{\sum_{s\in F}b(n-s)=1\right\}}.
```

A block of $K$ consecutive zeros after the start of this recurrence
would force all subsequent bits to be zero. The classical sequence is
infinite since the sum of the two largest members of a finite prefix is
uniquely represented in that prefix and exceeds its maximum. Thus the
lower natural density is at least $1/K$.

## The frequency of 1 exists

For rational $\theta$, the gate $`\mathbf1_{\{\phi(n)\in B\}}`$ is
periodic. The last $K$ bits and the index modulo the gate period form
a finite autonomous state, so the tail is eventually periodic.

For irrational $\theta$, choose a positive integer $m$ clearing the
denominators of the endpoints of $B$, and write $m\theta=p+\alpha$
with $p$ integral and $0<\alpha<1$. No positive integer $n$ hits any
endpoint. The gate depends exactly on the residue
$`r_n=\lfloor mn\theta\rfloor\bmod m`$, which identifies the open
arc between consecutive multiples of $1/m$ containing $\phi(n)$.
Let

```math
w_n=\lfloor(n+1)\alpha\rfloor-\lfloor n\alpha\rfloor.
```

The update for the residue is $r_{n+1}=r_n+p+w_n\bmod m$, where the
right side is reduced modulo $m$. Thus the state consisting of $r_n$
and the last $K$ bits gives a deterministic finite-state transducer
from the mechanical Sturmian word $w$ to the tail of $b$. At each
step it emits $b(n)$ using the stored residue and previous bits,
then shifts the bit memory and updates the residue using the input
letter $w_n$. The state is initialized at any fixed $n>2K$. The
mechanical input beginning at that index is a suffix of the same
irrational Sturmian word.

Sturmian words satisfy Boshernitzan's condition. Theorem 7.1 of
[Berthé, Goulet-Ouellet, Karimov, Perrin and Vahanwala, arXiv:2606.30013v1](https://arxiv.org/abs/2606.30013v1)
ensures factor frequencies for an infinite deterministic transducer
output on such an input. In particular the frequency of the bit 1
exists in $b$, and it is at least $1/K$.

[The component argument](sturmian-components.md) gives an independent
finite-state reduction to Boshernitzan's theorem and shows that the
possible limiting densities for fixed parameters form a finite subset
of $\mathbb Q+\theta\mathbb Q$.

## The remaining phase issue

For $B=(1/3,2/3)$ the sum-free property is immediate. The hypothesis
here requires only finitely many Ulam phases outside the exact
sum-free set. [Gibbs's conjecture](https://vixra.org/pdf/1508.0045v2.pdf)
allows arbitrarily late outliers approaching the endpoints. If the
Gibbs conjecture holds, for every positive rational $\varepsilon<1/12$
there is a cutoff $K(\varepsilon)$ after which all Ulam phases are
within $\varepsilon$ of $[1/3,2/3]$. For targets whose phases lie in
$(1/3+2\varepsilon,2/3-2\varepsilon)$ beyond twice that cutoff,
two summands past the cutoff cannot reach the target phase. The
unique-sum update there uses only the fixed shifts at most
$K(\varepsilon)$, with the actual previous bits. Targets outside
$[1/3-\varepsilon,2/3+\varepsilon]$ have bit zero. The discrepancy
positions for the exact-band masked update are consequently confined
to boundary bands of total length $6\varepsilon$. For irrational
$\theta$, their upper density is at most $6\varepsilon$ by
equidistribution.

The bit at a boundary discrepancy is also part of the input state
for later updates. Passing to a limit of truncated models requires
control of that effect. The proof above gives the exact finite
exception case and leaves that stability question open.

## A single boundary correction can change a model's limiting density

In the truncated model, take $K=51$, all true shifts at most $K$, and
the gate $\phi(n)\in(1/3,2/3)$ with $\theta=221/540$. Represent the
51 previous bits by an integer whose bit at position $s-1$ corresponds
to the bit at lag $s$. The gate is 540-periodic and the next bit is 1
exactly when the gate is open and there is one selected predecessor.

[The orbit verifier](phase_orbits.py) checks the transition over one
period at the same starting phase. The states 163840 and 21990232555520
form a two-cycle with 61 output ones across the two periods. The state
21990232719360 is fixed by the period transition with 61 output ones
in each period. From state 163840, toggling just the output at position
79 of the period, whose phase is $179/540$, sends the model to the fixed
state at the end of that period. All following updates can be exact.
Since the first orbit returns to state 163840 every second period, this
correction can be delayed arbitrarily far. Its distance from the phase
boundary is $1/540$, and it changes the limiting density from $61/1080$
to $61/540$. This is an exact statement about the rational truncated
model. It shows that even phase-localized discrepancies can change a
model's output frequency permanently.

In fact, exterior positive corrections alone can also destroy a live
orbit. The same verifier adds four bits at positions 224, 316, 338 and
360 during a period starting in state 21990232719360. The resulting
end state is zero. Starting from zero, adding two bits at positions
202 and 338 returns to state 21990232719360 after one period. All these
added bits have phases outside the open gate and within $4/540$ of
one of its endpoints. Alternating increasingly dominant blocks of
the zero and positive orbits using these transitions gives a word
whose prefix densities have subsequential limits 0 and $61/540$.
The lengths can grow doubly exponentially in the number of switches,
so there are only $O(\log\log N)$ correction sites up to $N$. A sign
restriction on corrections is therefore insufficient even in this
phase-localized example.

Run the orbit checks with `python3 -B phase_orbits.py`.

## An exact circle solution for the cutoff at 51

For every irrational $\theta$ strictly between $2219/5422$ and
$35725/87292$, the model with shifts at most 51 also has an exact
rotation coding. Take the 34 ordered endpoints
$1/3+k\theta\bmod 1$ specified in [the fixed-point verifier](phase_fixed_point.py)
and let $J$ be the union of the 17 open intervals between alternate
consecutive endpoints. On each of the 277 cells cut out by the gate,
these endpoints and their translates by every shift, the verifier
checks the phase equation

```math
\mathbf1_J(x)=\mathbf1_{(1/3,2/3)}(x)
\mathbf1_{\left\{\sum_{s\in U\cap[1,51]}\mathbf1_J(x-s\theta)=1\right\}}.
```

All cuts are affine in $\theta$ with a fixed order over the specified
interval, so the checks at a rational interior sample apply throughout.
At irrational slope the orbit of 0 never hits any relevant internal
cut, since every one has rational part $1/3$ or $2/3$ modulo an
integer. The equation gives the exact truncated update along that
orbit. The lengths of the intervals sum to $142\theta-58$, hence
equidistribution gives this natural density for the reference word.

At phase $1237/4000$ the same verifier finds exactly one small-summand
representation, using 48, and excludes the phase from $J+J$. These
checks persist on an open phase interval. If the genuine prefix
through 51 were continued by exactly this rotation word, arbitrarily
large targets in that phase interval would have to be added by the
full greedy rule. The gated reference therefore fails to continue the
true prefix. Run the certificate with `python3 -B phase_fixed_point.py`.

## Synchronization for the exact model with cutoff 69

Put $\theta_0=350477575/856371966$. For every irrational slope with
$`|\theta-\theta_0|<10^{-10}`$, the exact gated model with all genuine
shifts at most 69 has only two possible tail behaviors. It either
becomes identically zero or agrees eventually with a fixed circle
coding of density $550\theta-225$.

[The fixed-point verifier](phase_fixed_point.py) checks a reference
word on 44 intervals with endpoints $2/3+k\theta$ modulo 1, using
the same affine-cell check as for the model with cutoff 51. It applies
on the slope interval $(2219/5422,35725/87292)$, which contains the
entire stated neighborhood of $\theta_0$.

[The state-rank verifier](phase_state_rank.cpp) analyzes the rotation
starting at phase $502/5422$ with slope $\theta_0$. It includes 69 past
steps and 16,696 forward steps. All phases in this finite word are
at distance greater than $1/200000$ from the endpoints of the gate.
Changing the initial phase by less than $10^{-6}$ and the slope by
less than $10^{-10}$ therefore preserves the entire gate word. The
verifier enumerates all $2^{21}$ initial memories allowed by the
69 past gates. The forward word maps them to exactly two memories,
one of which is zero.

Every trajectory, once its memory contains only output bits, visits
the stated open initial phase interval by irrational rotation. The
reference trajectory also passes through every such word and cannot
map to zero, since it has positive density and zero memory is
absorbing. The other endpoint memory is therefore exactly the
reference memory. Continuing deterministically from either endpoint
gives the two claimed tail behaviors. This synchronization concerns
the exact truncated model. The original recurrence includes further
shifts and uncontrolled boundary updates.

```sh
c++ -std=c++20 -O3 phase_state_rank.cpp -o /tmp/ulam-phase-state-rank
/tmp/ulam-phase-state-rank
```

## Recovery from narrow boundary changes at cutoff 69

Keep the same irrational slope within $10^{-10}$ of $\theta_0$.
Start with the cutoff-69 reference history. At any site with phase
within $1/20000$ of either endpoint of the central third, allow the
output bit to be replaced arbitrarily. Elsewhere use the exact
cutoff-69 rule.

The [fixed-profile verifier](phase_fixed_point.py) checks the response
to one changed bit, starting on either side of each endpoint. A change
near $1/3$ affects 37 positions, reduces the total output count by one,
and returns to the reference memory within 333 steps. A change near
$2/3$ affects 88 positions, preserves the total count, and returns
within 794 steps. These counts are constant on the four phase intervals.
The verifier tests all gate cuts and reference-profile cuts translated
by each time offset in the simulation. Over the slope range the only
cuts entering the four intervals are the endpoints separating their
two sides. An irrational orbit starting at phase 0 avoids the cuts
themselves.

No two eligible sites occur within 794 steps of one another. For each
lag from 1 through 794 the verifier bounds its phase distance from
$`\{0,1/3,2/3\}`$ strictly above $1/10000$. That is wider than the
largest combined deviation of two eligible phases from their respective
endpoints. Hence the single-change responses never overlap. By time
$N$, the edited count is the reference count minus the number of actual
changes near $1/3$, up to an error of at most 88 from a response still
in progress. In particular the edited lower density is at least
$`550\theta-225-1/10000`$ by equidistribution. If the changes near
$1/3$ have zero density, the edited sequence has density
$`550\theta-225`$.

The scope of this recovery result is the fixed cutoff-69 rule and
the stated narrow intervals. The genuine sequence uses additional
shifts with phases well outside those intervals.

## A zero-density completion satisfying the core constraints

One fixed phase relaxation also admits a zero-density completion of a
long genuine prefix. Use the rational phase $350477575/856371966$, a
shift cutoff of 4095, and $\varepsilon=1/50$. The relaxation requires
all selected phases beyond the cutoff to lie in
$[1/3-\varepsilon,2/3+\varepsilon]$. At targets above twice the cutoff
with phase in $(1/3+2\varepsilon,2/3-2\varepsilon)$ it enforces the
exact-one rule using all 382 known shifts.

The [phase probe](phase_probe.cpp) verifies a completion that agrees
with $U$ through one million, appends the indicated finite list and
then has a full memory of zeros. It also verifies that from a zero
memory one can insert the two positions 2000072 and 2000074 and return
to zero memory. The rational denominator $q=856371966$ is a period
of every phase condition. It follows that the two-point pulse may
be translated by $q j^2$ for each nonnegative integer $j$ and
inserted after the extinction without interactions between pulses.
The resulting word is infinite, has zero natural density, preserves
the genuine prefix, and satisfies the stated core constraints.

This completion uses free boundary bits. The full Ulam recurrence
fixes those bits by counting the remaining large-summand pairs. It is
that additional information which this relaxation leaves out.
