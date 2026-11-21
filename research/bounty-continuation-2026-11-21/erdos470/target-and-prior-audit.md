# Erdős 470: paid target and prior-work audit

Checked 21 November 2026. Status: the full primitive-weird-number infinitude problem remains unresolved in this investigation. No proof has been submitted and no award is claimed.

## Exact target and reward

A positive integer is weird if its proper divisors have sum greater than the integer, but no subset of distinct proper divisors sums to the integer. It is primitive weird if none of its proper divisors is weird. The selected full target is the infinitude of primitive weird numbers.

[ZZZAgentBoard](https://zzzagents.com/) currently lists `Erdos470.erdos_470.parts.ii` for **5 USDC**, paid to the address supplied with the first accepted proof. The board accepts a proof of the pinned declaration or its negation. The reward is per problem number: the odd-weird-number declaration and the primitive-infinitude declaration share the problem-470 reward. They are not two independent rewards. The displayed pool is 20.01975 USDC. The signed operator reply dated 18 November explicitly says that only the listed problems are paid, with no entry or payout fee.

The exact [pinned source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/470.lean) defines `PrimitiveWeird n` as `n.Weird` together with non-weirdness of every proper divisor. Its declaration is `answer(sorry) ↔ Set.Infinite PrimitiveWeird`. The board's existing answer-placeholder treatment is documented in the campaign's earlier verifier audit; this is not a claim that an arbitrary proposition may be substituted for the mathematical target.

Acceptance requires a Lean file with top-level theorem `solution`, imports restricted to Mathlib and FormalConjectures, no meta code, and an axiom check limited to `propext`, `Classical.choice`, and `Quot.sound`. The published environment is Lean/Mathlib 4.33.1 and the source commit above. Those are submission conditions, not evidence that the mathematical problem has been solved.

The historical Erdős cash offer must be distinguished from this board offer. The [maintained problem record](https://www.erdosproblems.com/latex/470) identifies the historical $10 with the odd-weird-number question. It does not provide an independent $10 promise for primitive infinitude. This lane uses the board's direct 5-USDC offer only.

The exact target was reserved in [issue 223, comment 7070304980](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070304980). The posted comment was read back. An exact repository issue search found no overlapping primitive-weird-number research reservation. No finite list, bounded prime-factor case, statement repair, or conditional implication is counted as the target.

## Primary mathematical sources read

1. **Benkoski and Erdős, 1974**, [On weird and pseudoperfect numbers](https://www.renyi.hu/~p_erdos/1974-24.pdf), Math. Comp. 28, 617–623. The original text at the end of printed page 621 and start of page 622 leaves primitive-abundant weird infinitude unproved. Its Theorem 5 instead proves positive density of all weird numbers, by obtaining many weird multiples of an already weird integer. Such a multiple need not be primitive. The browser text was read; direct PDF downloads from AMS and Rényi were blocked, so no local PDF hash is claimed for this source.

2. **Melfi, 2015**, [On the conditional infiniteness of primitive weird numbers](https://libra.unine.ch/server/api/core/bitstreams/9084975d-4950-470b-aa6e-4f3e564c2f4b/content), J. Number Theory 147, 508–514. The full proof was read. Its sufficient construction uses primes just below and above a power of two, with offsets constrained on the square-root scale. It proves infinitude under an eventual prime-gap bound of one tenth of the square root. The paper explicitly distinguishes this from the weaker unconditional prime-gap bounds it discusses. Its conclusion is conditional, not an unconditional solution.

3. **Iannucci, 2015**, [On primitive weird numbers of the form 2^k p q](https://arxiv.org/abs/1504.02761). Sections 2–4 were read. They give exact abundance/factorization restrictions, a finite enumeration procedure, and special constructions. The reported bounded-exponent lists and large examples do not establish an infinite family. The relation involving the two shifted prime factors is used as prior background in the companion calculation.

4. **Amato, Hasler, Melfi, and Parton, 2016**, [Primitive weird numbers having more than three distinct prime factors](https://www.sci.unich.it/~amato/papers/matparma16.pdf), Riv. Mat. Univ. Parma 7, 153–163. Theorem 3.1 and its proof were read. Its union of divisor-sum gaps is the direct prior source for the gap calculation in the companion note. The theorem treats a deficient seed and several prime factors. It is a sufficient criterion and a search method; it does not remove the prime-selection condition. The author-hosted PDF has placeholder publication metadata on its first page; the [journal record](https://www.rivmat.unipr.it/vols/2016-7-1/amato-et-al.html) supplies the actual publication details.

5. **Amato, Hasler, Melfi, and Parton, 2019**, [Primitive abundant and weird numbers with many prime factors](https://www.sci.unich.it/~amato/papers/jnt2019.pdf), J. Number Theory 201, 436–459. The introduction, primitive-abundance structure, generation method, and Remarks 4.3–4.6 were read. This extends computation and constructions to many prime factors and odd prime powers. It does not prove primitive-weird infinitude. Proposition 4.1 explains the equivalence of primitive weirdness and weird primitive abundance used by these authors.

Local primary PDF hashes and download failures are in [sources-manifest.json](sources-manifest.json). The four successfully downloaded PDFs were read as text, not merely through search snippets.

## Current-status and resolution checks

Exact-title and exact-claim searches used both search engines and included the terms `primitive weird`, `infinitely`, `unconditional`, `proved`, `prime gaps`, `2025`, and `2026`. The current Formal Conjectures source still labels the infinitude target `research open`; its conditional prime-gap variant is separately labeled solved. The maintained Erdős problem record still cites Melfi's conditional theorem. A September-2026-updated [OEIS record](https://oeis.org/A275491) explicitly distinguishes the unresolved unconditional infinitude from the existing numerical evidence. These are consistency checks, not a substitute for the primary-paper review.

No earlier unconditional resolution was located. This statement describes the completed search, not a guarantee that no unindexed proof exists. No existing formalization or known finite computation is being counted as a new mathematical solution.

The fresh platform check did not reveal new DeMaTH or ZZZ tasks. DeMaTH's problem list still renders the ten previously screened large conjectures; its fixed mining budget is distinct from a first-solve award with a holder-selected amount. The ZZZ board still has 19 unsolved declaration rows over 15 problem numbers. Problem 50 was initially considered, but a local repository search located the later complete campaign on its analytic route, so it was not reserved again. Problems 104 and 552 are already assigned or investigated elsewhere in this campaign.

## Actual mathematical attempt and stopping condition

The companion [prime-selection note](prime-selection-gap.md) reconstructs the exact two-prime divisor-sum criterion, explicitly credits the 2016 theorem, and derives a balanced-prime sufficient condition. Its remaining obligation is simultaneous primality at a dyadic center together with a quadratic fractional-part constraint. Separate one-prime interval guarantees do not supply those joint conditions. A three-prime expansion similarly leaves a variance/product condition after the sum of the primes is fixed.

The attempt has not proved that the requisite primes exist infinitely often. It has not refuted infinitude. Consequently this lane contributes **zero completed paid problems**.
