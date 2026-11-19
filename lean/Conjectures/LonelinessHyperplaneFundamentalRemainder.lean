import Mathlib.LinearAlgebra.LinearIndependent.Basic
import Mathlib.Data.Int.Interval
import Mathlib.Data.Rat.Floor
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic

/-! Integer points in a rational simplicial cone have a unique decomposition
into a half-open fundamental remainder and nonnegative integer coefficients.
The remainder lattice is finite by explicit coordinate bounds. -/

namespace Loneliness.Hyperplane.FundamentalRemainder

open scoped BigOperators

noncomputable section

variable {ι κ : Type*}

def castVector (x : κ → ℤ) : κ → ℚ := fun j => (x j : ℚ)

theorem castVector_injective : Function.Injective (castVector (κ := κ)) := by
  intro x y h
  funext j
  have hj : (x j : ℚ) = (y j : ℚ) := congrFun h j
  exact_mod_cast hj

theorem castVector_add (x y : κ → ℤ) :
    castVector (x + y) = castVector x + castVector y := by
  ext j
  simp [castVector]

theorem castVector_sub (x y : κ → ℤ) :
    castVector (x - y) = castVector x - castVector y := by
  ext j
  simp [castVector]

variable [Fintype ι]

def rationalCombination (g : ι → κ → ℤ) (a : ι → ℚ) : κ → ℚ :=
  ∑ i, a i • castVector (g i)

def natCombination (g : ι → κ → ℤ) (n : ι → ℕ) : κ → ℤ :=
  fun j => ∑ i, (n i : ℤ) * g i j

theorem rationalCombination_add (g : ι → κ → ℤ) (a b : ι → ℚ) :
    rationalCombination g (a + b) = rationalCombination g a + rationalCombination g b := by
  simp only [rationalCombination, Pi.add_apply, add_smul, Finset.sum_add_distrib]

theorem rationalCombination_sub (g : ι → κ → ℤ) (a b : ι → ℚ) :
    rationalCombination g (a - b) = rationalCombination g a - rationalCombination g b := by
  simp only [rationalCombination, Pi.sub_apply, sub_smul, Finset.sum_sub_distrib]

theorem castVector_natCombination (g : ι → κ → ℤ) (n : ι → ℕ) :
    castVector (natCombination g n) = rationalCombination g (fun i => (n i : ℚ)) := by
  ext j
  simp [castVector, natCombination, rationalCombination, Finset.sum_apply]

theorem rationalCombination_injective (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i))) :
    Function.Injective (rationalCombination g) := by
  intro a b hab
  funext i
  exact hg.eq_coords_of_eq hab i

def ConePoint (g : ι → κ → ℤ) :=
  {x : κ → ℤ // ∃ a : ι → ℚ, (∀ i, 0 ≤ a i) ∧ rationalCombination g a = castVector x}

def Remainder (g : ι → κ → ℤ) :=
  {x : κ → ℤ // ∃ a : ι → ℚ,
    (∀ i, 0 ≤ a i ∧ a i < 1) ∧ rationalCombination g a = castVector x}

def coordinateBound (g : ι → κ → ℤ) (j : κ) : ℤ := ∑ i, |g i j|

theorem remainder_coordinate_bound (g : ι → κ → ℤ) (r : Remainder g) (j : κ) :
    |r.1 j| ≤ coordinateBound g j := by
  obtain ⟨a, ha, he⟩ := r.2
  have he' : (∑ i, a i * (g i j : ℚ)) = (r.1 j : ℚ) := by
    simpa only [rationalCombination, Finset.sum_apply, Pi.smul_apply,
      smul_eq_mul, castVector] using congrFun he j
  have hb : |(r.1 j : ℚ)| ≤ ∑ i, |(g i j : ℚ)| := by
    rw [← he']
    calc
      _ ≤ ∑ i, |a i * (g i j : ℚ)| := Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ i, |(g i j : ℚ)| := by
        apply Finset.sum_le_sum
        intro i _
        rw [abs_mul, abs_of_nonneg (ha i).1]
        exact mul_le_of_le_one_left (abs_nonneg _) (ha i).2.le
  dsimp only [coordinateBound]
  exact_mod_cast hb

instance remainder_finite [Fintype κ] (g : ι → κ → ℤ) : Finite (Remainder g) := by
  let f : Remainder g → ∀ j, Set.Icc (-coordinateBound g j) (coordinateBound g j) :=
    fun r j => ⟨r.1 j, abs_le.mp (remainder_coordinate_bound g r j)⟩
  apply Finite.of_injective f
  intro r s hrs
  apply Subtype.ext
  funext j
  exact congrArg Subtype.val (congrFun hrs j)

def recompose (g : ι → κ → ℤ) (p : Remainder g × (ι → ℕ)) : ConePoint g := by
  refine ⟨p.1.1 + natCombination g p.2, ?_⟩
  obtain ⟨a, ha, he⟩ := p.1.2
  refine ⟨a + (fun i => (p.2 i : ℚ)), ?_, ?_⟩
  · intro i
    exact add_nonneg (ha i).1 (Nat.cast_nonneg _)
  · rw [rationalCombination_add, he, castVector_add, castVector_natCombination]

theorem recompose_surjective (g : ι → κ → ℤ) : Function.Surjective (recompose g) := by
  intro x
  obtain ⟨a, ha, he⟩ := x.2
  let n : ι → ℕ := fun i => ⌊a i⌋₊
  let r : Remainder g := ⟨x.1 - natCombination g n,
    a - (fun i => (n i : ℚ)), by
      intro i
      change 0 ≤ a i - (⌊a i⌋₊ : ℚ) ∧ a i - (⌊a i⌋₊ : ℚ) < 1
      constructor
      · exact sub_nonneg.mpr (Nat.floor_le (ha i))
      · have h := Nat.lt_floor_add_one (a i)
        linarith
    , by rw [rationalCombination_sub, he, castVector_sub, castVector_natCombination]⟩
  refine ⟨(r,n), ?_⟩
  apply Subtype.ext
  change x.1 - natCombination g n + natCombination g n = x.1
  exact sub_add_cancel _ _

theorem recompose_injective (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i))) :
    Function.Injective (recompose g) := by
  rintro ⟨r,n⟩ ⟨s,m⟩ heq
  obtain ⟨a, ha, hea⟩ := r.2
  obtain ⟨b, hb, heb⟩ := s.2
  have hx : r.1 + natCombination g n = s.1 + natCombination g m :=
    congrArg Subtype.val heq
  have hc : rationalCombination g (a + fun i => (n i : ℚ)) =
      rationalCombination g (b + fun i => (m i : ℚ)) := by
    rw [rationalCombination_add, rationalCombination_add, hea, heb,
      ← castVector_natCombination, ← castVector_natCombination,
      ← castVector_add, ← castVector_add, hx]
  have hc' := rationalCombination_injective g hg hc
  have hnm : n = m := by
    funext i
    have hi := congrFun hc' i
    change a i + (n i : ℚ) = b i + (m i : ℚ) at hi
    have hf := congrArg Nat.floor hi
    simpa only [Nat.floor_add_natCast (ha i).1, Nat.floor_add_natCast (hb i).1,
      Nat.floor_eq_zero.mpr (ha i).2, Nat.floor_eq_zero.mpr (hb i).2, zero_add] using hf
  subst m
  exact Prod.ext (Subtype.ext (add_right_cancel hx)) rfl

/-- The actual cone-point/remainder bijection. Linear independence is used
only for uniqueness; the floor decomposition exists for every generator family. -/
def conePointEquiv (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i))) :
    ConePoint g ≃ Remainder g × (ι → ℕ) :=
  (Equiv.ofBijective (recompose g) ⟨recompose_injective g hg, recompose_surjective g⟩).symm

end

end Loneliness.Hyperplane.FundamentalRemainder
