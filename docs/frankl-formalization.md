# Frankl generating-family formalization

Work is coordinated in [issue 19](https://github.com/1337isnot1337/solved-conjectures/issues/19).
The original cyclic span-four theorem and both frequency bounds remain incomplete.
Li remains deferred until the other results are fully verified.

## Checked components

The following sources passed local strict compilation and all four hosted
component gates at `57d699c770471fc898850079bde384a269da5d4f`. Their exact import
closures passed source compilation, the transitive axiom whitelist, and pinned
kernel replay. They are registered in the accepted roots and full-package gate.
The complete mathematical results remain incomplete.

| Component | Exact scope |
| --- | --- |
| `FranklFamily` | Distinct generated unions, union closure, and interior/exterior trace reconstruction |
| `FranklLocalFibers` | Equality of every occurring exterior fiber with the local boundary family `C(E,M)` |
| `FranklLocalWeights` | Nonnegative weighted local certificates imply an abundant ground point in the actual distinct-union family |
| `FranklIncidence` | Explicit inverse bijections between generated unions and maximal independent sets in the actual incidence graph; exact point-absence correspondence |
| `FranklArithmetic` | The all-`k ≥ 15` local-lemma numerical criterion, the avoidance bound, and the exact `343/1000` absence factor |
| `FranklLopsided` | The lopsided local lemma for every finite conditioning set, plus the query bound, stated as exact cardinal inequalities over ordered scalars |

The arithmetic component does not assume that a generating family satisfies
the conditional-event hypotheses. Deriving those hypotheses is separate work.

## Remaining obligations

For the large-generator theorem, the remaining work is the Harris inequality
on the actual bit slices, exact
local event counts, incidence-degree bounds, and the final transfer from
canonical selections to the uniform distribution on distinct unions.

For the degree-three through degree-fourteen cases, the remaining work is
tree message counting, cone propagation, complete integer certificates,
mixed-child root bounds, and conditioning on the exterior of the radius-seven
tree in the actual finite incidence graph.

For the cyclic span-four theorem, the remaining work includes all finite
window certificates and graph reductions, their cyclic-word semantics, the
small-ground case, and the repeated-triple theorem used by the written proof.
No published theorem is silently treated as an axiom.


## Candidate source packet

The next packet contains the full `k ≥ 15` endpoint in
`FranklLargeTheorem.lean`, supported by actual incidence, canonical-selection,
Harris-slice, query-independence, and exact-cardinality sources. These additions
remain outside the accepted roots until their complete gates pass. The endpoint
has the original size, regularity, and pairwise-intersection hypotheses; it does
not assume the desired event probabilities or conditioning inequalities.

The tree packet proves the three-state finite counting identities, conic
propagation, all mixed-child root bounds, and integer-witness checker soundness.
Its first generated degree-three certificate is included as a separate gated
component. Other degree certificates are prepared locally. The actual finite
graph/girth/boundary-conditioning bridge is still a separate obligation.
