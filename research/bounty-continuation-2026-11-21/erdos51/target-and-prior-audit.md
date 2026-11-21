# Erdős 51: exact target, reward, and prior-source audit

21 November 2026. The inspected sources leave the full target unresolved. This is a source audit and research record, not a solution claim. The associated [private-prime-marker obstruction](private-prime-marker-obstruction.md) rules out one construction mechanism only.

## 1. The full mathematical target

For every positive totient $`a`$, define

```math
\ell(a)=\min\{n\ge1:\varphi(n)=a\}.
```

Erdős 51 asks whether there is an infinite set of totients along which $`\ell(a)/a\to\infty`$ as $`a\to\infty`$. Equivalently, it asks whether these ratios are unbounded over all positive totients. Indeed, unboundedness permits a sequence with successively larger ratios and larger arguments, since each finite initial interval contains only finitely many ratios. A negative answer is a uniform constant bound over all positive totients.

The [original 1995 paper](https://users.ime.usp.br/~yoshi/resenhas/abstracts/Erdos.pdf), *Some of my favourite problems in number theory, combinatorics, and geometry*, Resenhas 2, §I.9, asks this exact question. The nearby $250 offer concerns the preceding distribution-function problem, Erdős 50. It is not an original cash offer for Erdős 51.

The [pinned formal source](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/51.lean) uses an infinite set $`A\subseteq\mathbb N`$, an $`\mathop{\mathrm{IsLeast}}`$ condition on each full inverse-totient fiber, and convergence of the real ratios at the order filter on $`A`$. This is faithful to the stated question. A possible zero argument is a finite exception and does not change the asymptotic question. The source file is stored at [sources/51.lean](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/51.lean); it is a conjecture declaration containing admissions, not a proof artifact.

A large value of $`n/\varphi(n)`$ for one chosen preimage does not control the least preimage. Neither a fixed forced divisor nor a fixed ratio propagated to infinitely many totients settles this target.

## 2. Live reward and submission scope

The [Conjectures.io target](https://conjectures.io/problems/erdos51-erdos-51) was reread on 21 November 2026. The latest displayed estimate was **$2,729**, with no proof or refutation attempts and no published contributions. An earlier read in this session displayed $2,454; the amount is dynamic. The site offers the reward to the successful solver, subject to contribution allocation, for either a complete proof or refutation. It is a USD-equivalent platform reward, not a guaranteed cash payment or an OEIS donation.

The exact task is `fc-v2-erdos51-erdos-51-e4678eb0dda87db8baac2564-formalized`. Its source-type digest is `8d86ed569f7abf1bb04e214bfd638cb9cd69e1594308912f79142f1aa0ec4d1c`, and its task commitment is `2ffa02977b7d47557f84da7c7f542178dd5af6fa5d9396eff81610e302950225`. The [task bundle](https://github.com/conjectures-io/conjectures-tasks/tree/fc78d5dabefd8d1afe7542b704ccc1155f8577b3/versions/fc-v2-erdos51-erdos-51-e4678eb0dda87db8baac2564-formalized) pins the formal environment and statement. The proof target chooses the positive answer; the platform separately accepts refutations.

[Submission terms v13](https://conjectures.io/submission-terms), effective 11 November 2026, require an exact Lean proof without admitted dependencies, original producing chat logs, and review approval. Verification credits cost money. The reward estimate is locked under the submission policy and paid in the platform's Alpha framework; approval and payout are separate states. A complete established public proof predating acceptance disqualifies the target even if the submission is an independent rediscovery or its first Lean formalization. The terms require reliable chronology and an exact scope match before such a rejection. Up to half the bounty can be allocated to recognized contributions. These requirements do not establish that any present partial note is payable. No account, payment, log upload, submission, or award acceptance was performed.

## 3. Primary mathematical sources checked

### Ford's totient construction

Kevin Ford's [*The distribution of totients*](https://www.ford126.web.illinois.edu/wwwpapers/totients.pdf), revised 2013 version, was checked at Theorems 2 and 8 and §7.3, especially printed pp. 38–39. Its propagation results can preserve a fixed inverse-totient fiber after multiplication. Its forced-divisor examples and propagation do not give a sequence with unbounded least-preimage ratios. The distinction between preserving a seed and producing arbitrarily large seed ratios is essential.

### The September 2026 totient-count manuscript

The [OpenAI manuscript source](https://github.com/openai/math/tree/main/preprints/An-asymptotic-formula-for-the-number-of-totients-September-25-2026) was inspected at its complete least-preimage companion section and the corresponding theorem statement. Its fixed-$`k`$ count distinguishes whether a seed with $`\ell(d)>kd`$ exists. The final scope remark explicitly leaves the occurrence of the positive alternative for every $`k`$, equivalently E51, unresolved. Thus the new totient-count asymptotic is not a resolution of this target. This audit does not purport to verify the manuscript's entire asymptotic proof. Inspected TeX files and content hashes are recorded in the [manifest](eligibility-snapshot.json).

### Earlier replication and the authored 2026 attempt

Stolarsky and Greenbaum, [*A Ratio Associated with $`\varphi(x)=n`$*](https://www.fq.math.ca/Scanned/23-3/stolarsky.pdf), Fibonacci Quarterly 23 (1985), printed p. 268, states the fixed-seed prime-replicator theorem attributed to Erdős (1958). Their paper's separate gcd/lcm ratio is not E51's least-preimage ratio. The original 1958 paper's complete proof was not retrieved in this audit, so no claim of reading it is made.

The authored [July report](https://github.com/pw/erdosproblemaday-verification/blob/main/51/barrier-and-anatomy/july-report/erdos51_totient_preimage_gap.md) already discusses exact recursive replication, the missing moving-seed uniformity, the Euler-product criterion, block replacement, and convergence of safe-prime or rapidly growing marker constructions. The [21 October continuation](https://erdosproblemaday.com/day/51-a-no-answer-needs-smooth-shifted-primes) establishes a conditional forcing statement for finite prime support and explains why it does not resolve E51. These are prior partial approaches, not new results of this campaign.

For the private-marker proposition, the additional primary input is Ford's [2023 sieve notes](https://ford126.web.illinois.edu/sieve2023.pdf), Theorem 2.5. Its coefficient-uniform statement and proof on printed pp. 19–21 were checked directly. The exact specialization is written in the [proof note](private-prime-marker-obstruction.md).

## 4. Search and coordination limits

The source search covered the exact problem number, least/inverse-totient ratios, full-fiber and prime replication, the September manuscript, recent exact-resolution claims, and the public E51 research registry. The [current registry](https://erdosproblems.ai/wiki/research/erdos_51), the authored October continuation, and the live task still label the full question open. No inspectable complete exact resolution was found. This is a bounded status audit, not proof that no undiscovered source exists. The official ErdősProblems page was blocked in this environment; the original paper and pinned formal source were used for the exact statement.

Local campaign files and current repository issue/code searches found only the earlier header/formal-type screen. Repository issue #51 concerns Erdős 517, not this target. The E51 lane was reserved in [issue #223, comment 7070737112](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070737112), with exact comment readback. The [receipt](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070737112) records that coordination.

## 5. Remaining proof obligation

The current attempt tested a sequence of full-fiber prime replications. It now has an unconditional obstruction: selected primes with bounded reuse of prime divisors of their predecessors have convergent reciprocal sum, hence cannot make the accumulated Euler product diverge. The actual open obligation is to control full inverse-totient fibers using overlapping or unboundedly reused valuation data while retaining divergent reciprocal mass, or to find a different global construction. No such argument is established here. The campaign's qualifying completion count does not change.
