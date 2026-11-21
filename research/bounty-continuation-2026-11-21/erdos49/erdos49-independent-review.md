# Independent review of the Erdős 49 blocker reformulation

Reviewed 2026-11-21. Conclusion: the reduction is correct under the definitions below. It does not prove the required prime-count inequality and does not solve a bounty. This review claims no novelty for the reformulation.

The paid [primes-maximal target](https://conjectures.io/problems/erdos49-erdos-49-variants-primes-maximal) concerns the exact finite maximum, not the already proved asymptotic estimate.

## Definitions and exact formula

For N ≥ 2, let f(N) be the largest cardinality of a subset of {1,...,N} on which Euler's totient is strictly increasing. A composite chain C is a set of composite numbers in that interval, ordered both by increasing value and by strictly increasing totient. Empty C is allowed. Define

```math
B(c)=\{p\text{ prime}:\varphi(c)\lt p\lt c\},
\qquad B(C)=\bigcup_{c\in C}B(c).
```

Then

```math
f(N)-\pi(N)=\max_C\bigl(|C|-|B(C)|\bigr).
```

An admissible set containing 1 cannot contain 2 because their totients are equal. Replacing 1 by 2 is valid: every remaining element is at least 3 and has totient at least 2. We may therefore assume its nonprime elements are composites at least 4.

If p is prime and p<c, the pair is compatible exactly when p−1<φ(c), equivalently p≤φ(c). If p>c, then φ(p)=p−1≥c>φ(c), so compatibility is automatic. These are the only two cases because c is composite.

Consequently every admissible set with composite part C uses only primes outside B(C). Conversely all primes at most N outside B(C) can simultaneously be added to C. Their resulting union has exactly π(N)+|C|−|B(C)| elements. Taking the maximum proves the formula.

## Endpoint checks

The lower endpoint is strictly excluded from the interval of blocked primes. If p=φ(c), then φ(p)=φ(c)−1 and the prime is compatible. If p=φ(c)+1 is prime, its totient equals φ(c), so it is blocked.

For c=4, φ(c)=2 and B(4)={3}. In particular, 2 is compatible with 4 while 3 is incompatible. Inserting 4 therefore exchanges it for prime 3; it does not gain an element. This resolves the potentially troublesome equality φ(c)=p−1.

The upper endpoint c is composite, so using π(c) instead of π(c−1) introduces no error.

## Prime-index components

Number the primes in increasing order. B(c) corresponds exactly to the integer interval

```math
I(c)=\{\pi(\varphi(c))+1,\ldots,\pi(c)\}.
```

An empty interval gives a singleton counterexample to primes-maximality and must be handled before splitting into components. For a composite chain, both left and right endpoints are nondecreasing. For nonempty intervals, split whenever the next left endpoint is more than the previous right endpoint plus one. Every resulting group has union equal to its full integer span. Adjacency is enough here; this is a statement about intervals of prime indices, not about connected open intervals on the real line.

For a group c_s,...,c_t, its blocked-prime count is exactly

```math
\pi(c_t)-\pi(\varphi(c_s)).
```

Different groups have disjoint blocker sets, so the total excess is the sum of the groups' excesses.

It follows that primes-maximality for all N is equivalent to the following statement for every composite chain c_1<...<c_r with strictly increasing totients:

```math
r\le\pi(c_r)-\pi(\varphi(c_1)).
```

Necessity follows because the actual blocker union has cardinality at most the full span. For sufficiency, apply the displayed inequality separately to every prime-index component; apply it to a singleton first if an interval is empty. The component blocker counts add to at least r, so the exact formula above gives f(N)≤π(N). The opposite inequality is supplied by the primes.

## Arithmetic obstruction remaining

Even the singleton case is a substantial arithmetic requirement. Taking c=p² for a prime p gives

```math
\pi(p^2)-\pi(p^2-p)\ge1,
```

so the proposed exact theorem would imply the existence of a prime strictly between p²−p and p² for every prime p. This is an immediate logical consequence of the reformulation, not an independently proved prime-distribution result. It identifies a prime-indexed instance of the lower interval in Oppermann's conjecture. No assertion that this special implication is new is made.

The interval reduction is therefore not the missing proof. A complete solution must establish the all-chain inequality or produce a violating chain.

## Independent finite verification

`review_erdos49.py` enumerated all 2,454 strictly increasing-totient composite chains in {1,...,30}, including the empty chain. It verified the compatibility construction and the prime-index union formula for every chain. For every prefix N=2,...,30 it compared the maximum excess with a separately computed longest strictly increasing subsequence of φ(1),...,φ(N). All comparisons passed. The equality endpoint at c=4 was checked explicitly.

These checks audit the implementation and endpoint conventions. They do not establish the unbounded mathematical conjecture. The universal arguments above establish only the reduction.
