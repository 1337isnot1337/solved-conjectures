# Sources, scope and attribution

The exact question is the first domination question in §5
of Mark de Berg, Arpan Sadhukhan and Frits Spieksma,
*Stable Approximation Algorithms for Dominating Set and
Independent Set*:
[author manuscript](https://arxiv.org/html/2412.13358v1#S5),
[original proceedings](https://drops.dagstuhl.de/storage/00lipics/lipics-vol275-approx-random2023/LIPIcs.APPROX-RANDOM.2023.27/LIPIcs.APPROX-RANDOM.2023.27.pdf),
[journal version, p. 944](https://fspieksma.win.tue.nl/papers/SIDMA2025paper.pdf),
[DOI](https://doi.org/10.1137/24M1644079).
It asks whether a stable approximation scheme exists
for Dominating Set at maximum degree three.
[Sadhukhan’s thesis, Chapter 8, p. 151](https://pure.tue.nl/ws/portalfiles/portal/349450979/20250131_Sadhukhan_hf.pdf#page=162)
repeats it. The paper's Theorem 3.5 gives a linear
recourse lower bound at a fixed relative error with
maximum degree four; the present proof uses that
theorem, not an offline complexity assumption.

## Earlier gadget and what is new

The fixed-graph four-vertex stretching operation is
**prior work**, not claimed here. [Korobitsyn’s 1990
paper](https://www.mathnet.ru/eng/dm871)
([English DOI](https://doi.org/10.1515/dma.1992.2.2.191))
is credited for its unit change in domination number.
The operation and the degree reduction are explicitly
described by [Alekseev, Boliac, Korobitsyn and Lozin,
§4.1.1, Fig. 2](https://wrap.warwick.ac.uk/id/eprint/30810/).

The argument here gives an online port assignment with
no rewiring, an exact local projection that does not
amplify one membership change, and a comparison valid
at every completed prefix. These let the static
gadget transfer the recourse obstruction. The general
longer path handles every fixed degree in one operation,
and the separate local block rule proves the positive
side at degree at most two. No novelty is claimed for
the standalone offline four-vertex gadget, offline
hardness of subcubic domination, or the authors’ original
degree-four lower bound.

## Prior-resolution screening

Searches on 2026-11-27 covered the exact question, its
conclusion and theorem number, the journal DOI and
author/title combinations, “subcubic”, “degree-3”,
“bounded recourse”, “vertex arrival”, “stable
approximation scheme”, and “vertex stretching” under
different combinations. They yielded the original
open question, offline NP-hardness and approximation
work, and results that count computation time instead
of changed memberships.

* [Chlebík and Chlebíková, *Approximation hardness of
  dominating set problems in bounded degree graphs*](https://doi.org/10.1016/j.ic.2008.07.003)
  prove offline hardness. The vertex-arrival stability
  question allows unlimited computation and is not
  resolved by that hardness.
* [*Incremental Dominating Set* (2026)](https://drops.dagstuhl.de/storage/00lipics/lipics-vol392-approx-random2026/html/LIPIcs.APPROX-RANDOM.2026.5/LIPIcs.APPROX-RANDOM.2026.5.html)
  considers irrevocable choices and a different optimum.
  Lower bounds against that setting do not by themselves
  exclude schemes that both add and remove old vertices.
* [Bosek et al., *Dynamic domination and independence in
  sparse graphs* (2026)](https://arxiv.org/abs/2607.22384)
  measure dynamic data-structure update time, not stable
  solution size and per-arrival recourse.

No earlier solution of the dynamic question was found.
This is separate from the one-stable linear-in-arrival-degree
result in issue #995.

The original paper's [Corollary 2.2(ii)](https://arxiv.org/html/2412.13358v1#S2.Corollarytheorem2)
already implies the existence of a scheme for degree at most two
via constant-size separators. The direct block proof yields an
explicit linear bound in the inverse error tolerance, and the
supplement proves its sharpness. The open direction resolved here
is the absence of a stable scheme for degree three.
