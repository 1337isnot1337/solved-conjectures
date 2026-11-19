import Conjectures.LonelinessPlaneProduct
import Conjectures.LonelinessNormalization

/-! Every coordinate-free integer direction in a critical product plane has
the required five-speed spectrum form whenever its value is below one fifth. -/

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

theorem critical_quadruple_in_coordinate_product (q : Vector) (free : Fin 5)
    (hq : ∀ k, 0 < q k)
    (hbase : (remainingCoordinates free).map (fun k => (q k).natAbs) = [1,2,3,4] ∨
      (remainingCoordinates free).map (fun k => (q k).natAbs) = [1,3,4,7])
    (w : Vector) (hwzero : ∀ k, w k ≠ 0)
    (hw : (fun k => (w k : ℚ)) ∈
      Submodule.span ℚ {(fun k => (q k : ℚ)), coordinateAxis free}) :
    CriticalFamilies.ContainsCriticalQuadruple (absoluteCoordinates w) := by
  have hone : 1 ∈ (remainingCoordinates free).map (fun k => (q k).natAbs) := by
    rcases hbase with h | h <;> rw [h] <;> simp
  obtain ⟨a, ha, hqa⟩ := List.mem_map.mp hone
  have hafree : a ≠ free := mem_remainingCoordinates a free |>.mp ha
  have hqa' : q a = 1 := by
    have h := congrArg (fun n : ℕ => (n : ℤ)) hqa
    simpa [Int.natCast_natAbs, abs_of_pos (hq a)] using h
  obtain ⟨r, s, hrepr⟩ := Submodule.mem_span_pair.mp hw
  have hr : r = (w a : ℚ) := by
    have h := congrFun hrepr a
    simpa [coordinateAxis, hafree, hqa'] using h
  have hmul : ∀ k, k ≠ free → w k = w a * q k := by
    intro k hk
    have h := congrFun hrepr k
    have hcast : (w k : ℚ) = (w a : ℚ) * (q k : ℚ) := by
      simpa [coordinateAxis, hk, hr] using h.symm
    exact_mod_cast hcast
  have hsub :
      (((remainingCoordinates free).map (fun k => (q k).natAbs)).map
        (fun b => (w a).natAbs * b)) ⊆ absoluteCoordinates w := by
    intro b hb
    obtain ⟨d, hd, rfl⟩ := List.mem_map.mp hb
    obtain ⟨k, hk, rfl⟩ := List.mem_map.mp hd
    exact List.mem_ofFn.mpr ⟨k, by rw [hmul k (by simpa using hk), Int.natAbs_mul]⟩
  refine ⟨(w a).natAbs, Int.natAbs_pos.mpr (hwzero a), ?_⟩
  rcases hbase with h | h
  · exact Or.inl (by simpa only [h] using hsub)
  · exact Or.inr (by simpa only [h] using hsub)

theorem value_absoluteCoordinates (w : Vector) :
    value (absoluteCoordinates w) = value (integerSpeeds w) := by
  apply CriticalFamilies.value_eq_of_mem
  intro a
  simp only [absoluteCoordinates, List.mem_ofFn, mem_integerSpeeds]

theorem spectrum_in_critical_product (E : Submodule ℚ (Fin 5 → ℚ))
    (hproduct : CriticalProductPlane E) (w : Vector)
    (hwE : (fun k => (w k : ℚ)) ∈ E) (hwzero : ∀ k, w k ≠ 0)
    (hbelow : value (integerSpeeds w) < (1 / 5 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ value (integerSpeeds w) = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  obtain ⟨σ, hσ, π, i, free, hbase, hE⟩ := hproduct
  let v : Vector := signedCoordinates ℤ σ hσ π w
  have hvzero : ∀ k, v k ≠ 0 := by
    intro k
    rcases hσ k with h | h <;> simpa [v, h] using hwzero (π k)
  have hcast : signedCoordinates ℚ σ hσ π (fun k => (w k : ℚ)) =
      fun k => (v k : ℚ) := by
    ext k
    simp [v]
  have hvE : (fun k => (v k : ℚ)) ∈
      Submodule.span ℚ {(fun k => (canonical i k : ℚ)), coordinateAxis free} := by
    rw [← hE]
    exact Submodule.mem_map.mpr ⟨_, hwE, hcast⟩
  have hcrit := critical_quadruple_in_coordinate_product (canonical i) free
    (canonical_positive i) hbase v hvzero hvE
  have hvalue : value (absoluteCoordinates v) = value (integerSpeeds w) :=
    (value_absoluteCoordinates v).trans (value_integerSpeeds_signedCoordinates σ hσ π w)
  have hpos : ∀ a ∈ absoluteCoordinates v, 0 < a := by
    intro a ha
    obtain ⟨k, rfl⟩ := List.mem_ofFn.mp ha
    exact Int.natAbs_pos.mpr (hvzero k)
  have hspec := Normalization.critical_family_below_threshold
    (ds := absoluteCoordinates v) (by simp [absoluteCoordinates]) hpos hcrit
    (by simpa only [hvalue] using hbelow)
  simpa only [hvalue] using hspec

end

end Loneliness.PlaneCertificate
