# Shifted Lonely Runner: exact counterexample certificates for 18 <= n <= 56

**Status: computer-assisted, exact rational verification, unrefereed. No Lean formalization.** [Landing page and scope](README.md) · [Certificates](certificates.json) · [Verifier](verify.py)

## Question

Zhang works with n distinct positive integer speeds v = (v_1, ..., v_n) and starting positions s in [0, 1)^n and defines

```math
\gamma(\mathbf v;\mathbf s)=\max_t\min_i\|s_i+v_it\|,\qquad
\gamma^{\min}(\mathbf v)=\min_{\mathbf s}\gamma(\mathbf v;\mathbf s),\qquad
\Gamma(n)=\min_{|\mathbf v|=n}\gamma^{\min}(\mathbf v),
```

where `||x||` is the distance from x to the nearest integer. The shifted Lonely Runner Conjecture, as stated in [Z26, Appendix A] (citing its reference [5, Conj. 1]), asserts `gamma^min(v) >= 1/(n+1)` for all such v. Blanco, Criado and Santos disproved it for 5 <= n <= 17, and Poliakova for all n >= 95. Zhang's Question 8.5 asks whether `Gamma(n) < 1/(n+1)` for every n >= 5, and his Appendix A notes that after these two results the question is open only for 18 <= n <= 94. [Z26, Question 8.5 and Appendix A]

The speeds in the question are arbitrary distinct positive integers. They are not restricted to 1, ..., n. Zhang also asks for the minimisers of `Gamma(n)`; this note does not address that part.

## Statement

For every n in {18, 19, ..., 56} there are n distinct positive integer speeds v_1..v_n and shifts s_i in Q/Z such that

```math
\gamma(\mathbf v;\mathbf s)=\max_t\min_i\|s_i+v_it\|<\frac1{n+1},
```

so the shifted Lonely Runner Conjecture fails for n runners, and `Gamma(n) < 1/(n+1)` for these n. For 18 <= n <= 40 the speeds are 1, 2, ..., n. For 41 <= n <= 56 they are other sets of distinct speeds (largest speed 120 to 216), listed in the certificates. The certificates are in [`certificates.json`](certificates.json), with speeds, shifts s_i = shift_num[i]/shift_den and the exact value of gamma. Run `python3 verify.py` in this folder, or `python3 results/shifted-lonely-runner-counterexamples/verify.py` from the repository root (standard library only), to check them. The final run in the original working folder on 22 Nov 2026 printed `SUMMARY: 37 certificates, 37 passed, 0 failed; certified n = [18, ..., 54]` and took 238 s, mostly for the large-speed certificates n >= 41. `python3 verify.py --quick` runs check 2 below for every certificate and check 1 for n <= 24 and n = 41 only, in about 10 s.

Each listed n has an exact counterexample. Nothing is claimed either way for 57 <= n <= 94: no counterexample is known here, and no proof that none exists. Poliakova's construction (arXiv:2609.23952) covers all n >= 95. The search methods below are heuristic (annealing with random restarts). Their failure so far at n = 57 says only that they did not reach it in the time spent; it is no evidence that the conjecture holds there.

## The two verification methods (verify.py runs both)

1. **Exact gamma.** f(t) = min_i ||s_i + v_i t|| is continuous and piecewise linear, and every piece has slope ±v_i ≠ 0. So f has no flat piece, and its maximum is reached at a breakpoint where f changes from increasing to decreasing. At such a point either two runners i ≠ j are at the same distance d, with i moving away from the nearest integer and j moving towards it, or one runner turns at a half-integer (case i = j). In both cases s_i + v_i t ≡ ±d and s_j + v_j t ≡ ∓d (mod 1). Adding gives (v_i + v_j) t + s_i + s_j ∈ Z. The verifier evaluates f exactly (Fractions) at all these finitely many t, for all pairs i ≤ j, and takes the maximum, which is gamma. It checks gamma < 1/(n+1) and that gamma equals the recorded value.
2. **Interval-union cover (independent).** Let delta = (gamma + 1/(n+1))/2 < 1/(n+1). Runner i is within delta of an integer exactly on the v_i closed arcs [(m - s_i - delta)/v_i, (m - s_i + delta)/v_i], m = 0..v_i-1. The verifier sorts the arcs and sweeps them with exact rationals. If their union is all of R/Z, then every t has some i with ||s_i + v_i t|| <= delta, so gamma <= delta < 1/(n+1). This check is a proof on its own and does not rely on method 1. In `--quick` mode delta is formed from the recorded gamma, after checking that the recorded value is below 1/(n+1); the conclusion gamma <= delta < 1/(n+1) is the same.

## Padding lemma (used to find the certificates for n = 37 and n = 38)

Adding runners can only decrease min_i ||s_i + v_i t|| at every t, so gamma(v ∪ v'; s ∪ s') <= gamma(v; s). Hence an m-runner configuration with gamma < 1/(n+1) for some n >= m extends to an n-runner counterexample: append n - m further distinct speeds with any shifts. The certificates for n = 37 and n = 38 were found this way: a configuration of speeds 1..36 with 1/gamma = 38.1009 was padded with the speed 37 at shift 0, and a configuration of speeds 1..37 with 1/gamma = 39.0153 with the speed 38 at shift 0. `certificates.json` stores them as ordinary certificates with all n speeds, and `verify.py` checks them like the others, so the lemma is not needed for the verification.

## Relation to the literature

- Blanco, Criado, Santos (arXiv:2603.24784, Thm 1.8): counterexamples for 5 <= n <= 17. During the work our verifier reproduced their 1..5 example (gamma = 15/94) and their 6-runner examples (2/15 and 9/67); these examples are not stored in `certificates.json`.
- Poliakova (arXiv:2609.23952): counterexamples for all n >= 95. We reproduced her rule exactly at N = 96 (base 2,4,...,192; remove {8,32,192}; {12,24,48,96} at (1+δ)/2, {16,64} at −δ, add {3,9} at 1/4; δ = 1/97). It is an exact cover, so it proves n = 95 with gamma <= 1/97. **The sign convention as stated is correct for ||s_i + v_i t||.** The mirrored choice ((1−δ)/2 with +δ) also works. Mixed signs fail.
- Zhang (arXiv:2608.13599v3, Question 8.5, Appendix A): asks about 18 <= n <= 94. This note settles 18..56 only. 57..94 remain open here.

## How the certificates were found (heuristic; irrelevant to correctness)

The search used grid simulated annealing at threshold 1/(n+1+margin), then a sequential-LP minimax polish of the local maxima (scipy/HiGHS). The shifts were then rounded to denominator 10^6 (10^5 for n = 18) and checked exactly. The code is in [`search/`](search/) (`slr.py`, `slr3.py`, `slr_auto.py`). n = 20, 22, 24 took 1-2 minutes each; n = 25, 26, 27 took about 6, 2 and 6 minutes (several restarts). n = 28 came from one slow-cooling run of `search/long.py`; n = 29, ..., 33 came from restarts of a C version of the annealer (`search/anneal.c`, driven by `search/drive.py`; build with `gcc -O2 -o anneal anneal.c -lm`), after about 25, 10, 23, 38 and 5 restarts of about 20 seconds each. `search/NOTES.md` explains why most restarts fail (pair obstruction).

n = 34 and n = 35 came from a different annealer, `search/anneal3f.c` (heat-bath moves: remove one runner, compute the exact grid cost of all 16384 shifts of that runner, and resample its shift from the Gibbs distribution; driven by `search/drive5.py`). On n = 32 with equal CPU time it ended with a median of 17 uncovered grid cells against 44.5 for `anneal.c` (12 seeds each), and 2 of 12 runs gave a certificate against 1 of 38. n = 34 was found at the 25th restart. For n = 35 one run ended with no uncovered grid cell but with E = −0.128 after the LP polish: six narrow peaks above 1/36 remained, caused by pairs of high speeds such as (31, 27), (27, 33), (33, 29), which the grid does not see. Re-annealing that state on a grid four times finer (70000 points, margin 0.15, temperature 8 to 0.5, 300000 moves) removed them and gave E = 0.5528.

n = 36 was found by the same driver at the 7th restart (E = 0.8857). For n = 37 and n = 38 no new cold search was needed: the n = 36 state was re-annealed warm on the fine grid at a larger margin (`search/cont2.py`: margin 1.3, temperature 4 to 0.5), which raised it to E = 1.1009; with E > 1 the padding lemma gives n = 37 (speed 37 at shift 0, E = 0.1009). The same step applied to the padded 37-runner state gave E = 1.0153, hence n = 38 (E = 0.0153). At n = 39 this chain stalled in the first attempts (the padded state stays at the LP optimum 1/gamma = 118/3), and 47 cold restarts gave no state with at most 8 uncovered grid cells. What worked for n = 39 and n = 40 was a warm start from the previous certificate with the new speed at shift 0 (`search/padchain.py`), re-annealed on the fine grid at margin 0.15 with a higher starting temperature (16 instead of 4 or 8; lower temperatures stayed in the basin of the start), followed by the LP polish: E = 0.5379 for n = 39 and E = 0.1232 for n = 40. In these two cases the previous state did not have E > 1, so the padding lemma alone did not apply; the padded configuration was only the starting point of a new optimisation.

## Speeds other than 1..n: the speed-change annealer (used for 41 <= n <= 54)

The shifted conjecture concerns any n distinct speeds, so the speed set is a free choice. `search/a3s.c` is the heat-bath annealer of `anneal3f.c` with one extra kind of move. With probability ps (0.03 to 0.05), a runner is removed and put back with a new (speed, shift) pair. The pair is drawn from the Gibbs distribution over every unused speed up to 3n (or a random 24 of them) and every shift bin. Runs are driven by `search/a3drv.py` and `search/harvest.py` (cold runs) and by `search/a3chain.py` and `search/a3chain2.py` (warm chain). As before, each annealed state is polished by the sequential LP (`hyb.py`, all shifts free except one), then rounded to denominator 10^6 and checked with exact integer arithmetic (`search/gam.py`). Only the certificates matter for correctness, and `verify.py` checks them. (Several scripts hard-code the original working folder, for example in a `HERE = ...` line, and the path of the original `certificates.json`; edit those lines to run them elsewhere. Build with `gcc -O2 -o a3s a3s.c -lm`.)

- **Calibration.** At n = 20, 4 of 4 cold runs gave certificates (E = 0.77 to 1.33, 5 s each). At n = 35, 6 of 6 did (E = 0.36 to 1.70, about 15 s each). With the speeds fixed to 1..n, cold runs at n = 35 rarely succeed.
- **n = 41..45 (cold runs).** 30 to 60 s per run; about one run in three or four gives a certificate. n = 41 came from a run with margin 0.7 (E = 0.888).
- **n = 46..52 (warm chain).** Each step starts from a certificate for n − 1 plus one new runner. The new speed is the unused speed up to 3n whose best shift covers most of the gap set at threshold 1/(n+1.15). The state is then re-annealed with speed moves on a grid four times finer (margin 0.15 or 0.3, starting temperature 16, ps = 0.03), and the LP polish follows. n = 46, ..., 50 each succeeded at the first try (13 to 20 s). n = 51 needed about 8 tries. n = 52 needed a pool of alternative n = 51 solutions (`a3chain2.py`) and longer anneals.
- **Observed speed sets (stored certificates, n = 41..54).** Each set is 1..n with some numbers removed and the same number of larger speeds added. The primes 29, 31, 37, 41 are absent from all 14 sets, and 43 and 47 from every set with n >= 43, resp. all but one with n >= 47; 17, 19, 23 and multiples such as 34, 38, 46 are usually absent, and so are 13, 25 and 35. The added speeds are mostly smooth: 60 appears in all 14 sets, 72, 84, 90 and 120 in 13, 80 and 96 in 12, 54 in 11 and 108 in 10. 144 appears in 4 of the 14 sets (n = 48, 51, 52, 54). The largest speed is 120 for n = 41..45, 126 to 150 for n = 46..52, 156 for n = 53 and 216 for n = 54, although speeds up to 3n (4n for n = 53, 54) were allowed. Starting cold from a ready-made {2,3,5,7}-smooth set gave no gain in 3 runs at n = 46, because the hot start scrambles the set anyway. This pattern is an observation about the solutions the search found, not a theorem.
- **n = 53, 54.** A second run of the chain (`a3chain3.py`) added three things: the new speed is drawn at random from the 5 best by gap coverage; near-pinned results get a "kick" (3 runners get random unused speeds and shifts, then a warm re-anneal); speeds up to 4n are allowed. n = 53: E = 0.122 (the stored certificate). A beam variant (`beam.py`, several solutions kept per n) then gave other n = 53 solutions with E = 0.197 and from them n = 54 with E = 0.719 (the stored certificate, which uses 144, 150, 180 and 216; two other n = 54 solutions found by the chain use 168 and 180).
- **n = 55 (first round, not found).** About 25 tries in about 50 minutes, from n = 54 bases with E between 0.02 and 0.72. The best SLP results were E = −0.012 and −0.19. Runs took 60 to 90 s each on a machine shared with other jobs. Search stopped there.

## n = 55 and n = 56

Found on 25 Nov 2026 with the unchanged `search/a3chain3.py`, `search/a3s.c` and `search/hyb.py` (only hard-coded paths edited), three independent chains with seeds `SO = 1007, 2007, 3007`, each on one core of an Apple-silicon laptop. Every candidate was accepted only after `verify.py`'s `check(c, exact=True)` passed.

- **n = 55.** The chains started from the stored n = 54 certificate and its alternatives. The first certificate (E = 0.0088) added speed 126 to the n = 54 certificate. Further tries produced several distinct n = 55 solutions; the stored one has E = 0.2843 (γ = 63961/3600000). Its speeds are 1..55 without 13, 17, 19, 23, 25, 29, 31, 34, 35, 37, 38, 41, 43, 46, 47, 49, 50, 53, 55, plus 56, 60, 64, 68, 72, 80, 81, 84, 88, 90, 96, 100, 108, 120, 136, 144, 150, 180, 216.
- **n = 56.** With the default annealing length, about 120 tries over three chains failed (best E ≈ −0.105). The chains were restarted with `MULT=0.6` (2.4× the default annealing length) and `VMX=4` (speeds up to 4n), each seeded with the pooled n = 55 solutions (E from 0.009 to 0.284). One chain succeeded at its 11th try, 23 minutes in, from the E = 0.284 base with new speed 192: E = 0.0265 (γ = 56991/3250000). Its speeds are 1..56 without 13, 17, 19, 23, 25, 29, 31, 35, 37, 41, 43, 46, 47, 49, 50, 52, 53, 55, 56, plus 60, 64, 66, 68, 72, 78, 80, 84, 88, 90, 96, 100, 108, 120, 144, 150, 156, 180, 216. The speed-set pattern noted above for 41..54 continues.
- **n = 57 (not found so far).** From the single n = 56 base the first ~10 tries ended between E = −1.3 and −6.8. The margin of the n = 56 base is thin, which the chain's experience at 53 → 54 suggests matters; building more n = 56 alternatives is the obvious next step.

## What did not work (all runs factual; E := 1/gamma − (n+1), needs E > 0)

- **Annealing + SLP, speeds 1..n:** n = 25 and 27 failed in 4-minute budgets in an earlier session (best E ≈ −0.2), but succeeded here with 7-11 minute budgets and more seeds (seeds 6 and 5). Plain annealing at n = 30 and 50 got nowhere in that session (n = 30 succeeded later, see above).
- **Superposing certificates at different scales:** distinct speeds force the two speed sets apart, so the scales are effectively separate. cert(20) plus cert(21) scaled by 21, 23 or 43, with 40 time offsets: 1/gamma = 22.8 to 23.4 (about the weaker certificate alone), against the 42 needed for n = 41.
- **Freezing the large speeds at shift 0 and annealing only the small ones** (speeds 1..n+1 minus one, n = 20): freezing even 4 to 6 large speeds lowers E from about +0.8 to between −0.1 and −5.5. So good solutions do not contain the base-at-zero structure.
- **Structured shift families:** shifts a·v²/q (n = 20, all q = 15..40): E ≈ −10. Shifts restricted to {0, 1/2} or quarters, with local search (n = 16): E = −4 to −6.
- **Annealing for E = 2 at n = 11, 13 (target 1/(n+3), BCS values):** reached gamma = 0.07433 for n = 11 (target 0.07143) and 0.07000 for n = 13 (target 0.0625). Not found.
- **Rule annealing on the doubled base {2,...,2N}** (free small speeds, gap-targeted moves, n = 39): stuck at uncovered measure ≈ 6e−3, E ≈ −13.
- **Truncated Poliakova rules:** we tested chain {12,24,48}, removal of {8,32,96}, N = 60..100. Uncovered measure ≈ 11-18/N², so no cover. The chain ending at N for N = 24 and 48 gave E = −8.0 and −11.6.
- **"Remove-top" variant** (Poliakova gadget, but remove 2N instead of 192): **E = 0 exactly** for every even N tested (50..90, n = N−1), and E ≈ −0.43 to −0.90 for odd N. The remaining tight points are t = b/(2N), b a unit mod 2N. SLP from these points makes no progress (first-order degenerate). Rephasing t-speed N to 1/2 or (1±δ)/2 to kill them opens holes: E = −25 to −35 (N = 60, 64, 70).
- **Set-cover MILP over (speed, shift-menu) candidates at fixed δ (HiGHS):**
  - Full problem, n = 30 (L = 40, 12-value menu): LP bound 17.8, best integer solution 50 runners, needed ≤ 30.
  - Gap-restricted MILP: reproduces Poliakova's rule at N = 96 in 1-2 s.
  - Proven **infeasible** (in this candidate/menu class, δ = 1/(N+0.3) or 1/(N+1)): 3-smooth candidates for N = 48, 72, 94; evens ≤ 50 + odds ≤ 31 for N = 94; divisor-structured candidates for N = 48, 60, 64, 72, 80, 90, 94.
  - Time-outs, no solution: all evens free (N = 94, 600 s); 5-smooth rich menus (N = 64..94, 120 s each).
- **Grid MILP, speeds 1..n, shifts in (1/Q)Z:** found 1..8 with shifts (0,8,8,6,2,4,0,2)/20 covering at exactly 1/10 (E = 1). Infeasible on the grid Q = n+2 at δ = 1/(n+2) for n = 9, 10. Time-outs for n = 11 (Q = 28, δ = 1/14) and n = 12, 13.

## Sources

- **[Z26]** Y. Zhang, *Tight instances of the Lonely Runner Conjecture: complete classification of one-entry modifications, a new infinite family, and the growth bound*, [arXiv:2608.13599](https://arxiv.org/abs/2608.13599), version 3. Question 8.5 (posed in version 2) and Appendix A, where `gamma`, `gamma^min` and `Gamma(n)` are defined for distinct positive integer speeds.
- **[BCS26]** M. Blanco, F. Criado, F. Santos, *Coloopless zonotopes and counterexamples to the Shifted Lonely Runner Conjecture*, [arXiv:2603.24784](https://arxiv.org/abs/2603.24784), Theorem 1.8: counterexamples for 5 <= n <= 17.
- **[P26]** D. Poliakova, *More (shifted) runners, less loneliness*, [arXiv:2609.23952](https://arxiv.org/abs/2609.23952): `E_n >= 1` for all n >= 95.
