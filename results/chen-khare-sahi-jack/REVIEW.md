# Mathematical review and exact verification

The research and publication review checked Conjecture 4 in version 2 of Chen–Khare–Sahi, §4.2. Its parameter inequality permits the chosen pair of parameters 1 and 3/2. The equal-size shapes (3,2) and (3,1,1) agree in the first dominance sum, and the second sum is five versus four. The source allows every strict dominance difference and every single normalized Jack polynomial as factors. At parameter 1 these are precisely the Schur generators used in the proof. [Source](https://arxiv.org/html/2509.19649v2#S4.SS2) · [Proof](PROOF.md)

The positive leading coefficient of each generator prevents cancellation of a lexicographically largest leading monomial in any nonnegative linear combination. Consequently every product used in degree five has first part at most three. Evaluation at the all-ones vector excludes pure products, and two strict differences would require first part at least four. The column coefficient of the single difference is nonpositive. The column specialization is multiplicative in these products because all relevant degrees are at most the number of variables. Every partition in those degrees is present in the literal finite-variable pairing.

As a separate check of the parameter family, the four shared boxes in Stanley’s evaluation give the common factor below, with $`\alpha`$ denoting the reciprocal of the source paper’s target parameter. The difference of the two remaining box factors equals the second expression.

```math
\frac{2(1-\alpha)(1-2\alpha)}{n(n-1)(n+\alpha)(n+2\alpha)},
\qquad
\frac{2-\alpha}{n-1+\alpha}-\frac{3}{n-2}
=-\frac{(n+1)(1+\alpha)}{(n-1+\alpha)(n-2)}.
```

Both expressions are negative for $`1/2\lt\alpha\lt1`$ and $`n\ge5`$, so their product is positive. For the witness, the ordinary column coefficients of the normalized targets are −1/11305 and −1/3230, in the order (3,2), (3,1,1). Their difference is 1/4522. [Stanley’s evaluation, Theorem 5.4](https://math.mit.edu/~rstan/pubs/pubfiles/73.pdf#page=18)

## Reproducing the witness

Run both scripts from the repository root using Python 3 and its standard library.

```sh
python3 results/chen-khare-sahi-jack/verify.py
python3 results/chen-khare-sahi-jack/independent_gram_check.py
```

The [differential-operator checker](verify.py) constructs monic Jack polynomials in the monomial basis using the Laplace–Beltrami operator. The all-ones normalizations are 2261/10 and 1938/13. Among the 77 unordered degree-five generator products, 27 are pure and 35 have a difference and width greater than three. Of the remaining 15 products, seven have zero column coefficient and eight have a negative coefficient.

The [independent checker](independent_gram_check.py) constructs the targets from orthogonality in the power-sum basis. It also uses a second linear functional on the normalized Schur basis in decreasing lexicographic order.

```math
(L(S_{(5)}),L(S_{(4,1)}),L(S_{(3,2)}),L(S_{(3,1,1)}),L(S_{(2,2,1)}),L(S_{(2,1,1,1)}),L(S_{(1^5)}))
=(4,2,1,1,1,1,0).
```

This functional is nonnegative on all 77 generator products and equals −1/4522 on the normalized Jack difference. The two computations use exact rational arithmetic. The parameter interval follows from the written product identity. This is an internal mathematical review with no claim of external refereeing. [Source and priority audit](SOURCE_AUDIT.md)
