# A decidable promise class: every integer quotient is a base power

Status, 2026-11-21: complete paper proof of a research lemma, independently reviewed by two other campaign agents. Novelty has not been established. This does not solve Shallit 14 and does not constitute a bounty claim.

This lemma rules out one proposed undecidability strategy: constructing a regular relation whose integer quotients are all powers of a fixed prime base.

## Statement

Fix an integer base $`k\ge2`$. Let $`L`$ be a regular language of synchronous paired base-$`k`$ representations, with positive numerator and denominator. Suppose that every represented denominator is coprime to $`k`$, and promise that every positive integer in the quotient set of $`L`$ is a power $`k^n`$, $`n\ge0`$.

Then it is decidable whether the quotient set contains an integer.

If $`k`$ is prime, the same conclusion holds without the coprime-denominator assumption: an effective regular normalization reduces the problem to that case.

The promise is an assumption on the input class. The proof does not give an algorithm for deciding whether an arbitrary input satisfies the promise.

## Representation normalization

First delete common leading zero pairs. This is an effective regular-language operation: take the left quotient by the language of common zero pairs, then require that the first remaining pair is not the common zero pair. Positive numerators and denominators are regular restrictions.

For prime $`k`$, additionally delete all common trailing zero pairs and restrict the denominator's last digit to be nonzero. This operation preserves the existence of an integer quotient under the promise. Indeed, every relevant witness has

```math
A=Bk^n.
```

If $`B`$ has $`s`$ trailing base-$`k`$ zeros, $`A`$ has at least $`s`$ such zeros. Removing those $`s`$ common zero pairs divides both values by $`k^s`$ and leaves the quotient unchanged. The normalized denominator is not divisible by $`k`$, hence is coprime to $`k`$ when $`k`$ is prime.

The trailing-zero deletion is effective by right quotient and a regular last-digit restriction. The restriction may discard noninteger quotients; that is harmless. Every normalized quotient is a quotient of an original word, so the promise is preserved.

Use an automaton for the normalized language, and let $`N\ge1`$ be its number of states. A nondeterministic automaton is sufficient; the proof follows one accepting path.

## Witness bound

**Claim.** Every integer witness in the normalized language, written as $`A/B=k^n`$, satisfies at least one of

```math
n\lt N,\qquad B\lt k^N.
```

**Proof.** Suppose $`n\ge N`$. Because $`A=Bk^n`$ and common leading zero pairs have been removed, the numerator track is the canonical numeral of $`B`$ followed by $`n`$ zeros. The denominator track begins with exactly $`n`$ zeros and then contains the canonical numeral of $`B`$.

In an accepting path, two of the first $`N+1`$ states agree. Thus the accepted paired word can be factored as $`uvw`$, with

```math
|uv|\le N,\qquad |v|\ge1,
```

and $`uv^tw`$ accepted for all $`t\ge0`$. Every denominator digit in $`uv`$ is zero, since $`|uv|\le N\le n`$. Therefore pumping $`v`$ leaves the represented denominator equal to $`B`$.

Let $`A_t`$ be the numerator of $`uv^tw`$. Put

```math
K=k^{|v|},\qquad T=k^{|w|},\qquad
V=[\pi_1(v)]_k,\qquad W=[\pi_1(w)]_k.
```

Concatenation gives the exact affine recurrence

```math
A_{t+1}=K A_t+C,\qquad C=VT-(K-1)W.
```

Since the numerator is canonical, its length strictly increases for $`t\ge1`$. In particular $`A_t`$ is positive, strictly increasing, and unbounded.

The original word is $`t=1`$, so $`A_1`$ is divisible by $`B`$. Also $`K`$ is coprime to $`B`$. The affine map $`x\mapsto Kx+C`$ is consequently a permutation of residues modulo $`B`$. Starting at zero, it returns to zero after some positive number $`r`$ of iterations. Hence

```math
B\mid A_{1+rh}\qquad(h\ge0).
```

Set $`a_h=A_{1+rh}`$. Every $`a_h/B`$ is a positive integer quotient of an accepted word, so the promise gives an exponent $`e_h\ge0`$ with

```math
\frac{a_h}{B}=k^{e_h}.
```

Iterating the affine recurrence $`r`$ times gives

```math
a_{h+1}=K^r a_h+C(1+K+\cdots+K^{r-1}).
```

Therefore

```math
\frac{a_{h+1}}{a_h}
=k^{e_{h+1}-e_h}
\longrightarrow K^r=k^{r|v|}.
```

The set of integral powers of $`k`$ is discrete near the positive number $`k^{r|v|}`$. The displayed ratios must therefore equal $`K^r`$ for all sufficiently large $`h`$. Comparing with the exact recurrence gives

```math
C(1+K+\cdots+K^{r-1})=0.
```

The parenthesized factor is positive, so $`C=0`$.

Now $`VT=(K-1)W`$. Since $`T`$ is a power of $`k`$ and $`K-1`$ is coprime to $`k`$, $`T`$ is coprime to $`K-1`$. Thus $`T\mid W`$. But $`0\le W\lt T`$, hence $`W=0`$, and then $`V=0`$.

Every numerator digit in $`v`$ and $`w`$ is zero. Let $`U=[\pi_1(u)]_k`$ and $`s=|v|+|w|`$. The original numerator satisfies

```math
A=U k^s=B k^n.
```

Because $`B`$ is coprime to $`k`$, one cannot have $`s>n`$: that would make $`B=U k^{s-n}`$ divisible by $`k`$. Hence $`s\le n`$ and

```math
B=\frac{U}{k^{n-s}}\le U\lt k^{|u|}\lt k^N.
```

This proves the claim. The case $`u`$ empty would give $`U=0`$, contradicting positivity, so it does not create an exception. $`\square`$

## Decision algorithm

Normalize the automaton and compute its state count $`N`$. Perform the following finite checks:

1. For each $`0\le n\lt N`$, decide whether an accepted pair satisfies $`A=k^nB`$. Multiplication by this fixed constant is automatic, so ordinary automaton intersection and emptiness decide the check.
2. For each $`1\le B\lt k^N`$, restrict the denominator to that fixed value and the numerator to residue zero modulo $`B`$. Both restrictions are regular, so again intersection and emptiness decide the check.

Return yes if any check succeeds, and no otherwise.

A yes answer always supplies an integer quotient. Under the promise, every integer witness is covered by the witness bound, so a no answer is also correct. No unbounded search is required.

The statement is about computability. No useful complexity bound is claimed.

## Prime-power bases

The coprimality-free conclusion extends to every fixed prime-power base $`k=p^a`$. Replace each base-$`k`$ digit by its fixed block of $`a`$ base-$`p`$ digits, allowing leading zeros inside a block. This uniform substitution preserves regularity and the represented value on both tracks. Every integer quotient $`k^n`$ is then a power $`p^{an}`$, so the prime-base theorem applies.

The state count and witness bound are those of the converted, normalized base-$`p`$ automaton. No unchanged state bound for the original base-$`k`$ automaton is asserted.

## Consequence for the attempted reduction

For a fixed prime-power base, there cannot be a computable many-one reduction from an undecidable problem to the integer-quotient question that guarantees, on every output instance, that all its integer quotients are powers of that base. Such a reduction followed by the algorithm above would decide the undecidable source problem.

For any fixed base, the same obstruction applies when the constructed denominators are all coprime to the base.

This rules out the strong form of the earlier “force every integer quotient to be a base power” plan. It does not rule out a different reduction where non-power integer quotients also encode valid source witnesses, or where their existence implies the existence of a separate power witness. It also does not decide the unrestricted problem, whose inputs need not satisfy the promise.

## Review receipt

The two independent reviewers checked the normalization, the unchanged denominator during pumping, the invertibility modulo $`B`$, the discreteness argument, and the final denominator bound. The proof is not yet formalized in Lean. It is recorded as a route obstruction, not added to the repository's solved-result count.
