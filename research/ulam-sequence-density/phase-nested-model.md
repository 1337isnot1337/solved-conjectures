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

```sh
python3 -B research/ulam-sequence-density/phase_nested_model.py
```
