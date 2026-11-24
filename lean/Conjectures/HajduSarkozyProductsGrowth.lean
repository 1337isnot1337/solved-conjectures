import Conjectures.HajduSarkozyProductsTails
import Conjectures.HajduSarkozyFactors

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The coefficient-tail bound on every scaled geometric grid. Its constant
depends on the fixed scale and shift, and does not depend on the cutoff.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

theorem shifted_root_grid_le {k : ℕ} {ρ t d : ℝ}
    (hk : 0 < k) (hρ : 1 < ρ) (ht : 0 ≤ t) (hd : 0 ≤ d) (L : ℕ) :
    (t*ρ^L+d)^(1/(k : ℝ)) ≤ (t+d)^(1/(k : ℝ))*(rootRatio k ρ)^L := by
  have hp : 1 ≤ ρ^L := one_le_pow₀ hρ.le
  have hinside : t*ρ^L+d ≤ (t+d)*ρ^L := by
    calc
      t*ρ^L+d ≤ t*ρ^L+d*ρ^L :=
        add_le_add le_rfl (by simpa only [mul_one] using mul_le_mul_of_nonneg_left hp hd)
      _ = (t+d)*ρ^L := by ring
  calc
    (t*ρ^L+d)^(1/(k : ℝ)) ≤ ((t+d)*ρ^L)^(1/(k : ℝ)) :=
      Real.rpow_le_rpow (by positivity) hinside (by positivity)
    _ = (t+d)^(1/(k : ℝ))*(rootRatio k ρ)^L := by
      rw [Real.mul_rpow (by positivity : 0 ≤ t+d) (by positivity : 0 ≤ ρ^L)]
      rw [← Real.rpow_pow_comm (by linarith : 0 ≤ ρ)]
      rfl

theorem coefficient_tail_grid_le {k : ℕ} (hk : 0 < k) (c : ℤ) (Q : ℕ → ℕ)
    (hsum : Summable (fun i => coefficientWeight k (Q i)))
    {ρ t : ℝ} (hρ : 1 < ρ) (ht : 0 ≤ t) (T L : ℕ) :
    count (familyPowers k c Q \ headPowers k c Q T) (t*ρ^L) ≤
      (t+(c.natAbs : ℝ))^(1/(k : ℝ))*tailMass (fun i => coefficientWeight k (Q i)) T*
        (rootRatio k ρ)^L := by
  have hτ := tailMass_nonneg (fun i => coefficientWeight_nonneg k (Q i)) hsum T
  calc
    count (familyPowers k c Q \ headPowers k c Q T) (t*ρ^L) ≤
        (t*ρ^L+(c.natAbs : ℝ))^(1/(k : ℝ))*tailMass (fun i => coefficientWeight k (Q i)) T :=
      coefficient_tail_count_le hk c Q hsum T (by positivity)
    _ ≤ ((t+(c.natAbs : ℝ))^(1/(k : ℝ))*(rootRatio k ρ)^L)*
        tailMass (fun i => coefficientWeight k (Q i)) T :=
      mul_le_mul_of_nonneg_right (shifted_root_grid_le hk hρ ht (Nat.cast_nonneg _) L) hτ
    _ = _ := by ring

end

end Conjectures.HajduSarkozy.Products
