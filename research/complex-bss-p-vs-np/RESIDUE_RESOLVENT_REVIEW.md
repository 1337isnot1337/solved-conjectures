# Independent review of the residue-resolvent and Hermite frontier

Reviewed file: [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md).

Status: the algebraic identities, limits, pole analysis, and conditional finite-jet extraction pass this independent written audit. The circuit bound for the resultant ratio or the proper Hermite part is still missing.

## 1. The monic affine line and resultant ratio

Choosing $`v`$ with $`W_d(v)\ne0`$ makes the leading form of every irreducible factor nonzero at $`v`$. The affine substitution $`A\mapsto A+tv`$ is an automorphism after adjoining $`t`$. Each transformed factor is irreducible in $`\mathbb C[A,t]`$, and its nonzero constant leading coefficient in $`t`$ makes it primitive over $`\mathbb C[A]`$. Gauss's lemma therefore gives irreducibility over $`\mathbb C(A)[t]`$. The monic normalization and the factorization of $`w`$ are exact.

For monic degree $`d`$ polynomial $`w`$,
```math
B_0=(w')^2-ww''
```
has degree $`2d-2`$ and leading coefficient $`d`$. The denominator resultant with $`w-\delta`$ is nonzero over $`\mathbb C(A,\delta)`$, because a root of the fixed polynomial $`B_0`$ cannot have the transcendental value $`\delta`$ under $`w`$.

The monic resultant product formula gives
```math
T_\delta
=\prod_{w(\beta)=\delta}
\bigl(z+s(u-\beta)-\mu(\beta)\bigr).
```
The factors $`B_0(\beta)`$ cancel exactly between numerator and denominator. No residual normalization depending on the roots is present.

As $`\delta\to0`$, the roots cluster with the original multiplicities; monicity prevents roots escaping to infinity. The regular value of $`\mu`$ is the multiplicity at each root, giving the stated limit. The identity
```math
\prod_{\widehat p(\alpha)=0}
(z-m_p+s(u-\alpha))
=s^{d_p}\widehat p\left(A,u+\frac{z-m_p}{s}\right)
```
also proves that the limiting function is a polynomial in the displayed variables.

## 2. The trailing coefficient and finite jets

At $`z=k`$, the marked factor contributes $`s^{k d_R}\widehat R^k`$. All other factors have nonzero constant term in $`s`$. The first coefficient is therefore exactly
```math
\left(\prod_{p\ne R}(k-m_p)^{m_p d_p}\right)\widehat R^k.
```
Its scalar is nonzero and independent of $`A,u`$.

The two sequential limits and the trailing-coefficient limit can be taken in finite-dimensional Taylor coefficient spaces at permissible generic centers. A small rational circuit is evaluated there by scalar-unit inversion and truncated arithmetic; it is not treated as a polynomial approximant without that step. Intermediate denominator zeros at $`z=k`$ are avoided before taking the parameter limit.

Recovering the normalized $`R`$-jet from the normalized $`R^k`$-jet by the finite binomial series has polynomial cost in the jet order, independently of $`k`$. Generic centers can then tend to the BCJS center because the combined target jet, rather than each intermediate expression, is holomorphic there.

The conventional Sylvester sizes $`3d-2`$ and $`3d-1`$, and the quotient-algebra rank $`d`$, check. They are exponential in the available circuit parameters in general. An HN query tests common-root existence and hence a resultant zero, not the value of the resultant ratio.

## 3. Hermite pole analysis

At a marked root,
```math
\omega=\frac{k}{v}+h(v),\qquad
\frac{\mu'}{\mu-k}=\frac qv+g(v),
```
so
```math
H_k=-\frac1k\omega\frac{\mu'}{\mu-k}
=-\frac q{v^2}+\frac{c_\alpha}{v}+\text{regular terms}.
```
The double-pole sign is negative. The integer $`q`$ is the same at every conjugate root because it is the valuation of $`\mu-k`$ at the irreducible factor $`r`$.

At an unmarked root of $`w`$, $`\mu-k`$ is regular and nonzero, so only the simple pole of $`\omega`$ can remain. Away from roots of $`w`$, $`\omega`$ is regular and the logarithmic derivative of $`\mu-k`$ has at most simple poles. These cases exhaust the finite poles. At infinity, the two factors are $`O(t^{-1})`$, so their product is $`O(t^{-2})`$; there is no polynomial part.

The proper rational function
```math
J=q\sum_{r(\alpha)=0}\frac1{t-\alpha}
=q\,\frac{r'}r
```
has derivative with precisely the required double principal parts. Therefore $`H_k-J'`$ has only simple finite poles. Uniqueness follows because the derivative of any nonzero proper rational difference has a pole of order at least two. The formula supplies the aggregate mathematically, not a circuit for it.

## 4. Exceptional case and the original coefficient field

If $`\mu=k`$ identically, then $`(1/\omega)'=1/k`$, hence $`w=c(t-a)^k`$. Over $`\mathbb C(Y)`$ this alone would not justify charging a rational function $`a(Y)`$ as a constant.

The draft repairs that issue for $`w(Y,t)=W(b+tY)`$. Its value at zero is the fixed nonzero scalar $`W(b)`$, and its first coefficient is the linear form $`\sum_i(\partial_iW)(b)Y_i`$. Thus
```math
w(Y,t)=W(b)(1+t\ell(Y))^k
```
with $`\ell`$ genuinely linear over $`\mathbb C`$. Setting $`t=1`$ shows that the original target factor is affine linear. The exceptional case is therefore cheap over the original constant field.

The Laurent-ring substitution $`A=b+tY`$, followed by the nonzero constant-term argument, correctly preserves irreducibility over $`\mathbb C(Y)[t]`$ in the nonexceptional case.

## 5. The total jet cutoff

In
```math
\frac{\partial_tR(b+tY)}{R(b+tY)}
=\sum_{j\ge0}c_j(Y)t^j,
```
the coefficient $`c_j`$ is homogeneous of degree $`j+1`$ in $`Y`$. The term has total degree $`2j+1`$. Consequently the total degree-$`(2D-1)`$ jet contains exactly all coefficients needed through $`t^{D-1}`$, with their full $`Y`$-dependence.

Those bounded-degree coefficients can be extracted by polynomially many interpolation operations in $`t`$. Finite integration and exponentiation then reconstruct $`R(b+tY)/R(b)`$ modulo $`t^{D+1}`$, and setting $`t=1`$ gives the desired coefficient-space jet. Any displayed denominator basepoints of a hypothetical rational circuit are handled by generic-center jets and a limit of the holomorphic target.

The final implication is correctly conditional: a polynomial bound for these particular proper Hermite parts or resultant ratios would supply the needed aggregate. Neither the short formula for $`H_k`$ nor the HN zero test proves that bound.
