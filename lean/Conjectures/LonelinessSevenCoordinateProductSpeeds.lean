import Conjectures.LonelinessSevenCoordinateClassification
import Conjectures.LonelinessProductFamily

/-! The full positive speed list of an integer direction in a signed
standard product plane. This retains multiplicities and the actual integer
scale and free speed, so the primitive product-family arithmetic applies. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace

noncomputable section

theorem standardPlane_integer_coordinates (w : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ standardPlane) :
    ∀ i : Fin 6, w i.castSucc = w 0*((i.val+1 : ℕ) : ℤ) := by
  obtain ⟨r, s, hrepr⟩ := Submodule.mem_span_pair.mp hw
  have hr : r = (w 0 : ℚ) := by
    have h := congrFun hrepr 0
    simpa [standardBase, coordinateAxis] using h
  intro i
  have h := congrFun hrepr i.castSucc
  have hbase : standardBase i.castSucc = ((i.val+1 : ℕ) : ℚ) := by
    fin_cases i <;> rfl
  have haxis : coordinateAxis 6 i.castSucc = 0 := by
    fin_cases i <;> rfl
  have hcoord : (w i.castSucc : ℚ) = (w 0 : ℚ)*((i.val+1 : ℕ) : ℚ) := by
    simpa only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, hbase, haxis,
      mul_zero, add_zero, hr] using h.symm
  exact_mod_cast hcoord

theorem standardPlane_absolute_list (w : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ standardPlane) :
    List.ofFn (fun i => (w i).natAbs) =
      ProductFamily.speeds sixBase (w 0).natAbs (w 6).natAbs := by
  have h := standardPlane_integer_coordinates w hw
  have h₁ : w 1 = w 0*2 := by simpa using h (1 : Fin 6)
  have h₂ : w 2 = w 0*3 := by simpa using h (2 : Fin 6)
  have h₃ : w 3 = w 0*4 := by simpa using h (3 : Fin 6)
  have h₄ : w 4 = w 0*5 := by simpa using h (4 : Fin 6)
  have h₅ : w 5 = w 0*6 := by simpa using h (5 : Fin 6)
  simp [List.ofFn_succ, ProductFamily.speeds, sixBase,
    h₁, h₂, h₃, h₄, h₅, Int.natAbs_mul]

theorem product_parameters_of_positive_direction
    (E : Submodule ℚ (Fin 7 → ℚ)) (hproduct : StandardProductPlane E)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E) :
    ∃ A b : ℕ, 0 < A ∧ 0 < b ∧
      (List.ofFn v).Perm (ProductFamily.speeds sixBase A b) := by
  obtain ⟨σ, hσ, p, hE⟩ := hproduct
  let w : Vector := signedCoordinates ℤ σ hσ p (fun i => (v i : ℤ))
  have hwzero (i : Fin 7) : w i ≠ 0 := by
    have h := (hpositive (p i)).ne'
    rcases hσ i with hi | hi <;> simpa [w, hi] using h
  have hcast : signedCoordinates ℚ σ hσ p (fun i => (v i : ℚ)) =
      (fun i => (w i : ℚ)) := by
    ext i
    simp [w]
  have hw : (fun i => (w i : ℚ)) ∈ standardPlane := by
    rw [← hE]
    exact Submodule.mem_map.mpr ⟨_, hv, hcast⟩
  have habs : (fun i => (w i).natAbs) = fun i => v (p i) := by
    funext i
    simp only [w, natAbs_signedCoordinates, Int.natAbs_natCast]
  have hperm : (List.ofFn (fun i => (w i).natAbs)).Perm (List.ofFn v) := by
    rw [habs]
    exact p.ofFn_comp_perm v
  refine ⟨(w 0).natAbs, (w 6).natAbs,
    Int.natAbs_pos.mpr (hwzero 0), Int.natAbs_pos.mpr (hwzero 6), ?_⟩
  rw [← standardPlane_absolute_list w hw]
  exact hperm.symm

end

end Loneliness.SevenCoordinateCritical
