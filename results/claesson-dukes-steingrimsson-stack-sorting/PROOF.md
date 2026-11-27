# Proof of the Claesson–Dukes–Steingrímsson stack-sorting conjecture

For West's stack-sorting map, let $`W_{n,t}`$ denote the set of permutations of $`1,\ldots,n`$ sorted by at most $`t`$ passes. [Claesson, Dukes and Steingrímsson, Conjecture 2.4](https://arxiv.org/abs/0812.0143v2) asserts that for every $`n\ge8`$,
```math
  |W_{n,n-5}|=\frac{(n-5)!}{60}
  \left(60n^5-600n^4+506n^3+11241n^2-38369n+34236\right).
```
The equivalent exact-depth formulation follows by subtracting this count from their Corollary 2.3 for $`|W_{n,n-4}|`$. It gives
```math
  |W_{n,n-4}\setminus W_{n,n-5}|=
  \frac{(n-5)!}{10}\left(
    854\binom{n-8}{3}+5099\binom{n-8}{2}+12545(n-8)+16130
  \right).
```

The conjecture holds for every $`n\ge8`$. The proof uses a finite exhaustive enumeration whose exact coefficient identity covers all $`n\ge11`$, together with direct stack sorting at the three smaller lengths.

## A witness with a bounded budget

For a word $`W`$ on distinct letters, let $`s(W)`$ be West's stack sort and $`p(W)`$ the output before the final flush of the stack. The final flush removes the right-to-left maxima in increasing order. Put $`h(W)=\min\{i:p^i(W)=\varnothing\}`$ and $`e(W)=|W|-h(W)`$. The empty word has both statistics zero.

An inverted pair $`x>y`$, with $`x`$ before $`y`$, stays inverted after a pass exactly when a letter larger than $`x`$ lies between them. If such a letter arrives, it pops $`x`$ before $`y`$ arrives. Otherwise $`y`$ is pushed above $`x`$, so $`y`$ is emitted first. A noninverted pair stays in order because a larger incoming letter pops any smaller earlier letter still on the stack. This also proves that deleting all letters below a threshold commutes with a pass, since for two retained endpoints every possible separating letter is retained.

For each value $`b`$ of the original permutation, write $`X_b`$ for the entries larger than $`b`$ before $`b`$, in their original order, and $`t_b`$ for the number of larger entries after $`b`$. In the word restricted to values at least $`b`$, the prefix preceding $`b`$ after a pass is $`p(X_b)`$, since the minimum $`b`$ causes no pop when it arrives, and once pushed it precedes every subsequent emission. This applies at each pass regardless of the suffix after $`b`$. No original inversion with bottom $`b`$ remains after exactly $`h(X_b)`$ passes. Taking the maximum over $`b`$ gives the sorting depth. This is the filtered-prefix principle of [Zhang, Theorem 2.1](https://arxiv.org/abs/2604.10779), in its pre-flush form.

Since $`|X_b|=n-b-t_b`$, a bad permutation has at least one witness $`b`$ satisfying
```math
  b+t_b+e(X_b)\le4.
```
In particular $`b\in\{1,2,3,4\}`$ and $`t_b\le4-b`$. Fix a candidate $`b`$, and set $`d=4-b-t_b`$. If a nonempty word has $`q`$ right-to-left maxima, then
```math
  e(W)=(q-1)+e(p(W)).
```
When the maximum is last, $`q=1`$ and $`p(W)=s(W\setminus\{\max W\})`$. This again ends in its maximum unless empty. Such a state has excess zero. Every preceding round costs at least one unit, so under $`e(X_b)\le d`$ there are at most $`d`$ preceding rounds, deleting in total at most $`2d`$ letters.

## Eleven marked labels and exposed gaps

For $`n\ge11`$ mark the bottom four and the top seven labels, calling the latter high labels. Fix their relative positional order in the permutation. The twelve gaps before, between and after the marks contain the unmarked generic labels. For a witness $`b`$, the construction of $`X_b`$ retains only the prefix before $`b`$, deletes the marks of value at most $`b`$, and leaves all generic gap contents in this prefix intact. The bottom labels above $`b`$ are retained as named low letters. Initially $`X_b`$ has at least $`7-t_b`$ high labels. Before its first maximum-last state, at most $`2d`$ labels are deleted on a successful test. Since $`t_b+2d\le6`$, a high label is still present at every round up to and including that state.

For any word containing a high label, write it as alternating high labels and low packets, including a low packet at each end. A low packet can be empty. The following facts determine what to track.

1. The recursive rule $`s(LMR)=s(L)s(R)M`$ splits at high labels until each high-free packet is reached. The result replaces each entire input packet $`U`$ by $`s(U)`$, at a position determined by the high subsequence. The high-free packets can become adjacent, but no high label separates two entries from one previously contiguous low packet.
2. A high label is a right-to-left maximum exactly when it is one in the high subsequence. All low right-to-left maxima lie after the rightmost high label. To obtain $`p(W)`$ from $`s(W)`$, delete the high right-to-left maxima, and delete the low right-to-left maxima from the transformed final low packet.
3. Once a low letter is in that final packet, it stays after every surviving high label until removed. In fact write $`W=L_1r_1\cdots L_qr_q`$ at its right-to-left maxima in positional order. Then $`p(W)=s(L_1)\cdots s(L_q)`$. The rightmost high label is one of the $`r_i`$, and all letters in its following packet that are not removed lie in strictly later blocks.
4. Two low parts that have joined a packet cannot be separated by a high label in any later round. This follows from the first two facts. In particular, when a packet is first exposed after the rightmost high label, any unexamined original gaps that had previously mixed inside that packet are exposed together.

Call an original generic gap exposed by round $`r`$ if its packet lies after the rightmost high at any input state from round 0 through round $`r`$. Use the same definition for an empty gap by keeping its formal position in the packet. The set of exposed gaps can be computed from the marked positional order, $`b`$, and $`r`$ alone. In a symbolic trace, apply the recursive high splitting in item 1 and treat the high-free packets as opaque, keeping the list of original gaps in each packet. Delete the high records and keep low placeholders even when their letters would be removed. This determines the high order and the membership of all packets relative to it. Keeping a placeholder for an entry removed from the final packet cannot create a new exposure of its original gap, since that gap was already exposed. Nor can it affect the movement of any other packet, because all such placements depend only on the high labels. A trace with no high label before or at the selected round cannot represent an accepted event.

For a successful witness, every real letter that was ever in the final low packet must have been deleted by its first maximum-last state. Item 3 keeps it behind the surviving high labels otherwise. At each nonterminal round, all low letters removed are extra right-to-left records beyond one high record. Therefore the number of distinct low letters ever exposed, counting bottom singleton letters and generic letters, is at most the total excess, hence at most $`d`$.

## An exact table of counts

Use inclusion–exclusion over the nonempty subsets $`I`$ of possible witness values $`1,2,3,4`$. Within an intersection fix the first maximum-last round $`r_b\in[0,4-b]`$ separately for each $`b\in I`$. These choices of rounds are disjoint. Fix the positional order of the eleven marks as well. A trace may be restricted to round $`r_b`$ even when the excess is later found too large.

Constrain every generic gap after a selected $`b`$ in the original word and every generic gap exposed through the selected $`r_b`$ in its trace. The number of generic entries in the first set is at most $`t_b`$. The number in the second set is at most $`4-b-t_b`$, so the union has at most $`4-b`$ generic entries for this $`b`$. Taking the union for $`I`$ gives at most six generic entries. The gap immediately before $`b`$ is exposed in the initial word $`X_b`$, and the gap immediately after $`b`$ is in the first set. These are distinct formal gaps even when empty. There are at most ten unconstrained gaps.

For each such fixed choice, enumerate all nonnegative lengths in the constrained gaps with total $`j\le6`$, and all linear orders of the $`j`$ generic values assigned to their slots, relative to one another. All are greater than the four bottom labels and below the seven highs. Test the resulting word with the unconstrained gaps empty. Compute $`t_b`$, run $`p`$ through the prescribed rounds, and verify the exact first maximum-last round and the sum of the preceding excess charges. This test is independent of the contents of the unconstrained gaps. By items 1–4, a mixed low packet that later matters is exposed as a whole, so every original gap affecting its contents was constrained from the start. Unconstrained packets can neither contribute a right-to-left record nor change whether the maximum is last in any of the tested states. The count $`t_b`$ uses constrained gaps only. The same result therefore holds after filling the other gaps with any lengths and any generic labels consistent with the specified relative order. Conversely every permutation in the intersection yields exactly one choice of marked order, exact rounds, constrained lengths, and relative order.

Put $`N=n-11`$. For an accepted choice with $`j`$ constrained generic entries and $`u>0`$ unconstrained gaps, choose the $`j`$ values and assign them to the constrained slots in their prescribed relative order. Permute the remaining $`N-j`$ values and divide that linear order among the $`u`$ gaps by a weak composition. This gives
```math
  \binom Nj(N-j)!\binom{N-j+u-1}{u-1}
   =\frac{N!}{j!}\binom{N-j+u-1}{u-1}
```
completions if $`N\ge j`$, and zero otherwise. For $`u=0`$, the contribution is one if $`N=j`$ and zero otherwise. Let $`a_{j,u}`$ be the signed number of accepted relative orders, summing over the marked orders, intersections, exact rounds and constrained lengths, with the inclusion–exclusion sign $`(-1)^{|I|+1}`$. Then the resulting finite count formula is
```math
  B(n)=\sum_{j=0}^6 a_{j,0}[N=j]
       + \sum_{\substack{0\le j\le \min(6,N)\\1\le u\le10}}
       a_{j,u}\frac{N!}{j!}\binom{N-j+u-1}{u-1}.
```
For $`n\ge18`$, the first sum vanishes and $`N\ge j`$ for every summand. Dividing by $`N!`$ yields a polynomial of degree at most nine. The claimed bad count has the same form: the two leading terms cancel when the proposed sortable count is subtracted from $`n!`$. Specifically, the proposed bad count is $`(n-5)! (1594n^3-14241n^2+39809n-34236)/60`$. Thus exact comparison of the two polynomials of degree at most nine, or evaluation of both at ten distinct integers at least eighteen, suffices for all larger $`n`$. The same table separately covers $`11\le n\le17`$, including the finite-support terms. The [direct stack checker](check-base.js) verifies lengths eight through ten.

## Exhaustive count and exact verification

The [enumerator](counter.cs) implements the marked-order and inclusion-exclusion count above. It uses three pruning rules.

- The right-to-left maxima among the high labels are fixed by the marked high subsequence. Their extra removals, all exposed low labels, and the bigger marks after $`b`$ must fit within $`4-b`$.
- Any gap first exposed in the proposed absorption state must be empty. If it contained any entry larger than $`b`$, that entry would still be present after the final high label in that state.
- When all selected rounds are zero, the shadow checks and length bounds already decide each event. All $`j!`$ relative orders qualify.

The symbolic run examined all $`11!=39{,}916{,}800`$ marked orders and yielded the following nonzero entries. The [coefficient CSV](coefficients.csv) records the same data.

| Constrained generic entries $`j`$ | Free gaps $`u`$ | Signed orders $`a_{j,u}`$ |
| ---: | ---: | ---: |
| 0 | 7 | 1,653,120 |
| 0 | 8 | 2,676,240 |
| 0 | 9 | 2,973,600 |
| 0 | 10 | 2,322,432 |
| 1 | 8 | 4,808,160 |
| 1 | 9 | 5,443,200 |
| 1 | 10 | 3,144,960 |
| 2 | 9 | 9,192,960 |
| 2 | 10 | 5,443,200 |
| 3 | 10 | 8,709,120 |

For $`N\ge7`$, the sum of the table contributions divided by $`N!`$ is a polynomial of degree at most nine in $`N`$. Exact expansion gives the complement
```math
  B(n)=\frac{(n-5)!}{60}
  \left(1594n^3-14241n^2+39809n-34236\right).
```
All displayed rows have $`u-1\ge j`$, so their binomial polynomials vanish whenever $`0\le N<j`$, just as the finite sum requires. The verifier also checks the boundary $`11\le n\le17`$ directly. Direct stack sorting gives $`21{,}426`$, $`229{,}860`$, and $`2{,}561{,}292`$ sortable permutations for $`n=8,9,10`$, respectively. An independent direct run at $`n=11`$ gives $`30{,}291{,}408`$, agreeing with the first symbolic case.

Run [verify.ps1](verify.ps1) to reproduce the coefficient table and both exact checks. The [audit](AUDIT.md) records the review and distinguishes this conjecture from the neighbouring questions.
