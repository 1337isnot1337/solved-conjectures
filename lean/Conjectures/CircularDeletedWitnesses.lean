import Conjectures.CircularDeletedWitness07
import Conjectures.CircularDeletedWitness09
import Conjectures.CircularDeletedWitness11
import Conjectures.CircularDeletedWitness13
import Conjectures.CircularDeletedWitness15
import Conjectures.CircularDeletedWitness17
import Conjectures.CircularDeletedWitness19
import Conjectures.CircularDeletedWitness23
import Conjectures.CircularDeletedWitness25
import Conjectures.CircularDeletedWitness27
import Conjectures.CircularDeletedWitness41
import Conjectures.CircularDeletedWitness47


/-! The proposed equality for small deleted sets fails already for two disjoint edges on eleven vertices. -/

namespace CircularIndex.Deleted

theorem two_edge_counterexample :
    2 * Witness10.deleted.card < 11 / 2 ∧
    circularChromaticIndex (graph 11 Witness10.deleted) < 11 :=
  ⟨by decide, Witness10.upper_half.2.2.2⟩

end CircularIndex.Deleted
