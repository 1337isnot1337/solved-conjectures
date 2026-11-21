# Baricz–Pogány's asymptotic-coefficient positivity conjecture

This directory gives a complete proof of the unnumbered conjecture in
Section 4.4 of Á. Baricz and T. K. Pogány, *Probabilistic and Analytical
Aspects of the Symmetric and Generalized Kaiser–Bessel Window Function*,
*Constructive Approximation* 58 (2023), 713–783,
[DOI 10.1007/s00365-023-09627-3](https://link.springer.com/article/10.1007/s00365-023-09627-3).

Two independent internal mathematical reviews pass. The documented
literature and public-solution-archive search found no earlier exact
resolution in the material inspected. Baricz's current publication list
contains an unlinked submitted follow-up on the four-parameter
Kaiser–Bessel distribution; its contents were not available for review.
The proof is complete, but exclusive priority is not guaranteed.

**Lean status:** none. No Lean formalization is included.

## The statement

The source defines the coefficients in the large-argument expansion

```math
\frac{tI_\nu(t)}{I_{\nu+1}(t)}
\sim t\sum_{n\geq0}\alpha_n(\nu)t^{-n},
\qquad \alpha_0(\nu)=1,\quad \alpha_1(\nu)=\nu+\tfrac12.
```

It conjectures that

```math
\alpha_n(\nu)>(\nu+\tfrac12)^n
\qquad\text{for every }n\geq2,\quad |\nu|<\tfrac12.
```

The proof covers every degree and every permitted real parameter.

## Why the proof works

Put $`a=\nu+1/2`$, so $`0<a<1`$. Normalize the standard Bessel asymptotic
coefficient series as a numerator $`N`$ and denominator $`D=1-B`$.
Every coefficient of $`N`$ is positive, and every positive-degree
coefficient of $`B`$ is positive. Their explicit products give

```math
D(z)=(1-az)N(z)-z^2N'(z).
```

Consequently the formal coefficient series of the desired differences is

```math
\frac{N(z)}{D(z)}-\frac{1}{1-az}
=\frac{z^2N'(z)}{(1-az)(1-B(z))}.
```

Both inverse factors have nonnegative coefficients and constant term one.
The numerator has a strictly positive coefficient in every degree at
least two. In fact, with

```math
c_n=\frac{\prod_{k=1}^n(k-a)(k+a-1)}{2^n n!},
```

the proof gives

```math
\alpha_n(\nu)-a^n\geq(n-1)c_{n-1}>0
\qquad(n\geq2).
```

These are identities of formal power series. The proof neither sums the
generally divergent asymptotic expansion nor differentiates an
asymptotic error term.

## Files and reviews

- [Complete proof](PROOF.md).
- [Source, prior-resolution audit, and access limits](NOVELTY.md).
- [Exact diagnostic](verify.py).
- [Independent analysis audit](../../research/baricz-pogany-coefficients/AUDIT-ANALYSIS.md),
  commit f42fe35c0ffaec2661ea0bf5a448c5f29bcf8c9e.
- [Independent root audit](../../research/baricz-pogany-coefficients/AUDIT-ROOT.md),
  commit 7501a1b919fcb9ad20a47401bdef123c4c3ff252.
- [Research and review thread](https://github.com/1337isnot1337/solved-conjectures/issues/112).

Run the diagnostic with Python 3 using the command
python results/baricz-pogany-coefficients/verify.py from the repository root.
It uses exact rational arithmetic and the Python standard library.
It reports 455 exact identities, 49 source fixtures, and 105 strict
bounds passed. These finite checks support the written proof; they do
not establish the universal statement.

No proof assistant is used.
