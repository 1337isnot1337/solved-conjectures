# Independent review of the short-factor and residue-parity route

Reviewed source: [the stable proof note](short-factor-parity-route.md), SHA-256 `fd0713fd1da64c17089c67709a5959662a4244ec8c17b5946e1ac1daf38dd544`.

The mathematical claims pass within the note's stated scope. This is a review of a failed proposed separator family. It does not prove a lower bound for unrestricted context-free grammars and does not resolve Shallit's paid problem.

## Exact-language grammar cost

The bounded-length recurrence is valid: the binary alternative for an index `a` generates every length from 2 through `a`, and the two terminal alternatives supply length 1. At each recursion depth, the required indices differ by at most one, so there are only logarithmically many variables and productions.

Full blocks with a prescribed bit can be built with logarithmically many strict CNF productions. The two parity variables correctly track the parity of the number of marked full blocks. Copying a block's root production removes the displayed unit alternatives with constant cost. The incomplete-block decomposition covers all shorter tails, including tails that do not reach the inspected position. Empty factors can be handled by separate start alternatives without introducing nullable internal variables. Together these give the claimed logarithmic upper bound for the entire predicate language.

For the lower bound, intersect with the three-state automaton for `0*1`. Because it has one initial state and one accepting state, the product grammar needs no extra union start variable: it has at most nine times the original number of useful variables. Its pumping length is therefore at most the asserted exponential bound. The two pumped substrings contain no `1`; otherwise pumping would remove or duplicate the unique final `1`. Their positive combined length must be a multiple of the modulus. This proves the logarithmic lower bound for grammars generating the complete residue-parity predicate, not for arbitrary grammars separating a particular pair.

## Uniform counterfamily

The polynomial is nonzero with nonzero constant and leading coefficients before its shift. Evaluating it at 1 gives zero in characteristic two, so its nonzero support has positive even size and can be split equally. Every support position is a multiple of the spacing parameter, and the chosen word length leaves the asserted zero margins at both ends.

For each factor length no greater than the spacing, an occurrence contains at most one `1`. Every `1` supplies exactly one occurrence for each possible location of that `1` within the factor. Thus all one-`1` factor counts agree, and subtraction gives the claimed all-zero count. The displayed pattern in the source has an extraneous comma between its `1` and final zero power; this is a typography issue, not a different word definition.

For every tested modulus, the polynomial has a factor of the form `1 + z^(L p)`, which is divisible by `1 + z^p`. Reduction modulo `z^p - 1` sums coefficients in each residue class, so all residue-parity tests in the stated range agree. The asymptotic relations follow directly from the exact word length. This defeats the proposed dichotomy uniformly, with both parameters allowed to grow as stated.

## Why this is not a general grammar lower bound

For the ordered support split, the first `1` occurs at different positions in the two words. The [1999 publisher abstract](https://jalc.de/issues/1999/issue_4_2/abs-101.pdf) explicitly states the doubly logarithmic bound for unequal-length words. Applying it to the two initial unary runs, restricting to the unary alphabet if needed, and appending a `1` followed by an arbitrary suffix gives a separator of that size for these particular binary words. The fixed-alphabet restriction and suffix attachment have constant multiplicative or additive grammar cost.

I inspected that primary abstract, not the unavailable full ten-page proof, so this last step is an application of its stated theorem rather than an independent reproof. The self-contained production accounting, pumping argument, polynomial divisibility, factor counts, and scope distinction above do not depend on a numerical experiment.

## Publication correction

The identified display comma was removed after this review. The final author-source SHA256 is `f42198fc14a862f15cd517bd875e9af94151c4f5562a6a69da61738bc55fde99`; the mathematical statements are unchanged. The [coordinator review](COORDINATOR_REVIEW.md) pins that corrected version.
