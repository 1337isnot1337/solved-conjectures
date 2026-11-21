# Quadratic permanental dominance

Research date: 20 November 2026 (America/Chicago). This is an open-target audit and a record of exact reductions. No proof or counterexample to the full conjecture is claimed.

Correction, 20 November 2026: the standard-representation case and its total Fischer-deficit inequality below follow in every order from Pate's 2008 indicator-vector theorem. Their earlier treatment as unresolved is withdrawn. [The full deduction and source scope](../inequalities/pate_packet_correction.md) also establish the cumulative two-row-module bounds; they do not prove every individual irreducible-block inequality.

## Exact target and connection to Minc's list

Yair Lavi's paper *A Conjecture on the Permanent of Positive Semidefinite Matrices*, dated 26 September 2026, states **Conjecture 1.1 (quadratic permanental dominance)**:

For every positive semidefinite Hermitian matrix $`A`$ of order $`n`$, and every irreducible character $`\chi_\lambda`$ of $`S_n`$, of degree $`d_\lambda`$,

```math
\sum_{\sigma,\tau\in S_n}\chi_\lambda(\sigma\tau)
\left(\prod_i a_{i,\sigma(i)}\right)
\left(\prod_i a_{i,\tau(i)}\right)
\le d_\lambda(\mathop{\mathrm{per}}A)^2.
```

For a unitary irreducible representation $`\rho_\lambda`$, put

```math
F_\lambda(A)=\sum_{\sigma\in S_n}a_\sigma\rho_\lambda(\sigma),
\qquad a_\sigma=\prod_i a_{i,\sigma(i)}.
```

These Fourier blocks are positive semidefinite. The conjecture is

```math
\|F_\lambda(A)\|_F^2\le d_\lambda(\mathop{\mathrm{per}}A)^2.
```

The current numbered [Minc Conjecture 42 page](https://yair-lavi.com/mincs-list/conjecture-42/index.html) explicitly describes this quadratic conjecture and links the paper; the [C30 page](https://yair-lavi.com/mincs-list/conjecture-30/index.html) does so too. This is therefore a stated subsidiary target, not a new strengthening invented in this investigation. It is not identical to the full subgroup form of Minc C42. The paper proves that it implies the ordinary irreducible-immanant form of C42 and full Chollet C30. A disproof of the quadratic conjecture would not, by itself, disprove either consequence.

## Source and status audit

Primary sources read:

1. [Current Minc C42 page](https://yair-lavi.com/mincs-list/conjecture-42/index.html), inspected 20 November 2026. It reports the quadratic conjecture proved through order six, with no unrestricted resolution.
2. [Author's publication page](https://yair-lavi.com/publications/quadratic-permanent-conjecture/index.html), inspected the same day. It states the unrestricted inequality and links the paper and exact small-order supplement.
3. [Full eight-page paper](https://yair-lavi.com/publications/quadratic-permanent-conjecture/paper.pdf). Theorem 2.1 gives the implication to ordinary immanant dominance and Chollet. Theorem 4.1 proves orders at most five. The difference from the live page's order-six announcement is recorded rather than silently identifying the scopes.
4. [Hexagon version 2611.00429v1](https://hexagonmath.org/pdf/2611.00429v1), deposited 13 November 2026. The indexed primary full text has the same Conjecture 1.1 and order-five scope. The version landing page was indexed by search, but direct opening failed; no later version was found in the searches performed.
5. Lavi, [*Complex and real counterexamples to an inequality arising from Drury's conjecture*](https://hexagonmath.org/pdf/2611.00198v1), dated 19 October 2026. Section 6 explicitly tests its two counterexamples against the standard-representation instance of the quadratic conjecture and shows that they do not refute it.
6. Drury, [*A counterexample to a question of Bapat & Sunder*](https://files.ele-math.com/articles/mia-21-37.pdf), Mathematical Inequalities & Applications 21 (2018), 517–520, DOI 10.7153/mia-2018-21-37. The full four-page paper gives an order-eight rank-two counterexample to permanent-on-top for the standard representation. An eigenvalue violation alone does not violate the quadratic conjecture.
7. Wanless, [*Lieb's permanental dominance conjecture*](https://arxiv.org/pdf/2202.01867), 2022. This distinguishes full subgroup dominance, ordinary immanant dominance, permanent-on-top, and Chollet. The distinctions must be retained in any result claim.
8. Tran, [*A simple counterexample for the permanent-on-top conjecture*](https://files.ele-math.com/articles/mia-25-01.pdf), Mathematical Inequalities & Applications 25 (2022), 1–16, DOI 10.7153/mia-2022-25-01. Its exact order-five seed and block spectra provide the independent check in the rank-two diagnostic below.
9. Aouichaoui and Zhang, [*A Solution to a Permanent Conjecture of Pate*](https://www.preprints.org/manuscript/202609.2464/v1), posted 29 September 2026, version 1, not peer reviewed. The theorem asserts the four-term inequality $`\Gamma_{ii}-\Gamma_{ij}-\Gamma_{ji}+\Gamma_{jj}\le2\mathop{\mathrm{per}}A`$. It is prior work, not a new target resolved here. Its two-index bound is separate from Pate's 2008 indicator theorem. The latter, applied to a doubled matrix as explained below, does establish the standard block's total deficit inequality.

Fresh searches used both web engines, including the exact title, exact conjecture name, author with quadratic/permanental/counterexample terms, and current-date filters. The repository issue search for `quadratic permanental` found coordination issue 139, but no separate completed result. The local repository snapshot contains a related Gaussian-replacement research note, not a resolution. The Zenodo paper-record link (23001181) could not be opened through the web tool. No unrestricted proof or counterexample has been found in this bounded audit; this is not a guarantee that none exists.

The author PDF and both live numbered pages were opened again for this checkpoint. They still give the scopes recorded above. The Pate preprint page identifies version 1 as its latest version. No unread later version is being treated as a proof.

## Which implications are established

Write $`p=\mathop{\mathrm{per}}A`$. Positivity of the Fourier blocks follows from the Gram representation of the Schur power matrix. Its spectrum contains each block's spectrum with multiplicity $`d_\lambda`$; this is Lemma 2.2 of Lavi's paper.

Permanent-on-top asserts $`0\preceq F_\lambda(A)\preceq pI`$ for every $`\lambda`$. Squaring the eigenvalues and summing proves the quadratic inequality. The quadratic bound allows an individual eigenvalue to exceed $`p`$, provided the other eigenvalues compensate. Thus a known permanent-on-top counterexample does not automatically give a quadratic counterexample.

For ordinary immanants,

```math
\mathop{\mathrm{Imm}}_\lambda(A)=\mathop{\mathrm{tr}}F_\lambda(A)
\le\sqrt{d_\lambda\mathop{\mathrm{tr}}F_\lambda(A)^2}
\le d_\lambda p.
```

This proves the $`G=S_n`$ case. Full Minc C42 quantifies over every subgroup $`G\le S_n`$ and its characters. No implication from the quadratic conjecture to that full statement has been proved in this note or asserted by the cited implication theorem.

For Chollet, the regular-representation identity is

```math
n!\mathop{\mathrm{per}}(A\circ\overline A)
=\sum_{\lambda\vdash n}d_\lambda\mathop{\mathrm{tr}}F_\lambda(A)^2.
```

The quadratic bounds and $`\sum_\lambda d_\lambda^2=n!`$ yield
$`\mathop{\mathrm{per}}(A\circ\overline A)\le p^2`$. For arbitrary PSD $`A,B`$, Cauchy–Schwarz on the vectors of diagonal products gives

```math
\begin{aligned}
\mathop{\mathrm{per}}(A\circ B)
&=\left|\sum_\sigma a_\sigma b_\sigma\right|\\
&\le\sqrt{\sum_\sigma|a_\sigma|^2\sum_\sigma|b_\sigma|^2}\\
&\le\mathop{\mathrm{per}}A\mathop{\mathrm{per}}B.
\end{aligned}
```

The absolute value in the first line is harmless because $`A\circ B`$ is PSD and its permanent is nonnegative. Hence a full quadratic proof would settle full C30. None of the reductions below supplies that proof.

## Exact closure under direct sums

**Lemma.** Suppose $`A\succeq0`$ and $`B\succeq0`$ satisfy the quadratic inequality for every irreducible character of their respective symmetric groups. Then $`A\oplus B`$ does too.

**Proof.** Let their orders be $`r`$ and $`s`$. A nonzero diagonal product of $`A\oplus B`$ must come from the subgroup $`S_r\times S_s\le S_{r+s}`$. Restrict an irreducible representation $`\rho_\lambda`$ of $`S_{r+s}`$ to that subgroup. Since the groups are finite and the representations are unitary, its restriction is an orthogonal direct sum

```math
\rho_\lambda|_{S_r\times S_s}
\simeq\bigoplus_{\mu,\nu}m_{\mu,\nu}
(\rho_\mu\otimes\rho_\nu).
```

Consequently

```math
F_\lambda(A\oplus B)
\simeq\bigoplus_{\mu,\nu}m_{\mu,\nu}
\bigl(F_\mu(A)\otimes F_\nu(B)\bigr).
```

Frobenius norms multiply under tensor products and their squares add under orthogonal direct sums. Thus

```math
\begin{aligned}
\|F_\lambda(A\oplus B)\|_F^2
&=\sum_{\mu,\nu}m_{\mu,\nu}
\|F_\mu(A)\|_F^2\|F_\nu(B)\|_F^2\\
&\le(\mathop{\mathrm{per}}A)^2(\mathop{\mathrm{per}}B)^2
\sum_{\mu,\nu}m_{\mu,\nu}d_\mu d_\nu\\
&=d_\lambda\bigl(\mathop{\mathrm{per}}(A\oplus B)\bigr)^2.
\end{aligned}
```

This proves the claim. No novelty is asserted for this elementary representation-theoretic closure.

The inequalities worker independently checked the restriction, norm, and dimension argument on 21 November 2026.

In particular, padding known permanent-on-top counterexamples of order at most five by identity blocks, or taking arbitrary direct sums of such matrices, cannot turn them into quadratic-conjecture counterexamples, using the order-five result in the inspected paper. The live page's subsequent order-six announcement gives the same consequence for blocks through order six if that additional result is used. The padding argument that extends permanent-on-top counterexamples to all larger orders does not extend to this weaker quadratic statement.

## Established standard case and remaining two-row bounds

Put $`\Gamma_{ij}=a_{ij}\mathop{\mathrm{per}}A(i\mid j)`$. This is the singleton permutation-module Fourier matrix, up to transpose, so $`\Gamma\succeq0`$ and $`\Gamma\mathbf1=p\mathbf1`$. The module is the direct sum of the trivial and standard representations. Hence

```math
\mathop{\mathrm{tr}}F_{(n-1,1)}(A)^2=\|\Gamma\|_F^2-p^2.
```

The standard-representation case is therefore equivalent to

```math
\sum_{i,j}|a_{ij}\mathop{\mathrm{per}}A(i\mid j)|^2
\le n(\mathop{\mathrm{per}}A)^2.
```

This standard-representation inequality is established by applying Pate's indicator theorem to `A direct_sum conjugate(A)`, selecting the paired singleton subsets. The proof, valid in every order, is in [the Pate correction](../inequalities/pate_packet_correction.md). It is a consequence of an earlier theorem, not a new resolution counted by this campaign.

The representation on $`j`$-element subsets similarly has matrix entries

```math
C_j(A)_{S,T}=\mathop{\mathrm{per}}A[S,T]\,
\mathop{\mathrm{per}}A[S^c,T^c],
```

up to a harmless transpose convention. For $`0\le j\le n/2`$, it decomposes into the irreducibles of shapes $`(n-r,r)`$ for $`0\le r\le j`$, each once. Hence, for $`1\le j\le n/2`$,

```math
\mathop{\mathrm{tr}}F_{(n-j,j)}(A)^2
=\|C_j(A)\|_F^2-\|C_{j-1}(A)\|_F^2.
```

Pate's theorem also gives `||C_j(A)||_F^2 <= binom(n,j) p^2`. This controls the sum of the two-row block norms. For `j>=2`, subtracting the upper bound for `j-1` is invalid: upper bounds on two quantities do not bound their difference. The separate bound for each remaining irreducible block is still unproved here.

### Exact standard-block deficit formulation

Set

```math
\delta_i=p-a_{ii}\mathop{\mathrm{per}}A(i\mid i),\qquad L=pI-\Gamma.
```

The permanental Fischer inequality gives $`\delta_i\ge0`$. Also $`L\mathbf1=0`$ and $`L\preceq pI`$. Permanent-on-top would imply the additional condition $`L\succeq0`$, but known standard-block counterexamples show that this condition cannot be assumed. Direct expansion gives the exact equivalences

```math
\begin{aligned}
\|\Gamma\|_F^2\le np^2
&\quad\Longleftrightarrow\quad \mathop{\mathrm{tr}}L^2\le2p\mathop{\mathrm{tr}}L\\
&\quad\Longleftrightarrow\quad
\sum_{i\ne j}|\Gamma_{ij}|^2
\le\sum_i\delta_i(2p-\delta_i).
\end{aligned}
```

The total comparison is therefore established by the Pate deduction above. A stronger row-by-row statement would be

```math
\sum_{j\ne i}|\Gamma_{ij}|^2\le\delta_i(2p-\delta_i)\quad\text{for every }i,
```

but this statement has not been established. Nor has the auxiliary bound $`|\Gamma_{ij}|^2\le\delta_i\delta_j`$ been established. Neither may be used as an input.

The already available constraints $`\Gamma\succeq0`$, $`\Gamma\mathbf1=p\mathbf1`$, and $`0\le\Gamma_{ii}\le p`$ alone do not imply the desired bound. For example, take $`p=1`$, $`u=(1,1,-1,-1)^T/2`$, and

```math
H=\frac14J_4+3uu^T.
```

Then $`H\succeq0`$, $`H\mathbf1=\mathbf1`$, and every diagonal entry is one, but its eigenvalues are $`3,1,0,0`$, so $`\|H\|_F^2=10>4`$. This is a counterexample only to a proposed deduction from those abstract matrix constraints. No PSD matrix $`A`$ realizing $`H`$ as its normalized permanental cofactor matrix has been supplied, and $`H`$ is not a counterexample to the conjecture.

Equivalently, if $`\ell_i`$ are the eigenvalues of $`L`$, the now-established compensation is

```math
\sum_{\ell_i<0}|\ell_i|(2p+|\ell_i|)
\le\sum_{\ell_i>0}\ell_i(2p-\ell_i).
```

The inequalities $`\ell_i\le p`$ and $`\sum_i\ell_i\ge0`$ do not by themselves give this weighted comparison; Pate's theorem supplies the additional permanent-specific constraint. The full conjecture still requires the remaining irreducible blocks.

The negative moment-matrix direction in the team's `chollet_gaussian_replacement.md` is an unfactored polynomial test. It is not a counterexample to the Fourier-block inequality. Conversely a proof of the latter would settle Chollet, so it cannot be treated as an already available tool for that conjecture.

## Minimal-counterexample reduction

The diagonal-addition argument in Section 4 of Lavi's paper extends directly to an arbitrary first failing order. Suppose the quadratic conjecture holds in every order less than $`n`$. If it holds for every singular correlation matrix of order $`n`$, then it holds for every PSD matrix of that order.

Indeed, if a positive definite correlation matrix $`A`$ equals $`I`$, then $`F_\lambda(A)=I_{d_\lambda}`$ and $`p=1`$. Otherwise let $`m=\lambda_{\min}(A)`$. Positivity and $`\mathop{\mathrm{tr}}A=n`$ give $`0<m<1`$. Put

```math
t=1-m,\qquad B=\frac{A-mI}{1-m}.
```

Then $`B`$ is a singular correlation matrix and

```math
A=(1-t)I+tB,\qquad 0<t<1.
```

For each subset $`S\subseteq[n]`$, put

```math
X_S=\sum_{\sigma\in S_S}a_\sigma(B[S])\rho_\lambda(\sigma),
```

where $`S_S`$ fixes the complement of $`S`$. For proper $`S`$, decompose the restriction to $`S_S`$ as an orthogonal direct sum of irreducibles $`\rho_\mu`$, with multiplicities $`m_\mu`$. The inductive assumptions give

```math
\|X_S\|_F^2=\sum_\mu m_\mu\|F_\mu(B[S])\|_F^2
\le\sum_\mu m_\mu d_\mu\mathop{\mathrm{per}}(B[S])^2
=d_\lambda\mathop{\mathrm{per}}(B[S])^2.
```

Thus

```math
\|X_S\|_F\le\sqrt{d_\lambda}\mathop{\mathrm{per}}B[S].
```

The empty set has $`X_\varnothing=I_{d_\lambda}`$ and $`\mathop{\mathrm{per}}B[\varnothing]=1`$. The full set uses the assumed singular case at order $`n`$. Expanding diagonal choices gives the exact identity

```math
F_\lambda(A)=\sum_{S\subseteq[n]}t^{|S|}(1-t)^{n-|S|}X_S.
```

Choosing the identity contribution outside $`S`$ forces those indices to be fixed. A fixed point inside $`S`$ still chooses the $`tB`$ contribution, so no extra restriction on the fixed points inside $`S`$ is imposed. All scalar weights are nonnegative. Applying the triangle inequality gives

```math
\begin{aligned}
\|F_\lambda(A)\|_F
&\le\sum_{S\subseteq[n]}t^{|S|}(1-t)^{n-|S|}\|X_S\|_F\\
&\le\sqrt{d_\lambda}\sum_{S\subseteq[n]}
t^{|S|}(1-t)^{n-|S|}\mathop{\mathrm{per}}B[S]\\
&=\sqrt{d_\lambda}\mathop{\mathrm{per}}A.
\end{aligned}
```

For diagonal $`D`$ with positive diagonal entries, every diagonal product of $`DAD`$ is multiplied by $`\prod_iD_{ii}^2`$. Both sides of the quadratic inequality scale by its square. Such congruence reduces every positive-diagonal PSD matrix to a correlation matrix. If a PSD matrix has $`a_{ii}=0`$, then $`|a_{ij}|^2\le a_{ii}a_{jj}=0`$ for all $`j`$; it has a zero row and every diagonal product vanishes.

Consequently, if any counterexample exists, one of minimum order can be chosen singular and with positive diagonal. If its graph of nonzero off-diagonal entries were disconnected, simultaneous permutation would make it a direct sum of smaller PSD blocks. Those blocks satisfy the conjecture by minimality, so direct-sum closure would give a contradiction. Thus it can also be chosen with connected support. This argument gives no rank bound beyond singularity and supplies no proof for singular connected matrices.

The independent review [independent review](../inequalities/quadratic_dominance_review.md) checks the subset expansion, restriction multiplicities, empty-set convention, diagonal normalization, and connected-support deduction. It also checks the standard and two-row block formulas. No unresolved input has been discharged by numerical evidence.

## Structured diagnostics, without a counterexample

The script `quadratic_rank_two_blocks.py` evaluates the two-row Fourier-block squared norms using binary polynomial Gram identities. Its known order-five Tran seed reproduces the published spectrum's quadratic ratios. It then tests the regular-polygon frames with two coordinate poles and the second and third repetitions of Tran's five-vector frame. These repetitions concatenate Gram vectors; they are not direct sums of matrices. No tested nontrivial block approached ratio one; the complete floating-point output is in `quadratic_rank_two_blocks.log`.

These are discovery checks, not proofs for an unbounded family, and not counted small-order results. Since the examples leave large slack, continuing the same repetition sweep is not a proposed route to a resolution.

The following standard-block diagnostics predate the Pate source correction. Their logs are retained as history; they are not evidence needed for the now-established standard case. The separate `quadratic_circulant_probe.cpp` tests singular PSD circulants with Fourier weights in $`\{0,1,2\}`$, up to affine frequency equivalence, only in the standard block. The matrix is positive semidefinite by its prescribed nonnegative Fourier spectrum. Circulant symmetry makes every row of $`\Gamma`$ have the same squared norm, so one reverse subset-DP computes the needed quantity from the cofactors in row one. At orders seven through eleven, 3,916 classes were checked; no candidate violation occurred. The largest ratios, approximately 0.828 through 0.898, were all supplied by the scaled regular-simplex matrix with one missing Fourier mode. The log is `quadratic_circulant_probe.log`. This bounded floating-point exploration neither proves a circulant-family theorem nor checks other irreducible blocks. No enlargement of that finite search is justified by the present results.

### Reproduction and checkpoint contents

The Python script uses Python 3 and NumPy. The C++ source uses only the C++17 standard library. From the directory containing these files, the existing diagnostics can be reproduced with:

```sh
python3 quadratic_rank_two_blocks.py
g++ -std=c++17 -O2 quadratic_circulant_probe.cpp -o /tmp/quadratic_circulant_probe
/tmp/quadratic_circulant_probe
```

The checked-in logs record the outputs already obtained. Floating-point rounding can change their last digits. The C++ executable is not part of the research checkpoint.

The focused checkpoint consists of this note, the [independent review](../inequalities/quadratic_dominance_review.md), and the two diagnostic source/log pairs named above. It establishes exact reductions and records failed structured counterexample routes. The missing all-order singular connected inequality remains for the other irreducible blocks. The standard block's total deficit formulation is established by the Pate deduction above. This checkpoint adds no resolved conjecture.
