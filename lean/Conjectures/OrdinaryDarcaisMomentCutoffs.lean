import Conjectures.OrdinaryDarcaisMomentCells

/-! Uniform geometric tail bounds for the four rational ranges. -/

namespace OrdinaryDarcais

def MomentCutoff (R K : ℕ) : Prop :=
  let b := (R:ℚ)/1000
  let a := (K:ℚ)+1
  let q := b*(1+1/a)^4
  b < 1 ∧ q < 1 ∧ a^4*b^K/(1-q) ≤ 1

instance (R K : ℕ) : Decidable (MomentCutoff R K) := by unfold MomentCutoff; infer_instance

theorem cutoff_enclosure {R K : ℕ} (h : MomentCutoff R K) {r : ℝ}
    (hr : 0 < r) (hR : r ≤ (R:ℝ)/1000) (j : ℕ) (hj : j ≤ 2) :
    partialMoment j K r ≤ ∑' i, shiftedTerm j r i ∧
      (∑' i, shiftedTerm j r i) ≤ partialMoment j K r + 1 := by
  rcases h with ⟨hb,hq,ht⟩
  change (R:ℚ)/1000 < 1 at hb
  change (R:ℚ)/1000*(1+1/((K:ℚ)+1))^4 < 1 at hq
  change ((K:ℚ)+1)^4*((R:ℚ)/1000)^K/(1-(R:ℚ)/1000*(1+1/((K:ℚ)+1))^4) ≤ 1 at ht
  apply shifted_enclosure hj hr hR _ K
  · simpa using (Rat.cast_lt (K := ℝ)).2 hq
  · simpa using (Rat.cast_le (K := ℝ)).2 ht
  · simpa using (Rat.cast_lt (K := ℝ)).2 hb

set_option Elab.async false
set_option maxRecDepth 30000
set_option maxHeartbeats 4000000

theorem momentCutoff900 : MomentCutoff 900 250 := by decide +kernel
theorem momentCutoff960 : MomentCutoff 960 900 := by decide +kernel
theorem momentCutoff980 : MomentCutoff 980 1950 := by decide +kernel
theorem momentCutoff990 : MomentCutoff 990 4000 := by decide +kernel

end OrdinaryDarcais
