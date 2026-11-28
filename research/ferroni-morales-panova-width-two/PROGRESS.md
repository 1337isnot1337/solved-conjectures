# Ferroni–Morales–Panova conjecture

**Status, 20 November 2026: OPEN.** The full named conjecture is not proved or disproved. This note supplies an exact all-width-two reduction, a reproducible transfer algorithm, and a rigorous obstruction to strengthening the conjecture to real-rootedness. It is research, not an accepted result. Issue: https://github.com/1337isnot1337/solved-conjectures/issues/105. No Lean work.

## Statement and attribution

For a finite poset P, its order polynomial Ω(P;t) counts order-preserving maps from P to {1,...,t} at positive integers t. **Ferroni–Morales–Panova Conjecture 7.1** (published 20 August 2026) asserts that **for every poset of width two**, of order d,

```math
d!\,\Omega(P;t)\in\mathbb Z_{\geq0}[t].
```

The published Theorem 3.4 *already* proves that coefficient positivity for any family closed under upper/lower ideals reduces to nonnegativity of its linear coefficient c₁(P)=[t]Ω(P;t). That reduction belongs to the original authors and is not claimed new here. The full width-two conjecture is the only target in this note.

## Precise grid-of-ideals model

Choose a decomposition into two increasing chains A=(a₁<...<aₘ) and B=(b₁<...<bₙ), with m+n=d. Each ideal consists of prefixes of the two chains:

```math
I_{ij}=\{a_1,\ldots,a_i\}\cup\{b_1,\ldots,b_j\}.
```

Put r_A(0)=r_B(0)=0 and, for positive indices, let r_A(j) be the number of A-elements below b_j and r_B(i) the number of B-elements below a_i. Each cross-chain predecessor set is a prefix, so a pair (i,j) corresponds to an ideal **if and only if**

```math
i\geq r_A(j),\qquad j\geq r_B(i). \tag{1}
```

Containment of valid ideals is coordinatewise: I_{pq}⊆I_{ij} iff p≤i and q≤j. These assertions are exact for every width-at-most-two poset, not just the randomly tested ones.

To generate valid instances, intersect two linear orders that are shuffles of the two chains. Conversely every width-two poset admits such a representation: take one topological sort greedily prioritizing the next available A-element, and another prioritizing B. For any incomparable a_i,b_j, the A-prioritizing sort orders a_i before b_j, and the B-prioritizing one reverses them. For example, if b_j were selected first in the A-prioritizing sort, an unselected predecessor of a_i would eventually require an unselected b_k with k≥j, contradicting incomparability; the other case is symmetric. Comparable pairs retain their order in both sorts.

Define f₀(0,0)=1, with f₀=0 elsewhere. At each valid (i,j), set

```math
f_{s+1}(i,j)=
\sum_{\substack{0\leq p\leq i,\ 0\leq q\leq j\\(p,q)\text{ valid}}}
f_s(p,q), \tag{2}
```

and set f_{s+1}=0 at invalid states. Then

```math
\boxed{\Omega(P;s)=f_s(m,n)\quad\text{for all }s\geq0.}
```

**Proof.** A weakly increasing map P→{1,...,s} corresponds bijectively to the chain ∅=I₀⊆I₁⊆...⊆I_s=P, where I_k consists of elements with image at most k. Recurrence (2) counts the chains by final ideal. The inner sums can be evaluated as two-dimensional prefix sums, in O(mn) exact integer arithmetic operations per s. Hence Ω(P;0),...,Ω(P;d) require O(dmn) such operations; exact finite differences then recover all coefficients. This is an algorithm, **not** a proof of positivity.

Index the valid ideals by inclusion and let Z be their upper-unitriangular zeta matrix: Z_{I,J}=1 if I⊆J, else 0. Write N=Z-1, which is nilpotent. The same chain bijection and finite binomial expansion give

```math
\Omega(P;t)=(Z^t)_{\varnothing,P}
=\sum_{k=1}^d\binom tk (N^k)_{\varnothing,P},
```

and, using [t]binom(t,k)=(-1)^{k-1}/k,

```math
\boxed{c_1(P)=(\log Z)_{\varnothing,P}
=\sum_{k=1}^d\frac{(-1)^{k-1}}k(N^k)_{\varnothing,P}.}\tag{3}
```

Thus, together with the original Theorem 3.4, the **entire conjecture is equivalent** to nonnegativity of this endpoint matrix-logarithm entry for every valid two-chain ideal grid (1). No sign is established by (3); it is an alternating sum. This is the precise unsolved bottleneck.

## A rigorous obstruction to a stronger real-rootedness route

Consider the six-element poset with chains a₁<a₂<a₃, b₁<b₂<b₃ and **only** the extra cross-chain relations a₂<b₃ and b₁<a₃, together with transitive consequences. Its width is exactly two: the two chains cover it, and a₂,b₂ are incomparable. The ideal-region boundary vectors are r_A=(0,0,0,2), r_B=(0,0,0,1).

**Proposition.** Its order polynomial is

```math
\boxed{\Omega(P;t)=
\frac{t(t+1)(t+2)(5t^3+14t^2+13t+8)}{240}.}\tag{4}
```

**Proof.** Fix a=f(a₂), b=f(b₁) in {1,...,t}, and set M=max(a,b). There are a choices for f(a₁), t-M+1 choices for f(a₃), and, after setting e=f(b₃)≥M, there are e-b+1 choices for f(b₂). Therefore

```math
\Omega(P;t)=\sum_{a=1}^t\sum_{b=1}^t
a(t-\max(a,b)+1)\sum_{e=\max(a,b)}^t(e-b+1). \tag{5}
```

Splitting this sum into a≥b and a<b yields the exact one-dimensional identity

```math
\Omega(P;t)=
\frac{t+1}{2}\sum_{a=1}^t a^2(t-a+1)^2
+\frac14\sum_{b=1}^t b(b-1)(t-b+1)^2(t-b+2). \tag{6}
```

Expansion via power sums gives (4). Independently, (5) gives Ω(P;t) at t=0,...,6 equal to

```math
(0,1,13,77,302,917,2338).
```

The expression in (4) agrees at all seven points and has degree six, as does the order polynomial, so polynomial identity alone also establishes (4). The cubic factor has the **exact discriminant -10784**, hence one real root and one nonreal conjugate pair. Therefore **width-two order polynomials are not universally real-rooted**. On the other hand every nonconstant coefficient of (4) is positive. This is explicitly **not** a counterexample to Conjecture 7.1. QED.

Do not confuse this with classical counterexamples to real-rootedness of *P-Eulerian* (W-)polynomials: the latter are different polynomials.

## Reproducible diagnostics and continuation point

Run:

    python3 research/ferroni-morales-panova-width-two/verify.py

This checks (4) using the general ideal DP, the independent double sum, and literal enumeration of maps; it checks the discriminant with integer arithmetic. Run with "--sweep" for a reproducible but **nonexhaustive** screen of **229,700 random ordered pairs of chain-interleaving linear extensions**, with m≥n≥1, m≤17, m+n≤28. The pairs may yield duplicate/isomorphic posets. All their scaled coefficients were nonnegative. This is only computational evidence and is **not** used as an unrestricted theorem.

**Next mathematical task:** obtain an all-boundary proof, or an exact negative witness, for (log Z)_{∅,P}≥0 for every two-chain ideal-grid region. Look for a sign-reversing involution on (3), or a direct positive path/rook interpretation of the endpoint entry. An argument relying on universal real-rootedness of Ω is impossible by (4). A proposed closed form must be checked at this six-vertex example and reconcile with the original author-proved subclasses. No priority claim or independent external review is made here. Literature limitations: [LITERATURE.md](LITERATURE.md).
