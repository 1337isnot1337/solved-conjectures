# Collision-reducing switches need not decrease the permanent

Status: an auxiliary obstruction for an attempted proof of Minc's Conjecture 24. This is **not** a counterexample to Conjecture 24, and it does not resolve a problem on Minc's list. No priority claim is made for the auxiliary observation.

## The failed auxiliary assertion

For a nonnegative integer matrix, put

\[
 C(A)=\sum_{i,j}\binom{a_{ij}}2.
\]

One possible route to Conjecture 24 would assert that every nonbinary integer matrix of order n and common line sum k <= n admits a legal 2-by-2 switch that decreases C and does not increase its permanent. Iterating would produce a binary matrix with no larger permanent.

The assertion is false for every k >= 5. The following construction and proof are exact and require no search.

## Construction

Let k >= 3. Index the 2k rows by

\[
 L_1,\ldots,L_k;\quad R_1,\ldots,R_{k-1};\quad z,
\]

and the 2k columns by

\[
 C_1,\ldots,C_{k-1};\quad D_1,\ldots,D_k;\quad w.
\]

Define A_k by the following nonzero entries. Every listed entry is 1 except the final entry, which is 2:

* all (L_i,C_j), giving a complete k-by-(k-1) block;
* all (R_i,D_j), giving a complete (k-1)-by-k block;
* (L_i,w) for 1 <= i <= k-2;
* (L_{k-1},D_1) and (L_k,D_2);
* (z,D_j) for 3 <= j <= k;
* a_{z,w}=2.

Every row and column sum is k. The matrix has exactly one repeated entry, and C(A_k)=1. Write F=((k-1)!)^2.

### Permanent

If a perfect matching uses (z,w), its weight from that edge is 2. Exactly one of the two edges (L_{k-1},D_1), (L_k,D_2) must then be used. The two complete blocks contribute F. This case contributes 4F.

Otherwise z uses one of D_3,...,D_k, while w is matched to one of L_1,...,L_{k-2}. No left-to-right edge can then be used. There are (k-2)^2 choices, each contributing F. Consequently

\[
 \operatorname{per}A_k=F\bigl((k-2)^2+4\bigr).
\]

## All collision-reducing 2-by-2 switches

For a switch subtracting one at (i,j),(r,s) and adding one at (i,s),(r,j),

\[
 \Delta C=2-a_{ij}-a_{rs}+a_{is}+a_{rj}.
\]

Because A_k has only one repeated entry, every switch with Delta C < 0 must subtract one from (z,w) and one from an entry 1 whose two crossed entries are both zero. Thus the second removed edge must be one of the following:

| Type | Removed entry besides (z,w) | Number of switches |
|---|---|---:|
| I | (L_{k-1},C_j), (L_k,C_j), (R_i,D_1), or (R_i,D_2) | 4(k-1) |
| II | (L_{k-1},D_1) or (L_k,D_2) | 2 |

There are no others. A legal larger step along the same four positions is impossible because the second removed entry is 1.

For completeness, let G_{ij}=per A_k(i|j), and let H_{i,j}=per A_k(z,i|w,j). For an eligible second edge (i,j), the permanent change is

\[
 \Delta\operatorname{per}
 =-G_{zw}-G_{ij}+G_{zj}+G_{iw}+2H_{i,j}.
\]

This follows by expanding the permanent along the two changed rows: its restriction to the switch line is a quadratic whose t^2 coefficient is 2H_{i,j}.

For a type-I edge, say (L_{k-1},C_1), the relevant minors, by the same matching count used above, are

\[
\begin{array}{c|c}
\text{minor}&\text{value}/F\\ \hline
G_{zw}&2\\
G_{L_{k-1},C_1}&((k-2)^2+2)/(k-1)\\
G_{z,C_1}&2(k-2)/(k-1)\\
G_{L_{k-1},w}&k-2\\
H_{L_{k-1},C_1}&1/(k-1).
\end{array}
\]

Hence every type-I switch has

\[
 \Delta\operatorname{per}=F\frac{k-4}{k-1}.
\]

For a type-II edge, say (L_{k-1},D_1), those five minor values divided by F are respectively

\[
 2,\quad2,\quad k-2,\quad k-2,\quad1.
\]

Thus every type-II switch has

\[
 \Delta\operatorname{per}=2F(k-3).
\]

For k >= 5 both changes are strictly positive. This proves the claimed obstruction. At k=4 the type-I changes are zero, so that order does not obstruct the nonincreasing version of the auxiliary assertion.

## A longer alternating cycle escapes the obstruction

The preceding construction does not even imply that A_k is a local minimum among integer regular matrices. In fact one three-row, three-column cyclic switch produces a binary matrix with smaller permanent for every k >= 3.

Subtract one at

\[
 (z,w),\quad(L_1,C_1),\quad(R_1,D_3),
\]

and add one at

\[
 (z,C_1),\quad(L_1,D_3),\quad(R_1,w).
\]

All three added entries were zero. Call the resulting binary k-regular matrix B_k. Set r=k-2 and H=((k-2)!)^2. Counting according to the column assigned to row z gives:

| Column chosen by z | Contribution to per(B_k), divided by H |
|---|---:|
| w | (k-1)^2 + 2(k-2)^2 |
| C_1 | (k-3)(k-1) + 2(k-2)^2 + 3 |
| One of D_3,...,D_k, summed over all choices | ((k-2)^2+1)^2 + (k-3)(k-1) + 2(k-2)^2 |

Each entry counts the needed external edges between the two complete blocks; a deleted internal entry contributes (k-1)!-(k-2)! whenever its row and column both remain. Summing the table yields

\[
 \operatorname{per}B_k
 =H\bigl(r^4+11r^2+2r+3\bigr).
\]

Since per(A_k)=H(r+1)^2(r^2+4), subtraction gives the strict inequality

\[
 \operatorname{per}B_k-\operatorname{per}A_k
 =-H\bigl(2(k-3)^3+3\bigr)<0.
\]

Thus this family supports investigation of longer alternating cycles. It does not prove that such an escape exists for every nonbinary regular matrix.

## Exact example and checks

At k=5, A_5 has order 10 and permanent 7,488. All 18 collision-reducing four-cycle switches increase its permanent: the 16 type-I switches give 7,632, and the two type-II switches give 9,792. The displayed six-cycle switch gives a binary matrix of permanent 6,804.

These values were verified independently by subset dynamic programming in C++ and by a row-frontier transfer computation with arbitrary-precision Python integers. The files `switch_obstruction_k5.txt` and `switch_obstruction_k5_binary_escape.txt` contain the two exact matrices. `block_obstruction_family.py`, `frontier_permanent.py`, and `check_matrix_switches.cpp` reproduce the checks. The proof above does not depend on the finite computations.

The known binary minimum for order 10 and line sum 5 is 5,713, from Table 1 of Cheon–Wanless (2005). Therefore neither A_5 nor B_5 attains the global minimum. No Minc-list problem has been resolved by this observation.

## A separate row-balancing obstruction

Another tempting statement is that an arbitrary pair of rows can be made as equal as possible, keeping their combined column sums and their individual row sums, without increasing the permanent. This too is false even with integer regular matrices.

The 3-regular matrix

\[
\begin{pmatrix}
0&2&0&1&0&0\\
1&0&0&2&0&0\\
0&1&1&0&1&0\\
0&0&2&0&0&1\\
1&0&0&0&0&2\\
1&0&0&0&2&0
\end{pmatrix}
\]

has permanent 32. Balancing the first two rows entrywise produces, up to swapping those rows,

\[
 (0,1,0,2,0,0),\qquad(1,1,0,1,0,0).
\]

The resulting permanent is 34. These are the only balanced possibilities. The values were independently checked by enumerating all 6! permutations. This example does not rule out choosing a different row pair.

## Sources and scope

* [Lavi, Conjecture 24](https://yair-lavi.com/mincs-list/conjecture-24/index.html) gives the original integer-domain assertion and current partial results.
* [Cheon–Wanless (2005), author PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf) gives the binary minima used only to explain why these examples do not disprove the original conjecture.

The constructions, switch calculations, and proof-route analysis in this note were developed in this research session. They are recorded as auxiliary research, with no claim that this is a previously posed open problem or a newly established priority result.
