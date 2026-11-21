# Erdős 686, ratio 25: exact witness search checkpoint

Date: 21 November 2026. Status: **no bounty solution and no witness found**.
The work below gives a search reduction and finite exclusion ranges. It does
not exclude all lengths or all heights. No submission, fee, account operation,
or payment request was made.

## Exact paid target

The [ratio-25 bounty](https://conjectures.io/problems/erdos686-erdos-686-variants-twenty-five)
asks whether there are natural numbers `k >= 2`, `n >= 0`, `m >= n+k` with

```math
 \prod_{i=1}^k(m+i)=25\prod_{i=1}^k(n+i).
```

The disjointness condition `m >= n+k` is essential. The registered statement is
`Erdos686.erdos_686.variants.twenty_five`, with displayed type `True ↔ ∃ k ≥ 2,
∃ n, ∃ m ≥ n+k, 25 = (∏ i ∈ Icc 1 k, (m+i))/(∏ i ∈ Icc 1 k, (n+i))` over the
rationals. The positive denominator makes the product equation equivalent.

- Task ID: `fc-v2-variants-twenty-five-fd431c2c682497cf8ec1f2d7-formalized`.
- Type SHA-256: `3ff209c8b606e11ea4bcceed78a71b302f8728b0147777dc34b81e95f3be7cab`.
- Bundle SHA-256: `933deedd4cff72c97409936352c27ca3a93fda9d773025daef384b05f6be15d4`.
- [Retrieved task metadata](https://github.com/conjectures-io/conjectures-tasks/blob/main/versions/fc-v2-variants-twenty-five-fd431c2c682497cf8ec1f2d7-formalized/source-metadata.json)
  is preserved in `source-metadata.json`.
- The upstream source was read at
  [`7d1a8c9912747679d0093f6d1216420c33ee5ffa`](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/686.lean).
  This base source is distinct from the generated patched task environment.

The official page showed an open, unattempted bounty at retrieval. Its dollar
display varied with the pool during the session. The [platform rules](https://conjectures.io/how-it-works)
require an accepted exact Lean proof or refutation and review; the payment is
in the platform's SN66 Alpha token. A displayed amount is not a payment or an
eligibility guarantee. The [ratio-4 target](https://conjectures.io/problems/erdos686-erdos-686-variants-four)
is separate. This checkpoint searches ratio 25.

## Prior work checked before the search

The [primary Erdős discussion](https://www.erdosproblems.com/forum/thread/686)
and both official contribution indexes were checked. The ratio-25 index
already lists exclusions for lengths 2, 4, 8, 10, and 12. The ratio-4 index
also contains a primitive length-five sextic reduction applicable to both
ratios. Its [source note](https://github.com/conjectures-io/conjectures-contribution/blob/main/contributions/erdos-686-variants-four/2ee6f40be82839b162c006fcfa60c75943012772de6a0de7b91a500fb0a1382b/sources.md)
explicitly retains square-recovery constraints and does not classify all
points.

The earlier [length-four contribution and search note](https://github.com/conjectures-io/conjectures-contribution/blob/main/contributions/erdos-686-variants-four/59200f9b5af365193312649c3bd140394474a5c023e61c2fa7c7628a7859426c/sources.md)
reports a ratio-4 search below upper endpoint two million and a length-three
search to denominator ten million. These are different searches from the
one below. The primary forum also discusses continued-fraction estimates
and proved exclusions at length three for ratios 4, 49, and 64. A targeted
follow-up search then retrieved Nat Sothanaphan's 12 March 2026 post reporting
length-three exclusions for ratios 4, **25**, 36, 49, 64, 81, and 100, with a
linked writeup attributed to GPT-5.4 Thinking. The search below at k=3 is
therefore a check of prior work, not a new exclusion. The first retrieved
forum excerpt omitted this later post; that omission was corrected before
this checkpoint was published.

Tao's 5 March 2026 post already gives exactly the primitive divisibility
reduction `v^3-N*u^3 | N^3-N`, attributed to Chan's method. The final section
below is an explicit specialization and rediscovery of that prior argument.
Thus neither continued fractions, the centered-polynomial reduction, nor
the cubic Thue reduction is claimed as a new method. The [author's public
post listing](https://www.erdosproblems.com/forum/user/natso26?all_posts=1)
independently exposes the 12 March report.

For length three, the forum records the elliptic model for ratio 25 as rank
two and points out that its birational map does **not** preserve integrality.
This search works directly with the original centered product equation.
Integral-point output on an unrelated integral Weierstrass model is not used
as an exclusion certificate.

The retrieved sources did not show a full ratio-25 resolution. This is a
scoped source check, not proof of the absence of every unpublished or
unindexed result. No priority claim is made for the reductions below.

## Centered product and a uniform approximation bound

Write the centered numerator and denominator as `X` and `Y`.

| Parity of k | X | Y | Positive roots a_j | s |
| --- | --- | --- | --- | --- |
| odd | m+(k+1)/2 | n+(k+1)/2 | 1,2,...,(k-1)/2 | 1 |
| even | 2m+k+1 | 2n+k+1 | 1,3,...,k-1 | 2 |

Let `epsilon` be 1 for odd k and 0 for even k, and let

```math
 F(T)=T^{\epsilon}\prod_j(T^2-a_j^2).
```

For even k the omitted common power of 2 cancels from the ratio. In both
cases the original equation is `F(X)=N F(Y)`, with `N=25`. We have
`Y > a_max`, `X-Y >= s*k`, and, in the even case, X and Y are odd.

Put `X=g*p`, `Y=g*q`, with `g>0`, `p>q>0`, and `gcd(p,q)=1`. Set
`alpha=N^(1/k)` and `beta=p/q`. Since every paired-root factor increases
the product ratio above `beta^k`, any solution satisfies `1<beta<alpha`.
The disjointness condition gives the stronger elementary bound

```math
 Y>\frac{sk}{\alpha-1}.
```

For a rational certified upper endpoint `alpha_U>alpha`, the implementation
uses a weaker, still valid integer lower bound

```math
 Y_0=\max\left(Y_{\rm domain},
       \left\lceil\frac{sk}{\alpha_U-1}\right\rceil-a_{\max}\right),
```

where `Y_domain=(k+1)/2` for odd k and `k+1` for even k. It rounds Y_0 upward
to an odd integer in the even case. Thus `Y>=Y_0>a_max`.

The logarithmic identity for a solution is

```math
 k\log(\alpha/\beta)
 =\sum_j\left[\log\left(1-\frac{a_j^2}{\beta^2Y^2}\right)
              -\log\left(1-\frac{a_j^2}{Y^2}\right)\right].
```

For `0<=r<=1` and `0<=z<1`, integration of `1/(1-t)` gives
`log(1-r*z)-log(1-z) <= z*(1-r)/(1-z)`. Applying this with
`r=beta^(-2)` and using `beta<alpha` yields

```math
 (\alpha-\beta)Y^2
 \le \frac{(\alpha-\alpha^{-1})\sum_j a_j^2}
              {k(1-a_{\max}^2/Y^2)}
 \le K,
```

where the completely rational bound used in the code is

```math
 K=\frac{(\alpha_U-\alpha_U^{-1})\sum_j a_j^2}
             {k(1-a_{\max}^2/Y_0^2)}.
```

Here `sum a_j^2/k=(k^2-1)/24` for odd k and `(k^2-1)/6` for even k.
Consequently every solution satisfies

```math
 0<\alpha-\frac pq\le\frac{K}{g^2q^2}\le\frac{K}{q^2}.
```

## Exact continued-fraction enumeration

The root enclosure is obtained by an integer k-th root:

```math
 A^k<N\,10^{dk}<(A+1)^k,
 \qquad A/10^d<\alpha<(A+1)/10^d.
```

Both inequalities are checked with integers. Continued-fraction digits are
retained only while both rational endpoints give the same digit. No
floating-point approximation enters candidate acceptance or coverage.

Let `P_j/Q_j` be the resulting certified convergents. For a candidate reduced
denominator `Q_j<=q<Q_(j+1)`, the consecutive convergents form a unimodular
integer basis, so uniquely

```math
 (p,q)=a(P_j,Q_j)+b(P_{j-1},Q_{j-1}).
```

The determinant identity and the usual convergent bound
`|alpha*Q_j-P_j|<1/Q_(j+1)` give

```math
 |b|=|pQ_j-qP_j|
 \le Q_j|p-\alpha q|+q|\alpha Q_j-P_j|
 <KQ_j/q+q/Q_{j+1}<K+1.
```

The script therefore enumerates `|b|<=ceil(K)+1`, a safe enlargement. For
each b it enumerates exactly the integers a that put q in
`[Q_j,Q_(j+1))`. It retains primitive pairs, positive q, and p>q, and checks
`p^k<N*q^k` using integers. This covers every possible solution with reduced
denominator less than the last retained convergent denominator.

For a retained primitive pair the original ratio is strictly decreasing in
g on its admissible domain: each positive factor

```math
 \frac{g^2p^2-a_j^2}{g^2q^2-a_j^2}
```

decreases with g because its derivative with respect to `g^2` has numerator
`a_j^2*(q^2-p^2)<0`. The ratio tends to `(p/q)^k<N`.
Thus there is at most one integer g giving equality. The code starts at the
smallest g satisfying positivity and disjointness. It uses exact integer
signs to double a bracket and bisect the first nonpositive value. For even k
it enforces the odd-center restrictions and rejects an even recovered g.
Every accepted point is checked again in the original product equation.

This treats all positive g for each enumerated primitive pair. It does not
bound g arbitrarily or assume g=1.

## Search results and limits

| Run | Lengths | Certified root precision | Primitive pairs checked | Result |
| --- | --- | --- | --- | --- |
| First batch | 3,5,6,7,9,11,13 through 31 | 200 decimal places | 1,412,063 | no witness |
| Second batch | 32 through 63 | 100 decimal places | 1,245,737 | no witness |
| Separate length-three run | 3 | 400 decimal places | 18,494 | no witness |

The first batch uses 25 lengths, including the previously excluded k=3 as a
check; the second uses 32. The first batch's exact
reduced-denominator cutoffs lie between `10^98` and `10^100`; the second
batch's lie between `10^48` and `10^50`. Each JSON entry supplies the exact
exclusive cutoff, certified CF term count, K, and enumeration bound. The
separate length-three cutoff is approximately `1.925 * 10^199`.

These ranges follow from the mathematical reduction plus execution of the
attached integer program. They are not Lean kernel certificates. In
particular, **57 tested lengths are not 57 solved problems**. Lengths
outside these runs and reduced denominators outside each cutoff remain.
Finding a single admissible point would settle the positive ratio-25 bounty;
these unsuccessful searches do not settle it negatively.

The control run recovers the already known ratio-9 point `(k,m,n)=(3,25,11)`
and the ratio-16 point `(3,13,4)`. The latter has g=3 and checks recovery with
a nontrivial gcd. Five further controls recover the direct identities
`N=binomial(2k,k), m=k, n=0` at k=4 through 8, including the even-center
parity branch. These controls are already known identities and are not new
bounty solutions. Their output is in `known-witness-controls.json`.

The root coordinator independently checked the approximation inequality,
continued-fraction basis bound, monotonicity in g, and the Thue reduction
below. This was another AI review, not an independent human verification.

## Previously known Thue reduction at length three

The following is the specialization of the prior Chan/Tao argument described
above, not a novelty claim. For k=3, put `X=m+2=g*v`, `Y=n+2=g*u`, where
`gcd(u,v)=1`. The equation is

```math
 X^3-X=25(Y^3-Y).
```

For any admissible solution, `1<v/u<25^(1/3)`. Set

```math
 D=25u^3-v^3>0.
```

After cancellation of g the equation becomes

```math
 g^2D=25u-v.
```

Hence D divides `25u-v`. Reducing cubes modulo D gives
`D | (25^3-25)u^3`. Also `gcd(u,D)=gcd(u,v^3)=1`, so

```math
 D\mid 25(25^2-1)=15600.
```

There are 60 positive divisors D, since `15600=2^4*3*5^2*13`. Thus every
length-three solution comes from one of the cubic Thue equations

```math
 v^3-25u^3=-D,\qquad D\mid15600,
```

with u,v positive and coprime, and with square recovery
`g^2=(25u-v)/D`, `g*u>=2`, and `g*v>=g*u+3`. Conversely, these conditions
reconstruct an admissible length-three point. No complete Thue solver was
available or run locally, and the linked 12 March classification was not
independently reproduced here. Its reported prior exclusion already
prevents this length from being treated as new work. A classification at
length three does not settle the all-length bounty.

## Reproduction

Python 3 with SymPy is sufficient. From the repository root, run:

```sh
python research/bounty-session-2026-11-21/erdos686/run_cf_batch.py \
  --ratio 25 --digits 200 \
  --lengths 3 5 6 7 9 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 \
  --output research/bounty-session-2026-11-21/erdos686/search-ratio25-lengths3-31.json

python research/bounty-session-2026-11-21/erdos686/run_cf_batch.py \
  --ratio 25 --digits 100 \
  --lengths 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 \
  --output research/bounty-session-2026-11-21/erdos686/search-ratio25-lengths32-63.json

python research/bounty-session-2026-11-21/erdos686/cf_witness_search.py \
  --ratio 25 --length 3 --digits 400 \
  --output research/bounty-session-2026-11-21/erdos686/search-ratio25-k3.json
```

Each batch records the search program's SHA-256. Timings are incidental and
will differ between machines. The frozen bounty has not been compiled or
submitted using this search code; only a discovered exact witness, or a
complete proof of nonexistence, would support that next step.
