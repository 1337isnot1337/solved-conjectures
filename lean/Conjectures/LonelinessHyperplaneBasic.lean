import Conjectures.LonelinessHyperplaneArithmetic
import Mathlib.Topology.Order.Lattice

/-! Circular distance identities and actual shifted real-space and
integer-velocity suprema. The velocity supremum is attained. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

theorem distance_half_sub_of_abs_le_half (x : ℝ) (hx : |x| ≤ 1 / 2) :
    distance (1 / 2 - x) = 1 / 2 - |x| := by
  have hlow : 1 / 2 - |x| ≤ distance (1 / 2 - x) := by
    apply distance_lower_of_cell (k := 0)
    · norm_num only [Int.cast_zero, sub_zero]
      linarith [le_abs_self x]
    · norm_num only [Int.cast_zero, sub_zero]
      linarith [neg_le_abs x]
  apply le_antisymm ?_ hlow
  by_cases hsign : 0 ≤ x
  · have hx' : x ≤ 1 / 2 := (le_abs_self x).trans hx
    have h := distance_le_int (1 / 2 - x) 0
    rw [Int.cast_zero, sub_zero, abs_of_nonneg (by linarith : 0 ≤ 1 / 2 - x)] at h
    simpa only [abs_of_nonneg hsign] using h
  · have hx' : -(1 / 2 : ℝ) ≤ x := by linarith [neg_le_abs x]
    have h := distance_le_int (1 / 2 - x) 1
    rw [Int.cast_one, abs_of_nonpos (by linarith : 1 / 2 - x - 1 ≤ 0)] at h
    rw [abs_of_nonpos (le_of_lt (lt_of_not_ge hsign))]
    linarith

theorem distance_half_sub (x : ℝ) :
    distance (1 / 2 - x) = 1 / 2 - distance x := by
  have h := distance_half_sub_of_abs_le_half
    (x - (round x : ℝ)) (abs_sub_round x)
  have he : 1 / 2 - (x - (round x : ℝ)) =
      (1 / 2 - x) + (round x : ℝ) := by ring
  rw [he, CriticalFamilies.distance_add_int] at h
  exact h

variable {ι : Type*} [Fintype ι]

theorem distance_pairing_le (m : ι → ℤ) (x : ι → ℝ) :
    distance (pairing m x) ≤ ∑ i, |(m i : ℝ)| * distance (x i) := by
  let z : ℤ := ∑ i, m i * round (x i)
  have he : pairing m x - (z : ℝ) =
      ∑ i, (m i : ℝ) * (x i - (round (x i) : ℝ)) := by
    simp only [pairing, z, Int.cast_sum, Int.cast_mul,
      mul_sub, Finset.sum_sub_distrib]
  calc
    distance (pairing m x) ≤ |pairing m x - (z : ℝ)| := distance_le_int _ z
    _ = |∑ i, (m i : ℝ) * (x i - (round (x i) : ℝ))| := congrArg abs he
    _ ≤ ∑ i, |(m i : ℝ) * (x i - (round (x i) : ℝ))| :=
      Finset.abs_sum_le_sum_abs _ _
    _ = ∑ i, |(m i : ℝ)| * distance (x i) := by simp only [abs_mul, distance]

def relationSpace (m : ι → ℤ) : Submodule ℝ (ι → ℝ) where
  carrier := {x | pairing m x = 0}
  zero_mem' := pairing_zero m
  add_mem' := by
    intro x y hx hy
    change pairing m (x + y) = 0
    rw [pairing_add, hx, hy, add_zero]
  smul_mem' := by
    intro r x hx
    change pairing m (r • x) = 0
    rw [pairing_smul, hx, mul_zero]

@[simp] theorem mem_relationSpace (m : ι → ℤ) (x : ι → ℝ) :
    x ∈ relationSpace m ↔ pairing m x = 0 := Iff.rfl

def centerMinus (s : ι → ℝ) : ι → ℝ := fun i => 1 / 2 - s i

def predictedValue (m : ι → ℤ) (s : ι → ℝ) : ℝ :=
  1 / 2 - distance (pairing m (centerMinus s)) / normalMass m

variable [Nonempty ι]

def shiftedSpaceValue (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) : ℝ :=
  sSup ((fun x => pointClearance (s + x)) '' (E : Set (ι → ℝ)))

theorem shifted_space_image_nonempty (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) :
    ((fun x => pointClearance (s + x)) '' (E : Set (ι → ℝ))).Nonempty :=
  ⟨pointClearance (s + 0), 0, E.zero_mem, rfl⟩

theorem shifted_space_image_bddAbove (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) :
    BddAbove ((fun x => pointClearance (s + x)) '' (E : Set (ι → ℝ))) := by
  refine ⟨1 / 2, ?_⟩
  rintro y ⟨x, _, rfl⟩
  exact point_le_half (s + x)

theorem point_le_shiftedSpaceValue {E : Submodule ℝ (ι → ℝ)} (s : ι → ℝ)
    {x : ι → ℝ} (hx : x ∈ E) :
    pointClearance (s + x) ≤ shiftedSpaceValue E s :=
  le_csSup (shifted_space_image_bddAbove E s) ⟨x, hx, rfl⟩

theorem shiftedSpaceValue_le {E : Submodule ℝ (ι → ℝ)} {s : ι → ℝ} {r : ℝ}
    (h : ∀ x ∈ E, pointClearance (s + x) ≤ r) : shiftedSpaceValue E s ≤ r := by
  apply csSup_le (shifted_space_image_nonempty E s)
  rintro y ⟨x, hx, rfl⟩
  exact h x hx

def shiftedVelocityValue (v : ι → ℤ) (s : ι → ℝ) : ℝ :=
  sSup ((fun t : ℝ => pointClearance (s + t • integerVector v)) '' Set.Icc 0 1)

theorem shifted_velocity_image_nonempty (v : ι → ℤ) (s : ι → ℝ) :
    ((fun t : ℝ => pointClearance (s + t • integerVector v)) '' Set.Icc 0 1).Nonempty :=
  ⟨pointClearance (s + 0 • integerVector v), 0, by norm_num, rfl⟩

theorem shifted_velocity_image_bddAbove (v : ι → ℤ) (s : ι → ℝ) :
    BddAbove ((fun t : ℝ => pointClearance (s + t • integerVector v)) '' Set.Icc 0 1) := by
  refine ⟨1 / 2, ?_⟩
  rintro y ⟨t, _, rfl⟩
  exact point_le_half (s + t • integerVector v)

theorem le_shiftedVelocityValue (v : ι → ℤ) (s : ι → ℝ) {t : ℝ}
    (ht : t ∈ Set.Icc (0 : ℝ) 1) :
    pointClearance (s + t • integerVector v) ≤ shiftedVelocityValue v s :=
  le_csSup (shifted_velocity_image_bddAbove v s) ⟨t, ht, rfl⟩

theorem shiftedVelocityValue_le {v : ι → ℤ} {s : ι → ℝ} {r : ℝ}
    (h : ∀ t ∈ Set.Icc (0 : ℝ) 1, pointClearance (s + t • integerVector v) ≤ r) :
    shiftedVelocityValue v s ≤ r := by
  apply csSup_le (shifted_velocity_image_nonempty v s)
  rintro y ⟨t, ht, rfl⟩
  exact h t ht

theorem continuous_shifted_velocity_clearance (v : ι → ℤ) (s : ι → ℝ) :
    Continuous (fun t : ℝ => pointClearance (s + t • integerVector v)) := by
  unfold pointClearance
  apply Continuous.finset_inf'_apply Finset.univ_nonempty
  intro i _
  change Continuous (fun t : ℝ => distance (s i + t * (v i : ℝ)))
  exact continuous_distance.comp (continuous_const.add (continuous_id.mul continuous_const))

theorem shiftedVelocityValue_max (v : ι → ℤ) (s : ι → ℝ) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1,
      pointClearance (s + t • integerVector v) = shiftedVelocityValue v s := by
  obtain ⟨t, ht, hmax⟩ := isCompact_Icc.exists_isMaxOn
    (show (Set.Icc (0 : ℝ) 1).Nonempty from ⟨0, by norm_num⟩)
    (continuous_shifted_velocity_clearance v s).continuousOn
  exact ⟨t, ht, le_antisymm (le_shiftedVelocityValue v s ht)
    (shiftedVelocityValue_le hmax)⟩

end

end Loneliness.Hyperplane
