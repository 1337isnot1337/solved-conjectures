import Conjectures.HornakLargest

/-! The zero-carry packing criterion for exceptional central pieces. -/
namespace Hornak

theorem zero_budget_packing_iff {m : ℕ} (capacity : Fin m → ℕ) (i a b : ℕ)
    (hi : 0 < i) (hbudget : a+b = ∑ j, capacity j/i) :
    (∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j) ↔
    b ≤ ∑ j, min (capacity j/(i+1)) (capacity j%i) := by
  classical
  have hequiv : b ≤ maxLarge capacity i 0 ↔
      b ≤ ∑ j, min (capacity j/(i+1)) (capacity j%i) := by
    constructor
    · intro hb
      obtain ⟨large,hs,hfit,hcost⟩ := (large_packing_iff capacity i 0 b hi).2 hb
      rw [← hs]
      apply Finset.sum_le_sum
      intro j _
      have hz : carryCost i (capacity j%i) (large j) = 0 := by
        have h := Finset.single_le_sum (fun k _ => Nat.zero_le (carryCost i (capacity k%i) (large k))) (Finset.mem_univ j)
        omega
      have h := (armAllowance_iff (capacity j) i (large j) 0 hi).2 ⟨hfit j, by omega⟩
      simpa [armAllowance] using h
    · intro hb
      obtain ⟨large,hlarge,hs⟩ := allocate Finset.univ
        (fun j => min (capacity j/(i+1)) (capacity j%i)) b hb
      apply (large_packing_iff capacity i 0 b hi).1
      refine ⟨large,hs,?_,?_⟩
      · intro j
        have h := hlarge j (Finset.mem_univ j)
        have h' : large j ≤ armAllowance (capacity j) i 0 := by simpa [armAllowance] using h
        exact ((armAllowance_iff _ _ _ _ hi).1 h').1
      · apply le_of_eq
        apply Finset.sum_eq_zero
        intro j _
        have h := hlarge j (Finset.mem_univ j)
        have h' : large j ≤ armAllowance (capacity j) i 0 := by simpa [armAllowance] using h
        have hh := ((armAllowance_iff _ _ _ _ hi).1 h').2
        omega
  have hbudget' : a+b+0 = ∑ j, capacity j/i := by simpa using hbudget
  exact (two_size_packing_iff capacity i a b 0 hi hbudget').trans hequiv

/-- Only arms whose consecutive quotients coincide can lose zero-cost
larger-piece capacity, and their loss is bounded by the larger residue. -/
theorem zero_budget_arm_deficit (x i : ℕ) (hi : 0 < i) :
    x%i ≤ min (x/(i+1)) (x%i) +
      if x/i = x/(i+1) then x%(i+1) else 0 := by
  have h := residue_decomposition x i hi
  dsimp only at h
  have hmod := Nat.mod_lt x (by omega : 0 < i+1)
  have horder := consecutive_quotient_order x i hi
  by_cases heq : x/i = x/(i+1)
  · simp only [heq, ↓reduceIte]
    have hh : x/(i+1)+x%(i+1) = x%i := by
      rw [heq, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at h
      exact h.2
    omega
  · simp only [heq, ↓reduceIte, add_zero]
    have hpos : 1 ≤ x/i-x/(i+1) := by omega
    have hbound : x%i ≤ x/(i+1) := by nlinarith [h.2]
    exact (Nat.min_eq_right hbound).symm.le

/-- A bound on the residues of equal-quotient arms suffices at zero budget. -/
theorem zero_budget_packing_of_deficit {m : ℕ} (capacity : Fin m → ℕ)
    (i a b lam : ℕ) (hi : 0 < i)
    (hbudget : a+b = ∑ j, capacity j/i)
    (hresidue : (∑ j, capacity j%i)+lam = b+i)
    (hdeficit : (∑ j, if capacity j/i = capacity j/(i+1)
      then capacity j%(i+1) else 0)+lam ≤ i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  apply (zero_budget_packing_iff capacity i a b hi hbudget).2
  have hsum : (∑ j, capacity j%i) ≤
      (∑ j, min (capacity j/(i+1)) (capacity j%i)) +
      (∑ j, if capacity j/i = capacity j/(i+1) then capacity j%(i+1) else 0) := by
    rw [← Finset.sum_add_distrib]
    exact Finset.sum_le_sum (fun j _ => zero_budget_arm_deficit (capacity j) i hi)
  omega

/-- If at most one arm has equal consecutive quotients, its residue alone
fits in the available zero-budget deficit. -/
theorem three_arm_deficit_of_two_positive (capacity : Fin 3 → ℕ) (i lam : ℕ)
    (hi : 0 < i) (hlam : lam ≤ 1)
    (htwo : ∀ j k : Fin 3, j ≠ k →
      capacity j/i ≠ capacity j/(i+1) ∨ capacity k/i ≠ capacity k/(i+1)) :
    (∑ j, if capacity j/i = capacity j/(i+1)
      then capacity j%(i+1) else 0)+lam ≤ i := by
  have h01 := htwo 0 1 (by decide)
  have h02 := htwo 0 2 (by decide)
  have h12 := htwo 1 2 (by decide)
  have h0 := Nat.mod_lt (capacity 0) (by omega : 0 < i+1)
  have h1 := Nat.mod_lt (capacity 1) (by omega : 0 < i+1)
  have h2 := Nat.mod_lt (capacity 2) (by omega : 0 < i+1)
  have hv : ∀ j, capacity j/i = capacity j/(i+1) → capacity j%(i+1) < i := by
    intro j heq
    have h := residue_decomposition (capacity j) i hi
    dsimp only at h
    simp only [heq, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at h
    have hm := Nat.mod_lt (capacity j) hi
    have hh : capacity j%(i+1) ≤ capacity j%i := by
      rw [← h.2]
      exact Nat.le_add_left _ _
    exact lt_of_le_of_lt hh hm
  by_cases e0 : capacity 0/i = capacity 0/(i+1) <;>
    by_cases e1 : capacity 1/i = capacity 1/(i+1) <;>
    by_cases e2 : capacity 2/i = capacity 2/(i+1) <;>
    simp only [Fin.sum_univ_three, e0, e1, e2, ite_true, ite_false]
  all_goals first
    | have hx := hv 0 (by assumption); omega
    | have hx := hv 1 (by assumption); omega
    | have hx := hv 2 (by assumption); omega
    | omega

/-- Reserving fewer vertices than the small residue leaves its quotient
unchanged and cannot create a new equal-quotient arm. -/
theorem reserve_preserves_small_quotient (x i extra : ℕ) (hi : 0 < i)
    (hrem : extra ≤ x%i) : (x-extra)/i = x/i := by
  have hmod := Nat.mod_lt x hi
  have hdiv := Nat.div_add_mod x i
  have hx : extra ≤ x := by omega
  have hremainder : x = (x/i)*i+x%i := by nlinarith
  have hsub : x-extra = (x/i)*i+(x%i-extra) := by omega
  rw [hsub, Nat.mul_comm (x/i) i, Nat.mul_add_div, Nat.div_eq_of_lt (by omega : x%i-extra < i), add_zero]
  exact hi

/-- Two already-positive quotient gaps remain positive after reserving a
piece in an arm whose small residue is large enough. -/
theorem reserve_preserves_two_positive (arms : Fin 3 → ℕ) (p : Fin 3)
    (i extra : ℕ) (hi : 0 < i) (hrem : extra ≤ arms p%i)
    (htwo : ∀ j k : Fin 3, j ≠ k →
      arms j/i ≠ arms j/(i+1) ∨ arms k/i ≠ arms k/(i+1)) :
    ∀ j k : Fin 3, j ≠ k →
      reducedArm arms p extra j/i ≠ reducedArm arms p extra j/(i+1) ∨
      reducedArm arms p extra k/i ≠ reducedArm arms p extra k/(i+1) := by
  have hkeep : ∀ j, arms j/i ≠ arms j/(i+1) →
      reducedArm arms p extra j/i ≠ reducedArm arms p extra j/(i+1) := by
    intro j hj
    by_cases hp : j=p
    · subst j
      have hq := reserve_preserves_small_quotient (arms p) i extra hi hrem
      have hsmall := consecutive_quotient_order (arms p) i hi
      have hlarge : (arms p-extra)/(i+1) ≤ arms p/(i+1) := Nat.div_le_div_right (Nat.sub_le _ _)
      simp only [reducedArm, Function.update_self, hq]
      omega
    · simpa [reducedArm, Function.update_of_ne hp] using hj
  intro j k hjk
  rcases htwo j k hjk with h | h
  · exact Or.inl (hkeep j h)
  · exact Or.inr (hkeep k h)

theorem reserve_small_residue (x i extra : ℕ) (hi : 0 < i)
    (hrem : extra ≤ x%i) : (x-extra)%i+extra = x%i := by
  have hmod := Nat.mod_lt x hi
  have hdiv := Nat.div_add_mod x i
  have hsub : x-extra = i*(x/i)+(x%i-extra) := by omega
  rw [hsub, Nat.mul_add_mod, Nat.mod_eq_of_lt (by omega : x%i-extra < i)]
  omega

theorem reserve_small_sums {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hrem : extra ≤ arms p%i) :
    (∑ j, reducedArm arms p extra j/i) = ∑ j, arms j/i ∧
    (∑ j, reducedArm arms p extra j%i)+extra = ∑ j, arms j%i := by
  classical
  have hq := reserve_preserves_small_quotient (arms p) i extra hi hrem
  have hu := reserve_small_residue (arms p) i extra hi hrem
  have hfunq : (fun j => reducedArm arms p extra j/i) = fun j => arms j/i := by
    funext j
    by_cases hp : j=p
    · subst j
      simpa [reducedArm] using hq
    · simp [reducedArm, Function.update_of_ne hp]
  have hfunu : (fun j => reducedArm arms p extra j%i) =
      Function.update (fun j => arms j%i) p ((arms p-extra)%i) := by
    funext j
    by_cases hp : j=p
    · subst j
      simp [reducedArm]
    · simp [reducedArm, hp]
  constructor
  · rw [hfunq]
  · rw [hfunu]
    change (∑ j, Function.update (fun j => arms j%i) p ((arms p-extra)%i) j)+extra = ∑ j, arms j%i
    have hs := sum_update_balance Finset.univ (fun j => arms j%i) p
      (Finset.mem_univ p) ((arms p-extra)%i)
    change (∑ j, Function.update (fun j => arms j%i) p ((arms p-extra)%i) j)+arms p%i =
      (∑ j, arms j%i)+(arms p-extra)%i at hs
    omega

/-- Zero-budget exceptional packing when two original arms have positive
quotient gaps and the selected arm has sufficient small residue. -/
theorem exceptional_zero_two_positive (arms : Fin 3 → ℕ) (p : Fin 3)
    (i extra lam a b : ℕ) (hi : 0 < i) (hlam : lam ≤ 1)
    (hrem : extra ≤ arms p%i)
    (htwo : ∀ j k : Fin 3, j ≠ k →
      arms j/i ≠ arms j/(i+1) ∨ arms k/i ≠ arms k/(i+1))
    (hbudget : a+b = ∑ j, arms j/i)
    (hresidue : (∑ j, arms j%i)+lam = b+i+extra) :
    ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have hs := reserve_small_sums arms p i extra hi hrem
  have hp := reserve_preserves_two_positive arms p i extra hi hrem htwo
  apply zero_budget_packing_of_deficit (reducedArm arms p extra) i a b lam hi
  · omega
  · omega
  · exact three_arm_deficit_of_two_positive (reducedArm arms p extra) i lam hi hlam hp

/-- In the zero-slack regime, the total equation and pairwise residue
bounds force every arm to have room in its small residue for the extra piece. -/
theorem exceptional_zero_residue_bounds (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (_hi : 0 < i)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    (∑ j, arms j%i)+lam = b+i+extra ∧ ∀ p, extra < arms p%i := by
  have hsum := arm_quotient_sum_identity arms i
  have heq : (∑ j, arms j%i)+lam = b+i+extra := by
    rw [← hbudget] at hsum
    nlinarith
  refine ⟨heq,?_⟩
  intro p
  fin_cases p
  · change extra < arms 0%i
    have h := hpairsu 1 2 (by decide)
    rw [Fin.sum_univ_three] at heq
    omega
  · change extra < arms 1%i
    have h := hpairsu 0 2 (by decide)
    rw [Fin.sum_univ_three] at heq
    omega
  · change extra < arms 2%i
    have h := hpairsu 0 1 (by decide)
    rw [Fin.sum_univ_three] at heq
    omega

/-- The two-positive-gap branch follows directly from the original total
and pairwise residue test, with no separately supplied endpoint equations. -/
theorem exceptional_zero_two_positive_from_tests (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i) (hlam : lam ≤ 1)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (htwo : ∀ j k : Fin 3, j ≠ k →
      arms j/i ≠ arms j/(i+1) ∨ arms k/i ≠ arms k/(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ p : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  obtain ⟨hres,hrem⟩ := exceptional_zero_residue_bounds arms i extra lam a b hi hpairsu htotal hbudget
  refine ⟨0,?_⟩
  exact exceptional_zero_two_positive arms 0 i extra lam a b hi hlam (by have h := hrem 0; omega)
    htwo hbudget hres

/-- If a reserved arm still has equal quotients, it had equal quotients
before reservation and its large residue has not increased. -/
theorem reserve_equal_gap_residue_le (x i extra : ℕ) (hi : 0 < i)
    (hrem : extra ≤ x%i)
    (heq : (x-extra)/i = (x-extra)/(i+1)) :
    x/i = x/(i+1) ∧ (x-extra)%(i+1) ≤ x%(i+1) := by
  have hq := reserve_preserves_small_quotient x i extra hi hrem
  have horder := consecutive_quotient_order x i hi
  have hmono : (x-extra)/(i+1) ≤ x/(i+1) := Nat.div_le_div_right (Nat.sub_le _ _)
  have heq0 : x/i = x/(i+1) := by omega
  have hh : (x-extra)/(i+1) = x/(i+1) := by omega
  have hdiv0 := Nat.div_add_mod x (i+1)
  have hdiv1 := Nat.div_add_mod (x-extra) (i+1)
  have hcap : extra ≤ x := by have h := Nat.mod_le x i; omega
  have hsub := Nat.sub_add_cancel hcap
  constructor
  · exact heq0
  · rw [hh] at hdiv1
    omega

/-- Reservation cannot increase the total zero-gap residue deficit. -/
theorem reserve_deficit_le {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hrem : extra ≤ arms p%i) :
    (∑ j, if reducedArm arms p extra j/i = reducedArm arms p extra j/(i+1)
      then reducedArm arms p extra j%(i+1) else 0) ≤
    (∑ j, if arms j/i = arms j/(i+1) then arms j%(i+1) else 0) := by
  apply Finset.sum_le_sum
  intro j _
  by_cases hp : j=p
  · subst j
    simp only [reducedArm, Function.update_self]
    by_cases heq : (arms p-extra)/i = (arms p-extra)/(i+1)
    · obtain ⟨hprev,hres⟩ := reserve_equal_gap_residue_le (arms p) i extra hi hrem heq
      simp [heq,hprev,hres]
    · simp [heq]
  · simp [reducedArm, Function.update_of_ne hp]

/-- Any original zero-gap deficit bound survives reservation and yields a
zero-budget exceptional packing. -/
theorem exceptional_zero_of_original_deficit (arms : Fin 3 → ℕ) (p : Fin 3)
    (i extra lam a b : ℕ) (hi : 0 < i) (hrem : extra ≤ arms p%i)
    (hbudget : a+b = ∑ j, arms j/i)
    (hresidue : (∑ j, arms j%i)+lam = b+i+extra)
    (hdeficit : (∑ j, if arms j/i = arms j/(i+1)
      then arms j%(i+1) else 0)+lam ≤ i) :
    ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have hs := reserve_small_sums arms p i extra hi hrem
  have hd := reserve_deficit_le arms p i extra hi hrem
  apply zero_budget_packing_of_deficit (reducedArm arms p extra) i a b lam hi
  · omega
  · omega
  · omega

end Hornak
