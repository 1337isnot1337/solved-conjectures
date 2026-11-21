# Poisson composition and the Gram bound

Date: 20 November 2026 (America/Chicago). This supplements the Poisson representation in
[the substochastic transfer note](gyires_substochastic_transfer.md). It is an exact reduction, not a proof
of the product inequality or of Gyires's conjecture. The [independent review](gyires_poisson_review.md) checks orientation, normalization and boundary cores.

Let $`B`$ be an $`m\times m`$ doubly substochastic matrix, with
$`r=B\mathbf1`$, $`c=B^T\mathbf1`$, $`u=\mathbf1-r`$, and
$`v=\mathbf1-c`$. Write $`F(B)=e^{\sum b_{ij}}Z(B)`$ for the matching
function in the transfer note and
$`\pi(x)=e^{-m}/x!`$, $`x\in\mathbb N^m`$.

## Row-transition convention

Define $`K_B(x,y)`$ by independently moving each particle at input coordinate
$`i`$ to output coordinate $`j`$ with probability $`b_{ij}`$, deleting it
with probability $`u_i`$, and adding independent Poisson immigrants of
means $`v_j`$. Then


```math
K_BK_C=K_{BC},\qquad
\pi(x)K_B(x,y)=\pi(y)K_{B^T}(y,x).                 \tag{1}
```


For the composition identity, surviving particles have transition matrix
$`BC`$, while the immigration mean is
$`v_B^TC+v_C^T=\mathbf1^T-\mathbf1^TBC`$. The adjoint identity follows by
generating the stationary joint input/output counts from independent
Poisson edge counts of means $`b_{ij}`$ and independent unmatched counts
of means $`u_i,v_j`$, and then swapping the input and output sides.

Start from $`\mathbf1`$, and let $`\mu_B(y)=K_B(\mathbf1,y)`$. Its probability
generating function is


```math
\sum_y\mu_B(y)z^y
=\exp\!\left(\sum_jv_j(z_j-1)\right)
 \prod_i\left(u_i+\sum_jb_{ij}z_j\right).          \tag{2}
```


Each output mean is one. Put $`f_B=\mu_B/\pi`$. The matching expansion gives


```math
f_B(\mathbf1)=F(B),\qquad F(B^T)=F(B).            \tag{3}
```


The column-transition generating function obtained by swapping $`u`$ and
$`v`$ and transposing the linear factors instead describes $`f_{B^T}`$.
Its squared norm below is therefore $`F(B^TB)`$, not $`F(BB^T)`$.

## Exact factorization

Using (1) and $`\pi(\mathbf1)=e^{-m}`$,


```math
\begin{aligned}
F(BC)
&=\frac{K_{BC}(\mathbf1,\mathbf1)}{\pi(\mathbf1)}\\
&=\sum_y\frac{K_B(\mathbf1,y)K_C(y,\mathbf1)}{\pi(\mathbf1)}\\
&=\sum_y\pi(y)f_B(y)f_{C^T}(y)
=\langle f_B,f_{C^T}\rangle_{L^2(\pi)}.
\end{aligned}                                                   \tag{4}
```


In particular,


```math
\|f_B\|_{L^2(\pi)}^2=F(BB^T),\qquad
F(BC)^2\le F(BB^T)F(C^TC).                       \tag{5}
```


These norms are finite: the Markov operator is an $`L^2(\pi)`$ contraction
and the normalized point mass at $`\mathbf1`$ has squared norm $`e^m`$.

Consequently the following assertions are equivalent, with both quantified
over every doubly substochastic core of every order:


```math
\begin{array}{ll}
\mathrm{(a)}&F(BC)\le F(B)F(C)\quad\text{for all }B,C;\\[2pt]
\mathrm{(b)}&F(BB^T)\le F(B)^2\quad\text{for all }B;\\[2pt]
\mathrm{(c)}&\|f_B\|_{L^2(\pi)}\le f_B(\mathbf1)\quad\text{for all }B.
\end{array}                                                       \tag{6}
```


Indeed, (a) implies (b) by $`C=B^T`$; (b) implies (a) by (5), applied also
to $`C^T`$; and (b) and (c) are identical by (3) and (5).

## Remaining obstruction and scope

No proof of (6), and no core violating it, was obtained. Stationarity and
the Markov contraction give only $`\|f_B\|_2\le e^{m/2}`$; the known
completion lower bound gives $`f_B(\mathbf1)=F(B)\ge1`$. Those estimates
do not compare the two sides of (c). A bound specific to the balanced
Poisson-binomial laws (2) is still required.

For a doubly stochastic core, (b) becomes


```math
\mathop{\mathrm{per}}(BB^T)\le e^m(\mathop{\mathrm{per}}B)^2.
```


Its constant $`e^{-m}`$ is smaller than $`m!/m^m`$, so even a proof of
(6) would not by this substitution prove finite-order Gyires. This note
adds no conjecture resolution, finite-order extension, or novelty claim.
