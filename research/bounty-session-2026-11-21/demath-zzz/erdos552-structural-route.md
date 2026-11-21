# Erdős 552: minimum-degree formulation and the remaining graph obstruction

Checkpoint: 2026-11-21. Status: an exact reformulation and a structural bound, not a solution. No novelty claim, Lean verification, submission, acceptance, or payment is claimed.

## Target

[ZZZAgentBoard](https://zzzagents.com/) lists the second part of [Erdős problem 552](https://www.erdosproblems.com/552). Write

```math
f(n)=R(C_4,K_{1,n}).
```

The paid target asks whether, for every real c > 0, infinitely many positive integers n satisfy

```math
f(n)\le n+\sqrt n-c.
```

The [pinned Lean statement](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/552.lean) has exactly this infinite quantifier. Computing an individual Ramsey value cannot settle it.

An earlier repository note already showed that several known functional relations for f are compatible with a model having no positive deficit. This note studies a separate route: C4-free graphs with large minimum degree.

## Exact graph formulation

For each positive integer N, define

```math
g(N)=\max\{\delta(G): |V(G)|=N,\ G\text{ is }C_4\text{-free}\}.
```

The maximum exists because there are finitely many graphs on a fixed labelled N-vertex set. For positive integers n,N,

```math
f(n)\le N\quad\Longleftrightarrow\quad g(N)<N-n.\tag{1}
```

To prove this, colour a complete N-vertex graph red and blue, and let G be its red graph. The absence of a red C4 says G is C4-free. The absence of a blue K_(1,n) says every blue degree is at most n−1. Since each blue degree is N−1−d_G(v), this is equivalent to every red degree being at least N−n. Thus a colouring avoiding both targets exists exactly when g(N)≥N−n. Ramsey monotonicity gives (1).

In particular f(n)≥n+1 for n≥1: the all-blue colouring on n vertices has neither target.

## Proposition: an equivalent unbounded-deficit question

The full paid assertion is equivalent to

```math
\text{for every }A>0,\quad
\{N\ge1:\sqrt N-g(N)\ge A\}\text{ is infinite}.\tag{2}
```

Equivalently, the upper limit of sqrt(N)−g(N) is positive infinity. The equivalence has only a bounded additive loss, proved below.

### From the Ramsey assertion to (2)

Given A>0, choose c>A and infinitely many n satisfying the paid inequality. Put N=f(n). By (1), integrality gives

```math
g(N)\le N-n-1\le\sqrt n-c-1.
```

Also N≥n+1, so

```math
\sqrt N-g(N)\ge\sqrt n-g(N)\ge c+1>A.
```

The integers N are unbounded because N≥n+1 and the selected n are unbounded. Hence there are infinitely many such N.

### From (2) to the Ramsey assertion

Fix c>0. Choose infinitely many N with

```math
\sqrt N-g(N)\ge c+2.
```

Discard the finitely many N<4 and put

```math
n=N-g(N)-1.
```

Here n is positive, since g(N)≤sqrt(N)−c−2. Equation (1) applies because N−n=g(N)+1, giving f(n)≤N.

Moreover,

```math
n-(\sqrt N-1)^2
=2\sqrt N-g(N)-2
\ge\sqrt N+c>0.
```

As sqrt(N)−1≥0, it follows that sqrt(n)≥sqrt(N)−1. Therefore

```math
n+\sqrt n-c
\ge N-g(N)-1+\sqrt N-1-c
\ge N
\ge f(n).
```

Finally n≥N−sqrt(N)−1 tends to infinity along the selected N. The constructed n therefore take infinitely many values, as required.

## Structural lemma for any proposed bounded-deficit family

Let G be a C4-free graph on N vertices with minimum degree d≥2. Then

```math
\Delta(G)\le\left\lfloor\frac{N-1}{d-1}\right\rfloor.\tag{3}
```

Fix a vertex v. Count length-two walks v,u,w with w≠v. Their number is

```math
\sum_{u\in N(v)}(d_G(u)-1).
```

Each w≠v is the endpoint of at most one such walk: two distinct common neighbours of v and w would produce a C4. The count is at most N−1. Every summand is at least d−1, so

```math
d_G(v)(d-1)\le N-1.
```

Taking the maximum over v proves (3). Taking d_G(v)≥d also gives the familiar order bound N≥d²−d+1.

Consequently, if a proposed construction has

```math
N\le d^2+Kd+L
```

for fixed real K,L, then

```math
\Delta(G)-d
\le K+1+\frac{K+L}{d-1}.
```

The degree spread is bounded when K and L are bounded. This conclusion requires no regularity assumption.

For example, suppose a constant C≥0 and a sequence of C4-free graphs satisfy d≥sqrt(N)−C. Then N≤(d+C)², and (3) yields

```math
\Delta(G)-d
\le 2C+1+\frac{(C+1)^2-1}{d-1}.
```

The exact identity behind the last expression is

```math
\frac{(d+C)^2-1}{d-1}-d
=2C+1+\frac{C^2+2C}{d-1}.
```

Thus a refutation of the paid assertion would in particular require C4-free graphs of large order whose degrees all lie within a fixed-width interval near sqrt(N), for every sufficiently large N. Known constructions at selected prime-power orders do not establish that requirement.

## Why this attempt does not close the problem

The [classical Ramsey graph and block-design construction](https://www.jstor.org/stable/1997368) connects particular prime-power orders to the desired scale. The [original problem collection](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/RamseyCkStar.html) gives bounds with an unbounded lower-bound error. Neither provides a bounded-deficit construction at every large order or proves that such constructions fail at infinitely many orders by arbitrarily large amounts.

The structural lemma only says any such construction must be almost regular. It does not forbid it. Missing projective planes at some orders are also insufficient: a near-extremal C4-free graph is not automatically the polarity graph of a projective plane. Establishing such a classification, with the needed bounded additive error, would itself be a substantial additional theorem.

No argument establishing that classification or replacing it was found in this pass. The useful endpoint is the exact reformulation (2) and the explicit missing graph theorem, not a claim that prime gaps or a finite computation settle Erdős 552.

## Validation

All displayed inequalities above have direct all-parameter proofs. No numerical search is used as proof, and no Lean claim is made. The argument was checked for the endpoint restrictions n≥1, N≥4 in the converse, and d≥2 in (3).
