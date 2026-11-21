# Roos–Seiringer’s conjecture

Proposed complete proof of the radial Dirichlet kernel nonnegativity asserted in §5, immediately after Lemma 5.1, of Roos and Seiringer, *BCS Critical Temperature on Half-Spaces*, Archive for Rational Mechanics and Analysis **249** (2025), article 20, [DOI 10.1007/s00205-025-02088-x](https://link.springer.com/article/10.1007/s00205-025-02088-x).

The proved assertion is stronger: the kernel is strictly positive at every positive real argument, and vanishes at zero. This is the entire scalar assertion from the source, not a finite-dimensional subcase of a conjecture over arbitrary dimensions.

The proof is essentially computer assisted. An exact entire series supplies the small-argument proof. A positive truncation of the arccoth integral supplies the unbounded large-argument proof. The remaining whole interval is covered by 184 rigorously positive closed intervals, using an analytic derivative bound and outward-rounded integer arithmetic.

- [Complete proof](PROOF.md)
- [Exact standard-library verifier](verify.py)
- [Source record](SOURCES.md)
- [Independent current priority audit](PRIOR_AUDIT.md)
- [Independent mathematical review](ALGEBRA_REVIEW.md)
- [Independent root review](ROOT_REVIEW.md)
- [Recorded exact certificate output](check-output.json)
- [GitHub issue 204](https://github.com/1337isnot1337/solved-conjectures/issues/204)

To reproduce the certificate:

```sh
python3 verify.py
```

Expected final status: `ALL_CONTINUOUS_INTERVAL_CHECKS_PASSED`.

The complete proof, independent mathematical review, independent root replay, and independent current prior-resolution audit have passed. The priority audit found no prior resolution within its documented coverage. This is a proposed new proof, with essential computer assistance; it has not been formally verified or externally peer reviewed.
