# Supplemental public-repository prior-art audit

Research date: 20 November 2026 (America/Chicago). This supplements the primary-paper audits for the proposed Pula–Song–Wanless threshold proof and the general permanental-compound approximation theorem. It does not replace them or establish exhaustive priority.

## Searches performed

The GitHub connector was searched globally for combinations of the exact author names, the full DOI `10.1016/j.laa.2010.08.015`, `permanental compounds`, `approximation`, `FPRAS`, `Perron`, `spectral`, `zeon`, and cohesive-face terminology. More specific combined queries were also scoped to these public proof archives:

- https://github.com/PrincipiaMathOrg/math-solutions
- https://github.com/KnowledgeSense/math
- https://github.com/qqliu/CoPEER
- https://github.com/the-omega-institute/trureturing
- https://github.com/pudim-project/pudim-ai-demo-zetalaw

The scoped combined searches `permanental compounds`, `permanental Perron`, `cohesive permanent`, and `Pula Wanless` returned no matching files. Broad substring queries returned many unrelated results and sometimes reached the requested result limit. Those capped outputs are not negative evidence about the unreturned files. The entire contents of these five archives were not exhaustively downloaded or audited.

The global full-DOI query returned the present campaign and a separate Dittert repository. The more specific compound-plus-approximation query returned the present campaign, a structured-matrix paper, and a banded-Toeplitz paper. No matching full-domain theorem was identified in the returned statements. Repository search indexes may omit files or lag current branches.

## Closest full bodies inspected

### Repeated-support reduction

The complete mathematical explanation at

https://github.com/JD-Jones-ASES/dr-lean/blob/21c7b8399c1c7d010fde951052479f91d80e62a6/docs/TWO_ZERO_REDUCTION.md

describes the reduction for a face with two independent zeros. Its reduction averages identical-support rows and columns at a selected minimizer. It cites Pula–Song–Wanless for that classical reduction. It does not claim the general identity-block threshold. Only the mathematical documentation was read; no Lean verification was performed.

### Dittert and sub-Dittert work

The complete source notes and mathematical manuscript were read at:

- https://github.com/pedromnasc/dittert-conjecture-proof/blob/894066bbaa715138c98bf3cb7c6fdb4f39a37701/subdittert/SOURCE_NOTES.md
- https://github.com/pedromnasc/dittert-conjecture-proof/blob/894066bbaa715138c98bf3cb7c6fdb4f39a37701/subdittert/subdittert_scaling_reduction.tex

They treat a sub-Dittert scaling reduction, a subset-deficit estimate, and lifts to faces with two independent zeros or a zero block plus one additional zero. The later face-floor calculations are explicitly dimension-limited, and the conversion into sub-Dittert results retains a stated structural hypothesis. The PSW citation supplies repeated-support averaging; it is not a claim of the unrestricted PSW threshold. None of this previously public work is counted as new here.

### An unrelated use of the initials PSW

The complete problem record

https://github.com/the-omega-institute/trureturing/blob/85b19f399cf7938ad13a621780ed1339a2c92915/Problems/psw-all-split-permanental-inequality.md

concerns **Pan–Skandera–Wang**, not Pula–Song–Wanless. Its statement compares products of principal permanents for totally nonnegative matrices and all initial splits. It does not concern doubly stochastic identity-block faces or the threshold `n=m+sqrt(m)`. No verification work was performed on its formal code.

### Weighted Boolean inclusion operators

The title, main theorem, scope discussion and relevant terms in

https://github.com/GeWoHu/Weighted-Johnson-Inequality/blob/b11de825d2e6fe602c6660ffda9c2aa21ac3c2a6/paper/weighted-johnson.tex

were inspected. The November 2026 manuscript gives a sharp norm bound for a weighted Boolean inclusion operator. Its references mention zeon algebra and an FPRAS for matroid bases. It does not state an FPRAS for arbitrary permanental-compound Perron roots. Its full proof was not independently audited, since it is not used by the candidate theorem.

## Conclusion and limits

These supplemental searches found no earlier full PSW threshold proof or general nonnegative-rational compound Perron FPRAS. That is a bounded search result. Capped queries, substring false positives, inaccessible primary articles and incomplete indexing prevent an unconditional assertion of worldwide priority. The existing result packages retain their status as complete proposed proofs with internal review and explicit source-access limits.
