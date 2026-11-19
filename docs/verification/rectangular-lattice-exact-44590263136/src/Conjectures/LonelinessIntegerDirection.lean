import Conjectures.LonelinessCoordinateClasses
import Mathlib.RingTheory.Localization.Integer
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Algebra.Order.Ring.Int
import Mathlib.Algebra.CharZero.Infinite

/-! An integer direction with few distinct absolute speeds inside every
coordinate-free rational subspace. Denominators are cleared with a positive
common integer multiplier. -/

namespace Loneliness.CoordinateSubspace

open scoped nonZeroDivisors

variable {ι : Type*} [Fintype ι]

theorem clear_rational_denominators (v : ι → ℚ) :
    ∃ (d : ℤ) (w : ι → ℤ), 0 < d ∧ ∀ i, (w i : ℚ) = (d : ℚ) * v i := by
  classical
  obtain ⟨d, hd⟩ := IsLocalization.exist_integer_multiples_of_finite (Submonoid.pos ℤ) v
  choose w hw using hd
  refine ⟨d, w, d.property, ?_⟩
  intro i
  simpa only [Algebra.smul_def, algebraMap_int_eq, Int.coe_castRingHom] using hw i

theorem natAbs_values_card_le_rational_abs (w : ι → ℤ) :
    Nat.card (Set.range (fun i => (w i).natAbs)) ≤
      Nat.card (Set.range (fun i => |(w i : ℚ)|)) := by
  let f : Set.range (fun i => (w i).natAbs) → Set.range (fun i => |(w i : ℚ)|) :=
    fun x => ⟨((x : ℕ) : ℚ), by
      obtain ⟨i, hi⟩ := x.property
      refine ⟨i, ?_⟩
      rw [← hi]
      simp [Nat.cast_natAbs, Int.cast_abs]⟩
  have hf : Function.Injective f := by
    intro x y h
    apply Subtype.ext
    have h' : ((x : ℕ) : ℚ) = ((y : ℕ) : ℚ) := congrArg Subtype.val h
    exact_mod_cast h'
  exact Nat.card_le_card_of_injective f hf

theorem exists_integer_direction [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree E) :
    ∃ w : ι → ℤ, (fun i => (w i : ℚ)) ∈ E ∧ (∀ i, w i ≠ 0) ∧
      Nat.card (Set.range (fun i => (w i).natAbs)) ≤
        Fintype.card ι - Module.finrank ℚ E + 1 := by
  classical
  obtain ⟨F, hFE, hFdim, hFfree, hcount⟩ := exists_coordinate_free_line_card E hfree
  obtain ⟨v, hv⟩ := Module.Dual.exists_forall_ne_zero_of_forall_exists (coordinateForm F)
    (fun i => by
      obtain ⟨x, hx, hxi⟩ := hFfree i
      exact ⟨⟨x, hx⟩, hxi⟩)
  obtain ⟨d, w, hd, hw⟩ := clear_rational_denominators (v : ι → ℚ)
  have hweq : (fun i => (w i : ℚ)) = (d : ℚ) • (v : ι → ℚ) := by
    funext i
    exact hw i
  have hwF : (fun i => (w i : ℚ)) ∈ F := by
    rw [hweq]
    exact F.smul_mem _ v.property
  have hdne : (d : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hd)
  refine ⟨w, hFE hwF, ?_, ?_⟩
  · intro i hzero
    have h := hw i
    rw [hzero, Int.cast_zero] at h
    exact mul_ne_zero hdne (hv i) h.symm
  · exact (natAbs_values_card_le_rational_abs w).trans
      ((absolute_values_card_le_classCount hwF).trans hcount)

end Loneliness.CoordinateSubspace
