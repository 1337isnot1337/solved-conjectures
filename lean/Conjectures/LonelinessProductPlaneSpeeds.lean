import Conjectures.LonelinessProductFamily
import Conjectures.LonelinessSignedCoordinates
import Conjectures.LonelinessModularDirections

/-! Integer speed lists in rational product planes. A base coordinate equal
to one recovers the rational scale as an actual integer coordinate. Taking
absolute values retains all coordinates and their multiplicities; signs
and permutations therefore give the full literal product-family list.
The final arithmetic reduction has no finite-search or classification input. -/

namespace Loneliness.ProductPlaneSpeeds

open CoordinateSubspace

noncomputable section

def axis (n : ℕ) : Fin (n + 1) → ℚ :=
  fun i => if i = Fin.last n then 1 else 0

def baseVector {n : ℕ} (W : Fin n → ℕ) : Fin (n + 1) → ℚ :=
  Fin.lastCases 0 (fun i => (W i : ℚ))

def plane {n : ℕ} (W : Fin n → ℕ) : Submodule ℚ (Fin (n + 1) → ℚ) :=
  Submodule.span ℚ {baseVector W, axis n}

def SignedProductPlane {n : ℕ} (W : Fin n → ℕ)
    (E : Submodule ℚ (Fin (n + 1) → ℚ)) : Prop :=
  ∃ (σ : Fin (n + 1) → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin (n + 1))),
    E.map (signedCoordinates ℚ σ hσ p).toLinearMap = plane W

theorem integer_coordinates {n : ℕ} (W : Fin n → ℕ)
    (a : Fin n) (ha : W a = 1) (w : Fin (n + 1) → ℤ)
    (hw : (fun i => (w i : ℚ)) ∈ plane W) :
    ∀ i : Fin n, w i.castSucc = w a.castSucc * (W i : ℤ) := by
  obtain ⟨r, s, hrepr⟩ := Submodule.mem_span_pair.mp hw
  have hr : r = (w a.castSucc : ℚ) := by
    have h := congrFun hrepr a.castSucc
    simpa [baseVector, axis, Fin.ne_of_lt a.castSucc_lt_last, ha] using h
  intro i
  have h := congrFun hrepr i.castSucc
  have hcoord : (w i.castSucc : ℚ) = (w a.castSucc : ℚ) * (W i : ℚ) := by
    simpa [baseVector, axis, Fin.ne_of_lt i.castSucc_lt_last, hr] using h.symm
  exact_mod_cast hcoord

theorem absolute_list {n : ℕ} (W : Fin n → ℕ)
    (a : Fin n) (ha : W a = 1) (w : Fin (n + 1) → ℤ)
    (hw : (fun i => (w i : ℚ)) ∈ plane W) :
    List.ofFn (fun i => (w i).natAbs) =
      ProductFamily.speeds (List.ofFn W) (w a.castSucc).natAbs (w (Fin.last n)).natAbs := by
  rw [List.ofFn_succ']
  simp only [List.concat_eq_append, ProductFamily.speeds, List.map_ofFn]
  congr 1
  apply congrArg List.ofFn
  funext i
  rw [integer_coordinates W a ha w hw i, Int.natAbs_mul, Int.natAbs_natCast]
  rfl

theorem product_parameters_of_positive_direction {n : ℕ} (W : Fin n → ℕ)
    (a : Fin n) (ha : W a = 1) (E : Submodule ℚ (Fin (n + 1) → ℚ))
    (hproduct : SignedProductPlane W E)
    (v : Fin (n + 1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E) :
    ∃ A b : ℕ, 0 < A ∧ 0 < b ∧
      (List.ofFn v).Perm (ProductFamily.speeds (List.ofFn W) A b) := by
  obtain ⟨σ, hσ, p, hE⟩ := hproduct
  let w : Fin (n + 1) → ℤ :=
    signedCoordinates ℤ σ hσ p (fun i => (v i : ℤ))
  have hwzero (i : Fin (n + 1)) : w i ≠ 0 := by
    have h := (hpositive (p i)).ne'
    rcases hσ i with hi | hi <;> simpa [w, hi] using h
  have hcast : signedCoordinates ℚ σ hσ p (fun i => (v i : ℚ)) =
      (fun i => (w i : ℚ)) := by
    ext i
    simp [w]
  have hw : (fun i => (w i : ℚ)) ∈ plane W := by
    rw [← hE]
    exact Submodule.mem_map.mpr ⟨_, hv, hcast⟩
  have habs : (fun i => (w i).natAbs) = fun i => v (p i) := by
    funext i
    simp only [w, natAbs_signedCoordinates, Int.natAbs_natCast]
  have hperm : (List.ofFn (fun i => (w i).natAbs)).Perm (List.ofFn v) := by
    rw [habs]
    exact p.ofFn_comp_perm v
  refine ⟨(w a.castSucc).natAbs, (w (Fin.last n)).natAbs,
    Int.natAbs_pos.mpr (hwzero a.castSucc),
    Int.natAbs_pos.mpr (hwzero (Fin.last n)), ?_⟩
  rw [← absolute_list W a ha w hw]
  exact hperm.symm

theorem primitive_family_of_below {n : ℕ} (W : Fin n → ℕ)
    (a : Fin n) (ha : W a = 1)
    (q : ℕ) (hq : 4 ≤ q) (hbase : Normalization.gcd (List.ofFn W) = 1)
    (hres : ∀ w ∈ List.ofFn W, w % q ≠ 0)
    (E : Submodule ℚ (Fin (n + 1) → ℚ)) (hproduct : SignedProductPlane W E)
    (v : Fin (n + 1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1 : ℝ) / q) :
    ∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm (List.ofFn W ++ [q * s]) := by
  obtain ⟨A, b, hA, hb, hperm⟩ :=
    product_parameters_of_positive_direction W a ha E hproduct v hpositive hv
  have hprimitive' : Normalization.gcd (ProductFamily.speeds (List.ofFn W) A b) = 1 :=
    (Modular.list_gcd_eq_of_perm hperm).symm.trans hprimitive
  have hvalue : value (List.ofFn v) =
      value (ProductFamily.speeds (List.ofFn W) A b) := CriticalFamilies.value_perm hperm
  obtain ⟨hAone, s, hs, hbvalue⟩ :=
    ProductFamily.below_threshold_parameters q hq (List.ofFn W) hbase hres
      A b hA hb hprimitive' (by rw [← hvalue]; exact hbelow)
  refine ⟨s, hs, ?_⟩
  simpa [ProductFamily.speeds, hAone, hbvalue, Function.comp_def] using hperm

end

end Loneliness.ProductPlaneSpeeds
