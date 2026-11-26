# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

[Complete Lean formalization and source-statement audit](LEAN-AUDIT.md). The formalization covers every positive permutation size and every pinnacle set, including the consequence for every peak count.

**Result.** [Gessel and Zhuang, *Two-sided permutation statistics via symmetric functions*, Conjecture 7.3](https://arxiv.org/html/2306.15785v3#S7.SS2) holds for every $n$ and every pinnacle set $S$. In fact the inverse-descent polynomial for a fixed pinnacle set decomposes into symmetric, real-rooted polynomials with the same symmetry center. This also proves their Conjecture 7.2 on fixed peak count. The separate inverse-peak real-rootedness Conjecture 7.1 is not claimed.

For a permutation $\pi$, a *pinnacle* is a value at an interior peak, and $`\mathop{\mathrm{ides}}(\pi)=\#\{i\in[n-1]:\pi^{-1}(i)>\pi^{-1}(i+1)\}`$. Write
```math
 F_{n,S}(t)=\sum_{\pi:\mathop{\mathrm{Pin}}(\pi)=S}t^{\mathop{\mathrm{ides}}(\pi)}.
```
Gessel–Zhuang's polynomial is $tF_{n,S}(t)$, so it suffices to prove that $F_{n,S}$ is gamma-positive with center $(n-1)/2$.

## 1. The internal-gap path

This is the increasing-exposure version of a Françon–Viennot type path refinement. In the unweighted setting [Fang, *Efficient recurrence for the enumeration of permutations with fixed pinnacle set*, Proposition 2.3 and Remark 2.6](https://dmtcs.episciences.org/9188/pdf) uses the complementary descending-exposure segment path on permutations made cyclic by inserting an additional maximum. Our additional state is the number of positioned gaps to the left of the most recently exposed value, which captures inverse descents.

Take a final permutation $\pi$ and expose its values in the order $1,2,\ldots,n$. After exposing $1,\ldots,i$, retain their left-to-right order and place a gap marker whenever two consecutive exposed entries in that order have at least one unexposed entry between them in $\pi$. Such a marker is *internal*: we place no markers before the first or after the last exposed value, even if there are still unexposed values there. Let $h_i$ be the number of markers. Then $h_1=h_n=0$.

At stage $i+1$, there are two kinds of insertion.

* If $i+1$ is between exposed entries, it lies in one of the $h_i$ internal gaps. Replace the selected gap with the new entry, retaining a new marker on either side exactly when that side contains unexposed entries of $\pi$. This can replace one gap with zero, one, or two. A replacement by zero occurs exactly when both final neighbors of $i+1$ are smaller, i.e. $i+1$ is a pinnacle.
* If $i+1$ is outside all exposed entries, insert it at the left or the right. On its inward side one may place a new internal gap or not. This changes $h_i$ by $+1$ or $0$. The outward side is not tracked: its final neighbor, if any, is larger than $i+1$, so this placement is not a pinnacle.

Conversely, start at the word $1$ and make abstract insertion choices of exactly these types with a nonnegative gap sequence ending at zero. They produce a unique permutation and its original exposure history. To check this, an internal marker may be selected and replaced but cannot disappear in any other way, so every internal marker created in the history ultimately receives at least one later entry. No later entry may go between an exposed pair without a marker, since exterior insertions are always outside all then-exposed entries. Thus the markers faithfully recover precisely the nonempty internal runs hidden at every stage. There is no need for any flag at either exterior side. This gives the required bijection between valid histories and permutations.

In particular the pinnacle set is exactly the set of labels on the down steps
```math
 \mathop{\mathrm{Pin}}(\pi)=\{i\in\{2,\ldots,n\}:h_i=h_{i-1}-1\}.
```
Reversing the final permutation does not change any $h_i$, since it reverses the positions of internal gaps. It changes every inverse comparison between consecutive values to its opposite. The inverse-descent polynomial $F_{\mathbf h}(t)$ for a fixed full path $\mathbf h=(h_1,\ldots,h_n)$ is therefore symmetric with center $(n-1)/2$.

## 2. An interlacing recurrence for each path

Fix one such path. At an intermediate height $h$, refine the polynomial by the number $`l\in\{0,\ldots,h\}`$ of internal gaps lying to the left of the most recently inserted label. Let $f_l(t)$ count partial histories along the fixed path, with weights for inverse comparisons already determined. Initially $f_0=1$.

Index the existing internal gaps $j=0,\ldots,h-1$ from left to right. The inverse descent between the most recent label and the next label occurs exactly when the chosen position is to its left. For an internal gap $j$, this means $j<l$; for the far-left and far-right exterior insertions it is always true or always false, respectively. Define the choice polynomials
```math
 g_j=\sum_{l\le j}f_l+t\sum_{l>j}f_l,\qquad -1\le j\le h,
\tag{1}
```
where the two extreme indices stand for the left and right exterior placements.

* On a down step from $h$ to $h-1$, an internal gap $j$ is filled without replacement. The new label has $j$ gaps to its left, so the new vector is $(g_0,\ldots,g_{h-1})$.
* On an up step to $h+1$, an internal gap $j$ splits in two, giving $j+1$ gaps to the left of the new label. Exterior left and right obtain $0$ and $h+1$ gaps to the left. The new vector is $(g_{-1},g_0,\ldots,g_h)$.
* On a flat step, an internal gap $j$ is replaced by a single left or right gap, giving $j+1$ or $j$ gaps to the left. An exterior placement leaves $0$ or $h$ gaps to the left. So the output at new state $l$ is $g_{l-1}+g_l$, for $0\le l\le h$. This includes $h=0$, when the two exterior placements give the sole output.

Say that an indexed vector of nonzero real-rooted polynomials with nonnegative coefficients has the required compatibility if, for every $i<j$, both $(f_i,f_j)$ and $(f_i,t f_j)$ are *compatible*: every nonnegative linear combination is real-rooted. [Savage–Visontai, Theorem 2.3](https://arxiv.org/pdf/1208.3831v3) says exactly that the threshold transform (1) preserves this property, upon reading both the input and output lists in reverse order. The reversal makes the initial segment receiving a factor $t$ increase in length, and the ordered condition becomes compatibility of $t$ times the earlier polynomial with the later one. If the input has one polynomial, its real-rootedness is already part of the requirement, and (1) consists of it and its multiple by $t$, which are compatible. Otherwise the theorem and pairwise compatibility in the output also give individual real-rootedness.

Taking a consecutive sublist (the down step) preserves the property. Adjacent sum grouping (the flat step) preserves it as well. Indeed, each sum is real-rooted by compatibility. For two distinct groups $(g_{i-1}+g_i,g_{j-1}+g_j)$ with $i<j$, all constituent polynomials are pairwise compatible. For the modified pair $(g_{i-1}+g_i,t(g_{j-1}+g_j))$, cross-pairs are compatible since the first-group index is always at most the second-group index. At equality, $g_s$ and $t g_s$ are compatible because every linear combination factors by $g_s$. The second group is internally compatible since multiplying by $t$ preserves real-rootedness. Thus the pair of sums is compatible in both cases by [the Chudnovsky–Seymour pairwise criterion, as stated in Savage–Visontai, Lemma 2.2](https://arxiv.org/pdf/1208.3831v3). This argument handles the possible overlap of adjacent groups explicitly.

Starting with the singleton $1$, induction therefore keeps the required compatibility at every step. All these entries have positive leading coefficients because (1) of any vector with positive leading coefficients has nonzero nonnegative entries, as do the stated output operations. At the end $h_n=0$ and its sole polynomial is $F_{\mathbf h}(t)$, which is real-rooted.

## 3. Gamma-positivity

A real-rooted polynomial with nonnegative coefficients, symmetric with center $(n-1)/2$, is gamma-positive at that center. To see this directly, remove its lowest power $t^a$. Its remaining zeros are nonzero and negative, and symmetry pairs $-r$ with $-1/r$; an unpaired zero can only be $-1$. The corresponding factors are
```math
 (1+t)^2+(r+r^{-1}-2)t \quad\text{or}\quad 1+t .
```
Since $r+r^{-1}-2\ge0$, their product (times the positive leading coefficient and $t^a$) has a nonnegative expansion in $t^j(1+t)^{n-1-2j}$.

Apply this to each $F_{\mathbf h}$. The sum over all paths with down labels $S$ is $F_{n,S}$; all pieces have the same center and hence their gamma coefficients add nonnegatively. If there is no such path, the polynomial is zero and the statement is vacuous. Multiplying by $t$ yields the conjectured center $(n+1)/2$. Summing over $|S|=k$ likewise proves the fixed-peak-count Conjecture 7.2. $\square$

## Scope and attribution

The fixed-path real-rootedness is stronger than what is needed here; no interlacing between distinct paths is assumed, and the proof does not assert real-rootedness after summing them. The [portable checker](check-path.py) is only an independent finite check of the statistic-preserving path recurrence, not a step of the proof. Gessel and Zhuang formulated the two conjectures; the underlying unweighted path construction is related to Fang’s Françon–Viennot refinement as noted in Section 1, and the root-preserving threshold operator is the existing Savage–Visontai theorem. No earlier resolution was found in targeted searches by the article title, conjecture numbers, pinnacle-set/inverse-descent formulation, and existing repository issue records as of 24 November 2026; worldwide priority is not claimed.
