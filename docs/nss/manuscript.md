# Superlinearly many permanent values of prime-order binary circulants

**Research manuscript, 20 November 2026. AI-assisted internal mathematical checks have found no flaw in the argument below. External review remains outstanding; this manuscript is not presented as peer-reviewed.**

## Abstract

Let $`V(p)`$ count the distinct permanents of all binary circulant matrices of prime order $`p`$. Nemeth, Seberry and Shu conjectured in 1979 that $`V(p)=O(p)`$. We give an argument establishing
```math
V(p)\gg \frac{p^{3/2}}{\sqrt{\log p}},
```
and hence contradicting that conjecture. The construction uses dense binary circulants with prescribed Fourier profiles. A uniform permanent estimate of McCullagh, in the form proved by Divoux and Wang, separates permanent values within each row sum. The classical Brualdi–Newman congruence separates values belonging to different row sums. The proof does not establish the stronger conjectural fixed-row-sum asymptotic of Resta and Sburlati. The probabilistic construction also admits a deterministic, though exponential-time, specification.

## 1. The question and the result

For a positive integer $`n`$ and a set $`S\subseteq\mathbb Z/n\mathbb Z`$, write
```math
 C_n(S)_{ij}=\mathbf 1_{\{j-i\in S\}}.
```
Thus $`C_n(S)`$ is a binary circulant, and every row and column has sum $`|S|`$. Define
```math
 V(p)=\bigl|\{\mathop{\mathrm{per}}C_p(S):S\subseteq\mathbb Z/p\mathbb Z\}\bigr|.
```
All supports are allowed: zero may belong to $`S`$, no symmetry condition is imposed, and the row sum is not fixed.

Nemeth, Seberry and Shu [1, p.181] conjectured that $`V(p)=O(p)`$ for prime $`p`$. This is Conjecture 27 in the Cheon–Wanless survey [3]. Their discussion distinguishes it from the fixed-degree conjecture of Resta and Sburlati [4].

**Theorem 1.** There is an absolute constant $`c>0`$ such that, for every sufficiently large prime $`p`$,
```math
 V(p)\ge c\frac{p^{3/2}}{\sqrt{\log p}}.
```
In particular, $`V(p)/p\to\infty`$ along the primes.

No explicit numerical starting prime is asserted. A less sharp, fully specified amplitude grid also gives
```math
 V(p)\ge \left(\frac13+o(1)\right)p^{4/3}.
```
These statements concern all row sums collectively, not a fixed sparse row sum.

We use natural logarithms. For a real matrix, $`\|\cdot\|_{\mathrm{op}}`$ is the largest singular value and $`\|\cdot\|_{\max}`$ is the maximum absolute entry. The constants in all asymptotic bounds below are independent of the support, row sum and amplitude in their stated ranges.

## 2. The external analytic input

Put $`J_n=\mathbf1\mathbf1^T/n`$.

**Analytic input.** Fix $`A<\infty`$ and $`0\le r<1`$. Uniformly over doubly stochastic matrices $`D=J_n+B`$ satisfying
```math
 \|B\|_{\max}\le A/n,\qquad \|B\|_{\mathrm{op}}\le r,
```
one has
```math
 \frac{n^n\mathop{\mathrm{per}}D}{n!}
 =\det(I-B^TB)^{-1/2}+O_{A,r}(n^{-1/2}).                 \tag{1}
```

The qualitative version of (1) is McCullagh's permanent asymptotic [5], explicitly proved with uniformity in Divoux–Wang [6, Proposition 3.1 and Remark 2.1]. The rate used here is extracted from estimates in their proof; Appendix A gives that extraction. The permanent asymptotic and its underlying analytic estimates are external results, not claimed as contributions of this manuscript. In (1) the determinant square root is the positive real one. Zero entries in $`D`$ are permitted.

For the qualitative conclusion $`V(p)/p\to\infty`$, their stated uniform $`o(1)`$ estimate alone suffices. Section 6 separates that conclusion from the quantitative extension, which uses the rate in (1).

## 3. Binary supports with controlled Fourier profiles

**Lemma 2.** Let $`p\ge5`$ be prime, let $`k`$ be an integer satisfying $`p/3\le k\le2p/3`$, and put $`\rho=k/p`$. For each $`a\in[0,1/12]`$, there is a support $`S\subseteq\mathbb Z/p\mathbb Z`$ of size exactly $`k`$ such that the eigenvalues of $`D=C_p(S)/k`$ satisfy
```math
 \lambda_0=1,\qquad
 |\lambda_1-a/\rho|,|\lambda_{p-1}-a/\rho|\le\delta_p,
 \qquad
 \max_{\ell\notin\{0,1,p-1\}}|\lambda_\ell|\le\delta_p,       \tag{2}
```
where $`\delta_p=12\sqrt{\log p/p}`$.

**Proof.** Write $`\zeta=e^{2\pi i/p}`$. Independently select each $`s\in\mathbb Z/p\mathbb Z`$ with probability
```math
 q_s=\rho+2a\cos(2\pi s/p).
```
These probabilities lie in $`[1/6,5/6]`$. If $`X_s`$ is the selection indicator, character orthogonality gives
```math
 \mathbb E\sum_sX_s\zeta^{\ell s}
 =\begin{cases}
 k,&\ell=0,
 \\ pa,&\ell=1,p-1,
 \\ 0,&\text{otherwise}.
 \end{cases}                                                   \tag{3}
```
For each frequency, Hoeffding's inequality applied to real and imaginary parts bounds the probability that the complex error exceeds $`t`$ by $`4e^{-t^2/p}`$. Taking $`t=2\sqrt{p\log p}`$ and applying a union bound over all $`p`$ frequencies gives failure probability at most $`4p^{-3}<1`$. Thus a realization exists for which every Fourier error is at most $`t`$.

Its cardinality differs from $`k`$ by at most $`t`$, using frequency zero. Add or delete that many elements to obtain a set $`S`$ with exactly $`k`$ elements. Every edit changes every unnormalized Fourier coefficient by at most one. All errors after repair are therefore at most $`2t=4\sqrt{p\log p}`$. Dividing by $`k\ge p/3`$ proves (2). The Fourier eigenvalue convention may reverse all frequencies; the estimates are unchanged. $`\blacksquare`$

This is an existence argument for each profile. When many profiles are used later, they may be chosen separately; no simultaneous random event is required.

## 4. The permanent associated with a profile

Define
```math
 h(x)=-\log(1-x)-x,
 \qquad
 F(\rho,a)=\frac12(\rho^{-1}-1)+h\bigl((a/\rho)^2\bigr).
```

**Lemma 3.** There is an absolute constant $`C_0>0`$ such that, for all sufficiently large $`p`$, every support supplied by Lemma 2 satisfies
```math
 \left|\log\frac{\mathop{\mathrm{per}}C_p(S)}{k^p p!/p^p}
             -F(\rho,a)\right|
 \le C_0\sqrt{\frac{\log p}{p}}.                            \tag{4}
```

**Proof.** A real circulant is normal and is diagonalized by the Fourier matrix. For $`B=D-J_p`$, the constant-direction eigenvalue is zero and the other eigenvalues are $`\lambda_\ell`$, $`\ell\ne0`$. Consequently the eigenvalues of $`B^TB`$ are the squared magnitudes of those eigenvalues.

Every entry of $`B`$ is either $`-1/p`$ or $`1/k-1/p`$, so $`\|B\|_{\max}\le2/p`$. By (2),
```math
 \|B\|_{\mathrm{op}}\le a/\rho+\delta_p\le1/4+\delta_p\le1/2
```
for all sufficiently large $`p`$. We can apply (1) with the fixed constants $`A=2`$, $`r=1/2`$.

Parseval's identity supplies the exact relation
```math
 \sum_{\ell\ne0}|\lambda_\ell|^2=\frac pk-1=\rho^{-1}-1.       \tag{5}
```
Indeed, $`\sum_\ell|\sum_{s\in S}\zeta^{\ell s}|^2=pk`$, and $`\lambda_0=1`$. The exceptional eigenvalues are complex conjugates. It follows that
```math
 \log\det(I-B^TB)^{-1/2}
 =\frac12(\rho^{-1}-1)+h(|\lambda_1|^2)
       +\frac12\sum_{\ell\notin\{0,1,p-1\}}h(|\lambda_\ell|^2). \tag{6}
```
For clarity, the last sum does not accumulate $`p`$ copies of a worst-case error. For $`0\le x<1`$,
```math
 0\le h(x)=\sum_{m\ge2}\frac{x^m}{m}
       \le\frac{x^2}{2(1-x)}.
```
Since the squared magnitudes in that sum are at most $`\delta_p^2`$, while their total is at most two by (5), their contribution is at most
```math
 \frac{\delta_p^2}{2(1-\delta_p^2)}=O(\log p/p).             \tag{7}
```
Take $`p`$ large enough that $`\delta_p\le1/4`$, and put $`t=a/\rho\le1/4`$. Then
```math
 \bigl||\lambda_1|^2-t^2\bigr|
 \le\delta_p(2t+\delta_p)\le3\delta_p/4.
```
On $`[0,1/4]`$, $`h'(x)=x/(1-x)\le1/3`$. The difference between the exceptional term in (6) and $`h(t^2)`$ is therefore at most $`\delta_p/4`$.

Finally, (1) changes the logarithm by $`O(p^{-1/2})`$. This follows directly because its determinant factor is at least one and its normalized permanent is at least one by the van der Waerden inequality. Combining these bounds with $`\mathop{\mathrm{per}}C_p(S)=k^p\mathop{\mathrm{per}}D`$ proves (4). $`\blacksquare`$

## 5. Separating different row sums

The following congruence is classical: it is the binary case of Brualdi–Newman [2, Theorem 3.2, p.161]. We include its proof.

**Lemma 4.** If $`p`$ is prime, then
```math
 \mathop{\mathrm{per}}C_p(S)\equiv |S|\pmod p.                 \tag{8}
```

**Proof.** The permanent counts permutations $`\sigma`$ of $`\mathbb Z/p\mathbb Z`$ for which $`\sigma(i)-i\in S`$ for every $`i`$. Translation by $`c`$ acts by conjugation,
```math
 \sigma(i)\longmapsto\sigma(i-c)+c.
```
Every orbit has size one or $`p`$. A fixed permutation commutes with translation by one, so it is a translation $`\sigma(i)=i+s`$. Such a translation is admissible exactly when $`s\in S`$. There are $`|S|`$ fixed permutations, proving (8). $`\blacksquare`$

Thus distinct degrees in the interval $`[p/3,2p/3]`$ produce disjoint sets of permanent values.

## 6. Counting distinct values

### 6.1. Qualitative disproof using only uniform asymptotics

Fix an arbitrary positive integer $`M`$, and choose any $`M`$ distinct positive amplitudes in $`[1/24,1/12]`$. For each degree $`k`$ in the dense interval, construct a support for each amplitude.

For $`a>0`$,
```math
 \frac{\partial F}{\partial a}
 =\frac{2a^3}{\rho^4(1-a^2/\rho^2)}>0.                    \tag{9}
```
Continuity and compactness give a positive minimum separation of adjacent limiting logarithmic values, uniformly over $`\rho\in[1/3,2/3]`$. Even with (4) replaced by a uniform $`o(1)`$, all $`M`$ values within each degree are distinct for sufficiently large $`p`$. Lemma 4 separates the degrees. Therefore
```math
 V(p)\ge M\bigl(\lfloor2p/3\rfloor-\lceil p/3\rceil+1\bigr).
```
Since $`M`$ is arbitrary, $`V(p)/p\to\infty`$. This already disproves the original conjecture.

### 6.2. Quantitative bound

On $`a\in[1/24,1/12]`$, $`\rho\in[1/3,2/3]`$, (9) gives
```math
 \frac{\partial F}{\partial a}\ge\frac{3}{4096}.            \tag{10}
```
Set $`u_p=\sqrt{\log p/p}`$, and choose
```math
 M=\left\lfloor\frac{1}{131072 C_0u_p}\right\rfloor,
 \qquad a_j=\frac1{24}+\frac{j}{24M},\quad0\le j\lt M.
```
For sufficiently large $`p`$, $`M\ge1`$. Adjacent limiting logarithmic values differ by at least
```math
 \frac{1}{32768M}\ge4C_0u_p.
```
Each actual normalized logarithm differs from its target by at most $`C_0u_p`$, by Lemma 3. Hence all $`M`$ permanents within each degree are distinct. Lemma 4 again separates degrees, giving
```math
 V(p)\ge M\bigl(\lfloor2p/3\rfloor-\lceil p/3\rceil+1\bigr)
       \gg p^{3/2}/\sqrt{\log p}.
```
This proves Theorem 1.

For a grid independent of the unspecified constant $`C_0`$, take $`M=\lfloor p^{1/3}\rfloor`$ with the same amplitudes. The ratio of adjacent target separation to the error grows like $`p^{1/6}/\sqrt{\log p}`$, and tends to infinity. This proves the stated $`(1/3+o(1))p^{4/3}`$ corollary.

All constants in Lemmas 2 and 3 are independent of $`M`$. The proof therefore permits $`M`$ to grow. Uniform qualitative convergence without a rate would not, by itself, justify any prescribed growing choice of $`M`$.

## 7. A deterministic specification

This section gives a finite construction, not an efficient algorithm. Let $`L=\lceil\log_2p\rceil`$, and take a rational amplitude from the grid with $`M=\lfloor p^{1/3}\rfloor`$. Enumerate binary strings lexicographically and select the first whose unnormalized Fourier coefficients differ from the targets (3) by strictly less than $`2\sqrt{pL}`$, at every frequency. Such a string exists by the same concentration argument, since $`L\ge\log p`$ and the union failure probability is less than one.

Repair its cardinality by adding or removing the smallest available indices. The resulting error is less than $`12\sqrt{L/p}=O(\sqrt{\log p/p})`$, so the proof applies with enlarged absolute constants. Squared-error comparisons involve real algebraic numbers in a cyclotomic extension, and can be decided exactly. This defines a deterministic exponential-time family; no closed-form support or polynomial-time construction is claimed.

## Appendix A. Extracting a uniform rate

We explain why the estimates in Divoux–Wang [6, proof of Proposition 3.8 and Section 3.3] imply the rate in (1). This appendix extracts a rate from their proof; it does not reproduce their underlying Gaussian and rook-polynomial analysis.

Fix $`A,r`$, and choose a fixed compact interval $`I=[a,b]`$ with $`0<a<1<b<r^{-1}`$. If $`r=0`$, the estimate is immediate. For an $`n`$-by-$`n`$ matrix $`B`$, define its rook polynomial by
```math
 R_B(s)=\sum_{j=0}^n s^j
   \sum_{\substack{I,J\subseteq\{1,\ldots,n\}\\ |I|=|J|=j}}
     \mathop{\mathrm{per}}B[I,J],
```
where the permanent of the empty matrix is one. The normalized rook expression in their proof is
```math
 F_s(t)=R_B(st)\det(I-s^2t^2B^TB)^{1/2}
       =1+\sum_{k\ge1}f_k(s)t^k.
```
The determinant square root is the analytic branch equal to one at $`t=0`$; it is defined on the disk $`|st|r<1`$. Their coefficient estimates imply, uniformly for $`s\in I`$,
```math
 \sum_{1\le k\le K\sqrt n}|f_k(s)|
 \le\sum_{1\le E\le K\sqrt n}
       \frac{(CE/n)^{\lceil E/3\rceil}}{1-CE/n},           \tag{11}
```
with fixed constants $`C,K`$. Their Cauchy estimate bounds the remaining coefficient sum by $`O(e^{-c\sqrt n})`$, after a fixed sufficiently large choice of $`K`$.

Here is a sharper evaluation of (11) than its qualitative use in that paper. Put $`Q=\lceil K\sqrt n/3\rceil`$ and $`A_1=3C`$. For large $`n`$, the denominators are at least $`1/2`$. Grouping by $`q=\lceil E/3\rceil`$, the sum is at most
```math
 6\sum_{1\le q\le Q}(A_1q/n)^q.
```
Put $`v=A_1Q/n=O(n^{-1/2})`$. For $`q\ge2`$,
```math
 (A_1q/n)^q\le(A_1/n)^2q^2v^{q-2}.
```
When $`v\le1/2`$, the power sum on the right is at most 22. The complete bound is thus
```math
 6A_1/n+132A_1^2/n^2=O(n^{-1}).
```
Consequently their normalized rook approximation has uniform relative error $`O(n^{-1})`$ on $`I`$.

Their Gamma representation is
```math
 \frac{n^n\mathop{\mathrm{per}}D}{n!}=\mathbb E R_B(n/T),
 \qquad T\sim\mathop{\mathrm{Gamma}}(n+1,1).
```
Write $`Z=n/T`$ and $`\Delta(s)=\det(I-s^2B^TB)^{-1/2}`$. On $`I`$, $`\Delta`$ and its derivative are uniformly bounded. Direct Gamma moments give
```math
 \mathbb EZ=1,\qquad\mathbb EZ^2=\frac n{n-1},\qquad
 \mathbb E|Z-1|\le(n-1)^{-1/2}.
```
Thus replacing $`\Delta(Z)`$ by $`\Delta(1)`$ on $`\{Z\in I\}`$ costs $`O(n^{-1/2})`$. The probability of the complementary event is exponentially small; the stronger weighted tail estimate in their Section 3.3 bounds its contribution to $`\mathbb ER_B(Z)`$ by $`e^{-cn+O(\sqrt n)}`$. Combining the central rook error, the Lipschitz estimate and this tail bound proves (1), with constants depending only on the fixed bounds.

## Scope, provenance and review status

The analytic permanent estimate and the modular congruence are prior results. The proposed contribution is their application to a family of binary Fourier profiles, followed by uniform amplitude separation and counting across dense degrees. Literature searches checked the original paper, subsequent surveys and specialist status listings; no prior full resolution was located. Such searches cannot guarantee novelty or rule out unindexed work.

Independent AI-assisted internal checks examined the argument, rate extraction and conjecture scope. These checks are not independent human peer review. Finite exact-permanent checks are supplied separately as sanity checks, not as evidence sufficient for the asymptotic theorem. No Lean verification or external peer review is claimed.

## References

1. E. Nemeth, J. Seberry and M. Shu, *On the distribution of the permanent of cyclic (0,1) matrices*, Utilitas Mathematica **16** (1979), 171–182; conjecture on printed p.181 (PDF p.11). [Original paper](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf).
2. R. A. Brualdi and M. Newman, *Some Theorems on the Permanent*, Journal of Research of the National Bureau of Standards **69B** (1965), 159–163. Theorem 3.2. [Original paper](https://nvlpubs.nist.gov/nistpubs/jres/69B/jresv69Bn3p159_A1b.pdf).
3. G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra and its Applications **403** (2005), 314–342. Conjecture 27, pp.329–330. [Paper](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
4. G. Resta and G. Sburlati, *On the number of different permanents of some sparse (0,1)-circulant matrices*, Linear Algebra and its Applications **375** (2003), 197–209. [DOI](https://doi.org/10.1016/S0024-3795(03)00649-9).
5. P. McCullagh, *An asymptotic approximation for the permanent of a doubly stochastic matrix*, Journal of Statistical Computation and Simulation **84** (2014), 404–414. [arXiv:1205.5723](https://arxiv.org/abs/1205.5723); [DOI](https://doi.org/10.1080/00949655.2012.712122).
6. A. Divoux and S. Wang, *The Maximum Number of Hamiltonian Cycles in Tournaments*, arXiv:2610.23755v1 (2026). Proposition 3.1, Remark 2.1, Proposition 3.8 and Section 3.3. [Paper](https://arxiv.org/html/2610.23755v1).

The current specialist status page consulted during the novelty check was [Yair Lavi, Conjecture 27](https://yair-lavi.com/mincs-list/conjecture-27/index.html). It is status evidence, not a source for the proof.
