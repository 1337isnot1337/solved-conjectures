# Erdős 1192: exact target and prior audit

Date: 21 November 2026. Status: active research; no solution, formal verification, submission, or payment claimed.

## 1. The funded statement

The [live Conjectures.io target](https://conjectures.io/problems/erdos1192-erdos-1192) asks whether, for every integer $`r\ge2`$, there is a set $`A\subseteq\mathbb N_0`$ such that every sufficiently large integer is the sum of exactly $`r`$ elements of $`A`$, and

```math
\sum_{n\le x} f_{r,A}(n)^2=O_r(x).
```

Here $`f_{r,A}(n)`$ counts ordered tuples, with repeated summands allowed. The set and the implied constant may depend on $`r`$. The source definition is

**Lean excerpt**

```lean
noncomputable def f_r (A : Set ℕ) (r n : ℕ) : ℕ :=
  {v : Fin r → ℕ | (∀ i, v i ∈ A) ∧ ∑ i, v i = n}.ncard
```

The exact pinned declaration type is

**Lean excerpt**

```lean
True ↔
  ∀ r ≥ 2,
    ∃ A,
      (∀ᶠ (n : ℕ) in Filter.atTop, Erdos1192.f_r A r n > 0) ∧
        (fun x => ∑ n ∈ Finset.range (x + 1),
          ↑(Erdos1192.f_r A r n) ^ 2) =O[Filter.atTop] fun x => ↑x
```

The [pinned formal source](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/1192.lean) was inspected for the representation definition. The live task records:

| Field | Value |
| --- | --- |
| Task ID | `fc-v2-erdos1192-erdos-1192-c0a8dde7c3ca011f7d3ff277-formalized` |
| Source-type SHA-256 | `deb84e4a73cad6e9d9b6f934a99d436ba2a0ba545694e0d16cca0f266636f5a8` |
| Task commitment | `7f50618d9e084967a955912503f77116e8297c6e8054f3dc3ae15e046f3b35ff` |

The November 21 render displayed a USD-equivalent estimate of $2,730 and no proof attempts, refutation attempts, or published contributions. An earlier agent render showed $2,407; an indexed older snapshot showed $4,990. These are dynamic estimates, not three separate offers or locked payments.

The [FAQ](https://conjectures.io/faq) and [submission terms v13](https://conjectures.io/submission-terms), effective November 11 with review policy v4, state that an accepted exact Lean result is rewarded in Subnet 66 Alpha to a payout wallet. The amount is locked at submission; verification, review, and payment are distinct. Original AI logs are required, and prior established public proofs can disqualify the mathematical result even if its Lean formalization is new. Up to half of the bounty can go to recognized contributions. This audit makes no financial, account, submission, or log-upload action.

## 2. Original statement and known case

Erdős's [1980 survey](https://users.renyi.hu/~p_erdos/1980-03.pdf), printed page 99, equation (10) and the following paragraph, states the mean-square question for a basis of order $`r`$. The preceding paragraph attributes to Erdős and Rényi a probabilistic construction with the mean-square bound and critical counting growth. Its extra basis property is the conjectured step. That original random-set result does not resolve the target.

Ruzsa, *A just basis*, Monatshefte für Mathematik 109 (1990), 145–151, [DOI 10.1007/BF01302934](https://doi.org/10.1007/BF01302934), proves the order-two case. The direct DigiZeitschriften PDF URL returned HTTP 404 in this worker, and the publisher route required access. Accordingly, this worker does not claim to have read the full 1990 proof. Its order-two theorem and construction are independently stated and reconstructed in the full primary Tang paper below. The coordinator is separately attempting to obtain the 1990 original.

No result restricted to order two, a finite modulus, or a fixed larger order counts as a completion of this all-orders target.

## 3. Primary scope checks

### Tang 2010

Min Tang, *A note on a result of Ruzsa, II*, Bulletin of the Australian Mathematical Society 82 (2010), 340–347, [full primary PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4CF73C55F601E88C1E2A95792322E2BD/S0004972710000353a.pdf/note_on_a_result_of_ruzsa_ii.pdf), was read through the proof of Theorem 1.1. It gives an explicit mean-square constant and threshold for order two. Lemmas 2.2–2.6 construct a union of three quadratic curves over a two-dimensional prime field, transfer it to integers, and cover intervals. Lemma 2.7 chooses translations to control the increment of fourth-moment energy. The final proof uses geometrically spaced primes. Neither its statement nor proof supplies all higher orders.

For an existence argument with unspecified constants, the general Fourier norm inequality in the [companion reduction](finite-energy-transfer.md) controls geometric unions directly. The translation calculation is not an additional prerequisite once the finite blocks already have the required full energy bound.

### Jain–Pham–Sawhney–Zakharov 2025

*An explicit economical additive basis*, Combinatorics, Probability and Computing, [DOI 10.1017/S096354832510014X](https://doi.org/10.1017/S096354832510014X), constructs an explicit order-two basis with a subpolynomial pointwise representation bound. Its introduction, Theorem 1.1, finite modular Lemma 2.2, and construction were inspected. The generalized-digit construction uses Ruzsa's order-two blocks. The theorem does not assert bounded mean square, nor the all-orders target. Its mention of Erdős–Tetali's higher-order logarithmic representation result is not a claim of the estimate required here.

### Ding–Sun–Zhao 2026

The authors' [arXiv abstract and theorem description](https://arxiv.org/abs/2607.06167), *An improved upper bound on the Ruzsa number*, define the Ruzsa number using two summands and improve its uniform finite cyclic bound to 128. This is a recent order-two result, not the higher-order mean-square construction. Read depth in this worker: primary abstract and definition; the attempted arXiv full-text endpoints were unavailable. No proof-detail claim is based on the abstract.

### Pilatte 2024 and Niu 2026

Pilatte's [published order-three Sidon-basis paper](https://www.cambridge.org/core/journals/compositio-mathematica/article/solution-to-the-erdossarkozysos-problem-on-asymptotic-sidon-bases-of-order-3/6281BC76D745CF4087DE85538780A6B5) resolves a different question: a Sidon set that is an asymptotic basis of order three.

Niu's [primary v2 text](https://arxiv.org/html/2607.11351v2), dated July 20, 2026, strengthens that covering property by requiring a small summand. Theorem 1.1, the parameter conditions in §3.1, and Lemma 4.4 were read. The constructed set has $`A(x)=x^{c+o(1)}`$ with $`c>1/(2+\alpha^2)>1/3`$; the displayed choice is $`c=0.3393`$. Thus this actual set cannot satisfy the order-three target: the latter forces $`A(x)=O(x^{1/3})`$ by the energy diagonal. This is an exact scope separation, not an inference from the paper's title. The entire Niu proof was not audited here.

### Other recent title matches

Gao–Zhang's [October 2026 primary abstract and introduction](https://arxiv.org/abs/2610.37136), *On additive bases of finite abelian groups*, use a basis defined by sums of arbitrary nonempty subsequences. This differs from fixed-order representation counts.

Bukh–van Hintum–Keevash's [primary abstract](https://arxiv.org/abs/2409.07442), *Additive bases: change of domain*, studies the size of a basis for a prescribed set when changing the ambient domain. The abstract does not supply the mean-square theorem. Its Oxford full-PDF route returned HTTP 403; no full-proof audit is claimed.

## 4. Existing public work and search limit

The [July 2026 public working report](https://www.erdosproblemaday.com/report/1192) was read, including its finite-energy characterization and order-three translation expansion. It explicitly labels the target unresolved. The report is prior public research, not an independent authority for a complete theorem. Its finite computations are not reproduced or counted.

One part of its proposed obstruction is removed by a standard inequality: the balanced mixed correlations are bounded by Hölder using only the highest energy already assumed. The companion note supplies the exact formulas and a geometric-union proof. No priority claim is made for those standard inequalities or the resulting finite reformulation.

Searches covered the exact problem number, title *A just basis*, the phrases “bounded in square mean” and “bounded in mean square,” higher-order additive bases, higher-order Ruzsa numbers, recent Sidon-basis papers, and the current formal target. Both available search engines were used, including a current-year check. No primary source settling the full target was located. This is a bounded literature check, not a proof that no prior resolution exists.

The repository issue search for `1192 OR "just basis"` returned no previous issue before the reservation. Work is now coordinated in [issue 223, comment 7070439164](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070439164).

## 5. Exact remaining attack

For each fixed order, it is enough to construct finite cyclic bases at dyadic moduli with energy bounded by a constant times the modulus. This is also necessary; the companion note proves the equivalence. The coordinator studies higher-dimensional finite-field constructions. This worker handles the lifting, geometric union, and literature scope.

The missing mathematical object is a uniformly energy-bounded finite covering basis. Neither random critical-density sets with uncovered residues nor a family only at finitely many moduli establishes it. No full resolution is claimed.

## Source receipts

The downloaded original PDFs, text extractions, byte counts, and SHA-256 values are recorded in `source-manifest.json`. The source bytes are retained for audit; publication need not redistribute the PDFs. The three successful downloads are Erdős 1980, Tang 2010, and Jain–Pham–Sawhney–Zakharov 2025. The failed Ruzsa URL is recorded as a failure, not as a retrieved source.
