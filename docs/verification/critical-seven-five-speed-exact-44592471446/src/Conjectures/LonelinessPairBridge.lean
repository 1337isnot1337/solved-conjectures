import Conjectures.LonelinessCertificate
import Conjectures.Loneliness

/-! The finite pair-sum search and the shared real loneliness functional
describe the same distance and the same maximum. -/
namespace Loneliness

theorem PairSum.distance_eq_distance (x : ℝ) :
    PairSum.distance x = Loneliness.distance x := by
  rw [Loneliness.distance, abs_sub_round_eq_min]
  rfl

theorem PairSum.score_eq_clearance (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (t : ℝ) : PairSum.score ds.toFinset hD t = clearance ds t := by
  apply le_antisymm
  · apply le_clearance (PairSum.score_le_half _ _ _)
    intro d hd
    rw [← PairSum.distance_eq_distance]
    exact PairSum.score_le _ _ _ (by simpa using hd)
  · apply Finset.le_inf' hD
    intro d hd
    rw [PairSum.distance_eq_distance]
    exact clearance_le_of_mem (by simpa using hd) t

/-- The actual real-time supremum is attained at one of finitely many
pair-sum rational times. Repeated entries in the list cause no problem. -/
theorem exists_pair_sum_maximum (ds : List ℕ)
    (hcard : 1 < ds.toFinset.card) (hpos : ∀ d ∈ ds, 0 < d) :
    ∃ a ∈ ds, ∃ b ∈ ds, a ≠ b ∧ ∃ k : ℕ, k ≤ a+b ∧
      clearance ds ((k : ℝ)/(a+b : ℕ)) = value ds ∧
      ∀ u : ℝ, clearance ds u ≤ clearance ds ((k : ℝ)/(a+b : ℕ)) := by
  have hD : ds.toFinset.Nonempty := Finset.card_pos.mp (by omega)
  obtain ⟨a,ha,b,hb,hab,k,hk,hm⟩ := PairSum.exists_pair_sum_maximum
    ds.toFinset hD hcard (by simpa using hpos)
  have ha' : a ∈ ds := by simpa using ha
  have hb' : b ∈ ds := by simpa using hb
  have hp : 0 < a+b := by have := hpos a ha'; omega
  have hpr : (0 : ℝ) < (a+b : ℕ) := by exact_mod_cast hp
  have ht : (k : ℝ)/(a+b : ℕ) ∈ Set.Icc (0 : ℝ) 1 := by
    constructor
    · positivity
    · apply (div_le_one hpr).mpr
      exact_mod_cast hk
  have hm' : ∀ u : ℝ, clearance ds u ≤ clearance ds ((k : ℝ)/(a+b : ℕ)) := by
    simpa only [PairSum.score_eq_clearance] using hm
  exact ⟨a,ha',b,hb',hab,k,hk,le_antisymm (le_value ht)
    (value_le (fun t _ => hm' t)),hm'⟩

theorem PairSum.IsExactValue.value_eq {ds : List ℕ} {r : ℝ}
    (h : PairSum.IsExactValue ds r) : value ds = r := by
  obtain ⟨hD,⟨t,ht⟩,hu⟩ := h
  apply le_antisymm
  · apply value_le
    intro u _
    rw [← PairSum.score_eq_clearance ds hD]
    exact hu u
  · have hf : Int.fract t ∈ Set.Icc (0 : ℝ) 1 :=
      ⟨Int.fract_nonneg t,(Int.fract_lt_one t).le⟩
    have he : clearance ds (Int.fract t) = r := by
      rw [← PairSum.score_eq_clearance ds hD,PairSum.score_fract,ht]
    rw [← he]
    exact le_value hf

/-- Boolean certificates from the pair-sum search prove the shared value. -/
theorem certified_pair_value (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (hcard : 1 < ds.toFinset.card) (hpos : ∀ d ∈ ds, 0 < d)
    (A B k q : ℕ) (hB : 0 < B) (hq : 0 < q)
    (hupper : PairSum.upperCheck ds A B = true)
    (hlower : PairSum.lowerCheck ds A B k q = true) : value ds = (A : ℝ)/B :=
  (PairSum.certified_exact_value ds hD hcard hpos A B k q hB hq hupper hlower).value_eq

end Loneliness
