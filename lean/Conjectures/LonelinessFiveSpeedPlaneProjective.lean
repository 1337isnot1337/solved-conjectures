import Conjectures.LonelinessFiveSpeedPlaneFiberDefs
import Conjectures.LonelinessModularWitness
import Conjectures.LonelinessCoalescenceValue
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.FinCases

/-! Projective normalization of the finite plane certificates. The integer
parameters may have either sign, and may be zero. -/
namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def projectiveChart (p : ℕ) (i : Fin (p + 2)) (z : ℕ) : Fin 3 → ZMod p :=
  ![((fiberLabels p i).1 : ZMod p), ((fiberLabels p i).2 : ZMod p), (z : ZMod p)]

theorem exists_projectiveChart (p : ℕ) (hp : p.Prime) (u : Fin 3 → ZMod p) :
    ∃ (i : Fin (p + 2)) (z : ℕ) (s : ZMod p),
      z < p ∧ s ≠ 0 ∧ ∀ j, u j = s * projectiveChart p i z j := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : NeZero p := ⟨hp.ne_zero⟩
  by_cases h0 : u 0 = 0
  · by_cases h1 : u 1 = 0
    · let i : Fin (p + 2) := ⟨p + 1, by omega⟩
      have hlt : ¬p + 1 < p := by omega
      have hne : p + 1 ≠ p := by omega
      have hlabels : fiberLabels p i = (0, 0) := by
        simp [fiberLabels, i, hlt, hne]
      refine ⟨i, (u 2).val, 1, ZMod.val_lt _, one_ne_zero, ?_⟩
      intro j
      fin_cases j <;>
        simp [projectiveChart, hlabels, ZMod.natCast_zmod_val, h0, h1]
    · let i : Fin (p + 2) := ⟨p, by omega⟩
      have hlabels : fiberLabels p i = (0, 1) := by simp [fiberLabels, i]
      refine ⟨i, ((u 1)⁻¹ * u 2).val, u 1, ZMod.val_lt _, h1, ?_⟩
      intro j
      fin_cases j <;>
        simp [projectiveChart, hlabels, ZMod.natCast_zmod_val, h0, h1, ← mul_assoc]
  · have hi : ((u 0)⁻¹ * u 1).val < p := ZMod.val_lt _
    let i : Fin (p + 2) := ⟨((u 0)⁻¹ * u 1).val, by omega⟩
    have hlabels : fiberLabels p i = (1, ((u 0)⁻¹ * u 1).val) := by
      simp [fiberLabels, i, hi]
    refine ⟨i, ((u 0)⁻¹ * u 2).val, u 0, ZMod.val_lt _, h0, ?_⟩
    intro j
    fin_cases j <;>
      simp [projectiveChart, hlabels, ZMod.natCast_zmod_val, h0, ← mul_assoc]

theorem integerResidue_eq_val (p : ℕ) (hp : 0 < p) (a : ℤ) :
    integerResidue p a = (a : ZMod p).val := by
  letI : NeZero p := ⟨Nat.ne_of_gt hp⟩
  have h := congrArg Int.toNat (ZMod.val_intCast (n := p) a)
  simpa [integerResidue] using h.symm

theorem integerResidue_cast (p : ℕ) (hp : 0 < p) (a : ℤ) :
    ((integerResidue p a : ℕ) : ZMod p) = (a : ZMod p) := by
  letI : NeZero p := ⟨Nat.ne_of_gt hp⟩
  rw [integerResidue_eq_val p hp a, ZMod.natCast_zmod_val]

theorem residue3_cast (p : ℕ) (hp : 0 < p) (a : ThreeIntegerVector) (x y z : ℕ) :
    ((residue3 p a x y z : ℕ) : ZMod p) =
      (a 0 : ZMod p) * x + (a 1 : ZMod p) * y + (a 2 : ZMod p) * z := by
  simp only [residue3, ZMod.natCast_mod, Nat.cast_add, Nat.cast_mul,
    integerResidue_cast p hp]

theorem integer_dotProduct_chart (p : ℕ) (hp : 0 < p) (u : ThreeIntegerVector)
    (i : Fin (p + 2)) (z : ℕ) (s : ZMod p)
    (hu : ∀ j, (u j : ZMod p) = s * projectiveChart p i z j)
    (a : ThreeIntegerVector) :
    ((dotProduct a u : ℤ) : ZMod p) =
      s * (residue3 p a (fiberLabels p i).1 (fiberLabels p i).2 z : ZMod p) := by
  rw [Matrix.vec3_dotProduct, residue3_cast p hp]
  simp only [Int.cast_add, Int.cast_mul]
  rw [hu 0, hu 1, hu 2]
  simp [projectiveChart] <;> ring

/-- Passing from an integer coordinate to its absolute value may negate its
residue; the folded residue, and hence goodness, is unchanged. -/
theorem good_natAbs_of_zmod (p : ℕ) (hp : 0 < p) (v : ℤ) (m t r : ℕ)
    (he : (m : ZMod p) * (v : ZMod p) = (t : ZMod p) * (r : ZMod p))
    (hg : good p t r) : good p m v.natAbs := by
  by_cases hv : 0 ≤ v
  · have hcast : ((v.natAbs : ℕ) : ZMod p) = (v : ZMod p) := by
      have h := congrArg (fun q : ℤ => (q : ZMod p)) (Int.natAbs_of_nonneg hv)
      simpa only [Int.cast_natCast] using h
    have hmod : m * v.natAbs % p = t * r % p :=
      (ZMod.natCast_eq_natCast_iff' (m * v.natAbs) (t * r) p).mp
        (by simpa only [Nat.cast_mul, hcast] using he)
    exact (good_congr hmod).mpr hg
  · have hcast : ((v.natAbs : ℕ) : ZMod p) = -(v : ZMod p) := by
      have h := congrArg (fun q : ℤ => (q : ZMod p))
        (Int.ofNat_natAbs_of_nonpos (by omega : v ≤ 0))
      simpa only [Int.cast_natCast, Int.cast_neg] using h
    have hsumz : ((m * v.natAbs + t * r : ℕ) : ZMod p) = 0 := by
      simp only [Nat.cast_add, Nat.cast_mul, hcast, mul_neg, he, neg_add_cancel]
    have hsum : (m * v.natAbs + t * r) % p = 0 := by
      simpa only [ZMod.val_natCast, ZMod.val_zero] using congrArg ZMod.val hsumz
    have hf := foldResidue_eq_of_add_mod_zero p (m * v.natAbs) (t * r) hp hsum
    unfold good
    rw [hf]
    exact hg

/-- Finite coverage of the three charts covers every signed integer
parameter vector. Structural roots become integer divisibility statements;
the alternative is a genuine modular witness for all absolute speeds. -/
theorem canonicalProjectiveCover_integer (p : ℕ) (hp : p.Prime) (k : Fin 9)
    (hcover : CanonicalProjectiveCover p k) (u : ThreeIntegerVector) :
    (∃ a ∈ planeStructuralForms k, (p : ℤ) ∣ dotProduct a u) ∨
      Loneliness.Modular.HasWitness 5 p
        (Loneliness.CoordinateSubspace.integerSpeeds (canonicalMaps k *ᵥ u)) := by
  letI : Fact p.Prime := ⟨hp⟩
  letI : NeZero p := ⟨hp.ne_zero⟩
  obtain ⟨i, z, s, hz, hs, hu⟩ :=
    exists_projectiveChart p hp (fun j => (u j : ZMod p))
  rcases hcover i z hz with hroot | hwitness
  · obtain ⟨a, ha, hzero⟩ := hroot
    have hl := integer_dotProduct_chart p hp.pos u i z s hu a
    rw [hzero, Nat.cast_zero, mul_zero] at hl
    exact Or.inl ⟨a, ha, (ZMod.intCast_zmod_eq_zero_iff_dvd _ p).mp hl⟩
  · obtain ⟨t, _, _, hgood⟩ := hwitness
    let m := ((t : ZMod p) * s⁻¹).val
    apply Or.inr
    refine ⟨m, ?_⟩
    intro d hd
    obtain ⟨j, rfl⟩ :=
      (Loneliness.CoordinateSubspace.mem_integerSpeeds (canonicalMaps k *ᵥ u) d).mp hd
    change good p m ((canonicalMaps k *ᵥ u) j).natAbs
    apply good_natAbs_of_zmod p hp.pos _ m t
      (residue3 p (canonicalMaps k j) (fiberLabels p i).1 (fiberLabels p i).2 z)
      ?_ (hgood j)
    have hm : (m : ZMod p) = (t : ZMod p) * s⁻¹ :=
      ZMod.natCast_zmod_val _
    have hl := integer_dotProduct_chart p hp.pos u i z s hu (canonicalMaps k j)
    change (((canonicalMaps k *ᵥ u) j : ℤ) : ZMod p) = _ at hl
    rw [hm, hl]
    calc
      ((t : ZMod p) * s⁻¹) * (s *
          (residue3 p (canonicalMaps k j) (fiberLabels p i).1 (fiberLabels p i).2 z : ZMod p)) =
          ((t : ZMod p) * (s⁻¹ * s)) *
            (residue3 p (canonicalMaps k j) (fiberLabels p i).1 (fiberLabels p i).2 z : ZMod p) := by ring
      _ = _ := by rw [inv_mul_cancel₀ hs, mul_one]

theorem canonicalProjectiveCover_divisor (p : ℕ) (hp : p.Prime) (k : Fin 9)
    (hcover : CanonicalProjectiveCover p k) (u : ThreeIntegerVector)
    (hcritical : Loneliness.value
      (Loneliness.CoordinateSubspace.integerSpeeds (canonicalMaps k *ᵥ u)) < (1 : ℝ) / 5) :
    ∃ a ∈ planeStructuralForms k, (p : ℤ) ∣ dotProduct a u := by
  rcases canonicalProjectiveCover_integer p hp k hcover u with hroot | hwitness
  · exact hroot
  · exact (Loneliness.Modular.no_witness_of_value_lt (k := 5) (m := p)
      (by decide) hp.pos hcritical hwitness).elim

end Loneliness.FiveSpeedCertificate
