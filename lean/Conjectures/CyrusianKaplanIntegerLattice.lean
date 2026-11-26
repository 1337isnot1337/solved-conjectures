module
public import Conjectures.CyrusianKaplanTupleLattice
public import Mathlib.Data.Int.Cast.Lemmas

@[expose] public section
namespace CyrusianKaplan

open Set

def integerTupleCast (r : ℕ) (z : (Fin r → ℤ) × (Fin r → ℤ)) : TupleSpace r :=
  (fun i => z.1 i,fun i => z.2 i)

/-- The ambient integer lattice is the full `ℤ^(2r)`. In this
actual region, positivity makes its intersection exactly the
natural-coordinate points already counted by the semigroup bijection. -/
theorem integer_lattice_iff_natural_in_admissible_region {g r : ℕ} {x : TupleSpace r}
    (hx : x ∈ admissibleTupleRegion r (g:ℝ)) :
    x ∈ Set.range (integerTupleCast r) ↔ x ∈ Set.range (natTupleCast r) := by
  constructor
  · rintro ⟨⟨a,b⟩,rfl⟩
    obtain ⟨ha,hb,hreg⟩ := hx
    have hBox := (real_admissibility_iff_ordered_tuple_tests (g:ℝ)
      (fun i => (a i:ℝ)) (fun i => (b i:ℝ)) ha hb).mp hreg
    refine ⟨(fun i => (a i).toNat, fun i => (b i).toNat), Prod.ext ?_ ?_⟩
    · funext i
      have hp : (0:ℝ) ≤ (a i:ℝ) := (Nat.cast_nonneg g).trans (hBox.1 i).1.le
      have hi : 0≤a i := by exact_mod_cast hp
      change ((a i).toNat:ℝ)=(a i:ℝ)
      exact_mod_cast Int.toNat_of_nonneg hi
    · funext i
      have hp : (0:ℝ) ≤ (b i:ℝ) := (hBox.2.1 i).1.le
      have hi : 0≤b i := by exact_mod_cast hp
      change ((b i).toNat:ℝ)=(b i:ℝ)
      exact_mod_cast Int.toNat_of_nonneg hi
  · rintro ⟨⟨a,b⟩,rfl⟩
    refine ⟨(fun i => (a i:ℤ),fun i => (b i:ℤ)),Prod.ext ?_ ?_⟩
    · funext i
      exact Int.cast_natCast (a i)
    · funext i
      exact Int.cast_natCast (b i)

/-- Exact count at every genus of the ambient integer lattice
inside the actual ordered tuple region. -/
theorem exact_ordinarization_count_integer_lattice (g r : ℕ) :
    Nat.card (ExactOrdinarizationClass g r) =
      Nat.card {x : TupleSpace r //
        x ∈ admissibleTupleRegion r (g:ℝ) ∧ x ∈ Set.range (integerTupleCast r)} := by
  rw [exact_ordinarization_count_lattice]
  apply Nat.card_congr
  apply Equiv.subtypeEquivRight
  intro x
  constructor
  · intro hx
    exact ⟨hx.1,(integer_lattice_iff_natural_in_admissible_region hx.1).mpr hx.2⟩
  · intro hx
    exact ⟨hx.1,(integer_lattice_iff_natural_in_admissible_region hx.1).mp hx.2⟩

end CyrusianKaplan
