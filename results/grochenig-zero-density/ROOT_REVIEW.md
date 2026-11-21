# Independent root review

Reviewer: root. Date: 21 November 2026. Verdict: the written counterexample is correct.

## Source and scope

I independently opened the published primary article, [DOI 10.1007/s44146-026-00264-3](https://link.springer.com/article/10.1007/s44146-026-00264-3), and checked the Gaussian example, the bounded-coefficient shift space, the sign-change set in Section 4.3, and the exact formulation of Problem 4.12. The proposed sequence satisfies the stronger condition of absolute summability.

The proof refutes the full universal upper-density comparison. This supplies a negative answer to the displayed universal comparison with the plus/minus notation. The separate lower-density inequality is not proved or disproved by this package and must not be reported as resolved.

## Mathematical checks

1. For each finite block, expanding the polynomial at exp(4 pi x) and using the Gaussian translation identity gives exactly the stated coefficients. The positive roots force every coefficient to be nonzero, with alternating signs.
2. The half-integer test points avoid all roots. Their values alternate in sign, so the finite minimum delta_N is strictly positive. No estimate on its size is needed.
3. At each recursive step there are finitely many inequalities. Both earlier blocks evaluated far to the right and the new block evaluated far to the left tend to zero. Therefore an even translation satisfying every constraint exists. The spacing inequality makes the coefficient supports disjoint.
4. The total absolute coefficient sum is exactly one. On a compact complex set, every Gaussian translate is bounded by exp(pi times the square of the largest imaginary part), independently of its real translation. The series thus converges absolutely and locally uniformly, and defines an entire function.
5. At each old test point, the sum of all future errors is at most delta_m times 2 to the power minus m minus two. Together with the past error this is less than three eighths of delta_m, preserving the intended signs.
6. Each block therefore supplies at least m distinct real zeros in an interval of length m. The function has a nonzero value at a test point, so it is not the zero function; its real zero set is locally finite. The upper Beurling density is at least one. The same conclusion follows if only integer endpoints are admitted, by using the containing interval of length m+1.
7. Every coefficient sign change starts at an even index, giving upper density at most one half. Arbitrarily long blocks contain N alternating nonzero transitions in length 2N, giving the matching lower bound. Skipping zero coefficients is handled exactly as in the source's definition.

There is no reliance on finite numerical checks, an unproved density theorem, or an interchange of a nonuniform limit with a zero count. The zero counts are obtained after the infinite function has been constructed and all tails have been bounded.

## Prior-art check performed by this reviewer

Two web search engines and the primary article were checked for the exact title, author, zero-density comparison and Problem 4.12. Local complete archive path inventories for PrincipiaMath and the relevant trureturing sections had no matching result. Global GitHub issue search found an unrelated mention of Gröchenig in the older repository issue 80; the author of the present proof inspected all 104 comments and identified its unrelated Schoenberg/zeta context. A path or title search alone does not establish exhaustive priority. The final source audit must retain this limitation.
