# Exact audit of the crossed five-empty map

Status: a failure of the printed literal map, with an independently checked
local correction. The complete matrix multiplication degeneration remains
unverified by this audit.

Source: Zhi-Wei Sun, *Tensor Degenerations for Matrix Multiplication*,
[arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1), 67-page PDF,
Section 9.5, equations (9.11)--(9.15), Lemma 9.3, and Appendix A.7 on
printed pages 55--56. The matrices and instructions below refer to that
version, rather than to an inferred corrected version.

## A separate scalar mask error and its local repair

Section 5 and Appendix A.4 set $x_0=1/128$ and $y_0=z_0=1$, while retained satellite entries $x_i$ can equal one. Thus a retained term $B_i=x_i y_0z_i$ or $C_i=x_i y_i z_0$ can have coefficient one, whereas a retained $A_i=x_0y_iz_i$ has coefficient $1/128$. For the generic packet numbered 3, three retained terms have coefficient one and five have coefficient $1/128$. Their coefficient sum at zero characters is therefore

```math
3+\frac5{128}=\frac{389}{128},
```

instead of the asserted $8/128$. Multiplying each nonzero satellite $X$ entry by $1/128$, while keeping the already scaled $x_0,x_\infty$, gives exactly the intended coefficient on every retained support and zero on every omitted support. This is a local correction, with no assertion here that every subsequent map has already been reconciled with it. The exact script `check_sun_phase_and_mask.py` checks all twelve supports of this packet.

## A nonzero negative Laurent coefficient

Write $\chi_\xi(\delta)=(-1)^{\langle\xi,\delta\rangle}$ for characters of
$\mathbb F_2^4$, with the source's binary integer encoding, and set

```math
\xi=(0,3,4,9,12),\qquad
c=(1,0,0,0,0,\tfrac12,0,0,0,-\tfrac12).
```

The five source packets are copies of $C_3$. Their three corner terms are
$x_0y_0z_\infty$, $x_0y_\infty z_0$, and $x_\infty y_0z_0$.
The unmodified scalar portions of the Appendix A.7 maps include

```math
x_0^{(j)}\longmapsto t^{-2}\bar X_L+\text{regular terms},\qquad
y_0^{(j)}\longmapsto t^{-2}\bar Y_L+\text{regular terms},
```

```math
z_\infty^{(j)}\longmapsto
t c_{5+j}V+\mathbf 1_{j=1}t^4\bar Z_H.
```

The printed crossed-map instructions do both of the following:

1. Multiply the entire $`j`$th packet on the three sides by
   $\chi_{\xi_j}(\alpha)$, $\chi_{\xi_j}(\beta)$, and
   $\chi_{\xi_j}(\gamma)$, respectively.
2. Replace a scalar role on the side with character $\delta$ by
   $c^{[\delta]}=c\Sigma_\delta$, where
   $\Sigma_\delta$ has the five packet signs repeated twice on its diagonal.

On the closed character locus $\alpha+\beta+\gamma=0$, the product of the
three signs from step 1 is one for each packet. Step 2 still contributes
an additional sign to $z_\infty^{(j)}$. Consequently the exact coefficient
of $t^{-3}\bar X_L\bar Y_LV$ in the sum of the five images is

```math
\begin{aligned}
\sum_{j=1}^5c_{5+j}\chi_{\xi_j}(\gamma)
&=\tfrac12\chi_0(\gamma)-\tfrac12\chi_{12}(\gamma)
\\ &=\frac{1-\chi_{12}(\gamma)}2.
\end{aligned}
```

Take $(\alpha,\beta,\gamma)=(0,4,4)$. The closed-locus equation holds,
and $\chi_{12}(4)=-1$, so this coefficient is exactly one.
No other support can contribute to this same monomial: the only term
that has both the $\bar X_L$ and $\bar Y_L$ factors and the scalar $V$
factor is $x_0y_0z_\infty$. In particular, the other corners have distinct
scalar or regular variables.

This contradicts the asserted absence of negative Laurent coefficients
for the printed crossed map on the closed locus. It does not contradict
the possibility that some different maps prove the theorem.

There is a related bookkeeping mismatch in the claimed regular pairing.
Using the printed definitions

```math
B^{[\alpha]}=M_\alpha B\Sigma_\alpha,
\qquad
D^{[\beta]}=M_\beta^{\mathsf T}D\Sigma_\beta,
```

the external packet signs again cancel on the closed locus. Therefore
the actual $\bar Z_L$ regular pairing is

```math
B^{[\alpha]}J_{10}(D^{[\beta]})^{\mathsf T}
=M_\alpha M_{\alpha+\beta}M_\beta=I_7.
```

The proof instead evaluates the matrix with an additional
$\Sigma_\gamma$ inserted between $B^{[\alpha]}$ and $J_{10}$, obtaining
$M_\gamma$. That extra matrix does not describe the simultaneous
instructions above.

## What the stated closure kernels do

The old character-closure indicator is one at $(0,4,4)$, so projection
onto $\gamma=\alpha+\beta$ does not eliminate this coefficient.
The independent new characters and new relative coordinates in
equations (9.22)--(9.24) can all be zero. Their closure indicators and
phase are then also one. At this choice the subsequent feature
transport has $a=b=d=0$, and it does not delete the nonzero scalar
endpoint.

As a formal kernel check, set the old relative coordinates to zero, so
that the Weyl matrices become diagonal character matrices. Applying
this transform to the isolated closed-locus coefficient gives the
following unnormalized diagonal entry:

```math
\sum_{\alpha,\beta\in\mathbb F_2^4}
\frac{1-\chi_{12}(\alpha+\beta)}2=128\ne0.
```

Nonzero normalization factors do not change that formal calculation.
It is not a certificate of a surviving coefficient of the final
physical tensor: the compatibility of those relative coordinates with
the sector-specific row decoder has not been established here. The
closed-locus counterexample above needs no such assignment. The claimed
global theorem has not been disproved by this local calculation, and
it has not been verified either.

## A local correction

Retain the entire-packet character signs, but replace the regular and
scalar formulas by

```math
\widetilde B^{[\alpha]}=M_\alpha B,\qquad
\widetilde D^{[\beta]}=M_\beta^{\mathsf T}D,\qquad
\widetilde c^{[\delta]}=c.
```

Thus only the internal right $\Sigma$ factors are removed. These
remain side-local maps. On the closed locus the external packet signs
cancel, and the regular pairing becomes

```math
\widetilde B^{[\alpha]}J_{10}
(\widetilde D^{[\beta]})^{\mathsf T}
=M_\alpha(BJ_{10}D^{\mathsf T})M_\beta
=M_\alpha M_\beta=M_\gamma.
```

The original identities $cJ_{10}c^{\mathsf T}=1$,
$BJ_{10}c^{\mathsf T}=DJ_{10}c^{\mathsf T}=0$ give the scalar coefficient
and zero cross-pairings after the same left multiplications.
The only possible negative terms have degree $-3$, and their
coefficients are left multiples of the original last-five-column
sums. Those sums are zero. Each shared endpoint retains coefficient
one, and the split cubic uses packet $\xi_1=0$, so it too retains
coefficient one.

This proves the desired corrected local identity on the closed locus.
It does not prove compatibility with every later source-resolved
composition in the paper. The correction must be incorporated into
an explicit full source-to-target map before the global claim can be
accepted.

## Reproducible exact verification

The companion file `check_sun_crossed_map.py` transcribes the printed
$B,D,c$ matrices and all five Laurent packet maps. It uses only
Python's standard-library rational arithmetic and expands every
$C_3$ support, rather than checking the selected coefficient alone.
Running it establishes the following finite statements:

- The original unmodified matrix identities and last-five-column
  zero sums hold over $\mathbb Q$.
- The printed crossed maps have at least one negative coefficient
  for 255 of the 256 triples with $\gamma=\alpha+\beta$.
- For every closed triple, the selected coefficient is exactly
  $(1-\chi_{12}(\gamma))/2$.
- After the local correction, all 256 triples have no negative
  coefficients, and their complete degree-zero tensors are exactly
  the shared endpoints, scalar endpoint, split cubic, and the regular
  endpoint pairing $M_\gamma$.

The finite count is an exact computation. The one-coefficient
counterexample and the corrected identities above are also proved
without relying on that enumeration.
