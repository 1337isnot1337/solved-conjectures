import Conjectures.LonelinessFiveSpeedBoundedCandidates
import Conjectures.LonelinessFiveSpeedCriticalCheck
import Conjectures.LonelinessFiveExamples

/-! Exact values and elementary properties of the twelve literal sporadic
tuples.  Exhaustion is proved separately from the finite map coverage. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.CriticalFamilies Loneliness.FiveSpeedExamples

theorem spectrumForm_below_threshold {ds : List ℕ} (h : SpectrumForm ds) :
    value ds < (1 / 5 : ℝ) := by
  obtain ⟨s, hs, hvalue⟩ := h
  rw [hvalue]
  apply (div_lt_iff₀ (by positivity : (0 : ℝ) < 5 * (s : ℝ) + 1)).mpr
  linarith

theorem sporadicTuples_spectrum (ds : List ℕ) (hmem : ds ∈ sporadicTuples) :
    SpectrumForm ds := by
  simp only [sporadicTuples, List.mem_cons, List.not_mem_nil, or_false] at hmem
  rcases hmem with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact ⟨2, by decide, by norm_num [v1_2_3_5_8_value]⟩
  · exact ⟨1, by decide, by norm_num [v1_3_4_5_9_value]⟩
  · exact ⟨3, by decide, by norm_num [v1_3_4_5_11_value]⟩
  · exact ⟨2, by decide, by norm_num [v1_3_4_5_18_value]⟩
  · exact ⟨6, by decide, by norm_num [v1_3_4_5_27_value]⟩
  · exact ⟨2, by decide, by norm_num [v1_4_5_6_7_value]⟩
  · exact ⟨6, by decide, by norm_num [v1_4_5_6_27_value]⟩
  · exact ⟨3, by decide, by norm_num [v1_7_8_9_15_value]⟩
  · exact ⟨4, by decide, by norm_num [v2_3_5_8_19_value]⟩
  · exact ⟨3, by decide, by norm_num [v2_5_7_8_9_value]⟩
  · exact ⟨4, by decide, by norm_num [v3_5_8_9_13_value]⟩
  · exact ⟨4, by decide, by norm_num [v3_5_8_11_13_value]⟩

theorem sporadicTuples_below_threshold (ds : List ℕ) (hmem : ds ∈ sporadicTuples) :
    value ds < (1 / 5 : ℝ) :=
  spectrumForm_below_threshold (sporadicTuples_spectrum ds hmem)

theorem sporadicTuples_finite_properties :
    ∀ ds ∈ sporadicTuples,
      ds.length = 5 ∧ ds.Nodup ∧ (∀ a ∈ ds, 0 < a) ∧
      ds.foldr Nat.gcd 0 = 1 ∧ ds.Pairwise (· ≤ ·) ∧
      containsCriticalCheck ds = false ∧
      ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds := by
  decide +kernel

theorem sporadicTuples_not_critical (ds : List ℕ) (hmem : ds ∈ sporadicTuples) :
    ¬ContainsCriticalQuadruple ds :=
  (containsCriticalCheck_false_iff ds).mp
    (sporadicTuples_finite_properties ds hmem).2.2.2.2.2.1

theorem sporadicTuples_additive (ds : List ℕ) (hmem : ds ∈ sporadicTuples) :
    ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds :=
  (sporadicTuples_finite_properties ds hmem).2.2.2.2.2.2

theorem critical_quadruple_additive {ds : List ℕ}
    (hcrit : ContainsCriticalQuadruple ds) :
    ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds := by
  obtain ⟨d, hd, hsub | hsub⟩ := hcrit
  · refine ⟨d, hsub (by simp), 2 * d, hsub (by simp [mul_comm]), ?_⟩
    apply hsub
    have heq : d + 2 * d = d * 3 := by omega
    simp [heq]
  · refine ⟨d, hsub (by simp), 3 * d, hsub (by simp [mul_comm]), ?_⟩
    apply hsub
    have heq : d + 3 * d = d * 4 := by omega
    simp [heq]

end Loneliness.FiveSpeedCertificate
