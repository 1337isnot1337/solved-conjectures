# Algebra research checkpoint

21 November 2026. This file records unresolved work and excluded approaches. It does not add a solved conjecture to the repository.

## Completed mathematical work handed off

- Fang–Zhang–Zhao's Sturm conjecture: the complete proof, source audit and exact checker were reviewed independently twice and integrated by root in `results/fang-zhang-zhao-sturm`, commit `33f3792`, issue [162](https://github.com/1337isnot1337/solved-conjectures/issues/162).
- Mao–Wang's conjecture: `mao-wang-delannoy-square-proof.md` gives a complete candidate proof of the entire Delannoy clause. The analysis reviewer checked its identities, signs, source conventions and root count without finding a substantive gap. The full conjecture also has an Eulerian clause, which remains unresolved here. The public Omega partial route is credited. Discussion: [83](https://github.com/1337isnot1337/solved-conjectures/issues/83).

## Alexandersson's balanced-array conjecture

The exact original statement is in [Per Alexandersson's issue 2005](https://github.com/PerAlexandersson/RealRooted/issues/2005), created 24 October 2026 and still open when inspected. The conjecture is also on his [current open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm). Repository discussion: [165](https://github.com/1337isnot1337/solved-conjectures/issues/165).

For all integers `n>=0` and `1<=r<=d`, let `a_(n,k)` count `n` by `d` zero-one arrays with every column sum `k` and every row sum at most `r`. The conjecture states that `sum_k a_(n,k)q^k` has only real roots. The author's issue explicitly distinguishes this from matroid Chow or Kazhdan–Lusztig polynomials. It records finite rank-two checks and an unreviewed eventual argument for `U(2,4)`, not a complete solution.

The exact corank-one formula used in `balanced_arrays_screen.py` is

```math
a_{n,k}^{(d-1,d)}
=\sum_{j=0}^k(-1)^j\binom nj\binom{n-j}{k-j}^{d}.
```

This is inclusion–exclusion over rows that are all ones. The implementation checks the exact necessary Newton inequalities. It uses floating roots only as a triage step and calls exact Sturm counting for any detected candidate. Through `3<=d<=20` and `2<=n<=100`, no Newton violation was found; the floating triage for `n<=30` did not produce a certified counterexample.

For general `r`, the code retains total counting mass on sorted column-sum vectors. If a value occurs in `h` columns, choosing `j` of them for the new row has multiplicity `binom(h,j)`. Summing over choices with at most `r` selected columns gives an exact symmetry-compressed row recurrence. States exceeding the final possible balanced column total may be dropped because future additions cannot reduce a column total.

The following bounded general screens produced no counterexample:

| Row cap `r` | Columns `d` | Maximum rows `n` |
|---|---|---|
| 3 | 5 | 30 |
| 3 | 6 | 24 |
| 4 | 6 | 24 |
| 4 | 7 | 20 |
| 3 | 7 | 20 |

No positive conclusion for all roots follows from these floating screens. No refined interlacing recurrence, total-positivity theorem or root-preserving diagonal extraction has been proved. The full conjecture remains unresolved.

Status searches included `"balanced arrays" "real-rooted"`, `"balanced arrays" uniform matroids proof`, and `"RealRooted" "2005" "balanced"`. The phrase "balanced arrays" also returns unrelated design-theory literature; those hits were not treated as sources about the current matrix-enumeration polynomial.

## Skew Schur Ehrhart real-rootedness

The target is the conjecture on [Alexandersson's open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm): for every skew shape `lambda/mu` and alphabet bound `k`, the `h*` numerator of `n -> s_(n lambda/n mu)(1^k)` is real-rooted. The [tableaux page](https://www.symmetricfunctions.com/realRootedTableaux.htm) distinguishes this statement from real-rootedness of the counting polynomial itself and from the ordinary skew-shape descent polynomial.

`skew_schur_ehrhart_screen.py` computes each value by the original Jacobi–Trudi determinant

```math
s_{n\lambda/n\mu}(1^k)
=\det\left[\binom{k+n(\lambda_i-\mu_j)-i+j-1}{k-1}\right],
```

where the entry is zero when the complete-homogeneous degree `n(lambda_i-mu_j)-i+j` is negative. Fraction-free Bareiss elimination uses exact integers. Finite differences find the actual polynomial degree, with the general degree bound `length(lambda)*(k-1)`, and the usual finite difference transform then computes `h*` exactly. Extra values check the inferred degree. Shapes admitting no tableaux at positive dilation are omitted.

The source example `(lambda,mu,k)=((3,2),(1),3)` reproduces `h*=1+16t+22t^2+3t^3`. A seeded screen of 10,000 generated shapes produced 8,719 valid nonempty instances and no certified counterexample. Floating root computations are only candidate screening; an apparent failure is checked by exact Sturm counting. This is not a proof of the conjecture or a new verified numerical range.

The recent Jochemko–Menon result concerns nonnegative coefficients of the Ehrhart counting polynomial, not the roots of `h*`; current scope is described on the author's [Ehrhart page](https://www.symmetricfunctions.com/ehrhart.htm). The ordinary-skew order-polytope question in Ferroni–Morales–Panova, [*Skew shapes, Ehrhart positivity, and beyond*](https://londmathsoc.onlinelibrary.wiley.com/doi/full/10.1112/plms.70204), is also a different object. Status searches used `"skew Schur" "real-rooted" conjecture`, `"skew" "Schur Ehrhart" "conjecture"`, and `"skew" "h*" "real-rooted" "Jochemko" "Menon"`. No complete resolution was located, but the full recent Jochemko–Menon manuscript was not read in this bounded exploratory screen.

## Existing lanes checked before reuse

Alexandersson's Catalan-word peak conjecture already has issue [59](https://github.com/1337isnot1337/solved-conjectures/issues/59) and two substantial research notes; it was not duplicated. Gessel–Lin–Zeng's conjecture likewise has issue [84](https://github.com/1337isnot1337/solved-conjectures/issues/84), including failed bivariate-stability shortcuts. Zeng's coefficientwise q-Narayana total-positivity conjecture is being investigated by the combinatorics lane; this lane did not repeat its exact minor scans.

## Alexandersson's key-polynomial conjecture

Repository issue [173](https://github.com/1337isnot1337/solved-conjectures/issues/173). The full statement is real-rootedness of the Ehrhart numerator of `k -> kappa_(k lambda,sigma)(1,...,1)` for every partition and permutation. It appears on the [author's open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) and as Conjecture 6.3 in Gao–Liu–Yang–Zhao, [*Lascoux series, parking functions and noncrossing partitions*](https://arxiv.org/abs/2608.15100). The stronger Bruhat-chain interlacing conjecture is already false and was excluded. The author's [issue 1396](https://github.com/PerAlexandersson/RealRooted/issues/1396) still treats the individual real-rootedness question as open.

`key_ehrhart_screen.py` evaluates the Demazure operators exactly in the Taylor coordinates `x_i=exp(a_i h)`. The identity `pi_i f=f+(f-s_i f)/(exp((a_i-a_(i+1))h)-1)` gives a finite adjoint recurrence with Bernoulli numbers. Applying this functional to `exp(k (a.lambda) h)` gives the entire dilation-counting polynomial in rational arithmetic, from which the numerator is recovered by exact finite differences. Validation against direct expanded Demazure characters passed 180 evaluations, plus the longest-permutation staircase formula.

Command: `python agent-algebra/key_ehrhart_screen.py --n 7 --permutations 200 --shapes 40 --max-part 20 --max-length 17`, default seed 2611173. It computed 7,720 cases from 193 distinct accepted permutations. No certified counterexample was found. Coefficients are exact; roots of apparent positive cases were only floating-point triage. This is bounded research evidence, not a resolution or an exact positive classification.

## Alexandersson's border-strip conjecture

Repository issue [176](https://github.com/1337isnot1337/solved-conjectures/issues/176). The original [author question](https://mathoverflow.net/questions/353150/schur-positive-expression-involving-border-strip-tableaux) asks whether `sum_mu |BST(lambda,mu)| p_mu` is Schur-positive for every partition lambda. There is no `z_mu` denominator. Unsigned border-strip counts are not absolute irreducible-character values. The tableau labels weakly increase, so removing the largest label means removing the last (smallest) part of the partition weight first.

`border_strip_screen.py` uses beta-number bead moves to enumerate rim-hook removals, including their heights. Unsigned counts use the prescribed order. Character values use signed Murnaghan–Nakayama in the opposite order, providing an independent character computation. Their exact matrix product gives every Schur coefficient. An explicit bound selects 64-bit arithmetic only when overflow is impossible; otherwise Python integer arithmetic is used. It reproduces the original size-four coefficient table, checks `U_(21),(21)=2` versus character zero, and checks character norms.

Command: `python agent-algebra/border_strip_screen.py --max-n 20`. Every Schur coefficient for every partition of every size 1 through 20 was nonnegative. This does not prove the all-partition statement. Searches of the original question, author pages, and phrases `border-strip Schur-positive`, `cancellation-free character`, and the exact question identifier found no full resolution.

## Additional prior-art exclusions

- Xie–Zhang's binomially weighted inverse Kazhdan–Lusztig real-rootedness conjecture, [BLMS 58 (2026), e70264](https://doi.org/10.1112/blms.70264), was already disproved by Braden–Ferroni–Matherne–Nepal, [*Inverse Kazhdan–Lusztig polynomials of matroids under deletion*](https://arxiv.org/abs/2510.01086), Theorem 5.3, using a rank-19 matroid. The authors' [full manuscript](https://jpmather.math.ncsu.edu/documents/iklpmud.pdf) explicitly identifies the same Hadamard product with `(1+x)^deg(Q)`. No new computation was started.
- Agoh's alternating-numerator characterization was already refuted publicly for `f=(X-2)^2` on the [Omega research page](https://the-omega-institute.github.io/trureturing-mdbook/Problems/agoh-alternating-numerator-characterization.html). This target was excluded before a claim was made.
- Bapat–Lal's subset q-permanent inequality, recorded as Conjecture 3 in da Fonseca, [arXiv:1804.02231](https://arxiv.org/abs/1804.02231), is already false. The current [Open Problems in Numerical Linear Algebra record MI-19](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/matrix-inequalities-and-norms/MI-19/problem.tex) contains Matthew Colbrook's 11 September 2026 counterexample: a four-dimensional positive semidefinite Gram matrix, `q=7/8`, `S={2}`, and exact difference `-3235575/16384`. The original restricted sum retains inversions in the full permutation; it must not be replaced by a product of two principal-submatrix q-permanents for an arbitrary subset. The current primary record was read, not just its stale search excerpt.
- The extension of q-permanent monotonicity to `q>1` was already refuted by da Fonseca and Dev Goyal, [arXiv:2611.14694](https://arxiv.org/abs/2611.14694), dated 10 November 2026. Their paper gives counterexamples for every interval endpoint greater than one. This does not settle the original Bapat–Lal monotonicity question on `[-1,1]`.
- Liang–Sagan's conjecture that Stirling columns make one transition from log-concavity to log-convexity was already proved in Shi-Mei Ma's September 2026 manuscript [*Log-concavity and log-convexity of Stirling columns, and bottom-heaviness of q-Stirling numbers*](https://www.researchgate.net/publication/414355049_Log-concavity_and_log-convexity_of_Stirling_columns_and_bottom-heaviness_of_q-Stirling_numbers). The author's source explicitly covers every column and a more general parameter family.
- Liang–Sagan's ordered-pinnacle-fibre lattice question already has a public all-`n>=6` obstruction in the [Omega research record](https://www.trureturing.org/research/liang-sagan-2026-pinnacle-middle-order/). A nearby counting-log-concavity question appeared to reduce to an elementary geometric tail for fixed pinnacle data; it was not promoted as a new result.
- Ross–Wu's derived-Schur log-concavity conjecture, [arXiv:2403.04101](https://arxiv.org/abs/2403.04101), was already resolved by Lu–Zheng, [arXiv:2506.16992](https://arxiv.org/abs/2506.16992). The author's page explicitly records the update.
- Thomas–Yong's stable Grothendieck join–meet positivity conjecture was already proved by Guo–Kang–Liu–Xiong, [*A proof of the Grothendieck join-meet positivity*, arXiv:2610.34607](https://arxiv.org/abs/2610.34607), 25 October 2026. The [full primary manuscript](https://borowiecki.dev/pdf/2610.34607), Theorem A, states exactly `G_(lambda join mu) G_(lambda meet mu)-G_lambda G_mu` is a nonnegative combination of `(-1)^(|nu|-|lambda|-|mu|) G_nu`. Replacing the variables by their negatives gives the modified/signless-G convention of the candidate. The MathDB entry still marked open was stale. No computation was started after this scope check.

## Reviewed packages and priority failures

The complete Vishnyakova root-radius package is in `vishnyakova-root-radius/` and is tracked in [issue 182](https://github.com/1337isnot1337/solved-conjectures/issues/182). Two independent reviews passed. Its source audit explicitly attributes the prior equal-parameter proof and distinguishes it from the new arbitrary-parameter argument. The exact checker passes 73 algebraic checks; the proof covers every degree.

The independent mathematical review of the Yang–Chu–Zhang monotonicity argument is in `../agent-analysis/yang-chu-zhang-monotonicity/ALGEBRA_REVIEW.md`. The mathematics passed, but the analysis lane then located a complete earlier covariance proof in the primary PrincipiaMath archive, immutable commit `34b8b155d7db464ad7306f70b16d3af9cee34501` dated 27 October. Consequently this is excluded from the campaign's new-resolution count. A successful proof review does not establish novelty.

