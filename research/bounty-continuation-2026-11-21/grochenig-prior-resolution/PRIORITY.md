# Gröchenig Problem 4.12: earlier public upper-density counterexample

Audit date: 21 November 2026. Reviewer: `conjectures_bounties`.

## Finding

The repository's Gaussian upper-density counterexample is independently valid, but the mathematical assertion it refutes was already refuted in an earlier public manuscript by Alexanja Senke. The earlier upper-density argument was read and checked; this conclusion does not rest on its title or abstract. The repository result must not be counted as a newly resolved open problem or an eligible new bounty solution.

This audit concerns the upper-density result only. It does not certify the earlier manuscript's separate lower-density or dominance theorems, establish who first discovered the phenomenon, or establish any bounty terms.

## Primary evidence and dates

The lead was [Interlink Bridge's research atlas](https://interlink-bridge.com/research-atlas.html). It distinguishes a restricted version dated 29 August 2026, DOI `10.5281/zenodo.22661662`, from an open public version dated 30 September 2026, DOI `10.5281/zenodo.23055369`. The restricted version's contents were not inspected and are not needed for this conclusion.

The public version has an accessible [author repository](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density). Its exact manuscript is pinned here:

[paper/main.tex at commit 66bfb67ebb919ad6e8c373beb190cfa0144bd84f](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/blob/66bfb67ebb919ad6e8c373beb190cfa0144bd84f/paper/main.tex)

GitHub API metadata independently supplies the following chronology:

| Evidence | Observed value |
|---|---|
| Repository creation | `2026-09-30T08:55:59Z` |
| Manuscript commit | `66bfb67ebb919ad6e8c373beb190cfa0144bd84f` |
| Commit author and committer time | `2026-09-30T09:08:29Z` |
| Commit verification | GitHub signature valid; `verified_at=2026-09-30T09:08:31Z` |
| File blob, both current and pinned | `1143fab2f2aedbc68bf77464ed36e30667a5728c` |
| Repository latest push | `2026-09-30T10:11:20Z` |
| Current visibility | Public |
| File-specific history | One commit, the September manuscript commit above |
| Our repository's first proof commit | `d707c6a032f7210ac8d5e957bfc77c5b00fcaa3f`, `2026-11-21T01:15:24-06:00` |

API sources: [repository metadata](https://api.github.com/repos/interlink-Bridge/groechenig-problem-4-12-gaussian-density), [manuscript history](https://api.github.com/repos/interlink-Bridge/groechenig-problem-4-12-gaussian-density/commits?path=paper/main.tex&per_page=100), and [signed commit](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/commit/66bfb67ebb919ad6e8c373beb190cfa0144bd84f). The local first-proof date was obtained from `git log --reverse` for `results/grochenig-zero-density/PROOF.md`.

The atlas and public repository were also returned by the web index with an earlier crawl. The present repository metadata does not itself prove historical visibility at every instant. Taken with the declared public release, indexed publication, and September signed source commit, the evidence supports an earlier public proof. Direct Zenodo and DataCite retrieval failed in this tool session; no inspection of their inaccessible records is claimed.

## Exact mathematical comparison

The [original published problem](https://link.springer.com/article/10.1007/s44146-026-00264-3) was inspected directly: Section 4.3 defines the sign-change set and asks the density comparison for bounded coefficients in Problem 4.12; the Gaussian is included after Definition 2.5. Both works use the integer shifts of `exp(-pi*x^2)` and the original convention that coefficient zeros are skipped when counting sign changes. Both use the translation-uniform upper Beurling density, not the centered average density.

| Property | Earlier manuscript, Theorem 1.3 and Section 3 | Current repository |
|---|---|---|
| Coefficient class | Real, absolutely summable, every coefficient nonzero | Real, absolutely summable |
| Sign changes | For every positive integer `Q`, exact periodic pattern with both densities `1/Q` | Supported on even integers; upper sign-change density `1/2` |
| Upper density of real zeros | Infinite | At least `1` |
| Common consequence | Upper inequality in Problem 4.12 is false | Same consequence |

Choosing `Q=2` already gives the same coefficient upper density as the repository construction and a stronger violation. The different coefficient supports therefore do not preserve an unresolved target for the repository result.

## Independent mathematical check of the earlier upper argument

The checked portion is the entire-function lemma and Section 3, especially the finite block, recursive separation, coefficient summability, and density calculation.

The block is a Gaussian times a polynomial in `exp(2*pi*Q*x)`. Expansion gives integer Gaussian centers `Q*j` and alternating nonzero coefficients; its simple roots have spacing `theta*Q`. Scaling bounds every coefficient by one without changing roots.

A summable background fixes the desired sign at every integer. Translations divisible by `2*Q` align block signs with that background. The block weights have summable total coefficient mass. At each finite stage, translation can simultaneously make the existing function small on the new root brackets and the new block small on every old bracket. The former follows from vanishing tails; the latter from uniform decay on finitely many compact sets. Geometric future-error budgets preserve all endpoint signs.

Finally, `m_n=2*n^3` zeros lie in windows of length at most `Q*m_n/(n+1)+1`. Those lengths diverge and the zero-to-length ratios diverge. The coefficient signs remain periodic, so their densities remain `1/Q`. Absolute summability gives entire convergence, and protected nonzero endpoint values ensure the function is not identically zero.

No gap was found in this upper-density proof. Its validity does not depend on the later parts of the manuscript or on numerical verification. The separate agent `demath_zzz_bounties` independently reconstructed the same argument and reported that its audit passed.

## Recommended repository correction

Credit the earlier checked public proof and exclude the duplicate named result under the repository's collection rule. The valid independent construction and formalization remain retrievable in immutable Git history. Do not describe them as a first resolution, count them toward the user's requested new open-problem solutions, or use them to support a new-solution bounty claim. Root is coordinating the correction in issue 191.
