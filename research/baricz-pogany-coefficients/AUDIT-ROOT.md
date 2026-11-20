# Root audit of Baricz–Pogány's conjecture

Audit date: 20 November 2026.

## Mathematical conclusion

The complete proof in [PROOF.md](PROOF.md), first committed as
f2abaf2acedb769421ca46827be9283faf34ed05, passes independent review.
It proves every degree and every real parameter in the source conjecture.

I directly read the [publisher's complete primary text](https://link.springer.com/article/10.1007/s00365-023-09627-3),
Section 4.4, including the definition of the quotient coefficients, their
recurrence, the displayed coefficients through degree six, and the
unnumbered conjecture immediately following them. The target is precisely
the strict positivity of alpha_n(nu) minus (nu+1/2)^n for every n at least
two and every absolute value of nu less than one half.

## Checks of the proof

Set a=nu+1/2, so 0<a<1. The numerator coefficients c_n are positive:
their product has factors k-a and k+a-1 for every k from one to n.
The denominator coefficient quotient telescopes to
d_n/c_n=-(n+a)/(n-a), hence d_n is negative for every n at least one.
There are no zero or negative factors hidden in the permitted domain.

The source recurrence is exactly the identity DA=N in the formal power
series ring. Since d_0=1, formal division is uniquely defined.
Consequently the proof identifies the source's coefficients without
assuming convergence of the asymptotic expansion.

The ratio c_n/c_(n-1) gives
d_n=c_n-(n+a-1)c_(n-1), including n=1. In the formal series notation this is

$$
D(z)=(1-az)N(z)-z^2N'(z).
$$

The derivative is formal and the identity is established from coefficients;
no differentiation of an asymptotic error term occurs. Subtracting the
geometric series gives the decisive identity

$$
\frac{N(z)}{D(z)}-\frac1{1-az}
=\frac{z^2N'(z)}{(1-az)(1-B(z))},
\qquad B(z)=1-D(z).
$$

B has zero constant term and positive coefficients at every positive
degree. Therefore its geometric inverse is a well-defined formal series
with nonnegative coefficients and constant term one. The same is true
of the inverse of 1-az. For every n at least two, the coefficient of
z^n in z^2N' is (n-1)c_(n-1)>0. This proves both strict positivity and
the displayed lower bound, with no cancellation. The constant and linear
coefficients vanish as required; the n=2 lower bound is an equality.

The argument is about the entire infinite coefficient sequence. It does
not claim that a divergent asymptotic series converges or that its
coefficient signs imply a pointwise inequality for all positive arguments.

## Independent diagnostic replay

I fetched and ran the exact verifier committed as
db17eb7cc1afb3c190b31f163451dfbab0549957, blob
92dec46705363c9901c294ad6c4ebea6bb55c329, in the local Python runtime.
It reported 455 exact identities, 49 source fixtures, and 105 strict
bounds passed. The script independently starts from the source's
coefficient products and recurrence. These finite checks diagnose
transcription and indexing; the formal argument above proves all degrees.

## Prior-work conclusion and limits

I read the complete written [NOVELTY.md](NOVELTY.md) audit and independently
checked the exact primary statement and the current
[Baricz publication list](https://sites.google.com/site/bariczocsi/publications).
The list includes an unlinked submitted paper, *Properties of the
four-parameter generalized Kaiser-Bessel distribution*. Exact-title and
coauthor searches did not supply its full text. Its mathematical content
has not been excluded, and this access limit must remain visible.

The expanded audit includes ordinary web searches, the closest accessible
analytical papers, global source-identifier code searches, and the
Principia Math, Knowledge Sense, Pudim, Trure, CoPEER, and cross-theory
public archives. No exact earlier resolution was located in the inspected
material. This is bounded negative evidence, not a proof of exclusive
priority. The newly found prior resolutions of other campaign targets
are a reason to retain these explicit limits.

The mathematical proof is complete. A result landing page may state that
fact and the documented bounded prior-search conclusion. It must not
claim external peer review, author endorsement, or guaranteed priority.
