# Sponsor-status recheck: resolved and closed offers

Checked 21 November 2026. Coordination: [issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223).

This is an eligibility audit, not a mathematical solution or a bounty claim. The four records below were surfaced during a fresh search for direct-payment problems. Their current primary sources prevent treating them as fresh, available first-solver targets.

## Findings

| Advertised record | Current primary evidence | Decision for this campaign |
| --- | --- | --- |
| PPL 170: Nanongkai cut-query reachability, €110 main offer and €5 improvement offer | The [sponsor's current page](https://sites.google.com/site/dannanongkai/open) marks reachability solved. It also discontinues the separate €5 questions. | Excluded as an unresolved paid target. |
| PPL 037: Nanongkai faster algorithm with a larger description, €5 | The same sponsor page places this question under its discontinued €5 challenges. | Excluded as a live cash offer. This audit does not claim to settle its mathematical statement. |
| PPL 031: Hager reverse-Markov quadrature problem, ¥10,000 | The [sponsor's papers page](https://people.clas.ufl.edu/hager/papers-and-software/) explicitly attributes the prize problem's solution to Xiang-Sheng Wang on 13 October 2017. | Excluded as a new first solution. The original prize PDF remaining online does not reopen the offer. |
| PPL 029: Let's Prove Goldbach, finite-form representation, €200 | The sponsor's [English prize page](https://www.dimostriamogoldbach.it/en/prizes/) and [Italian prize page](https://www.dimostriamogoldbach.it/it/premi/) both report multiple solutions under review and state that further solutions are not accepted. | Excluded from current submissions. Pending review is not an accepted proof, so this is a closure finding rather than a proof-status conclusion. |

## Directed cut queries: the relevant scope changed after the ledger date

The [PPL 170 record](https://prizeproblems.org/problems/170/) has a July 2026 check date. Its main target asks for a genuinely subquadratic query algorithm on general directed unweighted graphs, or the stated lower bound. An improvement for directed acyclic graphs alone would not settle that target.

The current sponsor page supplies the decisive eligibility evidence: it marks the general reachability offer solved. Separate primary publication records support the changed scope. The revised paper by Ben Bals, Matei Tinca, and Yasamin Nazari, [*Reachability with Subquadratic Cut Queries on Directed Graphs*, arXiv:2607.26630v2](https://arxiv.org/abs/2607.26630v2), is dated 4 November 2026 and reports a deterministic bound of order n^(9/5) log n for general directed graphs, including reachability. Its July version concerned acyclic graphs. Thus inspecting only the original title or version would miss the later general result.

The separate primary record by Henry Fleischmann, Sagnik Mukhopadhyay, and Swagato Sanyal, [*A Simple Subquadratic Cut Query Protocol for Directed Reachability*, arXiv:2611.06906](https://arxiv.org/abs/2611.06906), dated 4 November 2026, reports general directed-graph algorithms with polynomial savings over quadratic queries and identifies earlier public work. This audit inspected the exact abstracts and version records; it did not independently reprove those algorithms. The sponsor's closure is sufficient to reject the offer as an unclaimed open target.

No new algorithm, priority claim, or inference that an award was paid is made here.

## Hager: the original statement and the sponsor's resolution notice

The [original one-page prize statement](https://people.clas.ufl.edu/hager/files/prize.pdf), dated 2 September 2015, concerns polynomials of degree at most n with p(-1)=0 and derivative magnitude at most one at the specified n Gauss or Radau nodes. It asks for nodal value bounds and explicitly limits the prize to the first correct solution. It also states a sharper Gauss bound. Those details must be retained when comparing mathematical statements.

The current author-maintained papers page explicitly says the prize problem was solved in 2017. A later paper coauthored by the sponsor, Chen, Du, Hager, and Yang, [*Bounds for integration matrices that arise in Gauss and Radau collocation*](https://doi.org/10.1007/s10589-019-00099-5), appeared in 2019. Its bibliographic details are also listed on the [author's optimal-control page](https://people.clas.ufl.edu/hager/optimal-control/).

The exclusion does not depend on reconstructing a proof from a numerical test or silently replacing the sharp statement with a weaker estimate. The sponsor directly identifies the old prize as resolved. This audit does not certify every sharp variant in the surrounding literature or infer that a different variant carries an award.

## Let's Prove Goldbach: closed intake is distinct from accepted mathematics

The [July ledger record](https://prizeproblems.org/problems/029/) describes the finite-index representation offer and says that no solutions had been received. The sponsor's currently indexed English and Italian pages give a different status: several solutions are under review and new solutions are no longer accepted. The other listed €100 problem has the same intake status.

The first direct opening of the English page encountered a redirect loop. The primary pages' full indexed text was then retrieved through search in both languages. An independent subsequent review successfully opened both primary URLs directly and confirmed the same closed-intake wording. No accepted-proof or payment claim follows from that wording.

The existence of pending manuscripts does not establish that the mathematical target has been proved. It does establish that the current first-received-solution process is not open to a new submission. No contact, email, manuscript submission, or request for financial details was made.

## Outcome

None of these records adds a live, newly solved paid target. The continuation count remains zero. These are specific corrections to the screened records, not an assertion that every entry in the prize ledger is wrong.
