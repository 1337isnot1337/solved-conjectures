# Independent audit of the Ferreira–Simon stochastic-order proof

Date: 21 November 2026. The complete written proof passes this independent mathematical review. The source and priority audit is separate.

## Exact source statement

I read Ferreira and Simon, *Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1, Remark 7(b), printed page 18. The conjecture is the usual stochastic decrease of M_alpha/Gamma(1-alpha) throughout the entire interval 0<alpha<1. It is stronger than the already known comparison with a unit exponential variable, and different from the mean-normalized convex ordering proved in Theorem C.

Primary source: https://arxiv.org/pdf/2512.04940 .

## Independent reconstruction

Starting with the rate-one Poisson points T_n, the change of variables x=s^(-1/alpha) sends Lebesgue intensity ds to alpha*x^(-alpha-1)dx. Its Laplace exponent is

```math
\alpha\int_0^\infty (1-e^{-tx})x^{-\alpha-1}\,dx
=\Gamma(1-\alpha)t^\alpha.
```

Integration by parts is justified at both endpoints for 0<alpha<1. Thus the sum of T_n^(-1/alpha) has exactly the stable scale stated in the manuscript, and its negative alpha power has the conjectured marginal law. There is no missing gamma factor or reversal of the stochastic-order direction.

The strong-law event T_n/n tending to one ensures convergence of every p-power sum for p>1 on the same event. The subsequent comparison is deterministic: for a positive sequence in ell_p, normalization by its ell_p norm puts every entry strictly below one, so raising all normalized entries from p to q>p strictly lowers their sum. This proves the strict norm comparison and hence the desired reverse comparison of inverse norms. No parameter grid or exceptional-set intersection is hidden in the argument.

The proof also establishes the claimed endpoint limits. The largest entry determines the norm limit as p tends to infinity; divergence of the harmonic-sized sum forces the norm to infinity as p decreases to one. The resulting endpoints are the first Poisson arrival and zero.

Applying the strictly decreasing function exp(-x*u) for x>0 gives the displayed strict Mittag-Leffler inequalities. Almost sure strict ordering is not asserted to imply strict distribution-function inequalities at every threshold. The theorem only needs weak stochastic ordering, which follows immediately.

## Scope

This is a full analytic proof for every pair of real parameters in the source interval. It depends on standard Poisson-process facts, Laplace-transform uniqueness, and an elementary sequence-norm comparison. The manuscript proves the relevant Laplace functional and norm comparison explicitly. No computation is needed to justify an unbounded claim.

The classical Poisson series representation is correctly credited as prior mathematics. The remaining priority question is whether its application to this exact normalized stochastic-order statement was previously public. This review does not certify exclusive priority.
