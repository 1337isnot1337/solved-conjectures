# Maximum permanent on a unitary orbit: spectral defect certificates

Checkpoint, 20 November 2026. This is a quantitative extension of [the fourth-order local reduction](unitary_orbit_quartic_germ.md) for the open [Minc Problem 1](https://yair-lavi.com/mincs-list/problem-1/index.html). It is **not** a resolution of Problem 1, not an independently named conjecture, and contributes zero to the full-closure ledger. No Lean work.

## Setting

Fix a real trace-zero spectrum $`x=(x_1,\ldots,x_n)`$, $`n\ge3`$, with $`s_j=\sum_i x_i^j`$, $`s_2>0`$, and $`R=\max_i|x_i|`$. Let $`\mathcal Z_x`$ be its nonempty zero-diagonal Hermitian unitary orbit. Define

```math
\mathcal D(H)=\sum_i\sum_{\substack{j\lt k\\j,k\ne i}}|h_{ij}|^2|h_{ik}|^2+
\frac12\sum_{i\ne j}|(H^2)_{ij}|^2.
```

The reviewed prior note proves that the optimized fourth-order coefficient of the permanent along the orbit of $`I+\varepsilon\mathop{\mathrm{diag}}(x)`$ is

```math
\Gamma_n(x)=\frac34s_4+\left(\frac18-\frac1n\right)s_2^2-
\min_{H\in\mathcal Z_x}\mathcal D(H). \tag{1}
```

It establishes the upper-envelope equality exactly for sign-symmetric spectra, but its explicit moment lower bound uses only $`s_3`$, which may vanish for a nonsign-symmetric spectrum.

## Theorem 1: every odd moment gives a certificate

For every $`H\in\mathcal Z_x`$ and every integer $`k\ge1`$,

```math
\boxed{\mathcal D(H)\ge \frac{s_{2k+1}^2}
{2k^2s_2R^{4k-4}}.} \tag{2}
```

**Proof.** Put $`Q=H^2`$, $`D_0=\mathop{\mathrm{diag}}Q`$, and $`E=Q-D_0`$. As $`H`$ has zero diagonal, $`\mathop{\mathrm{tr}}(HD_0^k)=0`$. The noncommutative telescoping identity gives

```math
s_{2k+1}=\mathop{\mathrm{tr}}\bigl(H(Q^k-D_0^k)\bigr),\quad
Q^k-D_0^k=\sum_{j=0}^{k-1}Q^jED_0^{k-1-j}.
```

Both $`\|Q\|_{\mathrm{op}}`$ and $`\|D_0\|_{\mathrm{op}}`$ are at most $`R^2`$: $`Q`$ is positive semidefinite and $`D_0`$ is its nonnegative diagonal. Hence

```math
|s_{2k+1}|\le\|H\|_F\, kR^{2k-2}\|E\|_F
=k\sqrt{s_2}\,R^{2k-2}\|E\|_F.
```

Since $`\mathcal D(H)\ge\frac12\|E\|_F^2`$, equation (2) follows. The proof permits complex Hermitian entries.

Let $`m=\lfloor(n-1)/2\rfloor`$. If $`s_1=s_3=\cdots=s_{2m+1}=0`$, Newton's identities inductively imply that every odd elementary symmetric coefficient through degree $`n`$ vanishes. The characteristic polynomial is even (even $`n`$) or odd (odd $`n`$); all its roots are real, so $`x`$ is sign-symmetric. Thus, for every nonsign-symmetric trace-zero spectrum, at least one of the finitely many certificates in (2), $`1\le k\le m`$, is strictly positive.

## Theorem 2: quantitative matching stability

Let $`\mathcal S_n`$ be the set of real sign-symmetric eigenvalue multisets and define

```math
\delta(x)^2=\min_{y\in\mathcal S_n}\min_{\pi\in S_n}
\sum_{i=1}^n(x_i-y_{\pi(i)})^2,\quad N=\binom n2.
```

For every $`H\in\mathcal Z_x`$,

```math
\boxed{\mathcal D(H)\ge\frac{\delta(x)^4}{4N}.} \tag{3}
```

**Proof.** Give each undirected off-diagonal edge $`ij`$ weight $`w_{ij}=|h_{ij}|^2`$. Write $`A=\sum_i\sum_{j\lt k;\,j,k\ne i}w_{ij}w_{ik}`$, so $`A\le\mathcal D(H)`$. Greedily select a matching by considering edges in descending weight. Every rejected edge $`e`$ is incident to an earlier selected edge $`f(e)`$ with $`w_{f(e)}\ge w_e`$. These incident-edge pairs are distinct, hence

```math
\sum_{e\text{ rejected}}w_e^2
\le\sum_{e\text{ rejected}}w_ew_{f(e)}\le A.
```

Set all rejected edges, and their Hermitian conjugates, to zero, obtaining a Hermitian matching-supported matrix $`H_M`$ whose spectrum is sign-symmetric. By Cauchy--Schwarz,

```math
\|H-H_M\|_F^2=2\sum_{e\text{ rejected}}w_e
\le2\sqrt{NA}.
```

The classical Hoffman--Wielandt bound for Hermitian eigenvalues gives $`\delta(x)^2\le\|H-H_M\|_F^2`$. Squaring proves (3).

The distance has an exact finite formula: pair the entries of $`x`$, leaving one unpaired zero-target entry if $`n`$ is odd, to minimize

```math
\delta(x)^2=\min_{\text{pairings}}
\left\{\sum_{\{i,j\}\text{ paired}}\frac{(x_i+x_j)^2}{2}
+\sum_{i\text{ unpaired}}x_i^2\right\}. \tag{4}
```

For a chosen pair the closest opposite pair is $`((x_i-x_j)/2,(x_j-x_i)/2)`$, giving (4) directly.

## Combined local spectral inequality

Combining (1)--(3), for $`n\ge3`$,

```math
\Gamma_n(x)\le\frac34s_4+\left(\frac18-\frac1n\right)s_2^2-
\max\left\{\frac{\delta(x)^4}{4N},
\max_{1\le k\le m}\frac{s_{2k+1}^2}{2k^2s_2R^{4k-4}}\right\}. \tag{5}
```

This makes the earlier qualitative strict envelope effective for every nonsign-symmetric spectrum, including those for which $`s_3=0`$, but it **does not evaluate the exact minimum** in (1).

For an exact cubic-blind example take $`x=(-10,-4,-2,7,9)`$: $`s_1=s_3=0`$, $`s_2=250`$, $`s_4=19234`$, $`s_5=-25200`$, $`R=10`$, and $`\delta(x)^2=9`$. The $`k=2`$ bound gives $`\mathcal D(H)\ge3969/125`$ for every $`H\in\mathcal Z_x`$, whereas the distance bound gives only $`81/40`$. Consequently $`\Gamma_5(x)\le9738-3969/125`$; the original $`s_3`$-only certificate gives no subtraction.

## Validation, sources and exact next step

The [standard-library exact checker](verify_unitary_orbit_spectral_deficit.py) covers 125 rational real symmetric zero-diagonal test matrices, the greedy edge inequality, and odd moments $`k=1,2,3`$ with a rigorously dominating row-sum norm. It also checks the integer-spectrum certificate and pairing distance. It does not test arbitrary complex Hermitian matrices or solve the spectral optimization; the displayed arguments supply the complex case.

The base quartic identity has [two internal reviews](unitary_orbit_quartic_review.md). The graph/matching argument, telescoping, Newton identities and Hoffman--Wielandt theorem are classical ingredients, with no independent novelty claim. See A. J. Hoffman and H. W. Wielandt, *The variation of the spectrum of a normal matrix*, Duke Math. J. 20 (1953), 37--39; [an arXiv exposition of its perturbation bound](https://arxiv.org/abs/1612.05759) and a [1983 proof and original citation](https://doi.org/10.12286/jssx.1983.2.208). A targeted phrase search found no exact prior integration of this explicit bound with the quartic coefficient, but historical priority remains unverified. The theorem and checker have not yet received independent adversarial review.

**Next mathematical gap:** find the actual minimizing $`H\in\mathcal Z_x`$ for the deficit in (1), or an all-spectrum structural characterization away from the near-scalar regime. The inequalities here are only certificates, not the requested complete Minc resolution.
