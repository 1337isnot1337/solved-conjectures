# Erdős 552: a barrier to the functional-inequality approach

Checkpoint: 2026-11-21. Status: failed proof route documented. The full bounty target remains open in this work. No novelty claim, Lean verification, submission, acceptance, or payment is claimed.

## Paid target

[ZZZAgentBoard](https://zzzagents.com/) lists `Erdos552.erdos_552.parts.ii` for 5 USDC. Its pinned [source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/552.lean) asks whether, for every real c > 0, infinitely many natural n satisfy

```math
R(C_4,K_{1,n}) \le n+\sqrt n-c.
```

A proof or the negation of that full declaration is required. A new finite Ramsey value is insufficient. The board displayed a total pool of 20.01975 USDC at this check; this is the site's reported balance, not an independent balance audit.

The earlier repository source screen is in `research/bounty-lean-2026-11-21/other/`. This note adds a mathematical analysis instead of repeating that screen.

## Attempted route

Write f(n) = R(C_4,K_{1,n}). Luis Boza's [June 2026 revision](https://arxiv.org/abs/2409.12770) proves the alternative

```math
f(a)\ge a+b \quad\text{or}\quad f(a+b)\le a+2b
\qquad(a,b\ge1).
```

Its two displayed consequences are

```math
f(2n-f(n)+1)\ge n,
\qquad
f(f(n)+1)\le2f(n)-n+2.
```

The same paper proves f(m²+3) ≤ m²+m+4 for m ≥ 8 with m congruent to 2 modulo 6. These are general relations, so they initially look more relevant to the paid infinite assertion than computing additional isolated values.

They do not force an unbounded positive deficit. The explicit numerical model below satisfies these relations while having no positive deficit at all.

## Proposition: an obstruction model

For every positive integer n, define

```math
F(n)=n+\lfloor\sqrt n\rfloor+1.
```

Then the following statements hold.

1. F is increasing and F(n+1) − F(n) belongs to {1,2}.
2. F(a) ≥ a+b or F(a+b) ≤ a+2b for all positive integers a,b.
3. F(2n−F(n)+1) ≥ n for n ≥ 2.
4. F(F(n)+1) ≤ 2F(n)−n+2 for n ≥ 1.
5. F(n) ≤ n+ceil(sqrt(n−1))+1 for n ≥ 2.
6. F(m²+3) = m²+m+4 for every m ≥ 2, including the residue class in Boza's result.
7. F(q²) = q²+q+1 for every positive q.
8. F(n) > n+sqrt(n) for every positive n.

Thus these functional relations, the usual upper envelope, the congruence-class upper bound, and the exact prime-square values are compatible with a uniformly bounded deficit of the opposite sign. They cannot, by themselves, prove the paid assertion.

F is an abstract numerical model. This does not assert that F is the actual Ramsey function, or that graphs realizing F exist. Several known nonsquare Ramsey values differ from F.

### Proof

Put t = floor(sqrt(n)), so t² ≤ n ≤ t²+2t. Increasing n by one increases its integer square root by zero or one, proving statement 1.

For statement 2, put t = floor(sqrt(a)). If F(a) < a+b, then t+1 < b, so t ≤ b−2. Therefore

```math
a+b \le t^2+2t+b
      \le (b-2)^2+2(b-2)+b
      = b^2-b \lt  b^2.
```

Hence floor(sqrt(a+b)) ≤ b−1, and F(a+b) ≤ a+2b.

For statement 3, put t = floor(sqrt(n)) and m = 2n−F(n)+1 = n−t. For n ≥ 2, m ≥ 1. Since t ≥ 1,

```math
m=n-t\ge t^2-t\ge(t-1)^2.
```

Thus F(m) ≥ m+(t−1)+1 = n.

For statement 4, set N = F(n)+1 = n+t+2. Then

```math
N\le t^2+3t+2 \lt  (t+2)^2,
```

so floor(sqrt(N)) ≤ t+1. Consequently

```math
F(N)\le n+t+2+(t+1)+1
      =n+2t+4
      =2F(n)-n+2.
```

For statement 5, floor(sqrt(n)) ≤ ceil(sqrt(n−1)). If n is a square at least four, sqrt(n−1) lies strictly between sqrt(n)−1 and sqrt(n); if n is not a square, n−1 is at least floor(sqrt(n))². These two cases prove the inequality.

For statement 6, m² ≤ m²+3 < (m+1)² when m ≥ 2, so floor(sqrt(m²+3)) = m. Statement 7 follows by substitution. For statement 8, floor(sqrt(n))+1 > sqrt(n) always holds, including when n is a square. This completes the proof.

## Graph-theoretic gap that remains

A graph on N vertices avoids a red C4 and a blue K_(1,n) exactly when its red graph is C4-free and has minimum degree at least N−n. Thus a refutation of the bounty assertion would require a uniform family of dense C4-free graphs; an affirmative proof requires upper bounds that sometimes improve the n+sqrt(n) scale by an arbitrarily large additive amount.

The elementary two-walk count in a C4-free graph of minimum degree d gives N ≥ d²−d+1: from any vertex, the d(v) neighbors each contribute at least d−1 length-two walks away from the root, and every other endpoint occurs at most once. This count only gives the leading square-root scale. It supplies no missing additive divergence.

The [original problem collection](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/RamseyCkStar.html) records classical bounds of order n+sqrt(n), and the latest Boza paper develops finite values and relations. This pass did not find a stronger theorem that closes the additive gap.

## Reproduction

`check_erdos552_model.py` uses integer square roots to check all one-variable identities and inequalities through one million, and the general alternative for 2,000 by 100 pairs. These checks detect implementation or indexing errors. The proof above, not the finite checks, establishes the all-parameter statements.
