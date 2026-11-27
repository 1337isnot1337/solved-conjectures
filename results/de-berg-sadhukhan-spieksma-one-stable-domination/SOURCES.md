# Sources and scope audit

The target is the entire question in §5 of Mark de Berg,
Arpan Sadhukhan and Frits Spieksma, *Stable Approximation
Algorithms for Dominating Set and Independent Set*:
[author manuscript, conclusion](https://arxiv.org/html/2412.13358v1#S5),
[conference proceedings, conclusion](https://drops.dagstuhl.de/storage/00lipics/lipics-vol275-approx-random2023/LIPIcs.APPROX-RANDOM.2023.27/LIPIcs.APPROX-RANDOM.2023.27.pdf),
[journal version](https://doi.org/10.1137/24M1644079).
[Sadhukhan’s thesis, Chapter 8, p. 151](https://pure.tue.nl/ws/portalfiles/portal/349450979/20250131_Sadhukhan_hf.pdf#page=162)
poses it again. The paper proves a one-change quadratic
approximation and a three-change linear approximation. Its
other open question about stable approximation schemes for
graphs of maximum degree three is separate and is not
claimed here.

The comparator is the unrestricted minimum dominating set
of each revealed graph. Arrival degree counts only earlier
neighbors, which is not the same as maximum degree of that
graph. The order is supplied by the adversary and unknown
ahead of time. An unselected earlier vertex may be selected
on any arrival. In particular the proof uses no access to
edges that have not yet been revealed.

## Prior-work audit

* [Boyar et al., *Online Dominating Set*, Algorithmica
  (2019)](https://www.imada.sdu.dk/u/kslarsen/Papers/Resources/BEFKL19j/paper.pdf)
  consider the same late-accept model with irrevocable
  selections, but their general degree-based guarantee
  (Proposition 6) is in final maximum degree. Their tree,
  planar and always-connected results do not imply this
  arrival-degree bound on arbitrary input streams.
* [Kobayashi, *Improved Bounds for Online Dominating Sets of
  Trees* (2017)](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ISAAC.2017.52)
  treats trees and chiefly the competitive comparison to an
  optimal incremental sequence, not this class or its
  unrestricted pointwise comparator.
* [Harutyunyan et al., *Online Domination: The Value of
  Getting to Know All Your Neighbors* (2021)](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.MFCS.2021.57)
  uses a different revelation model with future neighbors
  visible, and its degree bounds concern maximum degree.
* [*Incremental Dominating Set* (2026)](https://drops.dagstuhl.de/storage/00lipics/lipics-vol392-approx-random2026/html/LIPIcs.APPROX-RANDOM.2026.5/LIPIcs.APPROX-RANDOM.2026.5.html)
  distinguishes graph-neighborhood information and compares
  with an optimum incremental solution. Its degree parameter
  is maximum graph degree; it does not supply the bound
  for earlier neighbors against the unrestricted optimum.
* [Bosek et al., *Dynamic domination and independence in
  sparse graphs* (2026)](https://arxiv.org/abs/2607.22384)
  concerns edge updates and data-structure update time,
  including a degeneracy-based size approximation. It does
  not bound the number of changed solution vertices per
  arrival as in the target.

Searches on 2026-11-27 checked the exact open-question
wording, the paper title, author combinations, its DOI,
“arrival degree” with “1-stable”, relevant 2016–2026
forward citations and works on recourse, and synonyms
“one change”, “late acceptance”, “incremental”, “frequency
greedy”, and “online hitting set”. I did not find an earlier
proof of the requested result. The original source supplies
the model and linear lower bound; the maximum-counter
algorithm and incidence-budget proof are the contribution
here.
