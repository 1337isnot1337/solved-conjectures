# Joint conjecture results

Priority correction, 21 November 2026: [the checked September proof](../bounty-continuation-2026-11-21/grochenig-prior-resolution/) resolves the same upper-density assertion as the now-excluded Gröchenig package. The selected joint tally is nine named families. The earlier analytic proof and later Lean verification remain in Git history; neither supplies a new-resolution count.

Research checkpoint: 21 November 2026. Coordination: [issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156).

## Count and attribution

After the prior-resolution correction below, this reviewed joint checkpoint includes eleven complete proposed result packages from two concurrent groups. Ten packages resolve the printed source assertions directly; grouping the two López Pouso–Segura packages gives **nine named conjecture/problem families** in the strict tally below. Fang–Zhang–Zhao's infinite-log-convexity disproof is excluded because the complete argument was already public on 26 October 2026.

The remaining package proves Novelli–Thibon's intended monomial-product conjecture with a source-supported correction of its printed exponent index. It is documented as an additional result outside the strict nine-family tally.

Seven packages were developed by the current four-worker group: Chen–Kitaev–Zhang, Zhu, the two Ferreira–Simon problems, Simon, Novelli–Thibon, and the López Pouso–Segura quadrature disproof. Four retained packages were developed by the parallel group recorded in [its checkpoint](../campaign-20261121/): McCrea, the López Pouso–Segura Bessel proofs, Vishnyakova, and Han–Sabag–Kostina–Hassibi. The current group independently reviewed those four retained packages before including them here. Its mathematically valid Fang–Zhang–Zhao review is preserved as a review of a rediscovery, with no new-result credit. The [original attribution audit](ATTRIBUTION.md) and [Han–Sabag–Kostina–Hassibi supplement](ATTRIBUTION_HAN.md) check the baseline, exact publication histories and counting arithmetic. This is an attributable joint tally. Other packages in the parallel group's live checkpoint remain outside this selected review unless separately admitted after cross-review.

Each package has a complete written proof or exact refutation with its precise source scope stated, a separate internal mathematical review, and a documented search for earlier resolutions. All remain unrefereed. The searches found no earlier full resolution for the retained packages within their stated scope; inaccessible sources and indexing limits are recorded. Subsequent direct archive inspection superseded the earlier negative search for Fang–Zhang–Zhao, Sun–Zhao, and Gröchenig, as documented below. A search cannot establish worldwide absence of prior work.

No Lean work was performed during the original research campaign. Exact algebraic computations check identities and source conventions. Positive finite tests are not used as proofs of universal statements.

## The nine families

| # | Named conjecture | Complete result | Origin and discussion |
| --- | --- | --- | --- |
| 1 | [Chen–Kitaev–Zhang's record conjectures](../../results/chen-kitaev-zhang-records/) | Original Conjectures 1 and 3 hold for all permitted lengths and all four record statistics. Conjecture 2 is prior work and is credited. | Current group; [157](https://github.com/1337isnot1337/solved-conjectures/issues/157) |
| 2 | [Zhu's generalized Jacobi–Stirling conjecture](../../results/zhu-jacobi-stirling/) | The unweighted coefficientwise Hankel-total-positivity assertion is false, by an exact determinant identity and a strictly positive real witness. | Current group; [163](https://github.com/1337isnot1337/solved-conjectures/issues/163) |
| 3 | [Ferreira–Simon's stochastic-order conjecture](../../results/ferreira-simon-stochastic/) | The normalized Mittag–Leffler family decreases in stochastic order throughout the full parameter interval, with a strict common coupling. | Current group; [170](https://github.com/1337isnot1337/solved-conjectures/issues/170) |
| 4 | [Ferreira–Simon's diagonal Mittag–Leffler conjecture](../../results/ferreira-simon-diagonal/) | The function $`\alpha\mapsto E_{\alpha,\alpha}(-1)`$ is strictly increasing for $`0<\alpha<1`$. | Current group; [171](https://github.com/1337isnot1337/solved-conjectures/issues/171) |
| 5 | [Simon's stable-infimum conjecture](../../results/simon-stable-infimum/) | The normalized spectrally negative stable infimum has the conjectured convex order for every $`1/2\le\beta<\alpha<1`$, including the Brownian endpoint. | Current group; [175](https://github.com/1337isnot1337/solved-conjectures/issues/175) |
| 6 | López Pouso–Segura's conjectures: [Bessel sequences](../../results/lopez-pouso-segura-bessel/) and [quadrature upper bounds](../../results/lopez-pouso-segura-quadrature/) | Published Conjectures 2, 5 and 8 hold in full. The strict upper inequalities in Conjectures 3 and 7 are false. Two packages count as one family. | Parallel group: Bessel; current group: quadrature. [177](https://github.com/1337isnot1337/solved-conjectures/issues/177), [184](https://github.com/1337isnot1337/solved-conjectures/issues/184) |
| 7 | [McCrea's conjecture](../../results/mccrea-single-crossover/) | Original Conjecture 9.2 holds: a unique crossover density exists for every permitted modulus, with the eventual strict comparisons for every fixed density in the source interval on either side of the crossing. | Parallel group; [168](https://github.com/1337isnot1337/solved-conjectures/issues/168) |
| 8 | [Vishnyakova's root-radius conjecture](../../results/vishnyakova-root-radius/) | The full outer-root-radius bound holds for every positive degree, every positive weight, and arbitrary independent parameters. A stronger disk bound is proved and the extremizer is identified. Original and weighted formulations count together. | Parallel group; [182](https://github.com/1337isnot1337/solved-conjectures/issues/182) |
| 9 | [Han–Sabag–Kostina–Hassibi's conjecture](../../results/han-sabag-kostina-hassibi/) | The universal Lyapunov-positivity sparse-optimality assertion is false. An exact feasible encoder beats the infimum over every sparse assignment, with a strict gap on an open family. | Parallel group; [197](https://github.com/1337isnot1337/solved-conjectures/issues/197) |


## Additional corrected-source result

[Novelli–Thibon's monomial-product conjecture](../../results/novelli-thibon/) is proved for all partition pairs and independent parameters, using the exponent index required by the source's own worked example. The correction and the exact intended statement are explicit. This additional result, including its hook-formula consequence, contributes zero to the strict nine-family count. Discussion: [issue 180](https://github.com/1337isnot1337/solved-conjectures/issues/180).

## Mathematical content

### Chen–Kitaev–Zhang

For every $`n\ge3`$, the record distributions on all separable permutations are unimodal with a maximum at two records. On reducible separable permutations, right maxima and left minima have weakly decreasing distributions from one record; on irreducible separable permutations, the same holds for left maxima and right minima.

The proof obtains three coefficient comparisons from the source generating functions and uses an explicitly credited prior tail theorem. It reconstructs the tail theorem and its sixteen exact certificates so that the argument is inspectable. Exhaustive short permutations only check the correspondence with the intended combinatorial classes.

[Proof](../../results/chen-kitaev-zhang-records/PROOF.md), [review](../../results/chen-kitaev-zhang-records/AUDIT.md), [sources](../../results/chen-kitaev-zhang-records/SOURCES.md). The fresh check of TT issue 20489 confirmed that it is a preregistration with no proof and no comments. The earlier Conjecture 2 theory file is unchanged and does not settle Conjectures 1 or 3.

### Zhu

For
```math
J_{n,k}=J_{n-1,k-1}+(ak^2+bk)J_{n-1,k},
\qquad P_n(x)=\sum_kJ_{n,k}x^k,
```
the exact identity is
```math
\det(P_{i+j}(x))_{0\le i,j\le2}
=2x^3\bigl[(a+b)(2a+b)(3a+b)-2a^2x\bigr].
```
Its $`a^2x^4`$ coefficient is $`-4`$. At $`(a,b,x)=(1,1,13)`$, the determinant is $`-8788`$. This refutes the universal unweighted conjecture. The factorial-weighted sequence in the neighboring proposition is a different object.

[Disproof](../../results/zhu-jacobi-stirling/PROOF.md), [review](../../results/zhu-jacobi-stirling/AUDIT.md), [sources](../../results/zhu-jacobi-stirling/SOURCES.md).

### Ferreira–Simon stochastic order

Let $`T_n`$ be the arrival times of one unit-rate Poisson process. For $`0<\alpha<1`$, the common representation
```math
X_\alpha=\left(\sum_{n\ge1}T_n^{-1/\alpha}\right)^{-\alpha}
=\frac1{\|(T_n^{-1})_{n\ge1}\|_{1/\alpha}}
```
has law $`M_\alpha/\Gamma(1-\alpha)`$, where $`M_\alpha`$ is the source's standard Mittag–Leffler random variable. Strict monotonicity of sequence norms gives $`X_\alpha>X_\beta`$ almost surely whenever $`\alpha<\beta`$. The series is finite in the required power range. Classical Poisson/stable representations are credited; the 2014 and 2025 formulations are one target.

[Proof](../../results/ferreira-simon-stochastic/PROOF.md), [review](../../results/ferreira-simon-stochastic/AUDIT.md), [sources](../../results/ferreira-simon-stochastic/SOURCES.md).

### Ferreira–Simon diagonal monotonicity

The classical Lamperti quantile is
```math
Q_\alpha(u)=
\left(\frac{\sin(\pi\alpha u)}
{\sin(\pi\alpha(1-u))}\right)^{1/\alpha}.
```
For $`u>1/2`$, its positive logarithm strictly decreases with $`\alpha`$. Pairing the reciprocal quantiles transforms the target Mittag–Leffler value into an integral of a strictly decreasing function of that logarithm. This proves strict increase throughout $`0<\alpha<1`$. The representation and quantile formula are prior ingredients.

[Proof](../../results/ferreira-simon-diagonal/PROOF.md), [review](../../results/ferreira-simon-diagonal/AUDIT.md), [sources](../../results/ferreira-simon-diagonal/SOURCES.md).

### Simon

Write $`I_\alpha`$ for minus the running infimum up to time one of the source-normalized spectrally negative $`1/\alpha`$-stable process, and put $`V_\alpha=\Gamma(1+\alpha)I_\alpha`$. The conclusion is
```math
V_\beta\le_{\mathrm{cx}}V_\alpha
\qquad(1/2\le\beta<\alpha<1).
```
The established Mellin transform yields two explicit Lévy densities for $`\log V_\alpha`$. Both increase with $`\alpha`$. Their nonnegative difference supplies an independent mean-one multiplier, and conditional Jensen proves convex order. The Brownian endpoint is included analytically.

[Proof](../../results/simon-stable-infimum/PROOF.md), [review](../../results/simon-stable-infimum/AUDIT.md), [sources](../../results/simon-stable-infimum/SOURCES.md).

### Novelli–Thibon: additional corrected-source result

The multivariate filling formula gives the first derivatives of every Schur coefficient at the unit parameter point. A universal comparison identity reduces them to the Schur coefficients of $`e_2p_1^{n-2}`$. The Pieri rule gives the required tableau exponent, proving the monomial-product identity in arbitrary degree.

The printed exponent index in Conjecture 5.7 conflicts with the source's own worked example. The package explicitly states the intended corrected index and verifies it. It does not count exploiting that printing error as a disproof. The separate Schur-positivity conjecture follows from earlier LLT positivity and is excluded from new-result accounting.

[Proof](../../results/novelli-thibon/PROOF.md), [review](../../results/novelli-thibon/AUDIT.md), [sources](../../results/novelli-thibon/SOURCES.md).

### López Pouso–Segura

For the three source sequences built from zeros $`j_k`$ of $`J_0`$ and weights $`J_1(j_k)^{-2}`$, the Bessel package proves every stated sign, strict monotonicity and exact limiting constant. A positive-measure representation makes the derivative of the inverse squared phase strictly convex. Trapezoidal and midpoint errors give the two basic monotonicity statements; a Fourier–Bessel resolvent identity and Euler–Maclaurin expansion fix the limiting constants. The third sequence is a weighted average of the first.

The quadrature package refutes the two separate strict upper inequalities. At $`n=2`$, both relevant errors equal
```math
\frac2{\sqrt3}-1>\frac17>\frac{\pi^2}{75}.
```
For the smallest positive node at every sufficiently large even degree $`n=2m`$, with $`\kappa=n+1/2`$,
```math
\frac{x_{m+1}}{z_{m+1}}
=1+\frac{\pi^2}{12\kappa^2}
+\frac{\pi^4}{120\kappa^4}+O(\kappa^{-6}).
```
The positive fourth-order term also excludes an eventual interpretation of the exact node bound. It leaves the leading asymptotic constant intact. The complete Legendre perturbation argument includes remainder control; finite diagnostics are supplementary.

[Bessel proof](../../results/lopez-pouso-segura-bessel/PROOF.md), [quadrature disproof](../../results/lopez-pouso-segura-quadrature/PROOF.md), [quadrature review](../../results/lopez-pouso-segura-quadrature/AUDIT.md), [additional independent priority audit](../2026-11-21-lopez-pouso-segura-independent-priority/AUDIT.md). These results do not claim to settle every conjecture in the source paper.

### Fang–Zhang–Zhao: prior resolution, excluded

For the original row-sum sequence, the third log-convexity iterate has an exact negative parameter-polynomial factor for every real $`m\ge6`$. Exact fourth iterates cover the two remaining integers $`m=4,5`$. This complete disproof of Conjecture 4.3 was already public in the [Principia source](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex) at commit `c18609e47b635722206b9a2e9dcd402d0edcfb0a`, 26 October 2026, 14:00:38 UTC. The earlier source contains the identical two witnesses and the same degree-17 factor, prefactor, and denominator. The present argument is a rediscovery and contributes zero.

The campaign's independent checker reconstructs the degree-36 identity from rational polynomial arithmetic and derives the integer witnesses directly from the original binomial formula. It imports none of the package's verifier code. Source indexing and the forward log-convexity operator were checked against the original paper.

[Disproof](https://github.com/1337isnot1337/solved-conjectures/blob/498434927da303b114869330552a875eea75bbbd/results/fang-zhang-zhao/PROOF.md), [independent review](../2026-11-21-fang-zhang-zhao-independent-review/AUDIT.md), [independent priority audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md).

### McCrea

For every integer $`k\ge3`$, there is a unique
```math
c_k\in(2^{-k-1},1/(4k))
```
with the conjectured eventual strict comparison for every fixed $`x\in(2^{-k-1},1/(4k))\setminus\{c_k\}`$. The threshold in perimeter may depend on $`k`$ and the chosen density.

Positive generating functions yield local coefficient asymptotics at the fixed saddle, including the floor in the marked count. The two growth exponents have the same maximum at different means. Between those means they move in opposite directions, so their difference has exactly one zero. Its sign determines the eventual comparison. No uniform threshold or assertion at the crossing itself is added.

[Proof](../../results/mccrea-single-crossover/PROOF.md), [independent review](../2026-11-21-mccrea-independent-review/AUDIT.md), [independent priority audit](../2026-11-21-mccrea-independent-review/PRIORITY.md).

### Vishnyakova

For every $`n\ge1`$ and positive $`\beta`$, if a real degree-$`n`$ polynomial $`P`$ has all roots of its transformed polynomial $`L_\beta(P)`$ in $`[-1,0]`$, then
```math
\left|z+\frac\beta2\right|
\le n-1+\frac\beta2
```
for every root $`z`$ of $`P`$. Consequently the maximum possible root modulus is exactly $`n-1+\beta`$, attained by $`(z+\beta)_n`$.

A complex-parameter tridiagonal argument and reciprocal-segment lemma give half-plane zero exclusion. Grace–Walsh–Szegő polarization and Hurwitz's theorem extend the conclusion to arbitrary independent parameters. The equal-parameter and bounded-degree prior results are credited and excluded as separate resolutions.

[Proof](../../results/vishnyakova-root-radius/PROOF.md), [independent review](../2026-11-21-vishnyakova-independent-review/AUDIT.md), [source audit](../../results/vishnyakova-root-radius/SOURCE_AUDIT.md).

### Han–Sabag–Kostina–Hassibi

The explicit matrix conjecture asks whether every feasible diagonal-matrix instance admits an optimal encoder with exactly one nonzero entry per column. The displayed feasible set allows independent diagonal positive semidefinite $`\Pi`$ and arbitrary real $`\Gamma`$; no extra relation between them is assumed.

For $`B=\mathop{\mathrm{diag}}(4/5,3/5)`$ and $`H=\mathop{\mathrm{diag}}(7/4,1)`$, the package gives rational $`\Pi,\Gamma`$ with unique Lyapunov solution
```math
J=\mathop{\mathrm{diag}}\left(\frac{211}{57600},
\frac{35289}{246113344}\right)\succ0
```
and feasible power $`23825/22491`$. All four sparse assignments, with arbitrary signs and magnitudes of their nonzero entries, have infima
```math
\frac{481}{441},\quad\frac{481}{144},\quad
\frac{865}{441},\quad\frac{8065}{7056}.
```
Consequently
```math
P_{\mathrm{unrestricted}}\le\frac{23825}{22491}
<\frac{481}{441}=P_{\mathrm{sparse}},
\qquad
P_{\mathrm{sparse}}-\frac{23825}{22491}
=\frac{706}{22491}>0.
```
The same construction works for every gain with
```math
\frac{1360}{567}\lt h^2<\frac{4675}{1296}.
```
The strict infimum gap rules out sparse minimizing sequences as well as sparse optimizers. This refutes the complete matrix assertion; no separate general communication-code stabilization claim is added.

The additional checker solves the four-variable Lyapunov system by rational Gaussian elimination and imports no package code. [Disproof](../../results/han-sabag-kostina-hassibi/PROOF.md), [independent mathematical review](../2026-11-21-han-sabag-independent-review/AUDIT.md), [independent priority review](../2026-11-21-han-sabag-independent-review/PRIORITY.md). The latter compares both source versions and records the remaining conference-PDF and indexing limits.

The [final global issue-history refresh](PRIORITY_REFRESH.md) supplements the individual source audits and records the decisive prior-proof exclusions.

## Prior-resolution corrections

The following mathematically valid reproofs do not contribute to the nine-family count.

| Excluded target | Decisive earlier resolution | Repository action |
| --- | --- | --- |
| Gröchenig's upper-density assertion | [Senke's public September manuscript](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/blob/66bfb67ebb919ad6e8c373beb190cfa0144bd84f/paper/main.tex), Section 3, gives a stronger counterexample to the same assertion. Two independent reviewers and root checked the proof. | Removed from the active collection and all current counts; [correction and dated evidence](../bounty-continuation-2026-11-21/grochenig-prior-resolution/). The valid independent proof and Lean verification remain in immutable Git history. |
| Fang–Zhang–Zhao's infinite-log-convexity conjecture | [Complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex), public commit `c18609e4`, 26 October 2026. Identical exact witnesses and all-parameter polynomial proof. | Excluded from the strict tally; [corrected independent priority audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md). |
| Sun–Zhao's iterated-ratio conjecture | [Complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex), public commit `34b8b155`, 27 October 2026, 02:59:18 UTC. Same twelfth iterate and retained indices 12, 13, 14, with an exact integer certificate. | Definitively excluded; [corrected priority audit](../2026-11-21-sun-zhao-independent-review/PRIORITY.md). It was already outside this joint strict tally. |
| Fang–Zhang–Zhao's Sturm conjecture | Full ordinary proof in [TT 18758](https://github.com/the-omega-institute/trureturing/issues/18758), 18 October 2026, with the same stronger real-base/all-parameter theorem. Later incomplete formalization does not change ordinary-proof priority. | Removed result/status/verifier registrations at [6670242](https://github.com/1337isnot1337/solved-conjectures/commit/66702422a6e04fa7a2fe1ca30ad529531442ab69); retained [credited research](../fang-zhang-zhao-sturm/). |
| KVZ reciprocal q-gamma kernel | Knowledge Sense's 13 October 2026 full reciprocal-kernel theorem. | Removed duplicate result and restored the prior exclusion; [correction](../campaign-20261121/kvz-prior-resolution.md). |
| KVZ Hankel-product conjecture | Simon's 2012 beta–gamma sign-regularity theorem already yields the required negation under the exact logarithmic coordinate change. | Removed duplicate result and restored the prior exclusion; same [correction](../campaign-20261121/kvz-prior-resolution.md). |
| Heim–Neuhauser's partition inequality | Gajdzica's earlier full classification and short-range formulas settle the conjecture. | Retained [priority note](../2026-11-21-heim-neuhauser/PRIOR-RESOLUTION.md); no result promotion. |
| Boudabsa–Simon's parameter monotonicity | The previously public gamma-ratio exponential-functional representation gives the same common-process ordering immediately. | Retained [prior audit](../2026-11-21-special-functions-boudabsa-simon-monotonicity/LITERATURE.md); excluded. |
| Novelli–Thibon's Schur positivity | Earlier fixed-descent LLT positivity and the corresponding multivariate extension already imply it. | Retained [prior note](../2026-11-21-combinatorics-novelli-thibon/POSITIVITY-PRIOR.md); no extra count. |

The broader exclusion ledgers record other screened targets. Reproving an earlier theorem does not satisfy the requested novelty condition.

## Uncounted research

Cavey–Lee's staircase factorization has a [reviewed divisibility argument](../2026-11-21-combinatorics-cavey-lee/DIVISIBILITY.md), while quotient positivity remains unresolved. Simon's informal Asian-subroof question has a complete theorem for a specified relaxed curve interpretation, but the original geometric scope and a relevant unread thesis remain unresolved. Neither contributes to the tally.

Coulter–Do–Moskovsky's full-profile limiting roots and eventual monotone tails are proved in [the reviewed asymptotic note](../2026-11-21-combinatorics-coulter-moskovsky/ASYMPTOTIC.md). The stronger all-genus monotonicity statement has an exact initial reversal already implicit in the authors' 2022 polynomial table. The [scope note](../2026-11-21-combinatorics-coulter-moskovsky/SCOPE.md) and [independent priority audit](../2026-11-21-combinatorics-coulter-moskovsky/PRIORITY.md) distinguish this prior data from the general theorem. The package proves the natural asymptotic reading and remains outside the strict tally.

The [Rivero scope note](../2026-11-21-special-functions-rivero/SCOPE.md) documents an arithmetic obstruction to the literal real-threshold tail equivalence. The intended nonarithmetic scope and related prior full text remain unsettled, so this is also uncounted.

Sun–Zhao's iterated-ratio counterexample passed [independent mathematical and source-indexing review](../2026-11-21-sun-zhao-independent-review/AUDIT.md), but direct inspection subsequently located the same complete disproof in the [earlier Principia source](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex). Its public commit predates this campaign by 25 days. The package is definitively excluded as prior work, not merely held for unread sources. The journal and Maple [access history](../2026-11-21-sun-zhao-independent-review/SOURCE_ACCESS.md) is preserved as a historical record; those access gaps no longer determine the priority decision. Sun–Zhao was never in this joint strict tally, so its exclusion does not reduce the nine-family count again.

## Delivery and review

All retained packages are on main and linked from the repository catalogue. Excluded packages are linked only through credited research or immutable historical revisions. The quadrature publication at [a0dad99](https://github.com/1337isnot1337/solved-conjectures/commit/a0dad99107f4ae66a6b1a525bd632464386c68e6) passed the exact README gate for 53 entries and strict MathML rendering of all nine affected Markdown pages, comprising 233 expressions. A subsequent site failure exposed doubled TeX escapes in the independently published Vishnyakova package; those escapes, an unsupported text command and its missing explicit status marker were corrected. Its landing page and proof then rendered 138 expressions successfully.

The complete research-site build and its content, link, mathematics and metadata checks passed at commit 444696374a21085f0c8193db5facab49ede6e616, [run 44879720088](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44879720088). This check includes the Gröchenig publication and the Vishnyakova rendering repairs.

The subsequent [full research-site run 44880555899](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44880555899) passed at commit a331a79e4f440a9c95f66aeb3f68a3433ffd61f9, which was then described as a strict ten-family checkpoint before the later Fang–Zhang–Zhao priority withdrawal. Its checked repository also contains the Han–Sabag–Kostina–Hassibi package now admitted above.

The written proofs and source audits are the mathematical evidence. Automated algebra and rendering checks establish their stated technical properties, not external acceptance or global priority.

