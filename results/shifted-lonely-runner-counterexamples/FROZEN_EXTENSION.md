# Adding one runner to the fixed 57-runner configuration

The least possible covering radius is $`d_* = 1359451/79000000`$ when the 57 speed–phase pairs from [tomdif’s published certificate](https://github.com/1337isnot1337/solved-conjectures/pull/660) stay fixed and the new runner can have any unused positive integer speed and any real phase. The sole optimal speed is $`528344`$. Its optimal phases form the closed interval with start $`4737613/31600000`$ and width $`178783/158000000`$ modulo one. Every such phase attains $`d_*`$ at $`t_* = 38586773/79000000`$.

This improves the fixed configuration’s radius by $`63/395000000`$. It also rules out strict escape at $`1/59`$ for one new runner if the old speeds stay fixed and each old phase moves by at most $`1207609/4661000000`$ turns. Zhang’s question for unrestricted configurations at sizes 58–94 remains open in [#110](https://github.com/1337isnot1337/solved-conjectures/issues/110).

## Proof

Write $`\lVert x\rVert`$ for distance to the nearest integer. Following [Zhang’s Appendix A](https://arxiv.org/html/2608.13599v3#A1), the radius is the maximum over real time of the minimum runner distance. The speeds are integers, so one period $`[0,1]`$ suffices.

At radius $`d_*`$, each seed runner with speed $v$ and phase $s$ covers the intersection of $`[0,1]`$ with the closed intervals

```math
\left[\frac{k-s-d_*}{v},\,\frac{k-s+d_*}{v}\right]\qquad(k\in\mathbb Z).
```

Merge these seed intervals. The complement has eleven gaps, and the longest has length $`53/1264000000`$. To attain radius at most $`d_*`$, the new runner must cover each gap and, by continuity, its closure. Conversely, covering these closures suffices.

For an added runner of speed $v$ and phase $s$ to cover a closed gap $`[a,b]`$, its lifted positions on the gap must lie in a single closed interval $`[k-d_*,k+d_*]`$ for some integer $k$. These intervals are disjoint and the lifted positions vary continuously. The resulting phase constraint is

```math
s\bmod 1 \;\in\; [-va-d_*,\,-vb+d_*]\bmod 1 .
```

Its width is $`2d_*-v(b-a)`$, with reversed endpoints giving an empty constraint. The longest gap bounds **every** feasible positive integer speed by $`\lfloor 2d_* /(53/1264000000)\rfloor = 820800`$. The uncovered-interval bound also appears for the unshifted baseline in [Zhang’s §1.3](https://arxiv.org/html/2608.13599v3#S1.SS3).

Use the longest gap $`[a_0,b_0]`$ as origin and put $`u=(s+va_0+d_*)\bmod 1`$. The first gap forces $`0\le u\le 2d_*-v(b_0-a_0)`$. Each remaining gap gives a window starting at $`v(a_0-a)\bmod 1`$ with width at most $`2d_*`$. A lift meeting the first window must start in $`[-2d_*,2d_*]`$. Since $`2d_*<1/4`$, it suffices to take the representative nearest zero and intersect ordinary closed intervals. Multiplication by the common denominator of the gap endpoints and $`d_*`$ makes all comparisons exact integers.

Enumerating the unused speeds through 820800 leaves precisely the speed and interval of phases above. The verifier also checks both extreme corners of each gap using rational arithmetic; since position increases with time and phase in the selected lifts, those inequalities suffice for the whole gap and whole phase interval.

At $`t_*`$ every seed distance is at least $`d_*`$, and the runners with speeds 44 and 114 are exactly at distance $`d_*`$. This time belongs to the closed seed cover and therefore does not have to be covered by the added runner at radius $`d_*`$. At the left endpoint of the feasible phase interval the added-runner distance there is $`66324111/158000000`$. Its distance can decrease by at most the width of the phase interval, leaving it strictly greater than $`d_*`$. Hence every weak cover in the list has radius exactly $`d_*`$. A strict improvement would have to occur on the same list.

For stability, restoring each old phase changes that runner’s distance at any time by at most its circle displacement. If every displacement is at most $`\epsilon`$, the minimum of all 58 distances changes by at most $`\epsilon`$ uniformly in time, and so does its maximum. The perturbed configuration thus has radius at least $`d_*-\epsilon`$, which is at least $`1/59`$ for $`\epsilon\le d_*-1/59 = 1207609/4661000000`$. This also applies after one common change of time origin, which shifts each phase by its speed times the time translation and leaves the radius invariant.

## Reproduction

```sh
python3 results/shifted-lonely-runner-counterexamples/verify_frozen_extension.py
```

The standard-library [verifier](verify_frozen_extension.py) reads the `n=57` row of [the existing certificate file](certificates.json) and checks it against a canonical row digest. All calculations are rational or integral. Aadrianvv supplied the original search tools and verifier, and tomdif found the seed. [#660](https://github.com/1337isnot1337/solved-conjectures/pull/660) records the seed contribution, and [#755](https://github.com/1337isnot1337/solved-conjectures/pull/755) verifies its original radius in Lean.

The companion Lean development proves the exact radius, attainment at the stated starting phase and the stability bound. The integer enumeration here establishes the unique optimal speed and the full interval of optimal phases. [Lean statements and replay](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/formal/README.md) · [Preprint](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/papers/runners/frozen-extension.pdf) · [Verification record](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/papers/runners/evidence/verification.md).

Chengyi Fang (F1Justin) directed the MathLab project. AI carried out the mathematical work and writing. Fang has not personally verified the proofs. The proof note is available under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The checker is MIT-licensed.
