# Independent mathematical audit of Novelli–Thibon's conjecture

Audit date: 21 November 2026. Coordination: [issue 180](https://github.com/1337isnot1337/solved-conjectures/issues/180).

**Verdict: the proposed proof of the intended monomial-product identity passes independent mathematical review.** The argument covers every pair of partitions of the same size and all independent parameters in the defined multi-$`t`$ family. This audit does not establish priority, and it does not prove the separate Schur-positivity assertion.

## 1. Exact source and scope

The original source is Novelli and Thibon, [arXiv:2502.09072v2](https://arxiv.org/html/2502.09072v2), Conjecture 5.7, equations (87)–(88). I checked the definition of the modified family in Definition 5.3, equation (57), and the graph-descent expansion in Lemma 4.2, equation (35).

The conjecture concerns each Schur coefficient of $\widetilde H_\mu(X;q,\mathbf t)$. Its printed exponent $d_\mu$ must be read as $d_\lambda$, with $\lambda$ the Schur index. The following example uses the coefficient of $s_{321}$ in $\widetilde H_{222}$ and exponent $8$, agreeing with $d_{321}$ rather than $d_{222}$. The coefficient of $s_n$ likewise rules out a common exponent depending only on $\mu$. The manuscript states and proves the intended indexed identity explicitly; it does not count the printing error as a disproof.

The informal suggestion about other normalized Yang–Baxter traces immediately preceding the conjecture is not included in the theorem proved here. Nor is Conjecture 5.4, which asserts nonnegative Schur coefficients.

## 2. Reading order, graph, arms, and legs

I checked these conventions independently in Haglund and Wilson, [*Macdonald polynomials and chromatic quasisymmetric functions*, Electronic Journal of Combinatorics 27(3) (2020), P3.37](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v27i3p37/pdf/), Definitions 1–3 and 14, printed pages 3–4 and 7.

The manuscript matches the source conventions: French diagrams; row reading from top to bottom and left to right; attacks within a row or between an upper-right cell and a lower-left cell in adjacent rows; arm to the right; leg above; augmented edges from each nonbottom cell to the cell directly below it.

Consequently every vertical comparison uses an earlier position followed by a later position. This matters because equal letters must be standardized in the same direction as the position order. The graph counts also follow:

```math
B=\sum_r\binom{\mu_r}{2}=n(\mu'),\qquad
A=\sum_{r\ge2}\binom{\mu_r}{2}
  =\sum_{u\notin R_1}\mathop{\mathrm{arm}}(u),\qquad
|E(G_\mu)|=B+A.
```

The count of cells with $`1+\mathop{\mathrm{leg}}(u)=j`$, excluding the bottom row, is $\mu_{j+1}$. In a column of height $h$, the labels run once through $1,\ldots,h-1$.

## 3. Cancellation in the modified convention

The distinction between the source's untilded and modified functions is substantial. The proof correctly starts from equation (57), rather than transferring a formula for an untilded function without checking the parameter inversion.

For an optional vertical edge let $`\delta\in\{0,1\}`$ be the corresponding descent indicator, let $a$ be the arm, and put $`t=t_{1+\mathop{\mathrm{leg}}}`$. The included and excluded edge contributions sum to

```math
(t-q^a)q^\delta+(-t+q^{a+1})
=
\begin{cases}
(q-1)q^a,&\delta=0,
\\ (q-1)t,&\delta=1.
\end{cases}
```

This verifies the cancellation before setting $q=1$. Multiplying these expressions and canceling the global prefactor leaves exactly

```math
q^{I_G(\sigma)-\sum_u a(u)\delta_u(\sigma)}
\prod_u t_{1+\mathop{\mathrm{leg}}(u)}^{\delta_u(\sigma)}.
```

There is no remaining singularity in the derivative calculation. Even if one works in Laurent polynomials in $q$ before using nonnegativity of the HHL inversion statistic, expansion at $q=1$ remains valid.

## 4. The universal comparison identity

Let $`F_\sigma=F_{\mathop{\mathrm{Des}}(\sigma^{-1})}`$. The standardization identity

```math
F_\sigma(X)=\sum_{\mathop{\mathrm{std}}(w)=\sigma}x_{w_1}\cdots x_{w_n}
```

uses equal letters standardized from left to right. For $i<j$, the comparison $\sigma_i>\sigma_j$ therefore holds exactly when $w_i>w_j$. No equality case contributes. Summing over all words gives

```math
\sum_{\sigma\in S_n}
[\sigma_i>\sigma_j]F_\sigma(X)
=
\left(\sum_{a>b}x_ax_b\right)p_1^{n-2}
=e_2p_1^{n-2}.
```

The positions need not be adjacent. The other positions are unrestricted. Thus the identity applies to every attacking edge and to every vertical edge separately.

## 5. Derivatives and Schur extraction

Set $E_n=e_2p_1^{n-2}$. The first derivative in $q$ sums all attacking-edge indicators and subtracts the arm-weighted vertical indicators, giving

```math
\left.\partial_q\widetilde H_\mu\right|_{\mathbf1}
=(|E(G_\mu)|-A)E_n
=B E_n.
```

The derivative in $t_j$ gives

```math
\left.\partial_{t_j}\widetilde H_\mu\right|_{\mathbf1}
=\mu_{j+1}E_n.
```

Both are exact identities of symmetric functions. The argument is coefficientwise in a finite alphabet and then stable in the alphabet size; it does not require an analytic convergence claim.

The coefficient of $s_\lambda$ in $e_2p_1^{n-2}$ is $d_\lambda$. Repeated one-cell Pieri additions start at the vertical shape $(1,1)$ and give exactly standard tableaux whose entries $1,2$ occupy that vertical pair. This verifies the tableau statistic and its shape index.

Finally, for a Schur coefficient $\sum c_{k,\alpha}q^k\mathbf t^\alpha$, the derivatives at $\mathbf1$ are the total exponents $\sum k c_{k,\alpha}$ and $\sum\alpha_jc_{k,\alpha}$. They are precisely the exponents in the conjectured monomial product. The resulting identity is

```math
\prod_{k,\alpha}(q^k\mathbf t^\alpha)^{c_{k,\alpha}}
=
\left(q^{n(\mu')}\prod_{j\ge1}t_j^{\mu_{j+1}}\right)^{d_\lambda}.
```

Integer signed multiplicities cause no problem in this formal Laurent monomial identity. No positivity assertion has been assumed. The size-one case is trivial, and the argument for every size at least two is uniform.

## 6. Audit limits

This review establishes the internal mathematics and the precise connection to the intended source statement. It does not assert that the result is new; that question requires the separate prior-resolution search. No finite experiment is used as evidence for the unbounded theorem, and no Lean work was performed.


## 7. Supplement: all hook Schur coefficients

The later hook-coefficient supplement was checked independently against the source's Theorem 3.2, equation (20), as well as Definition 5.3. It also passes.

To avoid a collision between the graph parameter and the plethystic variable, write the latter as $z$. Theorem 3.2 and Carlsson–Mellit give, for a Dyck graph $H$ with incoming degrees $a_v(H)$,

```math
\mathop{\mathrm{LLT}}_H[z-1;q^{-1}]
=\prod_v(z-q^{-a_v(H)}).
```

The incoming convention is explicit in Theorem 3.2: $a_j$ counts edges $i<j$. Since $\sum_v a_v(H)=|E(H)|$, multiplying by the defining factor $q^{|E(H)|}$ and applying $\omega F[1-z]=(-1)^nF[z-1]$ yields

```math
\omega\widetilde{\mathop{\mathrm{LLT}}}_H[1-z]
=\prod_v(1-zq^{a_v(H)}).
```

Every optional vertical edge enters a different lower cell, so the subset sum in Definition 5.3 factors cell by cell. For one such lower cell with base incoming degree $d$, upper arm $a$, and upper leg parameter $t$, the local sum divided by $q-1$ is

```math
\begin{aligned}
&\frac{(t-q^a)(1-zq^{d+1})+(-t+q^{a+1})(1-zq^d)}{q-1}
\\ &\hspace{2cm}=q^a(1-zq^{d-a}t).
\end{aligned}
```

If the lower cell is in column $c$ and has a cell above it in a row of length $L$, then $d=(c-1)+(L-c)=L-1$ while $a=L-c$. Thus $d-a=c-1$. Without an upper cell its degree is already $c-1$.

After cancellation of the global $q^{-A}$, a column of height $h$ contributes its $t$ labels in the order $h-r$, where $r$ is the row counted from below. Reversing their order within this column preserves the product and the common $q^{c-1}$ factor. Consequently,

```math
\widetilde H_\mu[1-z;q,\mathbf t]
=\prod_{(c,r)\in\mu}
(1-zq^{c-1}t_{r-1}).
```

For degree $n>0$, the only Schur functions surviving at $1-z$ are hooks, and

```math
s_{(n-k,1^k)}[1-z]=(1-z)(-z)^k.
```

The cell $(1,1)$ supplies a factor $1-z$ on the product side. Dividing it out and comparing powers of $-z$ gives the complete hook formula: the coefficient of $s_{(n-k,1^k)}$ equals the $k$-th elementary symmetric function in the remaining cell monomials. The proof is uniform in the size and shape, and uses the modified convention throughout. It is a supplement to the same conjecture package, not an additional named-resolution count.
