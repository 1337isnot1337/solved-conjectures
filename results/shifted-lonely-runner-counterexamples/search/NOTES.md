# Notes (observations, not theorems)

**What worked:** for n <= 27 the generic pipeline (`slr_auto.py`: anneal at 1/(n+1+margin), then SLP polish, then rounding to 10^6, then exact certify) succeeded (1-6 minutes per n). Excess E = 1/gamma − (n+1) was 0.50, 0.67, 0.33, 0.40, 0.18, 0.04, 0.05, 0.38, 0.34, 0.28 for n = 18..27. Most seeds fail: n = 25 needed 7 seeds, n = 27 needed 6. There is no sign yet of a hard wall at 27.

**Observations**
1. Poliakova's rule: the sign convention as stated ((1+δ)/2 together with −δ) is a valid exact cover at N = 96. Its mechanism, read off in u = 2t time:
   - u-runner k at shift (1+δ)/2 covers the points (odd)/(2k) with arcs [−3δ/(2k), +δ/(2k)].
   - u-runner k at −δ covers [i/k, i/k + 2δ/k].
   - The odd pair t = {m, 3m} at 1/4 covers u-points (odd)/(2m) on both sheets with half-width 2δ/(3m).
   - In a conservative local model (hole ±δ/d at each point of denominator d), the structure is: a doubling chain 6,12,24,48 ending in a removed 96, a bottom gadget {3,9} (+2), and two "b-gadgets" (remove 2^b, put 2^{b+1} at −δ, which needs chain elements 3·2^{b−1} and 3·2^b; b = 2, 4).
   - In this model, a c = 6 chain needs top 96 to fit two b-gadgets. This looks consistent with Poliakova's bound n >= 95.
   - For smaller N any rule would have to use N-specific (non-conservative) effects near speeds ≈ N.
2. Removing the top runner (u-speed N) makes the slack δ < 1/N usable, but it leaves the tight points t = b/(2N). At these, (v_i, v_j) and (v_j, v_i) occur symmetrically, so first-order LP moves cannot lower the maximum. This is the same degeneracy that makes zero shifts a local minimum for 1..n.
3. Small set-cover MILPs restricted to the gaps of a fixed runner set are fast. They proved infeasibility for several structured candidate classes with N < 96 within seconds (see PROOF.md). Larger candidate sets time out.

**Leads if continued**
- Generic pipeline with warm starts from the n−1 solution, more restarts and both cores, pushed n by n past 24.
- Exact search for the BCS tight configurations (gamma^sh(1..11) = 1/14 etc.) to look for a pattern with E >= 1 that generalises.
- MILP or local search on rules that modify runners near the top (speeds ≈ N or ≈ 2N, including speeds > 2N, e.g. odd 3N at 1/2, which covers all tight points t = b/(2N)) combined with Poliakova-type gadgets.

## Why the polish stalls at exactly 1/(n+1), 1/n, 1/(n−1), … (added 22:35 CET)

Many failed runs end with 1/gamma − (n+1) equal to an integer (0, −1, −2, −3, −5), and the sequential LP then makes no progress at all. The reason is a pair obstruction, which is a rigorous statement.

**Pair obstruction.** Let runners i ≠ j have speeds a, b and shifts s_i, s_j. Put w = a + b, g = gcd(a, b), c = s_i·b − s_j·a and θ = frac(c/g). Call a time t a crossing of type (i up, j down) if runner i is at phase h in (0, 1/2) and runner j at phase −h; then (a + b)t + s_i + s_j is an integer, and h ≡ (c + a·m)/w (mod 1) for an integer m. So the possible heights are g(θ + k)/w, k = 0, 1, 2, …. For type (j up, i down) the possible heights are g(1 − θ + k′)/w. Call a crossing exposed if no third runner is within h of the origin at that time; then gamma ≥ h. Consequently:

- if a crossing of type (i up, j down) at level k and one of type (j up, i down) at level k′ are both exposed, then gamma ≥ g(1 + k + k′)/(2w);
- for (k, k′) = (1, 0) or (0, 1) this gives gamma ≥ max(g(1+θ), g(1−θ))/w ≥ g/w, with equality only at θ = 0.

So a coprime pair with a + b = w that is exposed in both orientations at levels (1, 0) pins gamma at 1/w: changing θ lowers one peak and raises the other by the same amount, and the LP sees the two constraints with opposite signs. With w = n+1, n, n−1 this is 1/gamma − (n+1) = 0, −1, −2. Zero shifts are the extreme case: every pair with a + b = n+1 is pinned.

**What this means for the search.**
- In any counterexample with speeds 1..n, for every coprime pair with a + b ≤ n+1 all crossings of level ≥ 1, in both orientations, must be covered by third runners. For a + b = n+1 that is one crossing per orientation, so about φ(n+1) forced coverings.
- A pin at w = n+1 is invisible to the grid annealer at threshold 1/(n+1.3): the uncovered intervals are shorter than the grid step. That is why some runs report "uncovered = 0" and still end at exactly 1/(n+1). Example: n = 29, C annealer, seed 77: the pair (11, 19) is exposed at t ≈ 0.127562 and t ≈ 0.394229, both at height exactly 1/30.
- Local repairs do not remove a pin. In that example, moving the nearest third runner onto either peak (runners 13, 21, 3, 5, resp. 14, 9, 18, 6) raises gamma to between 0.040 and 0.100 before re-polishing, and the polish returns to 1/30 or worse. Every runner is needed where it is.
- So success of a run is decided by whether the annealed state happens to be pin-free. Two-stage annealing with an 8 times finer grid, focused (WalkSAT-style) moves, slower cooling (8 and 16 times the steps) and targeted iterated local search were each tried in a few runs at n = 28, 29, 30 and did not beat plain restarts. One slow-cooling run did produce the n = 28 certificate, which looks like luck. Speed sets shifted away from the origin are much worse: for n = 20 the speeds 4..23 and 11..30 left 116 and about 500 grid points uncovered where 1..20 leaves none. A move set that can unpin (for instance shifting a subset S of runners rigidly in time, s_k → s_k + v_k·τ for k in S) has not been tried.

## A lattice form of the optimal eight-runner example (added 22:40 CET)

For speeds 1..8 the shifts s_q = m_q/10 with m = (0, 4, 4, 3, 1, 2, 0, 1) give gamma = 1/10 exactly (checked with exact arithmetic; found by the grid MILP; 1/10 is the optimal value by Blanco, Criado and Santos). In the variable u = 10t, runner q covers the arcs of half-width 1/q centred at (10k − m_q)/q, so every arc endpoint is a multiple of 1/q and neighbouring arcs abut exactly, for example [−1, 1] (runner 1), [1, 1.25] (runner 8), [1.286, 1.571] (runner 7), [1.5, 2] (runner 4), [1.667, 2.333] (runner 3), [2.25, 2.5] (runner 8), [2.5, 3.5] (runner 2). Runners 1 and 7 are unshifted; runners 5 and 8 are shifted by exactly one half-width, the one-sided shift that also appears in Poliakova's rule. The same grid (shifts in multiples of 1/(n+2)) has no solution for n = 9, 10.

## Exact lattice covers (added 21 Nov, 03:20 CET)

Fix a threshold P/Q and allow only shifts m/Q. In u = Q·t runner q covers the arcs [(jQ − m − P)/q, (jQ − m + P)/q], so every endpoint is a multiple of 1/q and "the arcs cover" is a finite exact statement about the elementary intervals between consecutive Farey fractions of order n. `lat1.py` hands this to a SAT solver (one variable per runner and shift), `enumsol.py` enumerates all solutions, `show.py` prints a cover.

Results, all with speeds 1, …, n (each checked again with exact rational arithmetic):
- n = 8, threshold 1/10: exactly three solutions up to reflection, m = (0,4,3,3,4,2,3,1), (0,4,3,4,7,9,0,1), (0,4,4,3,1,2,0,1) in units of 1/10.
- n = 12, threshold 1/14: exactly one solution up to reflection, m = (0,5,6,6,8,7,0,2,0,5,6,8) in units of 1/14. No solution on this lattice for n = 5, 6, 7, 9, 10, 11, 13 at threshold 1/(n+2), nor for n ≤ 12 at 1/(n+3).
- Shifts in multiples of 1/(2(n+2)), threshold 1/(n+2): solutions for n = 9, 10, 11, 12, 13.
- Other thresholds: n = 9: 3/34; n = 10: 2/25, 3/38; n = 11: 3/40; n = 12: 2/29, 3/44; n = 13: 2/29; n = 14: 2/31; n = 16: 3/52; n = 20: 4/85 (SAT, 100 s).
- `lanneal.c` (driver `lrun.py`) is an annealer on the same lattice with exact cost (number of uncovered elementary intervals). It needs temperatures of the order of the number of Farey fractions. It solves n = 20 at 4/85 in 7 s and n = 24 at 6/151 in 25 s, but leaves 10, 21 and about 200 intervals open at n = 28, 30, 34 (threshold 6/(6n+7), 100 to 180 s). `lns.py` then frees 7 runners at a time and asks SAT for an exact repair: at n = 28 all 40 neighbourhoods tried were unsatisfiable. So this does not beat the grid pipeline beyond n ≈ 28.

## Rules of Poliakova's type: what an exhaustive search says (added 21 Nov, 03:20 CET)

Source: D. Poliakova, *More (shifted) runners, less loneliness*, arXiv:2609.23952. Her Theorem 1 already gives E_n ≥ ⌊n/287⌋ by applying one rule at many odd scales at once, and Table 1 has a gain-2 rule with L = 240. (An earlier idea in these notes, to superpose scaled copies of the rule, is therefore not new.)

Model used in `rule3.py` and `rule4.py`. Base: even speeds 2k (k ≤ N) at shift 0, δ = 1/(N+1). The arcs of half-width δ/(2d) around the primitive points b/(2d) (gcd(b, d) = 1, d ≤ N) cover the circle. A runner with speed v and shift ρ + cδ comes within O(δ) of b/(2d) exactly when v·b/(2d) + ρ is an integer, and then covers [(−c−1)·2d/v, (−c+1)·2d/v] in units of δ/(2d). A rule (remove or rephase some even speeds, add some odd speeds) is accepted if at every primitive point with d ≤ K the interval [−1, 1] is covered by runners of the rule. This is sufficient for every N ≥ K, and it is the same kind of local check as in her Definition 5.

SAT results (speeds of the rule restricted to the listed primes; ρ in Z/4 unless said otherwise; c a multiple of 1/4 in [−2, 2]):
- primes {2, 3}: a gain-1 rule exists with L = 192 and none with L ≤ 190 (added odd speeds up to 243; also none with ρ in Z/12).
- primes {2, 3, 5}: no gain-1 rule with L ≤ 190; a gain-2 rule exists with L = 240, none with L ≤ 238, and no gain-3 rule with L = 240 (added odd speeds up to 135).

So within these menus her rules are optimal, and the bound n ≥ 95 cannot be lowered by a rule of this type. These are statements about the menus only.
