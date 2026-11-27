# A six-memory positive component at cutoff 400

Use the same [central-third recurrence](phase-return-model.md) with
all genuine Ulam shifts at most 400. Let $\theta$ be irrational
within $10^{-16}$ of $`350477575/856371966`$. A class of initial
histories for this model has the exact positive natural density

```math
46763306-114263471\theta.
```

The value at the nominal slope is approximately 0.0802417.
The class includes one-bit initial histories described below.

## First return maps

Write $`\alpha=3\theta-1`$ and use the reduced phase $y$ and the
three colors of the [cutoff-102 certificate](phase-return-model.md).
Its interval $`I=(\ell,h)`$, its interior cut $m$, and its two
first returns depend on the phase gate alone. They apply with all
shifts through 400. Label the lower and upper return types by 0 and 1.
Their durations in integer time are 60,002 and 373,657. Both advance
the color by one modulo 3.

At an entry to $I$, initialize the preceding 400 bits with one
selected site at a lag at most 102 whose phase is in the open gate.
The [verifier](phase_nested_model.py) runs the fixed 400,000-site
word from each such seed. The possible nonzero memories at its end
give 8, 14 and 12 initial memories in the respective colors. For
seeds that give zero memory the subsequent model is zero. From the
nonzero memories take the closure under both first return maps,
measuring memory at the ends of the 400,000-site words. The verifier
finds exactly 70 memories and checks that each image is positive.
This argument certifies the stated class of histories and any
history reaching one of the 70 memories.

## A second return interval

In the coordinate $`z=y-\ell`$, the induced rotation on $I$ has
circumference $`w=h-\ell`$ and step $`h-m`$. The nonwrapping step
has label 0 and the wrapping step has label 1. The second return
interval is $`(\ell_2,h_2)`$ in the $z$ coordinate, with interior cut
$m_2$, where

```math
\ell_2=524327-2301944\alpha,\qquad
m_2=2832856-12437040\alpha,\qquad
h_2=1855645-8146807\alpha.
```

At each visit to this interval the next 28 induced symbols are
fixed. Applying that word to the 70 possible memories leaves six
possible memories. Measuring from the end of this word, the two
second return maps have the following effects.

| Domain in the second interval | Induced steps | Integer time | Action on the six memories | Output counts |
| --- | ---: | ---: | --- | --- |
| Lower part | 14 | 4,290,233 | One cycle of length six | 344145, 344163, 344201, 344210, 344236, 344585 |
| Upper part | 33 | 10,135,096 | Identity | 813251 for each memory |

All gate words and return domains are certified across the stated
slope interval by affine inequalities. The original orbit avoids the
second cut phases after initialization. These phases in the $y$
coordinate are again integer multiples of $\alpha$ modulo 1 at
negative time indices. The integer-time lengths above are checked
against the domain lengths by the return tower identity.

## Frequency on the cycle

Normalize the second interval to $`[0,1)`$ with coordinate $v$.
Its induced rotation has step
$`\rho=(h_2-m_2)/(h_2-\ell_2)`$. It is irrational because the
two affine expressions in the quotient have coefficient determinant
of absolute value one. Label the six memories along the cycle by
$`j\bmod6`$. If the normalized rotation wraps, its label action is
the identity. Otherwise it adds one to $j$. Thus the coordinate
$`j-v\bmod6`$ advances by $1-\rho$ at each second return. This is
an irrational rotation on a circle of length six. It is uniformly
distributed, giving equal weights to the memories conditional on
either return type.

The visit frequency to the second interval in the original time
index is its length, by equidistribution of the reduced phase.
The return blocks starting after their 28-symbol words partition
the tail. The six count totals for the lower and upper domains are
2,065,540 and 4,879,506 respectively. The rate is therefore

```math
\frac{2065540(m_2-\ell_2)+4879506(h_2-m_2)}6
=\frac{52052894-228526942\alpha}6.
```

Substituting $`\alpha=3\theta-1`$ gives the density formula. The
replay uses exact integers and rational arithmetic.

## Survival under narrow boundary overrides

Start in one of the 70 positive memories after a first-level word.
Allow arbitrary output bits at sites whose phases are within $10^{-6}$
of either endpoint of the central third. At other sites keep the
cutoff-400 recurrence. The lower natural density is then at least
0.079, even with infinitely many overrides.

For each first return and color, the verifier enumerates the possible
override sites in its return word. It enlarges the phase strips by
$10^{-9}$ at the nominal slope to cover the variation of all branch
endpoints and phases over the slope bracket. It offers both possible
bits independently at every listed site. The resulting return maps
preserve a set of 187 nonzero memories and emit at least 4,711 or
29,715 ones on the two return types. Equidistribution multiplies these
counts by the corresponding reduced-phase interval lengths. The
resulting lower rate is at least 0.079 throughout the bracket.

If the set of overrides has zero natural density, the edited model has
the original positive natural density. The verifier applies the clean
28-symbol word to all 187 memories and checks that its image is the
original six-memory set. A clean stretch begins at most one first
return before a memory in the 187-element set is reached. The rotation
returns to the second interval with bounded waiting time, so a clean
stretch enters the six-memory component after a bounded number of
sites, uniformly in its starting phase and memory. On that component
the rotation averages used above converge uniformly in the starting
point. In particular, for every $\varepsilon>0$ there is a fixed
$C_\varepsilon$ such that the discrepancy from the original rate on
any clean stretch of length $L$ is at most $`\varepsilon L+C_\varepsilon`$.
Among the first $N$ sites there are at most one more clean stretch
than override sites. Summing and letting $\varepsilon$ tend to zero
proves the density assertion.

## Exterior singletons under full counting

The positive component can be written as a phase support on each of
the two parities. Label the six memories $j=0,\ldots,5$ in order around
the cycle. On the lower second return $j$ increases by one and the
integer time increases by an odd number. On the upper second return
neither parity changes. Thus at the base of each second return the
label parity agrees with the integer time parity up to a fixed bit.
The color of the memory determines $j\bmod 3$ because the lower return
advances the color by two. The color at the entry to the second
interval is the memory color minus 28 modulo three. Consequently
there is one memory for each entry color and parity. The other choice
of the fixed bit exchanges the two parity supports.

For each of the two return domains, translate its phase interval by
the time offset of each emitted one from each memory. Sort these
output intervals by parity, giving supports $J_0,J_1$ on the circle.
These translated intervals cover the selected sites in each return
block. The return blocks partition the tail, and the affine cut
inequalities used above certify the same partition throughout the
slope bracket.

Consider the candidate that uses the genuine prefix through 400 and
uses these supports at every later site. For either parity assignment,
an odd target can use two summands above 400 only if its phase lies
in the sum $`J_0+J_1`$ modulo one. The exact verifier finds open
windows outside the central third where this sum is absent and there
is exactly one representation using a genuine summand at most 400.
The centers for the first assignment are 856,369,674 and 1,712,763,216
in units of $`1/(3\cdot856371966)`$, with genuine small summands 273
and 69 respectively. The exchanged assignment has a window centered
at 1,712,772,597 with genuine small summand 69 in the same units.

The test checks each translated interval separately, using strict
integer margins for inclusion and exclusion. Its margins also bound
the motion of the translated cut endpoints when $\theta$ varies
within the bracket. Odd target phases visit each window infinitely
often by irrationality. Each phase candidate therefore omits
infinitely many targets uniquely represented within that candidate.
Finite initial exceptions beyond 400 can change these representation
counts.

```sh
c++ -std=c++20 -O3 research/ulam-sequence-density/phase_full_rule.cpp -o /tmp/ulam-phase-full-rule
python3 -B research/ulam-sequence-density/phase_nested_model.py /tmp/ulam-phase-full-rule
```
