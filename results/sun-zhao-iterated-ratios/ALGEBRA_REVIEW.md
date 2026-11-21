# Independent algebra review

Status: the proposed disproof passes the mathematical and source-scope review. This review does not certify novelty; the prior-resolution audit is separate.

## Primary statement and indexing

I independently opened the complete primary PDF, arXiv:1602.04359v4, and read equation (1.1), the initial conditions, and the definition immediately before Conjecture 5.2 on printed page 14:

https://arxiv.org/pdf/1602.04359

The source defines the forward ratio operator by R(a)_n=a_(n+1)/a_n, preserving a starting index of zero. Therefore deleting the first twelve terms of R^12(P) retains indices 12, 13, and 14. Log-convexity at their center is a required inequality. The table in the proof uses precisely P_12 through P_26, the fifteen values needed for fourteen forward differences. There is no shift by twelve twice, or by one in the definition of the ratio operator.

For any positive sequence,

```math
\log(\mathcal R^k a)_n=\Delta^k\log a_n.
```

Consequently the logarithm of the quotient

```math
\frac{(\mathcal R^{12}P)_{12}(\mathcal R^{12}P)_{14}}
     {(\mathcal R^{12}P)_{13}^{,2}}
```

is exactly $\Delta^{14}\log P_{12}$. Even order fourteen gives coefficient $(-1)^j\binom{14}{j}$, as used. A negative value reverses the conjectured log-convexity. The parity and direction of the inequality are correct.

## Exact certificate

The stated recurrence matches the primary source. I executed `check.py` successfully. Its fifteen displayed sequence values agree with the recurrence, an independent positive binomial sum, and the alternating binomial sum. The two integer products have the reported bit length, and their strict ordering agrees with direct iteration of the ratio operator on exact rational numbers.

The shorter logarithmic certificate is also valid independently of floating-point arithmetic. For

```math
x_j=32P_{12+j}/16^{12+j},\qquad u_j=(x_j-1)/(x_j+1),
```

subtracting the affine function $(12+j)\log16-\log32$ leaves the fourteenth difference unchanged. The exact inequalities $|u_j|\leq1/3$ hold. The omitted terms after powers 1 through 47 in the arctanh expansion are bounded by

```math
\frac{2|u_j|^{49}}{49(1-u_j^2)}.
```

Multiplying this uniform bound by the sum of the binomial weights $2^{14}$ gives exactly the displayed error $E$. The code computes the rational truncation $S$ and compares its endpoints $S-E,S+E$ against the proposed rational enclosing interval using `Fraction`; it does not use floating-point logarithms or unproved numerical tolerances. Both strict comparisons pass.

Thus

```math
-185605/10^{15}<\Delta^{14}\log P_{12}<-185604/10^{15}<0.
```

This one exact violation refutes the universal Conjecture 5.2. It does not establish a failure at every larger iteration order and makes no assertion about Conjectures 5.1 or 5.3. Those scope limitations in the draft are correct.

## Corrections requested

None. The source, recurrence, truncation, finite-difference translation, exact product comparison, and rational remainder estimate are consistent. The remaining gate is the search for an earlier published or public disproof.

Algebra agent, 21 November 2026.
