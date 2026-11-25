import Conjectures.FerroniHigashitaniLattice

/-! An explicit real linear change of coordinates identifies the refined
lattice with the usual integral coordinate lattice. -/

namespace FerroniHigashitani

noncomputable def toBasis (m : ℕ) : Space m ≃ₗ[ℝ] Space m where
  toFun v := (fun i => if i = 0 then 6 * v.1 0 else v.1 i - v.1 0,
    fun c => v.2 c - v.1 0)
  invFun v := (fun i => if i = 0 then v.1 0 / 6 else v.1 i + v.1 0 / 6,
    fun c => v.2 c + v.1 0 / 6)
  left_inv v := by
    apply Prod.ext <;> funext i
    · by_cases hi : i = 0 <;> simp [hi]
    · simp
  right_inv v := by
    apply Prod.ext <;> funext i
    · by_cases hi : i = 0
      · simp [hi]
        ring
      · simp [hi]
    · simp
  map_add' v w := by
    apply Prod.ext <;> funext i
    · by_cases hi : i = 0 <;> simp [hi] <;> ring
    · simp
      ring
  map_smul' a v := by
    apply Prod.ext <;> funext i
    · by_cases hi : i = 0 <;> simp [hi] <;> ring
    · simp
      ring

def standardLattice (m : ℕ) : Set (Space m) :=
  {v | ∃ (y : Fin 5 → ℤ) (x : BoxIndex m → ℤ),
    (∀ i, v.1 i = (y i : ℝ)) ∧ (∀ c, v.2 c = (x c : ℝ))}

theorem mem_standardLattice_toBasis_iff {m : ℕ} (v : Space m) :
    toBasis m v ∈ standardLattice m ↔ v ∈ refinedLattice m := by
  constructor
  · rintro ⟨y, x, hy, hx⟩
    have h0 := hy 0
    change 6 * v.1 0 = _ at h0
    refine ⟨y 0, fun i => if i = 0 then 0 else y i, x, ?_, ?_⟩
    · intro i
      have hi := hy i
      change (if i = 0 then 6 * v.1 0 else v.1 i - v.1 0) = _ at hi
      by_cases e : i = 0
      · subst i
        simp only [ite_true, Int.cast_zero, zero_add]
        linarith
      · simp only [e, ite_false] at hi ⊢
        linarith
    · intro c
      have hc := hx c
      change v.2 c - v.1 0 = _ at hc
      linarith
  · rintro ⟨r, y, x, hy, hx⟩
    refine ⟨fun i => if i = 0 then 6 * y 0 + r else y i - y 0,
      fun c => x c - y 0, ?_, ?_⟩
    · intro i
      change (if i = 0 then 6 * v.1 0 else v.1 i - v.1 0) = _
      by_cases e : i = 0 <;> simp [e, hy]
      ring
    · intro c
      change v.2 c - v.1 0 = _
      simp [hy, hx]

end FerroniHigashitani
