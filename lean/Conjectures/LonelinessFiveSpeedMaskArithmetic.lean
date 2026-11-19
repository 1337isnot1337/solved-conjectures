import Conjectures.LonelinessFiveSpeedMasks

/-! Modular identities used by the five-speed fiber mask checker. -/
namespace Loneliness.FiveSpeedCertificate

theorem good_congr {p t r u v : ℕ} (h : t * r % p = u * v % p) :
    good p t r ↔ good p u v := by
  unfold good foldResidue
  rw [h]

theorem good_mod_left (p t r : ℕ) : good p (t % p) r ↔ good p t r := by
  apply good_congr
  simp only [Nat.mul_mod, Nat.mod_mod]

theorem good_mod_right (p t r : ℕ) : good p t (r % p) ↔ good p t r := by
  apply good_congr
  simp only [Nat.mul_mod, Nat.mod_mod]

theorem foldResidue_eq_of_add_mod_zero (p a b : ℕ) (hp : 0 < p)
    (hab : (a + b) % p = 0) : foldResidue p a = foldResidue p b := by
  have ha := Nat.mod_lt a hp
  have hb := Nat.mod_lt b hp
  have hs : (a % p + b % p) % p = 0 := by
    simpa only [Nat.add_mod, Nat.mod_mod] using hab
  unfold foldResidue
  by_cases hlt : a % p + b % p < p
  · rw [Nat.mod_eq_of_lt hlt] at hs
    have ha0 : a % p = 0 := by omega
    have hb0 : b % p = 0 := by omega
    rw [ha0, hb0]
  · have hle : p ≤ a % p + b % p := by omega
    have hsmall : a % p + b % p - p < p := by omega
    rw [Nat.mod_eq_sub_mod hle, Nat.mod_eq_of_lt hsmall] at hs
    have hca : p - a % p = b % p := by omega
    have hcb : p - b % p = a % p := by omega
    rw [hca, hcb, min_comm]

theorem foldResidue_complement_mul (p u r : ℕ) (hp : 0 < p) (hu : u ≤ p) :
    foldResidue p ((p - u) * r) = foldResidue p (u * r) := by
  apply foldResidue_eq_of_add_mod_zero p _ _ hp
  rw [← Nat.add_mul, Nat.sub_add_cancel hu]
  simp

theorem good_fold_left (p t r : ℕ) (hp : 0 < p) :
    good p (foldResidue p t) r ↔ good p t r := by
  change good p (min (t % p) (p - t % p)) r ↔ good p t r
  have ht : t % p ≤ p := (Nat.mod_lt _ hp).le
  by_cases h : t % p ≤ p - t % p
  · rw [min_eq_left h]
    exact good_mod_left p t r
  · rw [min_eq_right (by omega)]
    calc
      good p (p - t % p) r ↔ good p (t % p) r := by
        unfold good
        rw [foldResidue_complement_mul p (t % p) r hp ht]
      _ ↔ good p t r := good_mod_left p t r

theorem foldResidue_lt (p t : ℕ) (hp : 0 < p) : foldResidue p t < p :=
  (min_le_left _ _).trans_lt (Nat.mod_lt _ hp)

theorem foldResidue_le_half (p t : ℕ) : foldResidue p t ≤ p / 2 := by
  unfold foldResidue
  by_cases h : t % p ≤ p - t % p
  · rw [min_eq_left h]
    omega
  · rw [min_eq_right (by omega)]
    omega

theorem goodMask_of_fold (p t G : ℕ) (hp : 0 < p)
    (hG : GoodMask p (foldResidue p t) G) : GoodMask p t G := by
  refine ⟨hG.1, ?_⟩
  intro r hr
  exact (hG.2 r hr).trans (good_fold_left p t r hp)

theorem affine_inverse_mod (p t c a s z : ℕ) (hcs : c * s % p = 1) :
    (t * c % p) * ((z + a * s % p) % p) % p = t * (a + c * z) % p := by
  have hs : Nat.ModEq p (c * (a * s % p)) a := by
    simpa only [Nat.ModEq, Nat.mul_comm a s] using inverse_mul_mod p c s a hcs
  have hr : Nat.ModEq p (c * (z + a * s % p)) (a + c * z) := by
    simpa only [Nat.mul_add, Nat.add_comm] using (Nat.ModEq.refl (c * z)).add hs
  have hm := (Nat.mod_modEq (t * c) p).mul (Nat.mod_modEq (z + a * s % p) p)
  exact hm.trans (by simpa only [Nat.mul_assoc] using hr.mul_left t)

theorem affine_constant_mod (p a c z : ℕ) (hc : c % p = 0) :
    (a + c * z) % p = a % p := by
  simp only [Nat.add_mod, Nat.mul_mod, hc, Nat.zero_mul, Nat.zero_mod,
    Nat.add_zero, Nat.mod_mod]

theorem good_affine_constant (p t a c z : ℕ) (hc : c % p = 0) :
    good p t (a + c * z) ↔ good p t a := by
  apply good_congr
  rw [Nat.mul_mod, affine_constant_mod p a c z hc, ← Nat.mul_mod]

end Loneliness.FiveSpeedCertificate
