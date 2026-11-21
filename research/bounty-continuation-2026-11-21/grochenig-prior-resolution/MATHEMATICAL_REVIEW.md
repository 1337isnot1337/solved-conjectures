# Gröchenig 4.12: independent audit of the earlier public upper-density proof

Audit date: 21 November 2026. Scope: mathematical correctness and overlap with the repository result. Publication chronology is being checked separately by the conjectures agent. This note does not certify the earlier manuscript's lower-density or central-dominance arguments.

## Finding

The upper-density argument in Section 3 of Alexanja Senke's public v2 manuscript is valid. For every positive integer Q it constructs a real, nowhere-zero, absolutely summable coefficient sequence for the integer translates of exp(-pi x^2), with coefficient sign-change density 1/Q and infinite upper Beurling density of real zeros. Setting Q=2 gives a stronger counterexample to the exact universal upper inequality addressed in the repository's PROOF.md.

This finding comes from checking the argument, not from its title or abstract. The Lean verification of the repository's construction does not remove this mathematical overlap. Once the earlier public date is established, the result must not be counted as a newly resolved open problem under the user's rules. The repository proof and formalization remain available in immutable Git history, with their provenance described accurately in the correction record.

## Objects inspected

- Original question: Karlheinz Gröchenig, *Infinite totally positive matrices: some open problems*, [published primary text](https://link.springer.com/article/10.1007/s44146-026-00264-3), Definition 2.5, the definition of V-infinity in Section 3, and Problem 4.12.
- Earlier manuscript: [immutable main.tex](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/blob/66bfb67ebb919ad6e8c373beb190cfa0144bd84f/paper/main.tex), commit `66bfb67ebb919ad6e8c373beb190cfa0144bd84f`, blob `1143fab2f2aedbc68bf77464ed36e30667a5728c`. I fetched the definitions and entire-extension lemma, and the full Section 3 argument through its upper-density conclusion, using the GitHub file connector.
- Earlier public metadata: [repository](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density), [research atlas](https://interlink-bridge.com/research-atlas.html), and [version DOI](https://doi.org/10.5281/zenodo.23055369). The manuscript header and atlas state 30 September 2026; the date/provenance audit is separate.
- Current repository result: `results/grochenig-zero-density/PROOF.md` and `SOURCES.md`, read from the local checkout. The current mathematical conclusion is D-plus of the zero set at least 1, versus coefficient sign-change density exactly 1/2, with absolutely summable real coefficients.

## Hypothesis and conclusion comparison

| Item | Original question / current proof | Earlier Section 3 |
|---|---|---|
| Generator | The Gaussian exp(-pi x^2), explicitly an allowed Pólya frequency function | Same Gaussian |
| Translation sites | Integers | Integers |
| Coefficients | Bounded real; the current construction is in l1 | Real and in l1, hence bounded |
| Nonzero function | Required for meaningful locally finite zeros; proved by sign margins | Proved by preserved nonzero bracket endpoints |
| Coefficient sign changes | Consecutive nonzero coefficients, skipping zeros | No coefficient vanishes, so changes occur at adjacent sign transitions |
| Upper density | Translation-uniform Beurling density | Same definition |
| With Q=2 | D-plus(c)=1/2 and D-plus(Z(f))>=1 | D-minus(c)=D-plus(c)=1/2 and D-plus(Z(f))=infinity |

The earlier sequence has no zero entries, whereas the current sequence is supported on even integers. This difference does not narrow the original question: both are permitted coefficient sequences. A global positive rescaling gives any desired positive l1 norm without changing signs or zeros.

## Independent algebra and convergence checks

The checks below use elementary symmetric polynomials instead of assuming the manuscript's finite q-binomial identity.

Fix Q>=1, m>=1 and 0<theta<1. Put a_s=exp(-2*pi*theta*Q^2*s)>0. Expanding the finite product in z gives

```math
\prod_{s=1}^m(1-a_sz)=\sum_{j=0}^m(-1)^j e_j(a_1,\ldots,a_m)z^j.
```

Every elementary symmetric coefficient e_j is positive. Substitute z=exp(2*pi*Q*x) and multiply by exp(-pi*x^2). Completing the square shows that the coefficient of exp(-pi*(x-Q*j)^2) is

```math
(-1)^j e_j(a_1,\ldots,a_m)\exp(\pi Q^2j^2).
```

Thus all finite-block coefficients are nonzero and have the stated alternating signs. Each of the distinct points theta*Q*s is a simple root: exactly one product factor vanishes, its derivative is -2*pi*Q, and the remaining factors are nonzero. Positive normalization by the largest coefficient magnitude makes every coefficient at most one in absolute value without moving any root.

For each finite block, simple roots admit disjoint closed brackets with opposite endpoint signs, all inside the interval (0,m*theta*Q+1). The smallest absolute endpoint value is strictly positive. No uniform lower bound across different blocks is needed; each induction stage uses its own positive margin.

The background coefficients are b_k=(-1)^floor(k/Q)*exp(-|k|^4), an l1 sequence. Its Gaussian sum tends to zero as x tends to positive infinity: truncate the l1 coefficient tail to total mass below epsilon/2; the corresponding function tail is bounded by that mass because each real Gaussian is at most one; the remaining finite sum tends to zero.

Every finite Gaussian block tends to zero at either real infinity, uniformly when its argument is allowed an additional translation in a fixed compact set. This justifies both recursive requirements: the old sum is small on the newly shifted finite family of brackets, and the new block is small on every previously fixed bracket. Choosing the shift in 2Q times the integers presents no obstruction because that set is unbounded above. Disjoint coefficient supports can be imposed at the same step.

The chosen block weights obey

```math
\sum_{n\ge1}\lambda_n(m_n+1)=\sum_{n\ge1}2^{-n}=1.
```

Therefore adding all normalized blocks to b gives an l1 coefficient sequence. On any compact complex set with imaginary part bounded by S, the Gaussian magnitude is at most exp(pi*S^2), independently of its integer translate. The l1 bound supplies absolute, locally uniform convergence and an entire sum. This also justifies grouping the sum into its blocks.

At a block site R_n+Q*j, the background sign is (-1)^j because R_n/Q is even. The added block coefficient has the same sign. All untouched sites retain their nonzero background coefficient. Hence every final coefficient is nonzero and the periodic sign pattern is exact, with no possible cancellation.

## Independent perturbation and density checks

For a fixed earlier block i, summing the protection budgets gives the exact geometric bound

```math
\sum_{n>i}2^{-n-i-4}=2^{-2i-4}\le\frac1{64}.
```

The earlier-block error was below one quarter of the block's endpoint margin. Thus the combined error is below 17/64 of that margin, in particular below one half. Every prescribed endpoint sign survives. There is a zero in each disjoint bracket, and the sum is not identically zero. Its real zeros are locally finite by analyticity.

With m_n=2*n^3 and theta_n=1/(n+1), all m_n preserved zeros lie in an interval of length

```math
L_n=\frac{2Qn^3}{n+1}+1.
```

Here L_n tends to infinity, while m_n/L_n tends to infinity. For example, for all sufficiently large n,

```math
\frac{m_n}{L_n}\ge\frac{n+1}{2Q}.
```

This proves infinite upper Beurling density directly from its defining limsup. If integer lengths and starting points are used instead, enlarge each interval by less than two; the same divergent lower bound follows. The manuscript's displayed arrow to the variable expression (n+1)/Q is imprecise asymptotic notation, but the exact inequality above proves the claimed conclusion and needs no substantive repair.

Because the final sign pattern is periodic and nowhere zero, its sign-change indices are precisely k congruent to Q-1 modulo Q. An interval of length L contains L/Q plus a bounded endpoint error such indices, uniformly in its translation. Both coefficient densities are therefore 1/Q.

## Audit boundary and counting consequence

No unproved interpolation assertion, numerically chosen parameter, external theorem about Gaussian zeros, or step from a finite example to an unsupported infinite limit is needed in this upper-density argument. Its ingredients are the exact finite product expansion, elementary tail limits, l1 convergence, sign preservation, and the intermediate value theorem. All of those steps check.

This audit establishes mathematical prior overlap for the upper-density counterexample. It does not certify every theorem of the prior manuscript, the lower-density claim, its central-dominance repair, or any worldwide priority claim. The manuscript's lack of peer review or Lean verification does not invalidate the checked elementary upper-density proof.

The existing SOURCES.md conclusion that no prior resolution was located is now incomplete. The newly inspected primary source requires a correction to eligibility and counting. Under the repository's exclusion rule, root is removing the duplicate active result and verifier references while preserving the valid proof and formalization in Git history. No existing repository file was edited by this review.
