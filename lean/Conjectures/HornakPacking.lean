import Conjectures.HornakGraph
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.Linarith

/-! Exact allocation of fixed-size pieces among finite arm capacities. -/
namespace Hornak
open scoped BigOperators

/-- Any number up to the total capacity can be distributed among the bins. -/
theorem allocate {α : Type*} [DecidableEq α] (s : Finset α) (capacity : α → ℕ)
    (a : ℕ) (ha : a ≤ ∑ i ∈ s, capacity i) :
    ∃ used : α → ℕ, (∀ i ∈ s, used i ≤ capacity i) ∧
      (∑ i ∈ s, used i) = a := by
  induction s using Finset.induction_on generalizing a with
  | empty =>
    have hz : a = 0 := by simpa using ha
    subst a
    exact ⟨fun _ => 0, by simp⟩
  | @insert x s hx ih =>
    simp only [Finset.sum_insert hx] at ha
    let t := min a (capacity x)
    have hrest : a - t ≤ ∑ i ∈ s, capacity i := by
      dsimp [t]
      omega
    obtain ⟨used, hb, he⟩ := ih (a-t) hrest
    refine ⟨Function.update used x t, ?_, ?_⟩
    · intro i hi
      rcases Finset.mem_insert.mp hi with rfl | hi
      · simp only [Function.update_self]
        exact Nat.min_le_right _ _
      · rw [Function.update_of_ne (by intro h; subst i; exact hx hi)]
        exact hb i hi
    · rw [Finset.sum_insert hx, Function.update_self]
      have hsum : (∑ i ∈ s, Function.update used x t i) = ∑ i ∈ s, used i := by
        apply Finset.sum_congr rfl
        intro i hi
        have hne : i ≠ x := by intro h; subst i; exact hx hi
        exact Function.update_of_ne hne t used
      rw [hsum, he]
      dsimp [t]
      omega

theorem allocate_iff {α : Type*} [DecidableEq α] (s : Finset α) (capacity : α → ℕ) (a : ℕ) :
    (∃ used : α → ℕ, (∀ i ∈ s, used i ≤ capacity i) ∧ (∑ i ∈ s, used i) = a) ↔
      a ≤ ∑ i ∈ s, capacity i := by
  constructor
  · rintro ⟨used, hb, he⟩
    rw [← he]
    exact Finset.sum_le_sum (fun i hi => hb i hi)
  · exact allocate s capacity a

/-- Once the larger pieces are assigned, the number of smaller pieces that
fits in an arm is exactly its remaining capacity divided by their size. -/
theorem arm_capacity_iff (x i b a : ℕ) (hi : 0 < i) (hb : b*(i+1) ≤ x) :
    a*i + b*(i+1) ≤ x ↔ a ≤ (x-b*(i+1))/i := by
  rw [Nat.le_div_iff_mul_le hi]
  omega

/-- The written proof's fixed-larger-pieces allocation criterion, for an
arbitrary finite set of arms and every positive smaller piece size. -/
theorem fixed_large_packing_iff {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity large : α → ℕ) (i a : ℕ) (hi : 0 < i)
    (hb : ∀ j ∈ s, large j*(i+1) ≤ capacity j) :
    (∃ small : α → ℕ, (∀ j ∈ s, small j*i + large j*(i+1) ≤ capacity j) ∧
      (∑ j ∈ s, small j) = a) ↔
    a ≤ ∑ j ∈ s, (capacity j-large j*(i+1))/i := by
  constructor
  · rintro ⟨small, hs, hsum⟩
    apply (allocate_iff s (fun j => (capacity j-large j*(i+1))/i) a).mp
    refine ⟨small, ?_, hsum⟩
    intro j hj
    exact (arm_capacity_iff _ _ _ _ hi (hb j hj)).mp (hs j hj)
  · intro ha
    obtain ⟨small, hs, hsum⟩ := allocate s (fun j => (capacity j-large j*(i+1))/i) a ha
    refine ⟨small, ?_, hsum⟩
    intro j hj
    exact (arm_capacity_iff _ _ _ _ hi (hb j hj)).mpr (hs j hj)

/-- Quotient-and-remainder form of the two-size capacity condition. The
second inequality is the exact carry allowance in a single arm. -/
theorem two_size_capacity_iff (x i a b : ℕ) (hi : 0 < i) :
    a*i + b*(i+1) ≤ x ↔
      a+b ≤ x/i ∧ b ≤ x%i + i*(x/i-(a+b)) := by
  have hdiv : (x/i)*i + x%i = x := by simpa [Nat.mul_comm] using Nat.div_add_mod x i
  constructor
  · intro h
    have hab : a+b ≤ x/i := by
      apply (Nat.le_div_iff_mul_le hi).2
      nlinarith
    have hsub : x/i-(a+b)+(a+b)=x/i := Nat.sub_add_cancel hab
    constructor
    · exact hab
    · nlinarith
  · rintro ⟨hab, hcarry⟩
    have hsub : x/i-(a+b)+(a+b)=x/i := Nat.sub_add_cancel hab
    nlinarith

/-- The nonnegative ceiling cost for placing `b` larger pieces. -/
def carryCost (i u b : ℕ) : ℕ := (b-u+(i-1))/i

theorem carryCost_le_iff (i u b c : ℕ) (hi : 0 < i) :
    carryCost i u b ≤ c ↔ b ≤ u+i*c := by
  unfold carryCost
  rw [Nat.div_le_iff_le_mul hi]
  have hi1 : i-1+1=i := by omega
  have hright : c*i+i-1+1=c*i+i := by omega
  by_cases h : b ≤ u
  · simp only [Nat.sub_eq_zero_of_le h, zero_add]
    constructor <;> intro hc <;> nlinarith
  · have hsub : b-u+u=b := Nat.sub_add_cancel (by omega)
    constructor <;> intro hc <;> nlinarith

theorem two_size_capacity_with_cost (x i a b : ℕ) (hi : 0 < i) :
    a*i+b*(i+1) ≤ x ↔ a+b+carryCost i (x%i) b ≤ x/i := by
  rw [two_size_capacity_iff x i a b hi]
  constructor
  · rintro ⟨hab,hcarry⟩
    have hc := (carryCost_le_iff i (x%i) b (x/i-(a+b)) hi).2 hcarry
    omega
  · intro h
    have hab : a+b ≤ x/i := by omega
    refine ⟨hab, ?_⟩
    apply (carryCost_le_iff i (x%i) b (x/i-(a+b)) hi).1
    omega

/-- Exact capacity formula, with truncation avoided by the feasibility
hypothesis for the already placed larger pieces. -/
theorem remaining_capacity_with_cost (x i b : ℕ) (hi : 0 < i)
    (hb : b*(i+1) ≤ x) :
    (x-b*(i+1))/i + b + carryCost i (x%i) b = x/i := by
  let c := carryCost i (x%i) b
  have hcost : b+c ≤ x/i := by
    have h := (two_size_capacity_with_cost x i 0 b hi).1 (by simpa using hb)
    simpa [c] using h
  have hlo : (x-b*(i+1))/i + b+c ≤ x/i := by
    have hdiv := Nat.div_mul_le_self (x-b*(i+1)) i
    have hfeas : ((x-b*(i+1))/i)*i + b*(i+1) ≤ x := by omega
    exact (two_size_capacity_with_cost x i ((x-b*(i+1))/i) b hi).1 hfeas
  have hfeas : (x/i-(b+c))*i+b*(i+1) ≤ x := by
    apply (two_size_capacity_with_cost x i (x/i-(b+c)) b hi).2
    dsimp [c] at *
    omega
  have hhi : x/i-(b+c) ≤ (x-b*(i+1))/i :=
    (arm_capacity_iff x i b _ hi hb).1 hfeas
  dsimp [c] at *
  omega

theorem sum_remaining_capacity_with_cost {α : Type*} (s : Finset α)
    (capacity large : α → ℕ) (i : ℕ) (hi : 0 < i)
    (hb : ∀ j ∈ s, large j*(i+1) ≤ capacity j) :
    (∑ j ∈ s, (capacity j-large j*(i+1))/i) + (∑ j ∈ s, large j) +
      (∑ j ∈ s, carryCost i (capacity j%i) (large j)) =
        ∑ j ∈ s, capacity j/i := by
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro j hj
  exact remaining_capacity_with_cost (capacity j) i (large j) hi (hb j hj)

theorem fixed_large_budget_iff {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity large : α → ℕ) (i a : ℕ) (hi : 0 < i)
    (hb : ∀ j ∈ s, large j*(i+1) ≤ capacity j) :
    (∃ small : α → ℕ, (∀ j ∈ s, small j*i + large j*(i+1) ≤ capacity j) ∧
      (∑ j ∈ s, small j) = a) ↔
    a + (∑ j ∈ s, large j) + (∑ j ∈ s, carryCost i (capacity j%i) (large j)) ≤
      ∑ j ∈ s, capacity j/i := by
  rw [fixed_large_packing_iff s capacity large i a hi hb]
  have h := sum_remaining_capacity_with_cost s capacity large i hi hb
  omega

/-- Maximum larger-piece count in one arm for a specified carry budget. -/
def armAllowance (x i c : ℕ) : ℕ := min (x/(i+1)) (x%i+i*c)

theorem armAllowance_iff (x i b c : ℕ) (hi : 0 < i) :
    b ≤ armAllowance x i c ↔ b*(i+1) ≤ x ∧ carryCost i (x%i) b ≤ c := by
  simp only [armAllowance, le_min_iff, Nat.le_div_iff_mul_le (by omega : 0 < i+1),
    carryCost_le_iff i (x%i) b c hi]

theorem armAllowance_mono (x i c d : ℕ) (h : c ≤ d) :
    armAllowance x i c ≤ armAllowance x i d := by
  unfold armAllowance
  exact min_le_min le_rfl (Nat.add_le_add_left (Nat.mul_le_mul_left i h) _)

theorem armAllowance_step (x i c : ℕ) :
    armAllowance x i (c+1) ≤ armAllowance x i c+i := by
  unfold armAllowance
  simp only [Nat.mul_add, Nat.mul_one]
  omega

theorem sum_update_balance {α : Type*} [DecidableEq α] (s : Finset α)
    (f : α → ℕ) (j : α) (hj : j ∈ s) (v : ℕ) :
    (∑ i ∈ s, Function.update f j v i) + f j = (∑ i ∈ s, f i) + v := by
  have h := Finset.sum_erase_add s f hj
  have h' := Finset.sum_erase_add s (Function.update f j v) hj
  have he : (∑ i ∈ s.erase j, Function.update f j v i) = ∑ i ∈ s.erase j, f i := by
    apply Finset.sum_congr rfl
    intro i hi
    have hn : i ≠ j := (Finset.mem_erase.mp hi).1
    exact Function.update_of_ne hn v f
  rw [he, Function.update_self] at h'
  omega

/-- Removing one unit of total carry budget loses at most one piece-size
unit of larger-piece capacity. -/
theorem allowance_remove_one {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity budget : α → ℕ) (i K : ℕ) (hbudget : (∑ j ∈ s, budget j) = K+1) :
    ∃ reduced : α → ℕ,
      (∀ j ∈ s, reduced j ≤ budget j) ∧
      (∑ j ∈ s, reduced j) = K ∧
      (∑ j ∈ s, armAllowance (capacity j) i (budget j)) ≤
        (∑ j ∈ s, armAllowance (capacity j) i (reduced j)) + i := by
  have hex : ∃ j ∈ s, 0 < budget j := by
    by_contra h
    push Not at h
    have hz : (∑ j ∈ s, budget j) = 0 := Finset.sum_eq_zero (fun j hj => by have := h j hj; omega)
    omega
  obtain ⟨j,hj,hjpos⟩ := hex
  let reduced := Function.update budget j (budget j-1)
  refine ⟨reduced, ?_, ?_, ?_⟩
  · intro k hk
    by_cases he : k = j
    · subst k
      simp [reduced]
    · simp [reduced, Function.update_of_ne he]
  · have h := sum_update_balance s budget j hj (budget j-1)
    dsimp [reduced]
    omega
  · let f := fun k => armAllowance (capacity k) i (budget k)
    have hf : (fun k => armAllowance (capacity k) i (reduced k)) =
        Function.update f j (armAllowance (capacity j) i (budget j-1)) := by
      funext k
      by_cases he : k = j
      · subst k
        simp [f, reduced]
      · simp [f, reduced, Function.update_of_ne he]
    rw [hf]
    change (∑ k ∈ s, armAllowance (capacity k) i (budget k)) ≤
      (∑ k ∈ s, Function.update f j (armAllowance (capacity j) i (budget j-1)) k) + i
    have hsum := sum_update_balance s f j hj (armAllowance (capacity j) i (budget j-1))
    have hstep := armAllowance_step (capacity j) i (budget j-1)
    have hindex : budget j-1+1 = budget j := by omega
    rw [hindex] at hstep
    change (∑ k ∈ s, Function.update f j (armAllowance (capacity j) i (budget j-1)) k) +
      armAllowance (capacity j) i (budget j) =
        (∑ k ∈ s, armAllowance (capacity k) i (budget k)) +
          armAllowance (capacity j) i (budget j-1) at hsum
    omega

end Hornak
