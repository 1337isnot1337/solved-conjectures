# Exact frequency of the positive cutoff-102 phase model

Let $s$ range over the genuine Ulam numbers at most 102. The
cutoff-102 model sets the bit at $n$ to one exactly when
$`\{n\theta\}\in(1/3,2/3)`$ and exactly one earlier bit at $n-s$
is one. The first 102 bits can be supplied as an arbitrary history.

Let $`\theta_0=350477575/856371966`$ and suppose $\theta$ is
irrational with $`|\theta-\theta_0|<10^{-13}`$. In this model every
history either becomes zero forever or has the positive natural density

```math
1097375-2681373\theta.
```

The value at the nominal slope is approximately 0.0928087. The
assertion concerns the exact fixed list of shifts through 102.

## A recurrent phase interval

Write $`\alpha=3\theta-1`$. A phase $x\in[0,1)$ has a color
$`j=\lfloor3x\rfloor`$ and a reduced phase $`y=3x-j`$. Under one
step, the reduced phase advances by $\alpha$ modulo 1. Put

```math
\ell=\{-29990\alpha\},\qquad
m=\{-403647\alpha\},\qquad
h=\{-343645\alpha\}.
```

Throughout the slope interval, $\ell<m<h$. At a visit to the open
interval $`I=(\ell,h)`$, the color and the reduced phase determine
the middle-third gate at the preceding 102 and next 400,000 sites.
For each fixed color, all phases in $I$ give the same gate word.
The only possible cuts in the reduced phase for those gates are
$`\{-t\alpha\}`$ for offsets $t$ from $-102$ through $399999$.
The [verifier](phase_return_model.py) tests that they stay outside
the open interval by affine inequalities at the two slope endpoints.

For the initial 102-bit history it suffices to include the sites
inside the gate whose bits will be read at a future open gate. An
older bit at lag $a$ can be so read only if some shift $s\ge a$ is
used at offset $s-a$. The three colors have respectively 11, 17 and
15 such sites. The verifier enumerates their Boolean assignments and
applies the common gate word. At the end of the 400,000 sites each
color gives exactly the zero memory and one positive memory.

## Returns preserve the positive memory

The reduced phase has first return time 60,002 on $`(\ell,m)`$,
with displacement $h-m$. On $`(m,h)`$ the first return time is
373,657, with displacement $\ell-m$. For the lower interval,
a positive displacement of $h-m$ returns and a higher displacement
serves only a subset of the same lower interval. The certificate
checks that earlier positive displacements exceed or equal the full
width of $I$, that intervening positive displacements are at least
$h-m$, and that there is no negative return before 373,657. These
checks use the exact affine lifts of the rotation displacements
for every smaller step. They give the two claimed first returns.

Starting at the end of the 400,000-site word, the gate word up to
the corresponding end of the next visit is fixed on each return
interval for each color. The verifier checks translated phase cuts on
those time ranges too. Both returns send the positive memory to the
positive memory of the next color modulo 3. The counts between the
two ends of the words are as follows.

| Return time | Starting color 0 | Starting color 1 | Starting color 2 |
| ---: | ---: | ---: | ---: |
| 60,002 | 5,578 | 5,578 | 5,557 |
| 373,657 | 34,685 | 34,685 | 34,664 |

The orbit of $\theta$ visits $I$ in reduced phase infinitely often.
After the arbitrary initial bits have passed, its positive-time
reduced orbit avoids the interval endpoints and the intervening cut.
Equality would require $`(n+t)\alpha`$ to be an integer for one
of the specified nonnegative indices $t$. Once the memory is zero
it stays zero. In the other case the positive memory persists at
all the return times. All choices that survive therefore agree
after the first common visit and its 400,000-site word.

Each reduced-phase return interval of length $\lambda$ in each
particular color has frequency $\lambda/3$, by equidistribution of
$`\{n\theta\}`$. The blocks between ends of successive visits
partition the tail. Multiplying their counts by the entry frequencies
gives

```math
d=\frac{16713(m-\ell)+104034(h-m)}3
 =\frac{610752-2681373\alpha}3.
```

End effects have bounded length because both return times are bounded.
Substitution of $`\alpha=3\theta-1`$ gives the stated density.

The same gate returns also support a second induction for a positive
[cutoff-400 component](phase-nested-model.md).

```sh
python3 -B research/ulam-sequence-density/phase_return_model.py
```
