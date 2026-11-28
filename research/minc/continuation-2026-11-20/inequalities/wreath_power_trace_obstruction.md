# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago.

Status: an exact analysis of a proposed permanent-on-top counterexample
transfer. A legal wreath product does produce power traces of a Fourier
block. Its normalization and permanent denominator prevent the
identical-copy construction from transferring a core that already satisfies
the corresponding normalized character inequality. This is an obstruction
to that construction, not a resolution of MINC Conjecture 42 or Problem 2.
No novelty claim is made for the polynomial norm inequalities used below.

## 1. A legal subgroup that produces power traces

Let $`G\leq S_n`$, let $`\rho:G\to U(d)`$ be a unitary
representation, and let $`A\succeq0`$. Define

```math
a_g(A)=\prod_{j=1}^n a_{j,g(j)},\qquad
F=\sum_{g\in G}a_g(A)\rho(g),\qquad
P=\mathop{\mathrm{per}}A.
```

The matrix $`F`$ is PSD. This follows from the positive-definite function
$`g\mapsto a_g(A)`$, obtained by restricting tensor-permutation matrix
coefficients of a Gram tensor. The use of $`\rho(g)`$ rather than
$`\rho(g^{-1})`$ selects the dual Fourier convention and does not
affect positivity.

Let $`K\leq S_m`$, and form the actual permutation subgroup

```math
H=G\wr K=G^m\rtimes K\leq S_{nm}.
```

Use the standard action
$`(\mathbf g,\pi):(i,j)\mapsto(\pi(i),g_{\pi(i)}(j))`$.
On $`V_\rho^{\otimes m}`$, let $`P_\pi`$ permute tensor factors
and define

```math
R(\mathbf g,\pi)
 =\bigl(\rho(g_1)\otimes\cdots\otimes\rho(g_m)\bigr)P_\pi.
```

This is the tensor-permutation representation of the wreath product. If
$`\psi`$ is a character of $`K`$ of degree $`q`$, then

```math
\chi(\mathbf g,\pi)=\mathop{\mathrm{tr}}R(\mathbf g,\pi)\psi(\pi)
```

is a character of $`H`$ of degree $`d^m q`$. Irreducibility is not
needed. Let $`C\succeq0`$ have order $`m`$, and put
$`B=C\otimes A`$. The matrix $`B`$ is PSD. Its permutation
monomial on $`(\mathbf g,\pi)`$ is

```math
a_{(\mathbf g,\pi)}(B)
 =\left(\prod_i c_{i,\pi(i)}^n\right)
   \prod_i a_{g_i}(A).
```

Sum first over the base group $`G^m`$. The result is

```math
\sum_{\mathbf g\in G^m}\prod_i a_{g_i}(A)
                   \mathop{\mathrm{tr}}R(\mathbf g,\pi)
 =\mathop{\mathrm{tr}}(F^{\otimes m}P_\pi)
 =\prod_{c\in\mathop{\mathrm{Cycles}}(\pi)}\mathop{\mathrm{tr}}(F^{|c|}).
```

Consequently, with generalized matrix functions divided by character
degree throughout,

```math
\boxed{
f_{H,\chi}(C\otimes A)
 =\frac1{d^m}
   \sum_{\pi\in K}\frac{\psi(\pi)}q
       a_\pi(C^{\circ n})
       \prod_{c\in\mathop{\mathrm{Cycles}}(\pi)}
                         \mathop{\mathrm{tr}}(F^{|c|}).}
\tag{1}
```

This is a subgroup construction, unlike imposing the condition
$`g_1\cdots g_m=e`$ on tuples in a nonabelian direct product, which in
general does not define a subgroup.

For $`C=J_m`$, the all-ones matrix, and $`K=C_m`$, let $`m`$ be
prime and let $`\psi`$ be trivial. Then (1) reads

```math
f_{H,\chi}(J_m\otimes A)
 =\frac{(\mathop{\mathrm{tr}}F)^m+(m-1)\mathop{\mathrm{tr}}(F^m)}{d^m}.
\tag{2}
```

The power trace is present. The factor $`d^m`$ cannot be discarded:
it is the degree of the character on the base tensor representation.

## 2. Degree-one wreath characters factor

Assume that $`K`$ is transitive on the $`m`$ blocks. Every degree-one
character of $`G\wr K`$ has the form

```math
\chi(\mathbf g,\pi)=\prod_i\alpha(g_i)\,\psi(\pi),
\tag{3}
```

where $`\alpha`$ and $`\psi`$ are degree-one characters of $`G`$
and $`K`$, respectively. Indeed, restriction to $`G^m`$ is a product
of linear characters on its factors. Conjugation by the transitive top
group forces these characters to coincide. The remaining quotient character
is a character of $`K`$. Transitivity of $`G`$ is unnecessary.

With $`d=1`$, the matrix $`F`$ in (1) is the scalar
$`f_{G,\alpha}(A)`$. Thus

```math
\boxed{f_{G\wr K,\chi}(C\otimes A)
   =f_{G,\alpha}(A)^m f_{K,\psi}(C^{\circ n}).}
\tag{4}
```

The higher-dimensional permanent-on-top block has disappeared entirely.
For a top group with several orbits, the same conclusion holds separately
on each orbit, with one base character for each orbit. This factorization
does not by itself prove dominance for arbitrary $`C`$; the denominator
is still $`\mathop{\mathrm{per}}(C\otimes A)`$.

## 3. A factorial lower bound for identical Gram copies

For every PSD $`A`$ and positive integer $`m`$,

```math
\boxed{\mathop{\mathrm{per}}(J_m\otimes A)
       \geq m!\,\mathop{\mathrm{per}}(A)^m.}
\tag{5}
```

This is the identical-block specialization of Marcus's block-permanent
conjecture. We give a proof from the classical Bombieri product inequality
to fix its exact coefficient. This does not assert the stronger bound with
$`(m!)^n\mathop{\mathrm{per}}(A)^m`$, which is a different statement.

For a polynomial $`p(z)=\sum_\alpha p_\alpha z^\alpha`$, use the
apolar norm

```math
\|p\|_a^2=\sum_\alpha\alpha!|p_\alpha|^2
          =\mathbb E|p(Z)|^2,
```

where $`Z`$ is a standard circular complex Gaussian vector. Bombieri's
homogeneous product inequality says

```math
\|fg\|_a^2\geq\|f\|_a^2\|g\|_a^2
\tag{6}
```

for homogeneous polynomials $`f,g`$. To make the input reviewable, let
$`L_f`$ denote multiplication by $`f`$ on polynomial Fock space.
Its adjoint on polynomials is $`L_f^*=\overline f(D)`$. Leibniz's rule,
or normal ordering of multiplication and differentiation, gives

```math
L_f^*L_f
 =\sum_\alpha\frac1{\alpha!}
     L_{\partial^\alpha f}L_{\partial^\alpha f}^*.
\tag{7}
```

The sum is finite. Each summand is PSD as a quadratic form on polynomials.
If $`f`$ is homogeneous of degree $`k`$, the terms with
$`|\alpha|=k`$ sum to $`\|f\|_a^2 I`$, because those derivatives
are constants. Equation (6) follows. Homogeneity is necessary for this
particular extraction; the corresponding statement for two arbitrary
nonhomogeneous polynomials can fail.

Now let $`p`$ be homogeneous of degree $`n\geq1`$. Orthogonality of
monomials gives the Euler norm identity

```math
\sum_j\|\partial_j f\|_a^2=(\deg f)\|f\|_a^2
```

for every homogeneous $`f`$. Apply it to $`f=p^m`$, then apply (6)
to $`p^{m-1}`$ and each homogeneous derivative $`\partial_jp`$:

```math
\begin{aligned}
nm\|p^m\|_a^2
 &=m^2\sum_j\|p^{m-1}\partial_jp\|_a^2
 \\ &\geq m^2\|p^{m-1}\|_a^2\sum_j\|\partial_jp\|_a^2
 \\ &=nm^2\|p^{m-1}\|_a^2\|p\|_a^2.
\end{aligned}
```

Induction therefore gives

```math
\|p^m\|_a^2\geq m!\,\|p\|_a^{2m}.
\tag{8}
```

Choose linear forms $`\ell_1,\ldots,\ell_n`$ whose complex Gaussian
covariance matrix is $`A`$, and put $`p=\prod_i\ell_i`$. Wick's
identity yields

```math
\|p\|_a^2=\mathop{\mathrm{per}}A,\qquad
\|p^m\|_a^2=\mathop{\mathrm{per}}(J_m\otimes A).
```

This proves (5). If one of the forms is zero, both sides vanish and the
argument still applies.

## 4. No identical-copy transfer from a dominated character

For the construction in Section 1, suppose only that the core satisfies

```math
\frac{\mathop{\mathrm{tr}}F}{d}\leq\mathop{\mathrm{per}}A.
\tag{9}
```

This is the normalized character inequality for $`(G,\rho)`$, not a
permanent-on-top assumption. Since $`F\succeq0`$, for every positive
integer $`\ell`$,

```math
\mathop{\mathrm{tr}}(F^\ell)\leq(\mathop{\mathrm{tr}}F)^\ell.
```

Also $`|\psi(\pi)|\leq q`$. Thus (1), with $`C=J_m`$, gives

```math
\begin{aligned}
f_{H,\chi}(J_m\otimes A)
 &\leq |K|\left(\frac{\mathop{\mathrm{tr}}F}{d}\right)^m
 \\ &\leq m!\,\mathop{\mathrm{per}}(A)^m
 \\ &\leq\mathop{\mathrm{per}}(J_m\otimes A).
\end{aligned}
\tag{10}
```

This holds for every $`m`$, every $`K\leq S_m`$, and every top
character $`\psi`$. It therefore excludes this entire identical-copy
wreath construction as a way to amplify a permanent-on-top violation whose
base normalized character is already dominated. A large eigenvalue of
$`F`$ does not change (10).

For example, the exact previously checked permanent-on-top cores in this
research have the following data for their offending blocks:

| Core | Partition | $`d`$ | $`\mathop{\mathrm{tr}}F/d`$ | $`\mathop{\mathrm{per}}A`$ |
| --- | --- | --- | --- | --- |
| Shchesnovich | $`(3,2)`$ | 5 | $`279779200`$ | $`814016640`$ |
| Tran | $`(3,2)`$ | 5 | $`192`$ | $`504`$ |
| Octahedral six-vector configuration | $`(3,3)`$ | 5 | $`336/5`$ | $`240`$ |
| Drury, with the five root-of-unity columns unnormalized | $`(4,3)`$ | 14 | $`300`$ | $`1440`$ |

All satisfy (9) strictly. Their matrices, source normalizations and exact
trace certificates are recorded in `permanental_dominance_transfer_checkpoint.md`.
They cannot produce a counterexample through (1) with $`C=J_m`$, for any
number of copies. These examples are applications of (10), not new
conjecture cases being counted as resolutions.

There is also an unconditional asymptotic obstruction for any fixed core.
Writing $`h(A)=\prod_i a_{ii}>0`$, reorder $`J_m\otimes A`$ by
original vector index. Iterated Lieb--Fischer gives

```math
\mathop{\mathrm{per}}(J_m\otimes A)
 \geq (m!)^n h(A)^m.
```

Together with the first line of (10), this gives

```math
\frac{f_{H,\chi}(J_m\otimes A)}
     {\mathop{\mathrm{per}}(J_m\otimes A)}
\leq
\frac{\bigl((\mathop{\mathrm{tr}}F/d)/h(A)\bigr)^m}
     {(m!)^{n-1}}
\longrightarrow0\qquad(n\geq2).
\tag{11}
```

This latter bound does not assume (9). Zero diagonal entries make the
entire construction vanish.

## 5. A general block metric reduces to a self-Chollet ratio

There is a quantitative statement for every PSD $`C`$, without assuming
Chollet's conjecture. Suppose $`n\geq2`$ and the diagonal entries of
$`A`$ and $`C`$ are positive. Put

```math
T_0=\mathop{\mathrm{tr}}F/d,\qquad h=\prod_i a_{ii},\qquad
\kappa_A=\frac{T_0}{P^{1-2/n}h^{2/n}},\qquad
\mathcal R(C)=\frac{\mathop{\mathrm{per}}(|C|^2)}
                         {\mathop{\mathrm{per}}(C)^2}.
```

Here $`|C|^2`$ denotes the entrywise squared modulus. Then the entire
construction (1) satisfies

```math
\boxed{
\frac{f_{H,\chi}(C\otimes A)}{\mathop{\mathrm{per}}(C\otimes A)}
 \leq \kappa_A^m\mathcal R(C).}
\tag{12}
```

To prove this, positive diagonal congruence first reduces to
$`c_{ii}=1`$; all degree-$`nm`$ quantities in the quotient acquire
the same scaling factor. Write $`S=\mathop{\mathrm{per}}C`$ and
$`Q=\mathop{\mathrm{per}}(|C|^2)`$. Since $`|c_{ij}|\leq1`$,
formula (1) and the trace-power estimate give

```math
f_{H,\chi}(C\otimes A)
 \leq T_0^m\sum_{\pi\in K}|a_\pi(C)|^n
 \leq T_0^m\mathop{\mathrm{per}}(|C|^n)
 \leq T_0^m Q.
\tag{13}
```

Every comparison in (13) after taking absolute values involves a
nonnegative matrix. No signed termwise comparison is made.

Apply the principal-block Lieb--Fischer inequality to the two orderings of
$`C\otimes A`$. The $`m`$ blocks $`A`$ give the bound $`P^m`$,
while the $`n`$ blocks $`a_{ii}C`$ give the bound $`h^mS^n`$.
Their weighted geometric mean therefore gives

```math
\begin{aligned}
\mathop{\mathrm{per}}(C\otimes A)
 &\geq\max\{P^m,h^mS^n\}
 \\ &\geq(P^m)^{1-2/n}(h^mS^n)^{2/n}
 \\ &=P^{m(1-2/n)}h^{2m/n}S^2.
\end{aligned}
\tag{14}
```

The exponents are nonnegative because $`n\geq2`$. Combining (13) and
(14) proves (12), including $`n=2`$.

If $`\kappa_A\leq1`$, any dominance counterexample produced by this
wreath construction would already require a self-Chollet counterexample
in $`C`$. More precisely, a strict violation would require
$`\mathcal R(C)>\kappa_A^{-m}`$ when $`\kappa_A>0`$. If
$`T_0=0`$, the subgroup function vanishes and no violation is possible.
Zero diagonal entries of $`A`$ or $`C`$ likewise give zero rows in
the constructed matrix, so they are vanishing cases rather than undefined
quotient cases.

The four exact cores in Section 4 have $`\kappa_A<1`$. Their values can
be checked without radicals by using
$`\kappa_A^n=T_0^n/(P^{n-2}h^2)`$:

| Core | $`h`$ | $`\kappa_A^n`$ |
| --- | --- | --- |
| Shchesnovich | $`116688000`$ | $`88389238039897945309795/378681867924813026457741`$ |
| Tran | $`81`$ | $`2097152/6751269`$ |
| Octahedral six-vector configuration | $`16`$ | $`1058841/9765625`$ |
| Drury, same scaling as Section 4 | $`32`$ | $`1953125/56623104`$ |

Thus replacing the all-ones top metric by an arbitrary PSD top metric does
not turn these permanent-on-top examples into an automatic counterexample
transfer. A violation through this mechanism would require the separate
full conjecture of Chollet to fail in that top metric. This is a conditional
obstruction, not an assertion that Chollet's conjecture is true.

## 6. What remains outside the obstruction

For general $`C`$, formula (1) remains valid. The step replacing its
cycle weights by $`(\mathop{\mathrm{tr}}F)^m`$ term by term is not justified
when permutation monomials of $`C^{\circ n}`$ have complex phases.
Even when those monomials are nonnegative and that step is valid, comparing
the resulting expression with $`\mathop{\mathrm{per}}(C\otimes A)`$
requires another matrix inequality.

For instance, the trivial-base version naturally encounters

```math
\mathop{\mathrm{per}}(C\otimes A)
\stackrel{?}{\geq}
\mathop{\mathrm{per}}(A)^m\mathop{\mathrm{per}}(C^{\circ n}),
```

the scalar-block specialization of Marcus's conjecture. A general PSD
Kronecker-product lower bound with coefficient one is also not available
from the cited results: the Liang--So--Zhang and stronger repeated-block
Pate inequalities are separate conjectures in the literature. None is
assumed here.

The quantitative bound (12) does not exclude nonconstant top metrics that
violate the required self-Chollet bound. Nor does this note rule out
nonseparable block Gram matrices, smaller subgroups coupling the base
factors, or different character constructions. It proves that the power
trace can be realized legally and identifies why the simplest
identical-copy amplification fails.
Full MINC resolutions added: zero.

## Sources and verification scope

1. B. Beauzamy, E. Bombieri, P. Enflo and H. L. Montgomery, “Products of
   polynomials in many variables,” *Journal of Number Theory* **36** (1990),
   219--245. [DOI](https://doi.org/10.1016/0022-314X(90)90075-3).
2. B. Reznick, “An inequality for products of polynomials,” *Proceedings
   of the American Mathematical Society* **117** (1993), 1063--1073.
   [Author institution's record](https://experts.illinois.edu/en/publications/an-inequality-for-products-of-polynomials/),
   [DOI](https://doi.org/10.1090/S0002-9939-1993-1119265-2).
   This is the classical norm inequality and differential-operator
   interpretation used in (6)--(7).
3. J. M. Aldaz, A. Bravo and H. Render, “The apolar inner product and a
   Bombieri-type inequality for polynomials,” *Journal of Inequalities and
   Applications* (2025), article 90.
   [Full primary text](https://link.springer.com/article/10.1186/s13660-025-03343-1),
   Introduction and Theorem 7. These state the exact apolar normalization,
   homogeneous product inequality and Gaussian integral representation.
4. E. H. Lieb, “Proofs of some Conjectures on Permanents,” *Journal of
   Mathematics and Mechanics* **16** (1966), 127--134.
   [DOI](https://doi.org/10.1512/iumj.1967.16.16008).
   The iterated principal-block inequality is used only for (11); the
   bound (5) has the self-contained norm proof above.
5. F. Zhang, “An update on a few permanent conjectures,” *Special
   Matrices* **4** (2016), 305--316, Section 7.
   [Author institution's PDF](https://scholars.nova.edu/ws/portalfiles/portal/42826589/An%20Update%20on%20a%20Few%20Permanent%20Conjectures.pdf).
   This distinguishes Marcus's block inequality, the PSD Kronecker-product
   conjecture, and Pate's stronger repeated-block conjecture.

The subgroup and power-trace formula is derived directly, so neither a
non-subgroup tuple constraint nor an unverified eigenvalue transfer is used.
The known-core numerical constants above are exact values from already
reviewed certificates; they are not evidence for the general inequalities.
