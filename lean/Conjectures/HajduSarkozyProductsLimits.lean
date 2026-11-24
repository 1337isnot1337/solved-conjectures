import Conjectures.HajduSarkozy
import Mathlib.Topology.Order.LiminfLimsup

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The passage from geometric-grid estimates to the actual real-threshold
little-oh condition, the literal retained-count limsup, and stability of
the added/retained conditions under every finite modification.
-/

open Classical Filter Finset Asymptotics
open scoped symmDiff Topology

namespace Conjectures.HajduSarkozy.Products

noncomputable section

/-- A geometric estimate for the actual monotone counting function controls every real threshold. -/
theorem sparse_of_grid {k : ℕ} {S : Set ℕ} {ρ : ℝ}
    (hk : 0 < k) (hρ : 1 < ρ)
    (hgrid : (fun L : ℕ => count S (ρ^L)) =o[atTop]
      fun L => (rootRatio k ρ)^L) : Sparse k S := by
  have hq : 1 < rootRatio k ρ := rootRatio_gt_one hk hρ
  have hshift := shift_isLittleO hq hgrid
  apply IsLittleO.of_bound
  intro ε hε
  obtain ⟨N, hN⟩ := eventually_atTop.mp (hshift.bound hε)
  apply eventually_atTop.mpr
  refine ⟨ρ^N, fun X hX => ?_⟩
  have hX1 : 1 ≤ X := (one_le_pow₀ hρ.le).trans hX
  obtain ⟨L, hlow, hhigh⟩ := exists_nat_pow_near hX1 hρ
  have hNL : N ≤ L := by
    by_contra h
    have hp : ρ^(L+1) ≤ ρ^N := pow_le_pow_right₀ hρ.le (by omega)
    exact (not_lt_of_ge (hp.trans hX)) hhigh
  have hgridBound : count S (ρ^(L+1)) ≤ ε*(rootRatio k ρ)^L := by
    simpa only [Real.norm_of_nonneg (count_nonneg S (ρ^(L+1))),
      Real.norm_of_nonneg (pow_nonneg (by linarith : 0 ≤ rootRatio k ρ) L)] using hN L hNL
  have hroot : (rootRatio k ρ)^L ≤ X^(1/(k : ℝ)) := by
    unfold rootRatio
    rw [Real.rpow_pow_comm (by linarith : 0 ≤ ρ)]
    exact Real.rpow_le_rpow (pow_nonneg (by linarith) L) hlow (by positivity)
  rw [Real.norm_of_nonneg (count_nonneg S X),
    Real.norm_of_nonneg (Real.rpow_nonneg (by linarith : 0 ≤ X) _)]
  exact ((count_mono (fun _ hn => hn : S ⊆ S) hhigh.le).trans hgridBound).trans
    (mul_le_mul_of_nonneg_left hroot hε.le)

theorem sparse_limsup_zero {k : ℕ} {S : Set ℕ} (hS : Sparse k S) :
    limsup (fun X : ℝ => count S X / X^(1/(k : ℝ))) atTop = 0 :=
  hS.tendsto_div_nhds_zero.limsup_eq

theorem not_sparse_of_positive_limsup {k : ℕ} {S : Set ℕ}
    (hS : 0 < limsup (fun X : ℝ => count S X / X^(1/(k : ℝ))) atTop) :
    ¬ Sparse k S := by
  intro hs
  rw [sparse_limsup_zero hs] at hS
  exact (lt_irrefl 0) hS

/-- The two hypotheses used in the summable-family contradiction survive finite changes. -/
theorem finite_change_conditions {k : ℕ} (hk : 0 < k) (P R T : Set ℕ)
    (hfinite : (T ∆ R).Finite) (hadded : Sparse k (R \ P))
    (hretained : ¬ Sparse k (R ∩ P)) :
    Sparse k (T \ P) ∧ ¬ Sparse k (T ∩ P) := by
  have herror : Sparse k (T ∆ R) := sparse_finite hk hfinite
  constructor
  · apply sparse_mono _ (sparse_union hadded herror)
    intro n hn
    by_cases hnR : n ∈ R
    · exact Or.inl ⟨hnR, hn.2⟩
    · exact Or.inr (Or.inl ⟨hn.1, hnR⟩)
  · intro hT
    apply hretained
    apply sparse_mono _ (sparse_union hT herror)
    intro n hn
    by_cases hnT : n ∈ T
    · exact Or.inl ⟨hnT, hn.2⟩
    · exact Or.inr (Or.inr ⟨hn.1, hnT⟩)

end

end Conjectures.HajduSarkozy.Products
