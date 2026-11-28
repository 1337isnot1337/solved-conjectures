# Kurşungöz’s unimodality conjecture and flattened-cycle inversions

This note gives an exact reformulation of [Kurşungöz, arXiv:2502.17117v1, Theorem 3 and Conjecture 4](https://arxiv.org/pdf/2502.17117#page=8), a closed specialization at $`q=1`$, and some general families with unimodality. The full conjecture is not resolved here. The permutation statistic is classical in Gessel’s $`q`$-exponential formula; the point here is to identify its exact reciprocal relation to the polynomials of the 2025 conjecture.

Write $`v=(n_1,\ldots,n_k)`$, $`N=\sum_i in_i`$, $`m=\sum_i n_i`$, and $`[a]=1+q+\cdots+q^{a-1}`$. Set
```math
 A_i(v)=\sum_{j>i}(j-i)n_j,\qquad
 D(v)=\sum_i n_i\binom{i-1}{2}+
       \sum_{\{a,b\}}(\max(a,b)-1)\min(a,b).
```
The last sum is over unordered pairs of distinguishable occurrences of block sizes in $`v`$, and includes equal sizes. The source recurrence is
```math
 b_v(q)=\sum_{i:n_i>0}q^{A_i(v)}\!\prod_{h=1}^{i-1}[N-h]\ b_{v-e_i}(q),\qquad b_0=1.
```
Every displayed summand has degree $`D(v)`$. Indeed
```math
 D(v)-D(v-e_i)=\binom{i-1}{2}+
                    \sum_{\text{other }j}(\max(i,j)-1)\min(i,j),
```
while the degree supplied by the product of boxes is
```math
 \sum_{h=1}^{i-1}(N-h-1)=\binom{i-1}{2}+(i-1)(N-i).
```
The difference of these two displays is precisely $`\sum_{j>i}(j-i)n_j`$, as a pair with $`j\le i`$ contributes $`(i-1)j`$ already and one with $`j>i`$ needs $`j-i`$ more. Thus $`C_v(q)=q^{D(v)}b_v(q^{-1})`$ obeys
```math
 C_v(q)=\sum_{i:n_i>0}\prod_{h=1}^{i-1}[N-h]\ C_{v-e_i}(q),\qquad C_0=1. \tag{1}
```

## Combinatorial model

Take the permutations of $`[N]`$ with $`n_i`$ cycles of length $`i`$. Write each cycle starting from its minimum, sort cycles in increasing order of their minima, and erase parentheses to obtain a word $`\mathrm{flat}(\pi)`$. Then
```math
 C_v(q)=\sum_{\pi\text{ of cycle type }v}
       q^{\mathop{\mathrm{inv}}(\mathrm{flat}(\pi))}. \tag{2}
```
The cycle containing $`1`$ is first. If its length is $`i`$, select its remaining $`i-1`$ entries in order, scoring each by the number of smaller labels still available. At the $`h`$-th such choice there are $`N-h`$ labels, so the score runs independently through $`0,\ldots,N-h-1`$. Relabel the remaining set increasingly and continue. Scores sum to the flattened word’s inversions, proving (1) and (2). The original and reflected coefficient sequences are unimodal simultaneously.

In particular, the $`q=1`$ specialization for all $`k`$ is
```math
 b_v(1)=\frac{N!}{\prod_i i^{n_i}n_i!}.
```
This follows either from (2) and the usual cycle-type count or by substitution in (1), since the normalized contribution of choice $`i`$ is $`in_i/N`$. At $`k=2`$ it is the Bessel coefficient already given in the source; for $`k=3`$ it is the same standard cycle-type count, though the source did not identify its values with an OEIS entry. This also gives a random-variable formulation: choose cycle lengths sequentially with probability $`in_i/N`$ at the current state, and conditional on those lengths sum independent uniforms of sizes $`N-h`$ from each deletion.

There is an equivalent formula using just the internal suffix sums of each distinct rearrangement $`\boldsymbol a=(a_1,\dots,a_m)`$ of the multiset. Write $`B(\boldsymbol a)=\{a_j+\cdots+a_m:2\le j\le m\}`$. Then
```math
 C_v(q)=\sum_{\boldsymbol a}\prod_{\substack{1\le d\lt N\\d\notin B(\boldsymbol a)}}[d]. \tag{3}
```
Indeed the product omits exactly one boundary between successive deleted blocks in the descending lists of available labels. Formulas (2)–(3) offer two routes to the remaining conjecture, but a positive sum of box products of different degrees is not automatically unimodal.

## An exact generating product and its relation to Gessel

Let $`t^v=\prod_i t_i^{n_i}`$ and $`G(x)=\sum_v C_v(q)t^v x^N/[N]!`$.
Dividing (1) by $`[N-1]!`$ gives $`D_qG=(\sum_i t_i x^{i-1})G`$.
Iterating the equivalent difference equation gives
```math
 G(x)=\prod_{j\ge0}\left(1-(1-q)\sum_i t_i x^i q^{ij}\right)^{-1}. \tag{4}
```
For example this follows analytically when $`|q|<1`$ and $`x`$ is small, then coefficientwise over the rational functions of $`q`$. It yields a finite formula for each profile: writing $`|u|=\sum_i u_i`$, $`W(u)=\sum_i iu_i`$, and
```math
 K_u(q)=\frac{(|u|-1)!}{\prod_i u_i!}
        \frac{(1-q)^{|u|}}{1-q^{W(u)}}\qquad (u\ne0),
```
expand the log of (4) to obtain
```math
 C_v(q)=[N]!\!\!\sum_{\substack{(m_u)\\ \sum_{u\ne0}m_u u=v}}
                    \prod_{u\ne0}\frac{K_u(q)^{m_u}}{m_u!}.
```
This expression is rational term by term but the sum is polynomial by (1).

Gessel uses the convention “maximum first, maxima increasing,” whereas (2) uses minimum first, minima increasing. Reverse both positions and labels in (2); the new blocks now have their maximum last and their maxima are in increasing order. Move each final maximum to the beginning of its own block, adding $`i-1`$ inversions to a block of size $`i`$, with no interblock change. This is an invertible map, so Gessel’s exact fixed-profile polynomial is $`q^{N-m}C_v(q)`$. Formula (4) is correspondingly a specialization of his $`q`$-exponential formula, or follows directly as above. In particular his Section 6 coefficient formula already supplies a closed expression for the two-length $`\{1,2\}`$ specialization, after reflection and the displayed power of $`q`$.

## Verified families and a mode window

A box convolution preserves unimodality: multiplying a nonnegative unimodal sequence $`p`$ by $`[d]`$ yields first differences $`p_j-p_{j-d}`$ after extending by zeros. On each side of the mode these have the required sign, and through the intermediate range $`p_j`$ decreases and $`p_{j-d}`$ increases. Hence their signs change at most once from positive to negative.

* If all nonzero cycles have one length, (3) has one term and is a product of boxes, so it is symmetric unimodal. This includes fixed-point-free involutions.
* For exactly two cycles of distinct lengths $`a,b`$, factor out every box except those at $`a,b`$ in (3), leaving $`[a]+[b]`$, whose coefficients decrease weakly. Box convolution proves unimodality for all lengths. Equal lengths are already covered.
* More generally put $`S=\sum_{\{a,b\}}|a-b|`$. The shifts $`s(\boldsymbol a)`$ in the source’s original recurrence expansion are $`\sum_{i<j}(a_j-a_i)_+`$, hence lie in $`[0,S]`$, with both endpoints attained. Its term for $`\boldsymbol a`$ is a shifted symmetric unimodal polynomial with common top degree $`D(v)`$ and center $`(D(v)+s(\boldsymbol a))/2`$. Therefore all first differences of $`b_v`$ before the smallest possible center have the weakly increasing sign and all after the largest possible center have the weakly decreasing sign. More precisely, the difference at integer index $`j`$, between the coefficients at $`j`$ and $`j-1`$, cannot turn negative if $`j-\tfrac12\le D(v)/2`$ or positive if $`j-\tfrac12\ge (D(v)+S)/2`$. If $`S\le2`$, at most one half-integer is strictly between the extrema, proving unimodality in that entire case.

## Attribution and status

Ira M. Gessel, [*A $`q`$-analog of the exponential formula*](https://doi.org/10.1016/0012-365X(82)90189-3) (1982; reprinted 2006), uses the Foata block/cycle correspondence for inversions and basic-component length profiles. The exact convention change and fixed shift are shown above. The present reformulation is not a priority claim for the statistic, correspondence, or generating product. The exact Kurşungöz conjecture and its status were checked by title, arXiv number, author, and inversion-statistic formulations; no earlier resolution was found in that bounded search. In particular, no claim is made for profiles with arbitrary unequal lengths and multiplicities.
