# Alexandersson's Catalan-word peak conjecture

Status: unresolved research checkpoint, 20 November 2026. The target is the whole sequence, including consecutive interlacing. This file adds reductions to the earlier [research note](../../docs/alexandersson-catalan-peaks-research.md). It does not claim a solution.

## Statement and conventions

A Catalan word of length $n$ is a word $w_1\cdots w_n$ with $w_1=0$ and $0\leq w_{j+1}\leq w_j+1$. A strict local peak is a position $j$ with $w_{j-1}<w_j>w_{j+1}$. Define $`C_n(t)=\sum_w t^{\mathop{\mathrm{pk}}(w)}`$, with $C_0(t)=1$.

Alexandersson conjectures that all these polynomials have only real zeros and that consecutive polynomials interlace. The first nonconstant rows are $C_3=4+t$, $C_4=9+5t$, and $C_5=22+19t+t^2$.

The primary enumerative paper calls this statistic **short peaks**. Its separate plateau-permitting statistic called peaks is different. The source is Baril, Harris, Harry, McClinton and Ramírez, *Enumerating runs, valleys, and peaks in Catalan words*, Theorem 5.1 with $\ell=1$ in the arXiv version:

- https://arxiv.org/abs/2404.05672
- https://jl.baril.u-bourgogne.fr/pamkim.pdf
- https://doi.org/10.26493/2590-9770.1794.fc5

The named conjecture is recorded at https://www.symmetricfunctions.com/realRootedOpenProblems.htm and the coefficient triangle is OEIS A116424.

## Exact Narayana diagonal identity

Use the Narayana convention

```math
N_0(y)=1,\qquad
N_r(y)=\frac1r\sum_{j=0}^{r-1}\binom rj\binom r{j+1}y^j
\quad(r\geq1).
```

For $n\geq1$, put $B_n(u)=C_n(1+u)$. Then

```math
[u^i]B_n(u)=[u^i]N_{n-i}(1+u)
=\frac1{n-i}\binom{n-i}{i}
  \binom{2n-3i}{n-2i-1},
\qquad
0\leq i\leq\left\lfloor\frac{n-1}{2}\right\rfloor.
```

Here is a direct coefficient proof. For $r\geq1$,

```math
\begin{aligned}
[u^i]N_r(1+u)
&=\frac1r\sum_{j=i}^{r-1}
  \binom rj\binom r{j+1}\binom ji
\\ &=\frac1r\binom ri
  \sum_{\ell\geq0}\binom{r-i}{\ell}\binom r{i+\ell+1}
\\ &=\frac1r\binom ri\binom{2r-i}{r-i-1}.
\end{aligned}
```

The last step is Vandermonde's identity. Set $r=n-i$. The published Catalan-word formula has exactly this coefficient.

Equivalently, if $N(x,y)=\sum_{r\geq0}N_r(y)x^r$, then

```math
\sum_{n\geq0}C_n(1+u)x^n
  =\sum_{r\geq0}N_r(1+ux)x^r
  =N(x,1+ux).
```

The ordinary Narayana equation $N=1+xN(1-y+yN)$ gives

```math
F(x,u)=1-u x^2F(x,u)+x(1+ux)F(x,u)^2,
```

with discriminant

```math
1-4x-2ux^2+u^2x^4.
```

The reduction is exact for every index. It is a diagonal operation on a varying Narayana row. Real-rootedness of the individual Narayana rows does not by itself prove real-rootedness or interlacing of these diagonals.

## A failed multiplier argument

For odd $n=2m+1$, reversing the coefficient formula gives

```math
[u^{m-j}]B_{2m+1}(u)
=\frac{1}{2j+1}\binom{m+j}{2j}\binom{m+3j+2}{2j}.
```

One tempting route starts with the real-rooted Fibonacci-type row having coefficients $\binom{m+j}{2j}$, and applies the diagonal coefficient multiplier

```math
\lambda_j=\frac1{2j+1}\binom{m+3j+2}{2j}.
```

A general real-rootedness-preserving diagonal operator on degree-$`m`$ polynomials would need a real-rooted finite Pólya–Schur symbol $\sum_j\binom mj\lambda_j z^j$. Already for $m=3$ this symbol is

```math
1+28z+198z^2+429z^3,
```

whose discriminant is $-141603$. It has one real zero and two nonreal zeros. Therefore that general multiplier-preservation argument is invalid.

This is not a counterexample to Alexandersson's conjecture. The multiplier might preserve a much smaller family, but that would require a separate proof.

A second candidate symbol, obtained by comparing with coefficients of $(1-2z+s z^4)^{-1}$, also fails. For

```math
\mu_j^{(m,p)}
=\frac{(2j+p)\binom{4j+2p}{2j+p}}
 {4^{2j+p}(m+j+p)(m+j+p+1)},
\qquad p\in\{1,2\},
```

the degree-three binomial symbols are

```math
\begin{aligned}
\sum_{j=0}^3\binom3j\mu_j^{(3,1)}z^j
 &=\frac1{40}+\frac3{32}z+\frac{45}{512}z^2
   +\frac{429}{16384}z^3,
\\ \sum_{j=0}^3\binom3j\mu_j^{(3,2)}z^j
 &=\frac1{40}+\frac5{64}z+\frac{297}{4096}z^2
   +\frac{715}{32768}z^3.
\end{aligned}
```

Their discriminants are respectively $-335907/429496729600$ and $-43153/687194767360$. Neither is a general finite multiplier sequence. These exact cubic obstructions are recorded to prevent unsupported use of either closure claim.

## Analytic observation, not a root-count proof

For $u=-s<0$, the reciprocal discriminant is

```math
P_s(w)=(w^2+s)^2-4w^3.
```

The positive double-root transition occurs at $s=27/16$, $w=9/4$. Indeed $P_s(w)=P_s'(w)=0$ gives these values away from zero. This suggests studying the four branch points and their coefficient contributions. It does not establish where the finite-row zeros lie, their number, or consecutive interlacing. No phase-count or positive-integral representation has yet been proved.

## Prior-work checks and remaining novelty limits

The current open-problem page is a lead, not proof that no earlier solution exists. The same page has other entries with earlier public resolutions.

Checks included the exact sequence number, the strict Catalan-word statistic, UDUU occurrences in Dyck paths, the conjecture's author, and public issue/PR records in the author's RealRooted project. The existing repository issue is [#59](https://github.com/1337isnot1337/solved-conjectures/issues/59); no duplicate issue was created.

Two nearby prior results concern different polynomials:

- Wang–Zhang, *Interlacing Property of a Family of Generating Polynomials over Dyck Paths*, DOI 10.37236/12375, keeps the number of UD occurrences fixed and marks UUD. This differs from A116424's UDUU statistic.
- Elizalde–Rivera–Zhuang's results on big descents of pattern-avoiding permutations, DOI 10.1007/s00026-026-00805-1, do not identify this family. For example, the relevant 231-avoiding row at $n=4$ is $8+6t$, whereas $C_4=9+5t$. The public RealRooted proof record for 132-avoiding big descents also has different initial rows and degrees.

Alexandersson–Leite's 2026 paper on peaks and peak-nestings on unit interval graphs (arXiv:2609.38084) is a remaining full-text overlap check. Its abstract alone is insufficient to exclude overlap. No new-result claim should be made before completing that check and auditing any later public proof records.

## Status

The Narayana diagonal identity is a proved reduction. Two broad multiplier invariants are disproved. The named real-rootedness-and-interlacing conjecture remains open in this research lane. Finite computations are not counted as a solution.
