# Frankl’s union-closed sets conjecture — two classes of generating families

**The full conjecture remains open.** We prove the half-frequency bound when the ground set has a cyclic order in which each generator fits inside four consecutive positions. The number of positions is arbitrary. Generators may skip positions, vary from site to site, and overlap across the end of the order. The proof uses a finite list of local frequency certificates. [Proof, prior theorems and replay](PROOF.md) · [Background on Frankl’s conjecture](https://epubs.siam.org/doi/10.1137/25M180874X)

We also obtain a quantitative bound under a different hypothesis. If every generator has the same size $k\ge3$, each point is in exactly three generators, and the incidence graph has girth at least 16, then **every** point occurs in at least 51.8208% of the unions. For $k\ge15$, pairwise intersections of size at most one suffice for a 65.7% bound. [Proof](HIGH-GIRTH.md)

Run `python3 tree_messages.py` and `python3 message_audit.py` for the frequency bound. Run `python3 span_four.py` here with NumPy, SciPy and a C++20 compiler. It constructs the overlap graph and checks every claimed weight vector by explicitly enumerating the compatible unions. The proof is unrefereed; no priority claim is made.

**Lean status:** partial. Parts of the argument have been formalized; the full formalization remains incomplete. See the [authoritative checked scope and remaining gaps](../../docs/lean-status.md).

The integer local checker and its maximal-cover equivalent have passed strict Lean source checks, the axiom audit, and independent kernel replay. These theorems establish checker semantics and soundness. The finite window weight tables remain a separate obligation. [Checker scope and reproduction](../../docs/frankl-fc-formalization.md#local-maximal-cover-checker)

The full Vaughan shortcut and all cyclic span-four families on at most six sites are now checked in Lean. The period-seven-through-ten residual results retain an explicit graph-membership hypothesis. The remaining window and graph data are required for the complete span-four theorem. [Exact checked packet](../../docs/verification/frankl-fc-packet-6544adcc.json)

The exact mask checker and finite-domain constructor are also checked and registered. They support literal short-cycle generator masks. Their [hosted receipt](../../docs/verification/frankl-mask-domains-a632fc82.json) records the ten-module gate. The [reproduced candidate rows](width_four_weight_candidates.json) and [independent literal replay](replay_small_cyclic_weight_candidates.py) remain candidate-data evidence until their full Lean batches pass.

The Lean packet also includes the conditional all-period span-four
assembly, a 48-case short-period weight pilot, and exact injective transport.
The complete finite tables remain pending. The
[orbit scope](../../docs/frankl-cyclic-weight-orbits.md) distinguishes checked
generic theorems from candidate data; the
[formalization status](../../docs/lean-status.md#frankl-cyclic-assembly-and-weight-helpers--19-november-2026)
records all five hosted receipts.
