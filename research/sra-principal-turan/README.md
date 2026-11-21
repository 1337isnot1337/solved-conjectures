# Sra's conjecture

Research checkpoint, 21 November 2026. No proof or counterexample was found. [Issue #207](https://github.com/1337isnot1337/solved-conjectures/issues/207) tracks this work.

## Source and full target

Suvrit Sra, *Monotonicity of Turán-ratios of symmetric polynomials*, v1 released 7 October 2026, Conjecture 4.1, pp. 7–10:

- [Primary PDF](https://hexagonmath.org/pdf/2610.00720v1).
- [Author version history](https://suvrit.github.io/papers/sym-turan/).

For $`0\lt q,t\lt1`$ and $`n\ge2`$, define

```math
A_j(x)=(x,xt,\ldots,xt^{j-1},t^j,\ldots,t^{n-1}),\qquad
B_j(x)=P_\lambda(A_j(x);q,t).
```

The conjecture asserts

```math
\frac{d}{dx}\frac{B_i(x)^2}{B_{i-1}(x)B_{i+1}(x)}>0
\qquad(x>1,\ 1\le i\lt n)
```

for every partition padded to length $`n`$ with $`\lambda_1>\lambda_n`$. Rectangular partitions give constant ratios. The common principal-specialization normalization cancels.

The source already handles two variables, degree-two row shapes, a neighborhood of $`x=1`$, and the large-$`x`$ tail for row shapes. Those partial results are not new results of this checkpoint.

## Computation and its limits

`screen.py` constructs Macdonald polynomials by exact rational horizontal-strip branching. It groups monomials by the exponent of the first $`j`$ variables, with the exact geometric weight $`t^{\sum_r r e_r}`$, to obtain the coefficient lists of every $`B_j`$. Floating evaluations then test

```math
2\frac{B_i'}{B_i}
-\frac{B_{i-1}'}{B_{i-1}}
-\frac{B_{i+1}'}{B_{i+1}}.
```

A negative candidate below the diagnostic tolerance is replayed using rational arithmetic. None was found. These are not exact positivity certificates, even for the finite set of sample points.

The completed screens were:

| Variables | Degrees | Parameter pairs | Derivative diagnostics |
| --- | --- | --- | ---: |
| 3 | 1–16 | $`(1/10,9/10),(9/10,1/10),(1/2,3/4),(3/4,1/2)`$ | 7,040 |
| 4 | 1–16 | The same four pairs | 26,796 |
| 5 | 1–12 | $`(1/100,99/100),(99/100,1/100),(1/2,1/2)`$ | 20,328 |

Each screen includes every partition in the stated degree range with last part zero. Adding the same integer to all parts multiplies $`B_j`$ by a factor whose logarithm is affine in $`j`$, so this restriction removes duplicate ratios. The sample points are listed in the script.

`row_screen.py` separately evaluates the explicit one-row formula (source equation (4.8)), using logarithmic weights to avoid overflow. It tested 1,084,860 derivative values over the parameter grid, dimensions, degrees, and arguments written in that script. It found no value below its negative-candidate tolerance. The smallest computed value was approximately $`-9.73\times10^{-11}`$, inside the floating-error scale of the cancellation of nearly equal logarithmic derivatives; no sign claim is made for it. The script does not certify positivity or perform exact replay.

Reproduce the general-shape runs with:

```bash
python3 screen.py --n 3 --degree 16
python3 screen.py --n 4 --degree 16
python3 screen.py --n 5 --degree 12 --params 1/100:99/100,99/100:1/100,1/2:1/2
python3 row_screen.py
```

The general-shape script uses only the Python standard library. The row diagnostic uses NumPy and SciPy.

## Structural obstacle

For a positive polynomial, the derivative sign above is equivalent to positivity of

```math
N_i(x)=2B_i'(x)B_{i-1}(x)B_{i+1}(x)
-B_i(x)\bigl(B_{i-1}'(x)B_{i+1}(x)
 +B_{i-1}(x)B_{i+1}'(x)\bigr).
```

The branching rule gives positive coefficients for each individual $`B_j`$, but this alone gives no sign for the subtraction in $`N_i`$. A whole proof needs a relation between adjacent split alphabets that survives branching, or another argument controlling this derivative for every partition. No such closure argument has been established here. Repeatedly increasing the finite screen would not discharge that obligation.

The exact identifier and global title searches, the current author version record, and the available solution-archive path inventories did not identify a prior full resolution. That bounded search is not an exhaustive novelty certification. A complete proof or counterexample would require a renewed source and prior-status audit before promotion.
