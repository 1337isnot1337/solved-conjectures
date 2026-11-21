# Coordinator review of the Shallit 2 separator-route obstruction

21 November 2026. Reviewed final source: `agents/other_paid/shallit2/short-factor-parity-route.md`, SHA256 `f42198fc14a862f15cd517bd875e9af94151c4f5562a6a69da61738bc55fde99`.

The self-contained route obstruction passes this second review. It excludes the proposed short-factor/residue-parity dichotomy uniformly. It is not a lower bound for arbitrary separating grammars and does not resolve the full £10 target.

The binary dictionary has $`O(2^b)`$ productions and the chosen block concatenation has $`O(\ell/b)`$, giving the asserted production cost. Arbitrary prefixes and suffixes add constant overhead without requiring a unit-production elimination step of uncontrolled cost.

For bounded lengths, the two child intervals generate every length from two to their sum, and the terminal alternatives supply length one. Successive halving uses only two neighboring indices per depth. The marked-block parity construction and the incomplete-block cases handle every residue and both empty-factor endpoints with logarithmically many strict CNF productions.

For the exact-language lower bound, the three-state product grammar has at most nine times the original number of useful variables. Pumping a sufficiently long word with a unique final one cannot alter that one. The combined positive pumping length is therefore a multiple of the modulus and at most the exponential pumping bound. This proves the claimed production lower bound for the entire predicate language, with no assumption that every separator must use it.

The polynomial product is nonzero with positive even support size. The stretched, equally split supports have the stated margins and spacing. For a factor length at most the spacing, every factor contains at most one one, and each one contributes exactly one occurrence at each possible internal position. The all-zero factor count then follows by subtraction. In characteristic two, each relevant factor $`1+z^{Lp}`$ is divisible by $`1+z^p=z^p-1`$, proving equality of every tested residue parity. The relation $`n=\Theta(P^2\log P)`$ gives the uniform asymptotic obstruction.

The ordered split also puts the first one at different positions. I opened the [1999 publisher abstract](https://jalc.de/issues/1999/issue_4_2/abs-101.pdf), which states the doubly logarithmic unequal-length separator theorem, and [Robson's original paper](https://www.numdam.org/item/ITA_1996__30_1_81_0.pdf), which defines the parity family and its sufficient modulus. Applying the former theorem to the leading unary runs, then adjoining the first one and a free suffix, gives the much smaller separator stated in the source. This application relies on that published theorem; the unavailable full 1999 proof was not independently reconstructed.

The source's displayed-word comma has been removed in the final reviewed version. No finite search, matching general asymptotic bound, Lean proof, priority certification, or additional bounty completion is claimed.
