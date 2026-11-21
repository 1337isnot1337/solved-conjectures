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
