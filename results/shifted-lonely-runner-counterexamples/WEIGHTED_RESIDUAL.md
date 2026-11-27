# Weighted obstruction for the fixed 57-runner seed

At radius $`1/59`$, tomdif’s published 57 runners and any seven extra runners leave some time uncovered. The extra speeds can be any positive integers, with repetitions, and the phases can be any real numbers. Consequently a 58-runner cover at this radius can retain at most 50 of the published speed–phase pairs.

## Weighted interval certificate

Scale time by $`P=59000000`$ and work on $`[0,P]`$. The [certificate](weighted_residual.json) lists 121 triples $`(a,b,w)`$, each giving the open interval $`(a,b)`$ and its constant weight density $`w`$. The intervals are disjoint and all weights are positive integers. Their total density sum is $`W=\sum w=303345`$ and their total weighted length is $`T=\sum w(b-a)=153120431`$.

For each interval and each fixed runner, the exact endpoint tests place its whole affine position in $`[k+1/59,k+1-1/59]`$ for some integer $`k`$ when phases are measured in turns. Since the speed is positive, both inequalities are strict in the interval interior. Thus the seed covers zero of the weighted support even with closed runner bands.

For an added runner of speed $`v`$, scale position by $`P`$ as well. Its covered positions modulo $`P`$ lie in a window of width $`U=2000000`$ whose start encodes the phase. An interval $`(a,b)`$ maps to an interval of length $`v(b-a)`$. Decompose this length into full periods and a remainder. Each period contributes $`U`$ units in position space. The remainder contributes the length of its circular intersection with the window. Multiply by $`w/v`$ to return to weighted time units.

At a fixed integer speed the endpoints of the remainder arcs and both window boundaries have integer offsets. The window intersection length is affine between successive coincidences of an arc endpoint and one of the window endpoints. Therefore the maximum over arbitrary real window starts is attained at an integer event. The verifier builds the piecewise constant phase density and integrates it over the window at all such events.

For speeds $`1,\ldots,59940`$, the exact largest fraction of total weighted length is

```math
\beta=\frac{20159589}{153120431}.
```

Speed 160 and window start 9192800 attain it. At larger speeds, bounding each remainder contribution by $`U`$ gives

```math
 \frac{U}{P}+\frac{UW}{vT}
 \le \frac{7735870501306}{77359044788527} < \beta.
```

The union of seven runners has weight at most $`7\beta T=141117123`$, strictly less than $`T`$. Some interior support time is therefore uncovered by every runner. All calculations are invariant under translating time around the circle.

For the consequence at 58 runners, suppose a cover contains at least 51 exact seed pairs. Restore the remaining original pairs while retaining all 58 runners. The resulting cover consists of all 57 original runners and at most seven extra runners, contradicting the bound. This gives a necessary number of changed pairs for this seed, including seeds shifted by one common time translation. The unrestricted question for 58 through 94 runners stays open. [Issue #110](https://github.com/1337isnot1337/solved-conjectures/issues/110)

## Lean reduction

Lean checks that all 121 intervals miss the published seed and that their weighted length is 153120431. The formalization verifies the exact integer event sweep's soundness, the upper bound on Lebesgue length for arbitrary real phases, the analytic tail for every speed from 59941, and the contradiction for seven tracks.

The endpoint `ShiftedLonelyRunner.WeightedResidual.no_seven_of_finite_checks` takes the full finite Boolean sweep as a hypothesis. The kernel checks the representative speed 160. The whole finite range was checked by both the compiled Lean evaluator and the independent standard-library verifier. [Lean theorem](../../lean/Conjectures/ShiftedLonelyRunnerWeighted.lean) · [Sweep soundness](../../lean/Conjectures/ShiftedLonelyRunnerWeightedWindow.lean) · [Certificate generation](generate_weighted_lean.py) · [Strict build, axiom audit and stock-kernel replay](verification/weighted-lean-receipt.json).

```sh
python3 results/shifted-lonely-runner-counterexamples/generate_weighted_lean.py --check
python3 scripts/verify_lean_target.py --root Conjectures.ShiftedLonelyRunnerWeighted \
  --require ShiftedLonelyRunner.WeightedResidual.seed_misses \
  --require ShiftedLonelyRunner.WeightedResidual.checkWindow_sound \
  --require ShiftedLonelyRunner.WeightedResidual.checkFiniteSpeed_160 \
  --require ShiftedLonelyRunner.WeightedResidual.all_caps_of_finite_checks \
  --require ShiftedLonelyRunner.WeightedResidual.no_seven_of_finite_checks \
  --out /tmp/shifted-runner-weighted-replay
(cd lean && lake env lean ../results/shifted-lonely-runner-counterexamples/verify_weighted_finite.lean)
```

## Reproduction and attribution

```sh
python3 results/shifted-lonely-runner-counterexamples/verify_weighted_residual.py
```

The standard-library [checker](verify_weighted_residual.py) uses exact integer phase arithmetic and verifies the attaining window separately using direct endpoint differences. Its input is pinned to the same 57-runner row as the [one-runner extension](FROZEN_EXTENSION.md). Aadrianvv wrote the original verifier and search tools. Tomdif found the seed. [Seed contribution](https://github.com/1337isnot1337/solved-conjectures/pull/660) · [One-runner result on research](https://github.com/1337isnot1337/solved-conjectures/pull/850) · [Publication on main](https://github.com/1337isnot1337/solved-conjectures/pull/884)

The weighted theorem appeared in the MathLab preprint. Chengyi Fang directed the project. AI carried out the mathematical work and writing. Fang has not personally verified the proofs. The note is available under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) and the checker is MIT-licensed. [Preprint](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/papers/runners/frozen-extension.pdf) · [Arithmetic review](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/papers/runners/evidence/verification.md)
