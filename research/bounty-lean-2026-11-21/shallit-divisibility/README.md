# Shallit 14: divisibility in automatic relations

Status, 2026-11-21: open research attempt; no solution, formal verification, submission, or prize claim.

Coordination: [issue 229](https://github.com/1337isnot1337/solved-conjectures/issues/229), with campaign updates in [issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223).

## Exact target and offer

Input: an integer base $`k\ge2`$ and a finite automaton accepting a language over paired base-$`k`$ digits. Each accepted word represents a pair of nonnegative integers, with synchronous leading-zero padding. Decide whether some accepted pair $`(p,q)`$ satisfies $`p\mid q`$.

Equivalently, after swapping tracks and excluding zero denominators, decide whether

```math
\mathop{\mathrm{quo}}_k(L)
=\{[\pi_1(w)]_k/[\pi_2(w)]_k:w\in L,\ [\pi_2(w)]_k>0\}
```

contains a nonnegative integer. Zero cases can be checked by regular intersection. A complete answer must give either a terminating decision algorithm for every input automaton or a valid undecidability reduction.

The primary personal offer is **£50**, on page 40 of [Shallit's 2014 BCTCS slides](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf). The [2013 Fields slides](https://cs.uwaterloo.ca/~shallit/Fields/shallit.pdf) give the representation model and question. The [live talks page](https://cs.uwaterloo.ca/~shallit/talks.html), inspected on 2026-11-21, records several other resolutions through 2026 and does not record a resolution of this question. The inspected offer has no stated expiration. This documents a public offer, not an assurance of payment. No sponsor contact was made.

Targeted searches of the sponsor's pages, the literature, and repository issues did not locate a resolution. Search absence does not prove novelty or current payment eligibility.

## Existing results that do not settle the target

[Rowland and Shallit, *Automatic Sets of Rational Numbers*](https://ericrowland.github.io/papers/Automatic_sets_of_rational_numbers.pdf) study this quotient representation. Their results include membership of a fixed rational number and a characterization of automatic rational sets whose every element is an integer. Those questions differ from whether a general quotient set contains at least one integer.

[Endrullis, Shallit, and Smith, *Undecidability and Finite Automata* (2017)](https://joerg.endrullis.de/assets/papers/automata-undecidability-2017.pdf), Theorems 5–6, prove that it is undecidable whether a quotient set contains a power of its base. An arbitrary integer quotient need not be a base power, so that theorem is not a solution of this bounty.

The full first-order theory of addition and divisibility is undecidable, but this does not establish undecidability for this single existential divisibility constraint with an automatic relation.

## The concrete 2017 reduction

The source reduces from a finite length-preserving rewriting system $`R`$ over an alphabet $`\Sigma`$, with distinguished symbols $`a,b`$. Its undecidable source question is whether $`a^n\Rightarrow_R^*b^n`$ for some $`n\ge1`$.

Add a delimiter $`d`$ and blank symbol $`c`$, both outside $`\Sigma`$. Write paired words vertically, with the first entry on the numerator track. Define

```math
E=\{(e,e):e\in\Sigma\},\qquad
T=\{(r,\ell):\ell\to r\in R\}.
```

The paired language is regular:

```math
L=(d,c)(a,c)^+(d,d)
  \bigl(E^*TE^*(d,d)\bigr)^*
  (c,b)^+(c,d).
```

A word has tracks of the form

```math
\begin{aligned}
\text{top}&=d\,a^i\,d\,v_0\,d\,v_1\,d\cdots v_m\,d\,c^{j+1},\\
\text{bottom}&=c^{i+1}\,d\,u_0\,d\,u_1\,d\cdots u_m\,d\,b^j\,d,
\end{aligned}
```

where each $`u_t\Rightarrow_R v_t`$ is one rewriting step. The starred middle part can also be empty.

The special shift relation

```math
\text{top}=x c^n,\qquad \text{bottom}=c^n x
```

forces $`i=j=n-1`$, then forces the successive configuration boundaries to line up and gives a valid rewriting history. Conversely a valid history gives such a shifted pair. Assigning $`c=0`$ and distinct nonzero base-$`k`$ digits to the other symbols makes this shift equivalent to a quotient $`k^n`$.

The two free endpoint lengths $`i,j`$ are the difficulty when only integer quotients are required. The root agent found an exact false positive for the unmodified reduction with no rewriting rules; see the [proof and infinite family](../formal-languages/shallit14-unmodified-obstruction.md) and [exact verifier](../formal-languages/verify_shallit14_false_positive.py). Thus the source construction cannot simply be relabeled as an integer-quotient reduction.

## An arithmetic guard, and its missing finite-state construction

For positive integers $`U,V,C`$, put

```math
P=k^n(C+U),\qquad Q=C+V.
```

Then

```math
\frac P Q-k^n=\frac{k^n(U-V)}{C+V}.
```

If $`C>k^n|U-V|`$, the quotient lies strictly between $`k^n-1`$ and $`k^n+1`$. Consequently

```math
Q\mid P\quad\Longleftrightarrow\quad U=V.
```

This is an exact arithmetic observation. It is **not** yet an automata reduction.

To use it for the shift problem, a proposed construction must place the same large guard on the two tracks with an unbounded relative shift $`n`$, while ensuring the guard dominates the entire remaining discrepancy. A construction that merely says “copy this prefix,” “use the same padding length,” or “make one separated block at least as long as another” has not supplied a finite automaton. Equality or comparison of two separated unbounded block lengths is not generally regular.

Uniform digit substitution and fixed padding do not provide the needed relative error, which decreases as $`k^{-n}`$. No finite automaton implementing a sufficient paired guard has been constructed.

## Why an independent regular code cannot supply the guard

The following elementary lemma rules out a broad simple approach. It is a research obstruction, not a claimed new theorem or bounty solution.

**Lemma.** Every infinite regular language of canonical positive base-$`k`$ numerals contains a strictly increasing infinite divisibility chain among its represented values.

**Proof.** Pumping gives words $`u,v,w`$, with $`v\ne\epsilon`$, such that $`uv^nw`$ belongs to the language for every $`n\ge0`$. Let

```math
B=k^{|v|},\quad T=k^{|w|},\quad
V=[v]_k,\quad W=[w]_k,\quad X_n=[uv^nw]_k.
```

Concatenation gives

```math
X_{n+1}=B X_n+C,\qquad C=VT-(B-1)W.
```

All $`X_n`$ are positive. Their canonical numeral lengths strictly increase, so $`X_{n+1}>X_n`$.

If $`C=0`$, consecutive values already divide each other. Suppose $`C\ne0`$. Multiplying the recurrence by $`B-1`$ gives

```math
(B-1)X_n=\bigl((B-1)X_0+C\bigr)B^n-C.
```

For every prime $`p\mid B`$, once $`n`$ is sufficiently large the first term on the right is divisible by $`p^{v_p(|C|)+1}`$. Since $`p\nmid B-1`$, it follows that

```math
v_p(X_n)=v_p(|C|).
```

Choose a common threshold for the finitely many primes dividing $`B`$, and fix $`n`$ above it. Write $`X_n=gr`$, where $`g`$ contains precisely the prime-power factors of $`X_n`$ supported on primes dividing $`B`$. Then $`g\mid C`$ and $`\gcd(r,B)=1`$.

Modulo $`gr`$, the affine map $`F(z)=Bz+C`$ preserves the set of multiples of $`g`$. After identifying that set with $`\mathbb Z/r\mathbb Z`$, it is the map

```math
y\longmapsto By+C/g,
```

which is a permutation. Therefore zero returns to zero after some positive number $`t\le r`$ of iterations. Since $`X_n\equiv0\pmod{X_n}`$, the recurrence gives $`X_n\mid X_{n+t}`$. The latter value is strictly larger. Repeating this argument produces the required infinite chain. $`\square`$

In the common special case where every represented value is coprime to $`k`$, the proof is shorter: $`B`$ is already invertible modulo every $`X_n`$, so the affine map is a permutation of all residue classes.

**Corollary.** If every value in the language is coprime to $`k`$, two distinct values have an integer quotient greater than one that is coprime to $`k`$, hence is not a power of $`k`$.

Thus an infinite regular language of individual numerals cannot be a multiplicative antichain; and a coprime regular code cannot ensure that all divisible pairs have base-power quotient. This does not exclude a relation that couples the two tracks in an essential way.

## Current proof obligations

The attempted undecidability route needs a regular paired construction that simultaneously:

1. permits every genuine rewriting history;
2. makes an integer quotient force the endpoint shift lengths to agree;
3. makes the resulting overlap recover a genuine history;
4. is given by an effective finite automaton, without an unbounded hidden counter.

The second and fourth conditions remain unresolved. A separate agent is considering a decision-theoretic approach. No finite search, conditional lemma, restricted algorithm, or obstruction above is counted as a solved bounty.

## Source receipt

- Shallit, BCTCS 2014, page 40: original numbered problem and £50 offer.
- Shallit, Fields 2013, seven-page slides: exact representation and decidability question.
- Shallit, live talks page: inspected 2026-11-21; other resolutions recorded, no entry resolving problem 14 found.
- Rowland–Shallit, 2014 paper: quotient model and decision results.
- Endrullis–Shallit–Smith, DLT 2017: regular rewrite-history construction and the distinction between powers and arbitrary integers.

