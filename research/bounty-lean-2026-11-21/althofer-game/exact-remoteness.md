# Exact remoteness in Althöfer’s 3n±1 game

Treat 1 as a terminal loss for the player to move. Write $`o(x)`$ for the odd part of a positive integer. At $`n>1`$ the two options are $`o(3n-1)`$ and $`o(3n+1)`$. At a determined state let $`R(n)`$ count moves under quickest winning play against longest resistance. The [finite strategy tree argument](ray-analysis.md) shows that this is finite whenever a player can force a win. Set $`R(n)=\infty`$ at draws.

**Theorem.** For each of the three rows below, $`n`$ and $`H`$ have the same outcome, including a possible draw. At determined states $`R(n)=R(H)+2`$. Here $`s`$ is $`1`$ or $`-1`$, $`n>1`$ is positive, and the displayed congruences imply $`n\equiv s\pmod4`$.

| Starting congruence | $`H`$ | Other grandchild $`E`$ | Other grandchild $`F`$ |
| --- | --- | --- | --- |
| $`n\equiv s\pmod{32}`$ | $`(9n-s)/8`$ | $`2H-s`$ | $`(H+s)/2`$ |
| $`n\equiv9s\pmod{32}`$ | $`(9n-s)/16`$ | $`4H-s`$ | $`2H+s`$ |
| $`n\equiv77s\pmod{128}`$ | $`(9n-5s)/16`$ | $`4H+s`$ | $`(H+s)/4`$ |

In particular one quarter of all odd positive integers, by natural density within the odds, admit a direct reduction to a **strictly smaller state with the same winner or draw status**. This is an all-starts reduction on explicit congruence classes. It does not determine the outcome of a state until that of its representative is known.

## A game identity at every horizon

Order the three horizon values as loss $`<`$ unknown $`<`$ win. Write $`\neg`$ for order reversal, fixing unknown. At horizon zero a nonterminal is unknown and a terminal is a loss. At positive horizon a nonterminal with children of values $`u,v`$ at the preceding horizon has value $`\neg(u\wedge v)`$. Once a finite outcome is found it persists at all larger horizons. Its least such horizon equals $`R`$.

Suppose $`A`$ has children $`B,C`$, with children $`\{E,H\}`$ and $`\{H,F\}`$ respectively. Suppose the two children of $`H`$ are $`G,K`$, with $`G`$ a child of $`E`$ and $`K`$ a child of $`F`$ (interchanging $`G,K`$ is harmless). Assume $`A,B,C,E,F,H`$ are nonterminal. Then at every horizon $`t\ge0`$,
```math
 V_{t+2}(A)=V_t(H).
```
Indeed, expanding the first two moves gives $`V_t(H)\wedge(V_t(E)\vee V_t(F))`$. For $`t\ge1`$ the second factor is at least $`\neg V_{t-1}(G)\vee\neg V_{t-1}(K)=V_t(H)`$, since $`E,F`$ offer the respective replies. At $`t=0`$ all three values are unknown. The first two positive horizons cannot determine $`A`$, since all grandchildren are nonterminal. This proves the remoteness and draw assertions without assuming the conjecture of global determinacy.

## Checking the arithmetic

In all three rows $`B=(3n-s)/2`$ is odd. In the first two, $`C=(3n+s)/4`$ is odd. The raw numbers $`3B+s`$ and $`3C-s`$ are respectively $`(9n-s)/2`$ and $`(9n-s)/4`$ and have odd part $`H`$. The other two grandchildren are $`o((9n-5s)/2)`$ and $`o((9n+7s)/4)`$, giving the indicated $`E,F`$ after substituting $`n`$.

In the third row $`C=(3n+s)/8`$ is odd. The quantities $`3B-s`$ and $`3C-s`$ have odd part $`H`$. The remaining grandchildren are $`o((9n-s)/2)`$ and $`o((9n+11s)/8)`$. Substitution gives the table, with $`H\equiv3s\pmod8`$.

In row one, $`o(3E+s)=o(3H-s)`$ and $`o(3F-s)=o(3H+s)`$. In row two, $`o(3E-s)=o(3H-s)`$ and $`o(3F-s)=o(3H+s)`$. In row three, $`o(3E+s)=o(3H+s)`$ and $`o(3F-s)=o(3H-s)`$. All states required to be nonterminal exceed one, already at the smallest positive permitted starts other than one. These identities verify the game lemma.

The first row gives $`R(32h+s)=R(36h+s)+2`$ whenever finite, for $`h\ge1`$. Use it backwards on the two residues $`\pm1\bmod36`$ for a strictly smaller representative. Rows two and three give smaller representatives directly. Among odd integers these last two disjoint binary conditions have combined density $`1/8+1/32=5/32`$. On any fixed odd residue modulo 128, the backwards condition requires exactly one residue modulo 9, since the sign is fixed modulo 4. It therefore adds $`(1-5/32)/9=3/32`$ to the density. The union gives $`1/4`$. In particular the least possible drawn start avoids all three sets of reducing residues.

## An arbitrarily long binary phase

Write $`n=s+2^a c`$ with $`a\ge2`$, $`c`$ positive odd. For any $`0\le k\le\lfloor(a-2)/3\rfloor`$ put $`m=s+2^{a-3k}9^k c`$. Consecutive applications of row one show that $`n`$ and $`m`$ have identical outcome, and $`R(n)=R(m)+2k`$ whenever finite. Thus one can move the whole long run to exponent 2, 3, or 4 using a single representative and an exact adjustment of the horizon.

The [sponsor’s Prize 3](https://althofer.de/collatz-prizes.html) offers €500 for a proof for every start. The sponsor explicitly reports a gap in an earlier claimed proof. The [2026 diary](https://althofer.de/math-with-ai-diary.html) records finite game searches. The reduction here leaves unresolved whether a draw exists outside its reducing classes. No priority, submission or award is claimed.

The [arithmetic and horizon checker](check_remoteness.py) exhausts the 81 local three-valued assignments and the reducing residues modulo 1152. It checks 2,249 instances of the arithmetic table and 17,992 comparisons against the original finite-horizon recurrence below 16,000. Run `python3 -B check_remoteness.py` in this directory.
