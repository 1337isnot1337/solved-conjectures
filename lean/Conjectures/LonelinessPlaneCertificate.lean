import Conjectures.LonelinessPlaneCertificate00
import Conjectures.LonelinessPlaneCertificate01
import Conjectures.LonelinessPlaneCertificate02
import Conjectures.LonelinessPlaneCertificate03
import Conjectures.LonelinessPlaneCertificate04
import Conjectures.LonelinessPlaneCertificate05
import Conjectures.LonelinessPlaneCertificate06
import Conjectures.LonelinessPlaneCertificate07
import Conjectures.LonelinessPlaneCertificate10
import Conjectures.LonelinessPlaneCertificate11
import Conjectures.LonelinessPlaneCertificate12
import Conjectures.LonelinessPlaneCertificate13
import Conjectures.LonelinessPlaneCertificate14
import Conjectures.LonelinessPlaneCertificate15
import Conjectures.LonelinessPlaneCertificate16
import Conjectures.LonelinessPlaneCertificate17
import Conjectures.LonelinessPlaneCertificate20
import Conjectures.LonelinessPlaneCertificate21
import Conjectures.LonelinessPlaneCertificate22
import Conjectures.LonelinessPlaneCertificate23
import Conjectures.LonelinessPlaneCertificate24
import Conjectures.LonelinessPlaneCertificate25
import Conjectures.LonelinessPlaneCertificate26
import Conjectures.LonelinessPlaneCertificate27
import Conjectures.LonelinessPlaneCertificate30
import Conjectures.LonelinessPlaneCertificate31
import Conjectures.LonelinessPlaneCertificate32
import Conjectures.LonelinessPlaneCertificate33
import Conjectures.LonelinessPlaneCertificate34
import Conjectures.LonelinessPlaneCertificate35
import Conjectures.LonelinessPlaneCertificate36
import Conjectures.LonelinessPlaneCertificate37
import Conjectures.LonelinessPlaneCertificate40
import Conjectures.LonelinessPlaneCertificate41
import Conjectures.LonelinessPlaneCertificate42
import Conjectures.LonelinessPlaneCertificate43
import Conjectures.LonelinessPlaneCertificate44
import Conjectures.LonelinessPlaneCertificate45
import Conjectures.LonelinessPlaneCertificate46
import Conjectures.LonelinessPlaneCertificate47
import Conjectures.LonelinessPlaneCertificate50
import Conjectures.LonelinessPlaneCertificate51
import Conjectures.LonelinessPlaneCertificate52
import Conjectures.LonelinessPlaneCertificate53
import Conjectures.LonelinessPlaneCertificate54
import Conjectures.LonelinessPlaneCertificate55
import Conjectures.LonelinessPlaneCertificate56
import Conjectures.LonelinessPlaneCertificate57
import Conjectures.LonelinessPlaneCertificate60
import Conjectures.LonelinessPlaneCertificate61
import Conjectures.LonelinessPlaneCertificate62
import Conjectures.LonelinessPlaneCertificate63
import Conjectures.LonelinessPlaneCertificate64
import Conjectures.LonelinessPlaneCertificate65
import Conjectures.LonelinessPlaneCertificate66
import Conjectures.LonelinessPlaneCertificate67
import Conjectures.LonelinessPlaneCertificate70
import Conjectures.LonelinessPlaneCertificate71
import Conjectures.LonelinessPlaneCertificate72
import Conjectures.LonelinessPlaneCertificate73
import Conjectures.LonelinessPlaneCertificate74
import Conjectures.LonelinessPlaneCertificate75
import Conjectures.LonelinessPlaneCertificate76
import Conjectures.LonelinessPlaneCertificate77
import Mathlib.Tactic.FinCases

/-! The complete finite classification of signed critical-pattern pairs.
All 122,880 indexed cases are checked by kernel reduction in the 64 blocks. -/

namespace Loneliness.PlaneCertificate

theorem all_indexed_pairs_checked : ∀ (i j : Fin 8) (n : Fin 120) (mask : Fin 16),
    pairTest (canonical i) (tableCandidate j (permutationAt n) mask) = true := by
  intro i j
  fin_cases i <;> fin_cases j
  · exact checked00
  · exact checked01
  · exact checked02
  · exact checked03
  · exact checked04
  · exact checked05
  · exact checked06
  · exact checked07
  · exact checked10
  · exact checked11
  · exact checked12
  · exact checked13
  · exact checked14
  · exact checked15
  · exact checked16
  · exact checked17
  · exact checked20
  · exact checked21
  · exact checked22
  · exact checked23
  · exact checked24
  · exact checked25
  · exact checked26
  · exact checked27
  · exact checked30
  · exact checked31
  · exact checked32
  · exact checked33
  · exact checked34
  · exact checked35
  · exact checked36
  · exact checked37
  · exact checked40
  · exact checked41
  · exact checked42
  · exact checked43
  · exact checked44
  · exact checked45
  · exact checked46
  · exact checked47
  · exact checked50
  · exact checked51
  · exact checked52
  · exact checked53
  · exact checked54
  · exact checked55
  · exact checked56
  · exact checked57
  · exact checked60
  · exact checked61
  · exact checked62
  · exact checked63
  · exact checked64
  · exact checked65
  · exact checked66
  · exact checked67
  · exact checked70
  · exact checked71
  · exact checked72
  · exact checked73
  · exact checked74
  · exact checked75
  · exact checked76
  · exact checked77

theorem all_candidates_checked (i j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16) :
    pairTest (canonical i) (candidate j p mask) = true := by
  obtain ⟨n, hn⟩ := permutationAt_covers p
  have h := all_indexed_pairs_checked i j n mask
  rw [hn] at h
  exact h

theorem admissible_candidate_product (i j : Fin 8)
    (p : Equiv.Perm (Fin 5)) (mask : Fin 16)
    (h : admissibleTest (canonical i) (candidate j p mask) = true) :
    productTest (canonical i) (candidate j p mask) = true := by
  have hcheck := all_candidates_checked i j p mask
  simpa [pairTest, h] using hcheck

end Loneliness.PlaneCertificate

