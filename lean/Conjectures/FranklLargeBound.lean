module

public import Conjectures.FranklLopsided
public import Conjectures.FranklArithmetic

@[expose] public section

/-! Assemble the exact cardinal conditioning estimates with the all-parameter
numerical inequalities. The separate incidence/selection modules discharge
the hypotheses for actual three-regular linear generating families. -/

namespace Frankl.LargeBound

open Finset Frankl.Lopsided FranklArithmetic

variable {Ω ι : Type*} [Fintype Ω] [Fintype ι] [DecidableEq Ω] [DecidableEq ι]

/-- The exact `343/1000` absence bound, without division by the size of the
conditioning event. Every combinatorial hypothesis remains explicit here. -/
theorem cardinal_absence_bound (k : ℕ) (hk : 15 ≤ k)
    (bad : ι → Finset Ω) (neighbors : ι → Finset ι)
    (query : Finset Ω) (readers : Finset ι)
    (hdegree : ∀ i, (neighbors i).card ≤ 2 * k)
    (hreaders : readers.card ≤ 3 * (2 * k))
    (hlopsided : ∀ i t, i ∉ t → Disjoint t (neighbors i) →
      ((bad i ∩ avoid bad t).card : ℝ) ≤
        ((1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k) * ((avoid bad t).card : ℝ))
    (hquery : 8 * (query ∩ avoid bad (univ \ readers)).card =
      (avoid bad (univ \ readers)).card) :
    1000 * (query ∩ avoid bad univ).card ≤ 343 * (avoid bad univ).card := by
  have hk0 : 0 < k := by omega
  let x := eventBound k
  have hx0 : 0 ≤ x := (eventBound_pos hk0).le
  have hx1 : x ≤ 1 := eventBound_le_one hk0
  have hb := conditional_card_bound bad neighbors (2 * k) hx0 hx1 hdegree
    (lopsided_criterion hk) hlopsided
  have hq : ((query ∩ avoid bad (univ \ readers)).card : ℝ) ≤
      (1 / 8 : ℝ) * ((avoid bad (univ \ readers)).card : ℝ) := by
    have he : (8 : ℝ) * ((query ∩ avoid bad (univ \ readers)).card : ℝ) =
        ((avoid bad (univ \ readers)).card : ℝ) := by exact_mod_cast hquery
    linarith
  have hbounds : ∀ i ∈ readers, ∀ r ⊆ readers, i ∉ r →
      ((bad i ∩ avoid bad ((univ \ readers) ∪ r)).card : ℝ) ≤
        x * ((avoid bad ((univ \ readers) ∪ r)).card : ℝ) := by
    intro i hi r hr hir
    apply hb
    simp only [mem_union, mem_sdiff, mem_univ, true_and, not_or, not_not]
    exact ⟨hi, hir⟩
  have hconditioning := query_card_bound bad query (univ \ readers) readers hx1
    (by norm_num : (0 : ℝ) ≤ 1 / 8) hbounds hq
  have hunion : (univ \ readers : Finset ι) ∪ readers = univ := by
    ext i
    simp
  rw [hunion] at hconditioning
  have hpower : (1 - x) ^ (3 * (2 * k)) ≤ (1 - x) ^ readers.card :=
    pow_le_pow_of_le_one (sub_nonneg.mpr hx1) (by linarith) hreaders
  have hcount : (0 : ℝ) ≤ ((query ∩ avoid bad univ).card : ℝ) := by positivity
  have hsmall := mul_le_mul_of_nonneg_right hpower hcount
  have hfloor := avoidance_three_blocks hk0
  have hfloorCount := mul_le_mul_of_nonneg_right hfloor hcount
  have hout : (1000 : ℝ) * ((query ∩ avoid bad univ).card : ℝ) ≤
      343 * ((avoid bad univ).card : ℝ) := by
    dsimp [x] at hconditioning hsmall
    norm_num at hfloorCount
    nlinarith
  exact_mod_cast hout

end Frankl.LargeBound
