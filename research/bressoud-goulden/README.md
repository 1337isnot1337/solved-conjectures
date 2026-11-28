# Bressoud–Goulden’s conjecture

Tracking issue: [#350](https://github.com/1337isnot1337/solved-conjectures/issues/350).

**The unimodality conjecture is not resolved here.** We give an infinite family refuting the distinct reciprocity claim printed immediately before it, and isolate the exact tournamented-major-index factors. Do not count this as a disproof of unimodality. Priority of the reciprocity correction is not established.

The primary source is D. M. Bressoud and I. P. Goulden, [Constant term identities extending the q-Dyson theorem](https://uwaterloo.ca/math/sites/default/files/uploads/documents/bresgtams1985.pdf), *Trans. Amer. Math. Soc.* 291 (1985), 203–228, [DOI](https://doi.org/10.1090/S0002-9947-1985-0797055-8), §3 pp. 215–216. For each tournament $`T`$ and multiset word with prescribed multiplicities $`a_i`$, the tournamented inversion number counts pairs of positions in which the later letter beats the earlier. The tournamented major index sums the major indices of the two-letter subwords, a descent in such a subword occurring when its next letter beats its current letter. The source conjectures that both generating polynomials are unimodal. The statement that both are reciprocal is separate.

## Last-occurrence factors and support endpoints

Let $`\pi`$ be the order of the letters obtained by reading their last occurrences from right to left. Write $`S_j=\sum_{h=j}^n a_{\pi(h)}`$ and $`S_{n+1}=0`$, assuming positive multiplicities (discard absent letters). Theorem 3.2 of the source says that the contribution of $`\pi`$ to the tournamented-major-index polynomial is
```math
 q^{c_T(\pi)} \prod_{j=1}^n
 \begin{bmatrix} S_j-1\\ a_{\pi(j)}-1\end{bmatrix}_q,\qquad
 c_T(\pi)=\sum_{\substack{i\to j\text{ in }T\\\pi^{-1}(i)<\pi^{-1}(j)}}a_j.
```
This product form follows by rewriting the source's factor
$`(q)_N\prod_j(1-q^{a_{\pi(j)}})/(\prod_i(q)_{a_i}\prod_j(1-q^{S_j}))`$ using the usual $`q`$-factorials and telescoping.

Each Gaussian factor is a polynomial with constant and leading coefficients one. Their total degree is
```math
 \sum_{j=1}^n (a_{\pi(j)}-1) S_{j+1}
 =M-\sum_{j\lt h}a_{\pi(h)},\qquad
 M=\sum_{i\lt j}a_ia_j.
```
For each unordered pair, exactly one of $`T`$ and its arc reversal $`T^\mathrm{op}`$ contributes the later letter's multiplicity to $`c_T(\pi)+c_{T^\mathrm{op}}(\pi)`$. Thus the least and greatest exponents of the full major polynomial are
```math
 \min_\pi c_T(\pi),\qquad M-\min_\pi c_{T^\mathrm{op}}(\pi),
```
and their coefficients count the respective minimizing orders.

## An infinite nonreciprocal family

On letters $`0,1,2,3`$, take arcs
```math
 0\to3,\quad 1\to0,\quad 2\to0,\quad 2\to1,\quad 3\to1,\quad 3\to2
```
and multiplicities $`(1,1,1,m)`$ for any $`m\ge2`$. The directed triangles $`0\to3\to1\to0`$ and $`0\to3\to2\to0`$ share exactly the arc $`0\to3`$. Every total order puts at least one edge of each triangle forward. If their shared arc is forward it charges $`m\ge2`$; if it is not, two distinct forward arcs each charge at least one. The orders $`(1,2,3,0)`$ and $`(1,3,0,2)`$ both attain total charge two. Hence the minimum is two, attained by at least two permutations.

For the reversed tournament, total charge one is achieved by the order $`(3,2,1,0)`$, whose only forward arc is $`3\to0`$ of charge one. Any charge-one order has exactly one forward arc, which must be in both reversed triangles and must therefore be $`3\to0`$. The other arcs form the unique transitive order after reversing the sequence convention, so $`(3,2,1,0)`$ is the only minimizer. Thus the least nonzero coefficient of the major polynomial is at least two, while the greatest nonzero coefficient is one. This disproves reciprocity about any center, not just the claimed center.

For $`m=2`$, direct enumeration of the 60 words gives
```math
 4q^2+11q^3+16q^4+15q^5+9q^6+4q^7+q^8,
```
which is nonreciprocal but still unimodal. Reversing a word does complement the inversion statistic to $`M`$, but a two-letter major index under reversal involves the positions of the transformed adjacent descents, not the total complement $`a_i a_j-\mathop{\mathrm{maj}}`$ word by word.

As a separate structural observation, if all multiplicities equal $`m`$, Theorem 3.2 factors the whole major polynomial as
```math
 \left(\prod_{r=0}^{n-1}\begin{bmatrix}(r+1)m-1\\ m-1\end{bmatrix}_q\right)
 \,\sum_{\pi\in S_n} q^{m\,|\{i\to j:\pi^{-1}(i)<\pi^{-1}(j)\}|}.
```
The second factor is the tournament inversion enumerator at $`q^m`$ (reverse the order if using the later-beats-earlier convention). The Gaussian multiplier is reciprocal and unimodal, but does not by itself give unimodality of this product because the second factor occupies only exponents divisible by $`m`$.

