# Wild number of $`K_n`$: threshold lowered from 189 to 155

Status: **proved improvement, gap not closed.** Conjecture 6.1 of Dawkins–Nappo–Tong–Zimbizi now holds for every $`n \ge 155`$. The previous result (REPORT.md, Theorem A) gave every $`n \ge 189`$ plus eight sporadic values. Together with the paper ($`n \le 12`$), the open range is now $`13 \le n \le 154`$.

There is one new probabilistic ingredient, Lemma C, a lopsided vertex-clique form of the cluster-expansion local lemma. Its proof is short and self-contained. The rest is sharper counting of the bad events. All numeric conditions are checked in exact rational arithmetic. Section 6 lists what a referee should check; an independent referee has since checked it (`review2/REVIEW.md`).

## 1. Statement

**Theorem B.** For every $`n \ge 155`$ and every minimum proper edge colouring $`\rho`$ of $`K_n`$,
```math
\mathrm{wld}_\rho(K_n)=\left\lfloor \tfrac{4\lceil n/2\rceil}{3}\right\rfloor .
```

Proof structure:
- Odd $`n \ge 189`$ is Theorem A of REPORT.md, which was refereed in review/REVIEW.md.
- Odd $`155 \le n \le 187`$ is new, Sections 3–4.
- Even $`n \ge 156`$ follows from odd $`n-1`$ by the deletion lemma (REPORT §2).

The new criterion also holds for $`n = 189`$ (Section 5), so the two proofs overlap.

## 2. Setting (recalled from REPORT.md)

**Colourings and blocks.**
- $`n`$ is odd and $`h=(n-1)/2`$. Colours are identified with vertices: colour $`u`$ is a perfect matching $`M_u`$ of $`V\setminus\{u\}`$, and $`c(xy)`$ denotes the colour of the edge $`xy`$.
- Set $`f = 0, 4, 5`$ according as $`n \equiv 0, 1, 2 \pmod 3`$.
- When $`f\gt 0`$, fix an $`f`$-set $`F`$ that is
  - *rainbow*: its edges have distinct colours; and
  - *sub-valid*: no triple $`\{u,a,b\}\subseteq F`$ has $`ab\in M_u`$.
- Such $`F`$ exists for odd $`n\ge 19`$ when $`f=4`$, and for odd $`n\ge 49`$ when $`f=5`$. This is the corrected counting of REVIEW E1.

**Random partition.**
- Put $`N=n-f`$ and $`t=N/3`$.
- $`P`$ is a uniformly random partition of $`V\setminus F`$ into triples, which is the same thing as a uniformly random perfect matching of $`K^{(3)}_N`$.
- The final partition is $`\{F\}\cup P`$, with $`\lfloor n/3\rfloor`$ blocks.

**Seals and closed sets.**
- $`S`$ is *$`u`$-closed* if $`x\in S\setminus\{u\}`$ implies $`M_u(x)\in S`$.
- $`\{F\}\cup P`$ is seal-free iff every quotient $`Q_u`$ is connected. Here $`Q_u`$ is the multigraph on the blocks with one edge per $`M_u`$-edge. If $`\{F\}\cup P`$ is seal-free, then $`\mathrm{wld}_\rho(K_n)`$ attains the lower bound (REPORT §2).

**Probabilities.**
```math
T(m)=\frac{m!}{(m/3)!\,6^{m/3}},\qquad q_j=\frac{T(N-3j)}{T(N)} .
```
- $`T(m)`$ is the number of partitions of an $`m`$-set into triples.
- $`q_j`$ is the probability that $`j`$ given disjoint triples are all blocks of $`P`$.

**Free edges.** An edge of $`M_u`$ is *free* if it does not meet $`F`$. Let $`h_u`$ be the number of free $`u`$-edges, $`\mathrm{int}_u`$ the number of $`u`$-edges inside $`F`$, and $`\mathrm{ext}_u`$ the number with exactly one end in $`F`$. Then
```math
h_u=h-\mathrm{int}_u-\mathrm{ext}_u,\qquad 2\,\mathrm{int}_u+\mathrm{ext}_u=f-[u\in F].
```

## 3. The two new ingredients

### 3.1 Lemma C (vertex-clique cluster lemma, lopsided form)

**Setting.**
- Let $`\mathcal E`$ be a finite family of events in a probability space.
- Each $`E\in\mathcal E`$ has a nonempty *support* $`V(E)\subseteq V'`$, where $`V'`$ is a finite set.
- For $`S\subseteq\mathcal E`$ write $`Z_S=\Pr(\bigwedge_{G\in S}\overline G)`$.
- For $`U\subseteq V'`$ write $`S_U=\{G\in S: V(G)\cap U\ne\emptyset\}`$.

**Hypotheses.**
- (L) For every $`E\in\mathcal E`$ and every $`R\subseteq\mathcal E`$ whose members all have support disjoint from $`V(E)`$:
```math
\Pr\Big(E\wedge\bigwedge_{G\in R}\overline G\Big)\le \Pr(E)\,Z_R .
```
- (W) There are numbers $`a_v\gt 1`$ ($`v\in V'`$) such that, for every $`z\in V'`$,
```math
\sum_{E\ni z}\Pr(E)\prod_{v\in V(E)}a_v\ \le\ a_z-1 .
```

**Conclusion.** For all $`S\subseteq\mathcal E`$ and $`U\subseteq V'`$,
```math
Z_{S\setminus S_U}\le\Big(\prod_{v\in U}a_v\Big)Z_S .
```
In particular $`\Pr(\text{no event of }\mathcal E)\ge\prod_{v\in V'}a_v^{-1}\gt 0`$.

We use only constant weights $`a_v\equiv a`$. Condition (W) then reads $`\sum_{E\ni z}\Pr(E)\,a^{|V(E)|}\le a-1`$.

*Proof.* We prove the following by induction on $`|S|`$: the displayed inequality holds for every $`U`$, and $`Z_S\gt 0`$. The case $`S=\emptyset`$ is trivial.

**Step 1: a single vertex $`z`$.** Let $`Q=S_{\{z\}}`$ and $`T=S\setminus Q`$. If $`Q=\emptyset`$ there is nothing to prove; otherwise $`|T|\lt |S|`$. By the union bound, and then by dropping some of the conditions $`\overline G`$ (which can only increase each probability),
```math
Z_S = Z_T-\Pr\Big(\bigvee_{E\in Q}E\wedge\bigwedge_{G\in T}\overline G\Big)\ \ge\ Z_T-\sum_{E\in Q}\Pr\Big(E\wedge\bigwedge_{G\in T\setminus T_{V(E)}}\overline G\Big).
```
Apply (L) to each term, using $`R=T\setminus T_{V(E)}`$. Then apply the induction hypothesis to $`T`$ with $`U=V(E)\setminus\{z\}`$. This is allowed because no member of $`T`$ meets $`z`$, so $`T_{V(E)}=T_{V(E)\setminus\{z\}}`$. Together these give
```math
\Pr\Big(E\wedge\bigwedge_{G\in T\setminus T_{V(E)}}\overline G\Big)\le \Pr(E)\,Z_{T\setminus T_{V(E)}}\le \Pr(E)\prod_{v\in V(E)\setminus\{z\}}a_v\; Z_T .
```
By (W),
```math
Z_S\ge Z_T\bigl(1-(a_z-1)/a_z\bigr)=Z_T/a_z\gt 0 .
```

**Step 2: a general $`U=\{z_1,\dots,z_m\}`$.** Put $`S^0=S`$ and $`S^i=S^{i-1}\setminus S^{i-1}_{\{z_i\}}`$, so that $`S^m=S\setminus S_U`$.
- If $`S^{i-1}=S`$, Step 1 gives $`Z_{S^i}\le a_{z_i}Z_{S^{i-1}}`$.
- Otherwise $`S^{i-1}`$ is a proper subset of $`S`$, and the induction hypothesis gives the same inequality.

Multiplying the $`m`$ inequalities proves the claim. For positivity when $`S\ne\emptyset`$, apply Step 1 with $`z`$ in the support of some member of $`S`$. Taking $`S=\mathcal E`$ and $`U=V'`$ gives the final assertion. ∎

**Comparison with the asymmetric LLL.** With $`a_v\equiv a`$, the asymmetric LLL used in Theorem A needs $`W(\mu)\le(1-x_{\max})\ln\mu`$. Lemma C needs only $`W(a)\le a-1`$. This is the cluster-expansion gain: $`a-1`$ in place of $`\ln a`$, and no factor $`x_{\max}`$.

**Relation to the literature.** Lemma C follows from the lopsided cluster-expansion lemma of Harvey–Vondrák (arXiv:1711.06797, Lemma 5 †). That lemma assumes $`\Pr(E_i\mid\bigcap_{j\in J}\overline{E_j})\le p_i`$ for $`J`$ outside $`\Gamma^+(i)`$, and $`p_i\le y_i/Y_{\Gamma^+(i)}`$, where $`Y`$ is the independence polynomial. Set $`y_E=\Pr(E)\prod_{v\in V(E)}a_v`$ and bound $`Y_{\Gamma^+(E)}\le\prod_{z\in V(E)}(1+\sum_{G\ni z}y_G)\le\prod_{z\in V(E)} a_z`$. Then their lemma gives Lemma C. The non-lopsided version is due to Bissacot–Fernández–Procacci–Scoppola †. **The proof above does not depend on these sources.**

### 3.2 Lemma N (negative dependency)

Take canonical events $`A_M=\{P\supseteq M\}`$ for partial triple-matchings $`M`$ of $`V\setminus F`$, with support $`V(M)`$. They satisfy (L). If the members of $`R`$ are vertex-disjoint from $`M`$, they are compatible with $`M`$. The coupling proof in review/REVIEW.md (G1) then gives $`\Pr(A_M\mid B)\le\Pr(A_M)`$ for $`B=\bigwedge_{G\in R}\overline G`$, which is (L).

That proof, in brief:
- Replace the triples of $`P`$ that meet $`V(M)`$ by $`M`$ plus a uniformly random triple-partition of the leftover vertices.
- The resulting partition is uniform on $`A_M`$. The reason is that the map is equivariant under $`\mathrm{Sym}(V\setminus F\setminus V(M))`$, and this group acts transitively on $`A_M`$.
- If the new partition lies in $`B`$, so does $`P`$.

`negdep.py` (review/) checked this by brute force on $`K_9^{(3)}`$ and $`K_{12}^{(3)}`$.

## 4. Events and counts

### 4.1 Event family

$`\mathcal E`$ is the set of partial triple-matchings $`M`$ of $`V\setminus F`$ (identified with the events $`A_M`$) with $`j`$ triples, $`X=V(M)`$, such that for some colour $`u`$ one of the following holds.
- **(E1)** $`1\le j\le\lfloor t/2\rfloor`$, $`X`$ is $`u`$-closed, and the quotient of $`M_u`$ on the $`j`$ triples is connected.
- **(E2)** $`f\gt 0`$, $`1\le j\lt t/2`$, $`F\cup X`$ is $`u`$-closed, and the quotient of $`M_u`$ on $`\{F\}\cup M`$ is connected.

The new restriction compared with Theorem A is the connectivity requirement.

**Lemma D.** If $`\{F\}\cup P`$ is not seal-free, some event of $`\mathcal E`$ occurs.

*Proof.* Some $`Q_u`$ is disconnected. Every component of $`Q_u`$ is a $`u`$-closed union of blocks with a connected quotient.
- **$`f=0`$.** A smallest component has $`j\le t/2`$ triples, so (E1) occurs.
- **$`f\gt 0`$, small component.** If some component avoiding $`F`$ has $`j\le t/2`$ triples, (E1) occurs.
- **$`f\gt 0`$, otherwise.** There is exactly one component avoiding $`F`$, since two would hold more than $`t`$ triples. The component containing $`F`$ is then $`F`$ plus $`j'\lt t/2`$ triples, and $`j'\ge1`$ because $`F`$ alone is never $`u`$-closed (REVIEW item 2). So (E2) occurs. ∎

### 4.2 Colour classes

Rainbow gives $`\mathrm{int}_u\le1`$. Sub-valid gives $`\mathrm{int}_u=0`$ for $`u\in F`$. Hence:

| f | class | number of colours | $`\mathrm{ext}_u`$ | $`h_u`$ |
|---|---|---|---|---|
| 4 | $`u\notin F`$, $`\mathrm{int}_u=1`$ | ≤ 6 | 2 | $`h-3`$ |
| 4 | $`u\notin F`$, $`\mathrm{int}_u=0`$ | ≤ n | 4 | $`h-4`$ |
| 4 | $`u\in F`$ | 4 | 3 | $`h-3`$ |
| 5 | $`u\notin F`$, $`\mathrm{int}_u=1`$ | ≤ 10 | 3 | $`h-4`$ |
| 5 | $`u\notin F`$, $`\mathrm{int}_u=0`$ | ≤ n | 5 | $`h-5`$ |
| 5 | $`u\in F`$ | 5 | 4 | $`h-4`$ |

The colours $`u\notin F`$ with $`\mathrm{int}_u=1`$ are colours of edges of $`F`$, so there are at most $`\binom f2`$ of them. Consequently:
- For $`f=4`$, at most 10 colours have $`h_u=h-3`$ and all others have $`h_u=h-4`$.
- For $`f=5`$, at most 15 colours have $`h_u=h-4`$ and all others have $`h_u=h-5`$.
- For $`f=0`$, $`h_u=h`$.

These are the classes of REPORT §4, with the free-edge counts added.

### 4.3 Counts through a fixed vertex

Fix $`z\in V\setminus F`$ and $`j`$, and put $`s=3j`$. A colour $`u`$ has $`M_u(z)\in F`$ iff $`u=c(zy)`$ for some $`y\in F`$. These are exactly $`f`$ colours, all different from $`z`$.

**E1.** Let $`X\subseteq V\setminus F`$ be $`u`$-closed. Then $`X\setminus\{u\}`$ is a union of free $`u`$-edges, so $`u\in X`$ iff $`|X|`$ is odd. The number of connected splits of $`X`$ into triples depends only on the number $`m`$ of $`u`$-edges in $`X`$ and on $`d=[u\in X]`$; call it $`\mathrm{conn}(m,d)`$.
- **Recursion for $`\mathrm{conn}`$.** Condition on the component of a fixed endpoint of the first edge:
```math
\mathrm{conn}(m,d)=T(2m+d)-\sum_{(m',d')\ne(m,d)}\binom{m-1}{m'-1}\mathrm{conn}(m',d')\,T\bigl(2(m-m')+d-d'\bigr).
```
  For example $`\mathrm{conn}(1,1)=1`$, $`\mathrm{conn}(3,0)=10`$, $`\mathrm{conn}(4,1)=240\lt 280`$, $`\mathrm{conn}(6,0)=14400\lt 15400`$. These four values were also checked by brute force.
- **Even $`s=2k`$.** Here $`u\notin X`$. The vertex $`z`$ must lie on a free $`u`$-edge, which excludes $`u=z`$ and the $`f`$ colours $`c(zy)`$. Each remaining colour contributes $`\binom{h_u-1}{k-1}`$ sets $`X`$. Maximising over the class sizes gives
```math
E_1(j)\le \mathrm{conn}(k,0)\cdot\begin{cases}(n-1)\binom{h-1}{k-1}, & f=0,\\[2pt] 10\binom{h-4}{k-1}+(n-15)\binom{h-5}{k-1}, & f=4,\\[2pt] 15\binom{h-5}{k-1}+(n-21)\binom{h-6}{k-1}, & f=5.\end{cases}
```
- **Odd $`s=2k+1`$.** Here $`u\in X`$, so $`u\notin F`$. The colour $`u=z`$ contributes $`\binom{h_z}{k}`$. Each colour $`u\in V\setminus F\setminus\{z\}`$ contributes at most $`\binom{h_u-1}{k-1}`$; there are $`N-1`$ such colours, and at most $`\binom f2`$ of them lie in the larger class. Hence
```math
E_1(j)\le \mathrm{conn}(k,1)\cdot\begin{cases}\binom hk+(n-1)\binom{h-1}{k-1}, & f=0,\\[2pt] \binom{h-3}{k}+6\binom{h-4}{k-1}+(n-11)\binom{h-5}{k-1}, & f=4,\\[2pt] \binom{h-4}{k}+10\binom{h-5}{k-1}+(n-16)\binom{h-6}{k-1}, & f=5.\end{cases}
```

**E2** (only when $`f\gt 0`$ and $`2j\lt t`$).
- **Structure of $`X`$.** Let $`F\cup X`$ be $`u`$-closed and let $`E_u`$ be the set of outside partners of $`F`$, so $`|E_u|=\mathrm{ext}_u`$. Then $`X\supseteq E_u`$, and $`X\setminus(E_u\cup\{u\})`$ is a union of $`k`$ free $`u`$-edges. Indeed, a vertex $`x\in X\setminus(E_u\cup\{u\})`$ has its partner neither in $`F`$ (else $`x\in E_u`$) nor in $`E_u`$ (else $`x\in F`$).
- **Parity.** So $`s=\mathrm{ext}_u+2k+\delta`$, where $`\delta=[u\in X]`$ is fixed by parity and $`\delta=1`$ requires $`u\notin F`$.
- **Sets through $`z`$.** The number of such $`X`$ containing $`z`$ is
  - $`\binom{h_u}{k}`$ if $`z\in E_u`$ or $`z=u`$, which happens for at most $`f+1`$ colours;
  - $`\binom{h_u-1}{k-1}`$ if $`z`$ lies on a free $`u`$-edge.
- **Bound.** Summing over the classes of 4.2,
```math
E_2(j)\le T(s)\Big[\sum_{\text{classes}}(\#\text{colours})\binom{h_u-1}{k-1}+(f+1)\max_{\text{classes}}\binom{h_u}{k}\Big],
```
  where only classes compatible with the parity of $`s-\mathrm{ext}_u`$ are included. All splits are counted here; the connectivity restriction is not used for E2.

**Condition checked.** Each event of $`j`$ triples has probability $`q_j`$ and support of size $`3j`$. So (W) with constant $`a`$ holds if
```math
\sum_{j=1}^{\lfloor t/2\rfloor}c_j\,a^{3j}\le a-1,\qquad c_j=\bigl(E_1(j)+E_2(j)\bigr)\,q_j .\tag{∗}
```

### 4.4 Proof of Theorem B for odd $`155\le n\le187`$

For each such $`n`$, $`(\ast)`$ holds for the rational $`a`$ listed in Section 5, in exact arithmetic.
- By Lemma N, hypothesis (L) holds.
- By Lemma C, with probability at least $`a^{-N}\gt 0`$ no event of $`\mathcal E`$ occurs.
- By Lemma D, the partition $`\{F\}\cup P`$ is then seal-free. This partition has $`\lfloor n/3\rfloor`$ blocks, all of size at least 3.
- By REPORT §2, $`\mathrm{wld}_\rho(K_n)`$ equals the lower bound. ∎

## 5. Verification

Scripts are in `improvement/`:
- **`counts.py`**: implements $`T`$, $`q_j`$, $`\mathrm{conn}`$, $`E_1`$, $`E_2`$ and $`c_j`$ of Section 4, in exact `Fraction`s.
- **`ver.py lo hi`**: for each odd $`n`$, chooses $`a=k/2000`$ by a float scan, then checks $`(\ast)`$ exactly. The output is `ver.out`.

| n | n mod 6 | a | $`\sum c_ja^{3j}`$ | a − 1 | slack |
|---|---|---|---|---|---|
| 155 | 5 | 567/500 | 0.127723 | 0.134 | 0.0063 |
| 157 | 1 | 1131/1000 | 0.127070 | 0.131 | 0.0039 |
| 159 | 3 | 141/125 | 0.122106 | 0.128 | 0.0059 |
| 161 | 5 | 2279/2000 | 0.125810 | 0.1395 | 0.0137 |
| 163 | 1 | 2273/2000 | 0.125117 | 0.1365 | 0.0114 |
| 165–187 | all | 1.133–1.157 | | | 0.013–0.040 |
| 189 | 3 | 2301/2000 | 0.112021 | 0.1505 | 0.0385 |

The criterion fails at $`n=153`$ (−0.0016), 151 (−0.0039), 149 (−0.0015), 147 (−0.0096) and 145 (−0.0122).

**`bf.py`** brute-forces the counts and the decomposition.
- **Instances.** For $`n\in\{13,15,19,21,23,25\}`$ it uses the cyclic factorization and two random Kempe-switched factorizations each (generator `factor.py` from review/). For $`f\gt 0`$ it picks a random rainbow, sub-valid $`F`$.
- **Count check.** It enumerates all events of $`\mathcal E`$ (E1 and E2, as distinct partial matchings) with $`j\le 3`$, then compares $`\max_z`$ of the number of events through $`z`$ with $`E_1(j)+E_2(j)`$. Result: 43 comparisons, 0 violations. Equality occurs at $`n=15,21`$, $`j=1`$.
- **Decomposition check.** For 600 random partitions per factorization, every partition with a disconnected $`Q_u`$ contained an event of $`\mathcal E`$: about 9000 disconnected partitions, 0 misses.
- **Output.** `bf.out`.

**`bf_big.py`** repeats the count check without the decomposition test, for $`j\le2`$ only. It uses $`n=31,37,43`$ ($`f=4`$) and $`n=41,47,53`$ ($`f=5`$), with the cyclic factorization and one Kempe-switched factorization each. Result: all OK. For $`f=5`$, $`j=2`$ the ratio exact/bound reaches 0.9865 at $`n=53`$. That is expected: the E1 part of the bound is the exact worst case. Output: `bf_big.out`.

**Caveat on the instances above (found by the second referee).** The Kempe-switch generator starts from $`GK_{n+1}`$. For prime $`n`$ that factorization is perfect, so every Kempe switch only swaps two colour names and the "random" instances are $`GK_{n+1}`$ minus a vertex again. This affects $`n=13,19,23`$ in `bf.py` and all of `bf_big.py`. The second referee re-ran the event enumeration on non-perfect factorizations ($`n=13`$–27 with $`j\le3`$; $`n=31,41,43,47,49,53`$ with $`j\le2`$): 0 violations, tightest ratio 0.998 ($`n=21`$, $`j=3`$). See `review2/`.

**`ver_indep.py`** is a second implementation with different code paths:
- $`\mathrm{conn}`$ via exponential generating functions ($`C_0=\log A_0`$, $`C_1=A_1/A_0`$). It agrees with the recursion for $`m\le 12`$.
- $`q_j`$ by the product $`\prod_{i\lt j}\binom{N-1-3i}{2}^{-1}`$.
- $`E_1,E_2`$ by explicit maximisation over the unknown class sizes and over the excluded colours, instead of the closed forms.

For every odd $`n\in[155,189]`$ and every $`j`$, the coefficients of `counts.py` are $`\ge`$ these, and $`(\ast)`$ holds. Output: `ver_indep.out`, ending in ALL OK.

**Asymptotics of the leading terms.** For large $`n`$, $`c_1\approx 3/n`$ and $`c_2\approx 5/n`$. At $`n=153`$, $`a=1.1225`$, the terms $`c_ja^{3j}`$ are 0.0281 for $`j=1`$, 0.0667 for $`j=2`$, and 0.029 for all $`j\ge3`$ together, against $`a-1=0.1225`$.

## 6. What a referee should check

*Status:* an independent referee has checked all three points below, with code written from scratch; see `review2/REVIEW.md` (`review/` is the earlier review of REPORT.md, Theorem A). The referee found no error affecting Theorem B and recomputed $`(\ast)`$ in exact rationals for every odd $`n\in[155,195]`$.

1. Lemma C, particularly the induction order in Step 2 and the fact that (L) is applied only with $`R`$ vertex-disjoint from $`V(E)`$.
2. The class counts in 4.2–4.3, in particular the subtraction of the $`f`$ colours $`c(zy)`$ in the even E1 case.
3. That `counts.py` implements exactly the formulas of 4.3. The brute force agrees with it, but only for $`n\le25`$ with $`j\le3`$, and $`n\le53`$ with $`j\le2`$. A second implementation (`ver_indep.py`) agrees; it was written by the same author, so it is not an independent referee.

## 7. What failed or was not done

- **Shearer / cluster expansion as such (route 1).** REPORT §8 estimated a reach of $`n\approx130`$. The cluster-type gain is real but smaller than that:
  - Lemma C with the old counts reaches $`n\ge159`$ for $`n\equiv3\pmod 6`$ but only $`n\ge185`$ for the other residues.
  - The count refinements (connectivity, free-edge classes, E2 counted per vertex rather than in total) bring every residue to 155.
  - *Structural limit.* For any criterion of the form "$`\sum_{E\ni z}p_Ea^{|V(E)|}\le a-1`$" on uniform triple partitions, the terms $`j\le2`$ alone, about $`(3a^3+5a^6)/n\le a-1`$, force $`n\gtrsim100`$, since the maximum over $`a`$ of $`(a-1)/(3a^3+5a^6)`$ is ≈ 0.01005. The terms $`j\ge3`$ push the limit to about 150.
  - The exact Shearer region could be larger than this, but I have no computable handle on it.
- **Fixed valid triple for $`n\equiv0\pmod3`$** (a block $`F`$ with $`f=3`$). This is much worse: slack −0.044 at $`n=153`$. The "forced" outside partners of $`F`$ carry about $`3h`$ E2 events with $`j=1`$, and the per-vertex count must allow for a vertex that is forced for all three internal colours.
- **Vertex-dependent costs $`a_v`$.** Lemma C allows these, so forced vertices could get a larger cost. An *idealised* computation, which drops the $`(f+1)\max`$ term entirely and is **not a proof**, gives slack +0.0002 at 149 and +0.0005 at 151. For 153 it gives −0.0002, and that figure is for the variant with a fixed triple ($`f=3`$), since for $`f=0`$ there is no forced term at all. A real accounting adds terms for events through special vertices, and there can be up to 30 such vertices ($`f=4`$) or 60 ($`f=5`$). I estimate the net gain at about 0.002 at most. That might rescue 149, but 151 and 153 would still fail, so the threshold would not move. Not pursued.
- **Permutation model and design lemma (route 2).** Not achieved. A design (a set $`D`$ of $`2t`$ vertices with a perfect matching $`\Pi`$, plus a random bijection from pairs to singletons) removes invalid triples if each pair $`ab\in\Pi`$ has $`c(ab)`$, $`M_a(b)`$ and $`M_b(a)`$ outside the singleton set.
  - Each closed set is then a union of components of the graph $`\Pi\cup M_u`$, which has maximum degree 2.
  - Heuristically this reduces the $`j=2`$ weight from about $`5/n`$ to about $`2.7/n`$, with cost exponent $`2j`$ instead of $`3j`$.
  - However, Lemma C needs bounds on these local counts at *every* pair and singleton, for *every* factorization. I did not find a way to guarantee such a design except by a second probabilistic argument, whose concentration losses at $`n\approx50`$–150 look prohibitive.
- **Deterministic peeling and computer-assisted local proof (route 3).** Not attempted in this session.

## 8. Sources

- A. Dawkins, A. Nappo, J. Tong, C. Zimbizi, arXiv:2610.22142v1 (via REPORT.md; not re-read here).
- REPORT.md and review/REVIEW.md in this folder: Theorem A, the seal reduction, and the coupling proof of negative dependency (G1). Used as written.
- N. J. A. Harvey, J. Vondrák, "Short proofs for generalizations of the Lovász Local Lemma: Shearer's condition and cluster expansion", arXiv:1711.06797, Lemmas 1 and 5 (lopsided Shearer, lopsided cluster expansion). † Read only through an automated summary of the ar5iv page. Not needed for the proof.
- R. Bissacot, R. Fernández, A. Procacci, B. Scoppola, "An improvement of the Lovász local lemma via cluster expansion", Combin. Probab. Comput. 20 (2011). † Not consulted; cited from memory as context.

† = read only through a summary or cited from memory; Theorem B does not depend on it.
