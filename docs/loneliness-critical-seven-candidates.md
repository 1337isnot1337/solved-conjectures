# Seven-coordinate critical-plane candidates

These files are unregistered candidates. No source, axiom, or kernel pass
has yet been claimed for them. They use the existing exact-closure gate in
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

The finite tests use `decide +kernel`. They do not import a native search
result or trust a producer. The reduction includes a surjectivity proof
for the twelve integer codes and an explicit representation theorem for
every vector satisfying the necessary equations. The separate geometric
bridges and final composition are source candidates and must pass their
gates too. The full critical-plane theorem remains unfinished until the
lower-dimensional premises are discharged and all five gates are complete.

Inspect one exact closure:

```sh
python3 scripts/verify_loneliness_critical_seven.py critical-seven-finite --plan
```

Rebuild, audit all owned theorem axioms, and replay that closure:

```sh
python3 scripts/verify_loneliness_critical_seven.py critical-seven-finite
```
