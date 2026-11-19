import Conjectures.PackingSharp
import Mathlib.Data.Nat.Factorization.Basic

/-! The opposite-parity tiling, obtained from the exact power of two in the
even step and the same finite rectangle construction. -/
namespace PackingFourPoint

theorem even_odd_residue_tiling (a b : ℕ) (ha0 : 0 < a)
    (haEven : Even a) (hbOdd : Odd b) :
    ∃ u : ℕ, 0 < u ∧ ∃ centers : Fin 1 × Fin u → ZMod (4*u),
      Function.Injective centers ∧
      Function.Injective (fun e : (Fin 1 × Fin u) × (Fin 2 × Fin 2) =>
        centers e.1 + fourOffsets (a : ZMod (4*u)) b e.2) ∧
      Function.Surjective (fun e : (Fin 1 × Fin u) × (Fin 2 × Fin 2) =>
        centers e.1 + fourOffsets (a : ZMod (4*u)) b e.2) := by
  obtain ⟨k, m, hm, hfact⟩ := Nat.exists_eq_two_pow_mul_odd (by omega : a ≠ 0)
  cases k with
  | zero =>
    simp only [pow_zero, one_mul] at hfact
    subst a
    obtain ⟨r, hr⟩ := haEven
    obtain ⟨s, hs⟩ := hm
    omega
  | succ k =>
    let u := 2^k
    let P := 4*u
    have hu : 0 < u := pow_pos (by omega) _
    have hP : 0 < P := by dsimp [P]; omega
    let : NeZero P := ⟨by omega⟩
    have hPpow : P = 2^(k+2) := by
      dsimp [P, u]
      rw [pow_add]
      norm_num
      ring
    have hB : IsUnit (b : ZMod P) := by
      apply (ZMod.isUnit_iff_coprime b P).mpr
      rw [hPpow]
      exact hbOdd.coprime_two_right.pow_right _
    obtain ⟨s, hs⟩ := hm
    obtain ⟨t, ht⟩ := hbOdd
    have hwA : a = P*s+u*2 := by
      dsimp [P, u]
      rw [hfact, hs, pow_succ]
      ring
    have hwB : b*(u*2) = P*t+u*2 := by
      dsimp [P]
      rw [ht]
      ring
    have hAmod : (a : ZMod P) = (u*2 : ℕ) := by
      have hh := congrArg (fun n : ℕ => (n : ZMod P)) hwA
      simpa only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self,
        zero_mul, zero_add] using hh
    have hBmod : (b : ZMod P)*(u*2 : ℕ) = (u*2 : ℕ) := by
      have hh := congrArg (fun n : ℕ => (n : ZMod P)) hwB
      simpa only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self,
        zero_mul, zero_add] using hh
    have hA : (a : ZMod P) = (b : ZMod P)*(u*2 : ℕ) := hAmod.trans hBmod.symm
    have hgrid : (1*2)*(u*2) = P := by dsimp [P]; ring
    refine ⟨u, hu, packingGridCenters u 1 P b, ?_, ?_, ?_⟩
    · exact packingGridCenters_injective u 1 P b hB (by omega)
    · exact packing_grid_injective u 1 P a b hA hB (by omega)
    · exact packing_grid_surjective u 1 P a b hA hB (by omega)

theorem multiplicity_comm (x : ℤ → ℤ) (a b t : ℤ) :
    multiplicity x a b t = multiplicity x b a t := by
  simp only [multiplicity]
  rw [show t-b-a = t-a-b by ring]
  ring

end PackingFourPoint
