# Proof audit

## Exact statement

The source asks for strict sign regularity of $`1/\Gamma_q(x+y)`$ for $`0<q<1`$. The proposed proof treats all positive real nodes and every positive integer determinant order. No restriction to integer arguments, a finite order, or a selected base value is introduced.

## Algebra checks

The double series is

```math
S_q(u,v)=\sum_{k,n\ge0}\frac{q^{kn}u^k v^n}{(q;q)_k(q;q)_n}.
```

Summing in $`k`$ yields $`1/(uq^n;q)_\infty`$. Since

```math
(u;q)_\infty=(u;q)_n(uq^n;q)_\infty,
```

this reciprocal is $`(u;q)_n/(u;q)_\infty`$, with the finite product in the numerator. The q-binomial series then gives precisely

```math
S_q(u,v)=\frac{(uv;q)_\infty}{(u;q)_\infty(v;q)_\infty}.
```

The reciprocal gamma factor is

```math
\Gamma_q(x+y)^{-1}
=(1-q)^{x+y-1}(q;q)_\infty^{-1}(q^{x+y};q)_\infty.
```

Both normalizations therefore introduce only positive row and column factors.

## Determinant sign checks

For finite truncations, each Cauchy–Binet summand has two positive generalized Vandermonde factors and one reversed generalized Vandermonde factor. The signature is exactly $`\varepsilon_r=(-1)^{r(r-1)/2}`$.

Returning from increasing $`u,v`$ to increasing $`x,y`$ reverses both orders. Two reversals preserve the sign.

Strictness survives the limit because the fixed index sets $`I=J=\{0,\ldots,r-1\}`$ contribute a nonzero term independent of the truncation size. All other terms have the same sign. This rules out a zero limiting determinant.

## Convergence checks

For fixed $`0<q<1`$, $`(q;q)_\infty>0`$. Each reciprocal finite factorial is bounded above by $`(q;q)_\infty^{-1}`$, and $`q^{kn}\le1`$. The double series is dominated by a product of two geometric series. Only finite Cauchy–Binet identities are used before passing to an entrywise limit.

## Failed route kept separate

An earlier attempt considered a general statement for arbitrary finite products $`F(z)=\prod_j(1-c_jz)`$ with positive $`c_j`$. That statement is false. Exact rational computation in the adjacent research file [finite-product-obstruction.py](../../research/campaign-20261121/finite-product-obstruction.py) supplies a seventh-order Euler-Hankel determinant of the wrong sign below the first positive zero. The present proof uses the geometric q-product through the exact q-binomial identity and never uses the false generalization.

Preliminary high-order floating-point Hankel scans were used only to choose a route. Their apparent small-base sign failures at very small determinant magnitudes are not evidence against the theorem; the proof does not rely on those scans. No numerical claim is part of the result.

## Independent root review

The root reviewer checked the exact source statement, the two q-series identities against DLMF, both Cauchy–Binet expansions, the generalized Vandermonde sign, the fixed-term strictness bound, both node-order reversals, and the reciprocal-gamma normalization. No mathematical gap was found. The standard-library `verify.py` independently checks coefficient identities, rational integer-node gamma minors, and finite determinant expansions. Its finite checks are diagnostics and are not premises of the all-order proof.
