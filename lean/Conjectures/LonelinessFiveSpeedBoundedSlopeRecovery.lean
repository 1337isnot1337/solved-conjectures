import Conjectures.LonelinessFiveSpeedBoundedSlope

/-! A bounded signed integer is recovered uniquely from its residue when
its absolute bound is strictly smaller than half the modulus. -/
namespace Loneliness.FiveSpeedCertificate

/-- Semantic witnesses are exactly the five coordinate inequalities. This
also binds witnesses checked on a computable list of absolute coordinates. -/
theorem witness_integerSpeeds_iff (p t : ℕ) (v : FiveIntegerVector) :
    Loneliness.Modular.Witness 5 p t
      (Loneliness.CoordinateSubspace.integerSpeeds v) ↔
      ∀ j : Fin 5, good p t (v j).natAbs := by
  constructor
  · intro h j
    exact h _ ((Loneliness.CoordinateSubspace.mem_integerSpeeds v _).mpr ⟨j, rfl⟩)
  · intro h d hd
    obtain ⟨j, rfl⟩ := (Loneliness.CoordinateSubspace.mem_integerSpeeds v d).mp hd
    exact h j

def signedRepresentative (p a : ℕ) : ℤ :=
  if 2 * (a % p) ≤ p then ((a % p : ℕ) : ℤ) else ((a % p : ℕ) : ℤ) - (p : ℤ)

theorem signedRepresentative_cast (p a : ℕ) :
    (signedRepresentative p a : ZMod p) = (a : ZMod p) := by
  unfold signedRepresentative
  split_ifs <;>
    simp only [Int.cast_natCast, Int.cast_sub, ZMod.natCast_mod,
      ZMod.natCast_self, sub_zero]

theorem integerResidue_signedRepresentative (p a : ℕ) (hp : 0 < p) :
    integerResidue p (signedRepresentative p a) = a % p := by
  rw [integerResidue_eq_val p hp, signedRepresentative_cast, ZMod.val_natCast]

/-- This recovery statement needs no primality assumption. -/
theorem signedRepresentative_recover (p K a : ℕ) (hp : 0 < p) (hK : 2 * K < p)
    (y : ℤ) (hy : y.natAbs ≤ K) (hmod : integerResidue p y = a % p) :
    y = signedRepresentative p a := by
  have hyu : y ≤ (y.natAbs : ℤ) := Int.le_natAbs
  have hyl : -(y.natAbs : ℤ) ≤ y := by
    have h := Int.le_natAbs (a := -y)
    simp only [Int.natAbs_neg] at h
    omega
  have hbounds : -(K : ℤ) ≤ y ∧ y ≤ (K : ℤ) := by omega
  have hncast : ((a % p : ℕ) : ℤ) = y % (p : ℤ) := by
    rw [← hmod]
    exact Int.toNat_of_nonneg (Int.emod_nonneg y (by omega : (p : ℤ) ≠ 0))
  by_cases hy0 : 0 ≤ y
  · have hrem : y % (p : ℤ) = y := Int.emod_eq_of_lt hy0 (by omega)
    rw [hrem] at hncast
    have hhalf : 2 * (a % p) ≤ p := by omega
    simp only [signedRepresentative, ite_eq_left hhalf]
    exact hncast.symm
  · have hrem : y % (p : ℤ) = y + (p : ℤ) := by
      have h := Int.emod_eq_of_lt
        (by omega : 0 ≤ y + (p : ℤ)) (by omega : y + (p : ℤ) < (p : ℤ))
      simpa only [Int.add_emod_right] using h
    rw [hrem] at hncast
    have hhalf : ¬2 * (a % p) ≤ p := by omega
    simp only [signedRepresentative, ite_eq_right hhalf]
    omega

/-- A residue has at most one representative satisfying the prescribed bound. -/
theorem bounded_residue_unique (p K a : ℕ) (hp : 0 < p) (hK : 2 * K < p)
    (y z : ℤ) (hy : y.natAbs ≤ K) (hz : z.natAbs ≤ K)
    (hymod : integerResidue p y = a % p) (hzmod : integerResidue p z = a % p) :
    y = z := by
  exact (signedRepresentative_recover p K a hp hK y hy hymod).trans
    (signedRepresentative_recover p K a hp hK z hz hzmod).symm

theorem bounded_residue_iff (p K a : ℕ) (hp : 0 < p) (hK : 2 * K < p) (y : ℤ) :
    (y.natAbs ≤ K ∧ integerResidue p y = a % p) ↔
      y = signedRepresentative p a ∧ (signedRepresentative p a).natAbs ≤ K := by
  constructor
  · rintro ⟨hy, hmod⟩
    have he := signedRepresentative_recover p K a hp hK y hy hmod
    exact ⟨he, he ▸ hy⟩
  · rintro ⟨rfl, hy⟩
    exact ⟨hy, integerResidue_signedRepresentative p a hp⟩

theorem integerResidue_of_slope (p : ℕ) (hp : p.Prime) (x : ℕ)
    (hx : 0 < x) (hxp : x < p) (y : ℤ) :
    integerResidue p y = (x * slopeResidue p x y) % p := by
  have he : (y : ZMod p) = ((x * slopeResidue p x y : ℕ) : ZMod p) := by
    simpa only [Nat.cast_mul] using (slopeResidue_mul p hp x hx hxp y).symm
  rw [integerResidue_eq_val p hp.pos]
  simpa only [ZMod.val_natCast] using congrArg ZMod.val he

theorem slope_signedRepresentative_recover (p : ℕ) (hp : p.Prime) (K x : ℕ)
    (hK : 2 * K < p) (hx : 0 < x) (hxp : x < p) (y : ℤ)
    (hy : y.natAbs ≤ K) :
    y = signedRepresentative p (x * slopeResidue p x y) := by
  exact signedRepresentative_recover p K (x * slopeResidue p x y) hp.pos hK y hy
    (integerResidue_of_slope p hp x hx hxp y)

end Loneliness.FiveSpeedCertificate
