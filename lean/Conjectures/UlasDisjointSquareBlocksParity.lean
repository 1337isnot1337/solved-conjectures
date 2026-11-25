import Conjectures.UlasDisjointSquareBlocksBasic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Dimension.Finite

/-!
# Parity selection for Ulas's block construction

The finite-dimensional parity argument in section 1 of the recorded proof
selects a nonempty collection whose every factor multiplicity is even.
These lemmas formalize that argument for an arbitrary finite exponent table.
-/

open Finset

namespace UlasDisjointSquareBlocks

/-- More vectors than binary coordinates admit a nonempty subset with zero
sum. The subset is the support of a nonzero linear dependence over `ZMod 2`. -/
theorem exists_nonempty_even_selection {ι κ : Type*} [Fintype ι] [Fintype κ]
    (exponent : ι → κ → ℕ) (hcard : Fintype.card κ < Fintype.card ι) :
    ∃ s : Finset ι, s.Nonempty ∧ ∀ j, Even (∑ i ∈ s, exponent i j) := by
  classical
  let v : ι → κ → ZMod 2 := fun i j => exponent i j
  have hdep : ¬LinearIndependent (ZMod 2) v := by
    intro hind
    have h := hind.fintype_card_le_finrank
    rw [Module.finrank_fintype_fun_eq_card] at h
    omega
  obtain ⟨g, hsum, i, hi⟩ := Fintype.not_linearIndependent_iff.mp hdep
  let s : Finset ι := univ.filter fun i => g i ≠ 0
  refine ⟨s, ⟨i, by simp [s, hi]⟩, ?_⟩
  intro j
  apply ZMod.natCast_eq_zero_iff_even.mp
  have hsumj := congrArg (fun f : κ → ZMod 2 => f j) hsum
  simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hsumj
  calc
    (↑(∑ i ∈ s, exponent i j) : ZMod 2) = ∑ i ∈ s, v i j := by
      simp only [Nat.cast_sum, v]
    _ = ∑ i, g i * v i j := by
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro i _
      by_cases hi : g i = 0
      · simp [hi]
      · have hgi : g i = 1 := Fin.eq_one_of_ne_zero (g i) hi
        simp [hgi]
    _ = 0 := hsumj

/-- Even total multiplicity of each factor makes the entire product square. -/
theorem isSquare_prod_of_even_exponents {ι κ M : Type*} [Fintype κ]
    [CommMonoid M] (s : Finset ι) (exponent : ι → κ → ℕ) (factor : κ → M)
    (heven : ∀ j, Even (∑ i ∈ s, exponent i j)) :
    IsSquare (∏ i ∈ s, ∏ j, factor j ^ exponent i j) := by
  rw [Finset.prod_comm]
  apply Finset.isSquare_prod
  intro j _
  rw [Finset.prod_pow_eq_pow_sum]
  exact (heven j).isSquare_pow (factor j)

/-- A single nonempty selected set gives square products under every
evaluation of its factors into any commutative monoid. -/
theorem exists_nonempty_square_subfamily {ι κ : Type*} [Fintype ι] [Fintype κ]
    (factors : ι → Multiset κ) (hcard : Fintype.card κ < Fintype.card ι) :
    ∃ s : Finset ι, s.Nonempty ∧
      ∀ {M : Type*} [CommMonoid M] (value : κ → M),
        IsSquare (∏ i ∈ s, ((factors i).map value).prod) := by
  classical
  obtain ⟨s, hs, heven⟩ := exists_nonempty_even_selection
    (fun i j => (factors i).count j) hcard
  refine ⟨s, hs, ?_⟩
  intro M _ value
  have hfactor : ∀ i, ((factors i).map value).prod =
      ∏ j, value j ^ (factors i).count j := by
    intro i
    rw [Finset.prod_multiset_map_count]
    apply Finset.prod_subset (Finset.subset_univ _)
    intro j _ hj
    simp only [Multiset.mem_toFinset] at hj
    rw [Multiset.count_eq_zero_of_notMem hj, pow_zero]
  simp_rw [hfactor]
  exact isSquare_prod_of_even_exponents s _ value heven

end UlasDisjointSquareBlocks
