# Liang’s slice-period conjecture

[Conjecture 4.3 of Kai Liang, *Quaternary games with infinite misère quotients*, arXiv:2611.29198v1](https://arxiv.org/pdf/2611.29198v1#page=9) is false. It fixes both periods in Definition 4.2 to the single-heap period and requires that value for every three-heap slice among its other claims. For 0.3102 the required value is 5. The included prefix slice (0,2) instead has least bulk diagonal period 4, with least eventual period 5 for the one-variable edge rule. In particular no change of preperiod can repair the conjecture.

## Exact statement

Let $`o`$ denote the misère outcome, $`P`$ for a losing position and $`N`$ for a winning one. For 0.3102, define $`m=\min(x,y)`$ and $`g=|x-y|`$. When $`m\ge12`$,
\[
o(0,2,x,y)=P\quad\Longleftrightarrow\quad
\big(g=2\text{ and }m\equiv0,1\pmod4\big)
\ \text{or}\ \big(g\ge3\text{ and }g\equiv2\pmod5\big).
\]
In particular, for every integer $`k\ge3`$,
\[
o(0,2,4k+1,4k+3)=P,\qquad o(0,2,4k+6,4k+8)=N.
\]
Both variable heaps in the second position are obtained by adding 5 to the first. They can exceed any proposed thresholds in Definition 4.2. Applying the asserted diagonal reduction to the second position would give the opposite conclusion.

## Exact recurrence and normal form

Omit the zero heap in the fixed prefix. Within the sorted triples $`(a,m,m+g)`$ with $`0\le a\le2`$, $`m\ge a`$ and $`g\ge0`$, all options stay in this domain after sorting. Indeed, the minimum cannot increase. Legal moves on a heap $`h`$ are:
- Replace it by zero if $`h\in\{1,2\}`$.
- Replace it by $`h-1`$ if $`h>1`$, or by $`h-4`$ if $`h>4`$.

The empty position is $`N`$, because no move wins in misère play. Every other position in this domain has at least one move, and is $`P`$ exactly when all its options are $`N`$. Each move strictly decreases the sum of the heap sizes.

Normalize $`m`$ modulo 4 from 12 onwards, and normalize $`g`$ modulo 5 from 3 onwards. Specifically, for the map $`r_{A,p}`$ set $`r_{A,p}(h)=h`$ for $`h<A`$ and $`r_{A,p}(h)=A+(h-A\bmod p)`$ for $`h\ge A`$. The candidate outcome for $`(a,m,m+g)`$ is the true outcome at
\[
\big(a,\ r_{12,4}(m),\ r_{12,4}(m)+r_{3,5}(g)\big).
\]
Both reduced coordinates stay in the domain. The true outcome on the right uses at most 22 counters in each individual heap and is given by the same recurrence, without modular reductions.

## Why the finite check proves the unbounded formula

It suffices to verify the candidate recurrence on the representatives $`0\le a\le2`$, $`a\le m\le19`$, $`0\le g\le11`$. To see this:
1. If $`m\ge16`$, replace it with the representative in $`16,\ldots,19`$ of the same residue modulo 4, shifting both variable heaps by the same amount. Each nonzero change in either variable heap is subtraction by 1 or 4, with no removal. The two heaps stay strictly above $`a`$ even after a move, and the new smaller variable heap is at least 12. Sorting the variable heaps commutes with the common shift. Moves of the fixed heap are unchanged. Thus normalized parent and corresponding child triples are unchanged.
2. If $`g\ge7`$, replace it with the representative in $`7,\ldots,11`$ of the same residue modulo 5, shifting only the largest heap. The largest heap always has the same available subtractions and remains largest after any move. The new gap is at least 3, whether a move decreases the largest heap by at most 4 or can only decrease the second-smallest heap. All normalized parents and corresponding children again agree.

Apply the two steps successively, so simultaneous large coordinates cause no extra case. The no-move state is unchanged. Therefore the finite check of the normalized recurrence on the 684 representatives proves the recurrence on the full domain. By induction on total counters, the candidate is the true outcome.

For reproducibility the [exact checker](check.py) uses only integer arithmetic: for each representative $`v`$ it computes the raw outcome of its normalized state and compares it with the misère recurrence applied to the normalized children of $`v`$. It generates every corner value from the move rules. No assumption of periodicity enters the raw recurrence.

Here is the entire normalized table, also permitting the finite calculation to be reproduced directly. Each hexadecimal entry is an eight-bit mask, with bit $`g`$ representing $`P`$ for the normalized gap $`g`$. The entries in each row are ordered by $`m=a,a+1,\ldots,15`$.

| Fixed heap | Hexadecimal masks |
| --- | --- |
| 0 | 4a 48 09 29 29 29 29 29 29 29 29 29 29 29 29 29 |
| 1 | a5 00 52 52 94 94 10 52 52 52 52 52 52 52 52 |
| 2 | 52 84 84 00 42 42 84 84 00 00 84 84 80 80 |

In the last row the bulk masks at $`m=12,13,14,15`$ are 84, 84, 80, 80. Thus for $`g\ge3`$ exactly normalized gap 7 gives $`P`$, and for smaller $`g`$ only gap 2 can give $`P`$. For gap 2 the repeated word is $`PPNN`$, whose cyclic shifts by 1, 2 and 3 are different. This proves the formula and the least bulk diagonal period 4.

At fixed smaller variable heap $`m=2`$, the large-gap word has least period 5: the mask 52 has two $`P`$ entries among the five cyclic gap classes, so the word is nonconstant and its length is prime. These two periods fit Liang’s Definition 4.2 with, for example, parameters $`(p_1,t_1,p_2,t_2)=(18,5,12,4)`$: above a largest heap of 22, an edge reduction when $`m<16`$ keeps the gap at least 3, and a diagonal reduction when $`m\ge16`$ keeps the smaller heap at least 12.

The counterexample is to the stated fixed-period conjecture. The weaker question in Liang’s Open Problem 6.5, about algebraic periodicity without an explicit universal choice of periods, is not refuted by this slice. Nor is the known infinite-quotient theorem for 0.3102 at issue.
