# Prior-resolution exclusion

## Decision

Ulgenes’s inverse-gamma Newton-series conjecture is **excluded from new results**. An earlier complete proof was found and read on 20 November 2026.

The local proof and exact verifier remain as research records. They do not contribute to the repository's completed-result count. No result package should be published from this directory.

## Decisive earlier proof

- **Title:** *Convergence of the inverse-gamma Newton series: MathDB 357309, proof with an explicit remainder bound*.
- **Attribution printed in the document:** Principia Math In Progress.
- **Date printed in the document:** 17 September 2026.
- **Full proof:** [version pinned to a repository revision](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-357309/mathdb-357309-solution.tex).
- **Independently checked repository date:** the cited revision [47371706c400c79d06e3fb62190fcf6f7a725c85](https://github.com/PrincipiaMathOrg/math-solutions/commit/47371706c400c79d06e3fb62190fcf6f7a725c85) has creation time 27 October 2026, 05:36:01 UTC. The proof file was fetched at this revision, so its availability there predates this research session. This is not a claim that the revision first introduced the file.

The earlier theorem gives the exact published coefficients of Ulgenes's Conjecture 3.1 and proves convergence for every $x>\Gamma(\alpha)$, where $\psi(\alpha)=0$. It also proves absolute and locally uniform convergence.

Its argument uses the same complete mechanism as the local candidate:

1. Pedersen's conformal description makes $F(t)=(\log\Gamma)^{-1}(t)$ a Pick function.
2. Real continuation gives a positive Nevanlinna measure supported to the left of $a=\log\Gamma(\alpha)$.
3. Newton interpolation at $\log(j!)$ has an exact rational-kernel integral remainder.
4. The remainder product tends to zero because the reciprocal-node sum diverges.
5. The coefficient formula is the source's divided difference, and the eventually one-sign tails give absolute convergence.

The earlier proof additionally normalizes the remainder bound using $F(\log2)-F(0)=1$. Its full mathematical argument was read; no gap was found. It is a direct prior resolution, rather than a related theorem or a finite case.

## Original conjecture

David Peter Hadrian Ulgenes, *Series and Product Representations of Gamma, Pseudogamma and Inverse Gamma Functions*, Maple Transactions 5(1), Article 16090 (2025), Conjecture 3.1, p. 9.

- [Publisher and publication date, 23 February 2025](https://mapletransactions.org/index.php/maple/article/view/16090)
- [Current arXiv record](https://arxiv.org/abs/2301.09699)
- [Full v4 HTML](https://arxiv.org/html/2301.09699v4)
- [Full PDF](https://arxiv.org/pdf/2301.09699), which served v4 dated 13 March 2025 during this audit

## Search record and why the first screen missed it

Initial searches with both available web search engines used the author, exact article title, conjecture number, “inverse gamma Newton series”, “convergence”, and the MathDB identifier. They returned the source and related inverse-gamma literature. The [MathDB entry](https://mathdb.com/p/357309/newton-series-conjecture-for-the-principal-inverse-gamma-fun) still showed no posted solution when read.

The decisive result came from a **GitHub code search for “Ulgenes” in PrincipiaMathOrg/math-solutions**. It found the complete prior in the site's backup directory. Code searches in the separately checked Pudim and TrureTuring repositories returned no matching file, but those negative results do not weaken the positive prior evidence.

Related sources checked before the discovery included:

- [Pedersen, *Inverses of gamma functions*, arXiv:1309.2167](https://arxiv.org/pdf/1309.2167), especially §2, equation (2), and the start of §4. This is a credited classical analytic input.
- [Pedersen, *Pick Functions as a Tool in the Theory of Special Functions*, RIMS Kôkyûroku 1893 (2014), 89–101](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1893-12.pdf). Page 90 states the measure-support criterion; Proposition 6.4 proves the conformal map description.
- [Uchiyama, *A new look at Gamma function*, RIMS Kôkyûroku 1737 (2011), 133–139](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1737-17.pdf). It proves the principal inverse-gamma Pick property.
- [Jeffrey–Watt, *The Inverse of the Complex Gamma Function*, arXiv:2311.16583](https://arxiv.org/pdf/2311.16583). The complete six-page paper treats branch definitions and computation; it does not state the logarithmic-factorial Newton theorem.
- [TrureTuring's Ulgenes truncated-binomial Hadamard-limit record](https://www.trureturing.org/research/ulg398064/). It explicitly distinguishes its theorem from the inverse-gamma conjecture.
- [Nörlund's 1922 interpolation article metadata](https://www.numdam.org/item/ASENS_1922_3_39__343_0/). The full PDF was not retrieved.
- Cora–Fernández Tojo, [*Stieltjes polynomial interpolation*, arXiv:2608.24884](https://arxiv.org/abs/2608.24884), abstract available through [its mirror](https://www.alphaxiv.org/abs/2608.24884). It concerns polynomials from iterated Stieltjes integrals. Full text was not retrieved, so no full scope claim is made.

The publisher PDF redirected in a loop, while the full arXiv v4 text was available. The AMS PDF of Uchiyama's 2012 paper returned 403; the preceding author-written RIMS account was available. None of these access limitations affects the exclusion, which rests on an accessible complete exact prior proof.

## Local work retained

- [PROOF.md](PROOF.md): the reconstructed proof, now labeled excluded.
- [AUDIT-ALGEBRA.md](AUDIT-ALGEBRA.md): an independent mathematical pass before the novelty failure.
- [verify.py](verify.py): exact finite algebra checks, all passing; these are not proofs of infinite convergence.
- [Issue 113](https://github.com/1337isnot1337/solved-conjectures/issues/113): research and exclusion record.

For future target selection, check both ordinary literature search and the public proof repositories before investing in a full draft. A stale problem-database label is not evidence of continued openness.
