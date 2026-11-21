# Erdős 677: exact target and prior-work audit

Date: 21 November 2026. Status: full mathematical target remains unresolved in the sources checked. This lane has produced no complete proof, counterexample, Lean verification, submission, or award. It adds zero completed bounty problems.

## 1. Funded statement

For nonnegative integers $`n`$ and positive integers $`k`$, define

```math
M_k(n)=\mathop{\mathrm{lcm}}(n+1,\ldots,n+k).
```

The target is

```math
\forall n,m\geq0\ \forall k\geq1,
\qquad m\geq n+k\ \Longrightarrow\ M_k(n)\ne M_k(m).
```

The two intervals have the same length and are disjoint. The equality boundary is included. A proof only for one length, for adjacent intervals, or below a search height does not settle the funded target.

The [live Conjectures.io page](https://conjectures.io/problems/erdos677-erdos-677), opened on the audit date, showed an estimated **US$2,730**, no complete proof or refutation attempts, and one contribution comprising 17 lemmas. An earlier fetch in the same research session showed US$2,708; these are dynamic estimates, not locked quotes. The contribution is titled “prime-power divisibility criterion for Finset lcm, unfolding API for lcmInterval” and is dated 2 September 2026. It is not advertised as a full resolution.

The pinned contract is:

- Task ID: `fc-v2-erdos677-erdos-677-67b17c4ae602de0aee534b7f-formalized`.
- Type SHA-256: `d8b4d613ce4725ad35aa8fcd437a819ff7a65c62b0e6b2d4c7d4d7e6f3790f22`.
- Commitment: `30c4d37ce292e29ebdcd8eb2a7e4135a9f80d5363d007a09e8d5786f0e94af63`.
- [Source at commit 7d1a8c9](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/677.lean): `∀ (m n k : ℕ), k > 0 → m ≥ n + k → Finset.lcmInterval m k ≠ Finset.lcmInterval n k`.

The [FAQ](https://conjectures.io/faq) and [submission terms v13](https://conjectures.io/submission-terms), effective 11 November 2026 with review policy v4, describe a reward paid to the successful solver in Subnet 66 Alpha after exact Lean verification and review. Recognized contributions can receive part of the same reward. A complete established prior proof can disqualify a later submission, even if the earlier proof was not in Lean. Original AI work logs are required, and a verification credit is normally spent on submission. Those terms were read; no account, fee, wallet, log-upload, or submission action was taken. The advertised USD equivalent is not a guaranteed cash payment.

## 2. Original statement and significance

The primary source is Paul Erdős, [“Some Unconventional Problems in Number Theory”](https://users.renyi.hu/~p_erdos/1979-23.pdf), *Acta Mathematica Academiae Scientiarum Hungaricae* 33 (1979), 71–80, printed page 78. The local PDF was downloaded, text-extracted, and page 78 was rendered and visually inspected. The printed separation condition is inclusive. A July 2026 public working report's statement that the original condition was necessarily strict does not match this Acta source.

The problem asks whether least common multiples retain enough information to distinguish separated intervals of the same length. Equality of products is a stronger and different condition. Equality of prime supports is weaker and is also discussed separately in the original source. The exact equal-LCM problem has remained a recorded research problem across the intervening product, prime-factor, and Diophantine work; a uniform resolution would settle the original general interval question. This is the reason to examine the general structural obstruction rather than add another bounded-length computation.

## 3. Recent full primary paper

Payam Danesh and Raoul Bianchetti, [“Prime-Power Transport and a Three-Site Reduction”](https://ijmttjournal.org/public/assets/volume-72/issue-9/IJMTT-V72I9P101.pdf), *International Journal of Mathematics Trends and Technology* 72(9) (2026), 1–33, DOI [10.14445/22315373/IJMTT-V72I9P101](https://doi.org/10.14445/22315373/IJMTT-V72I9P101), was published on 28 September 2026. The [publisher record](https://ijmttjournal.org/archive/IJMTT-V72I9P101) supplies the dates and full PDF.

The PDF itself explicitly states that its argument is a reduction, not a general resolution. The relevant proofs read for this audit include:

- the product-to-LCM defect bounds and exact periodic carry formula in Section 2;
- the small, coprime coefficient normalization and algebraic slope in Section 3;
- the prime-power owner matrix, local residual budgets, quadratic lifts, and maximal-valuation extraction in Section 4;
- the finite two-site spectrum in Theorem 14 and the exact sliding-LCM reflection in Proposition 16;
- the uniform location and gap restrictions in Section 7;
- the centered product and approximation conditions in Section 8.

In the paper's notation, an actual collision gives

```math
P_k(x)=\prod_{i=1}^k(x+i),\qquad
\lambda_k=\mathop{\mathrm{lcm}}(1,\ldots,k),\qquad
Q_k=\frac{\lambda_k}{k},
```

and coprime positive integers $`a\lt b`$ such that

```math
aP_k(m)=bP_k(n),\qquad ab\mid Q_k.
```

The paper then retains where each maximal prime power occurs in the two intervals. Its at-most-two-active-site theorem is an effective bound for each fixed length. The argument still permits configurations with at least three active sites and a moved packet. The bounded-length certificates are neither a general proof nor new work of this campaign. This audit did not independently replay every certificate in the paper and does not certify all of its theorems.

## 4. Nearby resolutions and other public work

Stijn Cambie, [“Resolution of an Erdős' problem on least common multiples”](https://arxiv.org/html/2410.09138v1), arXiv:2410.09138v1 (2024), Theorem 1, concerns Erdős 678. For every fixed multiplier, it produces a block whose LCM exceeds that of a later block of **one greater length** by that multiplier. Its theorem and proof setup were read directly. It does not prove or disprove equality of two disjoint blocks of the same length.

The [July 2026 public working report](https://www.erdosproblemaday.com/day/677-lcm-bridge) explicitly leaves the general problem open. It already describes a CRT construction showing that selected prime-routing constraints need not give actual consecutive-block collisions. Consequently, a generic CRT-versus-global-realization obstruction is prior work. The present lane does not claim that theme as new. The report's small-length conclusions and numerical checks were not used as proof of the full target.

The [Erdős Problems entry](https://www.erdosproblems.com/677), the pinned formal statement, and the September paper record the general question as open. Aggregated search-result pages mix the neighboring proved problem 678 with 677. Their “PROVED (LEAN)” snippets are not evidence of a proof of 677; the exact individual statements were compared.

Searches used the exact problem number, equal-LCM/disjoint-block wording, the recent paper title, and proof/resolution/correction terms, including recent-date searches and two search engines. No later complete resolution was located. The [7 November public audit](https://imd-explorer.up.railway.app/jobs/818ad4d5-fdd9-457d-95cb-5bfc57d111e4) also reports the exact same scope distinction, but it is secondary evidence rather than a substitute for the primary papers. This search is not a proof that the literature is exhaustive.

## 5. Reservation and attempted route

Local research and documentation searches and a repository issue search found no dedicated E677 lane. The reservation was posted and read back in [issue 223, comment 7070659052](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070659052).

The attempted route combines local prime-power owner restrictions, periodic carry coefficients, and the simultaneous sliding-divisibility system. The full sliding system is exact: it is not already weaker evidence that can be completed by citing the reflection lemma again. The companion [local-congruence-and-realization-gap.md](local-congruence-and-realization-gap.md) records an explicit obstruction to closing the problem with finitely prescribed local data and the first-order real coefficient corridor. It does not supply an actual collision and does not establish impossibility of one.

The missing step is global: every maximal prime power of every term must be included, with the full row and column residual budgets. Adding more selected local congruences does not by itself establish that completeness.

## 6. Saved sources

The exact downloaded source sizes and SHA-256 digests are in [source-manifest.json](source-manifest.json). They include the original 1979 PDF, the September 2026 PDF, and the pinned Lean declaration. The text extractions and the original-page image are local inspection aids. No full solution or novelty claim is attached to this checkpoint.
