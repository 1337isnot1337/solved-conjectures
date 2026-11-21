module

public import Conjectures.GrochenigBlocks
public import Mathlib.Topology.Algebra.InfiniteSum.Real
public import Mathlib.Topology.Algebra.InfiniteSum.Constructions
public import Mathlib.Topology.Algebra.InfiniteSum.Order
public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Analysis.Normed.Group.InfiniteSum
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring

/-!
# The single infinite coefficient sequence

Each finite block is placed at an integer center. An injective slot map
makes the extension by zero unambiguous. The exact block masses sum to one,
so the resulting integer-indexed sequence is absolutely summable and bounded.
-/

@[expose] public section

namespace Grochenig

open Function Set
open scoped BigOperators

noncomputable section

def slotPosition (center : ℕ → ℤ) (p : Σ n : ℕ, Fin (n + 2)) : ℤ :=
  center p.1 + 2 * (p.2.val : ℤ)

theorem slotPosition_eq (center : ℕ → ℤ) (p : Σ n : ℕ, Fin (n + 2)) :
    slotPosition center p = center p.1 + 2 * (p.2.val : ℤ) := by
  simp only [slotPosition]

def coefficient (center : ℕ → ℤ) : ℤ → ℝ :=
  Function.extend (slotPosition center)
    (fun p : Σ n : ℕ, Fin (n + 2) => blockCoeff (p.1 + 1) p.2.val) (fun _ => 0)

theorem coefficient_eq (center : ℕ → ℤ) (k : ℤ) :
    coefficient center k = Function.extend (slotPosition center)
      (fun p : Σ n : ℕ, Fin (n + 2) => blockCoeff (p.1 + 1) p.2.val) (fun _ => 0) k := by
  simp only [coefficient]

theorem coefficient_at_slot (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (p : Σ n : ℕ, Fin (n + 2)) :
    coefficient center (slotPosition center p) = blockCoeff (p.1 + 1) p.2.val :=
  hinj.extend_apply _ _ p

theorem coefficient_off_range (center : ℕ → ℤ) (k : ℤ)
    (hk : k ∉ Set.range (slotPosition center)) : coefficient center k = 0 :=
  Function.extend_apply' _ _ _ hk

theorem coefficient_ne_zero_mem_range (center : ℕ → ℤ) (k : ℤ)
    (hk : coefficient center k ≠ 0) : k ∈ Set.range (slotPosition center) := by
  by_contra hn
  exact hk (coefficient_off_range center k hn)

theorem coefficient_even_support (center : ℕ → ℤ)
    (heven : ∀ n, Even (center n)) (k : ℤ) (hk : coefficient center k ≠ 0) : Even k := by
  obtain ⟨p, rfl⟩ := coefficient_ne_zero_mem_range center k hk
  obtain ⟨a, ha⟩ := heven p.1
  refine ⟨a + (p.2.val : ℤ), ?_⟩
  rw [slotPosition_eq, ha]
  ring

theorem geometric_block_mass_hasSum :
    HasSum (fun n : ℕ => (1 / 2 : ℝ) ^ (n + 1)) 1 := by
  have hm := hasSum_geometric_two.mul_right (1 / 2 : ℝ)
  rw [show (2 : ℝ) * (1 / 2) = 1 by norm_num] at hm
  simpa only [pow_succ] using hm

theorem sigma_block_abs_summable :
    Summable (fun p : Σ n : ℕ, Fin (n + 2) => |blockCoeff (p.1 + 1) p.2.val|) := by
  apply (summable_sigma_of_nonneg
    (fun p : Σ n : ℕ, Fin (n + 2) => abs_nonneg (blockCoeff (p.1 + 1) p.2.val))).2
  refine ⟨fun _ => (hasSum_fintype _).summable, ?_⟩
  simpa only [tsum_fintype, sum_abs_blockCoeff] using geometric_block_mass_hasSum.summable

theorem sigma_block_abs_hasSum :
    HasSum (fun p : Σ n : ℕ, Fin (n + 2) => |blockCoeff (p.1 + 1) p.2.val|) 1 := by
  apply geometric_block_mass_hasSum.sigma_of_hasSum _ sigma_block_abs_summable
  intro n
  simpa only [sum_abs_blockCoeff] using
    hasSum_fintype (fun k : Fin (n + 2) => |blockCoeff (n + 1) k.val|)

/-- The exact coefficient mass of the one infinite sequence. -/
theorem hasSum_abs_coefficient (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    HasSum (fun k : ℤ => |coefficient center k|) 1 := by
  have hz (k : ℤ) (hk : k ∉ Set.range (slotPosition center)) :
      |coefficient center k| = 0 := by
    rw [coefficient_off_range center k hk, abs_zero]
  apply (hinj.hasSum_iff hz).mp
  simpa only [Function.comp_def, coefficient_at_slot center hinj] using sigma_block_abs_hasSum

theorem coefficient_abs_summable (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    Summable (fun k : ℤ => |coefficient center k|) :=
  (hasSum_abs_coefficient center hinj).summable

theorem sum_abs_coefficient (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    (∑' k : ℤ, |coefficient center k|) = 1 :=
  (hasSum_abs_coefficient center hinj).tsum_eq

theorem coefficient_summable (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) : Summable (coefficient center) := by
  apply Summable.of_norm
  simpa only [Real.norm_eq_abs] using coefficient_abs_summable center hinj

theorem abs_coefficient_le_one (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (k : ℤ) :
    |coefficient center k| ≤ 1 := by
  have h := (coefficient_abs_summable center hinj).le_tsum k
    (fun j _ => abs_nonneg (coefficient center j))
  simpa only [sum_abs_coefficient center hinj] using h

theorem coefficient_bounded (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    ∃ C : ℝ, ∀ k : ℤ, |coefficient center k| ≤ C :=
  ⟨1, abs_coefficient_le_one center hinj⟩

end

end Grochenig
