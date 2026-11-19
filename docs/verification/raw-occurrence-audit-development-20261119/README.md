# Raw declaration audit development checks

The new audit helper preserves every owned serialized declaration occurrence. It
loads complete private data through a legacy audit root, indexes differing raw
copies in all imported modules, and checks their reachable dependency graph.
Every body in a reached family with differing theorem proofs receives a checked
kernel call at trust level zero, including the selected body.

The 24-module Frankl development audit passed. It covered 536 raw occurrences,
533 owned declarations, 100 private declarations, and a closed dependency graph
with 10,972 nodes and 179,041 edges. It scanned 2,878 imported modules and 277,713
serialized constants. Both bodies of the differing equation theorem passed
explicit kernel checks. All 144 source/object inputs remained unchanged.

Seven real Lean fixtures passed: a safe pair of distinct proofs; rejection of
an unapproved axiom in either owned proof order; rejection through either order
of a foreign helper's duplicate proofs; a legacy module; and a mixed modern and
legacy closure. The safe pair also imports an unused foreign bad theorem, which
remains outside the dependency graph. Four negative fixtures run the unchanged
raw-graph command before the base command so an earlier base rejection cannot
mask missing raw-body extraction.

A separate legacy fixture passed with the base recursion/heartbeat overrides
removed and a dotless ownership prefix. The kernel's deliberately ill-typed
negative control was rejected. The 69 raw-protocol and 45 composition-protocol
tests passed.

The full 1,100-module Frankl audit with this revised helper remains pending.
These development checks do not register or accept the final theorem. The
archive contains exact sources, objects, logs, inventories, input hashes,
resource profiles, and the frozen controller/helper bytes for these checks.
