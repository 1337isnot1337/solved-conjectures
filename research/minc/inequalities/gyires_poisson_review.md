# Independent review of the Poisson Gram equivalence

Reviewed 20 November 2026 (America/Chicago) against
[the Poisson note](gyires_poisson_gram_equivalence.md) and the definition of
$`F`$ in [the transfer note](gyires_substochastic_transfer.md).

The reduction passes review. It proves no norm inequality and resolves no
conjecture.

## Orientation and normalization

Use the row-transition kernel in the draft. Let

```math
h(x)=\frac{\mathbf1_{\{x=\mathbf1\}}}{\pi(\mathbf1)},
\qquad \pi(x)=e^{-m}/x!.
```

The stationary joint construction with independent Poisson edge counts
and unmatched counts gives

```math
\pi(x)K_B(x,y)=\pi(y)K_{B^{\mathsf T}}(y,x).
```

Consequently the output density is

```math
f_B(y)=\frac{K_B(\mathbf1,y)}{\pi(y)}
      =(K_{B^{\mathsf T}}h)(y).
```

This identifies the adjoint convention explicitly. In particular its
squared norm involves $`BB^{\mathsf T}`$, not $`B^{\mathsf T}B`$.

Write $`s=\sum b_{ij}`$ and $`q=m-s=\sum_jv_j`$. Extracting the all-ones
coefficient from the stated probability generating function gives

```math
\mu_B(\mathbf1)=e^{-q}Z(B),\qquad
f_B(\mathbf1)=e^{m-q}Z(B)=F(B).
```

There are no missing factorials: each unmatched output coordinate
contributes the coefficient of $`z_j`$ in $`e^{v_jz_j}`$, which is $`v_j`$.
The matching definition is invariant under transposition, so
$`F(B^{\mathsf T})=F(B)`$, including zero monomer weights.

## Composition and the infinite state space

Sequential transitions have survivor matrix $`BC`$. The first-stage
immigrants that survive the second stage are independent Poisson counts;
together with the new immigrants their mean row vector is

```math
v_B^{\mathsf T}C+v_C^{\mathsf T}
=\mathbf1^{\mathsf T}-\mathbf1^{\mathsf T}BC.
```

Thus $`K_BK_C=K_{BC}`$. Products of doubly substochastic matrices remain
doubly substochastic, so all kernels used here are in the stated domain.

Every $`K_B`$ preserves $`\pi`$. Jensen's inequality and stationarity give

```math
\|K_Bg\|_{L^2(\pi)}^2
\le \sum_x\pi(x)K_B(|g|^2)(x)
=\|g\|_{L^2(\pi)}^2.
```

Since $`\|h\|_2^2=1/\pi(\mathbf1)=e^m`$, the displayed formula for $`f_B`$
proves its $`L^2`$ finiteness. Nonnegative sums justify the composition
identity before this finiteness argument; Cauchy--Schwarz is therefore
legitimate afterward.

The detailed-balance substitution in the return probability gives

```math
F(BC)=\langle f_B,f_{C^{\mathsf T}}\rangle_{L^2(\pi)}.
```

Taking $`C=B^{\mathsf T}`$ gives
$`\|f_B\|_2^2=F(BB^{\mathsf T})`$. Hence

```math
F(BC)^2\le F(BB^{\mathsf T})F(C^{\mathsf T}C).
```


## Quantifiers and scope

For each fixed order $`m`$, the following are equivalent when quantified
over all doubly substochastic cores of that order:

1. $`F(BC)\le F(B)F(C)`$ for every pair $`B,C`$.
2. $`F(BB^{\mathsf T})\le F(B)^2`$ for every $`B`$.
3. $`\|f_B\|_2\le f_B(\mathbf1)`$ for every $`B`$.

The forward implication uses $`C=B^{\mathsf T}`$; the reverse implication
uses the last Cauchy--Schwarz inequality and the Gram assertion for both
$`B`$ and $`C^{\mathsf T}`$. All quantities are nonnegative. Consequently
the draft's equivalence over all orders is also correct.

For a doubly stochastic core,

```math
F(B)=e^m\mathop{\mathrm{per}}B,\qquad
F(BB^{\mathsf T})=e^m\mathop{\mathrm{per}}(BB^{\mathsf T}).
```

Thus the conjectured all-core Gram bound would give only

```math
\mathop{\mathrm{per}}(B)^2
\ge e^{-m}\mathop{\mathrm{per}}(BB^{\mathsf T})
```

by direct substitution. The finite-order strong Gyires constant is
$`m!/m^m>e^{-m}`$. The draft correctly separates these statements and
does not claim that the all-core equivalence proves finite-order Gyires.

No correction or additional computational test was needed.
