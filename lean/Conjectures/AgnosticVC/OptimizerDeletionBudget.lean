module

public import Conjectures.AgnosticVC.OptimizerDeletion
public import Conjectures.AgnosticVC.Parameters

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

/-- The total Hellinger cost of changing the restriction scheme on a block of at least
`n` positions is at most `8d` for the schedule chosen at size `n`. -/
theorem schedule_restriction_deletion_budget {n d m : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (hm : n ≤ m) :
    let σ := schedule n d
    let N : ℝ := m
    N * (8 * ((∑ j, σ.coeff j * ((σ.size j : ℝ) / N)) / σ.temperature)^2) ≤ 8 * (d : ℝ) := by
  intro σ N
  let L := (d : ℝ) * 4 ^ depth n d
  have hτ : 0 < σ.temperature := schedule_temperature_pos hd (hd.trans_le hn)
  have hN : 0 < N := Nat.cast_pos.mpr ((hd.trans_le hn).trans_le hm)
  let S := ∑ j, σ.coeff j * (σ.size j : ℝ)
  have hS : S ≤ σ.temperature * L := by
    let f := fun j : ℕ => (temperatureAt n d j - temperatureAt n d (j+1)) * ((d : ℝ) * 4 ^ j)
    have he : S = ∑ j ∈ Finset.range (depth n d + 1), f j := by
      change (∑ j : Fin (depth n d + 1), (temperatureAt n d j.val - temperatureAt n d (j.val+1)) *
        ((d * 4 ^ j.val : ℕ) : ℝ)) = _
      simp only [Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]
      exact Fin.sum_univ_eq_sum_range f _
    rw [he]
    have h := restriction_size_sum_le n d (depth n d + 1)
    rw [pow_succ, ← mul_assoc (d : ℝ)] at h
    change (∑ j ∈ Finset.range (depth n d + 1), f j) ≤ σ.temperature * (L * 4) / 4 at h
    linarith only [h]
  have hL : L^2 ≤ (n : ℝ) * d := by
    dsimp [L]
    exact_mod_cast last_size_sq_le hd hn
  let A := (∑ j, σ.coeff j * ((σ.size j : ℝ) / N)) / σ.temperature
  have hA : A = S / N / σ.temperature := by
    have hsum : (∑ j, σ.coeff j * ((σ.size j : ℝ) / N)) = S / N := by
      unfold S
      rw [Finset.sum_div]
      exact Finset.sum_congr rfl fun j _ => by ring
    unfold A
    rw [hsum]
  have hnon : 0 ≤ A := by
    unfold A
    exact div_nonneg (Finset.sum_nonneg fun j _ => mul_nonneg (schedule_coeff_nonneg n d j)
      (div_nonneg (Nat.cast_nonneg _) hN.le)) hτ.le
  have hAle : A ≤ L / N := by
    rw [hA]
    apply (div_le_iff₀ hτ).mpr
    rw [div_mul_eq_mul_div]
    exact div_le_div_of_nonneg_right (hS.trans_eq (mul_comm _ _)) hN.le
  calc
    N * (8 * A^2) ≤ N * (8 * (L / N)^2) := by
      gcongr
    _ = 8 * (L^2 / N) := by field_simp
    _ ≤ 8 * (d : ℝ) := by
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      apply (div_le_iff₀ hN).mpr
      have hcast : (n : ℝ) ≤ N := by dsimp [N]; exact_mod_cast hm
      exact hL.trans (mul_comm (n : ℝ) (d : ℝ) ▸ mul_le_mul_of_nonneg_left hcast (Nat.cast_nonneg d))

/-- The deletion estimate at the prescribed schedule, with the restriction and redundant-trace
cost already bounded by the VC dimension parameter. -/
theorem sum_hellingerSq_schedule_deleted_le {n d m : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (hm : n ≤ m + 1) (hsize : ∀ j, (schedule n d).size j < m + 1)
    (F : Finset (Finset (Fin (m + 1)))) [Nonempty ↥F] [∀ i, Nonempty ↥(DeletedFamily F i)]
    (hVC : F.vcDim ≤ d) (y : Fin (m + 1) → Bool) (w : Fin (m + 1) → ℝ)
    (sectionRep : ∀ i, ↥(DeletedFamily F i) → ↥F)
    (hs : ∀ i, Function.LeftInverse (forgetTrace F i) (sectionRep i)) :
    let σ := schedule n d
    let q := optimizer (fun v : ↥F => mistakeCount y w v.val) σ.temperature
      (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)
    let r := fun i => optimizer (fun v : ↥F => mistakeCount y (Function.update w i 0) v.val) σ.temperature
      (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)
    (∑ i, hellingerSq q (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w))) ≤
      576 * (d : ℝ) + 68 * ∑ i, hellingerSq q (r i) := by
  intro σ q r
  have hτ := schedule_temperature_pos hd (hd.trans_le hn)
  have hc := schedule_coeff_nonneg n d
  have hsize' (j : Fin σ.levels) : σ.size j < Fintype.card (Fin (m + 1)) := by
    simpa only [Fintype.card_fin] using hsize j
  have h := sum_hellingerSq_deleted_le F σ y w sectionRep hs hτ hc hsize'
  simp only [Fintype.card_fin] at h
  have hB := schedule_restriction_deletion_budget hd hn hm
  have hV : (F.vcDim : ℝ) ≤ d := by exact_mod_cast hVC
  change (∑ i, hellingerSq q (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w))) ≤
    32 * (F.vcDim : ℝ) + 68 * ((∑ i, hellingerSq q (r i)) +
      ((m + 1 : ℕ) : ℝ) * (8 * ((∑ j, σ.coeff j * ((σ.size j : ℝ) / ((m + 1 : ℕ) : ℝ))) / σ.temperature)^2)) at h
  linarith only [h, hB, hV]

end AgnosticVC
