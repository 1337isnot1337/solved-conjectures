# The sharp odd-cut threshold in Ellis–Thanatipanonda Family B

Cinna Davis and GPT-6.2 Astra, 18 November 2026

In the partition game CUT, a move with cut size $d$ splits one pile into $d+1$ nonempty piles of the same total size. Write $G_C(n)$ for the Sprague–Grundy value of a pile of size $n$ when the allowed cut sizes form $C$. A position with several piles has value equal to the bitwise XOR of their values. The value of a pile is the least nonnegative integer absent from its option values.

**Theorem.** Let $C=\{1\}\cup X\cup Y$, where $X$ is a nonempty set of even integers at least $4$, and $Y$ is a nonempty set of odd integers at least $5$. Put $x=\min X$ and $y=\min Y$. Then
$$
G_C(n)=G_{\{1,x\}}(n)\text{ for every }n\ge1
\quad\Longleftrightarrow\quad y>3x.
$$
If $y<3x$, the two sequences differ at some $n\le4x$. The sets may be infinite.

Ellis and Thanatipanonda conjectured in Section 7, Conjecture 2, that $y>3x$ suffices for equality. Their Theorems 3 and 19 give the two published inputs below. [Published paper](https://doi.org/10.1016/j.dam.2022.08.027), [open text](https://arxiv.org/abs/2203.02457)

## The base game

Put $g(n)=G_{\{1,x\}}(n)$. Theorem 19 gives the same sequence for $\{1\}\cup X$. Theorem 3 gives $g(6xq+r)=8q+b(r)$ for $q\ge0$ and $1\le r\le6x$. The six blocks of $b$ each have length $x$. In the table, a parenthesized pair repeats to fill its block.

| Residue interval | Values in order |
| --- | --- |
| $1,\ldots,x$ | $(0,1)$ |
| $x+1,\ldots,2x$ | $(2,3)$ |
| $2x+1,\ldots,3x$ | $1,4$, followed by repetitions of $(5,4)$ |
| $3x+1,\ldots,4x$ | $(3,2)$ |
| $4x+1,\ldots,5x$ | $(4,5)$ |
| $5x+1,\ldots,6x$ | $(6,7)$ |

## Why a large cut preserves the value

We show that whenever $p\ge3x+2$ piles of positive sizes $h_1,\ldots,h_p$ sum to $n$, their XOR under $g$ is strictly less than $g(n)$.

Write $h_i=6xq_i+r_i$ with $1\le r_i\le6x$, and put $Q=\sum_i q_i$, $R=\sum_i r_i$. Since all $b(r_i)<8$, the XOR is exactly
$$
8(q_1\mathbin\oplus\cdots\mathbin\oplus q_p)
 +(b(r_1)\mathbin\oplus\cdots\mathbin\oplus b(r_p)).
$$
The XOR of the quotients is at most their sum $Q$. If $R>6x$, then $n=6xQ+R$ gives $g(n)\ge8(Q+1)$, whereas the displayed value is at most $8Q+7$.

It remains to consider $3x+2\le p\le R\le6x$. Now $g(n)=8Q+b(R)$. Each residue uses $r_i-1$ units in excess of its mandatory first unit, for a total of $R-p$.

| Range of $R$ | Consequence for the residues | Upper bound on their XOR of $b$-values | Lower bound on $b(R)$ |
| --- | --- | --- | --- |
| $R\le4x$ | $R-p\le x-2$, so every residue is at most $x$. | $1$ | $2$ |
| $4x<R\le5x$ | $R-p\le2x-2$, so every residue is at most $2x$ and at most one exceeds $x$. | $3$ | $4$ |
| $5x<R\le6x$ | $R-p\le3x-2$, so every residue is at most $3x$. If one exceeds $2x$, all others are at most $x$. | $5$ | $6$ |

For the last row, if all residues are at most $2x$, their values all lie between $0$ and $3$, which is closed under XOR. Otherwise the single larger residue has value $1$, $4$ or $5$. All other values are $0$ or $1$, so their XOR with it is at most $5$. This proves the strict inequality in every case.

Suppose $y>3x$ and induct on $n$. By induction every smaller pile has value $g$ in the enlarged game. The options from cuts in $\{1\}\cup X$ therefore already have least excluded value $g(n)$. Every added odd cut produces at least $3x+2$ piles and hence an option of value strictly below $g(n)$. Adding such options leaves the least excluded value equal to $g(n)$. The initial pile of size one has no moves. This proves sufficiency for all $n$.

## Why the cutoff is sharp

Suppose $d=y<3x$. Make a cut of size $d$ on a pile of size $4x$. Choose one part of size $x+1$ and the other $d$ parts in $[1,x]$ with sum $3x-1$. This is possible since $d\le3x-1\le dx$. Every sum between $d$ and $dx$ is obtained by distributing up to $x-1$ extra units per part.

The sum $3x-1$ and the count $d$ are both odd, so an even number of these $d$ parts are even. In the first block $g(h)=1$ exactly when $h$ is even. Their XOR is therefore zero. The whole move has base value $g(x+1)=2$, which equals $g(4x)$ by the last entry of the fourth block.

If the two games agree at every smaller pile, this legal move to value $2$ forces the enlarged game's least excluded value at $4x$ to differ from $2$. Otherwise a difference already occurs earlier. Finally, $y$ is odd and $3x$ is even, so the two cases exhaust Family B.

## Verification and prior work

The accompanying checker computes options directly from pile splits and the least-excluded-value rule. It compares the two sequences on both sides of the cutoff, including multi-cut sets and piles spanning multiple periods. The proof above covers arbitrary sizes.

A literature search on 18 November 2026 by author names, conjecture number, Family B and the odd-cut threshold located the original conjecture and the authors' theorem about adding even cuts. A separate formal result explicitly treats their Family A conjecture. We found no earlier resolution of Conjecture 2 in those sources. Priority remains provisional. [Ellis and Thanatipanonda](https://arxiv.org/abs/2203.02457), [Family A result and scope](https://www.trureturing.org/research/ellis-thanatipanonda-2022-cut-family-a-conjecture-1/)
