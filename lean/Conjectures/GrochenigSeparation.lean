module

public import Conjectures.GrochenigBlocks
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Order.Filter.AtTopBot.Archimedean
public import Mathlib.Order.Filter.AtTopBot.Group
public import Mathlib.Order.Filter.Finite
public import Mathlib.Topology.Algebra.Monoid
public import Mathlib.Topology.Algebra.Order.Group
public import Batteries.Data.Nat.Lemmas
public import Lean.Elab.Tactic.Omega

/-!
# Recursive separation of the Gaussian blocks

The block at sequence index `n` is the finite block of order `n+1`.
At each stage, finitely many scalar decay estimates permit an even integer
center that separates the support intervals and satisfies both interference
bounds. Strong recursion makes this a single infinite sequence of centers.

Only the actual scalar decay and positive test-margin theorems from the
finite-block module enter the construction. No existence of a separated
infinite family is assumed.
-/

@[expose] public section

namespace Grochenig

open Filter Set
open scoped BigOperators Topology

noncomputable section

private def SeparationStage (n : ℕ) (a : Fin n → ℤ) (L : ℤ) : Prop :=
  Even L ∧
    (∀ i : Fin n, a i + 2 * ((i.val + 1 : ℕ) : ℤ) < L) ∧
    (∀ j : Fin (n + 2),
      |∑ i : Fin n, block (i.val + 1) ((L : ℝ) + testPoint j.val - (a i : ℝ))| <
        blockMargin (n + 1) / 4) ∧
    (∀ i : Fin n, ∀ j : Fin (i.val + 2),
      |block (n + 1) ((a i : ℝ) + testPoint j.val - (L : ℝ))| <
        blockMargin (i.val + 1) * (1 / 2 : ℝ) ^ (n + 3))

private theorem separationStage_exists (n : ℕ) (a : Fin n → ℤ) :
    ∃ L : ℤ, SeparationStage n a L := by
  have hz : Tendsto (fun L : ℕ => 2 * (L : ℤ)) atTop atTop :=
    Tendsto.const_mul_atTop' (by norm_num : (0 : ℤ) < 2) tendsto_natCast_atTop_atTop
  have hr : Tendsto (fun L : ℕ => ((2 * (L : ℤ) : ℤ) : ℝ)) atTop atTop := by
    simpa only [Int.cast_mul, Int.cast_ofNat, Int.cast_natCast] using
      (Tendsto.const_mul_atTop (by norm_num : (0 : ℝ) < 2)
        (tendsto_natCast_atTop_atTop : Tendsto (fun L : ℕ => (L : ℝ)) atTop atTop))
  have hgap : ∀ᶠ L : ℕ in atTop,
      ∀ i : Fin n, a i + 2 * ((i.val + 1 : ℕ) : ℤ) < 2 * (L : ℤ) := by
    apply Filter.eventually_all.mpr
    intro i
    exact hz.eventually (eventually_gt_atTop _)
  have hpast : ∀ᶠ L : ℕ in atTop, ∀ j : Fin (n + 2),
      |∑ i : Fin n, block (i.val + 1)
        (((2 * (L : ℤ) : ℤ) : ℝ) + testPoint j.val - (a i : ℝ))| <
          blockMargin (n + 1) / 4 := by
    apply Filter.eventually_all.mpr
    intro j
    have hterm (i : Fin n) : Tendsto (fun L : ℕ => block (i.val + 1)
        (((2 * (L : ℤ) : ℤ) : ℝ) + testPoint j.val - (a i : ℝ))) atTop (𝓝 0) := by
      have hx : Tendsto (fun L : ℕ =>
          ((2 * (L : ℤ) : ℤ) : ℝ) + testPoint j.val - (a i : ℝ)) atTop atTop := by
        simpa only [add_sub_assoc] using
          tendsto_atTop_add_const_right atTop (testPoint j.val - (a i : ℝ)) hr
      exact (block_tendsto_atTop (i.val + 1)).comp hx
    have hsum : Tendsto (fun L : ℕ => ∑ i : Fin n, block (i.val + 1)
        (((2 * (L : ℤ) : ℤ) : ℝ) + testPoint j.val - (a i : ℝ))) atTop (𝓝 0) := by
      simpa only [Finset.sum_const_zero] using
        tendsto_finsetSum Finset.univ (fun i _ => hterm i)
    have habs : Tendsto (fun L : ℕ => |∑ i : Fin n, block (i.val + 1)
        (((2 * (L : ℤ) : ℤ) : ℝ) + testPoint j.val - (a i : ℝ))|) atTop (𝓝 0) := by
      simpa only [abs_zero] using hsum.abs
    exact habs.eventually (eventually_lt_nhds
      (div_pos (blockMargin_pos (n + 1)) (by norm_num)))
  have hfuture : ∀ᶠ L : ℕ in atTop, ∀ i : Fin n, ∀ j : Fin (i.val + 2),
      |block (n + 1) ((a i : ℝ) + testPoint j.val - ((2 * (L : ℤ) : ℤ) : ℝ))| <
        blockMargin (i.val + 1) * (1 / 2 : ℝ) ^ (n + 3) := by
    apply Filter.eventually_all.mpr
    intro i
    apply Filter.eventually_all.mpr
    intro j
    have hx : Tendsto (fun L : ℕ =>
        (a i : ℝ) + testPoint j.val - ((2 * (L : ℤ) : ℤ) : ℝ)) atTop atBot := by
      simpa only [sub_eq_add_neg, Function.comp_apply] using
        tendsto_atBot_add_const_left atTop ((a i : ℝ) + testPoint j.val)
          (tendsto_neg_atTop_atBot.comp hr)
    have hf := (block_tendsto_atBot (n + 1)).comp hx
    have habs : Tendsto (fun L : ℕ =>
        |block (n + 1) ((a i : ℝ) + testPoint j.val - ((2 * (L : ℤ) : ℤ) : ℝ))|)
        atTop (𝓝 0) := by simpa only [abs_zero, Function.comp_apply] using hf.abs
    exact habs.eventually (eventually_lt_nhds
      (mul_pos (blockMargin_pos (i.val + 1)) (pow_pos (by norm_num) _)))
  obtain ⟨L, hgapL, hpastL, hfutureL⟩ := (hgap.and (hpast.and hfuture)).exists
  exact ⟨2 * (L : ℤ), ⟨(L : ℤ), by ring⟩, hgapL, hpastL, hfutureL⟩

private theorem separationStage_zero (a : Fin 0 → ℤ) : SeparationStage 0 a 0 := by
  refine ⟨⟨0, by ring⟩, ?_, ?_, ?_⟩
  · intro i
    exact Fin.elim0 i
  · intro j
    simpa using div_pos (blockMargin_pos 1) (by norm_num : (0 : ℝ) < 4)
  · intro i
    exact Fin.elim0 i

private def nextCenter (n : ℕ) (a : Fin n → ℤ) : ℤ :=
  if n = 0 then 0 else Classical.choose (separationStage_exists n a)

private theorem nextCenter_eq (n : ℕ) (a : Fin n → ℤ) :
    nextCenter n a = if n = 0 then 0 else Classical.choose (separationStage_exists n a) := by
  simp only [nextCenter]

private theorem nextCenter_spec (n : ℕ) (a : Fin n → ℤ) :
    SeparationStage n a (nextCenter n a) := by
  rw [nextCenter_eq]
  by_cases hn : n = 0
  · subst n
    rw [ite_eq_left rfl]
    exact separationStage_zero a
  · rw [ite_eq_right hn]
    exact Classical.choose_spec (separationStage_exists n a)

private def centerStep (n : ℕ) (previous : ∀ m : ℕ, m < n → ℤ) : ℤ :=
  nextCenter n (fun i : Fin n => previous i.val i.isLt)

@[no_expose] def center (n : ℕ) : ℤ := Nat.strongRecOn n centerStep

private theorem center_apply (n : ℕ) : center n = Nat.strongRecOn n centerStep := by
  simp only [center]

private theorem center_rec (n : ℕ) :
    center n = nextCenter n (fun i : Fin n => center i.val) := by
  exact Nat.strongRecOn_eq centerStep n

private theorem center_stage (n : ℕ) :
    SeparationStage n (fun i : Fin n => center i.val) (center n) := by
  rw [center_rec n]
  exact nextCenter_spec n _

theorem center_zero : center 0 = 0 := by
  rw [center_rec 0, nextCenter_eq, ite_eq_left rfl]

theorem center_even (n : ℕ) : Even (center n) := (center_stage n).1

theorem center_separated {m n : ℕ} (hmn : m < n) :
    center m + 2 * ((m + 1 : ℕ) : ℤ) < center n :=
  (center_stage n).2.1 ⟨m, hmn⟩

theorem earlier_blocks_small (n j : ℕ) (hj : j ≤ n + 1) :
    |∑ i : Fin n, block (i.val + 1)
      ((center n : ℝ) + testPoint j - (center i.val : ℝ))| < blockMargin (n + 1) / 4 :=
  (center_stage n).2.2.1 ⟨j, by omega⟩

theorem later_block_small {m n j : ℕ} (hmn : m < n) (hj : j ≤ m + 1) :
    |block (n + 1) ((center m : ℝ) + testPoint j - (center n : ℝ))| <
      blockMargin (m + 1) * (1 / 2 : ℝ) ^ (n + 3) :=
  (center_stage n).2.2.2 ⟨m, hmn⟩ ⟨j, by change j < m + 2; omega⟩

/-- Different block slots give different integer coefficient indices. The
named, parameterized slot map is defined in the independent series module. -/
theorem slotPosition_injective : Function.Injective
    (fun p : Σ n : ℕ, Fin (n + 2) => center p.1 + 2 * (p.2.val : ℤ)) := by
  intro p q hpq
  obtain ⟨m, k⟩ := p
  obtain ⟨n, l⟩ := q
  change center m + 2 * (k.val : ℤ) = center n + 2 * (l.val : ℤ) at hpq
  have hk := k.isLt
  have hl := l.isLt
  have hmn : m = n := by
    rcases lt_trichotomy m n with h | h | h
    · have hsep := center_separated h
      exfalso
      omega
    · exact h
    · have hsep := center_separated h
      exfalso
      omega
  subst n
  have hkl : k = l := by
    apply Fin.ext
    omega
  subst l
  rfl

end

end Grochenig
