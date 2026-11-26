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

Run the orbit checks with `python3 -B phase_orbits.py`.
