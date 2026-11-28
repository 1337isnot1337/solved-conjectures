# Novelli–Thibon's conjecture

Date: 21 November 2026. Research issue: [#180](https://github.com/1337isnot1337/solved-conjectures/issues/180).

Status: complete proposed proof of the intended monomial-product assertion in Conjecture 5.7, with two internal mathematical reviews and a documented public-source priority audit. Section 6 also proves the hook-coefficient formula stated immediately after that conjecture. These notes remain unrefereed. This note does not prove the separate Schur-positivity conjecture, Conjecture 5.4.

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
q^{a(u)},&\delta_u=0,
\\ t_{\ell(u)},&\delta_u=1.
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

## 6. The source's hook-coefficient formula

The final sentence following Conjecture 5.7 proposes a second identity. Let

```math
V_\mu=\{q^{c-1}t_{r-1}:(r,c)\in\mu\},\qquad t_0=1.
```

The symbol $`V_\mu-1`$ removes one copy of the weight 1 belonging to the bottom-left cell. For every $`0\le k\le n-1`$, the proposed formula is

```math
\widetilde K_{(n-k,1^k),\mu}(q,\mathbf t)
=e_k[V_\mu-1].
\tag{14}
```

We prove the stronger plethystic evaluation

```math
\widetilde H_\mu[1-z;q,\mathbf t]
=\prod_{(r,c)\in\mu}(1-zq^{c-1}t_{r-1}).
\tag{15}
```

Here $`1-z`$ is a difference of alphabets: $`p_j[1-z]=1-z^j`$. Theorem 3.2, equation (20), of Novelli–Thibon gives the Carlsson–Mellit evaluation, with incoming degree $`b_v(H)=|\{i\lt v:\{i,v\}\in E(H)\}|`$. After the inversion of $`q`$ in the source's modified LLT function, its commutative image satisfies

```math
\omega\widetilde{\mathbf{LLT}}_H[1-z;q]
=(-1)^nq^{|E(H)|}\mathbf{LLT}_H[z-1;q^{-1}]
=\prod_v(1-zq^{b_v(H)}).
\tag{16}
```

The first equality uses $`\omega F[1-z]=(-1)^nF[z-1]`$ for a homogeneous symmetric function of degree $`n`$. The second uses the cited evaluation $`\mathbf{LLT}_H[z-1;q^{-1}]=\prod_v(z-q^{-b_v(H)})`$ and $`\sum_v b_v(H)=|E(H)|`$. Thus the incoming, rather than outgoing, degree convention is explicit.

Apply (16) to each optional-edge term of Definition 5.3. A vertical edge from $`u`$ to the cell $`v`$ immediately below it changes only the incoming degree of $`v`$. Write $`a=a(u)`$, $`b=b_v(G)`$, and $`t=t_{\ell(u)}`$. Its local sum is

```math
\frac{(t-q^a)(1-zq^{b+1})+(-t+q^{a+1})(1-zq^b)}{q-1}
=q^a(1-zq^{b-a}t).
\tag{17}
```

Each cell is the lower endpoint of at most one optional edge, so these local sums multiply independently. The factors $`q^a`$ cancel the global $`q^{-A}`$.

Suppose $`v`$ is in column $`c`$ and the row immediately above has length $`L`$. The incoming attacking edges consist of the $`c-1`$ earlier cells in its own row and the $`L-c`$ upper cells strictly to its right. Therefore $`b=L-1`$, while the arm of $`u`$ is $`a=L-c`$; hence $`b-a=c-1`$. If $`v`$ has no cell above it, its incoming degree is simply $`c-1`$.

In a column of height $`h`$, the lower cell in row $`r<h`$ receives the label $`\ell(u)=h-r`$; the top cell receives no optional factor, which is represented by $`t_0=1`$. The labels over the column are therefore $`h-1,h-2,\ldots,0`$. Reversing them in the product gives exactly $`0,1,\ldots,h-1`$, while $`q^{c-1}`$ is constant in that column. This proves (15).

Finally, the Schur specialization $`s_\lambda[1-z]`$ vanishes unless $`\lambda`$ is a hook, and

```math
s_{(n-k,1^k)}[1-z]=(1-z)(-z)^k.
```

The bottom-left cell supplies the factor $`1-z`$ on the right side of (15). Dividing by it and comparing powers of $`-z`$ proves (14) for every partition, including $`n=1`$. This supplement is part of the same named package and is not counted separately.

## 7. Scope and audit record

Conjecture 5.7 is about first moments of exponent vectors. Its proof permits signed coefficients and therefore does not settle Conjecture 5.4. The supplement gives individual Schur coefficients only for hook shapes. No general claim is made about every Yang–Baxter trace mentioned before Conjecture 5.7; the displayed conjecture's defined family is $`\widetilde H_\mu`$.

The argument uses the source's existing Definition 5.3, Lemma 4.2 and Theorem 3.2 with full attribution. The deductions are the universal first-order identity (11), its consequence (2), and the plethystic evaluation (15) giving (14). A separate source-audit document records the prior searches. Exact finite checks are included only to detect convention mistakes; the proof is the all-size argument (3)–(17).
