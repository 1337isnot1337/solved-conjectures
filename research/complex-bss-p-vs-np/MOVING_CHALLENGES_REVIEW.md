# Independent review of moving finite algebraic challenges

Reviewed 23 November 2026 by the all-multiples worker. This is a mathematical review of `MOVING_ALGEBRAIC_CHALLENGES.md`, Sections 1–5, against the stated actual-component form of the block-KKT theorem. It is not a formal verification.

The component argument is valid under the stated generic admissibility assumption. Over the specified finite étale open, a fiber has exactly delta distinct points. Delta pairwise distinct root slots therefore enumerate the whole fiber. Adding that open condition to the expanded zero set gives an open subset of that zero set; its closure is a union of actual irreducible components. Soundness puts every point of its projected image on the graph, and the dense set of admissible true inputs makes one component dominate the graph. Neither an equation for the discriminant open nor a small circuit listing all roots is used in the retained incidence. The open conditions only select an actual local component, as required by the cited block-KKT statement.

For a bounded-time BSS body, there are finitely many full choices of accepting paths across the finite array. One choice has dense graph image. Each chosen path contributes only its own block variables and shared variables. A generic point avoids the selected nonzero-test hypersurfaces, so replacing the path conditions by their local equalities preserves the component argument. This does not assert a uniform bound on the number of full path choices.

Both counterexamples are exact. For `Q(y,z)=z(z-y)`, the complete universal predicate holds precisely at `y=0`, whereas the two-slot incidence with both roots chosen zero has the whole parameter line as its image and has no graph component. Requiring distinct slots excludes all correct inputs, so the omitted generic admissibility hypothesis cannot be recovered from this example.

For the moving-hole formula

```math
y\bigl((z^2-x)u-1\bigr)=0,
```

every nonzero output has a bad complex challenge satisfying `z^2=x`; output zero accepts every challenge. A bounded-time deterministic BSS sampler produces rational functions on an ambient generic branch. No such rational function squares to the input variable `x`, since the valuation at the irreducible polynomial `x` is even on a square and equals one on `x`. This remains true over the full constant field `C`. Hence any finite sampled list misses every bad challenge on a nonempty open set. The argument concerns rational sampling and leaves algebraic moving challenges available, exactly as the note states.

No correction was identified. The conclusion remains conditional on dense correct instances admitting successful shared witnesses inside the specified finite étale open, and it does not establish a reduction of an arbitrary continuous universal prefix to such a family.

The later root-escape addition also checks. For `Q(y,z)=z(yz-1)`, its two components are disjoint; the derivative in `z` equals `-1` on `z=0` and `1` on `yz=1`. Thus the projection is étale and quasifinite, but its second component maps isomorphically onto the punctured parameter line, so it is not finite or proper. The universal predicate requiring `z=0` holds exactly at `y=0`. The root `1/y` escapes to infinity there, and two unconstrained existential slots can repeat zero for every parameter. This supports the stated finite-cover hypothesis and does not change the proof in Sections 1–2.
