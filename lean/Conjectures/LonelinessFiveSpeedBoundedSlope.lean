import Conjectures.LonelinessFiveSpeedPlaneProjective

/-! Modular slopes for the final bounded two-parameter families. Matrix
coefficients and the second parameter may have either sign. -/
namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

abbrev TwoParameterMap := Matrix (Fin 5) (Fin 2) ℤ

def slopeResidue (p x : ℕ) (y : ℤ) : ℕ :=
  ((y : ZMod p) * (x : ZMod p)⁻¹).val

noncomputable def slopeSpeeds (B : TwoParameterMap) (r : ℕ) : List ℕ :=
  Loneliness.CoordinateSubspace.integerSpeeds (B *ᵥ ![1, (r : ℤ)])

/-- Finite arithmetic may check the five rows directly; the semantic speed
list is a noncomputable enumeration of their distinct absolute values. -/
theorem witness_slopeSpeeds_iff (p t : ℕ) (B : TwoParameterMap) (r : ℕ) :
    Loneliness.Modular.Witness 5 p t (slopeSpeeds B r) ↔
      ∀ j : Fin 5, good p t ((B *ᵥ ![1, (r : ℤ)]) j).natAbs := by
  constructor
  · intro h j
    exact h _ ((Loneliness.CoordinateSubspace.mem_integerSpeeds
      (B *ᵥ ![1, (r : ℤ)]) _).mpr ⟨j, rfl⟩)
  · intro h d hd
    obtain ⟨j, rfl⟩ := (Loneliness.CoordinateSubspace.mem_integerSpeeds
      (B *ᵥ ![1, (r : ℤ)]) d).mp hd
    exact h j

theorem slopeResidue_lt (p x : ℕ) (y : ℤ) (hp : 0 < p) :
    slopeResidue p x y < p := by
  letI : NeZero p := ⟨Nat.ne_of_gt hp⟩
  exact ZMod.val_lt _

theorem natCast_ne_zero_of_lt (p x : ℕ) (hx : 0 < x) (hxp : x < p) :
    (x : ZMod p) ≠ 0 := by
  intro hzero
  exact Nat.not_dvd_of_pos_of_lt hx hxp ((ZMod.natCast_eq_zero_iff x p).mp hzero)

theorem slopeResidue_mul (p : ℕ) (hp : p.Prime) (x : ℕ)
    (hx : 0 < x) (hxp : x < p) (y : ℤ) :
    (x : ZMod p) * (slopeResidue p x y : ZMod p) = (y : ZMod p) := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : NeZero p := ⟨hp.ne_zero⟩
  have hcancel : (x : ZMod p) * (x : ZMod p)⁻¹ = 1 :=
    mul_inv_cancel₀ (natCast_ne_zero_of_lt p x hx hxp)
  rw [slopeResidue, ZMod.natCast_zmod_val]
  calc
    (x : ZMod p) * ((y : ZMod p) * (x : ZMod p)⁻¹) =
        (y : ZMod p) * ((x : ZMod p) * (x : ZMod p)⁻¹) := by ring
    _ = (y : ZMod p) := by rw [hcancel, mul_one]

/-- Equality of the signed residues preserves goodness after taking both
absolute values. Neither integer coordinate needs to be positive. -/
theorem good_natAbs_of_zmod_eq (p : ℕ) (hp : 0 < p) (v w : ℤ) (m t : ℕ)
    (he : (m : ZMod p) * (v : ZMod p) = (t : ZMod p) * (w : ZMod p))
    (hg : good p t w.natAbs) : good p m v.natAbs := by
  by_cases hw : 0 ≤ w
  · have hcast : ((w.natAbs : ℕ) : ZMod p) = (w : ZMod p) := by
      have h := congrArg (fun q : ℤ => (q : ZMod p)) (Int.natAbs_of_nonneg hw)
      simpa only [Int.cast_natCast] using h
    apply good_natAbs_of_zmod p hp v m t w.natAbs ?_ hg
    simpa only [hcast] using he
  · have hcast : ((w.natAbs : ℕ) : ZMod p) = -(w : ZMod p) := by
      have h := congrArg (fun q : ℤ => (q : ZMod p))
        (Int.ofNat_natAbs_of_nonpos (by omega : w ≤ 0))
      simpa only [Int.cast_natCast, Int.cast_neg] using h
    have he' : (m : ZMod p) * ((-v : ℤ) : ZMod p) =
        (t : ZMod p) * ((w.natAbs : ℕ) : ZMod p) := by
      simp only [Int.cast_neg, mul_neg, hcast, he]
    have hgood := good_natAbs_of_zmod p hp (-v) m t w.natAbs he' hg
    simpa only [Int.natAbs_neg] using hgood

/-- A nonzero common scalar in the residue field transports a modular witness
for every absolute integer coordinate, including repeated and zero coordinates. -/
theorem integerSpeeds_witness_of_zmod_scale (p : ℕ) (hp : p.Prime)
    (v w : FiveIntegerVector) (s : ZMod p) (hs : s ≠ 0)
    (hv : ∀ j, (v j : ZMod p) = s * (w j : ZMod p))
    (hw : Loneliness.Modular.HasWitness 5 p
      (Loneliness.CoordinateSubspace.integerSpeeds w)) :
    Loneliness.Modular.HasWitness 5 p
      (Loneliness.CoordinateSubspace.integerSpeeds v) := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : NeZero p := ⟨hp.ne_zero⟩
  obtain ⟨t, ht⟩ := hw
  let m := ((t : ZMod p) * s⁻¹).val
  have hm : (m : ZMod p) = (t : ZMod p) * s⁻¹ := ZMod.natCast_zmod_val _
  have hss : s⁻¹ * s = (1 : ZMod p) := inv_mul_cancel₀ hs
  refine ⟨m, ?_⟩
  intro d hd
  obtain ⟨j, rfl⟩ := (Loneliness.CoordinateSubspace.mem_integerSpeeds v d).mp hd
  change good p m (v j).natAbs
  have hg : good p t (w j).natAbs := ht _
    ((Loneliness.CoordinateSubspace.mem_integerSpeeds w _).mpr ⟨j, rfl⟩)
  apply good_natAbs_of_zmod_eq p hp.pos (v j) (w j) m t ?_ hg
  calc
    (m : ZMod p) * (v j : ZMod p) =
        ((t : ZMod p) * (s⁻¹ * s)) * (w j : ZMod p) := by
      rw [hm, hv j]
      ring
    _ = (t : ZMod p) * (w j : ZMod p) := by rw [hss, mul_one]

theorem twoParameterMap_slope_cast (p : ℕ) (hp : p.Prime)
    (B : TwoParameterMap) (x : ℕ) (hx : 0 < x) (hxp : x < p) (y : ℤ)
    (j : Fin 5) :
    (((B *ᵥ ![(x : ℤ), y]) j : ℤ) : ZMod p) =
      (x : ZMod p) * (((B *ᵥ ![1, (slopeResidue p x y : ℤ)]) j : ℤ) : ZMod p) := by
  change ((dotProduct (B j) ![(x : ℤ), y] : ℤ) : ZMod p) =
    (x : ZMod p) * ((dotProduct (B j) ![1, (slopeResidue p x y : ℤ)] : ℤ) : ZMod p)
  rw [Matrix.vec2_dotProduct, Matrix.vec2_dotProduct]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Int.cast_add,
    Int.cast_mul, Int.cast_natCast, Int.cast_one, mul_one]
  rw [← slopeResidue_mul p hp x hx hxp y]
  ring

/-- A witness for the slope `(1,r)` lifts to the actual bounded parameter
pair `(x,y)` when `x` is a nonzero residue. -/
theorem slopeWitness_lift (p : ℕ) (hp : p.Prime) (B : TwoParameterMap)
    (x : ℕ) (hx : 0 < x) (hxp : x < p) (y : ℤ)
    (hw : Loneliness.Modular.HasWitness 5 p (slopeSpeeds B (slopeResidue p x y))) :
    Loneliness.Modular.HasWitness 5 p
      (Loneliness.CoordinateSubspace.integerSpeeds (B *ᵥ ![(x : ℤ), y])) := by
  exact integerSpeeds_witness_of_zmod_scale p hp _ _ (x : ZMod p)
    (natCast_ne_zero_of_lt p x hx hxp)
    (twoParameterMap_slope_cast p hp B x hx hxp y) hw

theorem no_slopeWitness_of_value_lt (p : ℕ) (hp : p.Prime) (B : TwoParameterMap)
    (x : ℕ) (hx : 0 < x) (hxp : x < p) (y : ℤ)
    (hcritical : Loneliness.value
      (Loneliness.CoordinateSubspace.integerSpeeds (B *ᵥ ![(x : ℤ), y])) < (1 : ℝ) / 5) :
    ¬Loneliness.Modular.HasWitness 5 p (slopeSpeeds B (slopeResidue p x y)) := by
  intro hw
  exact Loneliness.Modular.no_witness_of_value_lt (k := 5) (m := p)
    (by decide) hp.pos hcritical (slopeWitness_lift p hp B x hx hxp y hw)

end Loneliness.FiveSpeedCertificate
