# Dual Chow real-rootedness and interlacing for all paving matroids

**Theorem.** For every positive-rank paving matroid $`M`$, the dual Chow polynomial $`H_M^*(x)`$ and the dual right augmented Chow polynomial $`F_M^*(x)`$ have only nonpositive real roots, and $`H_M^*`$ interlaces $`F_M^*`$.

This proves all the conclusions of [Caiolo–Ferroni–Hoster, Conjecture 7.3](https://arxiv.org/html/2605.28474v1#S7.SS2) for the full paving class. The universal statement is separately [refuted by the repository's rank-five coalesced projective-geometric family](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/caiolo-ferroni-hoster/PROOF.md); that family retains three-point circuits on projective lines, and so is not paving. This is not a second resolution count for the same universal conjecture. Caiolo–Ferroni–Hoster already proved real-rootedness for uniform matroids (Corollary 6.11), using the refined stable-descent interlacing theory of [Hoster–Stump](https://arxiv.org/html/2508.15538v1#S3). The argument below uses that same interlacing diagram with new nonnegative weights obtained from the paving hyperplanes. Searches for the dual Chow conjecture on paving and sparse paving matroids found no prior proof in this scope; priority is not certified.

## 1. A flag-vector correction for paving hyperplanes

Write $`r=\mathop{\mathrm{rk}}M`$ and $`n=|E(M)|`$, and assume first $`r\ge2`$. A paving matroid has no circuits of size less than $`r`$; hence every set of size at most $`r-1`$ is independent and every set of size at most $`r-2`$ is a flat. Every $`(r-1)`$-set belongs to a unique hyperplane, its closure. Let $`\mathcal H`$ be the collection of hyperplanes of size $`h\ge r`$; the other hyperplanes have size exactly $`r-1`$.

For a matroid $`N`$ of rank $`r`$, let $`\alpha_N(D)`$, $`D\subseteq[r-1]`$, count flat chains at the ranks in $`D`$, and let $`\beta_N`$ be the associated alternating subset transform. Let $`E(m,D)`$ count permutations of $`[m]`$ with descent set exactly $`D`$, and let $`U_{r,n}`$ be the rank-$`r`$ uniform matroid. For $`r-1\notin D`$, the flag counts $`\alpha_M(D)`$ are unchanged from $`U_{r,n}`$. If $`r-1\in D`$, write $`D'=D\setminus\{r-1\}`$. Each large hyperplane $`H`$ of size $`h`$ replaces $`\binom h{r-1}`$ Boolean hyperplanes of the uniform lattice, whose downsets had the lower flags of a Boolean lattice on $`r-1`$ elements, by one hyperplane whose lower flags are those of the Boolean lattice on $`h`$ elements (only the ranks at most $`r-2`$ are used). Hyperplanes never overlap in an $`(r-1)`$-set, so the respective decrements add. Taking the alternating subset transform gives a hyperplane's decrement in $`\beta(D)`$ as
```math
 \binom h{r-1}E(r-1,D')-E(h,D')=E(h,D).
```
Indeed choose the first $`r-1`$ entries of a permutation of $`[h]`$, arrange them with relative descent set $`D'`$, and append the complement increasingly. The only extra possible descent is at position $`r-1`$, giving the identity. We used here the standard Boolean flag identity $`\beta_{B_m}(D)=E(m,D)`$, obtainable by counting permutations with descent set contained in $`D`$ as the corresponding products of multinomial coefficients.

Consequently
```math
 \beta_M(D)=E(n,D)-
   \boldsymbol{1}_{r-1\in D}\sum_{H\in\mathcal H}E(|H|,D)
 \qquad (D\subseteq[r-1]).
 \tag{1}
```

## 2. Gamma polynomials and their nonnegative weights

For $`T\subseteq [a]`$, let $`p_{a,k}^{T}(z)`$ count permutations of $`[a+1]`$ beginning with $`k+1`$, with descent set contained in $`T`$ and no two consecutive descents, by their number of descents. As in CFH Theorem 4.9, $`\gamma(H_M^*;z)`$ is $`\sum_S\beta_M([r-1]\setminus S)z^{|S|}`$ over stable sets $`S\subseteq[r-2]`$, and $`\gamma(F_M^*;z)`$ is the same sum over stable sets $`S\subseteq[r-1]`$. Here “stable” means having no consecutive elements.

Put
```math
 u_k(m)=\binom{m-1-k}{r-1-k},\qquad
 c_k=u_k(n)-\sum_{H\in\mathcal H}u_k(|H|)\qquad(0\le k\le r-1).
```
For $`D\subseteq[r-1]`$, every permutation counted by $`E(m,D)`$ has an increasingly ordered tail after its first $`r`$ entries. Standardize those first $`r`$ entries to $`\sigma\in S_r`$. If $`\sigma(r)=k+1`$, its final value (before standardization) must be $`k+1`$ as all the remaining entries of the tail are greater. There are $`\binom{m-1-k}{r-1-k}=u_k(m)`$ ways to select the other used entries above it. Reversing $`\sigma`$ turns its ascents into descents and moves its last entry to the first, so stable ascent sets $`S\subseteq[r-2]`$ become stable descent sets that omit position 1. In (1), those $`S`$ use the coefficient $`c_k`$, while $`S`$ containing $`r-1`$ use the unchanged coefficient $`u_k(n)`$. Thus
```math
 \begin{aligned}
 h(z):=\gamma(H_M^*;z)
  &=\sum_{k=0}^{r-1}c_k p^{[2,r-1]}_{r-1,k}(z),
 \\ f(z):=\gamma(F_M^*;z)
  &=h(z)+\sum_{k=0}^{r-1}u_k(n)
      \sum_{\substack{w\in S_r,\ w(1)=k+1
             \\ \mathop{\mathrm{Des}}(w)\ {\rm stable},\,1\in\mathop{\mathrm{Des}}(w)}}
                   z^{|\mathop{\mathrm{Des}}(w)|}.
 \end{aligned}
 \tag{2}
```
The first of these formulas may have negative $`c_k`$, so individual termwise positivity does not suffice.

Set $`a=r-2`$, and for $`0\le j\le a`$ put
```math
 \begin{aligned}
 G_j&=p^{[1,a]}_{a,j},& T_j&=p^{[2,a]}_{a,j},
 \\ Q_j(m)&=\binom{m-1-j}{r-2-j},&
 P_j&=\sum_{k=0}^j c_k,\qquad Q_j=Q_j(n).
 \end{aligned}
```
Intervals of positions with upper endpoint less than lower endpoint are empty. Removing and standardizing a permutation's first entry gives two recurrences. If its first comparison is an ascent, then the index of its new first entry is $`j\ge k`$, and any stable descent set on later positions is allowed. If its first comparison is a descent, then the new first index is $`j<k`$, and the new first comparison cannot also descend. Applying these recurrences to (2) and the binomial identity $`\sum_{k=j+1}^{r-1}u_k(m)=Q_j(m)`$ gives
```math
       h=\sum_{j=0}^a P_jG_j,\qquad f=h+zL,\qquad
       L=\sum_{j=0}^a Q_jT_j .
 \tag{3}
```

We claim $`P_j\ge0`$ and $`P_j/Q_j`$ is nondecreasing in $`j`$. Since distinct hyperplanes cannot share an $`(r-1)`$-set, the number
```math
 C=\binom n{r-1}-\sum_{H\in\mathcal H}\binom{|H|}{r-1}
   =\sum_{k=0}^{r-1}c_k
```
is nonnegative. Each ratio $`u_k(h)/u_k(n)`$ is nondecreasing in $`k`$, as it is a product of the factors $`(h-r+i)/(n-r+i)\le1`$ for $`1\le i\le r-1-k`$. Therefore the signs of $`c_k=u_k(n)(1-\sum_H u_k(|H|)/u_k(n))`$ change at most once from nonnegative to nonpositive. Every prefix sum is then nonnegative: before the sign change all summands are nonnegative, and afterward each prefix sum is at least the nonnegative total $`C`$.

Also
```math
 \frac{P_j}{Q_j}
   =\frac{C}{Q_j}-1+\sum_{H\in\mathcal H}\frac{Q_j(|H|)}{Q_j(n)}.
 \tag{4}
```
The $`Q_j=Q_j(n)>0`$ are nonincreasing in $`j`$. The ratios on the right of (4) are likewise nondecreasing in $`j`$, since they are products of factors $`(h-r+1+i)/(n-r+1+i)\le1`$ for $`1\le i\le r-2-j`$. This proves both claims.

## 3. Interlacing

Write $`p\preceq q`$ in the ordered interlacing convention of Hoster–Stump: in particular if $`p\preceq q`$ are nonnegative real-rooted polynomials, then $`q\preceq zp`$. We use their Lemma 2.1 for addition in either interlacing cone and Theorem 3.3 with $`T=[1,a]`$. It gives the interlacing rows $`(T_j)_j,(G_j)_j`$, and the top row $`(T_j)_j`$ followed by the bottom row $`(G_j-T_j)_j`$ is also an interlacing sequence. The latter is the diagonal path noted explicitly in their proof of Theorems 1.1 and 1.2. At $`a=0,1`$ the same row assertions are immediate: $`T_0=G_0=1`$ for $`a=0`$; at $`a=1`$ the top, middle and bottom rows are $`(1,0),(1,z),(0,z)`$. Zero entries can be omitted.

To compare the two weighted top rows, define $`L_{\ge k}=\sum_{j\ge k}Q_jT_j`$. Then $`L\preceq L_{\ge k}`$: split $`L`$ into this suffix and the complementary prefix, whose members all precede the members of the suffix, and use the cone addition property on both sides. Since the nonnegative numbers $`P_j/Q_j`$ increase with $`j`$, write their differences as $`d_k=P_k/Q_k-P_{k-1}/Q_{k-1}\ge0`$, with the preceding ratio 0 at $`k=0`$. This gives
```math
 L\preceq\sum_{k=0}^a d_k L_{\ge k}
         =\sum_{j=0}^a P_jT_j .
```
The two-row path of the Hoster–Stump diagram also gives $`L\preceq\sum_jP_j(G_j-T_j)`$, because all top-row members precede all bottom-row members. Their sum is $`h`$, so $`L\preceq h`$. Therefore $`h\preceq zL`$ and $`h\preceq h+zL=f`$. Both $`h,f`$ are nonnegative real-rooted polynomials by (3), with $`h`$ nonzero (its constant is the positive top absolute Möbius invariant of a geometric lattice).

The two original polynomials are palindromic, have nonnegative coefficients and degrees $`r-1,r`$, again by CFH Theorem 4.9 and the positive constant of $`h`$. Hoster–Stump Lemma 2.4 and Proposition 2.5 now lift $`\gamma`$-real-rootedness and ordered $`\gamma`$-interlacing to real-rootedness and interlacing of $`H_M^*,F_M^*`$. Rank one has $`H_M^*=1`$ and $`F_M^*=1+x`$ directly. This completes the proof.
