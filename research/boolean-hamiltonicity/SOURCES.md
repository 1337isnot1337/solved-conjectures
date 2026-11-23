# Primary-source audit

Checked on 2026-11-23. This is a bounded source and scope check for the research target in [issue #251](https://github.com/1337isnot1337/solved-conjectures/issues/251), not a claim to have resolved Boolean P versus NP or established novelty for the auxiliary lemmas.

Under the repository's [standing assumption](../../AGENTS.md), the pinned Anthropic theorem, proof and lemmas are accepted as available results. This document records their exact versions and scopes; it does not reopen their truth as a research obligation. Statements below that combine these results with new elementary arguments are consequences of the imported theorem under that standing assumption.

## 1. Pinned arithmetic lower bound

Claude (Anthropic), *VP ≠ VNP over every field*, repository version
`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`.

- [Pinned directory](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp)
- [Pinned paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf)
- [Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean)
- [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean)
- [README.md](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/README.md)

The downloaded pinned PDF has 1,023,554 bytes and SHA-256
`882f5eefb1e067cc8c99ddfe660c10d1d67f9fcee7b69364bd0bab06c0c1f97c`.
Its Git blob SHA is `5f7608fd559424700bd870430f68e6cd08c0a564`.
The paper's Appendix Q specifies Lean 4.33.1 and Mathlib commit
`0df444a360eaa60ab8c11dca51a86af692955474`.

| Printed statement | Formal theorem | Scope |
| --- | --- | --- |
| Theorem 1.1 = Theorem M.3 | `Solution.mainTheorem`, through `Paper.thm_allfields` | Ordinary arithmetic circuits for the Hamiltonian cycle polynomial over every field; permanent when the characteristic is not two |
| Corollary 1.2 = Corollary M.4 | `Solution.separation`, through `Paper.cor_allclasses` | VP is a proper subset of VNP |
| Theorem 1.4 = Theorem N.5, first assertion | `Solution.mainTheoremApprox`, through `Paper.thm_approx` | The corresponding lower bound for approximating circuits |
| Theorem 1.4 = Theorem N.5, second assertion | `Solution.separationClosure`, through `Paper.thm_approx` | VNP is not contained in the closure of VP |

The exact numerical form is: there exists an absolute real constant `c > 0`; for every characteristic `p` there exists a threshold `m₀`; for every field of that characteristic and every `m ≥ m₀`, the relevant circuit needs more than

```math
m^{c(\log_2m)^{1/3}}
```

gates. The threshold may depend on the characteristic. `Statement.Computes` permits arbitrary field constants, variables, addition and multiplication, counting input and constant nodes as gates. It requires equality as a formal polynomial. `Statement.Approximates` uses Laurent-series constants and agreement in all nonpositive powers of the approximation parameter.

This audit inspected these definitions, the final theorem wrappers, the pinned PDF and the source's own verification description. It did not rebuild the full Lean project or independently rerun the two proof kernels. The repository says that no human mathematician had checked the proof when this version was published. No Boolean lower bound is among its formal statements.

### The paper's explicit Boolean obstruction

Section 2.5 identifies two steps that inspect the formal polynomial: the block-linear decomposition (`lem_balanced`) and low-degree evaluation (`lem_lowdeg`). A circuit correct only on the Boolean cube can contain terms from

```math
I=\langle x_i^2-x_i\rangle.
```

Such terms can change the components those lemmas inspect. For example,

```math
(x_1^2-x_1)x_2\cdots x_k
```

vanishes on every Boolean input, but its multilinear monomial component is `−x₁⋯xₖ`. Therefore these component operations do not descend to equivalence modulo `I`.

There is an additional predicate distinction in the present task. Section 2.5 discusses Boolean computation of the Hamiltonian cycle polynomial over `F₂`. That output is the parity of the number of cycles. The containment predicate asks whether the number is positive. These predicates differ, so a parity result would still need a separate existence argument.

### The arithmetic diagonal contradiction

**Theorem K.6**, *nonexistence of small accelerators*, is formalized as `Paper.thm_noacc`; Appendix Q, Table 3, also lists `scales_setting`. Its proof ends by evaluating a program on itself and obtaining `V = 1 + V` in a nonzero finite field. Lemma K.4 (`Paper.lem_postpone`) supplies the weighted sum over exponent vectors used in that equality. Section 2.4 gives the same argument in outline.

A literal substitution of Boolean existence for the weighted sum changes the equation to `V = 1 ∨ V`. That equation has the solution `V = 1`, so that literal substitution loses the contradiction. This is a failed transfer of the specific last step. It is not a theorem excluding every Boolean diagonalization or every modification of the accelerator construction.

## 2. Multilinearization can hide arithmetic hardness inside easy predicates

Pavel Hrubeš, *On hardness of multilinearization, and VNP-completeness in characteristics two*, ECCC TR15-067, 2015-04-21.

- [Report page](https://eccc.weizmann.ac.il/report/2015/067/)
- [PDF version inspected](https://eccc.weizmann.ac.il/report/2015/067/download/)

The relevant numbered statements are:

- **Theorem 1, page 3:** over every field, there is a polynomial-time constructible monotone 2-CNF family whose unique multilinear extensions are VNP-hard. In characteristic other than two, the chosen extension family can be VNP-complete.
- **Corollary 2, page 3:** assuming VP differs from VNP, some polynomial family in VP has a multilinearization outside VP.
- **Proposition 3, pages 3–4:** a family of Boolean functions in P/poly has its multilinear extensions in VNP. This is not a VP membership statement.
- **Lemma 4, page 4:** the homogeneous components through degree `k` of a polynomial with arithmetic circuit complexity `s` can be computed simultaneously with `O(sk²)` arithmetic gates.

Theorem 1, combined with the arithmetic separation accepted under the repository's standing assumption, rules out a universal polynomial-cost passage from small Boolean circuits to arithmetic circuits for their canonical multilinear extensions. This is a consequence of imported results, not an advance of this research note. The IS-Hamiltonian-cycle example is a direct illustration of the same obstruction.

## 3. Directed Hamiltonicity and the uniformity conclusion

Richard M. Karp, *Reducibility Among Combinatorial Problems*, in *Complexity of Computer Computations*, Plenum Press, 1972, pages 85–103.

- [Original article scan](https://sites.cc.gatech.edu/classes/AY2010/cs6505_spring/lectures/karp.pdf)
- [Reprint with Karp's retrospective introduction](https://www.cs.umd.edu/~gasarch/BLOGPAPERS/Karp.pdf)

The **Main Theorem**, original page 94, declares the listed problems complete. **Item 9** is DIRECTED HAMILTON CIRCUIT. Its input is a digraph and its property is the existence of a directed cycle visiting each vertex exactly once. The reduction from NODE COVER appears on original page 98. **Theorem 3**, original page 93, gives the equivalence between polynomial-time solvability of a complete language and P = NP.

For this project, membership in NP also has a direct certificate: a cyclic ordering of the vertices, checked for distinctness and for all required arcs. No NP-completeness theorem is needed to deduce P ≠ NP once any language in NP is proved outside P. Completeness is useful for transferring the target to SAT and other NP-complete languages.

For clarity, the proposed nonuniform target is

```math
\mathrm{DHC}\notin\mathrm{P/poly}.
```

Because every polynomial-time Turing machine can be unrolled into polynomial-size circuits, this would imply DHC is outside P and hence P ≠ NP. A proof only of DHC outside P does not by itself establish DHC outside P/poly. Polynomial size in the vertex count and in the adjacency-matrix input length are equivalent because the latter is quadratic in the former.

Stephen Cook's [official Clay problem description](https://www.claymath.org/wp-content/uploads/2022/06/pvsnp.pdf), Section 1, specifies the deterministic polynomial-time machine model; Section 2, Definitions 3–4 and Proposition 1, gives polynomial-time many-one reductions and their consequences.

## 4. Prior work relevant to simultaneous cuts

Simone Bova, Florent Capelli, Stefan Mengel and Friedrich Slivovsky, *A Strongly Exponential Separation of DNNFs from CNF Formulas*, [arXiv:1411.1995v3](https://arxiv.org/pdf/1411.1995), 2015-02-19.

**Theorem 5, page 10**, constructs read-three monotone 2-CNFs whose DNNF size is exponential in their formula size. These formulas come from bounded-degree expanders. The proof uses large matchings across balanced variable cuts. **Corollary 4, page 11**, shows that negating a small DNNF can require an exponentially larger DNNF. Neither is a lower bound for unrestricted Boolean circuits: the CNFs themselves give linear-size Boolean circuits for these examples.

The expander-CNF cut construction is established prior methodology. The all-cut rank obstruction in this project should be presented as a proved elementary consequence or adaptation, with no novelty claim.

The same authors' [*Knowledge Compilation Meets Communication Complexity*](https://florent.capelli.me/publi/kc_meets_cc.pdf), IJCAI 2016, **Theorem 6**, converts a DNNF into a balanced rectangle cover bounded by its circuit size; determinism gives a disjoint cover. The decomposability condition at AND gates is explicit. This is a model-specific bridge and cannot be imported as an upper bound for arbitrary Boolean circuits with overlapping variable dependencies.

## 5. Openness and prior-result check

The [Clay Mathematics Institute P versus NP page](https://www.claymath.org/millennium/p-vs-np/) was checked on 2026-11-23 and labels the problem unsolved. The pinned Anthropic source also explicitly leaves Boolean P versus NP open.

The source check covered the user's two starting sources; the pinned formal definitions and theorem wrappers; Karp's completeness theorem; Cook's official problem statement; and primary expander-CNF and communication-complexity papers relevant to the proposed invariant. It found direct prior obstructions to canonical-multilinearization and all-cut-rank transfers. It did not establish that every possible invariant has been considered, that the chosen approach cannot be repaired, or that the auxiliary observations here are novel.

The unresolved theorem remains a superpolynomial lower bound for arbitrary AND/OR/NOT circuits computing directed Hamiltonian-cycle containment, or an independently valid uniform time lower bound. Source verification and finite tests do not establish that theorem.
