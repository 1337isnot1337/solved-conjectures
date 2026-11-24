import Conjectures.FerroniHigashitaniRefined
import Mathlib.Analysis.Convex.Combination
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Analysis.Normed.Operator.Banach

/-! The Cayley boxes as subsets of the actual real spatial coordinate space.
Their homogeneous forms are affine after fixing the degree. -/

open Finset Set
open scoped Pointwise

namespace FerroniHigashitani

abbrev Space (m : ℕ) := (Fin 5 → ℝ) × (BoxIndex m → ℝ)

variable {m : ℕ}

private def baseProj (i : Fin 5) : Space m →ₗ[ℝ] ℝ :=
  (LinearMap.proj i).comp (LinearMap.fst ℝ _ _)

private def boxProj (c : BoxIndex m) : Space m →ₗ[ℝ] ℝ :=
  (LinearMap.proj c).comp (LinearMap.snd ℝ _ _)

noncomputable def baseForm (k : ℝ) : Fin 6 → (Space m →ᵃ[ℝ] ℝ) :=
  Fin.cases (AffineMap.const ℝ _ k - (∑ i, baseProj i).toAffineMap)
    (fun i => (baseProj i).toAffineMap)

@[simp] theorem baseForm_zero (k : ℝ) (v : Space m) :
    baseForm k 0 v = k - ∑ i, v.1 i := by
  simp [baseForm, baseProj]

@[simp] theorem baseForm_succ (k : ℝ) (i : Fin 5) (v : Space m) :
    baseForm k i.succ v = v.1 i := rfl

theorem sum_baseForm (k : ℝ) (v : Space m) : ∑ j, baseForm k j v = k := by
  rw [Fin.sum_univ_succ]
  simp

noncomputable def realCapacity (b : Fin 6 → ℝ) (c : BoxIndex m) : ℝ :=
  if c.2.2 = 0 then b 0 + b c.1.succ else 2 * b c.1.succ

noncomputable def capacityForm (k : ℝ) (c : BoxIndex m) : Space m →ᵃ[ℝ] ℝ :=
  if c.2.2 = 0 then baseForm k 0 + baseForm k c.1.succ
  else baseForm k c.1.succ + baseForm k c.1.succ

@[simp] theorem capacityForm_apply (k : ℝ) (c : BoxIndex m) (v : Space m) :
    capacityForm k c v = realCapacity (fun j => baseForm k j v) c := by
  unfold capacityForm realCapacity
  split_ifs <;> simp [two_mul]

abbrev FormIndex (m : ℕ) := Fin 6 ⊕ (BoxIndex m × Bool)

noncomputable def form (k : ℝ) : FormIndex m → (Space m →ᵃ[ℝ] ℝ)
  | .inl j => baseForm k j
  | .inr (c, false) => (boxProj c).toAffineMap
  | .inr (c, true) => capacityForm k c - (boxProj c).toAffineMap

private theorem form_surjective (k : ℝ) (i : FormIndex m) :
    Function.Surjective (form k i) := by
  intro t
  rcases i with j | ⟨c, side⟩
  · refine Fin.cases ?_ (fun j => ?_) j
    · refine ⟨(fun _ => (k - t) / 5, fun _ => 0), ?_⟩
      simp [form]
      ring
    · exact ⟨(fun _ => t, fun _ => 0), rfl⟩
  · cases side
    · exact ⟨(fun _ => 0, fun _ => t), rfl⟩
    · let v : Space m := (fun _ => 0, fun _ => 0)
      refine ⟨(v.1, fun _ => capacityForm k c v - t), ?_⟩
      have h (j : Fin 6) :
          baseForm (m := m) k j (v.1, fun _ => capacityForm k c v - t) = baseForm k j v := by
        refine Fin.cases ?_ (fun _ => rfl) j
        simp
      change capacityForm k c (v.1, fun _ => capacityForm k c v - t) -
        (capacityForm k c v - t) = t
      rw [capacityForm_apply]
      simp_rw [h]
      rw [← capacityForm_apply, sub_sub_cancel]

def closedSlice (k : ℝ) : Set (Space m) := ⋂ i, form k i ⁻¹' Ici 0

def strictSlice (k : ℝ) : Set (Space m) := ⋂ i, form k i ⁻¹' Ioi 0

theorem mem_closedSlice_iff (k : ℝ) (v : Space m) : v ∈ closedSlice k ↔
    (∀ j, 0 ≤ baseForm k j v) ∧
      (∀ c, 0 ≤ v.2 c ∧ v.2 c ≤ realCapacity (fun j => baseForm k j v) c) := by
  simp only [closedSlice, mem_iInter, Set.mem_preimage, Set.mem_Ici, Sum.forall, Prod.forall,
    Bool.forall_bool, form, AffineMap.coe_sub, Pi.sub_apply, LinearMap.coe_toAffineMap, sub_nonneg,
    capacityForm_apply, boxProj, LinearMap.comp_apply, LinearMap.snd_apply, LinearMap.proj_apply]

theorem mem_strictSlice_iff (k : ℝ) (v : Space m) : v ∈ strictSlice k ↔
    (∀ j, 0 < baseForm k j v) ∧
      (∀ c, 0 < v.2 c ∧ v.2 c < realCapacity (fun j => baseForm k j v) c) := by
  simp only [strictSlice, mem_iInter, Set.mem_preimage, Set.mem_Ioi, Sum.forall, Prod.forall,
    Bool.forall_bool, form, AffineMap.coe_sub, Pi.sub_apply, LinearMap.coe_toAffineMap, sub_pos,
    capacityForm_apply, boxProj, LinearMap.comp_apply, LinearMap.snd_apply, LinearMap.proj_apply]

theorem closedSlice_convex (k : ℝ) : Convex ℝ (closedSlice k : Set (Space m)) :=
  convex_iInter fun i => convex_Ici (0 : ℝ) |>.affine_preimage (form k i)

/-- The strict inequalities describe the topological interior in the original
spatial coordinates. Each defining form is continuous and open. -/
theorem interior_closedSlice (k : ℝ) : interior (closedSlice k : Set (Space m)) = strictSlice k := by
  unfold closedSlice strictSlice
  rw [interior_iInter_of_finite]
  apply Set.iInter_congr
  intro i
  have hcont := (form (m := m) k i).continuous_of_finiteDimensional
  rw [← ((form k i).isOpenMap hcont (form_surjective k i)).preimage_interior_eq_interior_preimage
    hcont, interior_Ici]

theorem baseForm_scale (k a : ℝ) (v : Space m) (i : Fin 6) :
    baseForm (a * k) i (a • v) = a * baseForm k i v := by
  refine Fin.cases ?_ (fun j => ?_) i
  · have h : (∑ j : Fin 5, (a • v).1 j) = a * ∑ j, v.1 j := by
      simp [Finset.mul_sum]
    rw [baseForm_zero, baseForm_zero, h]
    ring
  · rfl

theorem realCapacity_scale (b : Fin 6 → ℝ) (a : ℝ) (c : BoxIndex m) :
    realCapacity (fun i => a * b i) c = a * realCapacity b c := by
  unfold realCapacity
  split_ifs <;> ring

theorem scale_mem_closedSlice_iff (k : ℝ) {a : ℝ} (ha : 0 < a) (v : Space m) :
    a • v ∈ closedSlice (a * k) ↔ v ∈ closedSlice k := by
  rw [mem_closedSlice_iff, mem_closedSlice_iff]
  simp_rw [baseForm_scale, realCapacity_scale]
  change ((∀ j, 0 ≤ a * baseForm k j v) ∧
    (∀ c, 0 ≤ a * v.2 c ∧ a * v.2 c ≤ a * realCapacity (fun j => baseForm k j v) c)) ↔ _
  simp [mul_nonneg_iff_of_pos_left ha, mul_le_mul_iff_right₀ ha]

theorem closedSlice_dilate (k : ℝ) {a : ℝ} (ha : 0 < a) :
    closedSlice (m := m) (a * k) = a • closedSlice k := by
  ext v
  constructor
  · intro hv
    have h : a • (a⁻¹ • v) = v := by simp [smul_smul, ha.ne']
    exact ⟨a⁻¹ • v, (scale_mem_closedSlice_iff k ha _).mp (by rwa [h]), h⟩
  · rintro ⟨w, hw, rfl⟩
    exact (scale_mem_closedSlice_iff k ha w).mpr hw

end FerroniHigashitani
