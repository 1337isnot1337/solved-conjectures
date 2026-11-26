# Highly connected regular graphs with circular chromatic index $`\Delta + 2/3`$ for every $`\Delta \equiv 0 \pmod 4`$, $`\Delta \ge 8`$

Status: written proof with one independent model referee pass (written 2026-11-21). Theorems 1 and 2 and the regular C31/C33 examples of Section 7.2 now have complete Lean proofs, including degree, vertex connectivity, and the real circular chromatic index. Their 19-module closure passed strict source checks, an all-owned axiom audit, and stock-kernel replay; see the [landing page](README.md) and [receipt](../../docs/verification/lean-named-20261121/circular-receipt.json). Lean also verifies all 17 nonregular positive examples in Section 7.3. The additional general structural and insertion lemmas and the complete set of Section 7.4 search exclusions remain outside these receipts. [Section 7.3 verification](FORMALIZATION.md).

## 0. Context

Mazák and Zrubák, *Circular chromatic index of small graphs*, arXiv:2603.08822v1 (submitted 9 March 2026), Section 8, contains the following (quoted from the arXiv HTML version through a fetch tool; see Sources):

- "It would also be interesting to know which denominators are possible in the upper half of the interval $`[\Delta, \Delta+1]`$."
- **Problem 7.** "Does there for every integer q > 2 exist an integer p and a (multi)graph G with $`\chi'_c(G) = p/q \in (\Delta(G) + 1/2, \Delta(G) + 1)`$?"
- "Currently, for any $`\Delta \geq 8`$, we don't even know if there is a single graph with maximum degree $`\Delta`$ and $`\chi'_c \in (\Delta(G) + 1/2, \Delta(G) + 1)`$."
- **Problem 6.** "For which d does there exist a d-connected d-regular graph with circular chromatic index at least d + 1/2?" It is preceded by: 3-connected cubic graphs with $`\chi'_c = 3 + 1/2`$ have long been known (Lukoťka–Mazák), and "Theorem 9 proves the existence of a 4-connected 4-regular graph G with $`\chi'_c(G) = 4 + 1/2`$ (an infinite family of them, actually)" — namely the circulants $`C_{2n+1}(1,2)`$, $`n \ge 6`$ (their Theorem 9: "There exist infinitely many 4-connected 4-regular graphs G with $`\chi'_c(G) = 9/2`$").

The values in the open upper half that the paper lists have $`\Delta \le 6`$ (e.g. $`11/3`$ Petersen, $`14/3`$, $`19/4`$, $`23/5`$, $`17/3`$, $`23/4`$, $`20/3`$, $`27/4`$).

## 1. Statement

**Notation.** For an odd $`n`$ and $`S \subseteq \{1, \dots, (n-1)/2\}`$, the circulant $`C_n(S)`$ is the Cayley graph of $`\mathbb Z_n`$ with connection set $`\pm S`$: vertex set $`\mathbb Z_n`$, $`x \sim y`$ iff $`x - y \in \pm S`$. The *length* of an edge $`\{x,y\}`$ is the unique $`s \in \{1,\dots,(n-1)/2\}`$ with $`x - y \equiv \pm s`$. $`\alpha'(G)`$ is the matching number.

**Circular edge-colourings.** For real $`r \ge 1`$, a circular $`r`$-edge-colouring is a map $`\varphi: E(G) \to [0, r)`$ such that edges sharing a vertex get colours at circular distance $`d_r(x,y) = \min\{|x-y|, r-|x-y|\} \ge 1`$; $`\chi'_c(G)`$ is the infimum (in fact minimum) of such $`r`$ (this is the definition used by Mazák–Zrubák). For integers $`p \ge q \ge 1`$, a $`(p,q)`$-edge-colouring is a map $`c: E(G) \to \mathbb Z_p`$ such that edges sharing a vertex get colours at circular distance $`\ge q`$ in $`\mathbb Z_p`$. The *colour classes* are $`E_c = c^{-1}(c)`$.

**Theorem 1.** Let $`g \ge 2`$, $`n = 6g+1`$ and
```math
G_g = C_{6g+1}(1, 2, \dots, 2g-2,\ 2g+1,\ 3g).
```
Then $`G_g`$ is a simple $`4g`$-regular, $`4g`$-connected graph and
```math
\chi'_c(G_g) = \frac{2n}{3} = \frac{12g+2}{3} = 4g + \frac23 = \Delta(G_g) + \frac23 .
```

**Theorem 2.** The circulant $`H = C_{25}(1,2,3,7,8,9,10,11,12)`$ is a simple 18-regular, 18-connected graph with $`\chi'_c(H) = 75/4 = 18 + 3/4`$.

Smallest cases of Theorem 1: $`G_2 = C_{13}(1,2,5,6)`$ ($`\Delta = 8`$, $`\chi'_c = 26/3`$), $`G_3 = C_{19}(1,2,3,4,7,9)`$ ($`\Delta = 12`$, $`\chi'_c = 38/3`$), $`G_4 = C_{25}(1,\dots,6,9,12)`$ ($`\Delta=16`$, $`\chi'_c = 50/3`$).

## 2. Proof

### 2.1 Two general lemmas on $`\chi'_c`$

**Lemma 1 (lower bound).** If $`G`$ has at least one edge, then $`\chi'_c(G) \ge |E(G)|/\alpha'(G)`$.

*Proof.* (This is the classical bound $`\chi'_c \ge \chi'_f \ge |E|/\alpha'`$, cf. Zhu's survey and Hackmann–Kemnitz, the reference [11] of Mazák–Zrubák; here is a direct argument.) Let $`\varphi`$ be a circular $`r`$-edge-colouring ($`r \ge 1`$ by definition). For $`x \in [0,r)`$ let $`I_x = \{x + t \bmod r : 0 \le t \lt 1\}`$, a half-open circular arc of length 1 (the whole circle if $`r = 1`$). Two colours in $`I_x`$ are at circular distance $`\lt 1`$, so $`M_x = \{e : \varphi(e) \in I_x\}`$ is a matching and $`|M_x| \le \alpha'`$. Each colour lies in $`I_x`$ for a set of $`x`$ of measure exactly 1, so
```math
\int_0^r |M_x|\,dx = \sum_{e \in E} 1 = |E| \quad\Longrightarrow\quad |E| \le r\,\alpha' .
```
Hence $`r \ge |E|/\alpha'`$ for every admissible $`r`$, and the same holds for the infimum. $`\square`$

**Lemma 2 (upper bound and window form).** (a) If $`G`$ has a $`(p,q)`$-edge-colouring then $`\chi'_c(G) \le p/q`$.
(b) A map $`c: E \to \mathbb Z_p`$ is a $`(p,q)`$-edge-colouring iff for every $`c_0 \in \mathbb Z_p`$ the *window* $`E_{c_0} \cup E_{c_0+1} \cup \dots \cup E_{c_0+q-1}`$ is a matching.

*Proof.* (a) $`\varphi(e) = c(e)/q \in [0, p/q)`$ satisfies $`d_{p/q}(\varphi(e),\varphi(f)) = d_{\mathbb Z_p}(c(e),c(f))/q \ge 1`$ for adjacent $`e,f`$. (b) Two adjacent edges with colours at circular distance $`t \le q-1`$ lie in a common window (the window starting at the "earlier" of the two colours along the shorter arc), and conversely two edges in a common window have colours at circular distance $`\le q-1`$. $`\square`$

### 2.2 The graph

Let $`S_g = \{1,\dots,2g-2\} \cup \{2g+1, 3g\}`$. For $`g \ge 2`$ these $`2g`$ numbers are distinct ($`2g-2 \lt 2g+1 \lt 3g`$) and lie in $`[1, 3g] = [1, (n-1)/2]`$; as $`n`$ is odd, $`s \not\equiv -s`$, so $`\pm S_g`$ has $`4g`$ distinct non-zero elements and $`G_g`$ is a simple $`4g`$-regular graph with
```math
|E(G_g)| = \frac{n \cdot 4g}{2} = 2gn .
```
It is connected ($`1 \in S_g`$) and not complete ($`4g \lt 6g = n-1`$).

Every edge of $`G_g`$ is $`\{x, x+s\}`$ for a unique length $`s \in S_g`$, and for fixed $`s`$ the $`n`$ translates $`\{x+i, x+s+i\}`$, $`i \in \mathbb Z_n`$, are pairwise distinct: $`\{x+i,x+s+i\} = \{x+j, x+s+j\}`$ with $`i \ne j`$ would force $`x+i = x+s+j`$ and $`x+s+i = x+j`$, hence $`2s \equiv 0`$, impossible for odd $`n`$. So the edges of length $`s`$ are exactly the $`n`$ translates of any one of them.

### 2.3 Upper bound: an explicit $`(2n, 3)`$-edge-colouring

Define two sets of $`g`$ edges ("base classes"):
```math
M_0 = \{\{0, 4g\}\} \cup \{\{2g+1+i,\ 4g-i\} : 1 \le i \le g-1\},\qquad
M_1 = \{\{1, 3g+1\}\} \cup \{\{2g+1+i,\ 4g+1-i\} : 1 \le i \le g-1\}.
```

*Vertex sets.* $`\{2g+1+i : 1 \le i \le g-1\} = [2g+2, 3g]`$, $`\{4g-i\} = [3g+1, 4g-1]`$, $`\{4g+1-i\} = [3g+2, 4g]`$. Hence the vertex sets of $`M_0`$, $`M_1`$ are
```math
V_0 = \{0\} \cup [2g+2,\ 4g], \qquad V_1 = \{1\} \cup [2g+2,\ 4g]
```
(intervals of integers, all inside $`[0, n-1]`$). Each has $`2g`$ elements and $`M_\varepsilon`$ has $`g`$ edges, so $`M_0`$, $`M_1`$ are matchings.

*Lengths.* In $`M_0`$: $`\{0,4g\}`$ has length $`n - 4g = 2g+1`$; $`\{2g+1+i, 4g-i\}`$ has difference $`2g-1-2i`$, i.e. lengths $`2g-3, 2g-5, \dots, 1`$ (all odd numbers in $`[1, 2g-3]`$). In $`M_1`$: $`\{1, 3g+1\}`$ has length $`3g`$; $`\{2g+1+i, 4g+1-i\}`$ has difference $`2g-2i`$, i.e. lengths $`2g-2, \dots, 2`$ (all even numbers in $`[2,2g-2]`$). So the $`2g`$ base edges have pairwise distinct lengths and their lengths are exactly $`S_g`$.

*Classes.* Index classes by $`a \in \mathbb Z_{2n}`$, writing $`a = 2i + \varepsilon`$ with $`\varepsilon \in \{0,1\}`$, $`i \in \mathbb Z_n`$ (this is a bijection $`\mathbb Z_{2n} \to \{0,1\} \times \mathbb Z_n`$, and $`a + 2k \mapsto (\varepsilon, i+k)`$):
```math
\mathrm{class}(2i+\varepsilon) = M_\varepsilon + i .
```
By 2.2, for each $`s \in S_g`$ the $`n`$ classes $`M_\varepsilon + i`$ ($`\varepsilon`$ the parity class containing the base edge of length $`s`$) contain the $`n`$ distinct edges of length $`s`$; thus **the $`2n`$ classes partition $`E(G_g)`$**, each edge lying in exactly one class ($`2n \cdot g = |E|`$ confirms the count). Each class is a matching (a translate of $`M_\varepsilon`$).

*Colours.* Since $`3 \nmid 2n`$ ($`n = 6g+1`$), $`a \mapsto 3a`$ is a bijection of $`\mathbb Z_{2n}`$; colour every edge of $`\mathrm{class}(a)`$ with $`c = 3a \bmod 2n`$. As $`3(4g+1) = 2n+1`$, we have $`3^{-1} \equiv 4g+1 \pmod{2n}`$: colour $`c+1`$ is carried by class $`a + (4g+1)`$ and colour $`c+2`$ by class $`a + (8g+2)`$.

*Window condition.* By Lemma 2(b) with $`q = 3`$, and since each class is a matching, we must show that for every $`a`$ the classes $`a`$, $`a + (4g+1)`$, $`a+(8g+2)`$ are pairwise vertex-disjoint; as $`a`$ ranges over all of $`\mathbb Z_{2n}`$ it suffices that for all $`a`$
```math
V(\mathrm{class}(a)) \cap V(\mathrm{class}(a+4g+1)) = \emptyset \quad\text{and}\quad V(\mathrm{class}(a)) \cap V(\mathrm{class}(a+8g+2)) = \emptyset
```
(the pair $`(a+4g+1, a+8g+2)`$ is the first condition at $`a' = a+4g+1`$).

Reduction to translates, with $`a = 2i+\varepsilon`$:
- $`4g+1`$ is odd. If $`\varepsilon = 0`$: $`a + 4g+1 = 2(i+2g) + 1`$, class $`M_1 + i + 2g`$. Condition: $`(V_0 + i) \cap (V_1 + i + 2g) = \emptyset`$, i.e. **(C1)** $`V_0 \cap (V_1 + 2g) = \emptyset`$. If $`\varepsilon = 1`$: $`a + 4g + 1 = 2(i + 2g + 1)`$, class $`M_0 + i + 2g + 1`$. Condition **(C2)** $`V_1 \cap (V_0 + 2g + 1) = \emptyset`$.
- $`8g+2`$ is even: $`a + 8g + 2 = 2(i + 4g + 1) + \varepsilon`$, class $`M_\varepsilon + i + 4g+1`$. Condition $`V_\varepsilon \cap (V_\varepsilon + 4g+1) = \emptyset`$. Since $`4g + 1 \equiv -2g \pmod n`$, this is $`V_\varepsilon \cap (V_\varepsilon - 2g) = \emptyset`$, equivalently (translate by $`2g`$) **(C3)** $`V_0 \cap (V_0 + 2g) = \emptyset`$ and **(C4)** $`V_1 \cap (V_1 + 2g) = \emptyset`$.

Checks (all integers below are in $`[0, 6g]`$ unless reduced):
- (C1) $`V_1 + 2g = \{2g+1\} \cup [4g+2, 6g]`$. $`V_0 = \{0\} \cup [2g+2, 4g]`$: $`0 \notin`$, $`2g+1 \lt 2g+2`$, $`4g \lt 4g+2`$. Disjoint.
- (C2) $`V_0 + 2g + 1 = \{2g+1\} \cup [4g+3, 6g+1] = \{0, 2g+1\} \cup [4g+3, 6g]`$ (as $`6g+1 \equiv 0`$). $`V_1 = \{1\} \cup [2g+2, 4g]`$: $`1 \notin \{0, 2g+1\} \cup [4g+3,6g]`$, and $`[2g+2, 4g]`$ misses $`0`$, $`2g+1`$ and $`[4g+3, 6g]`$. Disjoint.
- (C3) $`V_0 + 2g = \{2g\} \cup [4g+2, 6g]`$ versus $`\{0\} \cup [2g+2, 4g]`$. Disjoint.
- (C4) $`V_1 + 2g = \{2g+1\} \cup [4g+2, 6g]`$ versus $`\{1\} \cup [2g+2, 4g]`$ ($`2g+1 \ne 1`$). Disjoint.

Hence $`c`$ is a $`(2n,3)`$-edge-colouring of $`G_g`$ and, by Lemma 2(a), $`\chi'_c(G_g) \le 2n/3`$.

(Remark: each window consists of three classes with $`2g`$ vertices each, i.e. it is a matching of size $`3g`$ covering all vertices but one. This is exactly the equality case of the averaging in Lemma 1.)

### 2.4 Lower bound and conclusion

$`n`$ is odd, so $`\alpha'(G_g) \le (n-1)/2 = 3g`$; the edges $`\{2j, 2j+1\}`$, $`0 \le j \lt 3g`$, have length $`1 \in S_g`$ and form a matching of size $`3g`$, so $`\alpha'(G_g) = 3g`$. By Lemma 1,
```math
\chi'_c(G_g) \ \ge\ \frac{2gn}{3g} = \frac{2n}{3} .
```
Together with 2.3, $`\chi'_c(G_g) = 2n/3 = 4g + 2/3`$. (Of course also $`\chi'_f(G_g) = 2n/3`$.)

### 2.5 Connectivity

Let $`G`$ be a connected, non-complete graph with vertex connectivity $`\kappa`$. For $`F \subseteq V`$ put $`N(F) = \{v \notin F : v \text{ has a neighbour in } F\}`$ and $`\bar F = V \setminus (F \cup N(F))`$. If $`F \ne \emptyset \ne \bar F`$ then $`N(F)`$ separates $`F`$ from $`\bar F`$, so $`|N(F)| \ge \kappa`$.

**Definition.** A *fragment* is a set $`F`$ with $`F \ne \emptyset`$, $`\bar F \ne \emptyset`$ and $`|N(F)| = \kappa`$. An *atom* is a fragment of minimum cardinality; this cardinality is denoted $`\alpha_0`$. (Fragments exist: for a minimum separator $`T`$ and a component $`F`$ of $`G - T`$, $`N(F) \subseteq T`$ and $`\bar F \supseteq V \setminus (F \cup T) \ne \emptyset`$, so $`|N(F)| = \kappa`$.)

Two facts used below: (i) if $`F`$ is a fragment then so is $`\bar F`$, with $`N(\bar F) = N(F)`$ and $`\bar{\bar F} = F`$ — indeed no vertex of $`\bar F`$ is adjacent to $`F`$, so $`N(\bar F) \subseteq N(F)`$, and $`F`$ lies outside $`\bar F \cup N(\bar F)`$, so $`|N(\bar F)| \ge \kappa`$; in particular $`|\bar F| \ge \alpha_0`$. (ii) If $`\{x\}`$ is an atom then $`\kappa = |N(\{x\})| = \deg x`$.

**Lemma 3 (Watkins 1970; Mader).** Distinct atoms are disjoint.

*Proof (included for completeness).* Let $`A, B`$ be atoms with $`A \cap B \ne \emptyset`$. Partition $`V`$ by the rows $`R_1 = A`$, $`R_2 = N(A)`$, $`R_3 = \bar A`$ and the columns $`C_1 = B`$, $`C_2 = N(B)`$, $`C_3 = \bar B`$; let $`X_{jk} = R_j \cap C_k`$ and $`x_{jk} = |X_{jk}|`$. A neighbour of a vertex of $`A`$ lies in $`R_1 \cup R_2`$, a neighbour of a vertex of $`\bar A`$ in $`R_2 \cup R_3`$, and similarly for columns. Hence
```math
N(X_{11}) \subseteq X_{12} \cup X_{21} \cup X_{22},\quad N(X_{33}) \subseteq X_{23} \cup X_{32} \cup X_{22},\quad
N(X_{13}) \subseteq X_{12} \cup X_{22} \cup X_{23},\quad N(X_{31}) \subseteq X_{21} \cup X_{22} \cup X_{32},
```
and in each case the "opposite corner" ($`X_{33}`$ for $`X_{11}`$, $`X_{31}`$ for $`X_{13}`$, …) lies outside $`X \cup N(X)`$. Put $`s = x_{12}+x_{21}+x_{22}`$, $`t = x_{23}+x_{32}+x_{22}`$; then $`s + t = |N(A)| + |N(B)| = 2\kappa`$; likewise $`u = x_{12}+x_{22}+x_{23}`$ and $`v = x_{21}+x_{22}+x_{32}`$ satisfy $`u + v = 2\kappa`$.

If $`s \le \kappa`$: $`X_{11} \ne \emptyset`$ and $`\bar A \ne \emptyset`$ lies outside $`X_{11} \cup N(X_{11})`$, so $`\kappa \le |N(X_{11})| \le s \le \kappa`$ and $`X_{11}`$ is a fragment; $`|X_{11}| \ge \alpha_0 = |A| = |B|`$ forces $`A = X_{11} = B`$.

If $`s \gt \kappa`$, then $`t \lt \kappa`$. If $`X_{33} \ne \emptyset`$, then $`X_{11} \ne \emptyset`$ lies outside $`X_{33} \cup N(X_{33})`$, so $`\kappa \le |N(X_{33})| \le t \lt \kappa`$, impossible; so $`X_{33} = \emptyset`$. From $`t \lt \kappa = |N(A)| = x_{21}+x_{22}+x_{23}`$ we get $`x_{32} \lt x_{21} \le |B| - x_{11} \lt \alpha_0`$, and from $`t \lt \kappa = |N(B)| = x_{12}+x_{22}+x_{32}`$ we get $`x_{23} \lt x_{12} \lt \alpha_0`$. Now $`\bar A = X_{31} \cup X_{32}`$ and $`|\bar A| \ge \alpha_0 \gt x_{32}`$ by (i), so $`X_{31} \ne \emptyset`$; likewise $`\bar B = X_{13} \cup X_{23}`$ gives $`X_{13} \ne \emptyset`$. Each of $`X_{13}, X_{31}`$ lies outside the other's closed neighbourhood, so $`|N(X_{13})|, |N(X_{31})| \ge \kappa`$, while $`|N(X_{13})| + |N(X_{31})| \le u + v = 2\kappa`$. Hence $`|N(X_{13})| = \kappa`$, $`X_{13}`$ is a fragment contained in $`A`$, so $`X_{13} = A`$, contradicting $`X_{11} \ne \emptyset`$. $`\square`$

**Lemma 4 (atoms of Cayley graphs; cf. Hamidoune 1977).** Let $`G = \mathrm{Cay}(\Gamma, T)`$ be a connected non-complete Cayley graph of a finite group $`\Gamma`$ (here $`\Gamma = \mathbb Z_n`$, written additively). Then the atom containing $`0`$ exists, is unique, and is a subgroup of $`\Gamma`$.

*Proof.* Automorphisms map fragments to fragments and atoms to atoms. Translations $`x \mapsto x + h`$ are automorphisms. If $`A'`$ is any atom and $`a \in A'`$, then $`A' - a`$ is an atom containing $`0`$; by Lemma 3 it is the unique one, call it $`A`$. For $`h \in A`$, $`A - h`$ is an atom containing $`0`$, so $`A - h = A`$. Thus $`a - h \in A`$ for all $`a, h \in A`$, and $`A \ni 0`$ is a subgroup. $`\square`$

(Lemma 3 says the atoms form a system of blocks of imprimitivity of $`\mathrm{Aut}(G)`$ when $`G`$ is vertex-transitive — Watkins' theorem; Lemma 4 is the special case of a regular subgroup.)

**Proposition 5.** $`\kappa(G_g) = 4g`$ for every $`g \ge 2`$.

*Proof.* Let $`H`$ be the atom containing $`0`$; by Lemma 4, $`H = d'\mathbb Z_n`$ for a divisor $`d'`$ of $`n`$, of index $`d'`$ and order $`n/d'`$. $`d' = 1`$ is impossible ($`\bar H`$ would be empty).
- If $`2 \le d' \le 2g-1`$: the cosets of $`H`$ are $`H + j`$, $`0 \le j \le d'-1`$, and every $`j \in [1, d'-1] \subseteq [1, 2g-2] \subseteq S_g`$. So every $`x \notin H`$ is $`h + j`$ with $`h \in H`$, $`j \in S_g`$, hence adjacent to $`h`$: $`H \cup N(H) = \mathbb Z_n`$, $`\bar H = \emptyset`$, contradicting that $`H`$ is a fragment.
- If $`d' \ge 2g`$: $`|H| = n/d' \le (6g+1)/(2g) \lt 4`$, and $`|H|`$ divides $`n = 6g+1`$, which is odd and $`\equiv 1 \pmod 3`$; hence $`|H| = 1`$.

So $`H = \{0\}`$ is an atom and $`\kappa = \deg 0 = 4g`$ by (ii). $`\square`$

(Edge connectivity is then also $`4g`$, as $`\kappa \le \lambda \le \delta`$.)

This completes the proof of Theorem 1. $`\blacksquare`$

### 2.6 Proof of Theorem 2 ($`\Delta = 18`$)

$`H = C_{25}(S)`$, $`S = \{1,2,3,7,8,9,10,11,12\}`$: nine distinct lengths in $`[1,12]`$, so $`H`$ is simple, 18-regular, $`|E| = 225`$. By 2.2-type reasoning, the edges of each length form one translation orbit of size 25.

*Colouring* (found by `search/cyc2.py`: `python3 search/cyc2.py 100 12,3`). Base classes (each a matching of 3 edges):
```math
B_0 = \{\{0,1\},\{2,9\},\{10,24\}\},\quad B_1 = \{\{0,2\},\{1,10\},\{11,24\}\},\quad B_2 = \{\{0,3\},\{1,11\},\{2,10\}\}
```
with lengths $`\{1,7,11\}`$, $`\{2,9,12\}`$, $`\{3,10,8\}`$ — together exactly $`S`$, each once. Vertex sets $`W_0 = \{0,1,2,9,10,24\}`$, $`W_1 = \{0,1,2,10,11,24\}`$, $`W_2 = \{0,1,2,3,10,11\}`$. For $`a \in \mathbb Z_{75}`$ write $`a = 3s + r`$, $`r \in \{0,1,2\}`$, $`s \in \mathbb Z_{25}`$, and put $`\mathrm{class}(a) = B_r + s`$, coloured $`4a \bmod 75`$ ($`\gcd(4,75) = 1`$). The 75 classes partition $`E(H)`$ (each length occurs in exactly one $`B_r`$, and its 25 translates are distinct).

$`4^{-1} \equiv 19 \pmod{75}`$, so a window of 4 consecutive colours is $`\{\mathrm{class}(a), \mathrm{class}(a+19), \mathrm{class}(a+38), \mathrm{class}(a+57)\}`$. With $`19 = 3\cdot 6 + 1`$, $`38 = 3 \cdot 12 + 2`$, $`57 = 3 \cdot 19`$, the condition "class $`a`$ disjoint from class $`a + 19t`$ for $`t = 1,2,3`$ and all $`a`$" becomes $`W_r \cap (W_{r'} + \delta) = \emptyset`$ for the nine triples $`(r, r', \delta)`$:
```math
(0,1,6),\ (1,2,6),\ (2,0,7),\ (0,2,12),\ (1,0,13),\ (2,1,13),\ (0,0,19),\ (1,1,19),\ (2,2,19).
```
Check: $`W_1+6 = \{5,6,7,8,16,17\}`$, $`W_2+6 = \{6,7,8,9,16,17\}`$, $`W_0+7 = \{6,7,8,9,16,17\}`$, $`W_2+12 = \{12,13,14,15,22,23\}`$, $`W_0+13 = \{12,13,14,15,22,23\}`$, $`W_1+13 = \{12,13,14,15,23,24\}`$, $`W_0+19 = \{3,4,18,19,20,21\}`$, $`W_1+19 = \{4,5,18,19,20,21\}`$, $`W_2+19 = \{4,5,19,20,21,22\}`$, and each is disjoint from the corresponding $`W_r`$ (first entry of the triple): e.g. $`W_2+6 \ni 9 \notin W_1`$, $`W_0+7 \ni 9 \notin W_2`$, $`W_1+13 \ni 24 \notin W_2`$, $`W_0+19 \ni 3 \notin W_0`$, and all other elements of the nine translates lie in $`[4,8] \cup [12,23]`$, which no $`W_r`$ meets. So this is a $`(75,4)`$-edge-colouring and $`\chi'_c(H) \le 75/4`$. Lower bound: $`\alpha'(H) = 12`$ (matching $`\{2j,2j+1\}`$), $`225/12 = 75/4`$.

*Connectivity.* The subgroups of $`\mathbb Z_{25}`$ are $`\{0\}, 5\mathbb Z_{25}, \mathbb Z_{25}`$. For $`5\mathbb Z_{25}`$: $`S \bmod 5 \supseteq \{1,2,3,4\}`$ ($`1, 2, 3, 9`$), so every non-zero coset is met by $`S`$ and, as in Proposition 5, it is not a fragment. Hence the atom at $`0`$ is $`\{0\}`$ and $`\kappa(H) = 18`$. $`\blacksquare`$

## 3. Consequences for the questions of Mazák–Zrubák

**The remark "for any $`\Delta \ge 8`$ we don't even know a single graph".** Answered for every $`\Delta \equiv 0 \pmod 4`$ with $`\Delta \ge 8`$ (Theorem 1, value $`\Delta + 2/3`$) and for $`\Delta = 18`$ (Theorem 2, value $`\Delta + 3/4`$). The graphs are simple, regular, and of connectivity $`\Delta`$. For $`\Delta \ge 8`$ with $`\Delta \not\equiv 0 \pmod 4`$, $`\Delta \ne 18`$, Theorems 1–2 give nothing; Section 7 (computer-certified, not a general proof) adds the non-regular cases $`\Delta = 21`$ and $`\Delta \in \{4g+1, 4g+2 : 6 \le g \le 13\}`$ and the regular case $`\Delta = 24`$, value $`\Delta + 3/4`$.

**Problem 6.** Read literally ("at least $`d + 1/2`$", upper end $`d+1`$ allowed), Problem 6 is trivially answered for every even $`d`$ by $`K_{d+1}`$ (which is $`d`$-connected and has $`\chi'_c = d+1`$, as Mazák–Zrubák themselves note in Section 4; they also note that $`C_7(1,2)`$ is 4-connected with $`\chi'_c = 5`$). The non-trivial reading, suggested by the context (the cited examples have $`\chi'_c = d + 1/2`$ exactly, and the paper is about values strictly below $`\Delta + 1`$), asks for $`\chi'_c \in [d + 1/2, d+1)`$. For that reading Theorems 1–2 give an affirmative answer for $`d \in \{8, 12, 16, 20, \dots\} \cup \{18\}`$, with $`\chi'_c - d \in \{2/3, 3/4\}`$, strictly inside $`(1/2, 1)`$ (Section 7.2 adds a second $`d = 18`$ example, $`C_{31}(1,2,3,7,\dots,12)`$ with $`\chi'_c = 93/5`$). The context also supports a third reading, $`\chi'_c = d + 1/2`$ *exactly* (the cited examples for $`d = 3, 4`$ have exactly this value). **Theorems 1–2 do not answer that reading**: our values are $`d + 2/3`$, $`d + 3/4`$, $`d + 3/5`$, never $`d + 1/2`$; it remains open here for every $`d \ge 5`$. Known before (per the paper): $`d = 3, 4`$. Open (as far as this note goes): odd $`d \ge 5`$ and even $`d \ge 6`$ with $`d \not\equiv 0 \pmod 4`$, $`d \ne 18`$. Note that for odd $`d`$ a $`d`$-regular graph has even order, so the overfull mechanism used here (odd order) is unavailable.

**Problem 7 (simple graphs).** Our denominators are $`q = 3`$ (all $`\Delta \equiv 0 \bmod 4`$, $`\Delta \ge 8`$) and $`q = 4`$ ($`\Delta = 18`$); the paper already has $`q = 3, 4, 5`$ (at $`\Delta \le 6`$). What is new is that $`q = 3`$ is realised with arbitrarily large $`\Delta`$ by simple, regular, maximally connected graphs, and $`q = 4`$ at $`\Delta = 18`$. In addition (Section 7.2, computer-certified, checked by the referee), $`C_{31}(1,2,3,7,8,9,10,11,12)`$ is 18-regular, 18-connected with $`\chi'_c = 93/5 = \Delta + 3/5`$: denominator 5 for a simple regular graph (the paper has $`q = 5`$ only as $`23/5`$, for multigraphs with $`\Delta = 4`$). This still says nothing about $`q \ge 6`$.

**A general remark (elementary).** If $`G`$ is $`\Delta`$-regular of odd order $`n`$ then Lemma 1 gives $`\chi'_c(G) \ge \Delta n/(n-1) = \Delta + \Delta/(n-1)`$, which is $`\gt \Delta + 1/2`$ as soon as $`n \le 2\Delta`$; and $`\chi'_c \le \chi' \le \Delta + 1`$ (Vizing). So dense odd-order regular graphs automatically have $`\chi'_c`$ in the closed upper half; the whole difficulty is to show $`\chi'_c \lt \Delta + 1`$ (e.g. $`K_{\Delta+1}`$ has $`\chi'_c = \Delta+1`$). The constructions above do this by exhibiting a colouring meeting the fractional bound exactly ("perfect" colouring: every window of $`q`$ consecutive classes is a near-perfect matching).

## 4. What is new

- An explicit infinite family of simple $`\Delta`$-regular, $`\Delta`$-connected circulants with $`\chi'_c = \Delta + 2/3`$, one for every $`\Delta \equiv 0 \pmod 4`$, $`\Delta \ge 8`$; plus one with $`\Delta = 18`$, $`\chi'_c = \Delta + 3/4`$. According to Mazák–Zrubák (March 2026) no graph with $`\Delta \ge 8`$ and $`\chi'_c \in (\Delta + 1/2, \Delta+1)`$ was known. We did not perform an exhaustive literature search beyond that paper and a few web searches (which found nothing more recent on this question).
- The proof method: "perfect" circular colourings in which every window of $`q`$ consecutive colour classes misses exactly one vertex, so that the trivial lower bound $`|E|/\alpha'`$ is attained; for circulants these can be sought with a cyclic ansatz (classes indexed by $`\mathbb Z_p`$, translation-equivariant).
- Nothing new is claimed about atoms or connectivity; Lemmas 3–4 are classical and reproved only for completeness.

## 5. Verification

`verify.py` (standard library only; run `python3 verify.py`, about 0.3 s) checks, for $`g = 2,\dots,30`$: the circulant is simple and $`4g`$-regular; the $`2n`$ classes partition the edge set (each edge exactly once); $`a \mapsto 3a`$ is a bijection of $`\mathbb Z_{2n}`$ and $`3(4g+1) \equiv 1`$; every class is a matching; the colouring is a $`(2n,3)`$-colouring, checked both per vertex (cyclically sorted incident colours differ by $`\ge 3`$) and per window (every 3 consecutive classes are pairwise vertex-disjoint); the matching $`\{2j,2j+1\}`$ exists, so $`\alpha' = (n-1)/2`$, and $`|E|/\alpha' = 2n/3 = p/q`$. Vertex connectivity is computed by its own max-flow routine (vertex splitting, BFS augmenting paths): $`\kappa(G_g) = 4g`$ for $`g = 2,3,4`$ over all non-adjacent pairs and for $`g = 5,\dots,8`$ over pairs $`(0,t)`$ (sufficient by vertex-transitivity). The same checks are made for Theorem 2 ($`(75,4)`$-colouring, $`|E|/\alpha' = 75/4`$, $`\kappa = 18`$ over all pairs). Output ends with `ALL CHECKS PASSED`. The max-flow routine was cross-checked against `networkx.node_connectivity` on seven circulants (outside `verify.py`).

**Referee pass.** One independent model referee (report `review/REVIEW.md`) checked by hand: Lemmas 1–2; the classes, lengths and partition in 2.3; $`3^{-1} \equiv 4g+1`$ and the reduction to (C1)–(C4) and each of (C1)–(C4); $`\alpha' = 3g`$; Lemma 3 line by line, Lemma 4, Proposition 5 and the atom arguments for $`\mathbb Z_{25}, \mathbb Z_{31}, \mathbb Z_{33}`$; the nine translate conditions of Theorem 2; (C1)–(C4) for the Family B vertex sets; the Section 7 lemmas; the quotations from Mazák–Zrubák. Independent computations (own code, networkx for $`\alpha'`$ and $`\kappa`$, not importing ours): Theorem 1 colourings for $`g = 2..40`$ ($`\alpha'`$ by max-matching for $`g \le 12`$), $`\kappa(G_g) = 4g`$ for $`g = 2..7`$, $`\kappa = 18, 18, 24`$ for $`C_{25}, C_{31}, C_{33}`$, $`\kappa(C_7(1,2)) = 4`$; all Part 2 certificates rebuilt with $`\Delta`$, $`\delta`$, $`\alpha'`$ and $`|E|/\alpha' = p/q`$; exhaustive confirmation that the Family B base problem is unsolvable for $`g = 3,4,5`$ and solvable for $`g = 6`$; brute-force confirmation of UNSAT for cyclic $`(q,r,g) = (4,3,1), (5,3,1), (5,4,1)`$ (the other UNSAT claims of 7.4 were not re-checked); 60 random insertions (both forms) into Family B bases passed and 60 negative controls failed. **No errors were found**; the gaps it listed (mirror form, edge-disjointness for several insertions, wording in 7.1, the reading $`\chi'_c = d + 1/2`$ of Problem 6, mention of $`C_{31}`$ in Section 3) are fixed in this version. Its scripts are in `review/`: `check.py` (networkx + standard library; run `python3 check.py fam|kappa|part2`) and `extra.py` (imports `check.py`; standard library otherwise; run `python3 extra.py famB|g1`, and its function `insertion_famB()` for the insertion tests); both read the certificate file `data/part2_certificates.json` by a path relative to their own folder. All of these were re-run successfully here.

## 6. Sources

Marks: † = read only through a summary/snippet (fetch tool or secondary source), not the primary text.

1. J. Mazák, F. Zrubák, *Circular chromatic index of small graphs*, arXiv:2603.08822v1, 9 March 2026, https://arxiv.org/abs/2603.08822 . Quotes above were obtained from the HTML version through a web-fetch tool that returns short verbatim excerpts; they were not compared with the PDF character by character. †(partially)
2. A. Hackmann, A. Kemnitz, *The circular chromatic index*, Discrete Math. 286 (2004) 89–93 — reference [11] of (1), cited there for $`\chi'_c \ge |E|/\alpha'`$. † (not read; Lemma 1 is proved here directly)
3. X. Zhu, *Circular chromatic number: a survey*, Discrete Math. 229 (2001) 371–410, doi:10.1016/S0012-365X(00)00217-X. † (bibliographic data only; standard facts $`\chi_f \le \chi_c`$, $`\chi_c`$ attained by a $`(k,d)`$-colouring; not needed for the proof)
4. A. Vince, *Star chromatic number*, J. Graph Theory 12 (1988) 551–559. † (origin of $`(k,d)`$-colourings; not needed)
5. M. E. Watkins, *Connectivity of transitive graphs*, J. Combin. Theory 8 (1970) 23–29, doi:10.1016/S0021-9800(70)80005-9. † — its Theorem "in a connected vertex-transitive graph, distinct atoms are vertex-disjoint" is as stated in D. W. Morris et al.'s note https://www.cs.uleth.ca/~morris/Research/SpecialFamily.pdf (Theorem 1.1 there, attributed to Watkins). Lemma 3 above is proved independently.
6. W. Mader — the atom lemma is often attributed jointly to Mader (early 1970s, Arch. Math.). † (exact reference not verified)
7. Y. O. Hamidoune, *Sur les atomes d'un graphe orienté*, C. R. Acad. Sci. Paris Sér. A 284 (1977) 1253–1256 (bibliographic data from the reference list of arXiv:math/0603504). † (content not read; Lemma 4 is proved here directly)
8. M.-Z. quote Lukoťka–Mazák, *Cubic graphs with given circular chromatic index* (2010), for the $`d = 3`$ case of Problem 6. †

## 7. Further searches (Part 2; computer-certified examples, no new general theorem)

All statements here are verified by `verify_part2.py` (standard library; reads `data/part2_certificates.json`; prints `ALL PART 2 CHECKS PASSED`). "Perfect" colouring: a $`(p,q)`$-colouring of a graph of odd order $`n = 2m+1`$ in which every window of $`q`$ consecutive classes is a matching of size $`m`$; then $`\chi'_c = |E|/m = p/q`$ exactly by Lemmas 1–2. Search scripts are in `search/` (SAT via python-sat/CaDiCaL; work log `search/LOG.md`).

**7.1 A structural lemma (proved, elementary).** In a perfect $`(p,q)`$-colouring let $`x_c`$ be the vertex missed by window $`c`$. Since window $`c+1`$ = window $`c`$ minus class $`c`$ plus class $`c+q`$, we get $`V(E_{c+q}) = (V(E_c) \cup \{x_c\}) \setminus \{x_{c+1}\}`$. In the cyclic ansatz of `search/cyc2.py` (class$`(a+r)`$ = class$`(a)+1`$, colour $`qa`$) colour $`c+q`$ corresponds to $`a+1`$, so consecutive base vertex sets differ by at most one exchanged vertex, and after $`r`$ steps $`|(W_0 + 1) \setminus W_0| \le r`$ (at most $`r`$ exchanges). Since for $`\emptyset \ne W \ne \mathbb Z_n`$ the number of maximal cyclic runs of $`W`$ equals $`|\{x \in W : x+1 \notin W\}| = |(W+1) \setminus W|`$: **each base vertex set is a union of at most $`r`$ cyclic intervals.** Adding these implied constraints sped the SAT search up by about two orders of magnitude (e.g. $`q=4,g=3`$: 8.5 s to 0.1 s).

**7.2 New regular examples (cyclic ansatz), all with $`\kappa = \Delta`$ (atom argument of 2.5, and max-flow):**
- $`C_{31}(1,2,3,7,8,9,10,11,12)`$: 18-regular, $`\chi'_c = 93/5 = \Delta + 3/5`$. **Denominator 5 with a simple regular graph** ($`\Delta = 18`$); Mazák–Zrubák have $`q = 5`$ only for multigraphs with $`\Delta = 4`$ ($`23/5`$). Base classes $`B_0=\{\{0,11\},\{1,2\},\{3,10\}\}`$, $`B_1=\{\{0,3\},\{1,11\},\{2,10\}\}`$, $`B_2=\{\{0,12\},\{1,3\},\{2,11\}\}`$, class$`(3s+\rho) = B_\rho + s`$, colour $`5a \bmod 93`$. ($`n = 31`$ is prime, so $`\kappa = 18`$ by Lemma 4.) Note: same connection set as Theorem 2 but on 31 vertices.
- $`C_{33}(1,2,3,4,5,9,10,\dots,15)`$: 24-regular, $`\chi'_c = 99/4`$ (also covered by Theorem 1 as $`\Delta \equiv 0 \bmod 4`$, but with $`q = 4`$).

**7.3 Non-regular examples, $`\Delta \not\equiv 0 \pmod 4`$ (remark "$`\Delta \ge 8`$").** *Insertion lemma (proved):* if $`E_0,\dots,E_{p-1}`$ is a perfect $`(p,q)`$-colouring of $`G`$ and $`F_1,\dots,F_q`$ are matchings of the complement of $`G`$ with $`V(F_j) = V(E_{c+j-1})`$, then inserting $`F_1,\dots,F_q`$ before colour $`c`$ gives a perfect $`(p+q,q)`$-colouring of $`G + F_1 + \dots + F_q`$ (every new window is, as a family of vertex sets, a permutation of an old window). *Mirror form:* the same holds if instead $`V(F_j) = V(E_{c-q+j-1})`$, i.e. the block copies the $`q`$ classes *before* the insertion point; proof: reversing the colour order $`c \mapsto -c`$ maps perfect $`(p,q)`$-colourings to perfect $`(p,q)`$-colourings and exchanges the two forms. *Several insertions at once:* if insertion points are separated by at least $`q-1`$ old classes, no window meets two blocks, so the window structure is preserved; for the result to be a **simple** graph the blocks must in addition be pairwise edge-disjoint (each later block consists of matchings in the complement of $`G`$ plus the earlier blocks). Each insertion raises all degrees but one by 1. *Family B:* $`n = 6g+1`$, base $`(2n,3)`$-colouring with the cyclic ansatz and $`W_0 = \{0,1\} \cup [2g+3,4g]`$, $`W_1 = \{1,2\} \cup [2g+3,4g]`$ (these satisfy the four window conditions (C1)–(C4) of 2.3, checked by hand as there), and base graph without edges of length 1. Then the windows starting at colours 0 and 6 consist of unions of intervals of even length, perfectly matched by the length-1 edges $`\{x,x+1\}`$ with $`x \in \{0\}\cup\{3,5,\dots,6g-1\}`$, resp. $`x \in \{1\}\cup\{4,6,\dots,6g\}`$ (disjoint sets of $`x`$, so the two blocks are edge-disjoint, as the several-insertions hypothesis requires; the insertion points are 6 classes apart), giving $`\Delta = 4g+1`$ and $`4g+2`$ with $`\chi'_c = \Delta + 2/3`$. The only missing ingredient for a theorem for all $`g`$ is the **base matching problem**: perfect matchings of $`W_0`$ and $`W_1`$ with $`2g`$ pairwise distinct lengths, none equal to 1 (a Skolem/Langford-type problem; internal lengths must be exactly $`\{2,\dots,2g-3\}`$). Solved by SAT for $`6 \le g \le 13`$ (certificates stored); UNSAT for $`g = 3,4,5`$; $`g = 14,15,16`$ not solved within 60 s; no uniform construction found yet (the obvious nested choices fail, checked by hand). Certified values: $`\Delta \in \{25,26,29,30,\dots,53,54\}`$ (all $`\Delta \equiv 1,2 \bmod 4`$ in $`[25,54]`$). Separately, a generalised insertion search gave a graph with $`\Delta = 21`$, $`n = 31`$, $`\chi'_c = 65/3`$; its block (inserted before colour 0) copies the vertex sets of colours 59, 60, 61 of the base, so it is an instance of the **mirror form** of the insertion lemma (it is also checked directly as a perfect $`(65,3)`$-colouring by `verify_part2.py`).

**7.4 Exhaustively excluded (UNSAT, cyclic ansatz with $`0 \in W_0`$, i.e. complete up to translation):** $`(q,r,g)`$ = (4,3,1), (4,3,2), (5,3,1), (5,4,1), (5,3,2), (5,4,2), (5,4,3), (6,5,1), (6,5,2), (7,4,1), (7,5,1), (7,6,1), (7,5,2), (8,5,1), (8,7,1), (9,5,1), (9,7,1), (9,8,1); undecided in 300 s: (7,4,2), (7,6,2), (8,5,2). Insertion into cyclic $`q=3`$ bases (one block, inserted vertex sets free): UNSAT for $`g = 2,3,4`$ (so no such graph for $`\Delta = 9, 13, 17`$ of this form); $`g = 5`$: $`D = 2, 3`$ UNSAT with blocks 3 colours apart; Family B with $`D = 3`$: UNSAT for $`g = 6, 7`$ (blocks 6 apart); one block on the $`q=4,g=3`$ base ($`\Delta = 19`$): UNSAT. $`K_{2m+1}`$ minus (near-perfect matching + one edge), single-edge classes, value $`\Delta + (m-1)/m`$: no perfect colouring for $`m = 3, 4`$. A fully general SAT search for $`n = 13`$, value $`29/3`$ ($`\Delta = 9`$) did not finish in 200 s.

**Still open after this work, for simple graphs:** the denominator question for $`q \ge 6`$; $`\Delta \equiv 3 \pmod 4`$ (no example found); $`\Delta \in \{9,10,11,13,14,15,17,19,22,23\}`$; Problem 6 (non-trivial reading) for $`d \not\equiv 0 \bmod 4`$, $`d \ne 18`$.


### Problem 7: Multigraph qualification

The [literal formulation of Problem 7](https://arxiv.org/html/2603.08822v1#S8) permits multigraphs. Let $`M_{q}`$ be the loopless multigraph obtained by replacing each edge of the odd cycle $`C_{2q+1}`$ with $`q-1`$ parallel copies. Its line graph is the lexicographic product $`C_{2q+1}[K_{q-1}]`$. The odd cycle is star-extremal: its fractional and circular chromatic numbers both equal $`(2q+1)/q`$ (the independence bound and the circular colouring with consecutive vertices separated by $`q`$ suffice). [Gao–Zhu (1996)](https://doi.org/10.1016/0012-365X%2894%2900311-6) shows that the circular chromatic number of this product is the circular chromatic number of the cycle times the ordinary chromatic number of the clique. Thus
```math
\chi'_c(M_q)=\frac{(2q+1)(q-1)}{q}=
\Delta(M_q)+\frac{q-1}{q},\qquad \Delta(M_q)=2q-2.
```
For $`q>2`$ the last fraction is strictly between one half and one, and the unreduced numerator is congruent to $`-1`$ modulo $`q`$, so its reduced denominator is exactly $`q`$.

Tom (@tomdif) independently pointed out this application and supplied a direct matching-window colouring in [PR #752](https://github.com/1337isnot1337/solved-conjectures/pull/752). The calculation is included as a literature-based clarification, not a separate discovery or a Lean-verified result. It does not construct simple graphs for $`q\ge6`$ or address Problem 6.
