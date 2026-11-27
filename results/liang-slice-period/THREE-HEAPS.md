# The three-heap structure behind Liang’s slice-period conjecture

**All three-heap outcomes are determined in all four games**, with no restriction on any heap size. This classifies exactly which three-heap slices satisfy the prescribed period in Conjecture 4.3. It is a supplement to the full refutation already supplied by 0.3102, not a separate solved conjecture. The four-heap cases of the weaker unrestricted slice-periodicity question are not addressed here.

For a sorted triple $`(a,b,c)`$ write its gaps as $`(a,d,g)=(a,b-a,c-b)`$. Independently replace each gap $`v`$ by $`v`$ below its threshold $`T`$, and by $`T+((v-T)\bmod p)`$ otherwise. The outcome is unchanged, with thresholds and periods as follows.

| Game | Thresholds for $`(a,d,g)`$ | Periods for $`(a,d,g)`$ | Closure cases |
| --- | --- | --- | ---: |
| 0.3102 | 3, 12, 3 | 5, 20, 5 | 5,184 |
| 0.3122 | 16, 10, 6 | 7, 7, 7 | 9,639 |
| 0.3123 | 20, 18, 12 | 7, 7, 7 | 20,677 |
| 0.3312 | 19, 15, 8 | 6, 3, 3 | 9,570 |

Padding with zeros includes the two-heap slices. The last row was established separately in the [0.3312 quotient proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/plambeck-siegel-03312/PROOF.md), and is included here to make the three-heap classification of all four games explicit.

## Unbounded transfer

A move changes one heap by at most four. For each coordinate leave its gap alone below $`T+4`$, and otherwise replace it by the same residue modulo $`p`$ in $`[T+4,T+p+3]`$. Changing a gap coordinate by a multiple of $`p`$ moves a suffix of one, two or three heaps by the same amount. If a proper suffix is changed, its separating gap is at least $`T+4`$ both before and after taking representatives, so no move of size at most four can cross that separation. Within each of the two blocks, sorting commutes with the common shift. Every shifted heap is above four, and all shift-invariant legal subtractions remain legal. When the first coordinate is changed, all heaps are shifted, the smallest is above four, and the same reasoning applies without a separation.

After a move and sorting, each gap changes by at most four: each sorted coordinate is nonincreasing and changes by at most four, and an adjacent gap is a difference of two such coordinates. Thus the changed gap stays at or above its normalization threshold in all matched children. All other gaps move in exactly the same way in a match. Consequently taking the three buffered representatives in succession preserves the normalized parent and each normalized child.

The exact Python checker generates the raw corner table by ordinary misère minimax, then exhausts the four displayed finite boxes with normalized children. The terminal position is unchanged. It follows by induction on the total counters, which always decreases in the original recursion, that the threshold-period formulas hold on the entire unbounded domain. A separate C++ implementation computes 3,442,951 labeled triple outcomes per game and compares 585,276 sorted triples per game to their normalized values. Those checks are independent diagnostics, not the reason the transfer is valid for unbounded heaps.

## Every three-heap slice, with exact bulk periods

Fix a heap of size $`a`$. Once the two variable heaps are both larger than $`a`$ and the smaller is at least $`a+T_d`$, shifting both by a period of the middle gap preserves the outcome. The least eventual diagonal period is the least cyclic period of the finite $`d`$-profiles simultaneously over all normalized $`g`$. This equivalence is exact: every residue occurs at arbitrarily large $`d`$ for each fixed gap, so a failure in one row cannot be repaired by raising a preperiod.

| Game | Least eventual diagonal period of the fixed-$`a`$ slice |
| --- | --- |
| 0.3102 | 4 if $`a\equiv2\pmod5`$; 5 if $`a\ge3`$ and $`a\equiv0\pmod5`$; 1 otherwise |
| 0.3122 | 1 if $`a\equiv2\pmod7`$; 7 otherwise |
| 0.3123 | 7 for every $`a`$ |
| 0.3312 | 1 if $`a=3`$; 3 otherwise |

For verification it suffices to check $`0\le a<T_a+p_a`$, one full $`d`$-period beyond $`T_d`$, and the entire normalized gap range, comparing each trial shift through that period. The checker's output groups the canonical fixed heaps by their least period. The axis period may always be the original single-heap period: take the larger variable heap beyond both the fixed heap and the bounded smaller variable heap by at least $`T_g+p_g`$ before subtracting $`p_g`$. This works whether the bounded variable heap is smaller or larger than the fixed heap.

It follows that the only three-heap exceptions to the period requirement of [Conjecture 4.3](https://arxiv.org/pdf/2611.29198v1#page=9) are exactly the infinitely many fixed heaps $`a\equiv2\pmod5`$ of 0.3102. They remain algebraically periodic once the edge and bulk periods are allowed to differ. In particular the period-four obstruction is not specific to fixing the heap at two.
