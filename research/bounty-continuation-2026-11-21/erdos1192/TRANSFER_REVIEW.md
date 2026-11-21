# Erdős 1192: independent review of the finite-energy transfer

21 November 2026. This is a mathematical review of `agents/demath_zzz/erdos1192/finite-energy-transfer.md`, SHA-256 `0612284e49c76ab7ec9e74b2a33758328db10f0b0a6e1a9ab876293b157b669e`. The reviewed reduction is correct. It does not construct the required finite bases or resolve the bounty.

## Scope checked

I read all six sections and independently reopened the [live exact target](https://conjectures.io/problems/erdos1192-erdos-1192) and the [July 2026 working report](https://www.erdosproblemaday.com/report/1192). The formal target uses ordered representations with repeated summands, an asymptotic basis for every fixed integer order at least two, and an order-dependent constant in the mean-square bound. Those conventions agree with the note. This review does not repeat the broader prior-art or payment audit.

## Energy and overlap

Fourier orthogonality identifies the ordered energy with the $`2r`$-th power of the Fourier polynomial's $`L^{2r}`$ norm. Disjointifying overlapping blocks before applying Minkowski is necessary and is done correctly. Energy is monotone under inclusion because it counts solutions; no false pointwise monotonicity of the Fourier polynomial is used. Translation invariance and the stated finite-translate bound follow.

The geometric-union estimate also checks. Only blocks with lower endpoint at most $`x`$ can contribute to $`A\cap[0,x]`$. Backward geometric summation bounds the norm independently of the number of blocks. Nonnegative summands ensure that every representation of an integer at most $`x`$ is contained in this truncation. The constants may depend on the fixed order and scale ratio, as the target permits.

## Cyclic equivalence

For the forward implication, reducing $`A\cap[0,2N]`$ covers the quotient because $`[N,2N)`$ is represented. Choosing one lift per residue does not alter quotient coverage. There are at most $`2r+1`$ integer sums in the interval $`[0,2rN]`$ in any one residue class, so Cauchy–Schwarz gives the stated cyclic-energy bound.

For the reverse implication, integer energy is no larger than modular energy. The four translates by $`N,2N,3N,4N`$ cover the required integer interval: for $`n=s+kN`$, with $`2r-1\le k\le4r`$, the lifted representation has carry $`0\le\ell\le r-1`$, and $`r\le k-\ell\le4r`$. Every such correction is the sum of $`r`$ numbers in $`\{1,2,3,4\}`$. Successive dyadic covered intervals overlap. This proves the full fixed-order equivalence, including the endpoint conventions.

## Prime-field carry correction

The base $`L=rp`$ prevents carries in the sum of $`r`$ field-coordinate representatives. Hence equality of two encoded integer sums implies equality in the original vector group, giving the required energy upper bound.

The correction set, explicitly $`T_p`$, has bounded cardinality for fixed $`r`$. Its signed digits correct every coordinate residue: the difference between a target digit and a sum of $`r`$ source digits is a multiple of $`p`$ in the allowed range. Applying the correction to one summand and zero to the other summands is legitimate because the final block is the full set $`B_p+T_p`$. The interval bounds follow from

```math
pr\sum_{i=0}^{r-1}L^i=\frac{L(K-1)}{L-1}<2K.
```

The subsequent positive shifts place all blocks above zero. Bertrand's postulate supplies a sequence whose scale ratio is both bounded above and bounded away from one. The displayed choice of $`H`$ makes the covered intervals overlap, and the geometric-union estimate applies. No growing-dimensional transfer is inferred.

## Mixed correlations and the remaining gap

The two balanced order-three correlations in the July report are exactly the Fourier integrals stated in the note. Hölder bounds them using third energy alone. This corrects the apparent need for a fourth-energy estimate in that particular accounting step; it does not invalidate the report's exact expansion. Applying Minkowski to the entire geometric union avoids accumulating a fixed multiplicative loss at each stage.

The missing construction remains substantial: for every fixed order, one needs covering finite bases with an energy constant uniform over all scales, or the sufficient fixed-rank prime-field family. Positive-density coverage and finitely many verified moduli do not suffice. No such family is supplied by the reviewed reduction. The review found no mathematical correction necessary; the author clarified the correction-set antecedent before the pinned version.
