# Lean proof of the critical-family classification

The two critical families in [PROOF.md](PROOF.md) now have a direct Lean proof.
The proof does not assume the results of Cordella cited there.

For a finite list of natural-number speeds `ds`, the formal definitions are

```math
\mathop{\mathrm{clearance}}(ds,t)=\min_{d\in ds}\|dt\|,
\qquad
\mathop{\mathrm{value}}(ds)=\sup_{0\le t\le1}\mathop{\mathrm{clearance}}(ds,t).
```

Here $`\|x\|`$ is the distance from the real number $`x`$ to the nearest integer.
The empty-list clearance is defined as $`1/2`$; the classification concerns lists
of length five.

## Statement

`Loneliness.CriticalFamilies.ContainsCriticalQuadruple ds` means that, for some
positive natural number $`d`$, the list contains every speed in at least one of

```math
d\{1,2,3,4\},\qquad d\{1,3,4,7\}.
```

`critical_family_classification` proves the following. Suppose `ds` has length
five, all its entries are positive, its entries have greatest common divisor
one, and it contains a critical quadruple. Then

```math
\mathop{\mathrm{value}}(ds)\ge\frac15
\quad\text{or}\quad
\exists s\ge1,\quad
\mathop{\mathrm{value}}(ds)=\frac{s}{5s+1}.
```

The corollary `critical_family_below_threshold` takes the additional hypothesis
$`\mathop{\mathrm{value}}(ds)<1/5`$ and concludes the displayed exact formula.
Distinctness is not required by these Lean theorems. They therefore apply, in
particular, to the five distinct speeds required by the paper.

The proof has three source files:

| Source | Main contents |
| --- | --- |
| [`LonelinessCriticalBase.lean`](../../lean/Conjectures/LonelinessCriticalBase.lean) | Integer periodicity, permutation invariance, the modular witness, and extraction of the fifth speed |
| [`LonelinessCriticalSecond.lean`](../../lean/Conjectures/LonelinessCriticalSecond.lean) | Exact values for $`\{1,3,4,7,5s\}`$ |
| [`LonelinessCriticalFamilies.lean`](../../lean/Conjectures/LonelinessCriticalFamilies.lean) | The classification of both primitive critical families |

## Nontrivial dilations have value at least one fifth

After permutation, a list containing a critical quadruple has the form

```math
dQ\cup\{a\},\qquad
Q\in\bigl\{\{1,2,3,4\},\{1,3,4,7\}\bigr\}.
```

Primitivity implies $`\gcd(a,d)=1`$. The proof establishes this from divisibility
of the list's iterated greatest common divisor. It does not assume a separate
normal-form theorem.

Suppose $`d\ge2`$. Choose the smallest integer $`n\ge d`$ congruent to $`a`$
modulo five. Then

```math
d\le n\le d+4\le4d.
```

Write $`n=a+5\delta`$. Bézout's identity supplies integers $`j,k`$ such that

```math
aj=\delta+dk.
```

At the real time

```math
t=\frac{5j+1}{5d},
```

the four base speeds satisfy

```math
dm\,t=mj+\frac m5,\qquad m\in Q.
```

Every entry of either quadruple is nonzero modulo five, so these four distances
are at least $`1/5`$. The fifth speed satisfies

```math
at-k=\frac{n}{5d}\in\left[\frac15,\frac45\right],
```

and its distance is also at least $`1/5`$. Integer periodicity moves this witness
into the unit interval. The relevant declarations are `modular_witness`,
`fifth_of_dilation`, and `le_value_any`.

When $`d=1`$ and $`5\nmid a`$, the single time $`t=1/5`$ gives the same bound.
Thus a critical-family list below the threshold must have $`d=1`$ and
$`a=5s`$ for some positive integer $`s`$.

## Exact values in the two remaining families

The first family is proved in
[`LonelinessFiveFamily.lean`](../../lean/Conjectures/LonelinessFiveFamily.lean):

```math
\mathop{\mathrm{value}}([1,2,3,4,5s])=\frac{s}{5s+1}
\qquad(s\ge1).
```

The new theorem `second_family_value` proves

```math
\mathop{\mathrm{value}}([1,3,4,7,5s])=\frac{s}{5s+1}
\qquad(s\ge2).
```

Set $`r=s/(5s+1)`$. Then $`2/11\le r<1/5`$, and the time $`t=r`$ attains
clearance at least $`r`$. For the upper bound, the following successive cases
cover the half-period. Each row identifies an integer $`k`$ within distance
$`r`$ of the indicated speed multiplied by $`t`$.

| Time interval | Speed | Integer $`k`$ |
| --- | ---: | ---: |
| $`0\le t\le r`$ | $`1`$ | $`0`$ |
| $`r\lt t\le(1-r)/4`$ | $`5s`$ | $`s`$ |
| $`(1-r)/4\lt t\le(1+r)/4`$ | $`4`$ | $`1`$ |
| $`(1+r)/4\lt t\le(1+r)/3`$ | $`3`$ | $`1`$ |
| $`(1+r)/3\lt t\le(3-r)/7`$ | $`5s`$ | $`2s`$ |
| $`(3-r)/7\lt t\le(3+r)/7`$ | $`7`$ | $`3`$ |
| $`(3+r)/7\lt t\le1/2`$ | $`4`$ | $`2`$ |

Reflection, $`t\mapsto1-t`$, proves the upper bound on the remaining
half-period. All interval inequalities are proved in Lean from
$`(5s+1)r=s`$ and the stated bounds on $`r`$.

The case $`s=1`$ has a different value:

```math
\mathop{\mathrm{value}}([1,3,4,7,5])=\frac2{11}.
```

`second_family_one_value` proves this with a thirteen-interval exact rational
cover and the attaining time $`5/11`$. The certificate is checked by the generic
real-time certificate theorem, which proves the upper bound for every real
time. Since $`2/11=2/(5\cdot2+1)`$, this case also has the required spectrum form.

## Scope and validation

This proves both critical-family inputs used in the five-speed spectrum
argument. It does not prove the classification outside these families, the
external norm bound, or the exhaustiveness of the twelve sporadic examples.

The files use the repository's pinned Lean 4.35.0 and Mathlib manifest. From the
repository root, the relevant commands are:

```sh
cd lean
lake build Conjectures.LonelinessCriticalFamilies
lake env leanchecker Conjectures.LonelinessCriticalBase
lake env leanchecker Conjectures.LonelinessCriticalSecond
lake env leanchecker Conjectures.LonelinessCriticalFamilies
```

The main declarations depend only on Lean's standard `propext`,
`Classical.choice`, and `Quot.sound` axioms. There are no unfinished proofs,
custom mathematical axioms, or native-computation axioms in these proofs.
