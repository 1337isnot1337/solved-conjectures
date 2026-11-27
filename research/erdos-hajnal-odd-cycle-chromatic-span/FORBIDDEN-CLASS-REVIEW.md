# Independent review of two hereditary subresults

Both proofs in the [forbidden-graph classification](FORBIDDEN-GRAPH-CLASSIFICATION.md)
passed separate mathematical review. The reviewer independently
checked the two-cut coloring argument, the antichain proof of toughness,
the hypotheses of [Xu–Li–Zhou, Theorem 5](https://arxiv.org/pdf/2303.09741#page=3),
and the prescribed-endpoint results of
[Jedličková–Kratochvíl, §3.1](https://arxiv.org/html/2403.03668v1#S3.SS1).

For one edge plus three isolates, the reviewer checked all path
concatenations and the bridge argument when both components are
2-connected. An independent regression considered 258,560 choices
of small two-cut graphs; 18,366 satisfied minimum degree,
2-connectivity and the induced exclusion. All 86 vertex-critical
survivors had a spanning path by exact subset dynamic programming.
This finite regression is not used by the proof.

For a three-vertex path plus two isolates, the reviewer checked the
clique-branch decomposition, the lower bound on the diversity of
labels, the endpoint-preserving merges, and the two possible Hall
obstructions in full. The review handles singleton prescribed
endpoints and the case where the two prescribed vertices lie
at opposite ends of the same heavy path.

These are independently audited written proofs of the two stated
hereditary subresults. Neither class is asserted to resolve the
unrestricted Erdős–Hajnal Problem 640.

## Co-gem result

An independent audit passed the separator, module criticality,
compatible-splits count, and the extension by a universal vertex.
The audit confirmed the exact hypotheses of Qiuyu Chen's published
theorem and found no earlier exact path-perfectness assertion in
its separate literature search. No Lean verification was run.
The exact proof reviewed was commit
`efb017f7841c7f8778c852b875e169426822797e`.
