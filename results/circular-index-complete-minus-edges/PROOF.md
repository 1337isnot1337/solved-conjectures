# Circular chromatic index of $`K_n-F`$ for odd $`n`$ and small $`F`$

**Status.**

- **Part A** (a short proof that $`\chi'_c(K_n-e)=n`$ for odd $`n\ge7`$) has passed one independent referee pass and was found correct and complete. The referee's points E1–E4 and G1–G5 have been applied (see *Referee pass*). Part A is not formalised.
- **Part B** (perfect sequencings) contains two proved lemmas.
- **Part C** gives exact values. Each value is proved by an explicit colouring together with an exclusion argument. The exclusions are a counting bound, Lemma B, an exhaustive search, or a SAT run.
- **Part C also refutes our own Conjecture H** (from the first version of this file). We have $`\chi'_c(K_{11}-2K_2)=32/3\lt11`$.
- **New:** $`K_{11}-2K_2`$ ($`\Delta=10`$, $`\chi'_c=\Delta+\tfrac23`$), $`K_{15}-3K_2`$ ($`\Delta=14`$), $`K_{19}-4K_2`$ ($`\Delta=18`$), $`K_{23}-5K_2`$ ($`\Delta=22`$), $`K_{27}-6K_2`$ ($`\Delta=26`$) and $`K_{47}-11K_2`$ ($`\Delta=46`$) are graphs with $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$ and $`\Delta\ge8`$ (Part E). Mazák and Zrubák write that no such graph was known. The upper bounds are explicit colourings found by SAT; we have no general construction.
- **Part D** contains conjectures only.

Notation: $`n=2m+1`$ is odd, $`F`$ is a set of $`t`$ edges, $`G=K_n-F`$, $`N=|E(G)|=mn-t`$. A $`(p,q)`$-edge-colouring maps $`E\to\mathbb Z_p`$ so that adjacent edges get colours at circular distance $`\ge q`$, and $`\chi'_c(G)=\min p/q`$. $`\Delta=n-1`$ whenever $`F`$ leaves some vertex uncovered.

## 0. Preliminaries

**(F1)** $`G`$ has a $`(p,q)`$-colouring iff $`\chi'_c(G)\le p/q`$ [Zhu01]. By Vince [Vin88, Theorem 3], applied to the line graph, $`\chi'_c(G)=p'/q'`$ for some integer $`p'\le|E(G)|`$. Moreover $`\chi'-1\lt\chi'_c\le\chi'`$.

**(F2)** For $`1\le t\le m`$ the matching number is $`\alpha'(G)=m`$, so $`\chi'_c\ge N/m=n-t/m`$. For $`t\le m-1`$ this is $`\gt n-1`$, hence $`\chi'(G)=n`$.

**Correction of the original premise.** For $`t=2`$ the bound $`N/m`$ equals $`19/3,\ 17/2,\ 53/5,\ 38/3`$ for $`n=7,9,11,13`$. The task wrote $`n-1-4/(n-1)`$. So $`\chi'_c(K_n-F)=n-\tfrac12`$ with $`|F|=2`$ is impossible for $`n\ge11`$. It does hold for $`n=7,9`$.

**Lemma 0 (candidates).** Let $`1\le t\le m-1`$. If $`\chi'_c(G)\lt n`$, then $`\chi'_c(G)=(nq-a)/q`$ in lowest terms, with integers $`1\le q\le m`$, $`a\ge1`$, $`a/q\le t/m`$ and $`nq-a\le N`$. In particular $`G`$ has an $`(mn-1,m)`$-colouring.

*Proof.* By (F1) and (F2), $`\chi'_c=p'/q'\in(n-1,n)`$ with $`p'\le N\lt mn`$. Then $`q'\lt mn/(n-1)\lt m+1`$. Write $`a=nq'-p'\ge1`$; then $`nq'-a=p'\le N`$ by Vince's bound. The lower bound $`a/q'\le t/m`$ is (F2). Since $`n-a/q'\le n-1/m`$, (F1) gives the $`(mn-1,m)`$-colouring. ∎

So for each $`n,t`$ only finitely many values are possible, and to decide $`\chi'_c\lt n`$ it suffices to decide whether an $`(mn-1,m)`$-colouring exists.

## Part A. $`\chi'_c(K_n-e)=n`$ for odd $`n\ge7`$ (Mazák–Zrubák Conjecture 2)

This proof is independent of our first proof in `../circular-index-complete-minus-edge/PROOF.md`.

A *perfect sequencing* of a graph on $`2m+1`$ vertices is a cyclic order $`e_0,\dots,e_{N-1}`$ of all its edges in which every $`m`$ cyclically consecutive edges are pairwise disjoint.

**Lemma A1.** Let $`m\ge2`$. If $`\chi'_c(K_n-e)\lt n`$, then $`K_n-e`$ has a perfect sequencing.

*Proof.* Lemma 0 gives an $`(mn-1,m)`$-colouring, and here $`p=mn-1=N`$. The window $`W_j=C_j\cup\dots\cup C_{j+m-1}`$ is a matching, so $`|W_j|\le m`$, while $`\sum_j|W_j|=mN=mp`$. Hence $`|W_j|=m`$ for all $`j`$, and so $`|C_{j+m}|=|C_j|`$. Since $`\gcd(m,mn-1)=1`$, every class has size $`N/p=1`$. ∎

Fix a perfect sequencing of $`K_n-uv`$ with $`m\ge2`$ and positions in $`\mathbb Z_N`$. The window $`\{e_j,\dots,e_{j+m-1}\}`$ misses exactly one vertex, $`H_j`$. *Full* vertices are those other than $`u,v`$.

**Lemma A2.** For each $`j`$, one end $`a_j`$ of $`e_j`$ occurs next at $`j+m`$, and the other end $`b_j`$ occurs next at $`j+m+1`$.

*Proof.* The edges $`e_{j+1},\dots,e_{j+m-1}`$ cover $`V\setminus(e_j\cup\{H_j\})`$, and $`e_{j+m}`$ avoids them. Since $`N\gt m`$, we have $`e_{j+m}\ne e_j`$, so $`e_{j+m}=\{H_j,a_j\}`$ with $`a_j\in e_j`$. The other end $`b_j`$ is in none of $`e_{j+1},\dots,e_{j+m}`$, so $`b_j=H_{j+1}`$. Applying the same argument at $`j+1`$ gives $`b_j\in e_{j+m+1}`$. The positions $`j,j+m,j+m+1`$ are distinct because $`N=(m+1)(2m-1)\notin\{m,m+1\}`$ for $`m\ge2`$. ∎

Gaps of $`m`$ are *moves*; gaps of $`m+1`$ are *stays*.

**Lemma A3.** $`N=(m+1)(2m-1)`$. A full vertex has exactly $`m-1`$ stays per period. Vertex $`u`$ has only stays and fills one residue class $`r_u`$ mod $`m+1`$; likewise $`v`$ fills $`r_v\ne r_u`$.

*Proof.* The gaps of a vertex sum to $`N`$. A full vertex has $`2m`$ gaps, of which $`N-2m^2=m-1`$ are stays. Vertex $`u`$ has $`2m-1`$ gaps and $`N-(2m-1)m=2m-1`$ stays, so all its gaps are stays. Its positions then form all $`2m-1`$ elements of one residue class. Since $`uv\notin E`$, no position holds both $`u`$ and $`v`$. ∎

A move lowers the residue by 1 and a stay keeps it. So a full vertex passes through every class in one block, and enters each block by a move. It meets $`u`$ exactly once, and every position of class $`r_u`$ holds $`u`$, so its block in $`r_u`$ has length 1; the same holds for $`r_v`$. The other $`m-1`$ classes are *ordinary*. Every position in an ordinary class holds two full vertices.

**Lemma A4.** If full vertices $`x\ne y`$ share position $`j`$, then one of them arrived by a stay and leaves by a move, and the other arrived by a move and leaves by a stay.

*Proof.* Lift the occurrences to $`\mathbb Z`$ as $`X_i`$ and $`Y_i`$, with $`X_0=Y_0=j`$ and period $`2m`$ (adding $`N`$). Let $`\delta(i)=Y_i-X_i`$. Then $`\delta`$ is $`2m`$-periodic with steps in $`\{-1,0,1\}`$. It cannot vanish at any $`i\not\equiv0\pmod{2m}`$, since that would make the edge $`xy`$ occur twice. So $`\delta(\pm1)\ne0`$. If $`\delta(1)`$ and $`\delta(2m-1)=\delta(-1)`$ had opposite signs, $`\delta`$ would vanish somewhere in between. Hence $`\delta(-1)=\delta(1)=\pm1`$, and reading off the gaps gives the claim. ∎

**Lemma A5.** In an ordinary class $`\rho`$, write $`(\rho,k)`$ for the position $`\rho+k(m+1)`$, $`k\in\mathbb Z_{2m-1}`$. Every full vertex occupies exactly two consecutive slots. There is a bijection $`k\mapsto z^\rho_k`$ onto the full vertices such that the edge at $`(\rho,k)`$ is $`z^\rho_{k-1}z^\rho_k`$.

*Proof.* A vertex enters the class by a move, so by A4 it then stays. At the next slot it has arrived by a stay, so by A4 it moves. Hence every vertex has exactly two consecutive slots. The newcomer $`z^\rho_k`$ (the vertex that arrived by a move) is unique at each slot by A4, and each full vertex is a newcomer exactly once. The other vertex at $`(\rho,k)`$ is $`z^\rho_{k-1}`$, which stayed. ∎

**Lemma A6.** Let $`\rho`$ be ordinary, and let $`\rho'`$ be the first ordinary class in the cyclic order $`\rho+1,\rho+2,\dots`$. Then there is a constant $`c`$ with $`z^\rho_k=z^{\rho'}_{k-c}`$ for all $`k`$.

*Proof.* A stay goes $`(\sigma,k)\mapsto(\sigma,k+1)`$. A move goes $`(\sigma,k)\mapsto(\sigma-1,k+1)`$ for $`\sigma\ge1`$, and $`(0,k)\mapsto(m,k)`$. Let $`\mu(Q)`$ be the end of the edge at $`Q`$ that leaves by a move. The newcomer at $`P`$ is $`\mu(P-m)`$.

- If $`Q`$ lies in an ordinary class, $`\mu(Q)`$ is the vertex that stayed into $`Q`$. So $`\mu(\sigma,k)=z^\sigma_{k-1}`$.
- If $`Q`$ lies in a special class, the special vertex stays, so $`\mu(Q)=w`$ is the full vertex at $`Q`$. Its block there has length 1 and was entered by a move, so $`w=\mu(Q-m)`$.

Repeat this until an ordinary class is reached. This takes at most 3 steps, since there are at most 2 special classes; this covers the case of adjacent $`r_u,r_v`$, including across the wrap $`m\to0`$. Each step changes the slot by $`-1`$, or by $`0`$ across the wrap. The sequence of classes passed depends only on $`\rho`$, so the total shift $`c`$ is constant. ∎

**Theorem A.** For odd $`n\ge7`$, $`\chi'_c(K_n-e)=n`$.

*Proof.* Suppose $`\chi'_c\lt n`$, and take the perfect sequencing given by A1. Since $`m\ge3`$, there are at least 2 ordinary classes, so $`\rho'\ne\rho`$ in A6. Then classes $`\rho`$ and $`\rho'`$ carry the same edge set $`\{z_{k-1}z_k\}`$ (A5, A6), so an edge occurs twice. This is a contradiction. ∎

For $`m=2`$ there is one ordinary class and A6 is consistent (shift $`0`$). Indeed $`\chi'_c(K_5-e)=9/2`$.

## Part B. Perfect sequencings of $`K_n-F`$

**Lemma B.** Let $`m\ge2`$ and $`t\le m+1`$. If $`K_n-F`$ has a perfect sequencing, then $`F`$ is a matching.

*Proof.* With $`m\ge2`$, every vertex has degree at least $`m-1\ge1`$ and $`N\ge m+2`$, so the proof of A2 applies and every gap is $`m`$ or $`m+1`$. A vertex of $`F`$-degree $`d`$ has $`2m-d`$ gaps with total excess $`N-m(2m-d)=m-t+md`$. Each gap has excess at most 1, so $`m-t+md\le2m-d`$, that is $`d(m+1)\le m+t`$. This forces $`d\le1`$. ∎

**Corollary B1.** Let $`2\le m`$, $`t\le m-1`$ and $`\gcd(m,t)=1`$. Then $`\chi'_c(K_n-F)=n-t/m`$ only if $`K_n-F`$ has a perfect sequencing. In particular, if $`F`$ is not a matching, then $`\chi'_c(K_n-F)\gt n-t/m`$.

*Proof.* An $`(mn-t,m)`$-colouring has $`p=N`$ and $`\gcd(m,p)=\gcd(m,t)=1`$. The window argument of A1 then gives single-edge classes, which is a perfect sequencing. Apply Lemma B. ∎

**Data.** No perfect sequencing exists for the following, each by an exhaustive search from the definition:

- $`K_7-e`$, $`K_9-e`$, $`K_7-P_3`$, $`K_7-2K_2`$ (`verify_seq.py`);
- $`K_9-F`$ for all 44 isomorphism types of $`F`$ with $`t\le5`$ edges (referee, `review/lemmaB_9.out`);
- $`K_{11}-2K_2`$ (referee, `review/seqsearch.c`, $`1.36\cdot10^9`$ nodes; also our earlier session);
- $`K_{11}-3K_2`$ (`review/seqsearch.c`, $`6.96\cdot10^8`$ nodes, 87 s, this session).

## Part C. Exact values, and the refutation of Conjecture H

Upper bounds come from the colourings in `colourings.json` (32 of them, checked by `verify.py`, standard library). Lower bounds: by Lemma 0, $`\chi'_c`$ is one of finitely many fractions. The column "excluded by" lists how every candidate below the stated value is ruled out.

| $`n`$ | $`m`$ | $`F`$ | $`\chi'_c(K_n-F)`$ | candidates below, excluded by |
|---|---|---|---|---|
| 5 | 2 | $`K_2`$ | 9/2 | [MZ] |
| $`\ge7`$ | $`\ge3`$ | $`K_2`$ | $`n`$ | Theorem A |
| 7 | 3 | $`P_3`$, $`2K_2`$ | 13/2 | 19/3: no perfect sequencing (Cor. B1, `verify_seq.py`); also SAT (`verify_sat.py 1`) |
| 9 | 4 | $`P_3`$, $`2K_2`$ | 17/2 | none ($`=N/m`$) |
| 9 | 4 | all five 3-edge $`F`$ | 17/2 | 33/4: no perfect sequencing (Cor. B1; $`3K_2`$ by exhaustive search); 25/3: SAT UNSAT (`verify_sat.py 2`) |
| **11** | **5** | $`2K_2`$ | **32/3** | 53/5: no perfect sequencing (exhaustive search, Cor. B1) |
| 11 | 5 | $`P_3`$ | in $`(53/5,\,11]`$ | candidates below 11 are $`53/5,\ 32/3,\ 43/4`$ ($`54/5`$ has numerator $`54\gt N=53`$); 53/5 excluded by Cor. B1; $`32/3,\ 43/4`$ undecided (SAT timeouts) |
| 11 | 5 | all five 3-edge $`F`$ | 21/2 | 52/5: no perfect sequencing (Cor. B1; $`3K_2`$ by exhaustive search) |
| 13 | 6 | all five 3-edge $`F`$ | 25/2 | none ($`=N/m`$) |
| 13 | 6 | $`P_3`$, $`2K_2`$ | in $`[38/3,\,13]`$ | undecided |
| **15** | **7** | $`3K_2`$ | in $`[102/7,\,44/3]`$ | $`102/7,\ 73/5`$ undecided |
| **19** | **9** | $`4K_2`$ | in $`[167/9,\,56/3]`$ | not examined |
| **23** | **11** | $`5K_2`$ | in $`[248/11,\,68/3]`$ | not examined |
| 17 | 8 | $`4K_2,K_{1,4},P_5,C_4,K_3\cup K_2`$ | 33/2 | none |
| 25 | 12 | $`K_4`$ | 49/2 | none |
| 41 | 20 | $`K_5`$ | 81/2 | none |

**Note on the SAT lower bound for $`n=9`$, $`t=3`$.** The exclusion of $`25/3`$ rests on a single SAT encoding (`verify_sat.py`, part 2). That encoding adds three kinds of constraints, and each is implied by every $`(p,q)`$-colouring:

- (i) a vertex of degree $`d`$ sees exactly $`d`$ colours;
- (ii) exactly $`p-qd`$ windows of $`q`$ consecutive colours miss it;
- (iii) every window leaves at least one vertex uncovered, because $`n`$ is odd.

We derived these by hand, and the second referee checked them. The encoding returns SAT on control instances known to be colourable. An independent plain encoding (the referee's `review/plainsat.py`, and our own) timed out after 10 minutes for every $`F`$. As a certificate we produced DRUP proofs with Glucose 4 (through python-sat) on the same CNFs and checked them with drat-trim. The status for each $`F`$ is listed under *Verification*.

**Graphs with $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$, $`\Delta\ge8`$.**

- $`\chi'_c(K_{11}-2K_2)=32/3=\Delta+\tfrac23`$ with $`\Delta=10`$. The proof combines three facts. The stored $`(32,3)`$-colouring gives $`\chi'_c\le32/3`$. Lemma 0 shows that the only candidate below $`32/3`$ is $`53/5`$, because every fraction in $`[53/5,32/3)`$ with denominator at most 5 equals $`53/5`$. And $`53/5=N/m`$ with $`\gcd(5,2)=1`$, which by Corollary B1 needs a perfect sequencing, and none exists.
- $`102/7\le\chi'_c(K_{15}-3K_2)\le44/3`$ with $`\Delta=14`$, and $`102/7=\Delta+\tfrac47\gt\Delta+\tfrac12`$.

Mazák and Zrubák [MZ, open-problems section, after Problem 7] write that for any $`\Delta\ge8`$ no graph with maximum degree $`\Delta`$ and $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$ is known to them. These two graphs are such graphs for $`\Delta=10`$ and $`\Delta=14`$. More generally, when $`2t\lt m`$ we have $`N/m\gt n-\tfrac12`$, so any $`(p,q)`$-colouring of $`K_n-F`$ with $`p/q\lt n`$ gives such an example.

**Conjecture H (first version) is false.** It predicted $`\chi'_c(K_n-F)=n`$ whenever $`2t\lt m`$, and $`K_{11}-2K_2`$ contradicts it. In particular, Theorem A's residue-class argument cannot extend to $`t=2`$, $`m=5`$. That argument needs every class to hold a single edge, and for $`t\ge2`$ the $`(mn-1,m)`$-colourings have slack $`m(t-1)`$ in the window sums.

**Structure in the case $`2t=m`$ (proved).** Let $`m`$ be even and $`t=m/2`$, and suppose $`K_n-F`$ has a $`(4m+1,2)`$-colouring. Then:

- every class has exactly $`m/2`$ edges, and any two consecutive classes form a matching missing exactly one vertex;
- after multiplying colours by $`2^{-1}=2m+1`$ in $`\mathbb Z_{4m+1}`$, the colour set at each vertex not covered by $`F`$ is an interval of $`2m`$ consecutive colours.

*Proof.* The window sums total $`2N=m(4m+1)=mp`$ and each window has at most $`m`$ edges, so every window has exactly $`m`$ edges. Hence $`|C_j|=|C_{j+2}|`$, and $`p`$ is odd, so all classes have size $`N/p=m/2`$. At a vertex of degree $`2m`$, the $`2m`$ colours are pairwise non-consecutive in $`\mathbb Z_{4m+1}`$. So they are $`a,a+2,\dots,a+4m-2`$ for some $`a`$, and multiplying by $`2m+1`$ maps $`a+2i`$ to $`(2m+1)a+i`$. ∎

**Upper bounds for $`2t\ge m`$.** If $`F_0\subseteq F`$, then $`\chi'_c(K_n-F)\le\chi'_c(K_n-F_0)`$. So the upper bound $`n-\tfrac12`$ for all $`F`$ with $`t\ge\lceil m/2\rceil`$ follows from the case $`t=\lceil m/2\rceil`$. We have no general construction for that case.

- The colourings of $`K_{2k(k+1)+1}-K_{k+1}`$ ($`k\le4`$) are invariant under $`k`$ cycles of length $`2k+1`$, with colour shift $`2k+1`$ in $`\mathbb Z_{(2k+1)^2}`$.
- An affine ansatz, in which the colour of each edge orbit is affine in the cycle offset, works for $`k=1`$ and is infeasible for $`k=2`$ (exhaustive, `affine.py` in the scratch directory).

## Part E. Colourings below $`n`$ for $`K_n-tK_2`$ with $`2t\lt m`$

**Why these give $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$ (proved).** Suppose $`2t\lt m`$ and $`F`$ leaves a vertex uncovered, so that $`\Delta=n-1`$. Then (F2) gives $`\chi'_c\ge n-t/m\gt n-\tfrac12=\Delta+\tfrac12`$. So any $`(p,q)`$-colouring of $`K_n-F`$ with $`p/q\lt n`$ shows $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$. For a matching $`F=tK_2`$ this needs $`2\le t\le\lceil m/2\rceil-1`$. The value $`t=1`$ is excluded by Theorem A, and such a $`t`$ exists for $`m\ge5`$, that is $`n\ge11`$. For $`q=3`$ the counting bound allows a $`(3n-1,3)`$-colouring exactly when $`3t\ge m`$. The window sums then have slack $`3t-m`$.

**Computed (explicit colourings in `colourings.json`, checked by `verify.py`).**

| $`n`$ | $`\Delta`$ | $`F`$ | colouring | $`\chi'_c`$ | SAT time |
|---|---|---|---|---|---|
| 11 | 10 | $`2K_2`$ | $`(32,3)`$ | $`=32/3`$ (Part C) | 4 s |
| 15 | 14 | $`3K_2`$ | $`(44,3)`$ | $`\in[102/7,44/3]`$ | 81 s |
| 19 | 18 | $`4K_2`$ | $`(56,3)`$ | $`\in[167/9,56/3]`$ | 209 s |
| 23 | 22 | $`5K_2`$ | $`(68,3)`$ | $`\in[248/11,68/3]`$ | 529 s |
| 27 | 26 | $`6K_2`$ | $`(80,3)`$, $`\mathbb Z_5`$-symmetric | $`\in[345/13,80/3]`$ | 7.5 s |
| 47 | 46 | $`11K_2`$ | $`(140,3)`$, $`\mathbb Z_5`$-symmetric | $`\in[1070/23,140/3]`$ | 119 s |

All six have $`n\equiv3\pmod 4`$ ($`m`$ odd), $`t=(m-1)/2`$, and value $`n-\tfrac13`$, as Conjecture H′ predicts. So $`\chi'_c\in(\Delta+\tfrac12,\Delta+1)`$ is realised for $`\Delta=10,14,18,22,26,46`$, all of them $`\equiv2\pmod4`$. The colourings for $`n\le23`$ have no non-trivial symmetry. We checked every vertex permutation preserving $`F`$ together with every colour map $`c\mapsto\pm c+s`$.

**Not found within our limit of 10 min per SAT run.**

- $`m`$ even, where the largest admissible $`t=m/2-1`$ leaves little slack:
  - $`K_{13}-2K_2`$: $`(38,3)`$ (slack 0), $`(51,4)`$, $`(64,5)`$;
  - $`K_{17}-3K_2`$: $`(50,3)`$, also with an involutive colour-reversal symmetry, and $`(67,4)`$;
  - $`K_{21}-4K_2`$: $`(62,3)`$, $`(83,4)`$.
- $`K_{15}-2K_2`$: $`(59,4)`$.

So for $`n=13,17,21`$ we have no example from this family.

**Symmetric colourings (proved conditions, computed examples).** Let $`\sigma`$ be a vertex permutation preserving $`F=tK_2`$, and suppose $`c(\sigma e)=c(e)+s`$ with $`s\ne0`$ of order $`d`$ in $`\mathbb Z_p`$, $`p=3n-1=4(3t+2)`$, $`n=4t+3`$.

- If $`\sigma`$ has a fixed vertex $`w`$ not covered by $`F`$, then every other cycle has length exactly $`d`$. The reason: the edges $`w\sigma^jx`$ get colours $`c+js`$, which must be distinct, and an orbit closes only when $`rs\equiv0`$. If $`d`$ is even, the $`d/2`$ "diameters" of each cycle must lie in $`F`$, which gives $`2t+1\gt t`$ edges. If $`d`$ is odd, then $`d\mid\gcd(4t+2,\,3t+2)=1`$. So no such symmetry exists.
- If the fixed vertices are $`u,v`$ with $`uv\in F`$, the same argument gives cycles of odd length $`d`$ with $`d\mid\gcd(4t+1,\,12t+8)=\gcd(4t+1,5)`$. So $`d=5`$ and $`t\equiv1\pmod5`$, and $`F`$ is $`uv`$ together with $`(t-1)/5`$ orbits of 5 edges joining two 5-cycles.
- This is exactly the symmetry used for $`n=27`$ and $`n=47`$. It cuts the search drastically: 7.5 s for $`n=27`$, against a timeout for $`n=27`$ without symmetry. It only covers $`n\equiv7\pmod{20}`$.
- We did not settle symmetries without fixed vertices.
- With $`q\gt3`$ other symmetries become possible: a fixed vertex and odd $`d\mid\gcd(q-1,n-1)`$. For $`K_{31}-6K_2`$ at $`(123,4)`$ with $`\mathbb Z_3`$ (ten 3-cycles, $`F`$ two orbits) the search timed out after 595 s.
- An involution with colour reversal $`c\mapsto s-c`$ (one fixed vertex, $`F`$ inside the transposition edges) is infeasible already for $`K_{11}-2K_2`$ at $`(32,3)`$ (SAT, 3 s).
- For $`K_{11}-2K_2`$ at $`(32,3)`$, the ansatz "every vertex outside $`F`$ has an interval of colours after multiplying by $`3^{-1}`$" is infeasible (SAT, 47 s).

**Structure of $`(qn-1,q)`$-colourings (proved; a possible handle for a general construction).**

- Take a $`(qn-1,q)`$-colouring and split the colours into blocks $`\{qi,\dots,qi+q-1\}`$ ($`0\le i\le n-2`$) and a short last block $`\{q(n-1),\dots,qn-2\}`$.
- Each block is a matching $`M_i`$, and $`M_i`$ is the union of its $`q`$ parts $`P_i^1,\dots,P_i^q`$ (one colour each).
- Let $`S_i^k`$ be the vertex set of the first $`k`$ parts and $`U_i`$ the set of vertices that $`M_i`$ misses.

The windows that straddle two blocks are matchings exactly when:

```math
S_{i+1}^k\subseteq S_i^k\cup U_i\quad(0\le i\le n-2,\ 1\le k\le q-1),\qquad S_0^{j}\subseteq S_{n-1}^{j-1}\cup U_{n-1}\quad(1\le j\le q-1).
```

The proof is direct: the window starting at colour $`qi+k`$ is $`P_i^{k+1..q}\cup P_{i+1}^{1..k}`$, and $`V(P_i^{k+1..q})=V\setminus(S_i^k\cup U_i)`$.

Consequences:

- At a block missing a single vertex ($`|U_i|=1`$), every prefix set either stays the same or swaps one vertex for the missing one. So the "layers" $`S^k\setminus S^{k-1}`$ change by one vertex per block, through a cascade that starts at the missing vertex.
- The first part of block 0 lies inside $`U_{n-1}`$. So the short block must have deficiency at least $`|P_0^1|`$.

A general construction amounts to scheduling these slowly changing layers so that every pair of vertices outside $`F`$ is matched exactly once. The simplest schedule, first-in-first-out layers fed in a fixed cyclic order, fails: relative order is preserved, so far-apart pairs never meet and nearby pairs meet repeatedly. We did not find a schedule that works.

**Status of the general question.**

- Not proved: that $`\chi'_c(K_n-tK_2)\lt n`$ for every odd $`n\ge11`$ and some $`t`$ with $`2\le 2t\lt m`$.
- Computed: $`n=11,15,19,23,27,47`$. For $`n=27`$ and $`n=31`$ without symmetry, and for $`n=31`$ with the $`\mathbb Z_3`$ symmetry above, the searches timed out.
- Conjectural (H′): $`\chi'_c(K_n-tK_2)=n-1/\lceil m/t\rceil`$, which would give value $`n-\tfrac13`$ for every $`m\ge5`$ with $`t=\lceil m/2\rceil-1`$ when $`3t\ge m`$. For $`m=6`$ that value, $`38/3`$, equals $`N/m`$, so it needs a perfect "domino" structure.

## Part D. Conjectures (not proved)

**Conjecture H′.** For $`2\le t\le m-1`$ and every $`F`$ with $`t`$ edges,

```math
\chi'_c(K_n-F)=n-\frac1{\lceil m/t\rceil}.
```

For $`t=1`$ the right side would be $`n-1/m`$, but the true value is $`n`$ for $`m\ge3`$ (Theorem A), so $`t=1`$ is genuinely exceptional.

H′ agrees with every exact value in Part C:

- $`(m,t)=(3,2)`$: $`13/2`$;
- $`(4,2)`$ and $`(4,3)`$: $`17/2`$;
- $`(5,2)`$: $`32/3`$ for $`2K_2`$;
- $`(5,3)`$: $`21/2`$;
- $`(6,3)`$: $`25/2`$;
- $`(8,4)`$: $`33/2`$;
- $`(12,6)`$: $`49/2`$;
- $`(20,10)`$: $`81/2`$;
- $`(7,3)`$: the upper bound $`44/3`$.

H′ splits into two halves:

- **Upper half:** an $`(qn-1,q)`$-colouring exists for $`q=\lceil m/t\rceil`$.
- **Lower half:** no value $`(nq-a)/q`$ in lowest terms below $`n-1/\lceil m/t\rceil`$ occurs. Such a value has $`a\ge2`$ or $`q\lt\lceil m/t\rceil`$. The second part is the counting bound $`N/m`$, so the real content is the exclusion of values with $`a\ge2`$, such as $`53/5`$ and $`25/3`$ above.

The first open tests are $`K_{11}-P_3`$ (H′ predicts $`32/3`$), $`K_{13}-2K_2`$ (predicts $`38/3=N/m`$), and $`K_{15}-3K_2`$ (predicts $`44/3`$, which needs $`102/7`$ and $`73/5`$ excluded).

**Exact gap for the original Question 1 ($`t=2`$).**

- Proved: $`n=7,9`$ give $`n-\tfrac12`$, and $`K_{11}-2K_2`$ gives $`32/3`$.
- Open: $`K_{11}-P_3`$ and all $`n\ge13`$. There we know only $`N/m\le\chi'_c\le n`$, together with $`\chi'_c\ne N/m`$ for $`P_3`$ when $`m`$ is odd (Corollary B1).

**Even $`n`$.** If $`F`$ leaves a vertex uncovered, Plantholt's theorem gives $`\chi'=\Delta=n-1`$, hence $`\chi'_c=n-1`$. This case is not interesting. We did not treat spanning $`F`$.

## Verification

- `verify.py` (standard library, under 1 s): checks all 32 colourings in `colourings.json` from the definition, and prints the bound $`N/m`$ for each.
- `verify_seq.py` (standard library, about 25 s):
  - exhaustive search, from the definition, for perfect sequencings of $`K_5-e`$, $`K_7-e`$, $`K_9-e`$, $`K_7-P_3`$, $`K_7-2K_2`$;
  - on the $`K_5-e`$ sequencings, checks A2, A3, A4 and the class counts of A5.

  The full A5 (consecutive slots, bijection, edges $`z_{k-1}z_k`$) and A6 are checked by `review/lemma_check.py` on all 36 sequencings of $`K_5-e`$ obtained by rotation and reversal (run: `gcc -O2 -o seqsearch review/seqsearch.c; ./seqsearch 5 k5e.txt 0 0 1; python3 review/lemma_check.py k5e.txt 5 0 1`).
- `verify_sat.py` (needs python-sat):
  - part 1: $`K_7-P_3`$ and $`K_7-2K_2`$ are not $`(19,3)`$-colourable (about 85 s each);
  - part 2: $`K_9-F`$ is not $`(25,3)`$-colourable for all five 3-edge $`F`$ (a few minutes at most; $`3K_2`$ took 144–214 s on a shared CPU, the others under 25 s).
  - DRUP certificates (`drat/`, which holds the script `mkproof.py` that regenerates them and the results in `drat/README.txt`; the proof files, 8 MB to 561 MB, are not stored): for all five $`F`$, the CNF of part 2 was re-solved with proof output (Glucose 4; CaDiCaL 1.9.5 for $`3K_2`$, where Glucose timed out), and drat-trim reported `s VERIFIED` (verification 0.3 s to 262 s). This certifies UNSAT of that CNF. It does not certify that the CNF encodes the problem; that rests on the hand check of the constraints above.
- `review/`: the referee's report and self-contained scripts.

## Referee pass

One independent referee checked Part A line by line and found it correct and complete, and logically independent of the first proof (`review/REVIEW.md`). The referee also checked Lemma B, the table and the scripts. Corrections applied:

- **E1:** Lemma B now assumes $`m\ge2`$.
- **E2:** the citation of the $`\Delta\ge8`$ remark now points to the open-problems section of [MZ].
- **E3:** (F1) now cites Vince's Theorem 3 directly.
- **E4:** the description of what `verify_seq.py` checks is now accurate, and full A5/A6 checking is delegated to `review/lemma_check.py`.

Gaps closed:

- **G1:** the A6 chain when the special classes are adjacent.
- **G2:** $`N\ne m+1`$ in A2.
- **G3:** Corollary B1.
- **G4:** the referee's 3-edge $`K_9`$ colourings are added, and the $`K_{11}-2K_2`$ search is recorded.
- **G5:** the $`n=9`$, $`t=3`$ row is updated; it is now closed by the SAT runs above.

The results added after the referee pass (the $`K_{11}`$, $`K_{15}`$, $`K_{19}`$ and $`K_{23}`$ colourings, the $`K_{11}-3K_2`$ search, the $`(25,3)`$ runs and Part E) have not been refereed. The colourings are checked by `verify.py`.

## Second referee pass

A second independent referee checked everything added after the first pass (`review/REVIEW2.md`): the $`K_{11}-2K_2`$ and $`K_{15}-3K_2`$ results, the 3-edge rows for $`n=9,11,13`$, Lemma B and Corollary B1, the structure lemma for $`2t=m`$, the status of H and H′, and the claim about $`\Delta\ge8`$. Verdict: accept with minor corrections. Every colouring and every exhaustive search was re-done with independent code (`review/check_col.py`, `review/cands.py`, `review/pseq.c`).

Corrections applied:

- **E1:** Lemma 0 now carries the numerator condition $`nq-a\le N`$ (Vince). With it, $`54/5`$ is not a candidate for $`K_{11}-P_3`$, and the row lists exactly $`53/5,32/3,43/4`$.
- **E2:** the timing of `verify_sat.py`, part 2, is corrected.
- **G1:** the $`25/3`$ exclusion is now stated as resting on one hand-checked encoding, and DRUP certificates have been added.
- **G2:** the wording of the lower half of H′ is corrected.

The material in Part E after the second pass has not been refereed: the $`n=19,23,27,47`$ colourings, the symmetry conditions, and the structure lemma for $`(qn-1,q)`$. The colourings are checked by `verify.py`.

## Sources

- **[MZ]** J. Mazák, F. Zrubák, *Circular chromatic index of small graphs*, [arXiv:2603.08822](https://arxiv.org/abs/2603.08822) (2026). Conjecture 2, the value of $`K_5-e`$, Problem 7, and the remark on $`(\Delta+\tfrac12,\Delta+1)`$ for $`\Delta\ge8`$ in the open-problems section.
- **[Vin88]** A. Vince, *Star chromatic number*, J. Graph Theory 12 (1988) 551–559, Theorem 3. The referee read the PDF; we did not.
- **[Zhu01]** X. Zhu, *Circular chromatic number: a survey*, Discrete Math. 229 (2001) 371–410. † Not re-read.
- M. J. Plantholt, *The chromatic index of graphs with a spanning star*, J. Graph Theory 5 (1981) 45–53. † Not read.
- A web search on 21 November 2026 found no result on $`\chi'_c(K_n-F)`$ for $`|F|\ge2`$.

† marks a source we did not read directly.
