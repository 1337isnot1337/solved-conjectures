import Conjectures.LonelinessCriticalBase
import Mathlib.Data.Finset.Max
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Tactic.FinCases

/-! A simultaneous odd period vector gives one rotation with the required
clearance. This is the interval-intersection step of the three-difference
argument; its determinant inequalities are explicit hypotheses here. -/

namespace Haralambis

def speeds (d : Fin 3 → ℕ) : List ℕ := [d 0, d 1, d 2]

theorem clearance_of_odd_vector (d : Fin 3 → ℕ) (w : Fin 3 → ℤ) (δ : ℝ)
    (hd : ∀ i, 0 < d i) (hw : ∀ i, w i % 2 = 1)
    (hdet : ∀ i j, i ≠ j →
      |(d j : ℝ) * w i - (d i : ℝ) * w j| ≤
        ((d i : ℝ) + d j) * (1 - 2 * δ)) :
    ∃ t : ℝ, δ ≤ Loneliness.clearance (speeds d) t := by
  have hdR : ∀ i, 0 < (d i : ℝ) := fun i => by exact_mod_cast hd i
  have h01 := hdet 0 1 (by decide)
  have hp : 0 < (d 0 : ℝ) + d 1 := add_pos (hdR 0) (hdR 1)
  have hE : 0 ≤ 1 - 2 * δ :=
    nonneg_of_mul_nonneg_right ((abs_nonneg _).trans h01) hp
  have hδ : δ ≤ 1 / 2 := by linarith only [hE]
  have hb : ∀ i j,
      |(d j : ℝ) * w i - (d i : ℝ) * w j| ≤
        ((d i : ℝ) + d j) * (1 - 2 * δ) := by
    intro i j
    by_cases hij : i = j
    · subst j
      simp only [sub_self, abs_zero]
      exact mul_nonneg (le_of_lt (add_pos (hdR i) (hdR i))) hE
    · exact hdet i j hij
  let lo (i : Fin 3) : ℝ := ((w i : ℝ) - (1 - 2 * δ)) / d i
  let hi (i : Fin 3) : ℝ := ((w i : ℝ) + (1 - 2 * δ)) / d i
  have hpair : ∀ i j, lo i ≤ hi j := by
    intro i j
    dsimp [lo, hi]
    apply (div_le_div_iff₀ (hdR i) (hdR j)).2
    have h := (le_abs_self _).trans (hb i j)
    nlinarith only [h]
  obtain ⟨k, _, hmax⟩ := Finset.exists_max_image (Finset.univ : Finset (Fin 3))
    lo (by simp)
  let x := lo k
  have hx : ∀ i, lo i ≤ x ∧ x ≤ hi i := by
    intro i
    exact ⟨hmax i (by simp), hpair k i⟩
  have hclear : ∀ i, δ ≤ Loneliness.distance ((d i : ℝ) * (x / 2)) := by
    intro i
    have hl := (div_le_iff₀ (hdR i)).mp (hx i).1
    have hu := (le_div_iff₀ (hdR i)).mp (hx i).2
    obtain ⟨z, hz⟩ := Int.odd_iff.mpr (hw i)
    have hzR : (w i : ℝ) = 2 * (z : ℝ) + 1 := by exact_mod_cast hz
    apply Loneliness.distance_lower_of_cell (k := z)
    · linarith only [hl, hzR]
    · linarith only [hu, hzR]
  refine ⟨x / 2, Loneliness.le_clearance hδ ?_⟩
  intro v hv
  simp only [speeds, List.mem_cons, List.not_mem_nil, or_false] at hv
  rcases hv with rfl | rfl | rfl
  · exact hclear 0
  · exact hclear 1
  · exact hclear 2

theorem value_ge_of_odd_vector (d : Fin 3 → ℕ) (w : Fin 3 → ℤ) (δ : ℝ)
    (hd : ∀ i, 0 < d i) (hw : ∀ i, w i % 2 = 1)
    (hdet : ∀ i j, i ≠ j →
      |(d j : ℝ) * w i - (d i : ℝ) * w j| ≤
        ((d i : ℝ) + d j) * (1 - 2 * δ)) :
    δ ≤ Loneliness.value (speeds d) := by
  obtain ⟨t, ht⟩ := clearance_of_odd_vector d w δ hd hw hdet
  exact ht.trans (Loneliness.CriticalFamilies.le_value_any (speeds d) t)

end Haralambis
