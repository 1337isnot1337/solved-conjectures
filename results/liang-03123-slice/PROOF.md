# Liang’s 0.3123 slice problem

[Liang’s Open Problem 6.2](https://arxiv.org/pdf/2611.29198#page=13) asks for the correct invariant for the bulk of the misère four-heap slice $`(1,2,x,y)`$ in the quaternary game 0.3123. Let $`m=\min(x,y)`$ and let $`d=\lvert x-y\rvert`$. For every $`m\ge 13`$ the diagonal $`d=0`$ is $`\mathcal N`$. For every $`m\ge13`$ and every $`d>0`$, the outcome is $`\mathcal P`$ exactly according to the following table.

| Residue of the positive gap modulo seven | Residues of the smaller heap giving $`\mathcal P`$ |
| --- | --- |
| 0 | 1 |
| 1 | 5 |
| 2 | 0, 1 |
| 3 | 3, 4 |
| 4 | None |
| 5 | 2, 3, 6 |
| 6 | None |

The coordinates that matter are thus the smaller heap’s residue, the positive difference’s residue, and the equality flag. We also give an exact finite-table reduction for every $`x,y\ge0`$ in the slice, not just its bulk.

## Recurrence for a closed family of prefixes

In 0.3123 a move on a heap of size $`n`$ can remove it entirely if $`n\in\{1,2,4\}`$, or subtract $`1,3,4`$ leaving a positive remainder. There is no splitting. The last player to move loses, so the empty game is $`\mathcal N`$. In a nonempty game all options are $`\mathcal N`$ exactly if the position is $`\mathcal P`$.

Keep the fixed heaps as a separate unordered pair $`(a,b)`$ with $`0\le a\le b\le2`$. Their moves stay inside this family. Order only the two variable heaps, writing them as $`(m,m+d)`$. This does not restrict play: moves still apply independently at every heap, and resorting within each pair simply exchanges names. Both families allow zeros as padding.

Let $`r_B(v)`$ equal $`v`$ below $`B`$ and $`B+((v-B)\bmod7)`$ elsewhere. Define the candidate outcome at $`(a,b,m,m+d)`$ by ordinary finite minimax at the same prefix and the reduced gap coordinates
```math
 (r_{19}(m),\ r_6(d)).
```
This normalization determines every outcome, by the following transfer argument.

## Exact finite transfer

For either coordinate with threshold $`B`$, leave it alone below $`B+4`$ and otherwise choose its representative in $`[B+4,B+10]`$ modulo seven. The representatives preserve the normalized parent position and give the same list of normalized options:

- A fixed-heap move changes only the prefix. The reduction thresholds do not depend on that prefix, so these options match.
- Changing the variable minimum by a period multiple shifts both variable heaps by the same amount. If changed by the representative reduction, even the smaller representative heap exceeds four. No exceptional removal or subtraction becomes legal or illegal.
- Changing the gap shifts only the larger variable heap. A reduced gap is at least ten in both positions, so no move crosses that gap and no small-heap exception is introduced.
- A variable move decreases one size by at most four. After sorting the variable pair, the minimum and the gap each change by at most four. Therefore a coordinate changed when taking representatives stays at or above its normalization threshold after the move. Legal moves transport with the same size reductions and exactly the same normalized targets.

Thus it suffices to check all six prefixes and the box $`0\le m<30`$, $`0\le d<17`$. [The Python checker](verify.py) evaluates the defining recurrence with normalized targets on all 3,060 representatives, using direct minimax on actual reduced positions as its table. All comparisons pass. By the transport argument the candidate satisfies the recurrence on every position; uniqueness by decreasing token sum proves the exact outcome reduction. The [independent C++ checker](check_independent.cpp) separately implements the labeled direct recurrence and repeats the transfer check.

For $`m\ge13`$, the normalization only reaches the representatives $`13\le m\le25`$. For any $`d\ge0`$ it reaches $`0\le d\le12`$. The reductions preserve both residues and the zero-gap flag. Checking these 169 normalized outcomes for prefix $`(1,2)`$ gives the displayed rule. Hence the claim covers every pair with smaller heap at least 13, without any upper cutoff or assumption on the gap.

## Why ordering is essential

Fix nonnegative integers $`k,l`$. The input pairs
```math
 (14+7l,\ 25+7l+7k)
 \quad\text{and}\quad
 (35+7l+7k,\ 25+7l)
```
both have the **ordered input residues** $`(0,4)`$ modulo seven, and both their minima and absolute differences grow arbitrarily large. The first has smaller-heap residue zero and gap residue four, so it is $`\mathcal N`$. The second has smaller-heap residue four and gap residue three, so it is $`\mathcal P`$. For any fixed cutoff, taking $`k`$ large puts both gaps above it. This proves why the two input residues and a cutoff on the absolute difference cannot give the bulk rule.
