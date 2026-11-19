import Conjectures.LonelinessHyperplaneGenericCost
import Mathlib.GroupTheory.Finiteness
import Mathlib.Algebra.Group.Submonoid.Finsupp
import Mathlib.Algebra.Order.Pi
import Mathlib.Algebra.Order.Sub.Prod
import Mathlib.Data.Pi.Interval
import Mathlib.Data.Fintype.Option
import Mathlib.Data.Fintype.Sum
import Mathlib.Tactic

/-! Homogenizing a box with any collection of integer relations.
The coordinates are its height, the original coordinates, and their
nonnegative slacks. The resulting subtractive submonoid is finitely
generated. Its nonzero generators have strictly positive height. -/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

abbrev BoxIndex (ι : Type*) := Option (ι ⊕ ι)

def homogeneousBoxMonoid (rows : Set (ι → ℤ)) : AddSubmonoid (BoxIndex ι → ℕ) where
  carrier := {x | (∀ i, x (some (.inl i)) + x (some (.inr i)) = x none) ∧
    ∀ m ∈ rows, (∑ i, m i * (x (some (.inl i)) : ℤ)) = 0}
  zero_mem' := by simp
  add_mem' := by
    intro x y hx hy
    constructor
    · intro i
      have hxi := hx.1 i
      have hyi := hy.1 i
      change x (some (.inl i)) + y (some (.inl i)) +
        (x (some (.inr i)) + y (some (.inr i))) = x none + y none
      omega
    · intro m hm
      simp only [Pi.add_apply, Nat.cast_add, mul_add, Finset.sum_add_distrib,
        hx.2 m hm, hy.2 m hm, add_zero]

theorem homogeneousBoxMonoid_subtractive (rows : Set (ι → ℤ))
    (x : BoxIndex ι → ℕ) (hx : x ∈ homogeneousBoxMonoid rows)
    (y : BoxIndex ι → ℕ) (hxy : x + y ∈ homogeneousBoxMonoid rows) :
    y ∈ homogeneousBoxMonoid rows := by
  constructor
  · intro i
    have hxi := hx.1 i
    have hxyi := hxy.1 i
    simp only [Pi.add_apply] at hxyi
    omega
  · intro m hm
    have h := hxy.2 m hm
    simp only [Pi.add_apply, Nat.cast_add, mul_add, Finset.sum_add_distrib,
      hx.2 m hm, zero_add] at h
    exact h

theorem homogeneousBoxMonoid_fg (rows : Set (ι → ℤ)) :
    (homogeneousBoxMonoid rows).FG :=
  AddSubmonoid.fg_of_subtractive (homogeneousBoxMonoid_subtractive rows)

theorem homogeneousBox_height_pos (rows : Set (ι → ℤ))
    (x : BoxIndex ι → ℕ) (hx : x ∈ homogeneousBoxMonoid rows) (hne : x ≠ 0) :
    0 < x none := by
  by_contra h
  have hzero : x none = 0 := by omega
  apply hne
  funext j
  cases j with
  | none => exact hzero
  | some j =>
    cases j with
    | inl i => have hi := hx.1 i; change x (some (.inl i)) = 0; omega
    | inr i => have hi := hx.1 i; change x (some (.inr i)) = 0; omega

theorem exists_positive_height_generators (rows : Set (ι → ℤ)) :
    ∃ G : Finset (BoxIndex ι → ℕ),
      AddSubmonoid.closure (G : Set (BoxIndex ι → ℕ)) = homogeneousBoxMonoid rows ∧
      ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows ∧ 0 < g none := by
  classical
  obtain ⟨T, hT⟩ := AddSubmonoid.isAddFG_iff.mp (homogeneousBoxMonoid_fg rows)
  refine ⟨T.erase 0, ?_, ?_⟩
  · have hset : (↑(T.erase 0) : Set (BoxIndex ι → ℕ)) = (T : Set (BoxIndex ι → ℕ)) \ {0} := by
      ext x
      simp only [Finset.mem_coe, Finset.mem_erase, Set.mem_sdiff,
        Set.mem_singleton_iff]
      exact and_comm
    rw [hset, AddSubmonoid.closure_sdiff_singleton_zero, hT]
  · intro g hg
    have hmem : g ∈ homogeneousBoxMonoid rows := by
      rw [← hT]
      exact AddSubmonoid.subset_closure (Finset.mem_of_mem_erase hg)
    exact ⟨hmem, homogeneousBox_height_pos rows g hmem (Finset.ne_of_mem_erase hg)⟩

def closedSystemBox (rows : Set (ι → ℤ)) (N : ℕ) : Type _ :=
  {v : ι → Fin (N + 1) // ∀ m ∈ rows, (∑ i, m i * (v i : ℕ)) = 0}

def homogeneousLift (N : ℕ) (v : ι → Fin (N + 1)) : BoxIndex ι → ℕ
  | none => N
  | some (.inl i) => v i
  | some (.inr i) => N - v i

theorem homogeneousLift_mem (rows : Set (ι → ℤ)) (N : ℕ)
    (v : closedSystemBox rows N) : homogeneousLift N v.1 ∈ homogeneousBoxMonoid rows := by
  constructor
  · intro i
    have hi := (v.1 i).isLt
    change (v.1 i : ℕ) + (N - (v.1 i : ℕ)) = N
    omega
  · exact v.2

def homogeneousBoxFiber (rows : Set (ι → ℤ)) (N : ℕ) : Type _ :=
  {x : homogeneousBoxMonoid rows // x.1 none = N}

def homogeneousBoxFiberEquiv (rows : Set (ι → ℤ)) (N : ℕ) :
    closedSystemBox rows N ≃ homogeneousBoxFiber rows N where
  toFun v := ⟨⟨homogeneousLift N v.1, homogeneousLift_mem rows N v⟩, rfl⟩
  invFun x := ⟨fun i => ⟨x.1.1 (some (.inl i)), by
      have hi := x.1.2.1 i
      have ht := x.2
      omega⟩, x.1.2.2⟩
  left_inv v := by
    apply Subtype.ext
    funext i
    apply Fin.ext
    rfl
  right_inv x := by
    apply Subtype.ext
    apply Subtype.ext
    funext j
    cases j with
    | none => exact x.2.symm
    | some j =>
      cases j with
      | inl i => rfl
      | inr i =>
        have hi := x.1.2.1 i
        have ht := x.2
        change N - x.1.1 (some (.inl i)) = x.1.1 (some (.inr i))
        omega

theorem homogeneousBox_card_eq (rows : Set (ι → ℤ)) (N : ℕ) :
    Nat.card (closedSystemBox rows N) = Nat.card (homogeneousBoxFiber rows N) :=
  Nat.card_congr (homogeneousBoxFiberEquiv rows N)

def natVector {α : Type*} (x : α → ℕ) : α → ℚ := fun i => (x i : ℚ)

/-- Saturation is explicit: any natural vector that is a rational
linear combination of valid generators obeys all the original
homogeneous equations. Nonnegativity of coefficients is unnecessary
for this implication. -/
theorem homogeneousBox_mem_of_rational_combination
    (rows : Set (ι → ℤ)) (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (x : BoxIndex ι → ℕ) (a : G → ℚ)
    (ha : combination (fun g : G => natVector g.1) a = natVector x) :
    x ∈ homogeneousBoxMonoid rows := by
  classical
  have hcoord : ∀ j, (x j : ℚ) = ∑ g : G, a g * (g.1 j : ℚ) := by
    intro j
    simpa only [combination, Finset.sum_apply, Pi.smul_apply, smul_eq_mul, natVector] using
      (congrFun ha j).symm
  constructor
  · intro i
    have hQ : (x (some (.inl i)) : ℚ) + (x (some (.inr i)) : ℚ) = (x none : ℚ) := by
      rw [hcoord, hcoord, hcoord, ← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro g _
      have hg : (g.1 (some (.inl i)) : ℚ) + (g.1 (some (.inr i)) : ℚ) =
          (g.1 none : ℚ) := by exact_mod_cast (hG g.1 g.2).1 i
      calc
        _ = a g * ((g.1 (some (.inl i)) : ℚ) + (g.1 (some (.inr i)) : ℚ)) := by ring
        _ = _ := by rw [hg]
    exact_mod_cast hQ
  · intro m hm
    have hQ : (∑ i, (m i : ℚ) * (x (some (.inl i)) : ℚ)) = 0 := by
      simp_rw [hcoord, Finset.mul_sum]
      rw [Finset.sum_comm]
      apply Finset.sum_eq_zero
      intro g _
      have hg : (∑ i, (m i : ℚ) * (g.1 (some (.inl i)) : ℚ)) = 0 := by
        have h := congrArg (fun z : ℤ => (z : ℚ)) ((hG g.1 g.2).2 m hm)
        simpa only [Int.cast_sum, Int.cast_mul, Int.cast_natCast, Int.cast_zero] using h
      calc
        _ = a g * (∑ i, (m i : ℚ) * (g.1 (some (.inl i)) : ℚ)) := by
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro i _
          ring
        _ = 0 := by rw [hg, mul_zero]
    have hcast : ((∑ i, m i * (x (some (.inl i)) : ℤ) : ℤ) : ℚ) = 0 := by
      simpa only [Int.cast_sum, Int.cast_mul, Int.cast_natCast] using hQ
    exact_mod_cast hcast

end

end Loneliness.Hyperplane.RationalCone
