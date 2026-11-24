import Conjectures.FerroniHigashitaniGeometry

/-! Identification of the integral coset calculation with the spatial
Cayley box over the real numbers. -/

open Finset

namespace FerroniHigashitani

variable {m : ℕ}

/-- The old spatial integral lattice enlarged by the all-one vector divided by six. -/
def refinedLattice (m : ℕ) : Set (Space m) :=
  {v | ∃ (r : ℤ) (y : Fin 5 → ℤ) (x : BoxIndex m → ℤ),
    (∀ i, v.1 i = (y i : ℝ) + (r : ℝ) / 6) ∧
    (∀ c, v.2 c = (x c : ℝ) + (r : ℝ) / 6)}

theorem refinedLattice_add {v w : Space m} (hv : v ∈ refinedLattice m)
    (hw : w ∈ refinedLattice m) : v + w ∈ refinedLattice m := by
  obtain ⟨r, y, x, hy, hx⟩ := hv
  obtain ⟨s, z, a, hz, ha⟩ := hw
  exact ⟨r + s, y + z, x + a,
    fun i => by change v.1 i + w.1 i = _; simp [hy, hz]; ring,
    fun c => by change v.2 c + w.2 c = _; simp [hx, ha]; ring⟩

noncomputable def ScaledPoint.spatial (v : ScaledPoint m) : Space m :=
  (fun i => (v.b i.succ : ℝ) / 6, fun c => (v.x c : ℝ) / 6)

theorem baseForm_spatial {v : ScaledPoint m} {k : ℕ} (hk : v.atDegree k) (j : Fin 6) :
    baseForm (k : ℝ) j v.spatial = (v.b j : ℝ) / 6 := by
  refine Fin.cases ?_ (fun _ => rfl) j
  have h : (∑ j, (v.b j : ℝ)) = 6 * (k : ℝ) := by
    exact_mod_cast hk
  rw [Fin.sum_univ_succ] at h
  rw [baseForm_zero]
  simp only [ScaledPoint.spatial, ← sum_div]
  linarith

theorem realCapacity_spatial (v : ScaledPoint m) (c : BoxIndex m) :
    realCapacity (fun j => (v.b j : ℝ) / 6) c = (zCapacity v.b c : ℝ) / 6 := by
  simp only [realCapacity, zCapacity]
  split_ifs <;> push_cast <;> ring

theorem spatial_mem_closedSlice_iff {v : ScaledPoint m} {k : ℕ} (hk : v.atDegree k) :
    v.spatial ∈ closedSlice (k : ℝ) ↔ v.closed := by
  rw [mem_closedSlice_iff, ScaledPoint.closed]
  simp_rw [baseForm_spatial hk, realCapacity_spatial]
  simp only [ScaledPoint.spatial]
  constructor <;> rintro ⟨hb, hx⟩
  · exact ⟨fun j => by have := hb j; exact_mod_cast (by linarith : 0 ≤ (v.b j : ℝ)),
      fun c => by
        obtain ⟨ha, hc⟩ := hx c
        exact ⟨by exact_mod_cast (by linarith : 0 ≤ (v.x c : ℝ)),
          by exact_mod_cast (by linarith : (v.x c : ℝ) ≤ (zCapacity v.b c : ℝ))⟩⟩
  · exact ⟨fun j => div_nonneg (by exact_mod_cast hb j) (by norm_num), fun c => by
      have ha : 0 ≤ (v.x c : ℝ) := by exact_mod_cast (hx c).1
      have hc : (v.x c : ℝ) ≤ (zCapacity v.b c : ℝ) := by exact_mod_cast (hx c).2
      constructor <;> linarith⟩

theorem spatial_mem_strictSlice_iff {v : ScaledPoint m} {k : ℕ} (hk : v.atDegree k) :
    v.spatial ∈ strictSlice (k : ℝ) ↔ v.strict := by
  rw [mem_strictSlice_iff, ScaledPoint.strict]
  simp_rw [baseForm_spatial hk, realCapacity_spatial]
  simp only [ScaledPoint.spatial]
  constructor <;> rintro ⟨hb, hx⟩
  · exact ⟨fun j => by have := hb j; exact_mod_cast (by linarith : 0 < (v.b j : ℝ)),
      fun c => by
        obtain ⟨ha, hc⟩ := hx c
        exact ⟨by exact_mod_cast (by linarith : 0 < (v.x c : ℝ)),
          by exact_mod_cast (by linarith : (v.x c : ℝ) < (zCapacity v.b c : ℝ))⟩⟩
  · exact ⟨fun j => div_pos (by exact_mod_cast hb j) (by norm_num), fun c => by
      have ha : 0 < (v.x c : ℝ) := by exact_mod_cast (hx c).1
      have hc : (v.x c : ℝ) < (zCapacity v.b c : ℝ) := by exact_mod_cast (hx c).2
      constructor <;> linarith⟩

theorem spatial_injective_atDegree {k : ℕ} {v w : ScaledPoint m}
    (hv : v.atDegree k) (hw : w.atDegree k) (h : v.spatial = w.spatial) : v = w := by
  apply congrArg₂ ScaledPoint.mk
  · funext j
    have e : (v.b j : ℝ) / 6 = (w.b j : ℝ) / 6 := by
      rw [← baseForm_spatial hv, ← baseForm_spatial hw, h]
    exact_mod_cast (by linarith : (v.b j : ℝ) = (w.b j : ℝ))
  · funext c
    have e := congrFun (congrArg Prod.snd h) c
    change (v.x c : ℝ) / 6 = (w.x c : ℝ) / 6 at e
    exact_mod_cast (by linarith : (v.x c : ℝ) = (w.x c : ℝ))

theorem spatial_mem_refinedLattice {v : ScaledPoint m} {r : ℤ} (hr : v.residue r) :
    v.spatial ∈ refinedLattice m := by
  refine ⟨r, fun i => (v.b i.succ - r) / 6, fun c => (v.x c - r) / 6, ?_, ?_⟩
  · intro i
    have hmod := hr.1 i.succ
    have hi : 6 * ((v.b i.succ - r) / 6) + r = v.b i.succ := by omega
    have hcast : 6 * (((v.b i.succ - r) / 6 : ℤ) : ℝ) + (r : ℝ) = v.b i.succ := by
      exact_mod_cast hi
    change (v.b i.succ : ℝ) / 6 = _
    linarith
  · intro c
    have hmod := hr.2 c
    have hc : 6 * ((v.x c - r) / 6) + r = v.x c := by omega
    have hcast : 6 * (((v.x c - r) / 6 : ℤ) : ℝ) + (r : ℝ) = v.x c := by
      exact_mod_cast hc
    change (v.x c : ℝ) / 6 = _
    linarith

theorem exists_scaled_of_mem_refinedLattice {v : Space m} (hv : v ∈ refinedLattice m) (k : ℕ) :
    ∃ (w : ScaledPoint m) (r : ℤ), w.atDegree k ∧ w.residue r ∧ w.spatial = v := by
  obtain ⟨r, y, x, hy, hx⟩ := hv
  let y' (i : Fin 5) : ℤ := 6 * y i + r
  let w : ScaledPoint m := ⟨Fin.cases (6 * k - ∑ i, y' i) y', fun c => 6 * x c + r⟩
  refine ⟨w, r, ?_, ⟨?_, ?_⟩, ?_⟩
  · unfold ScaledPoint.atDegree
    rw [Fin.sum_univ_succ]
    simp [w]
  · intro j
    refine Fin.cases ?_ (fun i => ?_) j
    · change (6 * (k : ℤ) - ∑ i, (6 * y i + r)) % 6 = r % 6
      rw [sum_add_distrib, ← mul_sum]
      simp only [sum_const, card_univ, Fintype.card_fin, nsmul_eq_mul, Nat.cast_ofNat]
      omega
    · change (6 * y i + r) % 6 = r % 6
      simp
  · intro c
    simp [w]
  · apply Prod.ext <;> funext i
    · change ((6 * y i + r : ℤ) : ℝ) / 6 = v.1 i
      rw [hy]
      push_cast
      ring
    · change ((6 * x i + r : ℤ) : ℝ) / 6 = v.2 i
      rw [hx]
      push_cast
      ring

end FerroniHigashitani
