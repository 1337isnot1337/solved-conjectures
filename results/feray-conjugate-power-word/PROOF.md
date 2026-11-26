# Féray’s random permutation word conjectures

**Result.** If $\sigma$ and $\tau$ are independent uniform permutations of $[n]$, then
```math
d_\mathrm{TV}(\mathcal L(\sigma\tau\sigma^2\tau^2),\mathop{\mathrm{Unif}}(S_n))
=O\!\left(\frac{(\log n)^2}{n}\right).
```
This proves both explicitly numbered conjectures in Valentin Féray’s “Words in random permutations,” [*Oberwolfach Reports* 2/2026, Problem 5, pp. 146–147](https://ems.press/content/serial-article-files/53596?nt=1#page=66), and its stronger total-variation conjecture for the displayed word. It does not establish the subsequent extension to every primitive word (in the report’s sense of not being a concatenation power).

## 1. Conditional independence

Let $X=\sigma\tau$ and $Y=\tau$. The map $(\sigma,\tau)\mapsto(X,Y)$ is a bijection of $S_n^2$, so $X,Y$ remain independent and uniform. Substituting $\sigma=XY^{-1}$ gives the exact identity
```math
\sigma\tau\sigma^2\tau^2=X^2 Y^{-1}XY.
```
More generally fix nonzero integers $a,b$ and consider $W=X^aY^{-1}X^bY$.

For a cycle type $\lambda$, let $C_a(\lambda)$ be the conjugacy class of the $`a`$th power of an element of type $\lambda$. Given the event that $X$ has type $\lambda$, the random variables $X^a$ and $Y^{-1}X^bY$ are *independent* and uniform on $C_a(\lambda)$ and $C_b(\lambda)$, respectively. In fact $X$ is then uniform on its class, and the power map is onto $C_a(\lambda)$ and conjugation-equivariant, hence pushes uniform measure to uniform measure. Given any particular $X$ of type $\lambda$, conjugation of $X^b$ by uniform $Y$ has uniform law on $C_b(\lambda)$, a law not depending on the choice of $X$. This proves the conditional independence, which is not being asserted unconditionally.

For an $X$-cycle of length $j$, raising $X$ to the power $`a`$ splits the cycle into $\gcd(j,|a|)$ cycles. Every element of $C_a(\lambda)$ therefore has at most $|a|\mathop{\mathrm{cyc}}(X)$ cycles. Here $\mathop{\mathrm{cyc}}$ counts all cycles including fixed points.

## 2. Mixing two classes with few cycles

Let $g,h\in S_n$. Write $\mu_g,\mu_h$ for the uniform measures on their conjugacy classes, and let $u_{g,h}$ be the uniform measure on the parity coset of sign $\mathop{\mathrm{sgn}}(g)\mathop{\mathrm{sgn}}(h)$. For an irreducible representation with ordinary character $\chi$ and dimension $d_\chi$, the Fourier transform of $\mu_g$ is the scalar $\chi(g)/d_\chi$ times the identity by Schur’s lemma. The transforms of $u_{g,h}$ at the trivial and sign representations coincide with those of $\mu_g*\mu_h$; its transforms at other representations vanish. The latter follows by writing $u_{g,h}$ as the translate of the uniform measure on $A_n$: averaging a representation over $A_n$ projects onto its $A_n$-invariant vectors, which in an irreducible representation are absent unless the representation factors through $S_n/A_n$.

By Cauchy–Schwarz followed by finite-group Plancherel applied to $\mu_g*\mu_h-u_{g,h}$,
```math
4d_\mathrm{TV}(\mu_g*\mu_h,u_{g,h})^2
\leq\sum_{\chi\notin\{1,\mathop{\mathrm{sgn}}\}}d_\chi
           \left\|\frac{\chi(g)\chi(h)}{d_\chi^2} I_{d_\chi}\right\|_\mathrm{HS}^2
=\sum_{\chi\notin\{1,\mathop{\mathrm{sgn}}\}}
           \frac{|\chi(g)\chi(h)|^2}{d_\chi^2}.
```
This is the usual Diaconis–Shahshahani bound taken on $S_n$ rather than on the coset itself.

Two standard character estimates give a uniform rate. [Teyssier and Thévenin, arXiv:2411.04347v4, Theorem 1.7 and §6.2](https://arxiv.org/html/2411.04347v4), improving the [Larsen–Shalev character bounds](https://doi.org/10.1007/s00222-008-0145-7), give an absolute constant $A$ such that, uniformly in $g$ and $\chi$ for sufficiently large $n$,
```math
|\chi(g)|\leq d_\chi^{(\log\mathop{\mathrm{cyc}}(g)+A)/\log n}.
```
Also, the fixed-parameter Witten-zeta bound of Liebeck and Shalev, given in §6.2, Eq. (6.3) at rank cutoff 1 after adding transposed partitions, gives
```math
\zeta_n^*(1):=\sum_{\chi\notin\{1,\mathop{\mathrm{sgn}}\}}d_\chi^{-1}\leq B/n
```
for an absolute constant $`B`$. For any real $`s\geq1`$, the monotonicity of finite $`\ell^p`$ norms implies $`\zeta_n^*(s)\leq(\zeta_n^*(1))^s`$.

Now if both $g,h$ have at most $K\log n$ cycles, put $q_n=(\log(K\log n)+A)/\log n$ and $s_n=2-4q_n$. For fixed $K$ and all sufficiently large $n$, $1\leq s_n\leq2$. The last sum in Plancherel is at most
```math
\zeta_n^*(s_n)\leq(B/n)^{s_n}
=O_K\!\left(\frac{(\log n)^4}{n^2}\right).
```
Thus the variation distance is $O_K((\log n)^2/n)$ uniformly over the two classes. The rate only uses an upper bound on their cycle counts, not any relationship between their cycle types.

## 3. Averaging the cycle type

For a uniform $X$, the unsigned Stirling cycle enumerator gives
```math
\mathbf E\, 2^{\mathop{\mathrm{cyc}}(X)}=\frac{2\cdot3\cdots(n+1)}{n!}=n+1.
```
The identity follows by inserting the last letter: it either forms its own cycle, gaining a factor $2$, or follows any of the $n-1$ previous letters. Markov's inequality yields
```math
\Pr\{\mathop{\mathrm{cyc}}(X)>4\log_2 n\}\leq (n+1)n^{-4}.
```
Outside this exceptional event, the two classes in Section 1 satisfy the cycle bound in Section 2 with $K$ depending only on $a,b$. Given the cycle type of $X$, approximate the law of $W$ by uniform measure on the parity coset of sign $\mathop{\mathrm{sgn}}(X)^{a+b}$. By convexity, mixing these target measures over the *unconditional* cycle-type distribution costs at most the mean conditional error, hence $O_{a,b}((\log n)^2/n)$. When $a+b$ is even the mixture is exactly $\mathop{\mathrm{Unif}}(A_n)$. When it is odd, the two signs of a uniform $X\in S_n$ are exactly balanced for $n\geq2$, so the mixture is exactly $\mathop{\mathrm{Unif}}(S_n)$.

For Féray’s word, $(a,b)=(2,1)$ and the sum is odd. Total variation does not increase under either the normalized length of the cycle containing $1$ or the decreasing list of normalized cycle lengths (padded with zeros). For uniform permutations the first statistic is discrete uniform on $`\{1/n,\ldots,1\}`$ and tends to the uniform law on $[0,1]$. The second converges to the classical $\mathrm{PD}(1)$ law; see the cited report and the [uniform permutation result of Arratia, Barbour and Tavaré](https://www.columbia.edu/cu/simontavare/STpapers-pdf/ABT06.pdf). The same limits therefore hold for the word in question.

## Scope and relation to earlier work

- The report credits Lucas Teyssier with a change of generators for words with at most two occurrences of one letter. Each generator appears three times in the exact displayed word, so that stated case does not apply directly. Here the change of generators leaves dependent powers, but conditioning on cycle type and using the uniform conjugator gives independent classes.
- The report credits Kammoun and Maïda for joint Poisson limits of any finite list of short-cycle counts. This does not by itself control macroscopic cycles or total variation. The related [Hanany–Puder work on symmetric word measures](https://arxiv.org/abs/2009.00897) treats stable characters, short cycles and other applications, not the full total variation claim used here.
- [Chmutov and Pittel](https://arxiv.org/abs/1503.01816) and Teyssier–Thévenin apply the class-Fourier argument in random-map or conjugacy-class mixing settings. The character and zeta estimates here are their established tools, not new estimates. The application is the exact conditional product representation for the word posed in the report.
