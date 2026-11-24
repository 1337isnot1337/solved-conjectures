# The parity witnesses are not stationary for the height

This supplement concerns the two lattice families in [PROOF.md](PROOF.md). The counterexample to the original all-shell assertion does not depend on this analytic argument.

Let $`L\subseteq\mathbb R^n`$ be either parity lattice, let $`H=\operatorname{diag}(h_1,\ldots,h_n)`$ be trace-free, and put $`L_s=e^{sH}L`$. We will show that the height of the flat torus $`\mathbb R^n/L_s`$ has a nonzero derivative at $`s=0`$ for an explicit $`H`$.

## Sign of the theta derivative

For $`t>0`$ let
```math
 A(t)=\sum_{j\in\mathbb Z}e^{-4\pi tj^2},\qquad
 C(t)=\sum_{j\in\mathbb Z}e^{-\pi t(2j+1)^2},\qquad q(t)=C(t)/A(t).
```
Poisson summation on the integer and half-integer translates gives
```math
 A(t)=(4t)^{-1/2}\vartheta_3(0,Q),\qquad
 C(t)=(4t)^{-1/2}\vartheta_4(0,Q),\qquad Q=e^{-\pi/(4t)}.
```
The classical Jacobi products ([DLMF 20.5.3–20.5.4](https://dlmf.nist.gov/20.5#i)) yield
```math
 q(t)=\prod_{j\ge1}\left(\frac{1-Q^{2j-1}}{1+Q^{2j-1}}\right)^2.
```
Hence $`0<q(t)<1`$ and $`(\log q)'(t)<0`$. The logarithms and their termwise derivatives converge locally uniformly in $`t>0`$, by a geometric bound at $`Q`$ bounded away from $`1`$. Each logarithmic derivative is strictly negative.

The theta contribution for a coset with odd-coordinate support $`S\subseteq[n]`$, before deformation, is $`A^n q^{|S|}`$. Under deformation the $`i`$th factor has argument $`t e^{2s h_i}`$. Differentiating at $`s=0`$ and using $`\sum_i h_i=0`$ gives
```math
 \partial_s \Theta_{L_s}(t)|_{s=0}
 =2t A(t)^n(\log q)'(t)\sum_{S}q(t)^{|S|}\sum_{i\in S}h_i,
```
where $`\Theta_M(t)=\sum_{x\in M}e^{-\pi t\|x\|^2}`$, and $`S`$ ranges over the codeword supports of the parity lattice defining $`L`$.

For the index-two witness, take $`h_1=n-1`$, $`h_i=-1`$ for $`i>1`$. The only nonempty support excludes the first coordinate; its trace is $`-(n-1)`$. Therefore this theta derivative is positive for every $`t>0`$.

For the orthogonally indecomposable witness, use blocks of sizes $`\alpha=2k,\ \beta=2k+1,\ \beta=2k+1`$ as in the proof. Take $`h_i=2\beta`$ on $`A`$ and $`h_i=-\alpha`$ on $`B,C`$. Then the traces on $`A\cup B,A\cup C,B\cup C`$ are $`\alpha\beta,\alpha\beta,-2\alpha\beta`$, respectively. The sum in the derivative formula is $`2\alpha\beta q^{4k+1}(1-q)>0`$, so the theta derivative is negative for every $`t>0`$.

## Passing from theta to height

Write $`M_s=L_s^*`$ for the standard dual lattice. The covolumes of both families $`L_s`$ and $`M_s`$ are $`s`$-independent. By Poisson summation,
```math
 \Theta_{M_s}(t)=\operatorname{covol}(L)\,t^{-n/2}\Theta_{L_s}(1/t).
```
Thus the derivative for $`M_s`$ has the same strict sign on $`t>0`$. The derivatives of the respective theta series decay exponentially as $`t\to\infty`$, and are $`O(t^{-n/2}e^{-c/t})`$ as $`t\downarrow0`$, uniformly for $`s`$ in a compact neighborhood of $`0`$ after slightly decreasing $`c>0`$. For example, the derivative of each nonzero Gaussian term at large $`t`$ is bounded by a constant times $`t\|x\|^2 e^{-ct\|x\|^2}`$ using uniform singular-value bounds in $`s`$; the short-time estimate then follows from Poisson and the fixed covolume, since the dual's constant term has derivative zero.

In the notation of [Coulangeon–Lazzarini](https://arxiv.org/pdf/1401.2891), equation (6), the height is $`h(L_s)=Z'(M_s,0)+2\log(2\pi)`$, with $`Z(M,z)=\sum_{0\ne v\in M}\|v\|^{-2z}`$ continued meromorphically. For $`\operatorname{Re}z>n/2`$, the Mellin identity gives
```math
 \left.\partial_s Z(M_s,z)\right|_{s=0}
 =\frac{\pi^z}{\Gamma(z)}\int_0^\infty
       \left.\partial_s\Theta_{M_s}(t)\right|_{s=0} t^{z-1}\,dt.
```
The integral on the right is entire in $`z`$ by the two endpoint bounds. Differentiation in $`s`$ and continuation are compatible by subtracting the $`s`$-independent terms, equivalently by applying the same formula to $`Z(M_s,z)-Z(M_0,z)`$ and dominated convergence. Since $`\pi^z/\Gamma(z)=z+O(z^2)`$ at $`0`$, it follows that
```math
 \left.\frac{d}{ds}h(L_s)\right|_{s=0}
 =\int_0^\infty \left.\partial_s\Theta_{M_s}(t)\right|_{s=0}\frac{dt}{t}.
```
The continuous integrand has a strict fixed sign, so this derivative is nonzero. A common rescaling to covolume one merely replaces $`t`$ in each primal theta series by a fixed positive multiple, so the conclusion also holds in the unit-covolume space used in the source.
