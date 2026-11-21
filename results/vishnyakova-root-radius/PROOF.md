# Vishnyakova's conjecture

21 November 2026. Ordinary proof, independently reviewed internally. The source and bounded priority audit are in SOURCE_AUDIT.md. No external peer review or exhaustive priority guarantee is claimed. No numerical root computation is used in the proof.

## Statement and source

Anna Vishnyakova's *Polynomials interpolated totally positive sequences*, [arXiv:2607.06207v1](https://borowiecki.dev/pdf/2607.06207), Open Problem 6.2, printed page 24, conjectures the following. Among real polynomials of degree $`n`$ whose values at nonnegative integers form a totally positive sequence, the largest possible modulus of a complex zero is $`n`$.

Her later paper *Polynomially Deformed Normalized Pochhammer Sequences Having Generating Functions With Only Real Non-positive Zeros*, [arXiv:2608.03723v1](https://www.researchgate.net/publication/411305396_Polynomially_Deformed_Normalized_Pochhammer_Sequences_Having_Generating_Functions_With_Only_Real_Non-positive_Zeros), Open Problem 7.2, printed page 27, states the full weighted form below. Both assertions are treated as one conjecture family.

Fix $`\beta>0`$. Write $`(\beta)_k=\beta(\beta+1)\cdots(\beta+k-1)`$ and $`z^{\underline{k}}=z(z-1)\cdots(z-k+1)`$, with empty products equal to one. Define the linear map

```math
L_\beta\!\left(\sum_{k=0}^n q_k
 \frac{z^{\underline{k}}}{(\beta)_k}\right)(w)
 =\sum_{k=0}^nq_kw^k.
```

Let $`U_{n,\beta}`$ consist of the degree-$`n`$ real polynomials $`P`$ such that all zeros of $`L_\beta(P)`$ lie in $`[-1,0]`$. Multiplying $`P`$ by a nonzero constant does not affect any zero under discussion. The weighted conjecture says

```math
\sup_{P\in U_{n,\beta}}
 \max\{|z|:P(z)=0\}=n-1+\beta.
```

For $`\beta=1`$, the equivalence with totally positive sampled sequences is proved in Section 1 of the first paper. The weighted class is defined by the transformed polynomial, without claiming that every noninteger-weight generating function is itself a totally positive generating function.

We prove the stronger disk theorem.

An earlier [7 October 2026 public report](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-continuation-2026-10-07/interpolation/REPORT.md) already proved this disk bound for $`\beta=1`$ through degree five, and for equal parameters in every degree. Its all-degree equal-parameter argument includes the generating function, three-term recurrence, and tridiagonal representation used below in weighted form. The report explicitly leaves independent parameters in every degree open. The new step here is the exclusion for complex upper-half-plane parameters and the consequent polarization argument, which handles all independent real parameters at all degrees.

**Theorem.** If $`\beta>0`$, $`n\ge 1`$, and $`P\in U_{n,\beta}`$, then every zero of $`P`$ lies in

```math
\left|z+\frac\beta2\right|\le n-1+\frac\beta2.
\tag{1}
```

Consequently the weighted conjecture holds, including its sharp constant. In particular, Vishnyakova's original radius is exactly $`n`$ for every degree $`n`$.

## 1. A symmetric multiaffine family

Normalize $`L_\beta(P)`$ to be monic and factor it as

```math
Q(w)=\prod_{i=1}^n(w+a_i),\qquad 0\le a_i\le1.
```

Then $`P`$ is a positive or negative constant times

```math
F_{n,\beta}(z;\mathbf a)
 =\sum_{k=0}^n e_{n-k}(a_1,\ldots,a_n)
             \frac{z^{\underline{k}}}{(\beta)_k}.
\tag{2}
```

For each fixed $`z`$, this is symmetric and multiaffine in the $`a_i`$. Its leading coefficient as a polynomial in $`z`$ is always $`1/(\beta)_n`$, independently of every parameter. We first allow the parameters to be complex, and later real without any interval restriction.

On the diagonal define the monic polynomial

```math
p_n(z;t)=(\beta)_nF_{n,\beta}(z;t,\ldots,t)
 =(\beta)_n\sum_{k=0}^n\binom nk t^{n-k}
                    \frac{z^{\underline{k}}}{(\beta)_k}.
\tag{3}
```

These polynomials obey

```math
p_0=1,\qquad p_1=z+\beta t,
```

```math
p_{n+1}(z;t)
 =[z-n+(2n+\beta)t]p_n(z;t)
   +t(1-t)n(n+\beta-1)p_{n-1}(z;t).
\tag{4}
```

For completeness, their exponential generating series is the formal identity

```math
\sum_{n\ge0}\frac{p_n(z;t)}{n!}u^n
 =\frac{(1+(1-t)u)^z}{(1-tu)^{z+\beta}}.
\tag{5}
```

It follows by inserting (3), putting $`n=k+j`$, summing $`(\beta+k)_j(tu)^j/j!`$, and using the generalized binomial expansion in $`k`$. If the right side is $`G`$, then

```math
[1+(1-2t)u-t(1-t)u^2]G'
 =[z+\beta t+\beta t(1-t)u]G.
```

Comparison of coefficients gives (4). Thus no orthogonality assumption or restriction that $`t`$ be real is required.

## 2. A reciprocal-segment lemma

**Lemma.** Suppose $`\mathop{\mathrm{Im}} u<0`$, choose either square root of $`1-u^2`$, and let $`-1\le \kappa\le 1`$. If

```math
w=u+i\kappa\sqrt{1-u^2}
```

has positive imaginary part, then $`|w|<1`$.

**Proof.** The endpoints

```math
r=u+i\sqrt{1-u^2},\qquad s=u-i\sqrt{1-u^2}
```

satisfy $`rs=1`$. Neither endpoint is real: otherwise both would be real and so would $`u`$. Their imaginary parts have opposite signs. Relabel them so that $`\mathop{\mathrm{Im}} r>0`$, hence $`s=1/r`$. Since

```math
2\mathop{\mathrm{Im}}u
 =\mathop{\mathrm{Im}}r\left(1-\frac1{|r|^2}\right)<0,
```

we have $`|r|<1`$. The line segment joining $`r`$ to $`1/r`$ meets the real axis at

```math
x_0=\frac{2\mathop{\mathrm{Re}}r}{1+|r|^2}.
```

Here $`|x_0|<1`$, because $`r`$ is nonreal. The part of this segment above the real axis joins the two points $`r`$ and $`x_0`$ in the open unit disk, and therefore lies in that disk by convexity. Every allowed $`w`$ lies on the segment. This proves the claim. The choice of square root only exchanges the endpoints. QED.

## 3. A diagonal zero-exclusion theorem

Let $`H=\{t:\mathop{\mathrm{Im}}t>0\}`$ and put

```math
\Omega_{n,\beta}
 =\left\{z:\mathop{\mathrm{Im}}z>0,
     \left|z+\frac\beta2\right|>n-1+\frac\beta2\right\}.
\tag{6}
```

We show

```math
p_n(z;t)\ne0\qquad(z\in\Omega_{n,\beta},\ t\in H).
\tag{7}
```

Let $`D=\mathop{\mathrm{diag}}(0,1,\ldots,n-1)`$ and let the real symmetric matrix $`K`$ have zero diagonal and off-diagonal entries

```math
K_{j-1,j}=K_{j,j-1}=\sqrt{j(j+\beta-1)},
\qquad 1\le j\le n-1.
```

Choose either square root $`s`$ of $`t(1-t)`$ and define

```math
J_n(t)=D-t(2D+\beta I)+isK.
\tag{8}
```

The determinant recurrence for this tridiagonal matrix and (4) give

```math
\det(zI-J_n(t))=p_n(z;t).
\tag{9}
```

Suppose, toward a contradiction, that $`z\in \Omega_{n,\beta}`$ is an eigenvalue for some $`t\in H`$. Choose an eigenvector $`v`$ with $`v^* v=1`$, and write

```math
d=v^*Dv\in[0,n-1],\qquad k=v^*Kv\in\mathbb R.
```

The second quantity is real because $`K`$ is Hermitian, even though both the eigenvector and $`J_n(t)`$ may be complex. Cauchy's elementary inequality gives

```math
\begin{aligned}
|k|
&\le2\sum_{j=1}^{n-1}\sqrt{j(j+\beta-1)}
                   |v_j|\,|v_{j-1}|\\
&\le\sum_{j=1}^{n-1}
  \bigl(j|v_j|^2+(j+\beta-1)|v_{j-1}|^2\bigr)\\
&=2d+\beta-(n+\beta-1)|v_{n-1}|^2
 \le2d+\beta.
\end{aligned}
\tag{10}
```

For $`n=1`$ the empty sum is zero and the same identity holds. Put

```math
c=d+\frac\beta2>0,\quad
\kappa=\frac{k}{2d+\beta}\in[-1,1],\quad u=1-2t.
```

Taking $`v^* J_n(t) v=z`$, and choosing $`\sqrt{1-u^2}=2s`$, gives

```math
z+\frac\beta2
 =c\left(u+i\kappa\sqrt{1-u^2}\right).
\tag{11}
```

Here $`\mathop{\mathrm{Im}} u<0`$. Since $`\mathop{\mathrm{Im}} z>0`$, the reciprocal-segment lemma applies to the bracket in (11), so

```math
\left|z+\frac\beta2\right|<c
 \le n-1+\frac\beta2.
```

This contradicts (6) and establishes (7).

## 4. Polarization and real specialization

Fix $`z\in \Omega_{n,\beta}`$. By (7), the diagonal polynomial
$`t\longmapsto F_{n,\beta}(z;t,\ldots,t)`$ has no zero in the open upper half-plane. The Grace–Walsh–Szegő coincidence theorem for the convex circular domain $`H`$ therefore implies

```math
F_{n,\beta}(z;a_1,\ldots,a_n)\ne0
 \quad\text{whenever every }a_i\in H.
\tag{12}
```

The hypotheses are exactly symmetry and multiaffinity in the parameters, established in Section 1. The upper half-plane is convex, so no additional degree condition is needed. A primary reference is Borcea–Brändén, [*The Lee–Yang and Pólya–Schur Programs. II*](https://arxiv.org/pdf/0809.3087), Theorem 1.1 on printed page 4; their Theorem 2.1 gives a more general form.

Now fix arbitrary **real** parameters $`a_1,\ldots,a_n`$. For every $`\epsilon>0`$, the polynomial

```math
z\longmapsto F_{n,\beta}(z;a_1+i\epsilon,\ldots,a_n+i\epsilon)
```

has no zero on $`\Omega_{n,\beta}`$, by (12). These polynomials converge locally uniformly there to $`F_{n,\beta}(z;\mathbf a)`$. The domain in (6) is connected. Hurwitz's theorem shows that the limit is either zero-free there or identically zero. Its fixed, nonzero leading coefficient $`1/(\beta)_n`$ excludes the latter possibility. Thus it has no zero on $`\Omega_{n,\beta}`$. Its coefficients are real, so conjugation gives the same conclusion in the lower half-plane.

We have proved a statement stronger than the nonreal part needed below: for **every real parameter vector** $`a`$, every nonreal zero of (2) belongs to the disk in (1).

## 5. Real zeros and sharpness

Restore $`0\le a_i\le 1`$. For real $`z>n-1`$, every falling factorial in (2) is positive, the coefficients are nonnegative, and the coefficient of the term of degree $`n`$ is one. Hence $`F_{n,\beta}(z;\mathbf a)>0`$.

We use the reflection identity

```math
F_{n,\beta}(-z-\beta;\mathbf a)
 =(-1)^nF_{n,\beta}(z;\mathbf1-\mathbf a).
\tag{13}
```

Here is a direct derivation. For any polynomial $`Q(w)=\sum_jq_jw^j`$, the finite Chu–Vandermonde identity is

```math
\sum_{k=0}^j\binom jk
       \frac{z^{\underline{k}}}{(\beta)_k}
 =\frac{(z+\beta)_j}{(\beta)_j}.
```

Expanding $`Q(-w-1)`$ contributes an overall factor $`(-1)^j`$ for its term of degree $`j`$. Applying $`L_\beta^{-1}`$ therefore gives

```math
L_\beta^{-1}[Q(-w-1)](z)
 =(L_\beta^{-1}Q)(-z-\beta).
```

For $`Q(w)=\prod_i(w+a_i)`$, its reflected polynomial is
$`(-1)^n\prod_i(w+1-a_i)`$, yielding (13). It is also formula (12) in Vishnyakova's later paper.

Since every $`1-a_i`$ is still in $`[0,1]`$, (13) excludes real zeros below $`-\beta-n+1`$. Thus all real zeros lie in $`[-\beta-n+1,n-1]`$, which is the real diameter of (1). Section 4 already bounds every nonreal zero, proving the disk theorem.

Finally choose all $`a_i=1`$. The same finite Vandermonde identity gives

```math
F_{n,\beta}(z;1,\ldots,1)
 =\frac{(z+\beta)_n}{(\beta)_n}.
```

It has the zero $`z=-(\beta+n-1)`$ and belongs to $`U_{n,\beta}`$ because its transform is $`(w+1)^n`$. On the other hand, (1) implies $`|z|\le n-1+\beta`$ for every root of every polynomial in that class. The supremum is therefore attained and equals $`n-1+\beta`$. QED.

## Scope

This proves the entire radius conjecture, at all degrees and all positive weights. The original sampled-total-positivity statement is its $`\beta=1`$ instance. They are one resolution, not separate counts. The source's different conjectures about a uniformly nearby zero, gaps between real zeros, and intervals of shifts for even powers are not claimed here.
