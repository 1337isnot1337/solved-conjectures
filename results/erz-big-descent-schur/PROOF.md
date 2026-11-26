# Elizalde–Rivera–Zhuang conjecture (Conjecture 4.9)

The written proof covers the original symmetry and Schur-positivity assertion and gives a refinement by exact longest increasing subsequence length. [Independent mathematical review](AUDIT.md)

## Statement and provenance

Sergi Elizalde, Johnny Rivera Jr., and Yan Zhuang, *Counting Pattern-Avoiding Permutations by Big Descents*, [arXiv:2408.15111](https://arxiv.org/abs/2408.15111), Annals of Combinatorics (2026), [DOI 10.1007/s00026-026-00805-1](https://doi.org/10.1007/s00026-026-00805-1), Conjecture 4.9, Section 4.3.

For a permutation `p` let `Bdes(p)={i : p_i>p_{i+1}+1}`. Define the usual fundamental quasisymmetric function `F_{n,S}` by summing `x_{i_1}...x_{i_n}` over weakly increasing positive indices, with strict increases at positions in S. The conjecture asserts that, for every n≥0 and m≥1,
```math
Q_{n,m}(x)=\sum_{\substack{p\in S_n\\\mathop{\mathrm{LIS}}(p)\lt m}}F_{n,\mathop{\mathrm{Bdes}}(p)}(x)
```
is symmetric and Schur-positive. Avoidance of the increasing pattern 12…m is exactly LIS < m.

**Theorem.** More strongly, for every n and k, the contribution from permutations whose LIS equals k is symmetric and Schur-positive. Thus the entire conjecture holds, with no dimension or pattern-length restriction. Conjecture 4.4 in the same paper is a different real-rootedness assertion and is not resolved here.

All arguments below work with finite alphabets and stabilize degree by degree, so formal series in infinitely many variables cause no convergence issue. The empty permutation contributes 1.

## 1. Weighted runs and RSK

Put `y_i=x_i/(1-x_i)`. We first prove the identity of formal generating series
```math
\sum_{n\ge0}Q_{n,m}(x)
=\sum_{\lambda_1\lt m}f^\lambda s_\lambda(y),
\tag{1}
```
where f^λ counts standard Young tableaux of shape λ. More generally the exact LIS=k series is the same sum with λ_1=k.

A term of the fundamental quasisymmetric function amounts to giving the permutation positions weakly increasing colors, strictly increasing at each big descent. Positions of each color form one contiguous block; within a block every descent is a decrease by exactly 1.

Divide each color block into maximal descending runs. Each run consists of a consecutive interval of values in decreasing order. Successive runs in a block have an ascent at the boundary. Since the intervals are disjoint, this implies that the first interval lies entirely below the second in value. Thus the runs within a block are in increasing order of their intervals.

The run intervals over all colors partition [n]. Read them in increasing order of their values, record their colors as a word w, and record their positive integer lengths. Conversely, given any colored word w with positive run lengths totaling n, form consecutive value intervals in word order. For each color in increasing order concatenate its intervals in increasing interval order, each interval being read in decreasing order. Within a color block these are exactly the maximal descending runs. This is an inverse construction, including when successive intervals have the same color.

An increasing subsequence of the permutation uses at most one value from each descending interval. Its selected intervals must be in increasing interval order and their colors must be weakly increasing. Conversely any such weakly increasing subsequence of w allows one value from each selected interval, giving an increasing subsequence of the permutation. Therefore LIS(p) equals the longest weakly increasing subsequence length of w.

A run of color i and length r≥1 contributes x_i^r, hence summing lengths gives y_i. For ordinary words, the row-insertion RSK correspondence gives a semistandard insertion tableau and a standard recording tableau of the same shape λ; the longest weakly increasing subsequence length is λ_1. Summing weights over words gives (1). In particular symmetry follows already from this identity.

It is important that s_λ(y) alone need not be Schur-positive as a series in x. The rest of the proof establishes positivity of the specified sums, not of the substitution on arbitrary Schur functions.

## 2. The content-raising derivation

Define `D=Σ_i x_i² ∂/∂x_i`. It raises homogeneous degree by one, and
```math
\exp(D)H(x)=H\left(\frac{x_1}{1-x_1},\frac{x_2}{1-x_2},\ldots\right).
\tag{2}
```
Indeed the formal flow of dx/dt=x² is x/(1-tx), or equivalently the derivation exponential is multiplicative and has this value on each variable.

For any partition λ,
```math
D s_\lambda =\sum_{b\text{ addable to }\lambda} c(b)s_{\lambda+b},
\qquad c(b)=\mathop{\mathrm{column}}(b)-\mathop{\mathrm{row}}(b).
\tag{3}
```
To check this, use N variables and the alternant formula with exponents λ_j+N-j. Applying D to the numerator determinant raises each exponent in turn with coefficient λ_j+N-j. A repeated exponent gives zero; the other terms are exactly the addable boxes within N rows. On the Vandermonde Δ, DΔ=(N-1)p_1Δ, since D(x_i-x_j)=(x_i+x_j)(x_i-x_j). Subtracting the denominator contribution and applying the ordinary one-box Pieri rule leaves coefficient λ_j-j+1, the added content. Taking N sufficiently large proves (3) stably.

Iterating (3), every path from λ to μ corresponds to a standard tableau of skew shape μ/λ, and the product of contents is path-independent. Consequently, if μ has size n, its coefficient in the right-hand side of (1) is
```math
\sum_{\substack{\lambda\subseteq\mu\\\lambda_1\lt m}}
 f^\lambda\frac{f^{\mu/\lambda}}{(n-|\lambda|)!}
 \prod_{b\in\mu\setminus\lambda}c(b).
\tag{4}
```
The same formula with λ_1=k gives the exact-LIS slice. Although (4) is signed, it admits a positive regrouping.

## 3. Frobenius coordinates and Pascal minors

For nonempty μ write its Frobenius coordinates as (A|B), where A=(A_1>…>A_d≥0) and B=(B_1>…>B_d≥0), d the Durfee size, A_i=μ_i-i and B_i=μ'_i-i. Any λ contributing a nonzero term to (4) contains every diagonal cell of μ, since an omitted diagonal cell has content zero. Thus λ has the same Durfee size d, with Frobenius coordinates (a|b) satisfying a_i≤A_i and b_i≤B_i.

The skew diagram μ/λ consists of a region to the right of the d-by-d square and a region below it. These regions are incomparable in the tableau ordering. The normalized skew dimension f^(μ/λ)/(n-|λ|)! factors as the product of the two normalized dimensions; the second region may be transposed. Using the skew-tableau determinant formula
```math
\frac{f^{\rho/\eta}}{(|\rho|-|\eta|)!}
=\det\left[\frac{1}{(\rho_i-\eta_j-i+j)!}\right]_{i,j},
\tag{5}
```
with reciprocal negative factorial defined as zero, these factors are determinants of 1/(A_i-a_j)! and 1/(B_i-b_j)!, respectively. Formula (5) is the Jacobi–Trudi identity specialized at p_1=1, p_j=0 (j>1), equivalently the classical skew standard-tableau determinant.

The positive contents in the arm region have product Π_i A_i!/a_i!, and the negative contents in the leg region have product (-1)^(Σ(B_i-b_i)) Π_i B_i!/b_i!. Thus (4) becomes
```math
\sum_{\substack{a\text{ strictly decreasing}\ge0\\ a_1\lt m-1}}
\det\left[\binom{A_i}{a_j}\right]_{i,j=1}^d\,
T_a(B),
\qquad
T_a(B)=\sum_{b_1>\cdots>b_d\ge0}
 (-1)^{\sum_i(B_i-b_i)}
 \det\left[\binom{B_i}{b_j}\right] f^{(a|b)}.
\tag{6a}
```

**Index correction/explicit convention:** the cutoff in (6a) is to be read as **a_1+1<m**, equivalently a_1<m-1. For exact LIS=k, retain only a_1=k-1. Binomial coefficients outside 0≤j≤i are zero. The sums are finite after discarding zero minors. If a_i>A_i for some i, then the first i columns have support in the first i-1 rows, so the determinant vanishes; similarly for b. Hence (6a) can be summed over all strict nonnegative coordinate sequences as written.

Every minor of the Pascal matrix is nonnegative when row and column indices are ordered in the same direction. One elementary proof is that the finite lower-triangular Pascal matrix on indices 0,…,M is the product L_M…L_1, where L_k=I+Σ_{i=k}^M E_{i,i-1}. Each L_k is nonnegative bidiagonal and totally nonnegative; the factorization follows by Pascal's recurrence, and Cauchy–Binet gives the claim. Reversing both index orders does not change the determinant sign. It remains to prove T_a(B)≥0 for every fixed a and every strict B.

## 4. Positivity of the alternating leg transform

Fix d and a_1>…>a_d≥0. Define F_a(z) as the generating series in d variables of an alternating extension of standard-tableau dimensions:
```math
F_a(z)=\sum_{b\in\mathbb Z_{\ge0}^d}u_a(b)z_1^{b_1}\cdots z_d^{b_d}.
\tag{7}
```
For decreasing distinct b, u_a(b)=f^(a|b); for other distinct b extend by the sign of the permutation sorting b; for repeated coordinates set u=0. Negative coordinates also mean zero. An invalid a (negative or repeated) gives F_a=0. At d=0 use F_empty=1.

Define
```math
G_a(x)=\prod_{i=1}^d(1+x_i)^{-1}
 F_a\left(\frac{x_1}{1+x_1},\ldots,\frac{x_d}{1+x_d}\right).
\tag{8}
```
It is alternating. From the negative binomial expansion the coefficient of x^B equals
```math
\sum_{0\le b_i\le B_i} u_a(b)
 (-1)^{\sum_i(B_i-b_i)}\prod_i\binom{B_i}{b_i}.
\tag{9}
```
Grouping by the decreasing rearrangement of b and using the alternating extension turns (9) into the determinant sum T_a(B) of (6a).

Let C_d be the cone of alternating formal series in d variables whose coefficients at strictly decreasing nonnegative exponent sequences are nonnegative. Equivalently they are the Vandermonde Δ_d times a Schur-positive series: the alternants det(x_i^(λ_j+d-j)) form the basis, and their coefficients at the decreasing exponent sequence are +1. Every alternating series has zero coefficients at repeated exponents. Multiplication by a symmetric Schur-positive series preserves C_d by the Littlewood–Richardson rule.

We prove G_a∈C_d by induction on d and then Σa_i. The case d=0 is immediate.

Removing the largest entry from a standard tableau removes a corner. In Frobenius coordinates it either decreases one arm coordinate, decreases one leg coordinate, or deletes the last diagonal cell (possible only if a_d=b_d=0). Invalid coordinate sequences represent zero. For sorted distinct b, this is precisely the ordinary branching recurrence for f^(a|b). Extending it alternatingly to all b gives
```math
(1-\sum_{i=1}^d z_i)F_a(z)
=\sum_{i=1}^dF_{a-e_i}(z)
+\mathbf1_{a_d=0}\sum_{j=1}^d(-1)^{d-j}F_{a^-}(z_{\widehat j}),
\tag{10}
```
where a^-=(a_1,…,a_{d-1}), e_i decrements coordinate i, and z_hat j omits variable j. To verify the extension: the leg decrement sum is alternating because all coordinate shifts are summed; the last term is the alternating insertion of a zero leg coordinate. At a strictly decreasing b only the j=d term can contribute when b_d=0; all other cases follow by antisymmetry, including repeated b where both sides vanish.

Apply (8) to (10) and clear the factors (1+x_i). Write E_d=Π_i(1+x_i). The resulting identity is
```math
\left(1-\sum_{r=2}^d(r-1)e_r(x)\right)G_a(x)
= E_d(x)\sum_{i=1}^d G_{a-e_i}(x)
+\mathbf1_{a_d=0}\sum_{j=1}^d(-1)^{d-j}
 E_{d-1}(x_{\widehat j})G_{a^-}(x_{\widehat j}).
\tag{11}
```
Here the factor on the left is E_d(1-Σ_i x_i/(1+x_i)); each elementary monomial of degree r is subtracted r times, giving coefficient 1-r.

By induction all G_{a-e_i} for valid a-e_i belong to C_d, and E_d is Schur-positive. The first term on the right belongs to C_d. For the second, the omitted-variable sum is alternating. At a decreasing exponent vector B, its coefficient is zero if B_d>0. If B_d=0, only omission of variable d contributes, with sign +1, giving the corresponding decreasing coefficient of E_{d-1}G_{a^-}, nonnegative by the d-1 induction hypothesis. (For d=1 this means the single empty-alphabet coefficient.) Hence the entire right side belongs to C_d.

Finally the inverse of the left scalar factor,
```math
\left(1-\sum_{r=2}^d(r-1)e_r\right)^{-1}
=\sum_{q\ge0}\left(\sum_{r=2}^d(r-1)e_r\right)^q,
\tag{12}
```
is a well-defined Schur-positive symmetric formal series, since its summed argument has positive degree and nonnegative Schur coefficients. For d=1 the inverse is 1. Multiplying (11) by (12) proves G_a∈C_d. This induction is finite in its indices: the arm decrement reduces Σa_i and diagonal deletion reduces d.

By (9), T_a(B)≥0 for strict B. By (6a) each fixed-a contribution is nonnegative. Selecting any collection of values of a_1, in particular a_1<m-1 or a_1=k-1, preserves positivity. This proves the theorem. The Schur coefficients are integers as well: the determinants in (6a) and tableau dimensions in T_a are integers.

## Audit

- The pattern bound is on ordinary LIS of permutations, not on longest subsequences with gaps or big ascents. The weighted-run bijection proves exact equality with the weak LIS of the compressed colored word.
- The composition block decomposition uses all allowed equalities in the fundamental function; the maximal runs are uniquely determined even when successive value intervals share a color.
- RSK is the usual row-insertion correspondence for words, with weak row increases and strict column increases. Standard tableaux count the recording choices, explaining the factor f^λ.
- The content derivation includes zero-content diagonal cells. Discarding terms with a missing diagonal cell is exact, which is needed for the two-region factorization in (5).
- All binomial determinant signs are fixed by using decreasing order simultaneously for rows and columns. No sign claim about a single summand of (4) is made.
- Recurrence (10) is verified before extending it; the signed omitted-variable term is positive only in the alternant cone after collecting coefficients, not term by term.
- The induction in (11) uses only products of Schur-positive functions and alternating series in C_d. The denominator has constant term 1, so its formal inverse is legitimate.
- Empty degree is immediate. The case m=1 has only the empty contribution; all other bounds follow without exceptions.
- Exact independent regression checks compare the Frobenius formula with (3) through degree 15, and with direct permutation enumeration and Vandermonde coefficient extraction through degree 8. See verify.py. These checks do not replace the proof.

## Literature and priority

The original 2024 preprint and February 2026 journal article state the conjecture and report finite Schur expansions. Their Theorem 4.8 treats unrestricted permutations via the earlier Shareshian–Wachs Eulerian quasisymmetric functions; that case is not new. On 2026-11-24 the exact title, authors, Conjecture 4.9, big-descent Schur positivity, author bibliography and arXiv references were searched. No earlier proof of the unrestricted pattern-avoidance assertion or the exact-LIS refinement was found. This screen is not exhaustive and does not establish first discovery. Attribution for the original conjecture and all classical ingredients (RSK, Pieri, Jacobi–Trudi, Pascal total nonnegativity, Littlewood–Richardson) belongs to their original sources. The proof here was derived and audited in the ChatGPT research session at the repository owner's request. No external review, formalization, or publication claim is made.
