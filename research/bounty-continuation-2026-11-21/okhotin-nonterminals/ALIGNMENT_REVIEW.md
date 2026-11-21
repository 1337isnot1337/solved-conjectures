# Independent review of the explicit record-alignment calculation

Reviewed 21 November 2026. Source note:
[explicit-record-alignment.md](explicit-record-alignment.md).

## Verdict and source scope

The simultaneous residual induction and the factorwise-alignment failure
are correct for the displayed positive conjunctive fragment. They do not
give a nonterminal lower bound, a constant-size compression theorem, or a
resolution of Okhotin Problem 9.

I independently opened Mrykhin and Okhotin's primary manuscript at
[arXiv:2012.03596](https://arxiv.org/pdf/2012.03596). The versionless PDF
currently returns version 2, submitted 19 November 2021. Its printed pages
14–16 give the stated directional productions. After removing the stated
context branch and the letter $`e`$, the productions agree with the note.
In particular the recursive production for $`E^+`$ really uses $`FE`$,
and the barred one really uses $`\bar E\bar F`$.

The manuscript's Lemma 5 assumes an even-odd context normal form. The
reviewed proof does not invoke that lemma. It defines its own record and
proves its language properties directly. This review makes no assertion
about the exact unretrieved 2019 Boolean-hardest grammar.

## Forced splits in the right residual

Unfolding the two rules for each matching nonterminal gives exactly


```math
L(F)=\bigcup_{j\ge1}a^jc\,L(C)\#\,L(\bar E)b^j,
\qquad
L(\bar F)=\bigcup_{j\ge1}b^jL(E)L(C)ca^j.
```


All $`E`$-words start in $`a`$ or $`d`$ and end in $`\#`$.
All $`\bar E`$-words end in $`a`$ or $`d`$. These languages contain
no empty word. The initial $`a^{j_i}c`$ in a right residual forces the
same index $`j_i`$ in the unfolded $`F`$-rule. Because $`C`$ contains
no hash, its hash is the end of the anchor record.

The selected $`b^{j_i}`$ must be a complete maximal run. If it began
inside a longer run, the preceding $`\bar E`$-factor would end in
$`b`$. If it ended before the run ended, the following $`E`$-factor
would start in $`b`$. Each full record contains exactly one run of each
length $`j_i`$, so this selects precisely expansion $`i`$ in precisely
one subsequent record.

For $`i=0`$, the left factor ends in $`d`$ and the right factor begins
in $`d`$. Their only applicable productions are $`Cd`$ and $`dC\#`$,
respectively. They allow no complete intervening record, giving $`n=1`$.
For $`i>0`$, those factors are exactly the left and right residuals of
index $`i-1`$. If $`u`$ and $`v`$ count the full records on their
respective sides, the induction hypotheses force


```math
u=v=\ell_{i-1},\qquad n=u+1+v=\ell_i.
```


The other conjunct does not impose an unproved condition: removing the
forced initial reference leaves a word beginning in $`d`$, accepted by
the base $`dC\#D`$ production. Conversely, the two lower-index
derivations and that base guard construct the required derivation.

## Forced splits in the left residual

The final $`ca^{j_i}`$ similarly fixes the index in $`\bar F`$.
The adjacent $`\bar E`$ and $`E`$ factors again prevent a partial
$`b`$-run match. The selected run cannot be in the last partial record:
the required $`E`$-factor contains a hash after the run, while that
partial record contains none.

Thus the selected run is in one of the $`n`$ preceding full records.
The hash ending the $`E`$-factor is the final full-record hash because
the succeeding $`C`$-factor cannot cross a hash. The remaining suffix
of the word is exactly the prescribed final partial record. The same
base-case endpoint argument, and then the two lower-index induction
hypotheses, force $`u=v=\ell_{i-1}`$. The guard is accepted by
$`DCd`$ after its final reference is removed. This proves both
directions of the left invariant and completes the simultaneous induction.

The index ranges are consistent: the right invariant at $`i=m`$ needs
only the left invariant at $`m-1`$, where the required left reference
exists. The base right residual is available as a suffix even though it
need not be one of the chosen start-alternative suffixes.

## Alignment conclusion and its limit

The identity $`H=p_it_i`$, together with the residual invariant, gives
a genuine full-record word in $`p_iL(F)L(E)`$. Every word in
$`p_iL(F)`$ ends in $`b`$, whereas every nonempty word of $`H^*`$
ends in a hash. The first factor cannot be empty. Consequently requiring
each factor separately to lie in $`H^*`$ destroys every such derivation,
even though restricting the complete conjunct does not.

The distinct residuals $`K_i=\{x^{\ell_i}\}`$ are correctly identified.
They are not intrinsically necessary nonterminals: this family is finite
and has the one-nonterminal finite-list grammar displayed in the note.
Thus neither a global rewrite nor finite inlining has been ruled out.

The author implemented the minor exposition clarification to include
the fact that $`E`$ starts in $`a`$ or $`d`$ in the preliminary endpoint
list. That fact follows immediately from the displayed rules and is used
in the correct partial-run exclusion. It is not an additional hypothesis.

No computation or finite-case extrapolation was used for this review.
