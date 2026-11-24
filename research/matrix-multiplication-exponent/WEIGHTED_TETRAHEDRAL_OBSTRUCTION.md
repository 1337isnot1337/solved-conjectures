# Nonzero coefficients do not remove the finite tetrahedral obstruction

Status: an elementary strengthening of the determinant-pencil calculation in [the four-party constraint note](FULL_TENSOR_CONSTRAINTS.md). This is a finite degeneration obstruction, including equal powers and a common full-unit catalyst. It does not establish a positive asymptotic overhead exponent.

Work over $`\mathbb C`$, let $`q\ge2`$, and label the six edges of $`K_4`$ by $`a=AB,b=AC,c=AD,d=BC,e=BD,f=CD`$. For an arbitrary array of nonzero complex coefficients $`\lambda_{a,b,c,d,e,f}`$, define

```math
K_q(\lambda)=
\sum_{a,b,c,d,e,f=1}^q
\lambda_{a,b,c,d,e,f}
e_{a,b,c}^{A}\otimes e_{a,d,e}^{B}
\otimes e_{b,d,f}^{C}\otimes e_{c,e,f}^{D}.
```

Thus the tensor has the full complete-graph support, with no requirement that its coefficients factor over edges. Put

```math
H_q=U_{ABC}(q)U_{ABD}(q)U_{ACD}(q)U_{BCD}(q).
```

Then

```math
H_q\not\unrhd K_q(\lambda).                       \tag{1}
```

The same conclusion holds after equal positive tensor powers and after multiplying both source and target by the same full unit of any positive integer size.

## Determinants of the two joint-contraction pencils

Contract the $`C,D`$ factors jointly against independent variables $`Z_{x,y}`$. This produces an $`AB`$ matrix of size $`q^3`$.

For $`H_q`$, write its four face indices as $`p=ABC,t=ABD,r=ACD,s=BCD`$. Its coordinates are

```math
A=(p,t,r),\quad B=(p,t,s),\quad
C=(p,r,s),\quad D=(t,r,s).
```

The $`AB`$ pencil is block diagonal over the $`q^2`$ choices of $`(p,t)`$. Each block has size $`q`$ and entries $`Z_{(p,r,s),(t,r,s)}`$. Its determinant is therefore a product of $`q^2`$ homogeneous factors of degree $`q`$.

For $`K_q(\lambda)`$, the pencil is block diagonal over the $`AB`$ edge label $`a`$. The block $`M_a`$ has rows $`(b,c)`$, columns $`(d,e)`$, and entries

```math
M_a[(b,c),(d,e)]
=\sum_{f=1}^q\lambda_{a,b,c,d,e,f}
 Z_{(b,d,f),(c,e,f)}.                              \tag{2}
```

For fixed $`a`$, the $`q^4`$ forms in (2) are linearly independent. Indeed, two different positions $`((b,c),(d,e))`$ use disjoint sets of $`Z`$ variables, and every displayed form is nonzero. Extend these forms to a basis of the whole linear-form space. In these coordinates, $`\det M_a`$ is the determinant of a generic $`q^2`$ by $`q^2`$ matrix, which is irreducible and homogeneous of degree $`q^2`$. Consequently the target determinant

```math
\prod_{a=1}^q\det M_a
```

is nonzero and every one of its irreducible factors has degree $`q^2`$. It is irrelevant whether some of the factors for different values of $`a`$ happen to be proportional.

## Local maps and a Laurent limit

The local dimensions of source and target are both $`q^3`$. Local maps at $`A,B`$ therefore multiply the pencil determinant by scalar determinants. The $`C,D`$ maps make a linear substitution in the $`Z`$ variables. Every local image of the source still has a determinant of the form

```math
\eta\prod_{j=1}^{q^2}P_j(Z),\qquad\deg P_j=q,
```

where $`\eta`$ is a scalar. In a hypothetical Laurent degeneration with the nonzero target determinant as limit, none of these factors can be identically zero over the Laurent field.

Normalize the Laurent valuation of each whole polynomial $`P_j`$, and also of $`\eta`$. Its leading coefficient is a nonzero homogeneous polynomial of degree $`q`$. The product of all these leading coefficients is nonzero because the polynomial ring is an integral domain. The valuation of the product is the sum of the valuations, so the target determinant must itself factor into degree-$`q`$ polynomials. Unique factorization contradicts the target factor degrees $`q^2>q`$. This proves (1).

For a common full unit of size $`r`$, the source has $`rq^2`$ factors of degree $`q`$. The target has $`r`$ independent copies of the blocks in (2), so all its irreducible factors still have degree $`q^2`$. The same proof applies.

Finally $`H_q^{\otimes m}\cong H_{q^m}`$. The tensor $`K_q(\lambda)^{\otimes m}`$ has the full support of $`K_{q^m}`$, with coefficients that are products of nonzero entries of $`\lambda`$. Apply the same argument with $`q`$ replaced by $`q^m`$.

## Scope

Replacing exact complete-graph coefficients by arbitrary nonzero coefficients can be useful asymptotically, but it cannot supply a finite zero-overhead tetrahedral map. The proof relies on square maps at the outer parties. Adding a full unit only to the source makes those maps rectangular and replaces the product determinant by a Cauchy-Binet sum; this proof does not apply to that setting.
