# Permanent graph ingredient and independent audit

The canonical self-contained graph proof is maintained by the concurrent [campaign #247](https://github.com/1337isnot1337/solved-conjectures/issues/247), in [PR #249](https://github.com/1337isnot1337/solved-conjectures/pull/249). The inspected version is [PROOF.md at commit 48dba406](https://github.com/1337isnot1337/solved-conjectures/blob/48dba40656bcd9a59efbcb3f512ab8516900bded/research/bss-permanent-graph/PROOF.md). This folder uses that shared ingredient rather than claiming another result from the same theorem combination.

## Statement used here

Relative to the pinned Anthropic border lower bound, every deterministic algebraic computation tree over C deciding

```math
G_m=\{(X,y):y=\mathop{\mathrm{per}}_m(X)\}
```

requires depth at least

```math
\exp\!\bigl(\eta(\log m)^{4/3}\bigr)
```

for one eta positive and every sufficiently large m. All arithmetic, defined division and equality tests are charged; arbitrary complex constants are allowed. The statement covers the trees obtained by unrolling a uniform BSS decider with its fixed finite tuple of complex constants.

## Mechanism and exact losses

Let g_m=y-per_m(X). The graph is an irreducible hypersurface, because C[X,y]/(g_m) is C[X]. Lemma 2 of the canonical proof follows a graph-generic accepting path. An informative equality numerator P is nonzero in the ambient polynomial ring and vanishes on the graph. Hence g_m divides P. Otherwise that accepting path would contain an ambient open subset and incorrectly accept points off the graph.

Representing each rational register as a pair of polynomial circuits handles division with at most four arithmetic operations per instruction. Denominators and every actual divisor remain nonzero on the retained generic subset. The result is

```math
\mathop{\mathrm{EC}}(g_m)\le4T+3.
```

Bürgisser's arXiv:1812.06828v1, Remark 1.4(1) and Corollary 1.5 give the graph-specific approximation bound. Translating from straight-line operations to the pinned source's counted input/constant/arithmetic gates yields

```math
\overline S(\mathop{\mathrm{per}}_m)
\le K m^2\log(m+1)(T+1).
```

An independent route using only Theorem 1.3, schoolbook polynomial multiplication and ordinary matrix multiplication gives

```math
\overline S(\mathop{\mathrm{per}}_m)
\le K' m^{10}(T+1).
```

Both losses subtract only O(log m) from the logarithm of the imported lower bound. Neither depends on the degree of P or the multiplicity of g_m in P.

## Independent audit in campaign #248

Before locating the concurrent graph campaign, our graph worker independently wrote a complete generic-cell proof, checked the numerator/denominator conversion and derived the m^10 fallback. Root checked that derivation. We then inspected the canonical proof and reconciled the bounds. The two proofs agree on the needed conclusion; the canonical graph-specific estimate is sharper.

We checked the mapping from the written Theorem N.5 to `Statement.MainTheoremApprox` and `Solution.mainTheoremApprox`, and checked that C(epsilon) embeds in the allowed Laurent-series constant field. This project did not rebuild the upstream formalization, and this independent written audit is not a new Lean verification. The imported result and provenance are recorded in [SOURCE_AUDIT.md](SOURCE_AUDIT.md).

The result is a consequence of existing theorems. It gives G outside P_C. It supplies no membership of G in NP_C or a fixed hierarchy level. Those missing upper bounds, or a different NP incidence reduction, remain the target of [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).
