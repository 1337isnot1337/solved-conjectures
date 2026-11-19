import Conjectures.LonelinessHyperplaneLattice
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Index

/-! The residue classes of the integer relation lattice are exactly the
kernel of the normal map modulo the modulus. Bézout coefficients prove
surjectivity and lift every residue-kernel point to an exact integer
kernel point. No lattice-basis or distribution hypothesis is used. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]

def residueNormalHom (m : ι → ℤ) (Q : ℕ) : (ι → ZMod Q) →+ ZMod Q where
  toFun x := ∑ i, (m i : ZMod Q) * x i
  map_zero' := by simp
  map_add' := by
    intro x y
    simp [mul_add, Finset.sum_add_distrib]

theorem residueNormalHom_intCast (m : ι → ℤ) (Q : ℕ) (x : ι → ℤ) :
    residueNormalHom m Q (fun i => (x i : ZMod Q)) =
      (integerPairing m x : ZMod Q) := by
  simp [residueNormalHom, integerPairing]

theorem residueNormalHom_surjective (m : ι → ℤ) (hm : PrimitiveNormal m) (Q : ℕ) :
    Function.Surjective (residueNormalHom m Q) := by
  obtain ⟨e, he⟩ := primitive_bezout m hm
  intro z
  refine ⟨fun i => (e i : ZMod Q) * z, ?_⟩
  change (∑ i, (m i : ZMod Q) * ((e i : ZMod Q) * z)) = z
  calc
    _ = ((∑ i, m i * e i : ℤ) : ZMod Q) * z := by
      simp only [Int.cast_sum, Int.cast_mul, Finset.sum_mul, mul_assoc]
    _ = z := by rw [he, Int.cast_one, one_mul]

/-- There are exactly `Q^(k-1)` residue classes in the relation lattice,
for every positive modulus, including composite moduli. -/
theorem residue_kernel_card (m : ι → ℤ) (hm : PrimitiveNormal m)
    (Q : ℕ) (hQ : 0 < Q) :
    Nat.card (residueNormalHom m Q).ker = Q ^ (Fintype.card ι - 1) := by
  letI : NeZero Q := ⟨hQ.ne'⟩
  have hcard : Nat.card (residueNormalHom m Q).ker * Q = Q ^ Fintype.card ι := by
    simpa only [Nat.card_fun, Nat.card_zmod, Nat.card_eq_fintype_card (α := ι)] using
      AddSubgroup.card_ker_mul_card_of_surjective (residueNormalHom_surjective m hm Q)
  obtain ⟨i, _⟩ := primitive_exists_nonzero m hm
  have hdim : 0 < Fintype.card ι := Fintype.card_pos_iff.mpr ⟨i⟩
  have hexp : Fintype.card ι - 1 + 1 = Fintype.card ι := by omega
  apply mul_right_cancel₀ hQ.ne'
  calc
    Nat.card (residueNormalHom m Q).ker * Q = Q ^ Fintype.card ι := hcard
    _ = Q ^ (Fintype.card ι - 1) * Q := by rw [← pow_succ, hexp]

/-- Every residue satisfying the normal relation has an integral lift
satisfying the relation exactly, not just modulo the modulus. -/
theorem exists_integer_kernel_lift
    (m : ι → ℤ) (hm : PrimitiveNormal m) (Q : ℕ) (hQ : 0 < Q)
    (r : ι → ZMod Q) (hr : residueNormalHom m Q r = 0) :
    ∃ z : ι → ℤ, integerPairing m z = 0 ∧ ∀ i, (z i : ZMod Q) = r i := by
  letI : NeZero Q := ⟨hQ.ne'⟩
  obtain ⟨e, he⟩ := primitive_bezout m hm
  change integerPairing m e = 1 at he
  let x : ι → ℤ := fun i => ((r i).val : ℤ)
  have hx : ∀ i, (x i : ZMod Q) = r i := by
    intro i
    simp [x]
  have hcast : (integerPairing m x : ZMod Q) = 0 := by
    rw [← residueNormalHom_intCast]
    have heq : (fun i => (x i : ZMod Q)) = r := funext hx
    rw [heq, hr]
  obtain ⟨c, hc⟩ := (ZMod.intCast_zmod_eq_zero_iff_dvd (integerPairing m x) Q).mp hcast
  let z := x - ((Q : ℤ) * c) • e
  refine ⟨z, ?_, ?_⟩
  · dsimp only [z]
    rw [integerPairing_sub, integerPairing_smul, he, mul_one, hc, sub_self]
  · intro i
    calc
      (z i : ZMod Q) = (x i : ZMod Q) := by
        simp [z, Pi.smul_apply, zsmul_eq_mul]
      _ = r i := hx i

theorem exists_integer_kernel_residue_translation
    (m : ι → ℤ) (hm : PrimitiveNormal m) (Q : ℕ) (hQ : 0 < Q)
    (r s : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) (hs : residueNormalHom m Q s = 0) :
    ∃ δ : ι → ℤ, integerPairing m δ = 0 ∧
      ∀ i, r i + (δ i : ZMod Q) = s i := by
  have hd : residueNormalHom m Q (s - r) = 0 := by
    rw [map_sub, hs, hr, sub_self]
  obtain ⟨δ, hδ, hres⟩ := exists_integer_kernel_lift m hm Q hQ (s - r) hd
  refine ⟨δ, hδ, ?_⟩
  intro i
  rw [hres]
  change r i + (s i - r i) = s i
  ring

end

end Loneliness.Hyperplane
