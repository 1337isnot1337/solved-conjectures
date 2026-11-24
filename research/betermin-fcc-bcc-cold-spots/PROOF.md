# Bétermin’s FCC/BCC cold-spot conjecture

**Result.** For every $`n\ge3`$ and every $`\alpha>0`$, the global minimizers of $`\sum_{v\in L}e^{-\alpha\|v-z\|^2}`$ over $`z\in\mathbb R^n`$ are exactly the deep holes of $`L`$, for both $`L=D_n`$ and $`L=D_n^*`$. In dimension $`3`$ these are FCC and BCC, respectively.

Laurent Bétermin proposed the dimension-$`3`$ equality between cold spots and deep holes in [*Minimal Soft Lattice Theta Functions*](https://doi.org/10.1007/s00365-019-09494-x), Constr. Approx. **52** (2020), 115–138, Remark 5.10. The paper's explicit BCC point does not match its geometric deep-hole condition; the correction is given below. Bachoc, Moustrou, Vallentin and Zimmermann [*Polarization of lattices: stable cold spots and spherical designs*](https://doi.org/10.1017/fms.2026.10169), Forum Math. Sigma **14** (2026), e25, §1.6, ask about strengthening stable cold spots of root lattices to universal ones, and separately leave $`D_n^*`$, $`n\ge5`$, unresolved even as regards stability. The theorem here addresses the checkerboard and dual checkerboard families, not every lattice in their question.

We use the unscaled realizations
```math
D_n=\{m\in\mathbb Z^n:\textstyle\sum_i m_i\equiv0\pmod2\},\qquad
D_n^*=\mathbb Z^n\cup\bigl((1/2)^n+\mathbb Z^n\bigr)
```
where $`(1/2)^n`$ denotes the vector all of whose coordinates are $`1/2`$. The displayed dual follows by testing inner products against the generators $`e_i-e_j`$ and $`2e_i`$: the coordinates are congruent modulo $`1`$ and are all integers or all half-integers. Conversely both types of vectors pair integrally with $`D_n`$. Scaling by a factor $`c>0`$ scales all minimizers and changes $`\alpha`$ to $`c^2\alpha`$.

## 1. Universal minimizers on the dual checkerboard $`D_n^*`$

Let
```math
 a(t)=\sum_{m\in\mathbb Z}e^{-\alpha(m-t)^2},\qquad
 u(t)=a(t-1/2).
```
Then the Gaussian sum is $`P(z)=\prod_i a(z_i)+\prod_i u(z_i)`$. From one-dimensional Poisson summation,
$`a(t)=\sqrt{\pi/\alpha}\,\vartheta_3(\pi t,q)`$, where $`q=e^{-\pi^2/\alpha}\in(0,1)`$. The Jacobi product ([DLMF 20.5.3](https://dlmf.nist.gov/20.5.E3)) has the form, with $`x=\cos(2\pi t)`$,
```math
 a(t)=K\prod_{j\ge1}(1+b_j x),\qquad
 u(t)=K\prod_{j\ge1}(1-b_j x),\qquad
 b_j=\frac{2q^{2j-1}}{1+q^{4j-2}}\in(0,1),
```
with $`K>0`$ independent of $`x`$ and $`\sum_j b_j<\infty`$.

Set $`s(x)=(\log a-\log u)/2=\sum_j\operatorname{artanh}(b_j x)`$, and $`g(x)=(\log a+\log u)/2`$. The function $`s(x)`$ is strictly increasing, odd, and sends $`[-1,1]`$ bijectively to $`[-S,S]`$, where $`S=s(1)>0`$. Write $`G(s(x))=g(x)`$. It is an even, strictly concave function of $`s`$. Indeed, with $`w_j=b_j/(1-b_j^2x^2)>0`$,
```math
 G'(s(x))=-x\,M(x),\qquad
 M(x)=\frac{\sum_j b_j w_j(x)}{\sum_j w_j(x)}.
```
For $`x\ge0`$, $`M'(x)`$ is the covariance, under weights $`w_j/\sum w_j`$, of $`b_j`$ and $`2x b_j^2/(1-b_j^2x^2)`$. This is nonnegative because the latter is increasing in $`b_j`$; equivalently, write the covariance as half the mean of $`(B-B')(h(B)-h(B'))`$ for two independent copies. The function $`M`$ is positive and even. Thus $`G'`$ is strictly decreasing, as claimed. All absolute convergence and differentiation on $`[-1,1]`$ follow from geometric decay in $`j`$ and $`b_1<1`$.

The objective becomes
```math
 P=2\exp\!\left(\sum_i G(s_i)\right)\cosh\!\left(\sum_i s_i\right),\qquad s_i\in[-S,S].
```
For a fixed sum of the $`s_i`$, a minimizer has at most one coordinate in $`(-S,S)`$: with two such coordinates, shifting one up and the other down produces a strictly concave function of the shift, so the internal choice is not minimal. Existence of a minimizer follows from compactness.

**Even $`n`$.** Since $`G(s)\ge G(S)`$, with equality only at endpoints, and $`\cosh(\sum s_i)\ge1`$, global equality occurs exactly with all $`s_i`$ endpoints and half of each sign. In the original coordinates, half the coordinates are integers and half are half-integers.

**Odd $`n`$.** Among the $`n-1`$ endpoint coordinates the imbalance $`m`$ is even, and the remaining coordinate has parameter $`s\in[-S,S]`$. For every such $`s`$, a choice with $`m\ne0`$ cannot beat $`m=0`$, since
```math
 |mS+s|\ge2S-|s|\ge|s|.
```
For $`m=0`$ the remaining one-dimensional factor to minimize is $`a(t)+u(t)`$, equal to
```math
 \sum_{m\in\mathbb Z}e^{-(\alpha/4)(m-2t)^2}.
```
By the product, a period-one Gaussian sum has its unique minimum modulo $`1`$ at a half-integer. Thus $`t\in1/4+(1/2)\mathbb Z`$, which is $`s=0`$. Equality in the preceding comparison with $`m\ne0`$ can only occur at $`|s|=S`$; such endpoint $`s`$ does not minimize the one-dimensional factor. The exact minimizing pattern is therefore one quarter-integer and balanced integer/half-integer coordinates among the other $`n-1`$.

To identify the deep holes, let $`y_i=\operatorname{dist}(z_i,\mathbb Z)\in[0,1/2]`$ and $`w_i=4y_i-1\in[-1,1]`$. The squared distance to $`D_n^*`$ is
```math
 \min\left(\sum_i y_i^2,\sum_i(1/2-y_i)^2\right)
 =\tfrac1{16}\left(n+\sum_i w_i^2-2\left|\sum_i w_i\right|\right).
```
For even $`n`$ it is at most $`n/8`$, with equality exactly at balanced endpoints. For odd $`n`$, at a maximum with fixed sum the strictly convex square sum allows at most one non-endpoint coordinate. For the other $`n-1`$ coordinates the imbalance $`m`$ is even. The last coordinate $`x\in[-1,1]`$ contributes $`x^2-2|m+x|`$ beyond the constant $`2n-1`$ in the numerator. For $`m=0`$ it is at most zero, with equality exactly at $`x=0`$. For $`|m|\ge2`$ it is at most $`-1`$. Thus the squared covering radius for odd $`n`$ is $`(2n-1)/16`$, with precisely the quarter-integer pattern already proved. This completes $`D_n^*`$.

## 2. Universal minimizers on the checkerboard $`D_n`$

Put $`b(t)=\sum_{m\in\mathbb Z}(-1)^m e^{-\alpha(m-t)^2}`$. By projecting onto even coordinate sum, the Gaussian potential on $`D_n`$ is
```math
 \tfrac12\left(\prod_i a(z_i)+\prod_i b(z_i)\right).
```
Write $`a_0=a(0)>0`$, $`b_0=b(0)>0`$, and $`a_h=a(1/2)>0`$. We have $`a(t)>|b(t)|`$ because their even and odd summands are both positive. Poisson summation gives $`a(t)=K_0\vartheta_3(\pi t,q)`$, $`b(t)=K_0\vartheta_2(\pi t,q)`$ with the same $`K_0=\sqrt{\pi/\alpha}`$ and nome $`q=e^{-\pi^2/\alpha}`$. In particular $`b_0>0`$, $`b(t+1)=-b(t)`$, $`b(1/2)=0`$, and $`a(t)\le a_0`$ with equality only at integers (all Fourier coefficients in $`a`$ are positive).

The identities needed are
```math
 a(t)^2-b(t)^2=c_2\vartheta_4(\pi t,\sqrt q),\qquad
 a(t)^4-b(t)^4=c_4\vartheta_4(2\pi t,q)
```
for positive constants $`c_2,c_4`$ independent of $`t`$. For verification, set $`U=\vartheta_3(2x,q^2)`$, $`V=\vartheta_2(2x,q^2)`$, $`A=\vartheta_3(0,q^2)`$, $`B=\vartheta_2(0,q^2)`$. Regroup the two indices in the square of the theta series into half-sums and half-differences, giving
$`\vartheta_3(x,q)^2=AU+BV`$ and $`\vartheta_2(x,q)^2=BU+AV`$.
Here $`U-V=\vartheta_4(x,\sqrt q)`$, by putting the even and odd indices together, and $`A-B>0`$. Subtracting the square identities proves the first claim. Subtracting their squared versions gives $`(A^2-B^2)(U^2-V^2)`$, and a second application of the first identity gives the second claim. The positive constant-times-$`\vartheta_4`$ expressions are minimized when their argument is an integer multiple of $`\pi`$, strictly otherwise, by the Jacobi product ([DLMF 20.5.4](https://dlmf.nist.gov/20.5.E4)). Hence
```math
 a(t)^4-b(t)^4\ge a_h^4,\quad\text{with equality just at }t\in\tfrac12\mathbb Z,
 \qquad
 a(t)^2-b(t)^2\ge a_0^2-b_0^2.
```

For $`n\ge4`$, positivity of $`a_h`$ gives $`a(t)^n\ge(a_h^4+|b(t)|^4)^{n/4}\ge a_h^n+|b(t)|^n`$. The last inequality is strict if $`n>4`$ and $`b(t)\ne0`$. Hölder's inequality with $`n`$ factors now gives
```math
 \prod_i a(z_i)\ \ge\ \prod_i(a_h^n+|b(z_i)|^n)^{1/n}
 \ \ge\ a_h^n+\prod_i |b(z_i)|.
```
For $`n>4`$, equality in the potential thus requires all $`b(z_i)=0`$ and $`a(z_i)=a_h`$, hence all coordinates half-integers, where the lower bound is attained. For $`n=4`$, equality in the scalar inequalities forces all coordinates into $`\tfrac12\mathbb Z`$; equality in Hölder requires the ratios $`|b(z_i)|/a_h`$ to be identical. The possibilities are all half-integers or all integers, and the latter attains the potential bound exactly when the coordinate sum is odd, since $`\prod_i b(z_i)=(-1)^{\sum_i z_i}b_0^4`$.

For $`n=3`$, put $`\rho(t)=|b(t)|/a(t)\in[0,1)`$. The square inequality and $`a(t)\le a_0`$ imply $`\rho(t)\le\rho_0=b_0/a_0`$, with equality only for integers. On $`[0,1)`$, $`f(\rho)=(1-\rho^3)/(1-\rho^4)^{3/4}`$ is strictly decreasing (its logarithmic derivative is $`3\rho^2(\rho-1)/((1-\rho^3)(1-\rho^4))`$ for $`0<\rho<1`$). It follows that
```math
 a(t)^3-|b(t)|^3=(a(t)^4-b(t)^4)^{3/4}f(\rho(t))
 \ \ge\ a_h^3f(\rho_0)=a_0^3-b_0^3
```
with equality just at integers. Hölder as before, with $`a_h^3`$ replaced by $`a_0^3-b_0^3`$, gives the global minimum $`(a_0^3-b_0^3)/2`$, attained exactly where all coordinates are integers with odd sum.

Finally choose a closest integer $`m_i`$ to each $`z_i`$, put $`y_i=|m_i-z_i|`$, and let $`M=\max_i y_i\le1/2`$. If $`\sum_i m_i`$ is even, the squared distance to $`D_n`$ is at most $`\sum_i y_i^2\le n/4`$. If odd, change the integer in a coordinate of deviation $`M`$ to the other nearest integer (the alternative at distance $`1-M`$). This gives the upper bound $`nM^2+1-2M`$. By strict convexity this is at most $`\max(1,n/4)`$, with equality only at an endpoint $`M`$, and the $`M=1/2`$ equality requires all $`y_i=1/2`$. The $`M=0`$ equality is exactly at integer coordinates of odd sum. The all-half-integer points have distance squared $`n/4`$ since an even-sum choice of nearest integers exists; odd integer points have distance squared $`1`$. This matches exactly the Gaussian minimizer classifications for $`n=3`$, $`n=4`$, and $`n>4`$.

## 3. Original scope, and priority note

In the covolume-one realization of Remark 5.10 the FCC representative $`2^{-1/3}(1,1,1)`$ is a deep hole. In its BCC realization (equation (2.5)), multiply the unscaled $`D_3^*`$ above by $`2^{1/3}`$. A deep-hole representative is $`2^{1/3}(1/2,1/4,0)`$, not its listed $`2^{-2/3}(1,1,0)=2^{1/3}(1/2,1/2,0)`$. Before scaling, the latter's squared distance to $`D_3^*`$ is $`1/4`$, whereas the former has squared distance $`5/16`$. The equality of cold-spot and deep-hole loci is true; the separate displayed BCC representative in the source is false.

The statements are for optimization over translations of each fixed lattice, not for selecting the extremizing lattice among all shapes. They also apply to nonzero positive mixtures of these Gaussian potentials provided the resulting sums are finite at all points, by nonnegative integration; the strict comparison away from the deep holes is preserved.

A closely related independent manuscript by Caius Folkerts, [*Universal cold spots of E8 and related lattices*](https://github.com/caiusdfolkerts/research/tree/9fcbca1143471e6e25c337def9897b58377e0b4c/cold_spots), recorded [Nov. 19, 2026](https://open-research-index.vercel.app/r/palomar/PALOMAR-2026-11-19-000011), treats $`E_6,E_8,E_7^*,BW_{16}`$ and $`D_n^+`$ for even $`n\ge8`$. Its §2.2 equation (4) is equivalent to the classical quartic one-variable identity used in §2 above. The paper does not state minimizer theorems on $`D_n`$ or $`D_n^*`$. The latter is not $`D_n^+`$: it adds the all-half translate to $`\mathbb Z^n`$, rather than to $`D_n`$. The direct $`D_n^*`$ argument in §1 uses the strict concavity of the even factor in the log-ratio parameter. Exact-phrase, BCC/FCC, dual-checkerboard and current publication searches did not locate an earlier full proof of Bétermin's translation statement. Priority is not claimed on the strength of a negative search.
