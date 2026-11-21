# Review of the compound action and Hadamard sector identities

Research checkpoint, 20 November 2026 (America/Chicago). This is an
independent internal review of two partial results. It establishes no
historical priority and adds no completed Minc-list problem.

## Permanental compound action

Reviewed: [mixed polynomial-space action](../compound/mixed_compound_action.md).

The substitution convention is consistent. With
$`T_Af(x)=f(A^{\mathsf T}x)`$, one has
$`T_LT_FT_U=T_{LFU}`$. The upper block factor substitutes left variables
into right variables. Starting with a squarefree input, this does not
repeat any right variable. The lower block factor leaves right
variables fixed. A right collision created by the middle factor
therefore cannot contribute to the final squarefree projection.
This proves the asserted intermediate projection identity. Discarding
left collisions at the same stage would be invalid; the proposed
algorithm retains them.

On left degree $`s`$ and right degree $`j`$, the middle map is the
ordinary homogeneous substitution by $`B`$ tensored with the
degree-$`j`$ permanental compound of the Schur complement. Ordinary
polynomial coefficients already carry the necessary binomial factors.
The elementary lower shear keeps only zero or one new copy of a right
variable, with coefficients $`1`$ and $`ac`$ when the left exponent is
$`a`$. No omitted term can re-enter the squarefree right space.

The dimension convolution bounds the total work at each recursive
level by a polynomial factor times
$`\binom{n+k-1}{k}`$. Balanced recursion has logarithmic depth. The
storage comparison is valid, including the exceptional floor/ceiling
split at $`n=3`$. A child's degree is no greater than its parent's, and
the generating-function quotient proves the required domination of
dimensions. The input and output squarefree vectors fit in the mixed
array because the squarefree space is its subspace.

The interpolation repair needs to be performed only at the outermost
call. Choosing a sample with every leading principal minor nonzero
ensures that all recursive Schur complements inherit the required
pivots. Thus the polynomial number of samples does not multiply anew
at each recursive level. The product of the leading determinants of
$`A+tI`$ is monic of degree $`n(n+1)/2`$, so the proposed sample count
supplies enough good points. Each compound entry has degree at most
$`k`$, making interpolation at zero valid even for singular $`A`$.

I reran the exact checker. All 75 action comparisons passed, including
singular matrices handled by interpolation. The resulting dimension
bound gives a storage improvement over retaining the full symmetric
coefficient array. It does not improve the stated exponential time
bound and does not resolve P17.

## Hadamard partition sectors

Reviewed: [Hadamard partition sectors](../sign/hadamard_partition_sectors.md).

The partition-lattice inversion uses the correct block factor
$`(-1)^{|S|-1}(|S|-1)!`$. The coefficient functional excludes empty
labelled blocks, and division by $`r!`$ removes exactly their labels.
For a normalized Hadamard matrix of order divisible by four, each
column has product one, so the one-block contribution is $`-n!`$.

For three distinct columns, dividing by the third produces two
balanced signs with zero mutual correlation. Their four joint counts
are all $`n/4`$. Splitting repeated column labels by their equality
patterns gives the proposed universal two- and three-column
polynomials with the stated multiplicities. The two-block harmonic
formula follows from the squared subset correlation sum; the endpoint
terms in its beta integral are correctly removed.

For four distinct columns, Fourier inversion of the three quotient
signs gives counts $`(n+uvw\,c)/8`$. The products over the two parity
classes are $`R+8p`$ and $`R-8p`$, respectively. Both exponents are
nonnegative integers. The fourth-sector equality-pattern counts
$`1,7,6`$, followed by the $`24`$ permutations of four distinct
columns, account for every ordered column tuple exactly once.

Summing a four-column correlation over quadruples uses one constant
row and $`n-1`$ balanced rows. Squaring and summing uses $`n`$ equal
row pairs and $`n(n-1)`$ unequal row pairs. These give both displayed
universal moments. They do not determine the correlation distribution.

The exact checker passed independently during integration. Its known
order-16 examples illustrate this remaining freedom; they are not new
finite-order results. The note correctly leaves the aggregate
two-adic cancellation over all partition sectors unproved. No claim
of Hadamard permanent nonvanishing follows from these identities.
