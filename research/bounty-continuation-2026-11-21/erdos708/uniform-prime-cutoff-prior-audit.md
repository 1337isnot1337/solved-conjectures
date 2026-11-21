# Erdős 708: uniform prime-cutoff transfer and prior-work audit

Date: 21 November 2026. Repository coordination: [issue 233](https://github.com/1337isnot1337/solved-conjectures/issues/233).

## Result and scope

The prime-cutoff extension investigated in this session is valid, but it is already contained in Ziming Wang's October 2026 work. The existing proof is simpler than the three-regime construction first developed here. Its minimal-counterexample consequence is a direct corollary of that prior construction. Neither is counted as a new theorem or a completed bounty.

The unrestricted asymptotic coefficient-two problem remains explicitly open in the primary sources checked. The missing assertion is a uniform fractional or smooth-input coefficient-two bound. A conditional implication with that assertion as a hypothesis does not prove it.

## Exact target and cash scope

For a set $`A`$ of $`n`$ distinct integers at least two, let $`M=\max A`$. Every interval $`I`$ of $`M`$ consecutive integers should contain a subset $`B`$ whose product is divisible by the product of $`A`$. Let $`g(n)`$ be the least universal upper bound on $`|B|`$.

The paid target is

```math
g(n)<(2+\varepsilon)n
\quad\text{for every fixed }\varepsilon>0\text{ and all sufficiently large }n.
```

The stronger exact inequality $`g(n)\le2n`$ would imply this. A single finite violation of the stronger inequality would not disprove the paid asymptotic assertion.

P. Erdős, *Some of my forgotten problems in number theory*, Hardy–Ramanujan Journal 15 (1992), printed pp. 34–35, attaches a cash offer of US$100 or 1000 rupees, whichever is greater, to a proof or disproof of the asymptotic assertion: [primary PDF](https://hrj.episciences.org/125/pdf).

The [Combinatorics Foundation policy](https://www.combinatoricsfoundation.org/erd%C5%91s-problems) provides a discretionary direct-payment route for documented Erdős prizes after mathematical acceptance and reputable journal publication. This research note neither establishes award eligibility for a result nor claims that a reward has been approved or paid.

The intended cardinality convention is $`|B|\le g(n)`$. The defective literal exact-size formulation was previously discussed publicly and is not a new counterexample.

## Primary source comparison

The Wang repository was read at commit

`fc929346e7dbe0e818070ef90e4dfbfa06169527`.

Its README labels the public artifact version 1.0.0, dated 21 October 2026. The main manuscript is dated 20 October. These are source-supplied dates; this audit makes no worldwide-priority claim.

| Source and exact location | Relevant statement | Consequence for this session |
| --- | --- | --- |
| Wang, [raw-transfer.tex](https://github.com/science-prince/erdos-708-interval-divisor-covers/blob/fc929346e7dbe0e818070ef90e4dfbfa06169527/papers/main-paper/raw-transfer.tex), theorem `thm:raw`, “Raw finite envelope” and its proof | For the worst-case raw boxed fractional value $`\ell(m)`$, let $`G_n=\max_{0\le m\le n}(\ell(m)+2(n-m))`$, $`K_n=\lceil G_n\rceil`$, and $`Z_n=2K_n`$. Then $`g(n)\le K_n+\pi(Z_n)-1`$, with no interval-size restriction. Raw, capped, and integer worst-case limsup coefficients coincide. | This already contains the all-interval smooth-source extension sought here. |
| Wang, [main.tex](https://github.com/science-prince/erdos-708-interval-divisor-covers/blob/fc929346e7dbe0e818070ef90e4dfbfa06169527/papers/main-paper/main.tex), Appendix “The quadratic coefficient-two gate” | $`M\ge16n^2`$ implies an exact $`2n`$-element cover. | The previously used cubic cutoff is not the strongest located prior range. An independent worker reviewed the written proof; no Lean verification of it is claimed here. |
| Wang, [five-prime.tex](https://github.com/science-prince/erdos-708-interval-divisor-covers/blob/fc929346e7dbe0e818070ef90e4dfbfa06169527/papers/main-paper/five-prime.tex), `thm:kernel` and `cor:five` | A positive five-coordinate kernel gives fractional cost at most $`2n`$ when the union of all source prime supports has size at most five; integer cost is at most $`2n+4`$. | This restricted result is earlier work. It does not give the unrestricted fractional inequality. |
| Bergström, *Whole-Cofactor Peeling, Extreme-Point LP Rank Rounding, and Shifted-Interval Hinge Duality*, [record 24342718](https://zenodo.org/records/24342718), Theorems 3 and 5 | Whole-cofactor peeling and smooth rank rounding; a coefficient-two implication stated below a quadratic cutoff. | These are prior methods, not discoveries in this session. |
| Bergström, *Scaled-Interval Hinge Telescoping, Difference-of-Convex Obstructions, and Smooth Proper-Divisor Matching*, [record 24366998](https://zenodo.org/records/24366998), §5, p. 6 | Lists a quadratic-to-cubic bridge among three remaining analytical obligations. Its smooth matching obligation has its own bounded interval-length range. | Its stated interval gap omits Wang's earlier quadratic theorem and all-interval transfer. A statement in this later paper alone is insufficient evidence that the bridge is new. |
| Chen, [pinned main.tex](https://github.com/chy4pro/erdos-708-explicit-upper-bounds/blob/dc150fd723184cc4e6f367aac6e7a8c9c7890f34/paper/main.tex), §§5–7 and subsequent hinge results | Large/small prime constructions, a $`2n`$ theorem for $`M\ge8n^3`$, and valuation-cover duality. | The baseline methods and cubic theorem are pre-existing. Wang supplies stronger later reductions. |

The main Wang manuscript, its raw-transfer section, the five-prime section, and the complete seven-page Bergström second companion were read. The repository's 333-file historical record was not exhaustively audited. Absence of a stronger result from this bounded source check does not establish novelty.

## The existing prime-cutoff extension, restated

This lemma is extracted from the proof of Wang's raw finite envelope. The following is an independent explanation of the same construction, not a new result.

Let $`A\subseteq\{2,\ldots,M\}`$, $`|A|=n`$, and let $`I`$ be a positive interval of length $`M`$. Choose integers $`1\le L<Q`$. Let $`S`$ be the originals all of whose prime factors are less than $`Q`$, and put $`t=n-|S|`$.

Suppose a set $`B_0\subseteq I`$ satisfies

```math
\prod_{a\in S}a\mid\prod_{b\in B_0}b,
\qquad |B_0|+2t\le L.
\tag{1}
```

Then the full source product has a cover in $`I`$ of size at most $`L`$, for every $`M`$.

### Proof with the actual collision invariant

For each omitted original $`a_i`$, choose any prime $`p_i\ge Q`$ dividing it and write

```math
a_i=p_i d_i.
```

No uniqueness of the large prime is needed. The cofactor may itself contain large primes, including another copy of $`p_i`$.

For each chosen prime $`p`$, let $`t_p`$ be the number of originals assigned to it. Distinctness of the originals gives

```math
t_p\le\left\lfloor\frac Mp\right\rfloor.
```

The interval contains at least that many multiples of $`p`$. Select $`t_p`$ distinct such multiples for each $`p`$, and let $`K`$ be the union of these selections. Then $`|K|\le t`$. Different primes may share a selected position, because they consume different valuation coordinates.

Overlap between $`K`$ and $`B_0`$ is also valid: every prime needed by the source product of $`S`$ is less than $`Q`$, whereas every selected $`p_i`$ is at least $`Q`$. Therefore the product over $`B_0\cup K`$ is divisible by

```math
\left(\prod_{a\in S}a\right)\left(\prod_i p_i\right).
\tag{2}
```

Now place each nonunit cofactor occurrence $`d_i`$ on a fresh interval position, avoiding $`B_0\cup K`$ and all earlier cofactor positions. Repeated cofactor values are processed as distinct occurrences.

Since $`p_i d_i\le M`$, the cofactor has at least

```math
\left\lfloor\frac M{d_i}\right\rfloor\ge p_i\ge Q>L
```

candidate multiples in $`I`$. Before each placement fewer than $`L`$ positions have been used: the entire planned count is at most $`|B_0|+t+t\le L`$. A fresh position consequently exists.

The cofactor positions are mutually distinct and disjoint from $`B_0\cup K`$. Their product supplies $`\prod_i d_i`$ in addition to (2), hence supplies $`\prod_{a\in A}a`$. The total count is at most $`L`$.

This proves the extension without a quadratic or cubic interval restriction, without a matching of all original integers, and without assuming that large prime factors occur only once.

## Conditional smooth-hinge consequence

For weights $`0\le w_p\le1`$, supported on primes $`p<Q`$, put

```math
X_w(m)=\sum_{p<Q}w_pv_p(m).
```

The required inequality is

```math
\sum_{m=1}^{M}(X_w(m)-2)_+
\le
\sum_{b\in I}(X_w(b)-1)_+.
\tag{H2}
```

**This remains an unproved hypothesis for arbitrary supported weights and all required interval lengths and shifts.** A theorem valid only for a shorter range of $`M`$ cannot be substituted into a conclusion about every $`M`$.

Under (H2), the existing boxed-cover duality bounds the smooth subset's fractional cover by $`2|S|`$. Rounding an optimal vertex upward costs at most the number $`\pi(Q-1)`$ of prime rows. Thus

```math
|B_0|\le 2|S|+\pi(Q-1).
```

Choose $`Q=4n+1`$ and $`L=2n+\pi(4n)`$. The elementary inequality $`\pi(4n)\le2n`$ gives $`L<Q`$. Condition (1) holds, and the prior extension gives

```math
g(n)\le2n+\pi(4n)=(2+o(1))n,
```

provided (H2) holds uniformly in the relevant instances. The earlier quadratic theorem means that it is enough to establish the still-unproved hypothesis for $`M<16n^2`$; for longer intervals an exact $`2n`$ cover already exists in Wang's written proof.

Wang's raw finite envelope already states a stronger general fractional-to-integer transference result. Consequently this conditional consequence supplies no new resolution or leading-constant improvement.

## Minimal-counterexample consequence

Suppose the exact $`2n`$ assertion has a counterexample with the smallest possible source cardinality $`n`$. Then every original in that counterexample has all prime factors at most $`2n`$.

Indeed, let $`S\subset A`$ contain exactly those originals. If $`S`$ is proper and nonempty, its smaller source cardinality gives a cover with at most $`2|S|`$ positions in any interval of length $`\max S`$. Choose such a subinterval inside $`I`$. If $`S`$ is empty, take the empty cover. Apply the prior extension with $`Q=2n+1`$, $`L=2n`$. It completes the cover using at most $`2n`$ positions, a contradiction.

This is an unconditional structural reduction for a hypothetical smallest counterexample. It does not show that a fully smooth counterexample is impossible. The consequence is credited to the existing extension mechanism; no separate discovery count is assigned.

## What happened to the proposed new route

The initial construction divided the nonsmooth originals into intermediate-prime and very-large-prime groups, used an incremental gcd extension, and verified floors and collision budgets in each interval regime. A second worker independently checked that construction. Later source discovery found Wang's all-interval proof, which reaches the same transfer with no regime split. Correctness of the reconstructed argument does not establish its novelty.

The full problem is not resolved. The candidate new bridge is removed from new-result accounting. No finite cases, restricted prime counts, historical results, or conditional implications are counted as paid completions. The full-target completion count remains zero.
