# Testing inverse-image compression for Okhotin Problem 9

21 November 2026. This note examines one symbolic route to the full constant-nonterminal question. It gives an exact obstruction to obtaining the desired bound from the usual decoder product alone. It does not prove an intrinsic nonterminal lower bound, answer the prize question, or claim novelty.

## 1. The complete obligation

Fix a hardest Boolean language $`L_*\subseteq\Gamma^*`$ from [Okhotin's theorem](https://doi.org/10.1016/j.ic.2018.11.001), with the usual empty-word convention. Apply the representation theorem to languages omitting the empty word: these have the form $`h^{-1}(L_*)`$ for a suitable homomorphism $`h`$. Therefore the following bound would answer Problem 9 positively:

```math
\exists k\ \forall\Sigma\ \forall h:\Sigma^*\longrightarrow\Gamma^*,
\qquad
\mathop{\mathrm{nt}}(h^{-1}(L_*))\le k.
```

Here $`\mathop{\mathrm{nt}}`$ means the minimum nonterminal count among equivalent Boolean grammars over the specified input alphabet. A language containing $`\varepsilon`$ is recovered from its nonempty part using a fresh start symbol with alternatives for the old start and $`\varepsilon`$, at a cost of one nonterminal. Conversely, a positive answer to Problem 9 implies the displayed bound, by closure under inverse homomorphisms. Thus this is an equivalent reformulation of the existence of a constant bound, using the cited theorems, rather than a proved simplification of the open quantifier.

The empty-word qualification is essential: a single fixed language cannot have both an inverse image containing $`\varepsilon`$ and an inverse image omitting it, because every homomorphism fixes $`\varepsilon`$. Abstracts that suppress this convention must not be read literally at the empty word. The same convention is written explicitly in the introduction and Theorem 2 of the [subsequent context-operator paper](https://doi.org/10.1016/j.tcs.2023.113829).

The fixed grammar for $`L_*`$ is allowed to have a fixed finite size. A bound depending on $`h`$, or on its longest letter image, does not meet the obligation.

## 2. What the known closure construction actually supplies

[Lehtinen's dissertation](https://www.utupub.fi/server/api/core/bitstreams/0d998135-ef70-41a7-b708-f29301509d08/content), Proposition 4.1.1 and §§4.2–4.3, reproduces the inverse-GSM closure proof from [Lehtinen–Okhotin](https://doi.org/10.1142/S0129054110007568).

The inverse weak-coding step adds two nonterminals to a grammar already in its required binary form. The injective-GSM step uses nonterminals indexed by useful transducer states:

```math
Q\times N\times Q,
\qquad
Q\times N\times N\times Q,
```

plus a new start symbol. Its displayed count is consequently $`|Q|^2(|N|+|N|^2)+1`$. That is an effective closure theorem, with an explicitly state-dependent construction. The theorem supplies no state-independent count.

For an inverse homomorphism, the intermediate alphabet is the disjoint union of the input letters and output letters. A word records each input letter followed by its image. The final transducer checks this regular record language and erases the output letters.

The remaining calculations below are direct checks of that architecture. They do not depend on the details of the hardest language.

## 3. The record-language decoder necessarily grows

Let $`\Sigma`$ and $`\Gamma`$ be disjoint and let $`h:\Sigma^*\to\Gamma^*`$. Define

```math
R_h=\{a h(a):a\in\Sigma\}^*.
```

**Lemma.** If an input letter $`a`$ has $`|h(a)|=d`$, every DFA recognizing $`R_h`$ has at least $`d+1`$ useful states.

**Proof.** Write $`w=a h(a)`$, so $`|w|=d+1`$. For each $`0\le i\le d`$, let $`u_i`$ be its prefix of length $`i`$ and $`v_i`$ the corresponding suffix. Every $`u_i`$ extends to the accepted word $`u_i v_i=w`$ and therefore reaches a useful state.

The prefixes reach pairwise distinct states. To see this, fix $`i\ne j`$. If $`i=0`$ and $`j>0`$, the word $`u_j v_i=u_j w`$ has two occurrences of the marker $`a`$, with only $`j-1\lt d`$ output letters between them. It cannot be a sequence of complete records. If $`i>0`$ and $`j=0`$, the nonempty word $`v_i`$ starts in $`\Gamma`$ and has no input-letter marker, so is not in $`R_h`$. Finally, if both $`i,j>0`$, the word $`u_jv_i`$ has exactly one input-letter marker, namely its initial $`a`$. It could be in $`R_h`$ only if it were exactly $`a h(a)`$. Its length is $`d+1+j-i\ne d+1`$, so it is rejected. The suffix $`v_i`$ therefore distinguishes $`u_i`$ from every $`u_j`$ with $`j\ne i`$. This proves the lemma. $`\square`$

This is a lower bound for the auxiliary decoder's state count, not for the Boolean grammar of the final inverse-image language. A different grammar may be much smaller.

## 4. The hard-language encoding cannot have uniformly bounded images

Fix a finite output alphabet $`\Gamma`$ and a fixed input alphabet, even the unary alphabet $`\{a\}`$. For any $`D`$, only finitely many homomorphisms satisfy $`|h(a)|\le D`$: there are

```math
1+|\Gamma|+|\Gamma|^2+\cdots+|\Gamma|^D
```

choices. A fixed target language therefore has only finitely many inverse images under those homomorphisms.

But there are infinitely many unary regular languages, for example the pairwise distinct singleton languages $`\{a^m\}`$, $`m\ge1`$. They are Boolean languages and omit the empty word. Any fixed hardest language representing all of them must consequently use morphisms with unbounded image length.

Combining this fact with the preceding decoder lemma shows that the direct record-decoder/product construction cannot acquire a universal nonterminal bound merely by choosing a universal bound on decoder size. It necessarily encounters unbounded decoder state sets. This does not rule out a compression of the products afterward.

## 5. Why a small grammar for the record language is insufficient

The known two-nonterminal theorem for linear conjunctive grammars implies that the regular language $`R_h`$ itself has a small conjunctive grammar. It is tempting to intersect with that grammar, erase the record contents, and conclude that only a constant number of nonterminals was added. The erasure does not preserve the internal conjunctions of a grammar.

Here is an exact counterexample to that proposed interchange. Use alphabet $`\{a,0\}`$ and define $`g(a)=a`$, $`g(0)=\varepsilon`$. Let

```math
R=\{a0\}^*,\qquad U=\{a\},\qquad V=\{a0\}.
```

The map $`g`$ is injective on $`R`$, since $`g((a0)^m)=a^m`$. Nevertheless,

```math
g(U\cap V\cap R)=\varnothing,
\qquad
g(U)\cap g(V)\cap g(R)=\{a\}.
```

This is already a grammar-level failure. Consider the conjunctive grammar

```text
S -> U & V & R
U -> a
V -> a0
R -> a0 R | epsilon.
```

Its start language is empty and hence is contained in $`R`$. Replacing each terminal by its $`g`$-image makes both $`U`$ and $`V`$ generate $`a`$, and makes $`R`$ generate $`a^*`$. The transformed grammar incorrectly accepts $`a`$.

The point is exact: injectivity on the allowed **complete records** does not give injectivity on the different partial substrings used by different conjuncts. Here $`a`$ and $`a0`$ are such incompatible partial substrings. State or residual information restores their distinction in the standard construction.

## 6. A sufficient condition for erasure, and its missing premise

For completeness, the set-theoretic condition is simple. If $`g`$ is injective on a set $`D`$ and $`U,V\subseteq D`$, then

```math
g(U\cap V)=g(U)\cap g(V),
\qquad
g(D\setminus U)=g(D)\setminus g(U).
```

Both identities follow by uniqueness of a preimage in $`D`$. Thus one possible repair would require every relevant intermediate language and every negative test to be confined to a common domain on which the erasure is injective, with complements interpreted relative to that domain.

No such normalization with a universal nonterminal bound has been constructed here. A parsing split can occur inside a letter image, so confining only the start language to the complete-record domain is insufficient. Adding distinct residual domains reproduces the unbounded boundary information that the proposed compression was intended to remove.

## 7. Exact stopping point

The route now requires a genuinely new theorem: a uniform compression of the boundary-indexed grammar, or a different grammar normal form that aligns all relevant internal operations without an unbounded number of boundary types. The existing hardest-language theorem and inverse-image closure do not supply it.

The calculations above do not prove that such a compression is impossible. In particular, a lower bound on DFA decoder states cannot be promoted to a lower bound on Boolean nonterminals: the already-known two-nonterminal representation of regular languages directly warns against that inference.

No full proof, counterexample, Lean target, prize submission, or bounty completion has been obtained. The prior results are attributed. No search for a larger finite endpoint is warranted by this route.
