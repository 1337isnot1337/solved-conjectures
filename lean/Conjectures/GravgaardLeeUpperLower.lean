import Conjectures.GravgaardLeeUpperLowerConvergence
import Conjectures.GravgaardLeeUpperLowerTwo

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

The original Conjecture 2.6 of Maiken Gravgaard and Ying Wai Lee,
arXiv:2506.12513v2. This formalizes the existing direct refinement proof
in `results/gravgaard-lee-upper-lower-luroth/DIRECT-REFINEMENT.md`,
recorded by Cinna Davis in commit 06f4ac32f33e84191048569c621ca41b8c9cd91f.
No new priority claim is made. The stronger exact interval theorem uses
actual infinite digit expansions, including the strict lower endpoint.
-/

open Set
open scoped Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

/-- Every threshold allowed in the original conjecture, including two. -/
theorem interval_subset_sum {k : ℕ} (hk : 2 ≤ k) :
    Ioc (endpoint k) (1 + endpoint k) ⊆ smallDigitSet k + largeDigitSet k := by
  by_cases hk3 : 3 ≤ k
  · exact interval_subset_sum_ge_three hk3
  · have hk2 : k = 2 := by omega
    subst k
    intro x hx
    have hbounds : 1 < x ∧ x ≤ 2 := by
      norm_num [endpoint] at hx
      exact hx
    refine ⟨1, ?_, x - 1, ?_, by ring⟩
    · rw [smallDigitSet_two]
      exact mem_singleton 1
    · rw [largeDigitSet_two]
      exact ⟨by linarith [hbounds.1], by linarith [hbounds.2]⟩

/-- Exact sum of the two actual infinite Lüroth digit sets. -/
theorem exact_sum_interval {k : ℕ} (hk : 2 ≤ k) :
    smallDigitSet k + largeDigitSet k = Ioc (endpoint k) (1 + endpoint k) :=
  Subset.antisymm (sum_subset_target hk) (interval_subset_sum hk)

/-- Gravgaard–Lee's original Conjecture 2.6: the sum represents every real
residue modulo one, uniformly in the common threshold. -/
theorem conjecture_2_6 {k : ℕ} (hk : 2 ≤ k) (x : ℝ) :
    ∃ y ∈ smallDigitSet k + largeDigitSet k, ∃ n : ℤ, x = y + n := by
  let n : ℤ := ⌈x - endpoint k⌉ - 1
  refine ⟨x - n, interval_subset_sum hk ?_, n, by ring⟩
  have hlo := Int.ceil_lt_add_one (x - endpoint k)
  have hhi := Int.le_ceil (x - endpoint k)
  dsimp [n]
  push_cast
  exact ⟨by linarith, by linarith⟩

/-- An explicit expansion-level version of the original conjecture. -/
theorem conjecture_2_6_digits {k : ℕ} (hk : 2 ≤ k) (x : ℝ) :
    ∃ d e : ℕ → ℕ, (∀ i, 2 ≤ d i ∧ d i ≤ k) ∧ (∀ i, k ≤ e i) ∧
      ∃ n : ℤ, x = value d + value e + n := by
  obtain ⟨y, ⟨u, hu, v, hv, rfl⟩, n, hn⟩ := conjecture_2_6 hk x
  obtain ⟨d, hd, rfl⟩ := mem_smallDigitSet.mp hu
  obtain ⟨e, he, rfl⟩ := (mem_largeDigitSet hk).mp hv
  exact ⟨d, e, hd, he, n, hn⟩

end
end GravgaardLeeUpperLower
