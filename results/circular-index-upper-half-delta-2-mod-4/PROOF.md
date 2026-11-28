# Graphs with $`\chi'_c \in (\Delta + 1/2, \Delta + 1)`$ for every $`\Delta \equiv 2 \pmod 4`$, $`\Delta \ge 10`$

Status (2026-11-22): text proof, one independent model referee pass (no errors found; report in `review/REVIEW.md`), not formalised. Machine check: `verify.py` (this folder; Python standard library only; data in `certificates.json`). Proved / computer-certified / open are separated in Section 6.

## 1. Statement

Mazák and Zrubák (*Circular chromatic index of small graphs*, arXiv:2603.08822v1, Section 8, after Problem 7) write: "Currently, for any $`\Delta \geq 8`$, we don't even know if there is a single graph with maximum degree $`\Delta`$ and $`\chi'_c \in (\Delta(G) + 1/2, \Delta(G) + 1)`$." (Quotation as recorded in `../circular-index-upper-half-circulants/PROOF.md`, Section 0, where it was obtained through a web-fetch tool; not re-checked against the PDF here.)

**Theorem 1 (proved by hand).** Let $`g \ge 7`$, $`n = 6g+1`$. The simple graph $`G_g`$ of Section 4 has $`n`$ vertices, maximum degree $`\Delta = 4g+2`$, and
```math
\chi'_c(G_g) = \frac{2n+6}{3} = 4g + \frac{8}{3} = \Delta + \frac23 .
```
The same holds for $`g = 6`$ ($`\Delta = 26`$) with the base matchings of Section 3.4 (12 explicit edges, checkable by hand).

**Theorem 1′ (same proof, one insertion block).** For every $`g \ge 6`$ the graph $`G'_g`$ of Section 4 has $`\Delta = 4g+1`$ and $`\chi'_c(G'_g) = (2n+3)/3 = \Delta + 2/3`$. So every $`\Delta \equiv 1 \pmod 4`$ with $`\Delta \ge 25`$ is realised.

**Proposition 2 (computer-certified; certificates from `../circular-index-complete-minus-edges/`).** For $`n \in \{11, 15, 19, 23\}`$ and $`t = (n-3)/4`$, $`K_n - tK_2`$ ($`F`$ a matching of $`t`$ edges) has maximum degree $`\Delta = n - 1 \in \{10, 14, 18, 22\}`$ and
```math
\Delta + \tfrac12 \ \lt\ n - \tfrac{t}{m} \ \le\ \chi'_c(K_n - tK_2) \ \le\ \frac{3n-1}{3} = \Delta + \tfrac23 \ \lt\ \Delta + 1, \qquad m = \tfrac{n-1}{2}.
```
(For $`n = 11`$ the value is exactly $`32/3`$, proved in that folder.)

**Corollary 3.** For every $`\Delta \equiv 2 \pmod 4`$ with $`\Delta \ge 10`$ there is a simple graph $`G`$ with maximum degree $`\Delta`$ and $`\chi'_c(G) \in (\Delta + 1/2, \Delta + 1)`$: Proposition 2 for $`\Delta \le 22`$, Theorem 1 for $`\Delta = 4g+2 \ge 26`$. Together with Theorem 1 of `../circular-index-upper-half-circulants/PROOF.md` ($`\Delta \equiv 0 \pmod 4`$, $`\Delta \ge 8`$, circulants with $`\chi'_c = \Delta + 2/3`$) this gives such a graph **for every even $`\Delta \ge 8`$**. With Theorem 1′ (and the computer-certified $`\Delta = 21`$ example of `../circular-index-upper-half-circulants/` §7.3) it also covers every $`\Delta \equiv 1 \pmod 4`$, $`\Delta \ge 21`$.

What is new relative to `../circular-index-upper-half-circulants/PROOF.md` §7.3 ("Family B"): there the construction was reduced to a base matching problem that was solved by SAT only for $`6 \le g \le 13`$. Section 3 below solves it explicitly for every $`g \ge 7`$; the rest of the argument (Sections 2, 4, 5) is the Family B argument, re-proved here in full so that this file is self-contained.

## 2. Definitions and two lemmas

A $`(p,q)`$-edge-colouring ($`p \ge q \ge 1`$ integers) is a map $`c : E(G) \to \mathbb Z_p`$ such that edges sharing a vertex get colours at circular distance $`\ge q`$ in $`\mathbb Z_p`$; a circular $`r`$-edge-colouring is $`\varphi : E \to [0,r)`$ with adjacent edges at circular distance $`\ge 1`$ in $`\mathbb R / r\mathbb Z`$, and $`\chi'_c(G)`$ is the infimum of such $`r`$ (the definition of Mazák–Zrubák). Colour classes: $`E_c = c^{-1}(c)`$.

**Lemma 1 (lower bound).** If $`G`$ has an edge, $`\chi'_c(G) \ge |E(G)|/\alpha'(G)`$, where $`\alpha'`$ is the matching number. In particular, if $`|V(G)| = 2m+1`$ then $`\chi'_c(G) \ge |E(G)|/m`$.

*Proof.* (Classical, cf. Hackmann–Kemnitz; this is the argument of `../circular-index-upper-half-circulants/PROOF.md`, Lemma 1.) Let $`\varphi`$ be a circular $`r`$-edge-colouring. For $`x \in [0,r)`$ the edges with colour in the half-open arc $`[x, x+1)`$ (mod $`r`$) pairwise have colour distance $`\lt 1`$, so they form a matching $`M_x`$, $`|M_x| \le \alpha'`$. Each edge lies in $`M_x`$ for a set of $`x`$ of measure 1, so $`|E| = \int_0^r |M_x|\,dx \le r\alpha'`$. For $`|V| = 2m+1`$, $`\alpha' \le m`$. $`\square`$

**Lemma 2 (upper bound; window form).** (a) A $`(p,q)`$-edge-colouring gives $`\chi'_c \le p/q`$. (b) $`c : E \to \mathbb Z_p`$ is a $`(p,q)`$-edge-colouring iff for every $`c_0 \in \mathbb Z_p`$ the *window* $`E_{c_0} \cup E_{c_0+1} \cup \dots \cup E_{c_0+q-1}`$ is a matching.

*Proof.* (a) $`\varphi(e) = c(e)/q`$. (b) Two adjacent edges have colours at circular distance $`\le q-1`$ iff both lie in some window of $`q`$ cyclically consecutive colours. $`\square`$

So if $`|V(G)| = 2m+1`$ and $`G`$ has a $`(p,q)`$-edge-colouring with $`p/q = |E|/m`$, then $`\chi'_c(G) = p/q`$. This happens exactly when every window is a matching with $`m`$ edges ("perfect" colouring).

Throughout, $`n = 6g+1`$, vertices are $`\mathbb Z_n`$, written as representatives in $`[0, n-1]`$; $`[a,b]`$ denotes the integer interval. The *length* of an edge $`\{x,y\}`$ is $`\min(|x-y|_n, n-|x-y|_n) \in [1, 3g]`$ where $`|x-y|_n \in [0,n-1]`$ is $`x - y \bmod n`$; it is invariant under translation $`x \mapsto x+i`$. For a set of edges $`M`$, $`M + i`$ is its translate and $`V(M)`$ its vertex set.

## 3. The base matchings

Put
```math
I = [2g+3,\ 4g], \qquad W_0 = \{0, 1\} \cup I, \qquad W_1 = \{1, 2\} \cup I \qquad (|W_0| = |W_1| = 2g).
```
**Base problem.** Find perfect matchings $`M_0`$ of $`W_0`$ and $`M_1`$ of $`W_1`$ (each with $`g`$ edges) such that the $`2g`$ edges of $`M_0 \cup M_1`$ have pairwise distinct lengths, none equal to 1.

(Remark, not needed for the proof: since $`\{0,1\}`$ and $`\{1,2\}`$ have length 1, each of $`0,1,2`$ is matched into $`I`$; the $`2g-4`$ edges inside $`I`$ have lengths in $`[1, 2g-3]`$, hence exactly $`\{2, \dots, 2g-3\}`$ — a Langford/Skolem-type problem on two copies of $`I`$ with two "holes" each. The construction below takes the centred odd nest in $`W_0`$ and only even lengths in $`W_1`$; the even part splits along vertex parity into two half-size problems, which are solved by nests.)

### 3.1 $`M_0`$ (all $`g \ge 7`$)
```math
M_0 = \bigl\{\{0,\ 3g+2\},\ \{1,\ 3g+1\}\bigr\} \cup \bigl\{\{3g+1-j,\ 3g+2+j\} : 1 \le j \le g-2\bigr\}.
```
*Vertices.* $`\{3g+1-j\} = [2g+3, 3g]`$ and $`\{3g+2+j\} = [3g+3, 4g]`$; with $`0, 1, 3g+1, 3g+2`$ these are the $`2g`$ distinct elements of $`W_0`$. So $`M_0`$ is a perfect matching of $`W_0`$.
*Lengths.* $`\{0, 3g+2\}`$: $`3g+2 \gt 3g`$, length $`n - (3g+2) = 3g-1`$. $`\{1, 3g+1\}`$: $`3g`$. $`\{3g+1-j, 3g+2+j\}`$: $`2j+1`$, i.e. **all odd numbers in $`[3, 2g-3]`$**.

### 3.2 $`M_1`$ for odd $`g \ge 7`$
Let $`h = (g-3)/2`$.
```math
M_1 = \bigl\{\{2,\ 3g\},\ \{1,\ 4g-1\}\bigr\} \cup \bigl\{\{2g+4+2x,\ 4g-2x\} : 0 \le x \le h\bigr\} \cup \bigl\{\{3g-2j,\ 3g+2j\} : 1 \le j \le h\bigr\}.
```
*Vertices.* $`g`$ odd, so $`2g+4`$ is even and $`3g`$ is odd. $`\{2g+4+2x\}`$ = the even numbers of $`[2g+4, 3g+1]`$ (as $`2g+4+2h = 3g+1`$); $`\{4g-2x\}`$ = the even numbers of $`[3g+3, 4g]`$; together: all even numbers of $`I`$. $`\{3g-2j\}`$ = the odd numbers of $`[2g+3, 3g-2]`$, $`\{3g+2j\}`$ = the odd numbers of $`[3g+2, 4g-3]`$; with $`3g`$ and $`4g-1`$: all odd numbers of $`I`$. With $`1, 2`$: exactly $`W_1`$, each once.
*Lengths.* $`\{2, 3g\}`$: $`3g-2`$. $`\{1, 4g-1\}`$: $`4g-2 \gt 3g`$, length $`n - 4g + 2 = 2g+3`$. $`\{2g+4+2x, 4g-2x\}`$: $`2g-4-4x`$, $`0 \le x \le h`$: the numbers $`\equiv 2 \pmod 4`$ in $`[2, 2g-4]`$ (note $`2g - 4 \equiv 2`$ and $`2g-4-4h = 2`$). $`\{3g-2j, 3g+2j\}`$: $`4j`$, $`1 \le j \le h`$: the multiples of 4 in $`[4, 2g-6]`$. Together: **all even numbers in $`[2, 2g-4]`$**.

### 3.3 $`M_1`$ for even $`g \ge 8`$
```math
M_1 = \bigl\{\{1,\ 2g+5\},\ \{2,\ 3g\},\ \{2g+3,\ 4g-1\}\bigr\} \cup \bigl\{\{2g+3+2j,\ 4g+1-2j\} : 2 \le j \le \tfrac{g-2}{2}\bigr\} \cup O_g ,
```
```math
O_g = \begin{cases}
\{\{2g+4,\ 4g-2\}\} \cup \{\{3g-4i,\ 3g+4i\} : 1 \le i \le \frac{g-6}{4}\} \cup \{\{3g+6-4i,\ 3g+2+4i\} : 1 \le i \le \frac{g-2}{4}\}, & g \equiv 2 \pmod 4,\\[4pt]
\{\{2g+6,\ 4g\}\} \cup \{\{3g-4i,\ 3g+4i\} : 1 \le i \le \frac{g-4}{4}\} \cup \{\{3g+6-4i,\ 3g+2+4i\} : 1 \le i \le \frac{g-4}{4}\}, & g \equiv 0 \pmod 4.
\end{cases}
```
*Odd vertices of* $`I`$ ($`g`$ even, so $`2g+3`$, $`3g+1`$ are odd): $`2g+3`$, $`4g-1`$, $`2g+5`$ (matched to 1), $`\{2g+3+2j : 2 \le j \le (g-2)/2\}`$ = the odd numbers of $`[2g+7, 3g+1]`$ and $`\{4g+1-2j\}`$ = the odd numbers of $`[3g+3, 4g-3]`$. These are all odd numbers of $`I`$, each once.
*Even vertices of* $`I`$: $`3g`$ (matched to 2) and the $`g-2`$ vertices of $`O_g`$, which must be the even numbers of $`I \setminus \{3g\}`$:
- $`g = 4k+2`$ ($`k \ge 2`$), so $`3g \equiv 2 \pmod 4`$. $`\{3g-4i : 1 \le i \le k-1\} = \{2g+6, 2g+10, \dots, 3g-4\}`$ (as $`3g-4(k-1) = 2g+6`$), $`\{3g+4i\} = \{3g+4, \dots, 4g-6\}`$, plus $`4g-2`$: all numbers $`\equiv 2 \pmod 4`$ in $`[2g+4, 4g]`$ except $`3g`$. $`\{3g+6-4i : 1 \le i \le k\} = \{2g+8, \dots, 3g+2\}`$ (as $`3g+6-4k = 2g+8`$), $`\{3g+2+4i\} = \{3g+6, \dots, 4g\}`$, plus $`2g+4`$: all multiples of 4 in $`[2g+4, 4g]`$.
- $`g = 4k`$ ($`k \ge 2`$), so $`3g \equiv 0 \pmod 4`$. $`\{3g-4i : 1 \le i \le k-1\} = \{2g+4, \dots, 3g-4\}`$, $`\{3g+4i\} = \{3g+4, \dots, 4g-4\}`$, plus $`4g`$: all multiples of 4 in $`[2g+4, 4g]`$ except $`3g`$. $`\{3g+6-4i\} = \{2g+10, \dots, 3g+2\}`$, $`\{3g+2+4i\} = \{3g+6, \dots, 4g-2\}`$, plus $`2g+6`$: all numbers $`\equiv 2 \pmod 4`$ in $`[2g+4, 4g]`$.

So $`V(M_1) = W_1`$, each vertex once.
*Lengths.* $`\{1, 2g+5\}`$: $`2g+4`$ ($`\le 3g`$). $`\{2, 3g\}`$: $`3g-2`$. $`\{2g+3, 4g-1\}`$: $`2g-4`$. $`\{2g+3+2j, 4g+1-2j\}`$: $`2g-2-4j`$, $`2 \le j \le (g-2)/2`$: the numbers $`\equiv 2 \pmod 4`$ in $`[2, 2g-10]`$. In $`O_g`$: the first edge has length $`2g-6`$ ($`\equiv 2 \pmod 4`$); $`\{3g-4i, 3g+4i\}`$ has length $`8i`$ and $`\{3g+6-4i, 3g+2+4i\}`$ has length $`8i-4`$.
- $`g = 4k+2`$: $`8i \in \{8, \dots, 8k-8\}`$, $`8i - 4 \in \{4, \dots, 8k-4\}`$, and $`2g-4 = 8k`$: all multiples of 4 in $`[4, 2g-4]`$.
- $`g = 4k`$: $`8i \in \{8, \dots, 8k-8\}`$, $`8i-4 \in \{4, \dots, 8k-12\}`$, and $`2g-4 = 8k-4`$: all multiples of 4 in $`[4, 2g-4]`$.

With the $`\equiv 2 \pmod 4`$ lengths $`[2, 2g-10] \cup \{2g-6\}`$: **all even numbers in $`[2, 2g-4]`$**.

### 3.4 Conclusion of the base problem, and $`g = 6`$
For $`g \ge 7`$, the lengths of $`M_0 \cup M_1`$ are
```math
[2, 2g-3] \ \cup\ \{3g-1,\ 3g,\ 3g-2\} \ \cup\ \{2g+3 \ (g \text{ odd})\ \text{ or }\ 2g+4\ (g \text{ even})\},
```
which are $`2g`$ pairwise distinct numbers in $`[2, 3g]`$ because $`2g - 3 \lt 2g+3`$ and $`2g+4 \lt 3g-2`$ for $`g \ge 7`$. The restriction $`g \ge 7`$ is a property of these formulas: at $`g = 5`$ the odd-$`g`$ formula gives $`2g+3 = 3g-2 = 13`$, and at $`g = 6`$ the even-$`g`$ formula gives $`2g+4 = 3g-2 = 16`$ (a collision in each case), which is why $`g = 6`$ is treated separately. The base problem itself has no solution for $`g = 3,4,5`$ (`../circular-index-upper-half-circulants/PROOF.md` §7.4; re-confirmed exhaustively by `review/base_small.py`).

For $`g = 6`$ ($`n = 37`$, $`I = [15, 24]`$) we use the SAT-found base stored in `../circular-index-upper-half-circulants/data/part2_certificates.json`:
```math
M_0 = \{\{0,22\},\{1,19\},\{15,24\},\{16,20\},\{17,23\},\{18,21\}\},\quad
M_1 = \{\{1,22\},\{2,19\},\{15,23\},\{16,21\},\{17,24\},\{18,20\}\},
```
with lengths $`15, 18, 9, 4, 6, 3`$ and $`16, 17, 8, 5, 7, 2`$: twelve distinct lengths $`\ne 1`$; $`V(M_0) = \{0,1\} \cup [15,24]`$, $`V(M_1) = \{1,2\} \cup [15,24]`$.

Let $`S`$ be the set of the $`2g`$ lengths, and $`G^0 = C_n(S)`$ the circulant ($`x \sim y`$ iff the length of $`\{x,y\}`$ is in $`S`$). It is simple and $`4g`$-regular ($`n`$ odd, so $`\pm s`$ are $`4g`$ distinct non-zero residues), $`|E(G^0)| = 2gn`$, and $`1 \notin S`$.

## 4. The colouring and the graph

**Base classes.** For $`a \in \mathbb Z_{2n}`$ write $`a = 2i + \varepsilon`$, $`\varepsilon \in \{0,1\}`$, $`i \in \mathbb Z_n`$, and set $`K_a = M_\varepsilon + i`$. For fixed $`s \in S`$, the edges of length $`s`$ in $`G^0`$ are exactly the $`n`$ translates of the unique base edge of length $`s`$, and these are pairwise distinct ($`\{x+i, y+i\} = \{x+j, y+j\}`$, $`i \ne j`$, forces $`2(y-x) \equiv 0`$, impossible for $`n`$ odd and $`x \ne y`$). Hence the $`2n`$ matchings $`K_a`$ partition $`E(G^0)`$.

**Base colouring.** $`3 \nmid 2n`$, and $`3(4g+1) = 2n+1`$, so $`3^{-1} = 4g+1`$ in $`\mathbb Z_{2n}`$. Give $`K_a`$ colour $`3a`$; equivalently colour $`c`$ carries $`E_c = K_{(4g+1)c}`$. Since $`6(4g+1) = 24g + 6 = 2(12g+2) + 2 \equiv 2 \pmod{2n}`$, and $`K_{a+2} = K_a + 1`$, we get
```math
E_{c+6} = E_c + 1 \qquad (c \in \mathbb Z_{2n}). \tag{T}
```
The classes of colours $`0, \dots, 5`$ are $`K_0, K_{4g+1}, K_{8g+2}, K_{1}, K_{4g+2}, K_{8g+3}`$ (as $`3(4g+1) = 12g+3 \equiv 1`$), i.e. $`M_0`$, $`M_1 + 2g`$, $`M_0 + (4g+1)`$, $`M_1`$, $`M_0 + (2g+1)`$, $`M_1 + (4g+1)`$. Their vertex sets, reduced to $`[0, n-1]`$:
```math
\begin{aligned}
V(E_0) &= W_0 = \{0,1\} \cup [2g+3, 4g], &
V(E_1) &= W_1 + 2g = \{2g+1, 2g+2\} \cup [4g+3, 6g],
\\ V(E_2) &= W_0 + 4g+1 = [3, 2g] \cup \{4g+1, 4g+2\}, &
V(E_3) &= W_1 = \{1,2\} \cup [2g+3, 4g],
\\ V(E_4) &= W_0 + 2g+1 = \{0, 2g+1, 2g+2\} \cup [4g+4, 6g], &
V(E_5) &= W_1 + 4g+1 = [3, 2g] \cup \{4g+2, 4g+3\},
\end{aligned}
```
and $`V(E_6) = W_0 + 1 = \{1,2\} \cup [2g+4, 4g+1]`$, $`V(E_7) = V(E_1) + 1 = \{0, 2g+2, 2g+3\} \cup [4g+4, 6g]`$ (using $`6g+1 \equiv 0`$).

**Lemma 3 (perfect base colouring).** For every $`c`$, $`E_c, E_{c+1}, E_{c+2}`$ are pairwise vertex-disjoint, so each window of 3 consecutive colours is a matching of $`3g = (n-1)/2`$ edges, missing exactly one vertex $`x_c`$.

*Proof.* Every $`c \in \mathbb Z_{2n}`$ is $`c_0 + 6k`$ with $`c_0 \in \{0,\dots,5\}`$ and an integer $`k \ge 0`$ (take representatives in $`[0,2n-1]`$), and by (T) the window at $`c_0+6k`$ is the window at $`c_0`$ translated by $`k`$; so it suffices to take $`c \in \{0, \dots, 5\}`$ (no invertibility of 6 is needed). Reading off the sets above:
- $`c=0`$: $`\{0,1\}\cup[2g+3,4g]`$, $`\{2g+1,2g+2\}\cup[4g+3,6g]`$, $`[3,2g]\cup\{4g+1,4g+2\}`$: disjoint, union $`\mathbb Z_n \setminus \{2\}`$.
- $`c=1`$: $`V(E_1)`$, $`V(E_2)`$, $`\{1,2\}\cup[2g+3,4g]`$: disjoint, union $`\mathbb Z_n\setminus\{0\}`$.
- $`c=2`$: $`[3,2g]\cup\{4g+1,4g+2\}`$, $`\{1,2\}\cup[2g+3,4g]`$, $`\{0,2g+1,2g+2\}\cup[4g+4,6g]`$: disjoint, missing $`4g+3`$.
- $`c=3`$: $`\{1,2\}\cup[2g+3,4g]`$, $`\{0,2g+1,2g+2\}\cup[4g+4,6g]`$, $`[3,2g]\cup\{4g+2,4g+3\}`$: disjoint, missing $`4g+1`$.
- $`c=4`$: $`\{0,2g+1,2g+2\}\cup[4g+4,6g]`$, $`[3,2g]\cup\{4g+2,4g+3\}`$, $`\{1,2\}\cup[2g+4,4g+1]`$: disjoint, missing $`2g+3`$.
- $`c=5`$: $`[3,2g]\cup\{4g+2,4g+3\}`$, $`\{1,2\}\cup[2g+4,4g+1]`$, $`\{0,2g+2,2g+3\}\cup[4g+4,6g]`$: disjoint, missing $`2g+1`$.

Each class is a translate of $`M_0`$ or $`M_1`$, a matching with $`g`$ edges. $`\square`$

(This uses only $`W_0, W_1`$, not the particular matchings. By Lemma 2 the base colouring is a $`(2n,3)`$-colouring of $`G^0`$ with $`2n/3 = |E(G^0)|/3g`$, so $`\chi'_c(G^0) = 2n/3 = 4g + 2/3`$ — a further $`\Delta \equiv 0 \pmod 4`$ example, not needed here.)

**Insertion blocks.** Let
```math
X_1 = \{0\} \cup \{3, 5, 7, \dots, 6g-1\}, \qquad X_2 = X_1 + 1 = \{1\} \cup \{4, 6, \dots, 6g\},
```
and $`L_k = \{\{x, x+1\} : x \in X_k\}`$ (edges of length 1; $`\{6g, 6g+1\} = \{6g, 0\}`$). For $`j = 1,2,3`$ let
```math
F_j = \{\{x,x+1\} \in L_1 : x \in V(E_{j-1})\}, \qquad F'_j = F_j + 1 .
```
*Claim:* $`V(F_j) = V(E_{j-1})`$ (so $`F_j`$ is a perfect matching of $`V(E_{j-1})`$ by length-1 edges), and $`V(F'_j) = V(E_{j+5})`$. Indeed $`V(E_0) = \{0,1\} \cup [2g+3, 4g]`$ is the disjoint union of the pairs $`\{x, x+1\}`$, $`x \in \{0\} \cup \{2g+3, 2g+5, \dots, 4g-1\}`$; $`V(E_1) = \{2g+1,2g+2\} \cup [4g+3, 6g]`$ is the union of the pairs with $`x \in \{2g+1\} \cup \{4g+3, \dots, 6g-1\}`$; $`V(E_2) = [3, 2g] \cup \{4g+1, 4g+2\}`$ is the union of the pairs with $`x \in \{3, 5, \dots, 2g-1\} \cup \{4g+1\}`$. All these $`x`$ are in $`X_1`$, they are $`3g`$ distinct elements, and $`|X_1| = 1 + (3g-1) = 3g`$, so $`L_1 = F_1 \sqcup F_2 \sqcup F_3`$. The statement for $`F'_j`$ follows from (T). Moreover $`L_1 \cap L_2 = \emptyset`$ (a length-1 edge $`\{x,x+1\}`$ determines $`x`$, and $`X_1 \cap X_2 = \emptyset`$: $`1 \notin X_1`$, $`0 \notin X_2`$, and $`X_1 \setminus\{0\}`$ is odd, $`X_2 \setminus \{1\}`$ even), and both are disjoint from $`E(G^0)`$ since $`1 \notin S`$.

**The graphs.** $`G'_g = G^0 + L_1`$ and $`G_g = G^0 + L_1 + L_2`$ on $`\mathbb Z_n`$. They are simple: $`G^0`$ is simple ($`n`$ odd, $`2g`$ distinct lengths in $`[1,3g]`$); $`L_1`$, $`L_2`$ consist of length-1 edges, each determined by its $`x`$ (as $`n \ge 3`$), with $`X_1 \cap X_2 = \emptyset`$, so $`L_1 \cap L_2 = \emptyset`$; and $`1 \notin S`$, so no inserted edge is an edge of $`G^0`$.

**The colourings.** Arrange the classes in the cyclic sequences
```math
\mathcal S' = (F_1, F_2, F_3, E_0, E_1, \dots, E_{2n-1}), \qquad
\mathcal S = (F_1, F_2, F_3, E_0, \dots, E_5, F'_1, F'_2, F'_3, E_6, \dots, E_{2n-1}),
```
of lengths $`p' = 2n+3`$ and $`p = 2n+6`$, and colour the $`k`$-th class of the sequence with colour $`k \in \mathbb Z_{p'}`$ resp. $`\mathbb Z_p`$. Every edge of $`G'_g`$ (resp. $`G_g`$) is in exactly one class.

**Lemma 4 (insertion).** Every three cyclically consecutive classes of $`\mathcal S`$ (resp. $`\mathcal S'`$) are pairwise vertex-disjoint matchings with $`3g`$ edges in total.

*Proof.* Each class is a matching. Take three consecutive entries. If none is an $`F`$ or $`F'`$, they are $`E_c, E_{c+1}, E_{c+2}`$ for some $`c`$ — note that in $`\mathcal S`$ the entries $`E_{2n-1}`$ and $`E_0`$ are separated only by $`F_1,F_2,F_3`$, and $`E_5`$, $`E_6`$ only by $`F'_1,F'_2,F'_3`$, so consecutive $`E`$'s without an $`F`$ between them are consecutive colours. Since the two blocks are separated by the six classes $`E_0, \dots, E_5`$ and, the other way round the cycle, by the $`2n-6`$ classes $`E_6,\dots,E_{2n-1}`$, both at least $`q - 1 = 2`$, no three consecutive entries meet both blocks. Both blocks are instances of the *forward* form of the insertion lemma of `../circular-index-upper-half-circulants/PROOF.md` §7.3 ($`F_j`$ copies $`E_0,E_1,E_2`$ and is inserted before $`E_0`$; $`F'_j`$ copies $`E_6,E_7,E_8`$ and is inserted before $`E_6`$); the mirror form is not used. Replacing $`F_j`$ by $`E_{j-1}`$ (same vertex set), the windows meeting the first block have the vertex sets of
```math
(E_{-2}, E_{-1}, E_0),\ (E_{-1}, E_0, E_1),\ (E_0, E_1, E_2),\ (E_1, E_2, E_0),\ (E_2, E_0, E_1),
```
for the windows $`(E_{-2},E_{-1},F_1)`$, $`(E_{-1},F_1,F_2)`$, $`(F_1,F_2,F_3)`$, $`(F_2,F_3,E_0)`$, $`(F_3,E_0,E_1)`$ respectively; each is (a reordering of) a window of Lemma 3. The same with $`F'_j \leftrightarrow E_{j+5}`$ for the second block. Each window of Lemma 3 consists of pairwise vertex-disjoint classes with $`3g`$ edges in total. $`\square`$

## 5. Proof of Theorems 1 and 1′

*Degrees.* $`G^0`$ is $`4g`$-regular. $`L_1`$ is a matching covering $`V(E_0) \cup V(E_1) \cup V(E_2) = \mathbb Z_n \setminus \{2\}`$ (Lemma 3, $`c = 0`$), and $`L_2 = L_1 + 1`$ covers $`\mathbb Z_n \setminus \{3\}`$. Hence in $`G'_g`$ every vertex except 2 has degree $`4g+1`$ (vertex 2 has $`4g`$), and in $`G_g`$ vertices $`2, 3`$ have degree $`4g+1`$ and all others $`4g+2`$. So $`\Delta(G'_g) = 4g+1`$, $`\Delta(G_g) = 4g+2`$ (as $`n \ge 3`$).

*Upper bound.* By Lemma 4 every window of 3 consecutive colours of $`\mathcal S`$ is a matching, so by Lemma 2(b) the colouring is a $`(2n+6, 3)`$-edge-colouring of $`G_g`$ and $`\chi'_c(G_g) \le (2n+6)/3`$; likewise $`\chi'_c(G'_g) \le (2n+3)/3`$.

*Lower bound.* $`|E(G_g)| = 2gn + 6g`$ ($`|L_k| = 3g`$), $`|V| = n = 2 \cdot 3g + 1`$. By Lemma 1, $`\chi'_c(G_g) \ge (2gn + 6g)/(3g) = (2n+6)/3`$. Likewise $`\chi'_c(G'_g) \ge (2gn+3g)/(3g) = (2n+3)/3`$.

*Value.* $`(2n+6)/3 = (12g+8)/3 = (4g+2) + 2/3`$ and $`(2n+3)/3 = (4g+1) + 2/3`$. $`\blacksquare`$

*Proof of Proposition 2.* $`F`$ is a matching with $`t = (n-3)/4`$ edges, so $`2t \lt n`$ and some vertex has degree $`n-1 = \Delta`$; $`m = (n-1)/2 = 2t+1 \gt 2t`$. $`|E| = mn - t`$, so Lemma 1 gives $`\chi'_c \ge n - t/m \gt n - 1/2 = \Delta + 1/2`$. The stored $`(3n-1, 3)`$-colourings (found by SAT in `../circular-index-complete-minus-edges/`, rechecked by `verify.py`) give $`\chi'_c \le n - 1/3 \lt n = \Delta + 1`$. $`\square`$

*Proof of Corollary 3.* $`\Delta = 10, 14, 18, 22`$: Proposition 2. $`\Delta = 4g+2`$ with $`g \ge 6`$, i.e. $`\Delta \in \{26, 30, 34, \dots\}`$: Theorem 1. $`\square`$

## 6. What is proved, computed, open

- **Proved by hand (this file):** Theorem 1 for all $`g \ge 7`$ ($`\Delta = 30, 34, 38, \dots`$), with explicit base matchings (Section 3), and Theorem 1′ for $`g \ge 7`$ ($`\Delta = 29, 33, \dots`$). Also for $`g = 6`$ ($`\Delta = 26, 25`$), where the base is a 12-edge certificate whose properties are listed in 3.4 (checkable by hand; it was originally found by SAT). The graphs are simple (connectivity is not needed; it is not claimed or checked), of odd order $`6g+1`$, **not regular** (two vertices of degree $`\Delta - 1`$ in $`G_g`$), and $`\chi'_c = \Delta + 2/3`$ exactly.
- **Computer-certified (not human-checked):** $`\Delta = 10, 14, 18, 22`$ via the SAT-found colourings of $`K_n - tK_2`$ (Proposition 2); there the exact value of $`\chi'_c`$ is known only for $`\Delta = 10`$ ($`32/3`$, see the other folder), otherwise only the interval. These rely on the correctness of `verify.py` (a direct per-vertex check from the definition: `check_colouring` is about 12 lines, Part 2 about 30) and were rechecked independently by the referee (`review/kn_check.py`, all pairs).
- **Not done:** a uniform proof for $`\Delta \in \{10, 14, 18, 22\}`$ (the Family B base problem is unsolvable for $`g = 3,4,5`$, per `../circular-index-upper-half-circulants/PROOF.md` §7.4, exhaustive by SAT and by the referee there); Route B of the task (a symmetric construction for $`K_n - tK_2`$, $`n \equiv 3 \pmod 4`$) was not pursued since Route A succeeded. $`\Delta \equiv 3 \pmod 4`$ and $`\Delta \in \{9, 13, 17\}`$ remain without examples; Problem 6 (connectivity) and Problem 7 (denominators $`q \ge 6`$) are untouched.
- **Literature:** no search beyond the sources of the two earlier folders was made; we rely on Mazák–Zrubák's statement that no example with $`\Delta \ge 8`$ was known (March 2026).

## 7. Verification

`python3 verify.py [GMAX]` (standard library only; default `GMAX = 60`, about 2 s; run here also with `GMAX = 150`). For each $`6 \le g \le`$ `GMAX` it builds $`M_0, M_1`$ from the formulas of Section 3 (for $`g = 6`$ from `certificates.json`) and checks: $`V(M_\varepsilon) = W_\varepsilon`$ and perfect matching; $`2g`$ distinct lengths, none 1, internal lengths exactly $`2..2g-3`$; that the $`2n`$ classes partition $`E(C_n(S))`$; $`3^{-1} = 4g+1`$; every base window is a matching of $`3g`$ edges; the two blocks built from $`X_1, X_2`$ satisfy $`V(F_j) = V(E_{j-1})`$, $`V(F'_j) = V(E_{j+5})`$, and are disjoint from each other and from $`E(G^0)`$; then for both $`\mathcal S'`$ and $`\mathcal S`$: the graph is simple, $`\Delta = 4g+1`$ resp. $`4g+2`$, the colouring is a $`(p,3)`$-colouring **checked per vertex from the definition** (cyclically sorted incident colours differ by $`\ge 3`$), and $`|E|/((n-1)/2) = p/3 = \Delta + 2/3`$. Part 2 rechecks the $`K_n - tK_2`$ colourings for $`n = 11, 15, 19, 23, 27`$ (edge set, $`F`$ a matching missing a vertex, per-vertex colouring check, $`\Delta + 1/2 \lt N/m \le p/q \lt \Delta + 1`$). Five negative controls must be rejected, and are: a $`(p,4)`$-check, two swapped classes, two bad bases passed to `check_family_B` itself ($`M_1 := M_0 + 1`$, and $`M_1`$ with two edges rewired on the same vertex set), and a duplicated block. Output ends with `ALL CHECKS PASSED`.

**Referee pass.** One independent model referee (report `review/REVIEW.md`) re-derived by hand every claim of Sections 2–5 for general $`g`$, including the three $`M_1`$ cases and $`O_g`$, the $`g = 6`$ base, the six base windows, the blocks, the degrees and the counting; checked the Mazák–Zrubák quotation against the arXiv HTML; and found **no mathematical errors**. Its points E1 (negative control (c) did not exercise `check_family_B`) and E2 (the "30 lines" remark) and the completions G1–G4 (sufficiency of $`c \in \{0..5\}`$, forward insertion form and block separation, simplicity, the collisions at $`g = 5, 6`$) have been applied in this version. Its scripts, copied to `review/` and runnable from any working directory (paths relative to the script): `indep_check.py` (own verifier sharing no code with `verify.py`; all pairs of incident edges, exact degree multisets, window sizes, for $`6 \le g \le 60`$ by default; needs **numpy**, and **networkx** for the blossom check $`\alpha' = 3g`$; arguments `GBASE GCOL GALPHA`, defaults 200 60 12), `mut_test.py` (seven mutations of `indep_check.py`, all must be rejected; same requirements), `kn_check.py` (the $`K_n - tK_2`$ certificates, all pairs; standard library), `base_small.py` (exhaustive base problem for $`g = 3..6`$: no solution for $`g \le 5`$, 32 compatible length-set pairs for $`g = 6`$; standard library), `author_mut.py` (feeds bad inputs to this folder's `check_family_B` and `check_KnF`; standard library). All were re-run here after copying and pass; the referee's `verify.py` outputs are in `review/*.out`.

An independent re-check (`/home/claude/d2mod4/indep.py`, not in this folder; uses networkx): colours assigned by the closed formula (class $`K_a`$ gets $`3a`$, shifted by 3 or 6 according to its position in $`\mathcal S`$; $`F_j \mapsto j-1`$, $`F'_j \mapsto 8+j`$), all pairs of adjacent edges checked, and $`\alpha'(G_g) = 3g`$ by maximum matching, for $`7 \le g \le 14`$: all pass.

The exploratory scripts (hole enumeration, the reduction of the even layer to two half-size problems) are in `/home/claude/d2mod4/` (`explore.py`, `pprime.py`, `pp3.py`, `pp4.py`) with a time-stamped `LOG.md`; they are not needed for the proof.

## 8. Sources

1. J. Mazák, F. Zrubák, *Circular chromatic index of small graphs*, arXiv:2603.08822v1 (9 March 2026). Quotation taken from `../circular-index-upper-half-circulants/PROOF.md` §0 (there obtained through a web-fetch tool). †
2. `../circular-index-upper-half-circulants/PROOF.md` (this project): Lemmas 1–2, the perfect-colouring framework, the insertion lemma and Family B (§7.3), the $`g = 6`$ base certificate, and the UNSAT results for $`g = 3,4,5`$ (§7.4).
3. `../circular-index-complete-minus-edges/PROOF.md`, `colourings.json` (this project): the $`(3n-1,3)`$-colourings of $`K_n - tK_2`$, $`n = 11, 15, 19, 23, 27`$, and $`\chi'_c(K_{11} - 2K_2) = 32/3`$.
4. A. Hackmann, A. Kemnitz, *The circular chromatic index*, Discrete Math. 286 (2004) 89–93 — cited by (1) for $`\chi'_c \ge |E|/\alpha'`$. † (not read; Lemma 1 is proved here.)

† = not read in the primary source in this session.
