# Zhang's Question 8.5 for 18 ≤ n ≤ 57: shifted lonely runner counterexamples

[Catalogue](../../CONTENTS.md) · [Proof and search record](PROOF.md) · [Certificates](certificates.json) · [Exact checks](verify.py) · [Issue #110](https://github.com/1337isnot1337/solved-conjectures/issues/110)

**Status:** Computer-assisted partial answer, unrefereed. For every `n` with `18 <= n <= 57` an explicit exact certificate shows that the shifted Lonely Runner Conjecture fails for `n` runners. The range `58 <= n <= 94` stays open.

**Contributors:** [@aadrianvv](https://github.com/aadrianvv): certificates for 18 ≤ n ≤ 54, verifier and search tools. [@tomdif](https://github.com/tomdif): certificates for n = 55, 56, 57, found with the same search tools (see [PROOF.md](PROOF.md#n--55-56-and-57)).

**Lean status:** full for the published counterexamples from 18 through 57 runners. Lean proves the exact maximum over all real times and a rational time attaining it in every case. [Formalization and replay](FORMALIZATION.md).

## Result

For distinct positive integer speeds $`v_1,\ldots,v_n`$ and shifts $`s_1,\ldots,s_n`$ put

```math
\gamma(\mathbf v;\mathbf s)=\max_t\min_i\|s_i+v_it\|,\qquad
\Gamma(n)=\min_{\mathbf v}\min_{\mathbf s}\gamma(\mathbf v;\mathbf s),
```

where $`\|x\|`$ is the distance to the nearest integer and the outer minimum runs over all sets of $n$ distinct positive integer speeds. The shifted Lonely Runner Conjecture predicts $`\gamma(\mathbf v;\mathbf s)\ge1/(n+1)`$ for all speeds and shifts. Blanco, Criado and Santos found counterexamples for $`5\le n\le17`$, and Poliakova for all $`n\ge95`$. Zhang's Question 8.5 asks whether $`\Gamma(n)\lt1/(n+1)`$ for every $`n\ge5`$; after those two papers it was open exactly for $`18\le n\le94`$.

**Theorem (computer-certified).** For every $`n\in\{18,\ldots,57\}`$ the file [`certificates.json`](certificates.json) gives $n$ distinct positive integer speeds and rational shifts with $`\gamma(\mathbf v;\mathbf s)\lt1/(n+1)`$, together with the exact value of $`\gamma`$. Hence $`\Gamma(n)\lt1/(n+1)`$ and the shifted conjecture fails for these $n$.

For $`18\le n\le40`$ the speeds are $`1,2,\ldots,n`$. For $`41\le n\le57`$ they are other sets of $n$ distinct speeds, with largest speed between 120 and 216. The excess $`1/\gamma-(n+1)`$ ranges from about 0.015 (n = 38) to 0.98 (n = 45); it is 0.607 at n = 55, 0.668 at n = 56 and 0.111 at n = 57.

Primary source: Y. Zhang, *Tight instances of the Lonely Runner Conjecture*, [arXiv:2608.13599](https://arxiv.org/abs/2608.13599), version 3, Question 8.5 and Appendix A. Earlier ranges: Blanco–Criado–Santos, [arXiv:2603.24784](https://arxiv.org/abs/2603.24784), Theorem 1.8 ($`5\le n\le17`$); Poliakova, [arXiv:2609.23952](https://arxiv.org/abs/2609.23952) ($`n\ge95`$).

## Scope and limitations

Please read this section before building on the result.

1. **Only 18 ≤ n ≤ 57 is settled**, each value by one explicit, exactly checked counterexample. Combined with the literature, the shifted conjecture is now known to fail for $`5\le n\le57`$ and for $`n\ge95`$.
2. **58 ≤ n ≤ 94 is open, and nothing is claimed there.** No counterexample is known for these $n$, and there is no proof that none exists. The searches that produced the certificates are heuristic (simulated annealing with random restarts, followed by a linear-programming polish). The first round stopped at $`n=55`$ after about 25 attempts; a longer run of the same chain later reached $`n=55`$, $`56`$ and $`57`$ (see [PROOF.md](PROOF.md#n--55-56-and-57)). Not having reached $`n=58`$ yet is **not evidence** for the conjecture there; it only says the search did not get there in the time spent. Zhang's question therefore stays open for $`58\le n\le94`$, and so does his second question on the minimisers of $`\Gamma(n)`$, which this package does not address.
3. **For n ≥ 41 the speeds are not 1, …, n.** The shifted conjecture and Zhang's $`\Gamma(n)`$ concern arbitrary sets of $n$ distinct positive integer speeds (Zhang, Appendix A), so these certificates are valid counterexamples. They say nothing about the narrower question whether the consecutive speeds $`1,\ldots,n`$ fail for $`41\le n\le57`$; the searches with consecutive speeds were not pursued beyond $`n=40`$, where they had become slow.
4. **Pointers for whoever continues** (observations, not theorems; details in [PROOF.md](PROOF.md) and [search/NOTES.md](search/NOTES.md)):
   - *Speed-set pattern for n = 41..54.* The sets are $`1,\ldots,n`$ with numbers having a large prime factor removed (29, 31, 37, 41 and 43 always, when at most $n$; 17, 19, 23, 47 and multiples such as 34, 38, 46 usually; also often 13, 25, 35) and smooth numbers above $n$ added (60 in all 14 sets; 72, 84, 90, 120 in 13; 80, 96 in 12; 54, 108 in most). The largest speed stays far below the allowed $3n$ or $4n$ except at $`n=54`$ (216).
   - *What worked.* Heat-bath annealing that may also change speeds, run as a warm chain from the certificate for $`n-1`$ plus one new runner, with a beam of several solutions per $n$ near the end.
   - *What failed.* Superposing certificates at different scales; freezing large speeds at shift 0; structured shift families; truncations and a "remove-top" variant of Poliakova's rule (stuck at exactly $`1/\gamma=n+1`$); set-cover integer programs over structured candidate classes (several proven infeasible, others timed out); exact lattice annealing with SAT repair beyond $`n\approx28`$. Many runs end pinned at exactly $`1/\gamma=n+1`$ by a two-runner obstruction explained in [search/NOTES.md](search/NOTES.md).
   - The exhaustive SAT check of Poliakova-type rules in [search/NOTES.md](search/NOTES.md) indicates that rules of her local type with speeds built from the primes 2, 3 (and 5) cannot lower her threshold of 95 within the menus tested. Closing $`58\le n\le94`$ will need either more search with the speed-changing chain or a different construction.
5. **Verification.** Lean checks the exact upper bound and an attaining time for each of the forty configurations. The independent Python verifier checks the same data by exact rational arithmetic. [Lean proof and receipt](FORMALIZATION.md).

## Verification

Run from the repository root with Python 3 and no other dependencies:

```sh
python3 results/shifted-lonely-runner-counterexamples/verify.py --quick   # about 10 seconds; run in CI
python3 results/shifted-lonely-runner-counterexamples/verify.py           # full check, about 4 minutes
```

For each certificate the script checks that the speeds are $n$ distinct positive integers, and then uses two independent exact methods:

1. **Exact $`\gamma`$.** A maximum of $`t\mapsto\min_i\|s_i+v_it\|`$ occurs where $`(v_i+v_j)t+s_i+s_j`$ is an integer for some pair $`i\le j`$. The script evaluates the minimum exactly at all such times and checks that the maximum equals the recorded $`\gamma`$ and is below $`1/(n+1)`$.
2. **Arc cover.** With $`\delta=(\gamma+1/(n+1))/2`$ it checks with exact rationals that the closed arcs on which some runner is within $\delta$ of an integer cover the whole circle. This alone proves $`\gamma\le\delta\lt1/(n+1)`$.

The default (full) mode runs both methods for all 40 certificates. `--quick` runs the arc cover for all 40 certificates, with $\delta$ formed from the recorded $\gamma$ after checking that it is below $`1/(n+1)`$, and the exact $`\gamma`$ only for $`n\le24`$ and $`n=41`$. Since the arc cover is a proof on its own, the quick mode still proves the theorem for every $n$; it skips only the exact recomputation of the recorded $\gamma$ for the other values. Both modes exit non-zero if a check fails or if the certified $n$ are not exactly $`18,\ldots,57`$. The full run ends with `SUMMARY (full): 40 certificates, 40 passed, 0 failed`.

## Files

- [`PROOF.md`](PROOF.md): statement, correctness argument for both checks, relation to the literature, how the certificates were found, and the methods that failed.
- [`certificates.json`](certificates.json): one certificate per $n$, with `n`, `speeds`, `shift_den`, `shift_num` (shift $`s_i=`$ `shift_num[i]/shift_den`) and the exact `gamma` as a fraction string.
- [`verify.py`](verify.py): the exact verifier (standard library only).
- [`search/`](search/): the heuristic search tools. They are **not needed to check the result**. See [search/README.md](search/README.md).
