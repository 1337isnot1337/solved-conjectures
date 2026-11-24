import Conjectures.FerroniHigashitaniLattice

/-! The real slice is the convex hull of the integral corners of its six
vertex boxes. This verifies the lattice-polytope hypothesis separately from
integer decomposition. -/

open Finset Set
open scoped Pointwise

namespace FerroniHigashitani

variable {m : ℕ}

private noncomputable def vertexY (j : Fin 6) : Fin 5 → ℝ :=
  fun i => baseVertex j i.succ

private noncomputable def vertexCap (j : Fin 6) (c : BoxIndex m) : ℝ :=
  capacity (baseVertex j) c

private theorem vertexCap_nonneg (j : Fin 6) (c : BoxIndex m) : 0 ≤ vertexCap j c := by
  unfold vertexCap
  positivity

private theorem baseForm_vertex (j i : Fin 6) (x : BoxIndex m → ℝ) :
    baseForm 1 i (vertexY j, x) = (baseVertex j i : ℝ) := by
  refine Fin.cases ?_ (fun _ => rfl) i
  have h : (∑ i, (baseVertex j i : ℝ)) = 1 := by exact_mod_cast sum_baseVertex j
  rw [Fin.sum_univ_succ] at h
  simp only [baseForm_zero, vertexY]
  linarith

private theorem capacity_vertex (j : Fin 6) (x : BoxIndex m → ℝ) (c : BoxIndex m) :
    realCapacity (fun i => baseForm 1 i (vertexY j, x)) c = vertexCap j c := by
  simp_rw [baseForm_vertex]
  simp only [realCapacity, vertexCap, capacity]
  split_ifs <;> push_cast <;> rfl

noncomputable def corner (j : Fin 6) (flag : BoxIndex m → Bool) : Space m :=
  (vertexY j, fun c => if flag c then vertexCap j c else 0)

def corners (m : ℕ) : Set (Space m) :=
  Set.range (fun j : Fin 6 × (BoxIndex m → Bool) => corner j.1 j.2)

theorem finite_corners (m : ℕ) : (corners m).Finite := Set.finite_range _

theorem corners_subset_refinedLattice (m : ℕ) : corners m ⊆ refinedLattice m := by
  rintro _ ⟨⟨j, flag⟩, rfl⟩
  use 0, fun i => (baseVertex j i.succ : ℤ),
    fun c => if flag c then (capacity (baseVertex j) c : ℤ) else 0
  simp only [corner, vertexY, vertexCap, Int.cast_zero, zero_div, add_zero, Int.cast_natCast,
    Int.cast_ite, implies_true, true_and]

private theorem corners_subset_closedSlice (m : ℕ) : corners m ⊆ closedSlice 1 := by
  rintro _ ⟨⟨j, flag⟩, rfl⟩
  rw [mem_closedSlice_iff]
  constructor
  · intro i
    simp only [corner, baseForm_vertex]
    positivity
  · intro c
    simp only [corner, capacity_vertex]
    split_ifs <;> exact ⟨by first | exact vertexCap_nonneg _ _ | norm_num,
      by first | exact le_rfl | exact vertexCap_nonneg _ _⟩

private theorem vertexBox_subset_hull (j : Fin 6) (x : BoxIndex m → ℝ)
    (hx : ∀ c, 0 ≤ x c ∧ x c ≤ vertexCap j c) :
    (vertexY j, x) ∈ convexHull ℝ (corners m) := by
  classical
  let endpoints : Set (BoxIndex m → ℝ) := Set.univ.pi fun c => ({0, vertexCap j c} : Set ℝ)
  have h : x ∈ convexHull ℝ endpoints := by
    unfold endpoints
    apply mem_convexHull_pi
    intro c _
    rw [convexHull_pair, segment_eq_Icc (vertexCap_nonneg j c)]
    exact hx c
  let e : (BoxIndex m → ℝ) →ᵃ[ℝ] Space m :=
    (AffineMap.const ℝ _ (vertexY j)).prod (AffineMap.id ℝ _)
  have he : e '' endpoints ⊆ corners m := by
    rintro _ ⟨a, ha, rfl⟩
    let flag (c : BoxIndex m) : Bool := decide (a c = vertexCap j c)
    refine ⟨(j, flag), Prod.ext rfl ?_⟩
    funext c
    have hc := ha c (Set.mem_univ c)
    change (if flag c then vertexCap j c else 0) = a c
    simp only [flag, decide_eq_true_eq]
    rcases hc with h0 | h1
    · change a c = 0 at h0
      by_cases heq : a c = vertexCap j c
      · simp only [heq, ite_true]
      · simp only [heq, ite_false]
        exact h0.symm
    · change a c = vertexCap j c at h1
      simp [h1]
  apply convexHull_mono he
  rw [← e.image_convexHull]
  exact ⟨x, h, rfl⟩

private theorem weighted_vertexCap (b : Fin 6 → ℝ) (c : BoxIndex m) :
    ∑ j, b j * vertexCap j c = realCapacity b c := by
  have hb (i : Fin 6) : ∑ j, b j * (baseVertex j i : ℝ) = b i := by
    simp [baseVertex]
  unfold vertexCap capacity realCapacity
  split_ifs
  · push_cast
    simp_rw [mul_add, sum_add_distrib, hb]
  · push_cast
    simp_rw [mul_left_comm (b _) (2 : ℝ), ← mul_sum, hb]

theorem closedSlice_one_eq_hull (m : ℕ) : closedSlice 1 = convexHull ℝ (corners m) := by
  refine Set.Subset.antisymm ?_ (convexHull_min (corners_subset_closedSlice m) (closedSlice_convex 1))
  intro v hv
  obtain ⟨hb, hx⟩ := (mem_closedSlice_iff 1 v).mp hv
  let b (j : Fin 6) := baseForm 1 j v
  let cap (c : BoxIndex m) := realCapacity b c
  let ratio (c : BoxIndex m) := if cap c = 0 then 0 else v.2 c / cap c
  have hratio (c : BoxIndex m) : 0 ≤ ratio c ∧ ratio c ≤ 1 := by
    have ⟨h0, h1⟩ := hx c
    change v.2 c ≤ cap c at h1
    by_cases he : cap c = 0
    · simp [ratio, he]
    · have hp : 0 < cap c := lt_of_le_of_ne (h0.trans h1) (Ne.symm he)
      simp only [ratio, he, ite_false]
      exact ⟨div_nonneg h0 hp.le, (div_le_one hp).mpr h1⟩
  have hmul (c : BoxIndex m) : ratio c * cap c = v.2 c := by
    have ⟨h0, h1⟩ := hx c
    change v.2 c ≤ cap c at h1
    by_cases he : cap c = 0
    · have hzero : v.2 c = 0 := h0.antisymm' (he ▸ h1)
      simp [ratio, he, hzero]
    · simp [ratio, he]
  let u (j : Fin 6) : Space m := (vertexY j, fun c => ratio c * vertexCap j c)
  have hu (j : Fin 6) : u j ∈ convexHull ℝ (corners m) := by
    apply vertexBox_subset_hull
    intro c
    have hc := vertexCap_nonneg (m := m) j c
    exact ⟨mul_nonneg (hratio c).1 hc, mul_le_of_le_one_left hc (hratio c).2⟩
  have hs := (convex_convexHull ℝ (corners m)).sum_mem (t := Finset.univ)
    (w := b) (z := u) (fun j _ => hb j) (sum_baseForm 1 v) (fun j _ => hu j)
  have he : (∑ j, b j • u j) = v := by
    apply Prod.ext <;> funext i
    · change (∑ j, (b j • u j).1, ∑ j, (b j • u j).2).1 i = v.1 i
      change (∑ j, (b j • u j).1) i = v.1 i
      simp [Finset.sum_apply, u, vertexY, baseVertex, b, eq_comm]
    · change (∑ j, (b j • u j).1, ∑ j, (b j • u j).2).2 i = v.2 i
      change (∑ j, (b j • u j).2) i = v.2 i
      simp only [Finset.sum_apply, u, Prod.smul_mk, Pi.smul_apply, smul_eq_mul]
      simp_rw [mul_left_comm (b _) (ratio i), ← mul_sum, weighted_vertexCap]
      exact hmul i
  rwa [he] at hs

theorem twoSlice_latticePolytope (m : ℕ) :
    ∃ S : Set (Space m), S.Finite ∧ S ⊆ refinedLattice m ∧
      closedSlice 2 = convexHull ℝ S := by
  let S := (2 : ℝ) • corners m
  refine ⟨S, (finite_corners m).image _, ?_, ?_⟩
  · rintro _ ⟨v, hv, rfl⟩
    change (2 : ℝ) • v ∈ refinedLattice m
    rw [two_smul]
    exact refinedLattice_add (corners_subset_refinedLattice m hv) (corners_subset_refinedLattice m hv)
  · rw [show (2 : ℝ) = 2 * 1 by norm_num, closedSlice_dilate 1 (by norm_num),
      closedSlice_one_eq_hull, convexHull_smul]

end FerroniHigashitani
