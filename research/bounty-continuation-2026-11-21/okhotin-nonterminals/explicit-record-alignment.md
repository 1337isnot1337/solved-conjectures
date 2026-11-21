# Record alignment in the explicit directional parsing core

21 November 2026. This is a symbolic test of the inverse-image compression route for Okhotin Problem 9. It establishes a failure of two direct transformations, not a nonterminal lower bound or a prize solution. The full-target count remains zero.

## Source and scope

The exact 2019 Boolean-hardest grammar was not retrieved in full. The publisher's abstract confirms the theorem, but the publisher PDF, the 2016 Springer predecessor, and the DBLP-linked open-copy endpoint did not yield the text. A public-network download attempt also failed at the connector. No proof about that precise Boolean grammar is asserted below.

The explicit source used here is Mrykhin and Okhotin, [The hardest language for grammars with context operators, arXiv:2012.03596v2](https://arxiv.org/pdf/2012.03596v2), §4, printed pages 14–16. It gives a fixed grammar extending the conjunctive construction and identifies its directional parsing nonterminals as analogues of those in the earlier construction. The test uses only the displayed context-free/conjunctive fragment; the context-dependent productions and the symbol $`e`$ are omitted. This does not replace Boolean grammars by context grammars.

The paper's Lemma 5 has an **even-odd context normal-form** premise. The ordinary odd-normal-form example below does not satisfy that premise. Accordingly, the necessary fragment invariant is proved directly here, rather than obtained by an invalid invocation of Lemma 5.

Earlier notes remain unchanged: [target audit](target-and-prior-audit.md) and [inverse-image test](inverse-image-compression-test.md).

## 1. The fixed fragment

Write $`E,F,E^+`$ for the right-directed symbols, and $`\bar E,\bar F,\bar E^+`$ for their left-directed counterparts. The relevant displayed productions, with the unused context branch omitted, are:

```math
\begin{aligned}
A&\to Aa\mid a,\\
C&\to aC\mid bC\mid cC\mid dC\mid\varepsilon,\\
D&\to C\#D\mid\varepsilon,\\
E&\to FE\mathbin{\&}AcE^+\mid dC\#,\\
E^+&\to FE\mathbin{\&}AcE^+\mid dC\#D,\\
F&\to aFb\mid acC\#\bar E b,\\
\bar E&\to\bar E\bar F\mathbin{\&}\bar E^+cA\mid Cd,\\
\bar E^+&\to\bar E\bar F\mathbin{\&}\bar E^+cA\mid DCd,\\
\bar F&\to b\bar F a\mid bECca.
\end{aligned}
```

These rules are ordinary conjunctive rules. They define languages by the usual least positive solution. In particular, every $`F`$ word starts in $`a`$ and ends in $`b`$; every $`\bar F`$ word starts in $`b`$ and ends in $`a`$; every $`E`$ word starts in $`a`$ or $`d`$ and ends in $`\#`$; and every $`\bar E`$ word ends in $`a`$ or $`d`$. None of these four languages contains the empty word. These properties follow directly by induction on a derivation.

The nonlinear production $`E\to FE\mathbin{\&}AcE^+`$ is the operation being tested. Its $`FE`$ split couples a reference check to the recursive parse of the right part.

## 2. A symbolic family of records

Fix any $`m\ge1`$. Over the source alphabet $`\{x\}`$, consider the odd-normal-form grammar

```math
T_0\to x,\qquad
T_i\to T_{i-1}xT_{i-1}\quad(1\le i\le m),
```

with start alternatives

```math
S\to T_{i-1}xT_{i-1}\quad(1\le i\le m).
```

Let $`\alpha_0=x`$ and $`\alpha_i=T_{i-1}xT_{i-1}`$ for $`i\ge1`$. Their singleton word lengths are

```math
\ell_i=2^{i+1}-1,
\qquad
\ell_0=1,\quad \ell_i=2\ell_{i-1}+1.
```

Use reference indices $`j_i=i+1`$. The following record is the ordinary, context-free specialization of the source's displayed encoding pattern:

```math
H_m=
d\left(\prod_{i=1}^{m}a^{j_i}cd\right)d\,b^{j_0}d
\left(\prod_{i=1}^{m}
ca^{j_{i-1}}b^{j_i}a^{j_{i-1}}cd\right)\#.
```

Each product is taken in increasing index order. For this note, that formula is the definition of the record, so its properties do not depend on an uninspected encoding theorem. Put $`H=H_m`$ and $`h_m(x)=H`$.

The initial blocks $`a^{j_i}cd`$ encode start alternatives. The base expansion is $`b^{j_0}d`$. The expansion indexed $`i\ge1`$ is

```math
ca^{j_{i-1}}\,b^{j_i}\,a^{j_{i-1}}cd.
```

Every record begins in $`d`$ and ends in its only $`\#`$. For every $`1\le i\le m`$, choose the suffix $`t_i`$ beginning at $`a^{j_i}`$ in its initial start block, and write

```math
H=p_it_i,\qquad t_i=a^{j_i}cd\,y_i\#.
```

The words $`p_i`$ and $`y_i`$ contain no $`\#`$.

## 3. Direct residual invariant

For any occurrence of a suffix $`a^{j_i}cd\,y\#`$ of $`H`$, one has

```math
a^{j_i}cd\,y\#H^n\in L(E)
\quad\Longleftrightarrow\quad n=\ell_i.
\tag{1}
```

The analogous left invariant is as follows. If $`z d c a^{j_i}`$ is the prefix of $`H`$ ending at the left reference in expansion $`i+1`$, then

```math
H^n z d c a^{j_i}\in L(\bar E)
\quad\Longleftrightarrow\quad n=\ell_i.
\tag{2}
```

Equation (2) is needed only for $`0\le i\lt m`$.

**Proof.** Prove both statements by induction on $`i`$. The $`AcE^+`$ condition in (1) consumes the displayed full $`a^{j_i}c`$. The remainder starts in $`d`$, so $`E^+\to dC\#D`$ accepts it. The first conjunct must therefore parse the word as $`FE`$.

The rule for $`F`$ matches the entire initial run $`a^{j_i}`$ with $`j_i`$ final $`b`$ symbols. Its $`C\#`$ portion crosses exactly the end of the anchor record. Thus the matching $`b`$ run lies in a later record. It cannot be only the end of a longer run: the preceding $`\bar E`$ factor would then end in $`b`$. It cannot stop before a run ends: the following $`E`$ factor would start in $`b`$. Both are excluded by the endpoint properties above. Hence the selected run is exactly $`b^{j_i}`$ and selects exactly expansion $`i`$.

For $`i=0`$, the part before that expansion ends in $`d`$. The only applicable $`\bar E`$ alternative is $`Cd`$, which allows no complete record before the selected record. After the expansion, the right part begins in $`d`$. The only applicable $`E`$ alternative is $`dC\#`$, which allows no complete record after it. Thus $`n=1=\ell_0`$.

For $`i>0`$, split the $`n`$ subsequent records into $`u`$ records before the selected record, the selected record itself, and $`v`$ records after it. The left portion terminates in $`ca^{j_{i-1}}`$ and the right portion begins in $`a^{j_{i-1}}cd`$. By the two induction hypotheses, $`u=v=\ell_{i-1}`$. Therefore

```math
n=u+1+v=2\ell_{i-1}+1=\ell_i.
```

Conversely, these same two derivations, together with the matching rule for $`F`$, produce a derivation whenever this equality holds.

For (2), the guard $`\bar E^+cA`$ consumes the whole final reference $`ca^{j_i}`$, and its prefix is accepted by $`\bar E^+\to DCd`$. The first conjunct then uses $`\bar E\bar F`$. The rule for $`\bar F`$ matches $`j_i`$ initial $`b`$ symbols against the final $`a^{j_i}`$. Endpoint restrictions again force a complete $`b^{j_i}`$ run. It must lie in one of the preceding full records: selecting a run in the final partial record would leave no $`\#`$ in the required $`E`$ factor. At $`i=0`$ the two base alternatives force no intervening full records on either side. At $`i>0`$ the two induction hypotheses force $`\ell_{i-1}`$ records on each side. This is the same recurrence and supplies both directions of (2). $`\square`$

Thus the family of languages

```math
K_i=\{x^n:t_i h_m(x^n)\in L(E)\}
=\{x^{\ell_i}\},\qquad 1\le i\le m,
\tag{3}
```

is pairwise distinct. A single fixed nonterminal $`E`$ therefore has arbitrarily many semantically distinct residual modes at positions inside one record. These are actual parsing residuals in the displayed grammar, not just states of an auxiliary DFA.

## 4. Complete-conjunct restriction still leaves an internal cut

The whole-record domain is $`R=H^*`$. Define an erasing homomorphism $`g`$ by $`g(\#)=x`$ and $`g(a)=g(b)=g(c)=g(d)=\varepsilon`$. It is injective on $`R`$.

Consequently, if whole conjunct languages are first restricted to $`R`$, their intersection is preserved by $`g`$. There is no remaining intersection counterexample under that hypothesis.

Nevertheless, equation (1), followed by the non-base production for $`E`$, gives

```math
H^{\ell_i+1}\in
\bigl(p_iL(F)L(E)\bigr)\cap R.
\tag{4}
```

Every word of $`p_iL(F)`$ ends in $`b`$. Every nonempty word of $`R`$ ends in $`\#`$, and $`p_iL(F)`$ does not contain the empty word. Therefore

```math
\bigl(p_iL(F)\cap R\bigr)
\bigl(L(E)\cap R\bigr)=\varnothing.
\tag{5}
```

Equations (4)–(5) are a grammar-specific failure of factorwise record alignment. In the valid derivation, the split after $`F`$ occurs immediately after the selected $`b^{j_i}`$ inside an expansion. It is not a record boundary. Guarding each **whole** conjunct by $`R`$ retains (4), but guarding each concatenated **factor** loses it.

The same failure occurs inside the actual conjunction: both whole expressions $`p_iFE`$ and $`p_iAcE^+`$ accept the word in (4), and both may be restricted to $`R`$ before erasure. The missing operation is still a faithful compilation of their internal concatenations.

## 5. What this excludes, and what it does not

The calculation excludes the following two direct shortcuts:

- requiring each original factor in the displayed parsing production to generate complete records;
- identifying all offset calls of $`E`$ with a single complete-record predicate while retaining their individual meanings. Equation (3) shows that these meanings differ.

It does **not** exclude finite inlining, a different encoding of the residual modes, a global rewrite of the grammar, or a fixed number of nonterminals with more complicated productions. In fact the source language in this example is finite and has the one-nonterminal description

```math
S\to x^{\ell_1}\mid\cdots\mid x^{\ell_m}.
```

This explicitly prevents interpreting the residual count as an intrinsic lower bound for Boolean nonterminal complexity.

The direct construction retains a table of which internal offset means which source conjunct. Compiling its unary reference checks into finite constants can remove the local character-by-character scans, but a later recursive call still needs the selected residual meaning. Merely erasing the offset or merging all its calls loses that information. No theorem compressing those recursive residual meanings to a uniform number of nonterminals is proved here.

The precise 2019 Boolean-hardest grammar also remains a source-access gap. The above is an explicit test of the retrieved directional core, with a direct proof and limited scope. It is not a completed inspection of every production in the unavailable 2019 version.

No full proof, counterexample to Problem 9, Lean formalization target, prize submission, or bounty completion has been obtained.
