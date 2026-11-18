# An ultimate arithmetic-periodicity test for CUT

Cinna Davis and GPT-6.2 Astra, 18 November 2026

Dailly, Duchêne, Larsson and Paris asked for a generalization of their AP-test to sequences with a preperiod. In Section 3.3 they gave two specific games, with cut sets $C=\{1,2,8\}$ and $C'=\{1,2,7,8\}$, for which their numerical pattern still required proof. We give a decision test for a proposed sequence for any **finite** cut set and use it to prove the exact sequences of both games. [Original paper, Section 3.3 and Open Problem 4](https://arxiv.org/abs/1803.02621)

**Result for the two games.** Both have the same Sprague–Grundy function $f$. For pile sizes 1 through 6 its values are $0,1,2,3,1,4$. For $n=7+12q+r$, with $0\le r<12$, the value is
$$
 f(n)=8q+B_r,\qquad
 B=(3,2,4,5,6,7,8,9,7,11,9,8).
$$
The least additive period is 12, the saltus (increase per period) is 8, and the preperiod has length 6.

## A finite test

A cut of size $d$ partitions one pile into $d+1$ positive piles of the same total size. A split has value equal to the bitwise XOR of the values of its parts. Write $A(n,g)$ when some legal split of $n$ has value $g$ under the proposed pile function $f$. The following two statements suffice, and each is necessary:
$$
\begin{aligned}
 &\text{There is no }n\ge1\text{ with }A(n,f(n)).\\
 &\text{There are no }n\ge1,\ 0\le g<f(n)\text{ with }\neg A(n,g).
\end{aligned}
$$
Together they say that $f(n)$ is the least nonnegative integer absent from the option values. All parts in a legal move are strictly smaller than the original pile, so induction from size one proves $G_C=f$.

For the general algorithm the input consists of the finite cut set, a finite prefix, a positive period $P$, the $P$ initial tail values, and a nonnegative integer increase $s$. The proposed graph $F(n,g)$ is a finite union of singletons and sets of the form
$$
 (n,g)=(a+Pq,b+sq),\qquad q\ge0.
$$
Read nonnegative integers in binary on parallel tracks, padding shorter inputs with leading zeros. Equality, order, addition, constants and bitwise XOR have finite automata. For addition one keeps a one-bit carry (or reads in reverse), and XOR acts on each column independently. Multiplication by a fixed integer uses finitely many additions. These operations therefore give automata for the displayed graph. Unions and intersections use product or nondeterministic automata. An existentially quantified integer uses a guessed track and projection. With arbitrary hidden witnesses one allows extra leading zero columns on the visible tracks before projection and removes them afterward, so witnesses can have any width. Complement follows from determinization.

For every $d\in C$, the relation for its options says that there exist $d+1$ positive pairs in $F$ whose first coordinates sum to $n$ and whose second coordinates have XOR $g$. Taking the finite union gives $A$. Thus both error conditions define regular languages. Reachability of an accepting state decides emptiness. This is a terminating test for each proposed prefix and tail, including candidates with positive preperiod. Exhaustively enumerating candidates also finds a representation whenever one exists.

## Replay of the two games

Run `python3 cut-arithmetic-periodicity/verify.py` from the repository root. The following details specify the computation independently of the implementation.

1. For the proposed graph track $u=2n-3g$ on the binary prefixes read so far, along with $n\bmod12$ and $\min(n,7)$. A digit pair $(a,b)$ updates $u$ to $2u+2a-3b$. On the graph, $u$ is invariant under $(n,g)\mapsto(n+12,g+8)$ in the tail. Let $M=3+\max_{1\le n\le18}|2n-3f(n)|$. Once $|u|>M$, its absolute value increases at every later digit, so that state can be rejected. At the end, require positive $n$ and the value of $u$ prescribed by the prefix or its tail residue.
2. The one-pile relation is this graph. From the $j$-pile and one-pile relations construct the $(j+1)$-pile relation. In a column with visible digits $(a,b)$, guess the two size bits $x,z$ and the first value bit $v$. The second value bit is $v\oplus b$. When reading most significant digits first, carry bits satisfy $x+z+c_{\rm in}=a+2c_{\rm out}$. Start with zero carry at the high end and accept only at zero carry at the low end. Keep every possible pair of constituent states and carry. The needed hidden tracks fit in the input width here: individual sizes are bounded by the total size, $f(h)\le h$, and a group's XOR is at most the sum of its values.
3. For each game, take the union for its allowed numbers of parts. Construct the smaller-value relation by guessing $w=f(n)$ and comparing its digits to those of $g$. This hidden track also fits since $f(n)\le n$. Compute both error languages above by products of complete automata. Only reachable states are included.

| Cut set | Numbers of parts | States in minimized option automaton | Reachable accepting states for a collision | Reachable accepting states for a missing smaller value |
| --- | --- | ---: | ---: | ---: |
| $\{1,2,8\}$ | $2,3,9$ | 28 | 0 | 0 |
| $\{1,2,7,8\}$ | $2,3,8,9$ | 28 | 0 | 0 |

Every finite binary input starts at the initial state and follows transitions within the reachable graph. The two zero counts therefore prove the mex conditions for all pile sizes. As a cross-check, grouping parts by repeated doubling gave the same two empty languages. Direct partition-value recursions agreed on all 77,184 comparisons for $0\le n\le66$, $0\le g<128$ and one through nine parts.

Finally, the slope $\lim f(n)/n=2/3$ forces a putative smaller additive period to be $3,6$ or $9$. Checking a single block rules out all three, since their required increments would be $2,4,6$. Those discrepancies repeat in every later block. Also $f(18)=8\ne f(6)+8=12$, so the period-12 identity cannot start at pile six.

The automata closure facts are classical. The contribution here is their application to the finite-cut test and to the two stated game sequences. A search by game rules, authors, preperiod and AP-test on 18 November 2026 located the original predictions and earlier arithmetic-periodicity tests for other take-and-break games. We found no previous proof of these two predictions. Priority remains provisional. [Published CUT paper](https://doi.org/10.1016/j.dam.2020.05.032), [Guy and Nowakowski on earlier game-specific tests](https://library.slmath.org/books/Book70/files/1005.pdf)
