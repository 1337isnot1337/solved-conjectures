# Seven-coordinate critical-plane candidates

These files are unregistered candidates. The finite enumeration,
plane-normalization, and tangent gates have passed source, axiom, and independent kernel checks.
The other gates remain incomplete. They use the existing exact-closure gate in
five independent tasks. The accepted root imports are unchanged.

The geometric normalization retains two explicit mathematical premises:
the five-speed runner bound and the classification of primitive positive
six-element lists with loneliness value at most `1/7`. Neither premise is
asserted as an axiom. The tangent theorem needs neither classification
premise: it works in an actual rational plane containing the canonical
direction and another integer direction with coordinates bounded by six.

| Task | Statement to be checked |
| --- | --- |
| `critical-seven-plane` | A low-value rational plane has two primitive signed repeat directions and admits an actual signed-coordinate normalization with first vector `(1,2,3,4,5,6,k)`. |
| `critical-seven-tangent` | At each unaffected complementary pair, the second direction has proportional coordinates. A failed relation gives an explicit rational point of clearance at least `229/1596 > 1/7`. |
| `critical-seven-finite` | The tangent equations and coordinate bounds put the second vector into one of 24 blocks of 1,728 finite codes. The literal repeat-line tests then force a six-coordinate product form. |
| `critical-seven-bridge` | Literal low-plane geometry implies the finite predicates; a product form gives the standard rational product plane after a coordinate swap. |
| `critical-seven-assembly` | With the five-speed lower bound and primitive six-speed classification as explicit inputs, the literal rational planes of dimension two and value `1/7` are exactly the signed coordinate permutations of the standard product plane. The converse value is unconditional. |

The finite tests use `decide +kernel`. The original monolithic check exceeded
the kernel memory budget. Each of the 24 source blocks now uses twelve
Boolean subchecks, each covering 144 assignments. Their separately proved
interpretation recovers the same universal statement over all 1,728 codes.
The Boolean interpretation, finite definitions, and coverage reduction have
passed strict local source compilation. At `3f6ee74`, all 24 numerical source
blocks and their aggregate compiled in the assembly job. The separate finite
gate then passed its entire 29-module source, axiom, and independent-kernel
closure. This proves the stated conditional finite implication for all 41,472
codes; the separate geometric assembly still needs its own completed check.

These tests do not import a native search result or trust a producer.
The reduction includes a surjectivity proof
for the twelve integer codes and an explicit representation theorem for
every vector satisfying the necessary equations. The separate geometric
bridges and final composition are source candidates and must pass their
gates too. The full critical-plane theorem remains unfinished until the
lower-dimensional premises are discharged and all five gates are complete.

At `3f6ee74`, the plane-normalization closure passed all 39 project modules
and audited 666 theorems. The tangent closure passed 12 modules and audited
203 theorems. The finite enumeration passed all 29 modules. All three
completed stock-kernel replay with unchanged sources in
[run 44468683714](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44468683714).
The exact job identifiers and checks are stored in
[the component receipt](loneliness-3f6-component-receipts.json).

The related large-norm reduction and its complete-list product-family
consequence have separate candidate gates described in
[the final extension guide](loneliness-final-extension-candidates.md).

Inspect one exact closure:

```sh
python3 scripts/verify_loneliness_critical_seven.py critical-seven-finite --plan
```

Rebuild, audit all owned theorem axioms, and replay that closure:

```sh
python3 scripts/verify_loneliness_critical_seven.py critical-seven-finite
```
