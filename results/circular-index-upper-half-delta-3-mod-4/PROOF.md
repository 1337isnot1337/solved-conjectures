# Graphs with $`\chi'_c = \Delta + 2/3`$ for every $`\Delta \equiv 3 \pmod 4`$, $`\Delta \ge 27`$

Status (2026-11-22): text proof of Theorem A ($`\Delta \equiv 3 \pmod 4`$, $`\Delta \ge 63`$) and computer certificates for $`\Delta = 27, 31, \dots, 59`$ (Proposition B), after one independent model referee pass (verdict: correct, no mathematical errors; its minor points m1–m9 are applied; report in `review/REVIEW.md`); not formalised. Machine checks (this folder, Python standard library only): `verify.py` (about 2 s for the default range) and an independent all-pairs re-check `indep_check.py` (about 4 s); data in `certificates.json`. The author's search scripts (`fullsat.py`, `base.py`, `construct.py`, `scan5.py`, `scan5b.py`, `sym2.py`, `wenum.py`; the SAT ones need python-sat) and scratch log are not included in this folder; they are not needed for the proof. Proved / computer-certified / open are separated in Section 8.

## 1. Statement

Mazák and Zrubák (*Circular chromatic index of small graphs*, arXiv:2603.08822v1, Section 8) write that for no $`\Delta \ge 8`$ was a graph with maximum degree $`\Delta`$ and $`\chi'_c \in (\Delta + 1/2, \Delta + 1)`$ known. The earlier notes of this project settle $`\Delta \equiv 0 \pmod 4`$ (all $`\Delta \ge 8`$; `../circular-index-upper-half-circulants/`), $`\Delta \equiv 2 \pmod 4`$ (all $`\Delta \ge 10`$) and $`\Delta \equiv 1 \pmod 4`$, $`\Delta \ge 21`$ (`../circular-index-upper-half-delta-2-mod-4/`). This note treats $`\Delta \equiv 3 \pmod 4`$.

**Theorem A (proved by hand).** For every $`g \ge 15`$ the simple graph $`H_g`$ of Section 5 (for any choice of the integers $`\alpha, \beta`$ there) has $`n = 6g+1`$ vertices, maximum degree $`\Delta = 4g+3`$ (three vertices of degree $`\Delta - 1`$, all others of degree $`\Delta`$), and
```math
\chi'_c(H_g) = \frac{2n+9}{3} = 4g + \frac{11}{3} = \Delta + \frac23 .
```

**Proposition B (computer-certified).** For $`6 \le g \le 14`$ the same construction, with base matchings and insertion blocks found by SAT and stored in `certificates.json`, gives simple graphs on $`6g+1`$ vertices with $`\Delta = 4g+3`$ and $`\chi'_c = \Delta + 2/3`$; i.e. $`\Delta \in \{27, 31, 35, 39, 43, 47, 51, 55, 59\}`$.

**Corollary C.** For every $`\Delta \equiv 3 \pmod 4`$ with $`\Delta \ge 27`$ there is a simple graph with maximum degree $`\Delta`$ and $`\chi'_c = \Delta + 2/3 \in (\Delta + 1/2, \Delta + 1)`$; for $`\Delta \ge 63`$ by a hand proof.

**What is new.** The construction is the insertion scheme of `../circular-index-upper-half-circulants/PROOF.md` §7.3 ("Family B") as written out in `../circular-index-upper-half-delta-2-mod-4/PROOF.md`: a perfect $`(2n,3)`$-colouring of a $`4g`$-regular circulant on $`n = 6g+1`$ vertices, into which blocks of three new colour classes are inserted; each block raises the maximum degree by one and keeps the colouring perfect. There only two blocks were possible: both consist of edges of length 1, and the base used all lengths $`2, \dots, 2g-3`$. Here: (i) a one-parameter family of admissible base vertex sets (Remark after Lemma 3; parameter $`k`$; Family B is $`k = 2`$, the circulant theorem is $`k = 1`$) in which every colour class lives on a cyclic interval of $`k`$ vertices and one of $`2g-k`$ vertices; (ii) for $`k = 6`$, a **third** block of edges of lengths 3 and 5; (iii) an explicit solution, for all $`g \ge 15`$, of the resulting base problem, whose lengths must avoid $`1, 3, 5`$.

## 2. Definitions and two lemmas

A $`(p,q)`$-edge-colouring is a map $`c : E(G) \to \mathbb Z_p`$ such that edges sharing a vertex get colours at circular distance $`\ge q`$; $`\chi'_c(G)`$ is the minimum of $`p/q`$ over such colourings (equivalent to the circular $`r`$-edge-colouring definition of Mazák–Zrubák). $`E_c = c^{-1}(c)`$.

**Lemma 1 (lower bound).** If $`|V(G)| = 2m+1`$ and $`G`$ has an edge, then $`\chi'_c(G) \ge |E(G)|/m`$. (Proof: `../circular-index-upper-half-delta-2-mod-4/PROOF.md`, Lemma 1.)

**Lemma 2 (windows).** (a) A $`(p,q)`$-colouring gives $`\chi'_c \le p/q`$. (b) $`c`$ is a $`(p,q)`$-colouring iff for every $`c_0`$ the union of $`E_{c_0}, \dots, E_{c_0+q-1}`$ is a matching. (Proof: ibid., Lemma 2.)

**Notation.** $`n = 6g+1`$, vertices $`\mathbb Z_n`$, written by representatives in $`[0, n-1]`$; $`[a,b]`$ is an integer interval, read cyclically mod $`n`$ when it wraps. The *length* of $`\{x,y\}`$ is $`\min(d, n-d)`$, $`d = (y-x) \bmod n`$; for $`0 \le x \lt y \le n-1`$ with $`\delta = y-x`$ it is $`\delta`$ if $`\delta \le 3g`$ and $`6g+1-\delta`$ otherwise. $`M + i`$ is the translate of an edge set.

## 3. The base colouring ($`k = 6`$)

```math
B = [2g+7,\ 4g], \qquad W_0 = [0,5] \cup B, \qquad W_1 = [1,6] \cup B \qquad (|B| = 2g-6,\ |W_0| = |W_1| = 2g).
```
**Base problem.** Find perfect matchings $`M_0`$ of $`W_0`$ and $`M_1`$ of $`W_1`$ whose $`2g`$ edges have pairwise distinct lengths, none in $`\{1,3,5\}`$.

Given a solution, let $`S`$ be its set of $`2g`$ lengths and $`G^0 = C_n(S)`$: simple, $`4g`$-regular, $`2gn`$ edges. For $`a = 2i + \varepsilon \in \mathbb Z_{2n}`$ let $`K_a = M_\varepsilon + i`$; the $`2n`$ matchings $`K_a`$ partition $`E(G^0)`$ (for $`s \in S`$ the $`n`$ translates of the unique base edge of length $`s`$ are pairwise distinct, $`n`$ odd, and are all edges of length $`s`$). Colour $`K_a`$ with $`3a \in \mathbb Z_{2n}`$. Since $`3(4g+1) = 2n+1`$, colour $`c`$ carries $`E_c = K_{(4g+1)c}`$, and $`6(4g+1) \equiv 2 \pmod{2n}`$ gives
```math
E_{c+6} = E_c + 1 \qquad (c \in \mathbb Z_{2n}). \tag{T}
```
The classes of colours $`0, \dots, 7`$ are $`M_0,\ M_1+2g,\ M_0+(4g+1),\ M_1,\ M_0+(2g+1),\ M_1+(4g+1),\ M_0+1,\ M_1+(2g+1)`$, with vertex sets (mod $`n`$; $`8g+1 \equiv 2g`$, $`6g+1 \equiv 0`$)
```math
\begin{aligned}
V(E_0) &= [0,5] \cup [2g+7, 4g], & V(E_1) &= [2g+1, 2g+6] \cup [4g+7, 6g],\\
V(E_2) &= [4g+1, 4g+6] \cup [7, 2g], & V(E_3) &= [1,6] \cup [2g+7, 4g],\\
V(E_4) &= \{0\} \cup [2g+1, 2g+6] \cup [4g+8, 6g], & V(E_5) &= [4g+2, 4g+7] \cup [7, 2g],\\
V(E_6) &= [1,6] \cup [2g+8, 4g+1], & V(E_7) &= \{0\} \cup [2g+2, 2g+7] \cup [4g+8, 6g].
\end{aligned}
```
**Lemma 3 (perfect base colouring).** For every $`c`$, $`E_c, E_{c+1}, E_{c+2}`$ are pairwise vertex-disjoint and miss exactly one vertex $`x_c`$, where $`(x_0,\dots,x_5) = (6,\ 0,\ 4g+7,\ 4g+1,\ 2g+7,\ 2g+1)`$ and $`x_{c+6} = x_c + 1`$.

*Proof.* By (T) (and $`c = c_0 + 6j`$ with $`c_0 \in \{0..5\}`$) it suffices to take $`c \le 5`$; for $`g \ge 4`$ all intervals below are non-empty and disjoint as listed:
- $`c=0`$: $`[0,5],[2g+7,4g] \mid [2g+1,2g+6],[4g+7,6g] \mid [4g+1,4g+6],[7,2g]`$; missing $`6`$.
- $`c=1`$: $`[2g+1,2g+6],[4g+7,6g] \mid [4g+1,4g+6],[7,2g] \mid [1,6],[2g+7,4g]`$; missing $`0`$.
- $`c=2`$: $`[4g+1,4g+6],[7,2g] \mid [1,6],[2g+7,4g] \mid \{0\},[2g+1,2g+6],[4g+8,6g]`$; missing $`4g+7`$.
- $`c=3`$: $`[1,6],[2g+7,4g] \mid \{0\},[2g+1,2g+6],[4g+8,6g] \mid [4g+2,4g+7],[7,2g]`$; missing $`4g+1`$.
- $`c=4`$: $`\{0\},[2g+1,2g+6],[4g+8,6g] \mid [4g+2,4g+7],[7,2g] \mid [1,6],[2g+8,4g+1]`$; missing $`2g+7`$.
- $`c=5`$: $`[4g+2,4g+7],[7,2g] \mid [1,6],[2g+8,4g+1] \mid \{0\},[2g+2,2g+7],[4g+8,6g]`$; missing $`2g+1`$.

Each class is a translate of $`M_0`$ or $`M_1`$, a matching of $`g`$ edges. $`\square`$

So the base colouring is a perfect $`(2n,3)`$-colouring of $`G^0`$ (Lemma 2), and **every class vertex set is a translate of $`W_0`$ or $`W_1`$: a cyclic interval of 6 vertices together with a disjoint cyclic interval of $`2g-6`$ vertices.**

*Remark (general $`k`$).* The same window computation works for $`W_0 = [0,k-1] \cup [2g+1+k,4g]`$, $`W_1 = [1,k] \cup [2g+1+k,4g]`$ with any $`1 \le k \le 2g-1`$ (the four disjointness conditions $`W_0 \cap (W_1+2g)`$, $`W_1 \cap (W_0+2g+1)`$, $`W_\varepsilon \cap (W_\varepsilon + 2g) = \emptyset`$ of `../circular-index-upper-half-circulants/PROOF.md` §2.3 hold by the same interval comparison). The certificates of Proposition B use $`k \in \{2,3,4,6\}`$; for them the window property is not argued by hand but checked directly (Section 7). An enumeration for $`g = 3`$ (the author's `wenum.py`, not included) and, independently, for $`g = 2, 3, 4`$ (the referee's `review/wenum_check.py`) shows that, up to $`x \mapsto -x`$ (that is, $`(W_0,W_1) \mapsto (-W_0+t,\ 1-W_1+t)`$), these sets with $`1 \le k \le 2g`$ are all pairs of sets that are unions of at most two cyclic intervals and satisfy the window conditions (at most two intervals is forced in this cyclic ansatz, `../circular-index-upper-half-circulants/PROOF.md` §7.1). The value $`k = 2g`$ ($`W_0 = [0,2g-1]`$, $`W_1 = [1,2g]`$) admits no base: both matchings lie in intervals of $`2g`$ vertices, so all their lengths are at most $`2g-1`$, too few values for $`2g`$ distinct lengths. So the negative claims of Section 8, stated for $`k \le 2g-1`$, lose nothing.

## 4. Explicit base matchings for $`g \ge 15`$

Put $`u = 2g+7`$ (so $`B = [u, u+2g-7]`$), $`N = g-3`$, and split $`B`$ by the parity of the offset:
```math
P(i) = u + 2i, \qquad Q(i) = u + 2i + 1 \qquad (0 \le i \le N-1).
```
An edge $`\{P(i),P(i')\}`$ or $`\{Q(i),Q(i')\}`$ lies inside $`B`$ (diameter $`2g-7 \lt 3g`$), so its length is $`2|i-i'|`$; call $`|i-i'|`$ its *difference*. Let $`\mu = 3g+3`$; the middle vertices of $`B`$ are $`\mu, \mu+1`$.

### 4.1 $`M_0`$
```math
M_0 = \bigl\{\{\mu-j,\ \mu+1+j\} : 3 \le j \le g-4\bigr\} \ \cup\ \bigl\{\{a,\ 3g+6-a\} : 0 \le a \le 5\bigr\}.
```
*Vertices.* $`\{\mu-j\} = [2g+7, 3g]`$, $`\{\mu+1+j\} = [3g+7, 4g]`$, $`\{3g+6-a\} = [3g+1, 3g+6]`$; with $`[0,5]`$ this is $`W_0`$, each vertex once.
*Lengths.* $`\{\mu-j,\mu+1+j\}`$ has length $`2j+1`$: **all odd numbers in $`[7, 2g-7]`$** ($`g-6`$ values). $`\{a, 3g+6-a\}`$: $`\delta = 3g+6-2a`$, length $`3g-5, 3g-3, 3g-1`$ for $`a = 0,1,2`$ ($`\delta \gt 3g`$) and $`3g, 3g-2, 3g-4`$ for $`a = 3,4,5`$: **exactly $`[3g-5, 3g]`$**.

### 4.2 $`M_1`$, internal part
Let $`\pi_i = \{P(i), P(N-1-i)\}`$ (difference $`N-1-2i`$) and $`\kappa_i = \{Q(i), Q(N-2-i)\}`$ (difference $`N-2-2i`$). Define $`M_1^{\rm int}`$ by cases ($`N \ge 12`$ throughout):

| $`N \bmod 4`$ | $`g \bmod 4`$ | $`M_1^{\rm int}`$ | the six holes $`B \setminus V(M_1^{\rm int})`$ |
|---|---|---|---|
| 0 | 3 | $`\{\pi_i : 2 \le i \le \frac N2-1\} \cup \{\kappa_i : 0 \le i \le \frac N2-2,\ i \ne \frac N4-1\} \cup \{\{Q(\frac N2-1), Q(N-1)\}\}`$ | $`P(0), P(1), P(N-2), P(N-1), Q(\frac N4-1), Q(\frac{3N}4-1)`$ |
| 2 | 1 | $`\{\pi_i : 2 \le i \le \frac N2-1,\ i \ne \frac{N-2}4\} \cup \{\kappa_i : 0 \le i \le \frac N2-2\} \cup \{\{Q(\frac N2-1), Q(N-1)\}\}`$ | $`P(0), P(1), P(N-2), P(N-1), P(\frac{N-2}4), P(\frac{3N-2}4)`$ |
| 1 | 0 | $`\{\pi_i : 2 \le i \le \frac{N-3}2,\ i \ne \frac{N-1}4\} \cup \{\{P(0), P(\frac{N-1}2)\}\} \cup \{\kappa_i : 0 \le i \le \frac{N-3}2\}`$ | $`P(1), P(N-2), P(N-1), P(\frac{N-1}4), P(\frac{3N-3}4), Q(N-1)`$ |
| 3 | 2 | $`\{\pi_i : 2 \le i \le \frac{N-3}2,\ i \ne \frac{N+1}4\} \cup \{\{P(1), P(\frac{N-1}2)\}\} \cup \{\kappa_i : 0 \le i \le \frac{N-3}2\}`$ | $`P(0), P(N-2), P(N-1), P(\frac{N+1}4), P(\frac{3N-5}4), Q(N-1)`$ |

*Vertices.* For $`N`$ even, the $`\pi_i`$, $`0 \le i \le N/2-1`$, partition $`P`$, and the $`\kappa_i`$, $`0 \le i \le N/2-2`$, partition $`Q \setminus \{Q(N/2-1), Q(N-1)\}`$. For $`N`$ odd, the $`\pi_i`$, $`0 \le i \le (N-3)/2`$, partition $`P \setminus \{P(\frac{N-1}2)\}`$, and the $`\kappa_i`$, $`0 \le i \le (N-3)/2`$, partition $`Q \setminus \{Q(N-1)\}`$. The excluded index ($`\frac N4-1`$, $`\frac{N-2}4`$, $`\frac{N-1}4`$, $`\frac{N+1}4`$) is an integer in the stated range (and $`\ge 2`$ in the three $`\pi`$-cases, since $`N \ge 12`$), with partner index $`N-2-(\frac N4-1) = \frac{3N}4-1`$, resp. $`N-1-i = \frac{3N-2}4, \frac{3N-3}4, \frac{3N-5}4`$. The added edge joins two vertices left free: $`Q(\frac N2-1), Q(N-1)`$ are not covered by the $`\kappa_i`$ ($`N`$ even); $`P(0)`$ resp. $`P(1)`$ is freed by dropping $`\pi_0`$ resp. $`\pi_1`$, and $`P(\frac{N-1}2)`$ is the uncovered centre ($`N`$ odd). What remains uncovered is exactly the six listed holes.

*Differences.* In all four cases the set of differences is
```math
D = [1, N-2] \setminus \{N-3\}, \qquad\text{so the lengths of } M_1^{\rm int} \text{ are } \{2, 4, \dots, 2g-10\} \setminus \{2g-12\} \quad (g-6 \text{ values, each once}).
```
For $`N`$ even, the $`\pi_i`$ ($`2 \le i \le N/2-1`$) have the odd differences $`1, 3, \dots, N-5`$ and the $`\kappa_i`$ ($`0 \le i \le N/2-2`$) the even differences $`2, \dots, N-2`$; in case 0 the removed $`\kappa_{N/4-1}`$ and the added edge both have difference $`N/2`$; in case 2 the removed $`\pi_{(N-2)/4}`$ and the added edge both have difference $`N/2`$. For $`N`$ odd, the $`\pi_i`$ ($`2 \le i \le (N-3)/2`$) have the even differences $`2, \dots, N-5`$, the $`\kappa_i`$ the odd differences $`1, \dots, N-2`$, and the removed $`\pi`$ (difference $`\frac{N-1}2`$ in case 1, $`\frac{N-3}2`$ in case 3, even in both cases) is replaced by the added edge of the same difference.

### 4.3 $`M_1`$, cross edges
Writing the holes as $`u + x`$, the offsets $`x`$ are (from the table, $`x = 2i`$ for $`P(i)`$ and $`2i+1`$ for $`Q(i)`$):
- $`g`$ odd (cases 0 and 2 give the same set): $`\{0,\ 2,\ \frac{g-5}2,\ \frac{3g-11}2,\ 2g-10,\ 2g-8\}`$;
- $`g \equiv 0 \pmod 4`$: $`\{2,\ \frac{g-4}2,\ \frac{3g-12}2,\ 2g-10,\ 2g-8,\ 2g-7\}`$;
- $`g \equiv 2 \pmod 4`$: $`\{0,\ \frac{g-2}2,\ \frac{3g-14}2,\ 2g-10,\ 2g-8,\ 2g-7\}`$.

The cross edges are $`\{a, u+x_a\}`$, $`a = 1, \dots, 6`$:

| $`a`$ | 1 | 2 | 3 | 4 | 5 | 6 |
|---|---|---|---|---|---|---|
| $`g`$ odd: $`x_a`$ | $`\frac{3g-11}2`$ | $`2g-10`$ | $`\frac{g-5}2`$ | $`2`$ | $`2g-8`$ | $`0`$ |
| length | $`\frac{5g+1}2`$ | $`2g+6`$ | $`\frac{5g+3}2`$ | $`2g+5`$ | $`2g+7`$ | $`2g+1`$ |
| $`g \equiv 0`$: $`x_a`$ | $`\frac{3g-12}2`$ | $`2g-10`$ | $`\frac{g-4}2`$ | $`2g-7`$ | $`2`$ | $`2g-8`$ |
| length | $`\frac{5g+2}2`$ | $`2g+6`$ | $`\frac{5g+4}2`$ | $`2g+5`$ | $`2g+4`$ | $`2g+8`$ |
| $`g \equiv 2`$: $`x_a`$ | $`\frac{3g-14}2`$ | $`2g-10`$ | $`\frac{g-2}2`$ | $`2g-7`$ | $`0`$ | $`2g-8`$ |
| length | $`\frac{5g+4}2`$ | $`2g+6`$ | $`\frac{5g+6}2`$ | $`2g+5`$ | $`2g+2`$ | $`2g+8`$ |

*Lengths.* $`\delta = u + x_a - a = 2g+7+x_a-a`$. For $`a \in \{3,4,6\}`$ ($`g`$ odd) resp. $`a \in \{3,5\}`$ ($`g`$ even), $`\delta \le \frac{5g+6}2 \le 3g`$, so the length is $`\delta`$. For the other $`a`$, $`\delta \in \{\frac{7g+1}2, 4g-5, 4g-6\}`$ ($`g`$ odd; $`a = 1,2,5`$), $`\{\frac{7g}2, 4g-5, 4g-4, 4g-7\}`$ ($`g \equiv 0`$; $`a = 1,2,4,6`$), $`\{\frac{7g-2}2, 4g-5, 4g-4, 4g-7\}`$ ($`g \equiv 2`$; $`a = 1,2,4,6`$), all $`\gt 3g`$, so the length is $`6g+1-\delta`$. This gives the table.

The six cross lengths are pairwise distinct: the four of the form $`2g+O(1)`$ are visibly distinct; the two of the form $`(5g+O(1))/2`$ differ by 1; and the smaller of these exceeds the largest of the former, as $`\frac{5g+1}2 \gt 2g+7`$ ($`g \gt 13`$), $`\frac{5g+2}2 \gt 2g+8`$ ($`g \gt 14`$), $`\frac{5g+4}2 \gt 2g+8`$ ($`g \gt 12`$). All six lie in $`[2g+1, 3g-6]`$, since $`\frac{5g+3}2 \le 3g-6 \iff g \ge 15`$, $`\frac{5g+4}2 \le 3g-6 \iff g \ge 16`$, $`\frac{5g+6}2 \le 3g-6 \iff g \ge 18`$, which hold for every $`g \ge 15`$ in the respective residue class.

### 4.4 Conclusion of the base problem
$`V(M_1) = [1,6] \cup B = W_1`$, each vertex once, $`|M_1| = (g-6)+6 = g`$. The $`2g`$ lengths of $`M_0 \cup M_1`$ are
```math
\underbrace{\{7, 9, \dots, 2g-7\}}_{M_0\text{ internal, odd}} \ \cup\ \underbrace{\{2, 4, \dots, 2g-10\} \setminus \{2g-12\}}_{M_1\text{ internal, even}} \ \cup\ \underbrace{\text{six values in } [2g+1, 3g-6]}_{M_1\text{ cross}} \ \cup\ \underbrace{[3g-5, 3g]}_{M_0\text{ cross}},
```
pairwise distinct (disjoint ranges or different parity), all in $`[2, 3g]`$, none equal to $`1, 3, 5`$. So the base problem is solved for every $`g \ge 15`$. The hypothesis $`g \ge 15`$ is needed only for the bound $`\le 3g-6`$ in 4.3; the other size conditions used ($`N \ge 12`$ in 4.2, $`g \gt 14`$ for the distinctness of the cross lengths in 4.3, and $`g - 3 \ge 8`$ in Section 5) are weaker.

## 5. The three blocks and the graph $`H_g`$

**Insertion lemma** (forward form; `../circular-index-upper-half-circulants/PROOF.md` §7.3, proof in `../circular-index-upper-half-delta-2-mod-4/PROOF.md`, Lemma 4). If $`F_1, F_2, F_3`$ are matchings with $`V(F_j) = V(E_{c+j-1})`$, inserting them in this order immediately before $`E_c`$ keeps the property "every three cyclically consecutive classes are pairwise vertex-disjoint with $`3g`$ edges in total": the five new windows have, as families of vertex sets, those of $`(E_{c-2},E_{c-1},E_c)`$, $`(E_{c-1},E_c,E_{c+1})`$ and (three times, reordered) $`(E_c,E_{c+1},E_{c+2})`$. Blocks at insertion points separated by $`\ge q-1 = 2`$ old classes do not interact (no window meets two blocks).

**Block 1 (before colour 0) and block 2 (before colour 6): length 1.** Let $`X_1 = \{0,2,4\} \cup \{7, 9, \dots, 6g-1\}`$, $`X_2 = X_1 + 1 = \{1,3,5\} \cup \{8, 10, \dots, 6g\}`$. The window at colour 0 is the disjoint union of the six intervals $`[0,5], [2g+7,4g], [2g+1,2g+6], [4g+7,6g], [4g+1,4g+6], [7,2g]`$ (Lemma 3), each of even size and starting at an element of $`X_1`$, so each is perfectly matched by the edges $`\{x,x+1\}`$, $`x \in X_1`$, inside it; $`|X_1| = 3g`$. Let $`F^{(1)}_j`$ ($`j=1,2,3`$) be those inside $`V(E_{j-1})`$. By (T), $`F^{(2)}_j = F^{(1)}_j + 1`$ (edges $`\{x,x+1\}`$, $`x \in X_2`$) has $`V(F^{(2)}_j) = V(E_{5+j})`$. $`X_1 \cap X_2 = \emptyset`$, and a length-1 edge $`\{x,x+1\}`$ determines $`x`$, so the two blocks share no edge. Block 1 misses $`x_0 = 6`$, block 2 misses $`x_6 = 7`$.

**Block 3 (before colour 12): lengths 3 and 5.** By (T), $`V(E_{12+j}) = V(E_j) + 2`$: a cyclic interval $`[y, y+5]`$ and a cyclic interval $`[z, z+2g-7]`$. Match $`[y,y+5]`$ by $`\{y+t, y+t+3\}`$, $`t = 0,1,2`$. Write $`g-3 = 3\alpha + 5\beta`$ with integers $`\alpha, \beta \ge 0`$ (possible as $`g - 3 \ge 8`$; the pair need not be unique, e.g. $`(\alpha,\beta) = (0,3)`$ or $`(5,0)`$ for $`g = 18`$, and any choice works), cut $`[z, z+2g-7]`$ into $`\alpha`$ consecutive intervals of 6 vertices followed by $`\beta`$ intervals of 10, and match $`[w,w+5]`$ by $`\{w+t, w+t+3\}`$ ($`t \le 2`$) and $`[w, w+9]`$ by $`\{w+t,w+t+5\}`$ ($`t \le 4`$). This gives $`F^{(3)}_{j+1}`$ with $`V(F^{(3)}_{j+1}) = V(E_{12+j})`$; block 3 misses $`x_{12} = 8`$.

**Simplicity.** Edges of $`G^0`$ have lengths in $`S`$; blocks 1, 2 consist of distinct length-1 edges; block 3 of edges of lengths 3 and 5 (distinct, as its three classes are matchings on disjoint vertex sets). Since $`S \cap \{1,3,5\} = \emptyset`$, the four edge sets are pairwise disjoint.

**The graph and colouring.** $`H_g = G^0 \cup (\text{block }1) \cup (\text{block }2) \cup (\text{block }3)`$, coloured by position in the cyclic sequence
```math
\bigl(F^{(1)}_1, F^{(1)}_2, F^{(1)}_3,\ E_0, \dots, E_5,\ F^{(2)}_1, F^{(2)}_2, F^{(2)}_3,\ E_6, \dots, E_{11},\ F^{(3)}_1, F^{(3)}_2, F^{(3)}_3,\ E_{12}, \dots, E_{2n-1}\bigr)
```
of length $`p = 2n+9`$; consecutive insertion points are separated by $`6, 6, 2n-12 \ge 2`$ old classes.

## 6. Proof of Theorem A

*Degrees.* $`G^0`$ is $`4g`$-regular, and each block is a matching covering all vertices except $`6`$, $`7`$, $`8`$ respectively. So $`6,7,8`$ have degree $`4g+2`$, all other vertices $`4g+3`$; $`\Delta(H_g) = 4g+3`$.

*Upper bound.* By Lemma 3 and the insertion lemma every three cyclically consecutive classes are pairwise vertex-disjoint matchings, so by Lemma 2 this is a $`(2n+9,3)`$-edge-colouring: $`\chi'_c(H_g) \le (2n+9)/3`$.

*Lower bound.* $`|E(H_g)| = 2gn + 9g`$ and $`|V| = 2\cdot 3g + 1`$; Lemma 1 gives $`\chi'_c(H_g) \ge (2gn+9g)/(3g) = (2n+9)/3`$.

*Value.* $`(2n+9)/3 = (12g+11)/3 = (4g+3) + \tfrac23`$. $`\blacksquare`$

*Remarks.* (1) $`H_g`$ is connected: $`2, 7 \in S`$ and $`\gcd(2,7) = 1`$. (2) Keeping only block 1, or blocks 1 and 2, gives $`\Delta = 4g+1`$, $`4g+2`$ with $`\chi'_c = \Delta + 2/3`$ (new proofs of known cases for $`g \ge 15`$).

## 7. Proposition B: certificates for $`6 \le g \le 14`$

The author's SAT encoder `fullsat.py` (python-sat; not included in this folder) encodes, for given $`g`$, $`k`$ and insertion colours $`c_1 \lt c_2 \lt c_3`$: perfect matchings $`M_0, M_1`$ of $`W_0 = [0,k-1] \cup [2g+1+k,4g]`$, $`W_1 = [1,k] \cup [2g+1+k,4g]`$ with $`2g`$ distinct lengths; and, for each block $`b`$, perfect matchings of the three class sets $`V(E_{c_b}), V(E_{c_b+1}), V(E_{c_b+2})`$ (computed from $`W_0, W_1`$) by edges whose length is not in $`S`$, the three blocks pairwise edge-disjoint. A solution gives a graph on $`6g+1`$ vertices exactly as in Sections 3, 5, 6, except that the blocks are arbitrary. Found (CaDiCaL 1.9.5 via python-sat, each in under 3 minutes):

| $`g`$ | $`\Delta`$ | $`n`$ | $`k`$ | insertion colours | $`\chi'_c`$ |
|---|---|---|---|---|---|
| 6 | 27 | 37 | 2 | 0, 18, 36 | 83/3 |
| 7 | 31 | 43 | 3 | 0, 29, 58 | 95/3 |
| 8 | 35 | 49 | 3 | 0, 6, 12 | 107/3 |
| 9 | 39 | 55 | 4 | 0, 6, 12 | 119/3 |
| 10 | 43 | 61 | 4 | 0, 6, 12 | 131/3 |
| 11 | 47 | 67 | 6 | 0, 6, 12 | 143/3 |
| 12 | 51 | 73 | 6 | 0, 6, 12 | 155/3 |
| 13 | 55 | 79 | 6 | 0, 6, 12 | 167/3 |
| 14 | 59 | 85 | 6 | 0, 6, 12 | 179/3 |

The proof of Proposition B is: the stored data, checked by `verify.py` with the same generic checker as the explicit family — $`M_0, M_1`$ perfect on $`W_0, W_1`$; $`2g`$ distinct lengths; each block class a matching on $`V(E_{c_b+j})`$; insertion points $`\ge 2`$ apart; the resulting edge set has no repeated edge (so the graph is simple and contains $`C_n(S)`$); $`\Delta = 4g+3`$; $`|E| = 2gn+9g`$; and the $`(2n+9,3)`$-colouring **checked per vertex from the definition**. Then Lemma 1 gives the matching lower bound $`|E|/3g = (2n+9)/3`$. `indep_check.py` (no shared code) re-checks all pairs of adjacent edges.

## 8. What is proved, computed, open

- **Proved by hand:** Theorem A, $`\Delta \equiv 3 \pmod 4`$, $`\Delta \ge 63`$, exact value $`\Delta + 2/3`$.
- **Computer-certified:** $`\Delta = 27, 31, \dots, 59`$ (Proposition B), exact value $`\Delta + 2/3`$.
- **Exhaustive negative results inside this framework** (forward-form insertion of blocks into the cyclic $`q = 3`$ base with $`W_0, W_1`$ from the $`k`$-family; SAT, `fullsat.py`; re-derived without SAT by the referee's exhaustive searches `review/oneblock_brute.py` and `review/threeblock_g5.py`):
  - one block, any $`k \in [1, 2g-1]`$, any insertion colour (by (T), colours $`0..5`$ suffice): **UNSAT for $`g = 2,3,4`$**. Hence no graph of this form for $`\Delta = 9, 13, 17`$ (one block) nor, since a 3-block solution contains a 1-block solution, for $`\Delta = 11, 15, 19`$. (Consistent with `../circular-index-upper-half-circulants/PROOF.md` §7.4.)
  - $`g = 5`$ ($`\Delta = 23`$): one block is possible only for $`k \in \{2, 8\}`$ (all six insertion residues); with three blocks, $`k \in \{2,8\}`$ and **all** triples of insertion colours with pairwise cyclic gaps $`\ge 2`$ and one colour in $`\{0, \dots, 5\}`$ (no loss by (T)): **UNSAT**, 0 undecided at 5 s per instance (`scan5.py` for $`c_1 = 0`$, `scan5b.py` for $`c_1 = 1, \dots, 5`$; 3306 instances per value of $`c_1`$, 19 836 in all). So $`\Delta = 23`$ has no example of this form.
  - Not covered: the mirror form of the insertion lemma, generalised insertions with free vertex sets (the $`\Delta = 21`$ example of `../circular-index-upper-half-circulants/` is of mirror form), other $`q`$.
- **Outside the framework (not decided):** $`K_{11} - F`$ ($`\Delta = 9`$, $`|F| = 7`$ spanning, all 7 types): $`(29,3)`$ and $`(39,4)`$ timed out (60–300 s per type); $`\mathbb Z_3`$-symmetric $`(39,4)`$ (two fixed vertices, colour shift 13): timeouts at 45 s per type; $`\mathbb Z_2`$-symmetric (`sym2.py`: one fixed vertex, five transpositions whose pairs are forced into $`F`$, colour shift $`p/2`$) for $`(58,6)`$, $`(48,5)`$, $`(68,7)`$: timeouts at 240 s each (the author's log; not included).

**Status of the Mazák–Zrubák remark for $`\Delta \ge 8`$** (this note with `../circular-index-upper-half-circulants/` and `../circular-index-upper-half-delta-2-mod-4/`):

| $`\Delta \bmod 4`$ | proved by hand | computer-certified | no example known |
|---|---|---|---|
| 0 | all $`\Delta \ge 8`$ | — | — |
| 1 | $`\Delta \ge 25`$ | 21 | 9, 13, 17 |
| 2 | $`\Delta \ge 26`$ | 10, 14, 18¹, 22 | — |
| 3 | $`\Delta \ge 63`$ | 27, 31, …, 59 | 11, 15, 19, 23 |

¹ $`\Delta = 18`$ is also proved by hand, by Theorem 2 of `../circular-index-upper-half-circulants/` (an 18-regular circulant on 25 vertices, value $`\Delta + 3/4`$).

So the remaining open values are $`\Delta \in \{9, 11, 13, 15, 17, 19, 23\}`$.

## 9. Verification

`python3 results/circular-index-upper-half-delta-3-mod-4/verify.py [GMAX]` from the repository root (standard library; it reads `certificates.json` next to the script; default `GMAX = 60`, about 2 s): for $`15 \le g \le`$ `GMAX` it builds $`M_0, M_1`$ and the three blocks from the closed formulas of Sections 4–5, checks that the internal lengths are exactly as claimed in 4.1–4.2, and runs the generic checker of Section 7; then it checks the nine certificates; then six negative controls must be rejected (a $`(p,4)`$-check; $`M_1 := M_0+1`$; two rewired edges of $`M_1`$; block 3 replaced by a translate of block 1, i.e. reused edges; two classes of block 3 swapped with the structural check switched off, so that the per-vertex check must catch it; two consecutive base classes swapped in the final sequence). Output ends with `ALL CHECKS PASSED`. Also run here with `GMAX = 120` (about 15 s). `python3 results/circular-index-upper-half-delta-3-mod-4/indep_check.py [GMAX]` (standard library; default 40, about 4 s): independent re-implementation, colours by closed formula, all pairs of adjacent edges, for the explicit family and the nine certificates.

**Referee pass.** One independent model referee (report `review/REVIEW.md`) re-derived by hand every step of Sections 2–6 for general $`g`$ (base classes, Lemma 3, the four $`M_1`$ cases and the cross table, the three blocks, simplicity, degrees and counting), checked the Mazák–Zrubák quotation against the arXiv HTML, and found **no mathematical errors**. Its minor points m1–m9 (instance count in Section 8, the size conditions in 4.4, the choice of $`\alpha, \beta`$, the range $`1 \le k \le 2g`$ in the Remark, the reference for the $`k`$-family, the symbol $`\mu`$, the footnote on $`\Delta = 18`$, run times, the quotation) are applied in this version. Its scripts, in `review/` and runnable from any working directory (paths relative to the script; standard library only): `ref_verify.py` (own verifier sharing no code with this folder's scripts; Theorem A for $`15 \le g \le 80`$ with every admissible $`(\alpha,\beta)`$, all pairs of incident edges for $`g \le`$ `GALLPAIRS`, the nine certificates, and the window property of the Remark for $`g \le 20`$; arguments `GMIN GMAX GALLPAIRS`, defaults 15 80 40; the recorded run used 15 80 50, about 70 s), `mut_test.py` (26 mutations, all must be rejected by `ref_verify.py`), `oneblock_brute.py` and `threeblock_g5.py` (exhaustive searches without SAT for the negative claims of Section 8), `wenum_check.py` (the enumeration in the Remark of Section 3). The recorded outputs are in `review/*.out`.

## 10. Sources

1. J. Mazák, F. Zrubák, *Circular chromatic index of small graphs*, arXiv:2603.08822v1 (quotation as recorded in `../circular-index-upper-half-circulants/PROOF.md` §0; checked against the arXiv HTML by the referee, `review/REVIEW.md` §4: verbatim, at the end of Section 8, after Problem 7).
2. `../circular-index-upper-half-circulants/PROOF.md`: Lemmas 1–2, insertion lemma, Family B, §7.1, §7.4.
3. `../circular-index-upper-half-delta-2-mod-4/PROOF.md`: window computation for $`k = 2`$, forward insertion lemma with proof, the $`\Delta \equiv 1, 2 \pmod 4`$ results.
