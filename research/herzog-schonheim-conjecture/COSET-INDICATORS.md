# Herzog–Schönheim conjecture

**Partial research.** Coset-indicator independence and the private-point property lift through normal prime-power subgroups whose prime is large relative to the quotient's subgroup-order spectrum. The same-characteristic trace also lifts arbitrary linear relations without a size threshold. This complements the normal-simple-kernel lifting criteria in this directory. The unrestricted conjecture remains open. [Issue #324](https://github.com/1337isnot1337/solved-conjectures/issues/324)

## Target and scope

In any finite coset partition of a group into at least two parts, Herzog and Schönheim ask whether some pair of underlying subgroup indices must agree. The problem reduces to finite groups by factoring out a common normal core. Menon proves the solvable case. Garonzi and Margolis prove the simple and symmetric cases. The November 24, 2026 source screen found no unrestricted resolution. [Herzog–Schönheim, Research Problem 9, as restated in Sun](https://arxiv.org/abs/math/0306099) · [Menon](https://arxiv.org/abs/2611.11002) · [Garonzi–Margolis](https://arxiv.org/abs/2509.25118)

For a finite group $Q$, write $d(Q)$ for the number of distinct orders of its subgroups. Let $\mathop{\mathrm{LI}}_K(Q)$ mean that the indicators of any family of cosets of pairwise distinct sizes are linearly independent over the field $K$. Let $\mathop{\mathrm{PP}}(Q)$ mean that every nonempty such family has a privately covered point. Private points give linear independence over every field by deleting a member whose coefficient is forced to vanish and repeating. Linear independence implies Herzog–Schönheim, because a distinct-size nontrivial coset partition, together with the whole group coset, would give a linear relation with coefficients $1$ on the parts and $-1$ on the whole group. These properties and the earlier lifting directions are from the cited source. [Steps Unbounded R004](https://stepsunbounded.com/results/R004/) · [Steps Unbounded R006](https://stepsunbounded.com/results/R006/)

**Theorem.** Let $N$ be a normal $q$-subgroup of a finite group $G$ for a prime $q$, and put $Q=G/N$ and $d=d(Q)$.

1. If $q\ge 2d$ and $\mathop{\mathrm{LI}}_K(Q)$ holds, then $\mathop{\mathrm{LI}}_K(G)$ holds, over any field $K$.
2. If $q\gt d$ and $\mathop{\mathrm{PP}}(Q)$ holds, then $\mathop{\mathrm{PP}}(G)$ holds.
3. If $K$ has characteristic $q$, then $\mathop{\mathrm{LI}}_K(Q)$ and $\mathop{\mathrm{LI}}_K(G)$ are equivalent without a size threshold. The ascending proof adapts the complementary-subspace trace in R006 from all-ones relations to arbitrary coefficients.

The first two conclusions require no split-extension or coprime-order assumption. They can be iterated across different kernel primes. Priority for the large-prime criteria is provisional.

## 1. Cosets in a normal-subgroup fiber

Let $\pi:G\to Q$ be the quotient map. For a left coset $D=gH$ let $\overline D=\pi(D)$. Every nonempty fiber of $D$ over $Q$ has the common size $a(D)=|H\cap N|$. Upon identifying the fiber $\pi^{-1}(x)$ with $N$ by right multiplication by the inverse of a chosen representative, its intersection with $D$ is a right coset of $N\cap gHg^{-1}$ of size $a(D)$. Indeed, two members of $D$ in the same fiber give an element of $N\cap gHg^{-1}$ when the first is multiplied by the inverse of the second, and left multiplication by that subgroup preserves $D$ and the fiber.

Thus $|D|=a(D)|\overline D|$. In a distinct-size family, fixing $a(D)$ forces the quotient cosets to have distinct sizes. There are at most $d$ of them for each value of $a(D)$. All possible fiber sizes are powers of $q$.

Two distinct cosets of the same size $q^s$ in a $q$-group intersect in at most $q^{s-1}$ points if $s\ge1$. Translating a point of intersection to the identity identifies their intersection with the intersection of two subgroups of order $q^s$. That intersection must be proper, since equal subgroups with a common coset point give the same coset.

## 2. Linear independence in arbitrary characteristic

Suppose a nontrivial relation among a distinct-size family exists. Discard zero coefficients, and let $q^s$ be the largest fiber size among the remaining members. Fix any quotient point $x$ and any largest-size coset fiber $B$ occurring over $x$. Distinguish the members whose fiber is exactly $B$ from all other members.

If $s\ge1$, at most $d-1$ other largest-size fibers can be different from $B$. Such fibers meet it in at most $q^{s-1}$ points each. For each smaller size $q^j$, there are at most $d$ fibers. Their total contribution to a union bound inside $B$ is therefore at most

```math
(d-1)q^{s-1} + d\sum_{j=0}^{s-1}q^j
 \ \lt\ q^s\left(\frac{d-1}{q}+\frac{d}{q-1}\right)
 \ \le\ q^s .
```

The final inequality is equivalent to $q^2-2dq+d-1\ge0$, true when $q\ge2d$. If $s=0$, different largest fibers are distinct singletons and there are no smaller ones. In either case a point of $B$ escapes every other fiber except those identical to $B$.

Evaluate the relation at that point. The coefficients of the members with fiber $B$ sum to zero. Summing across the classes of identical largest-size fibers at $x$, the coefficients of all largest-size members whose quotient coset contains $x$ sum to zero. This holds at every $x$. It yields a relation on $Q$ among exactly the quotient coset indicators of the largest-size members, and their sizes are distinct. The assumed independence forces all these coefficients to be zero, a contradiction.

## 3. Private points and the sharper threshold

Given any nonempty distinct-size family in $G$, take its largest fiber-size stratum, of size $q^s$. In $Q$ these members have distinct sizes. The private-point property selects a quotient point belonging to exactly one of them. In that fiber, its intersection $B$ is the only largest-size member. All remaining intersections with $B$ cover at most $d\sum_{j=0}^{s-1}q^j$ points. This is strictly less than $q^s$ since $q-1\ge d$, with the sum empty for $s=0$. A point of $B$ outside that union is private in $G$.

Consequently a finite tower can start from any quotient with private points and then add successive normal prime-power kernels, each prime greater than the current number of distinct subgroup orders. This yields Herzog–Schönheim for every member of the tower. The source R004 gives the private-point input for $A_5$, so the tower can start with a nonsolvable quotient. No claim is made that these towers exhaust the known positive cases. [Steps Unbounded R004, private points for $A_5$](https://stepsunbounded.com/results/R004/)

## 4. Same-characteristic ascension

First suppose $N$ is elementary abelian, of dimension $r$ over $\mathbb F_q$. Given a nontrivial $K$-linear relation, discard zero coefficients and pick a member whose fiber direction has minimum dimension $e$. Choose a subspace $U$ complementary to its direction in $N$.

In each quotient fiber take any affine translate of $U$ and sum the relation over it. A participating member of fiber dimension greater than $e$ has direction meeting $U$ in positive dimension. Its intersection with the translate is empty or has size divisible by $q$, and gives zero in $K$. A participating member of dimension $e$ also contributes zero if its direction meets $U$ nontrivially. If its direction is complementary to $U$, every translate intersects the member once. Its contribution is exactly its original coefficient, independently of the chosen affine translate. Fiber directions are fixed for each member by §1.

This gives a relation in $Q$ among just the minimum-dimension members whose directions are complementary to $U$. Their projected sizes are distinct, and the selected member has nonzero coefficient. This contradicts $\mathop{\mathrm{LI}}_K(Q)$.

For an arbitrary nontrivial normal $q$-subgroup $N$, its center has a nontrivial characteristic elementary abelian subgroup consisting of elements of order dividing $q$. This subgroup is normal in $G$. Induct on $|N|$, first in the quotient by that characteristic subgroup and then by applying the elementary abelian argument. The reverse implication is immediate by pulling a quotient relation back to $G$, which multiplies every coset size by $|N|$. The complementary-subspace trace is the method already used to ascend the all-ones property in R006. [Steps Unbounded R006, Lemma B](https://stepsunbounded.com/results/R006/)

The genuinely mixed-prime range $q\le 2d(Q)-1$ for general linear relations is left open by the counting proof. Establishing the required independence for arbitrary quotients also remains an obstacle to this approach to Herzog–Schönheim.
