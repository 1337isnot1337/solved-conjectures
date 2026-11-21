# Combinatorics target screening

Date: 21 November 2026. These entries are exclusions and research directions, not newly solved conjectures.

## Sun's q-log-convexity conjecture

The universal rising-binomial assertion in Conjecture 1.1(i) of [Sun's paper](https://arxiv.org/html/2505.02767v4) is already false. [Qiping Zhou's answer to Sun's original MathOverflow question](https://mathoverflow.net/questions/479301/on-the-polynomials-sum-k-0n-binomnkkm-qk), dated 24 July 2026, exhibits exponent 5 and index 7. Exact independent arithmetic gives

$$
28^5+63^5+45^5-2\cdot36^5-8^{10}=-499140.
$$

This is the coefficient of $q^2$ in the relevant log-convexity difference. It is a complete prior disproof of the universal statement. Sun's subsequent repair to exponents 2, 3, and 4 is also contradicted at exponent 4 by the earlier reader proof displayed on the [MathDB page](https://mathdb.com/p/368293/sun-s-q-log-convexity-conjecture-for-binomial-sums-and-the-p). None of this counts as new work here. The paper's cubic-binomial and double-sum clauses have different scope and are not resolved by this obstruction.

## Makhija's conjecture

Excluded: [Han, Ma, and Sun, *Factorizations by column blocks and Schubert polynomials as products of key polynomials*, arXiv:2610.36993v1](https://arxiv.org/html/2610.36993v1), dated 27 October 2026, explicitly proves Makhija's elementary-symmetric-product criterion. The four forbidden patterns and allowance for repeated alphabets match the target. The discovery database's open status is stale.

## Fayers' divisibility conjecture

Excluded: the [existing public solution](https://mathdb.com/p/369588/fayers-divisibility-conjecture-for-s-s-t-s-2t-dots-core-poly) gives a complete formal coefficient argument. It starts from the Keith–Nath–Sellers Lah-polynomial formula, derives the generating function, and evaluates the desired negative diagonal by the substitution $w=z/(1-z)$. For odd parameter the coefficient vanishes by parity; for even parameter two central binomial coefficients cancel. This is a substantive earlier proof, regardless of the database's unverified label. Reconstructing it would not be a new resolution.

## Kurşungöz's conjecture

Active, unresolved. The full Conjecture 4 of [arXiv:2502.17117v1](https://arxiv.org/pdf/2502.17117) concerns every multiplicity vector and every maximum multiplicity. The accompanying notes derive a reversal identity and an interpretation through cycle types of permutations. A proof of the coefficient inequality remains missing. Initial exact calculations suggest the stronger property of log-concavity, which is only an experimental observation.

## Xie–Xu's conjectures

Screened but not reserved. [Ultra log-concavity and real-rootedness of dependence polynomials, arXiv:2408.09152v2](https://arxiv.org/html/2408.09152v2), revised 10 October 2026, retains the general dependence-polynomial conjecture and the stronger 2-matroid conjecture. Its proven cases concern graphs avoiding an induced edge plus two isolated vertices, and graphs with an independent set of codimension two. No general proof was found in this screening, and no result is claimed here.

All candidate statuses must also be checked against public GitHub proof repositories, since general web search has missed relevant earlier manuscripts during this campaign.

## Celano–Sieger–Spiro's conjectures

Excluded: the [Eulerian-graph recurrence](https://mathdb.com/p/359926/the-eulerian-graph-recurrence-conjecture-for-bd-g) and the [multipartite orientation multiplicity](https://mathdb.com/p/359927/the-multipartite-orientation-conjecture-for-the-multiplicity) already have public complete proof notes. The first uses cyclic rotation in a balanced orientation. The second pairs consecutive vertices and obtains a nonzero first coefficient at the predicted root multiplicity by an odd-parity count of minimal pairings. Their database status labels do not erase those earlier arguments.

## Sokal's functional-digraph conjecture

Excluded: Bao-Xuan Zhu, [*Coefficientwise Hankel-total positivity from a universal cumulant lifting*, arXiv:2611.01172v1](https://arxiv.org/html/2611.01172v1), Theorem 1.3, proves the coefficientwise Hankel total positivity of the component polynomials. The abstract and theorem explicitly identify Sokal's conjecture. The broader joint refinement by cyclic vertices and components has different scope and is not resolved by that theorem.

## Bóna–Dimitrov–Labelle–Li–Pappe–Vindas-Meléndez–Zhuang's conjectures

The proposed Sturm and Sturm-unimodality assertions are explicitly marked resolved immediately after Conjectures 5.4–5.5 in [arXiv:2212.10586v2](https://arxiv.org/pdf/2212.10586). The real-rootedness classification in Conjecture 5.12 has a previously reported boundary counterexample and a candidate corrected-classification manuscript by Shunpei Shimizu; see the [source record](https://mathdb.com/p/405372/real-rootedness-classification-for-refined-narayana-polynomi). Neither is a fresh target.

## Kellner's conjectures

Excluded after independent derivation. Conjectures 1.4 and 4.6 of [arXiv:2509.05235v1](https://arxiv.org/html/2509.05235v1) follow from a closed formal generating function obtained by summing the exact defining recurrence. However, the separate reviewer located Yutaro Matsuno, [*A resolution of Kellner's conjectures on Wilson quotients*, arXiv:2607.10106v1](https://arxiv.org/abs/2607.10106), July 2026. Its abstract explicitly reports the generating function and the two resolutions. A calculation note is retained only as an excluded rediscovery. The prior hit came from a global GitHub search by author and conjecture, despite no relevant hit from the original arXiv identifier. This is a concrete reason to search both identifiers and names before publication.

## Petersen–Zhuang's zigzag conjecture

Excluded as a fresh target. Conjecture 6.1(a,b) on real-rootedness and log-concavity is explicitly covered by Ethan Torres, [arXiv:2611.22110v1](https://arxiv.org/html/2611.22110v1), 17 November 2026. The remaining part (c) concerns balanced simplicial complexes realizing the gamma vector, not consecutive interlacing. Wenle Shi and Lijie Wang, [*Balanced Simplicial Complexes for the gamma-Vectors of Zig-Zag Eulerian Polynomials*, arXiv:2611.24720](https://arxiv.org/abs/2611.24720), 18 November 2026, explicitly report a full proof of that part. The [external preregistration 31524](https://github.com/the-omega-institute/trureturing/issues/31524) has the exact original part (c), but its earlier status is not evidence against the later full-source resolution.

## Other prior resolutions located during screening

- Fel's universal numerical-semigroup polynomial conjecture is covered by [arXiv:2602.03716](https://arxiv.org/abs/2602.03716), with an exponential generating function proof. No claim is made here.
- Golombic–Levine's Fibonacci-degree conjecture has a full public proof on [MathDB 373100](https://mathdb.com/p/373100). The length inequalities force the asserted degree recurrence; the proof's existence takes precedence over a stale open label.
- Bourn–Erickson's earth-mover polynomial palindromicity and unimodality are already proved in the source [arXiv:2307.02652](https://arxiv.org/abs/2307.02652).
- Shapiro's terminal stability assertion for quartic square-graph polynomials is refuted in the later version of [arXiv:2605.25743](https://arxiv.org/abs/2605.25743). The older conjecture version is not a fresh target.

## Coulter–Do–Moskovsky's genus-asymptotic root conjecture

Active research, issue 193. This is published Conjecture 3.15 of [arXiv:2308.04015](https://arxiv.org/abs/2308.04015), distinct from the all-genus bt-deformation already explored in issue 88. A general two-pole character expansion gives all predicted root limits and eventual strict monotone convergence for every profile. The note explicitly leaves monotonicity from genus zero unproved and withholds full-resolution classification pending source-scope review. No count has been added.
