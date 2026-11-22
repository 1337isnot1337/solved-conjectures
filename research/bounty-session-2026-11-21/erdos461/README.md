# Erdős 461: finite residue reduction

Research checkpoint, 21 November 2026. No solution of the bounty target and no award claim.

## Target and payment scope

For an integer t >= 1, let s_t(m) be the product of the prime powers dividing m whose prime is strictly less than t. The target asks for an absolute c > 0 such that

    |{s_t(n+1), ..., s_t(n+t)}| >= c t

for every n >= 0 and t >= 1. The t=0 case is empty and automatic.

The official [Conjectures.io page](https://conjectures.io/problems/erdos461-erdos-461) showed no attempts and an estimated bounty of about $1,676 at retrieval. Payment requires an exact Lean proof or refutation, human review, and a payout wallet. This amount is a fluctuating SN66 Alpha estimate; it is not reserved or earned. The [submission guide](https://conjectures.io/how-it-works) specifies a paid submission credit and original AI chat logs. No submission or account operation was made.

Pinned proof-task identity, from the official page:

- `fc-v2-erdos461-erdos-461-bbf8e199ec904c8f66c60d9f-formalized`
- Source type hash: `0b960bbb0b57641a804c11e503a46d3c84e2e270f56b55c155db1ddc0c3415ba`
- Bundle hash: `c2676d7a08b63f8f4c7b6c077ca21759b1619571e920b78ad7ac3c226a999278`

## Literature check

Erdős and Graham, *Old and new problems and results in combinatorial number theory* (1980), p. 92, report the lower bound of order t/log t. The [Erdős Problems discussion](https://www.erdosproblems.com/forum/thread/461) records a June 2026 first-moment argument giving

    inf_n f(n,t) <= (1 - exp(-EulerGamma) + o(1)) t.

Its author explicitly does not claim to resolve the original question; Thomas Bloom notes that the upper-bound calculation is likely standard. In particular, a proposed universal t/2 bound is false. This existing upper bound is not a new result of this session.

## Exact finite reduction

Let t >= 2. For every prime p < t, let e_p be the least positive integer satisfying p^(e_p) >= t, and put

    L_t = product_(p prime, p<t) p^(e_p).

For any fixed n >= 0 and indices 1 <= i,j <= t,

    s_t(n+i) = s_t(n+j)
       iff gcd(n+i,L_t) = gcd(n+j,L_t).

Proof. The forward direction follows by truncating each prime valuation at e_p. For the converse, assume i != j and the two gcds agree. For a fixed p<t, equality of the gcds says that the two valuations, truncated at e_p, agree. If both valuations were at least e_p, then p^(e_p) would divide the nonzero difference |i-j|, which is strictly smaller than t <= p^(e_p). This is impossible. Thus both valuations are below e_p and agree without truncation. This holds for every p<t, so the two smooth components agree. The case i=j is immediate.

Consequently

    f(n,t) = |{gcd(n+i,L_t): 1<=i<=t}|,

and f(n,t) is periodic in n with period L_t. This is a finite reformulation for each fixed t, not a uniform bound as t grows. The modulus grows rapidly and exhaustive residue enumeration does not resolve the conjecture.

The Chinese remainder theorem also gives an equivalent independent-choice formulation: choose a residue r_p modulo p^(e_p) for every prime p<t, partition the positions i by min(v_p(r_p+i),e_p), and count the cells in the common refinement. Every such choice occurs for some n modulo L_t. Valuations at a zero residue are capped at e_p.

## A stronger collision constraint

For t>2, if i<j and s_t(n+i)=s_t(n+j)=s, then

    2s divides j-i.

Indeed, write n+i=s a and n+j=s b. Both a and b have no prime divisor smaller than t, so they are odd. Hence b-a is even. In particular, every smooth component greater than (t-1)/2 occurs at most once. A component s has multiplicity at most floor((t-1)/(2s))+1.

This gives a lower bound in terms of the sum of inverse multiplicities but does not control the abundance of small components uniformly in n. The missing step is a uniform estimate that forces a positive proportion of distinct classes.

## Why two immediate estimates fail

1. A divisor-sum identity gives a large untruncated first moment of the smooth components, but a single component can be enormous. This does not imply that many components are large or distinct.
2. A uniform rough-number sieve bound on one class controls its multiplicity, but summing such independent bounds over all possible small components loses the factor needed for a linear result. The compatibility of all prime residue partitions must be used.

No claim of novelty is made for these elementary reductions. Their purpose is to isolate the precise finite combinatorial problem and exclude invalid proof shortcuts. The conjecture remains open in this work.

## Obstruction to using only the collision constraint

The sequence a_i = 2^(v_2(i)), for 1<=i<=t, satisfies exactly the same necessary condition: if a_i=a_j=s and i<j, then 2s divides j-i. Nevertheless its range has only floor(log_2 t)+1 elements. Thus the collision constraint alone cannot yield a linear lower bound. The omitted conditions at odd primes are essential.

## Reproducible finite check

`python check_residue_reduction.py` enumerates every residue modulo L_t for each t from 2 through 11. The minimum counts are respectively

    1, 2, 3, 3, 4, 4, 5, 5, 6, 6.

The output records the modulus, number of residues enumerated, a first minimizer, and its actual smooth components. Separate checks compare the complete equality partitions of the smooth components and gcds at representative residues and several period shifts; they also check the collision divisibility condition. These calculations verify the reduction's implementation in small ranges. They do not supply the required uniform estimate.

## Lean verification and exact scope

`ResidueReduction.lean` compiles with Lean 4.35.0 and the existing Mathlib 4.35.0 build. The four printed theorem axiom sets contain only `propext`, `Classical.choice`, and `Quot.sound`. The file proves:

- equality of small-prime power-divisibility profiles is equivalent to equality of gcds with any admissible modulus, for two distinct positions whose distance is smaller than t;
- translating both positions by an admissible modulus preserves that equality relation;
- the explicit, nonminimal modulus ((t-1)!)^t is admissible for t>0.

The formalized profile means: for every prime p<t and every k>=0, p^k divides one number exactly when it divides the other. Its bridge to the bounty platform's smooth-component definition is not included. The shorter product modulus L_t used by the finite checker is proved adequate in the written argument; only the larger factorial modulus is instantiated in Lean. The linear lower bound is not proved.

Exact local reproduction used an existing built dependency tree; no dependency download is part of this command:

```bash
python verify_lean.py \
  --lean-binary /home/agent/.elan/toolchains/leanprover--lean4---v4.35.0/bin/lean \
  --lean-project /workspace/scratch/17b12d3ee06e/solved-conjectures/lean
```

The script constructs `LEAN_PATH` from the dependency build directories, runs the displayed compiler, records the full command and environment paths, hashes the source, and saves the output and exit code in `lean-output.txt` and `lean-check.json`. A different machine can supply its own already-built Lean project and compiler at the two arguments. This auxiliary check is not a check against Conjectures.io's pinned Lean 4.35.0-rc2 submission environment.

## Range estimates across starting residues

The [conditional concentration theorem](conditional-concentration.md) proves convergence of the range divided by the interval length to $1-e^{-\gamma}$ in probability and in mean over the exact finite period. For each fixed tolerance the exceptional probability is exponentially small in a positive power of the length, uniformly after all small-prime residues are prescribed.

The [one-center bound](aligned-large-primes.md) and [two-center reflection bound](two-center-reflection.md) give deterministic linear lower bounds when the large-prime residues align with the indicated positions. An exceptional offset lacking such a center or reflected pair remains possible. The [funded platform target](https://conjectures.io/problems/erdos461-erdos-461) requires a proof or refutation for **all** offsets.

The [polynomial-height theorem](polynomial-height.md) proves the linear bound for every starting point up to any fixed power of the interval length, without alignment assumptions. Its constant depends on that power. A counterexample sequence to the full statement would therefore require starting points exceeding every fixed power.

The [rational representative theorem](rational-representatives.md) transfers a uniform arithmetic-progression estimate to starting residues with small weighted prime-power disagreement. The least representative can already be exponential in the interval length.

The [large-prime agreement theorem](large-prime-rational-agreement.md) removes all restrictions at the smaller primes and needs only congruence modulo the larger primes themselves. Its final estimate shows that a uniform starting residue admits any such rational approximation with exponentially small probability.
