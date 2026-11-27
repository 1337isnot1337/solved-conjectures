# Independent mathematical review

On 27 November 2026 an internal reviewer working with WadeDavis independently checked Cinna Davis’s reduction against the primary sources. The original question and the two consistency theorems apply to the graph classes used in the argument. Both answers are relative to the consistency of ZFC. The argument is a reviewed written proof. There is no Lean formalization or external referee report. [Review on the author’s PR](https://github.com/1337isnot1337/solved-conjectures/pull/1039#issuecomment-7222248640) · [Written proof](PROOF.md)

## The reduction in ZFC

An uncountable set of vertices with infinitely many neighbors in a fixed countable set supplies precisely the Shelah subgraph in Definition 6.4. In a graph avoiding that subgraph, the exceptional vertices for each countable initial segment are therefore bounded. Take a club closed under the function assigning these bounds. Choose at most one vertex from each club interval for each slot, preserving all edges between vertices in the same slot.

For a vertex at index ξ, the closure condition gives finitely many neighbors below every strictly earlier index. At a successor index the immediately preceding interval contributes at most one vertex to that slot. At a limit index, infinitely many lower neighbors must form an increasing sequence of order type omega cofinal in ξ. Isolated vertices at unfilled indices preserve this ordering and the coloring. Giving each vertex its slot number and its color inside the slot produces a countable coloring of the original graph if every slot can be colored countably. Conversely a countable set is bounded, so every sufficiently late vertex in a Hajnal–Máté-type graph has only finitely many neighbors in it. This proves the equivalence. [Club decomposition](PROOF.md)

Passing to the club endpoints gives the stationary-set refinement because their continuous cofinal enumeration preserves stationarity. At a successor cardinal, every club interval has size at most the predecessor cardinal. This gives enough slots and enough colors for the claimed generalization. [Structural consequences](CONSEQUENCES.md)

## Models and attribution

Erdős, Galvin and Hajnal state Problem 4 and exhibit a positive example in the constructible universe. They also credit Hajnal and Máté for the positive construction. Section 2 of Avraham, Devlin and Shelah uses the finite-or-cofinal lower-neighborhood definition. Their principle SAD includes GCH, entails countable colorability for this class, and has a relative consistency proof in their section 3. Their introduction credits Avraham and Shelah’s circulated 1975 notes for an earlier form of the Hajnal–Máté consistency theorem. The reviewer identified those notes from this historical account. The published 1978 theorem suffices here. [Original question and positive model](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=26) · [Negative model and its history](https://shelah.logic.at/files/95244/81.pdf#page=2)

The bounded source search located the earlier model theorems and the club-closure technique in the literature. The coloring-number characterization of Bowler, Carmesin, Komjáth and Reiher gives an obstruction subgraph. Here the slot conclusion preserves uncountable chromatic number in an induced subgraph. No earlier explicit resolution of this exact avoidance question was found in the sources inspected. [Source and priority audit](PRIOR-ART.md) · [Coloring-number theorem](https://arxiv.org/abs/1512.02911)

## Finite replay

Run the following from this result directory.

```sh
python3 verify_slots.py
```

The checker exhausts labeled graphs on one through five vertices, every contiguous interval partition, and two choices of interval enumeration. In all 33,866 cases it checks coverage by the slots and tests the reconstructed coloring on every edge. Four separate star examples give the center 2, 3, 8 or 32 neighbors in the immediately preceding interval and exactly one in its own slot. The transfinite and model-theoretic steps are checked in the written review above. [Replay script](verify_slots.py)
