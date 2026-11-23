# Quantitative decision lower bound for the permanent graph

Status: complete written derivation from two imported results, with three completed internal adversarial reviews. This is a consequence of existing theorems, not a newly solved named conjecture. No Lean formalization of this deduction is claimed.

There are constants $`b>0`$ and $`m_1`$ such that, for every $`m\ge m_1`$, any deterministic complex algebraic computation tree deciding

```math
G_m=\{(X,y)\in\mathbb C^{m^2+1}:y=\mathop{\mathrm{per}}_m(X)\}
```

requires at least $`2^{b(\log_2 m)^{4/3}}`$ operations in the worst case. Each field addition, subtraction, multiplication, defined division, and equality branch costs one. Arbitrary complex constants are allowed, including different constants for different matrix sizes.

The proof obtains the explicit comparison

```math
\overline S(\mathop{\mathrm{per}}_m)
\le K m^2\log_2(m+1)(T+1),
```

where $`T`$ is the decision-tree cost and $`\overline S`$ uses the pinned Anthropic paper's convention of counting input, constant, addition, and multiplication gates. Its border lower bound therefore retains the exponent $`4/3`$ after the transfer. A separate elementary estimate with loss $`K m^{10}(T+1)`$ follows directly from the general factor theorem and also suffices.

The same obstruction applies to a uniform BSS machine with any fixed finite list of complex constants. Fixing the input length and unrolling its computation changes path length by at most a machine-dependent constant factor. The union of these graph problems is consequently outside $`\mathsf P_{\mathbb C}`$.

- [Full proof and model definitions](PROOF.md).
- [Sources, exact versions, and scope of the audit](SOURCES.md).
- [Adversarial review and validation record](REVIEW.md).
- [Tracking issue #247](https://github.com/1337isnot1337/solved-conjectures/issues/247).
- [Separate P_C versus NP_C campaign, issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

The graph's membership in $`\mathsf{NP}_{\mathbb C}`$ or a fixed level of the uniform complex polynomial hierarchy is a separate unresolved implication in that campaign. This note does not prove a lower bound for Hilbert's Nullstellensatz feasibility or separate $`\mathsf P_{\mathbb C}`$ from $`\mathsf{NP}_{\mathbb C}`$.
