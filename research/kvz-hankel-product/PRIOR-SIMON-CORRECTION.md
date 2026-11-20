# Prior-resolution correction: Simon's beta–gamma kernel

Date: 20 November 2026. This correction supersedes the earlier search conclusion for the novelty of Karp–Vishnyakova–Zhang's Hankel-product conjecture. The elementary counterexample in this repository remains mathematically valid, but the negation of the whole conjecture already follows from an earlier theorem of Thomas Simon. It must not be counted as a newly resolved open conjecture.

## 1. The two primary sources

Karp, Vishnyakova, and Zhang's [first preprint](https://arxiv.org/pdf/2408.01755v1), Section 3, item 11, printed page 8, states Conjecture 1 for two kernels

```math
K_i(x,y)=F_i(x+y),\qquad i=1,2,
```

that are sign regular of every order on the positive quadrant. It asserts that their pointwise product is also sign regular of every order there. The assertion uses non-strict sign regularity and imposes no condition that the two signatures agree. The second preprint and published paper retain the assertion in prose.

The relevant earlier source is Thomas Simon, *Produit Beta-Gamma et régularité du signe*, [arXiv:1207.6464v1](https://arxiv.org/pdf/1207.6464), submitted 27 July 2012; published in *Studia Scientiarum Mathematicarum Hungarica* **51** (2014), 429–453, [DOI:10.1556/SScMath.51.2014.4.1280](https://doi.org/10.1556/SScMath.51.2014.4.1280). The following page numbers refer to the 20-page arXiv version.

On pages 3–4 Simon defines the multiplicative kernel

```math
T_{b,d}(x,y)
=\exp(-x/y)\Psi(b,b+1-d,x/y),\qquad x,y>0,
```

where $`\Psi`$ is Tricomi's confluent hypergeometric function. The main theorem on page 4 characterizes its total positivity and its failure of sign regularity by the position of $`(d,b)`$ relative to a staircase $`\mathcal E_n`$. The final Remark (b) of Section 3, on page 16, explicitly explains that for $`d>0`$ each of the two displayed factors is totally positive of every order, whereas their product need not be sign regular of every order.

The printed remark has $`\exp(+x/y)`$, an evident missing-minus typo confirmed against the page image. The definition on page 4 and the integral representation on page 9 fix the kernel as $`\exp(-x/y)`$. The argument below independently verifies this factor's sign; it does not propagate the typo.

## 2. A particular parameter pair in Simon's theorem

Take $`b=d=1/2`$. Simon's exceptional set is

```math
\mathcal R=\{d\in\mathbb N\}\cup\{b\in\mathbb N^*\}.
```

This parameter pair is outside $`\mathcal R`$. It lies above $`\mathcal E_1`$ and below $`\mathcal E_2`$: the latter staircase contains $`(1,1)`$, and both coordinates of $`(1/2,1/2)`$ are smaller. Simon's main theorem therefore gives

```math
T_{1/2,1/2}\in TP_2,
\qquad T_{1/2,1/2}\notin SR_3.
```

In particular, there are two finite pairs of increasing positive three-point grids whose size-three determinants have opposite signs. This follows directly from the definition of non-strict sign regularity: orders one and two already have a valid sign, so the failure is at order three, and neither possible sign works there.

These are full kernel statements from Simon's theorem. No numerical search or approximate evaluation is needed.

## 3. Transfer from multiplicative kernels to Hankel kernels

Let $`k:(0,\infty)\to\mathbb R`$ and define

```math
K(x,y)=k(x/y),\qquad
H(u,v)=k(\exp(u+v)),\qquad u,v\in\mathbb R.
```

For increasing $`u_1<\cdots<u_r`$ and $`v_1<\cdots<v_r`$, put

```math
x_i=\exp(u_i),\qquad
y_j=\exp(-v_{r+1-j}).
```

Both the $`x`$ and $`y`$ grids are increasing and positive. The matrix $`[H(u_i,v_j)]`$ is obtained from $`[K(x_i,y_j)]`$ by reversing its columns. Hence

```math
\det[H(u_i,v_j)]
=(-1)^{\binom r2}\det[K(x_i,y_j)].
```

The correspondence between pairs of grids is bijective. Consequently, total positivity of $`K`$ of every order implies sign regularity of $`H`$ of every order, with the signature $`(-1)^{\binom r2}`$. Conversely, two opposing size-$`r`$ signs for $`K`$ give opposing size-$`r`$ signs for $`H`$.

Apply this to

```math
k_1(z)=e^{-z},\qquad
k_2(z)=\Psi(1/2,1,z).
```

Simon supplies total positivity of both multiplicative kernels, and the preceding section supplies failure of order-three sign regularity for their product. Therefore the two Hankel kernels

```math
H_1(u,v)=e^{-e^{u+v}},\qquad
H_2(u,v)=\Psi(1/2,1,e^{u+v})
```

are sign regular of every order on $`\mathbb R^2`$, with matching signatures, while their product is not sign regular of order three on that domain.

## 4. The positive-quadrant restriction does not repair the conjecture

Take the two finite grid pairs witnessing opposite order-three signs for $`H_1H_2`$. Choose one constant $`A>0`$ sufficiently large that adding $`A`$ to every coordinate in all four grids makes all coordinates positive. This is possible because there are finitely many coordinates.

Define, for every real $`s`$,

```math
F_{1,A}(s)=\exp(-\exp(s-2A)),\qquad
F_{2,A}(s)=\Psi(1/2,1,\exp(s-2A)).
```

The corresponding Hankel kernel is the translation $`H_i(u-A,v-A)`$. It is sign regular of every order on $`\mathbb R^2`$, and therefore on the positive quadrant. At each shifted grid entry,

```math
F_{i,A}((u+A)+(v+A))=k_i(\exp(u+v)).
```

Thus both original determinant values are preserved exactly. The product has opposing order-three determinants on positive grids. These functions meet precisely the domain and sign-regularity assumptions of Karp–Vishnyakova–Zhang's conjecture.

The common translation handles both witnesses simultaneously. It is not enough merely to restrict the unshifted functions to positive variables; the translated functions above are the required counterexample.

## 5. Strictness is not an obstruction

The source conjecture does not require strictness. Simon's stated non-strict total positivity therefore suffices for the preceding implication. In fact, both multiplicative factors can also be checked to be strictly totally positive.

For $`e^{-x/y}`$, write the entries as $`e^{x_i(-1/y_j)}`$. Both $`x_i`$ and $`-1/y_j`$ increase, so the strict exponential-kernel determinant applies.

For $`b,d>0`$, the standard defining integral and a change of variable give

```math
\Psi(b,b+1-d,x/y)
=\frac{y^b}{\Gamma(b)}
\int_0^\infty e^{-xv}v^{b-1}(1+yv)^{-d}\,dv.
```

As a kernel in increasing $`x,v`$, the exponential factor is strictly sign regular with signature $`(-1)^{\binom r2}`$. As a kernel in increasing $`v,y`$, write

```math
(1+yv)^{-d}=y^{-d}(v+1/y)^{-d}.
```

The generalized Cauchy kernel $`(v+w)^{-d}`$ is strictly totally positive for $`d>0`$, by its positive Laplace integral. Reversal of the decreasing $`1/y`$ grid gives the same signature $`(-1)^{\binom r2}`$. Continuous Cauchy–Binet then gives strictly positive determinants for the composed kernel. Integrability follows from $`b>0`$ near zero and exponential decay at infinity; expansion of the finite determinants justifies the formula absolutely. Thus the transformed Hankel factors are strict as well.

This strictness check is supplemental. The already published non-strict theorem is enough to disqualify the whole conjecture from the present project's new-resolution count.

## 6. Corrected status and limits

The repository's Cauchy-times-Gaussian example is a simpler independently obtained proof, with failure already in order two. It does not establish that the universal assertion remained unresolved: Simon's earlier theorem already implies its negation by the explicit coordinate changes above.

The earlier novelty searches missed this multiplicative formulation. Their conclusion must be replaced, rather than preserved as an unqualified claim of a new resolution. The original proof files remain useful mathematical documentation and should be labeled as an independently obtained counterexample to an assertion already contradicted by prior results.

This correction concerns the Hankel-product assertion only. Simon's gamma ratios in Lemma 3 on pages 7–8 occur inside weighted arithmetic-grid determinants for the Tricomi analysis. That lemma does not assert the all-grid additive gamma-quotient kernel theorem in the separate gamma-quotient result. The latter remains subject to its own novelty audit.

Discussion: [issue 94](https://github.com/1337isnot1337/solved-conjectures/issues/94).
