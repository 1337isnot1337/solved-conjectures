# Frankl’s union-closed sets conjecture — two classes of generating families

**The full conjecture remains open.** We prove the half-frequency bound when the ground set has a cyclic order in which each generator fits inside four consecutive positions. The number of positions is arbitrary. Generators may skip positions, vary from site to site, and overlap across the end of the order. The proof uses a finite list of local frequency certificates. [Proof, prior theorems and replay](PROOF.md) · [Background on Frankl’s conjecture](https://epubs.siam.org/doi/10.1137/25M180874X)

We also obtain a quantitative bound under a different hypothesis. If every generator has the same size $k\ge3$, each point is in exactly three generators, and the incidence graph has girth at least 16, then **every** point occurs in at least 51.8208% of the unions. For $k\ge15$, pairwise intersections of size at most one suffice for a 65.7% bound. [Proof](HIGH-GIRTH.md)

Run `python3 tree_messages.py` and `python3 message_audit.py` for the frequency bound. Run `python3 span_four.py` here with NumPy, SciPy and a C++20 compiler. It constructs the overlap graph and checks every claimed weight vector by explicitly enumerating the compatible unions. The proof is unrefereed; no priority claim is made.

**Lean status:** partial. Parts of the argument have been formalized; the full formalization remains incomplete. See the [authoritative checked scope and remaining gaps](../../docs/lean-status.md).
