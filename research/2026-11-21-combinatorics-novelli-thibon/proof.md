# Novelli–Thibon's conjecture

Date: 21 November 2026. Research issue: [#180](https://github.com/1337isnot1337/solved-conjectures/issues/180).

Status: complete proposed proof of the intended monomial-product assertion in Conjecture 5.7; independent review and the priority audit are pending. This note does not prove the separate Schur-positivity conjecture, Conjecture 5.4.

## 1. Source and indexing

The primary source is J.-C. Novelli and J.-Y. Thibon, *Noncommutative chromatic quasi-symmetric functions, Macdonald polynomials, and the Yang–Baxter equation*, [arXiv:2502.09072v2](https://arxiv.org/html/2502.09072v2), 4 November 2025; published in *Journal of Combinatorial Theory, Series A* 220 (2026), 106130, [DOI 10.1016/j.jcta.2025.106130](https://doi.org/10.1016/j.jcta.2025.106130).

For partitions $`\lambda,\mu\vdash n`$, write the Schur coefficient of the multi-$`t`$ modified Macdonald function as

```math
\widetilde H_\mu(X;q,\mathbf t)
=\sum_{\lambda\vdash n}\widetilde K_{\lambda\mu}(q,\mathbf t)s_\lambda(X),
\qquad
\widetilde K_{\lambda\mu}
=\sum_{k,\alpha}c_{k,\alpha}q^k\mathbf t^\alpha.
\tag{1}
```

Let $`d_\lambda`$ count standard tableaux of shape $`\lambda`$ in French notation in which 2 is above 1. Put $`t_0=1`$. The intended conjecture is

```math
\boxed{
\prod_{k,\alpha}(q^k\mathbf t^\alpha)^{c_{k,\alpha}}
=\left(q^{n(\mu')}\prod_{j\ge1}t_j^{\mu_{j+1}}\right)^{d_\lambda}.
}
\tag{2}
```

Here $`n(\mu')=\sum_r\binom{\mu_r}{2}`$. Equivalently the monomial inside parentheses is the product of $`q^{c-1}t_{r-1}`$ over cells in column $`c`$, row $`r`$, counting rows from the bottom.

There is an indexing error in the source's equation (88): its exponent and the following tableau shape are printed as $`d_\mu`$ and $`\mu`$. They must be $`d_\lambda`$ and $`\lambda`$, where $`\lambda`$ indexes the Schur coefficient. This is forced by the source's own example immediately afterward: the coefficient of $`s_{321}`$ in $`\widetilde H_{222}`$ has monomial product $`(q^3t_1^2t_2^2)^8`$, with $`d_{321}=8`$, whereas $`d_{222}=3`$. It is also forced by the coefficient of $`s_n`$, which is 1. We prove the full intended identity (2); we do not use the typographical error as a conjecture disproof.

The signed multiplicities $`c_{k,\alpha}`$ can be treated as integers in a formal Laurent monomial product. No assertion that they are all nonnegative is used. Thus the proof is independent of Conjecture 5.4.

## 2. A single comparison identity

For $`\sigma\in S_n`$, let

```math
F_\sigma(X):=F_{\mathop{\mathrm{Des}}(\sigma^{-1})}(X)
```

be Gessel's fundamental quasisymmetric function. In particular,

```math
F_\sigma(X)
=\sum_{\mathop{\mathrm{std}}(w)=\sigma}x_{w_1}\cdots x_{w_n},
\tag{3}
```

where words have positive integer entries, and equal entries are standardized from left to right. Formula (3) follows directly by placing the entries in the order of increasing $`\sigma`$-label: they are weakly increasing, with a strict increase whenever the next label occurs earlier in the word.

For every pair of positions $`i\lt j`$,

```math
\sum_{\sigma\in S_n}[\sigma_i>\sigma_j]F_\sigma(X)
=e_2(X)p_1(X)^{n-2}.
\tag{4}
```

Indeed, left-to-right standardization gives
$`[\sigma_i>\sigma_j]=[w_i>w_j]`$ for $`i\lt j`$. The other $`n-2`$ letters are unrestricted. Therefore the left side equals

```math
\left(\sum_{a>b}x_ax_b\right)
\left(\sum_a x_a\right)^{n-2}
=e_2p_1^{n-2}.
```

Also $`\sum_\sigma F_\sigma=p_1^n`$. These statements can be read in any finite alphabet; hence they hold as symmetric-function identities.

## 3. The exact filling formula for the source's modified function

We derive the needed formula from the source's Definition 5.3, equation (57), rather than assume that its untilded and modified conventions agree.

The graph conventions are those of Haglund and Wilson, *Macdonald polynomials and chromatic quasisymmetric functions*, EJC 27(3) (2020), P3.37, [Definitions 1–3 and 14, pages 3–4 and 7](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v27i3p37/pdf/), DOI 10.37236/9011. Draw $`\mu`$ in French notation, with row lengths $`\mu_1\ge\mu_2\ge\cdots`$. Number its cells by reading rows from top to bottom, and within each row from left to right. Let $`G`$ be the attacking graph. Its edges join:

- two cells in the same row;
- an upper cell to a cell in the immediately lower row strictly to its left.

All edges are written $`i\lt j`$ in reading order. Let $`U`$ be the cells outside the bottom row. For $`u\in U`$, let $`v(u)`$ be the cell immediately below it; $`u`$ precedes $`v(u)`$ in reading order. Define

```math
a(u)=\mathop{\mathrm{arm}}(u),\qquad
\ell(u)=1+\mathop{\mathrm{leg}}(u),\qquad
\delta_u(\sigma)=[\sigma_u>\sigma_{v(u)}],
```

and

```math
I_G(\sigma)=\sum_{\{i,j\}\in E(G),\ i\lt j}[\sigma_i>\sigma_j].
```

The required expansion is

```math
\widetilde H_\mu(X;q,\mathbf t)
=\sum_{\sigma\in S_n}
q^{I_G(\sigma)-\sum_{u\in U}a(u)\delta_u(\sigma)}
\prod_{u\in U}t_{\ell(u)}^{\delta_u(\sigma)}F_\sigma(X).
\tag{5}
```

Here is an explicit derivation. In the source, $`G^+`$ adds the vertical edges $`\{u,v(u)\}`$ to $`G`$, and Lemma 4.2, equation (35), expands

```math
\omega\widetilde{\mathbf{LLT}}_H
=\sum_\sigma q^{\mathop{\mathrm{des}}_H(\sigma)}\Phi_{\min(\sigma)}.
```

The commutative image of $`\Phi_{\min(\sigma)}`$ is $`F_\sigma`$. For one optional vertical edge, the sum of the included and excluded contributions in Definition 5.3 is

```math
(t_{\ell(u)}-q^{a(u)})q^{\delta_u}
+(-t_{\ell(u)}+q^{a(u)+1}).
```

After division by $`q-1`$, this is exactly

```math
\begin{cases}
q^{a(u)},&\delta_u=0,\\
t_{\ell(u)},&\delta_u=1.
\end{cases}
\tag{6}
```

The global prefactor in (57) is $`q^{-A}(q-1)^{-|U|}`$, where

```math
A=n(\mu')-\binom{\mu_1}{2}
=\sum_{u\in U}a(u).
\tag{7}
```

Thus multiplying (6) over $`u`$ and canceling $`q^A`$ gives (5). This establishes the modified convention directly and removes the apparent ambiguity between equations (31), (32), and (50) in the source.

## 4. First derivatives at the unit parameter point

Write $`\mathbf1`$ for $`q=t_1=t_2=\cdots=1`$, and let

```math
E_n(X)=e_2(X)p_1(X)^{n-2}\quad(n\ge2),
\qquad
B=\sum_r\binom{\mu_r}{2}=n(\mu').
```

The attacking graph has $`B`$ same-row edges. For every row $`r\ge2`$, a cell in column $`c`$ attacks $`c-1`$ cells in the next row below, so the cross-row count is

```math
\sum_{r\ge2}\binom{\mu_r}{2}=A.
\tag{8}
```

Hence $`|E(G)|=B+A`$. Differentiate (5), then apply (4) separately to every graph edge and every vertical edge. This gives

```math
\left.\frac{\partial\widetilde H_\mu}{\partial q}\right|_{\mathbf1}
=\left(|E(G)|-\sum_{u\in U}a(u)\right)E_n
=B E_n.
\tag{9}
```

For the $`t_j`$-derivative, each column of height $`h`$ contributes exactly once when $`h\ge j+1`$, because the leg labels of its nonbottom cells are $`1,2,\ldots,h-1`$. There are $`\mu_{j+1}`$ columns of height at least $`j+1`$. Consequently,

```math
\left.\frac{\partial\widetilde H_\mu}{\partial t_j}\right|_{\mathbf1}
=\mu_{j+1}E_n.
\tag{10}
```

Equations (9)–(10), together with $`\widetilde H_\mu(X;\mathbf1)=p_1^n`$, give the stronger first-order identity

```math
\widetilde H_\mu(X;q,\mathbf t)
\equiv p_1^n+
\left(B(q-1)+\sum_{j\ge1}\mu_{j+1}(t_j-1)\right)e_2p_1^{n-2}
\pmod{\mathfrak m^2},
\tag{11}
```

where $`\mathfrak m=(q-1,t_1-1,t_2-1,\ldots)`$. Only finitely many parameters occur for fixed $`\mu`$.

## 5. Extracting Schur coefficients

Repeated multiplication by $`p_1=s_1`$ adds one cell at each step by the one-cell Pieri rule. Since $`e_2=s_{11}`$,

```math
[s_\lambda]e_2p_1^{n-2}=d_\lambda.
\tag{12}
```

Explicitly, a chain from the vertical two-cell shape to $`\lambda`$ records the positions of entries $`3,4,\ldots,n`$ of a standard tableau whose entries 1 and 2 initially occupy the bottom-left cell and the cell above it. This is a bijection with the tableaux defining $`d_\lambda`$.

Taking $`s_\lambda`$-coefficients in (9) and (10) gives

```math
\sum_{k,\alpha}k c_{k,\alpha}=B d_\lambda,
\qquad
\sum_{k,\alpha}\alpha_j c_{k,\alpha}=\mu_{j+1}d_\lambda.
\tag{13}
```

The exponent of $`q`$ in the left side of (2) is the first sum in (13), and the exponent of $`t_j`$ is the second. Thus every exponent agrees and (2) follows. For $`n=1`$, both sides are 1, so the boundary case also holds.

This proves the intended Conjecture 5.7 for every pair of partitions and all independent parameters. No restriction on the number of rows, columns, or partition size is present.

## 6. Scope and audit record

The assertion is about first moments of exponent vectors, not Schur positivity or a formula for individual Schur coefficients. The proof permits signed coefficients and therefore does not settle Conjecture 5.4. It also makes no general claim about every Yang–Baxter trace mentioned before Conjecture 5.7; the displayed conjecture's defined family is $`\widetilde H_\mu`$.

The argument uses the source's existing Definition 5.3 and Lemma 4.2 with full attribution. The new deduction is the universal first-order identity (11) and its consequence (2). A separate source-audit document records the prior searches. Exact finite checks are included only to detect convention mistakes; the proof is (3)–(13).
