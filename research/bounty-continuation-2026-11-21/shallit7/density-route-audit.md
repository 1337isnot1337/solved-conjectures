# Density route: source boundaries and a commutative special class

Research checkpoint, 21 November 2026. **No positive-density theorem for arbitrary context-free languages is proved here.** This note closes the tested density route for [Shallit problem 7](target-and-prior-audit.md); it does not resolve the prize problem.

## 1. The proposed full bridge

For a binary language $`L`$, write

```math
\delta_n(L)=\frac{|L\cap\{a,b\}^n|}{2^n}.
```

The primitive-word language $`Q`$ has $`\delta_n(Q)\to1`$. A theorem asserting that every context-free language of positive counting density contains a proper power would therefore settle the full target. The weaker version restricted to density one would suffice as well.

Three notions must be kept separate: positive upper counting density $`\limsup_n\delta_n(L)>0`$, a positive limit or Cesàro limit of these densities, and factor-density, meaning that every finite word occurs as a factor of some word of $`L`$. Factor-density alone does not give positive counting density.

## 2. Primary literature and two failed shortcuts

Ryoma Sin'ya, *Asymptotic Approximation by Regular Languages*, arXiv:2008.01413v2 (17 November 2020), proves the regular-language power theorem in Theorem 38. Theorem 36 and the conclusion show that a deterministic context-free language of density one need not contain a positive-density regular sublanguage. Problems 41–43 explicitly leave stronger context-free density/separation questions open. These results cannot be replaced by the claimed general CFL theorem.

Primary manuscript: <https://arxiv.org/pdf/2008.01413>.

Toshihiro Koga, *Dense Languages and Non Primitive Words*, Acta Cybernetica 25 (2022), 717–731, §1, explicitly rejects the regular-under-approximation shortcut using

```math
C=\{w:|w|_a\le2|w|_b\}.
```

This is a density-one DCFL with no positive-density regular sublanguage. It contains many powers and is not a primitive-language counterexample. Main Theorem 2.3 applies to the regular closure of factor-thin languages, not all CFLs. Section 6.2 gives a factor-dense primitive DCFL, obtained by appending one closing symbol to a Dyck word. Its counting density is zero. Thus neither example refutes the exact positive-counting-density assertion, but both prohibit the corresponding shortcuts.

Primary paper: <https://acta.bibl.u-szeged.hu/75631/1/cybernetica_025_numb_003_717-731.pdf>.

The source search did not locate a primitive CFL of positive upper counting density, or a proof of the full positive-density assertion. This is a bounded search finding, not a proof that the assertion is open in every formulation.

## 3. A direct argument for permutation-invariant languages

The following restricted claim follows from Parikh semilinearity and elementary linear algebra. It is recorded to isolate the missing ordering step, with no novelty or prize claim.

**Proposition.** If a binary context-free language $`L\subseteq Q`$ is invariant under arbitrary permutations of letters, then

```math
\delta_n(L)=O(n^{-1/2}).
```

**Proof.** Let $`S\subseteq\mathbb N^2`$ be its set of Parikh vectors. Every nonzero vector $`(x,y)\in S`$ has $`\gcd(x,y)=1`$. Otherwise, for a common divisor $`d\ge2`$, permutation invariance would put

```math
\left(a^{x/d}b^{y/d}\right)^d
```

in $`L`$, contradicting $`L\subseteq Q`$. The zero vector is excluded because the empty word is not primitive.

By Parikh's theorem, $`S`$ is a finite union of linear sets

```math
S=\bigcup_{j=1}^{J}\left(b_j+\sum_{v\in P_j}\mathbb Nv\right).
```

No period set $`P_j`$ has rank two. If two of its vectors $`u,v`$ were linearly independent, choose a prime $`p`$ not dividing the nonzero integer $`\det(u,v)`$. The congruence

```math
b_j+r u+s v\equiv(0,0)\pmod p
```

has a solution $`r,s\in\{0,\ldots,p-1\}`$. Increasing $`r`$ by a positive multiple of $`p`$ if necessary makes the resulting vector nonzero while keeping both coefficients nonnegative. It is a member of $`S`$ whose coordinates are both divisible by $`p`$, a contradiction.

Every linear component therefore has rank at most one. Since its period vectors have nonnegative coordinates, such a component contains at most one vector of any prescribed total length $`n`$: on its nonzero period ray the sum of coordinates is strictly increasing. A component with no nonzero periods is a singleton. Hence there are at most $`J`$ Parikh vectors in $`S`$ at length $`n`$.

For each count pair of length $`n`$, the number of binary words is at most the largest binomial coefficient. The standard central-binomial bound gives

```math
|L\cap\{a,b\}^n|
\le J\binom{n}{\lfloor n/2\rfloor}
=O\left(\frac{2^n}{\sqrt n}\right).
```

Dividing by $`2^n`$ proves the assertion. $`\square`$

Primary source for the semilinearity theorem: Rohit J. Parikh, *On Context-Free Languages*, Journal of the ACM 13(4) (1966), 570–581, <https://doi.org/10.1145/321356.321364>.

## 4. Why this does not extend to the required target

The primitivity condition concerns the order of letters, not only their counts. For example, $`a^+b^+`$ is a context-free language containing only primitive words, but its Parikh set has full rank and contains arbitrarily large common divisors. The periodic rearrangement used in §3 is not a word of that language.

Positive density might impose additional constraints on the possible ordering restrictions of a CFL, but no argument establishing the required constraint is supplied here. The counterexample $`C`$ in §2 prevents replacing that step with a positive-density regular under-approximation. The known strong interchange property of $`Q`$ prevents a bare appeal to that property from filling the gap.

Thus the tested route ends at an unrestricted density-and-order theorem that has not been proved. It does not establish either a positive-density primitive CFL counterexample or the full non-context-freeness conjecture.
