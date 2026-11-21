# Amdeberhan–Moll's conjecture: excluded prior resolution

Status: **already disproved; no new result and no new-resolution count**. Date: 2026-11-21 UTC. [Issue #203](https://github.com/1337isnot1337/solved-conjectures/issues/203) was a duplicate research reservation and is closed for this reason.

The target was Conjecture 21 of Tewodros Amdeberhan and Victor H. Moll, [*Infinite log-convexity*](https://combinatorialpress.com/article/ojac/vol17/305.pdf): absolute coefficient sequences of all graph chromatic polynomials are infinitely log-concave. The same statement appeared earlier as Amdeberhan's Conjecture 13.1.

The prior public [mxym/math proof](https://github.com/mxym/math/blob/main/notes/chromatic-infinite-logconcavity-counterexample/cycle_counterexample_proof.md), dated 8 October 2026, was read in full. It gives the cycle $`C_{17}`$ with

```math
\bigl(\mathcal L^3(a)\bigr)_2=-28272276537344,
```

where $`a`$ is the absolute coefficient sequence of $`\chi_{C_{17}}`$. It also gives a symbolic obstruction for every cycle of length at least 17, a smaller fifth-iterate witness for $`C_{12}`$, and the complete classification for cycles. Its isolated-vertex shift handles the alternative convention that discards endpoints after each iterate. These are full counterexamples to the exact target; no reinterpretation or special-family restriction restores eligibility.

The later [cycle classification release](https://github.com/mxym/math/blob/main/preprints/lean-certified-2026-10/cycle-chromatic-classification/README.md) links [Zenodo 23249722](https://doi.org/10.5281/zenodo.23249722) and pins proof-source commit `02af7db99db789fecb0d5f5f8f37b1a4e40762a0`. Only the ordinary readable proof was used for this exclusion; no Lean verification was performed.

The initial reservation was a process error: the two-engine search and local repository text search missed the external archive, despite that archive having been checked earlier in the campaign. Root caught the duplicate before further work. Future reservations must include direct checks of the current public archive indexes, not rely on search-engine recall.

The exploratory `chromatic_probe.py` derives the exact generalized-theta chromatic polynomial by conditioning on the common endpoints' colors. Its 3,000-case run completed before the exclusion notice and produced no negative iterate; `theta-results.jsonl` preserves that research provenance. It is not a resolution, and no further computation on this already-resolved conjecture is planned.
