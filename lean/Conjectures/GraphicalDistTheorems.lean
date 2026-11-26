import Conjectures.GraphicalDistPolynomial
import Conjectures.GraphicalDistMixture
import Conjectures.GraphicalDistInsertions

/-! Root certificates and their precise relationship to the ordered-graph
counting problem. The equality to the full orientation sum is the remaining
finite combinatorial obligation. -/

namespace GraphicalDist

open Polynomial TransportationEhrhart

theorem orientation_count_consequences (counts : dist witnessGraph = countPolynomial) :
    (orientations witnessGraph).card = 2*3^42*3628800*11^18 ∧
    (dist witnessGraph).roots.toFinset.card = 10 ∧
    (nonrealRoots (dist witnessGraph)).card = 2 := by
  have total := dist_at_one witnessGraph
  rw [counts,count_at_one] at total
  constructor
  · exact_mod_cast total.symm
  · rw [counts]
    exact ⟨count_real_roots.2,count_nonreal_roots⟩

end GraphicalDist
