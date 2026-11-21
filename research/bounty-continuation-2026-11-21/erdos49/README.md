# Erdős 49: an exact interval reformulation

Status, 21 November 2026: the full conjecture remains unresolved. The reduction below has a written proof. Its novelty is not established. No Lean verification, bounty submission, or payment is claimed. Finite checks are diagnostics only.

## Paid target and source identity

The target is the exact statement that, for every integer `N >= 2`, the largest cardinality `f(N)` of a subset of `{1,...,N}` on which Euler's totient function is strictly increasing is `pi(N)`.

The [live Conjectures target](https://conjectures.io/problems/erdos49-erdos-49-variants-primes-maximal) displayed no attempts and an estimated bounty of approximately USD 2,702 when checked. That figure fluctuates and is not a reserved payment. Its proof task is:

```text
fc-v2-variants-primes-maximal-34155cb22f9205957c6deb8a-formalized
source type SHA-256: 1cd711ac7e80ce6d0cb4a09075bd614e63813dd03bddd1dc332ddfa76a871d23
task commitment: 1b2405ba10322fe22d7e97830758cc3599f213d3abebacc78e3a6b4afe970098
```

The source file is added by the validator's [audit patch](https://github.com/conjectures-io/conjectures-tasks/blob/main/tiers/tier-1/formal-conjectures-audit-fixes.patch), rather than present at the upstream base revision. It defines `f` using `StrictMonoOn Nat.totient` and finite sets contained in `Finset.Icc 1 N`. The exact target is `forall N : Nat, 2 <= N -> f N = Nat.primeCounting N`.

[Tao's published paper](https://doi.org/10.1007/s44007-024-00115-z), Theorem 1.1, gives the asymptotic upper bound, including the more permissive nondecreasing version. This does not prove exact equality for the strict version. Section 4.1 already records the obstruction arising from prime squares and unusually large prime gaps. That obstruction is prior work, not a result of this campaign.

Current [submission terms](https://conjectures.io/submission-terms), version 13, require mathematical novelty, the exact Lean statement, original AI logs, and a submission credit. A conventional established public proof can make a target ineligible even when no Lean formalization exists. The terms do not expressly exempt a solver's own earlier public proof; a complete solution should therefore not be publicly committed before clarifying that point or arranging submission. This note does not contain a complete solution.

## Definitions

Write `phi` for Euler's totient function and `pi(x)` for the number of primes at most the integer `x`.

A **composite chain** is a sequence

```math
c_1\lt c_2\lt \cdots\lt c_r,
\qquad
\varphi(c_1)\lt \varphi(c_2)\lt \cdots\lt \varphi(c_r),
```

whose entries are composite positive integers. The empty chain is permitted. For a composite integer `c`, define its set of blocking primes by

```math
B(c)=\{p:p\text{ is prime and }\varphi(c)\lt p\lt c\}.
```

For a composite chain `C`, let `B(C)` be the union of `B(c)` over its entries. Put

```math
\Delta(C)=|C|-|B(C)|.
```

## Exact deficit formula

For every `N >= 2`,

```math
f(N)-\pi(N)
=\max_{C\subseteq\{4,\ldots,N\}\text{ a composite chain}}\Delta(C).
\tag{1}
```

The subtraction in this formula is ordinary integer subtraction. The right side is nonnegative because the empty chain has deficit zero.

### Proof

First remove the exceptional integer 1. A strictly increasing totient set cannot contain both 1 and 2, because both have totient 1. If it contains 1, replace 1 by 2. Every other entry is at least 3 and has totient at least 2, so the replacement preserves cardinality and strict increase. Thus a maximizing set can be assumed to lie in `{2,...,N}`.

Now fix a composite chain `C` with all entries at most `N`. Let `p <= N` be prime and let `c` be an entry of `C`.

If `p < c`, the pair is compatible with strict increase exactly when

```math
\varphi(p)=p-1\lt \varphi(c),
```

or equivalently `p <= phi(c)`. In particular, the endpoint `p = phi(c)+1` is forbidden: it gives equal totients.

If `p > c`, the pair is always compatible, since

```math
\varphi(p)=p-1\ge c>\varphi(c).
```

Consequently, the primes that can be adjoined to `C` are exactly the primes at most `N` outside `B(C)`. All of them can be adjoined simultaneously, because totients increase strictly on the primes and every prime-composite pair is compatible. The resulting set has cardinality

```math
\pi(N)+|C|-|B(C)|.
```

Conversely, the nonprime entries of any normalized strictly increasing totient set form a composite chain `C`, and its prime entries are a subset of those same compatible primes. Its size is at most the displayed expression. Taking maxima proves (1).

## Reduction to one interval

For a fixed `N >= 2`, the following statements are equivalent:

1. `f(N) = pi(N)`.
2. Every composite chain with entries at most `N` satisfies `|C| <= |B(C)|`.
3. Every nonempty composite chain `c_1 < ... < c_r <= N` satisfies

```math
r\le\pi(c_r)-\pi(\varphi(c_1)).
\tag{2}
```

Thus the full paid conjecture is equivalent to (2) for every finite composite chain. This is a reformulation of the remaining problem; (2) is not proved here.

### Proof

The equivalence of statements 1 and 2 follows from (1).

For statement 2 implying statement 3, observe that increasing inputs and increasing totients give

```math
B(C)\subseteq\{p:p\text{ prime},\ \varphi(c_1)\lt p\lt c_r\}.
```

Since `c_r` is composite, the set on the right has cardinality `pi(c_r)-pi(phi(c_1))`. This proves (2).

For the reverse direction, enumerate the primes in increasing order, starting with index 1. The blocking primes of `c_i` have the consecutive indices

```math
I_i=[L_i,U_i]\cap\mathbb Z,
\qquad
L_i=\pi(\varphi(c_i))+1,
\quad
U_i=\pi(c_i).
```

Both endpoint sequences are nondecreasing. If one interval is empty, applying statement 3 to that singleton chain would give `1 <= 0`. Thus statement 3 guarantees that all these intervals are nonempty.

Partition the ordered intervals into maximal consecutive groups whose unions are integer intervals. Concretely, start a new group whenever the next left endpoint is greater than the current right endpoint plus 1. Since the right endpoints are nondecreasing, a group starting at entry `a` and ending at entry `b` has union exactly

```math
[L_a,U_b]\cap\mathbb Z,
```

of size `pi(c_b)-pi(phi(c_a))`. Its entries themselves form a composite chain. Statement 3 bounds the number of entries in this group by the size of its union. Different groups have disjoint unions. Summing over the groups gives `|C| <= |B(C)|`, as required.

## Consequence for a counterexample search

If any counterexample exists, there is a composite chain whose blocking prime intervals form one integer interval and whose cardinality exceeds the number of primes in that interval. An arbitrary long increasing-totient witness can be reduced to such a chain by retaining a group with positive deficit.

This provides a short, exact certificate format for a disproof:

```math
c_1\lt \cdots\lt c_r,\qquad
\varphi(c_1)\lt \cdots\lt \varphi(c_r),\qquad
r>\pi(c_r)-\pi(\varphi(c_1)).
```

The certificate is stronger than a numerical indication that a longest subsequence is long: together with (1), it directly constructs a set larger than the primes. No such certificate was found.

## Finite computation

`search_erdos49.py` uses an integer totient sieve and the strict longest-increasing-subsequence algorithm (`bisect_left`, not `bisect_right`). It checks every prefix up to the chosen bound. On a mismatch it reconstructs a witness and extracts a blocking-interval group of positive deficit.

The initial exact-integer run through `N = 2,000,000` found no mismatch. The endpoint has `f(N) = pi(N) = 148,933`. The independently checked small cases use direct gcd counting for totients, a quadratic subsequence algorithm, and exhaustive enumeration of composite chains through 25 to test the deficit formula. These computations do not prove the unrestricted statement and are not a numerical-record claim.

Reproduce:

```bash
python search_erdos49.py --limit 2000000 --output erdos49_check.json
```

## Remaining obstacle

The reduction moves the issue into (2), but no number-theoretic argument establishing that inequality is available here. Merely showing that each individual interval contains a prime does not suffice: several composite entries may compete for the same blocking primes. Tao's asymptotic estimates do not give the exact Hall-type bound that (2) requires.

No complete proof or counterexample has been obtained. The completed bounty count for this lane remains zero.
