import Conjectures.HornakChooseArm

/-! Simultaneous carry reservations for several arms. -/
namespace Hornak

theorem allocate_with_lower {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity lower : α → ℕ) (a : ℕ)
    (hbound : ∀ j ∈ s, lower j ≤ capacity j)
    (hlow : (∑ j ∈ s, lower j) ≤ a) (htotal : a ≤ ∑ j ∈ s, capacity j) :
    ∃ used : α → ℕ, (∀ j ∈ s, lower j ≤ used j ∧ used j ≤ capacity j) ∧
      (∑ j ∈ s, used j) = a := by
  let remaining := fun j => capacity j-lower j
  have hsum : (∑ j ∈ s, remaining j)+(∑ j ∈ s, lower j) = ∑ j ∈ s, capacity j := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro j hj
    exact Nat.sub_add_cancel (hbound j hj)
  obtain ⟨used,hu,hs⟩ := allocate s remaining (a-(∑ j ∈ s, lower j)) (by omega)
  refine ⟨fun j => used j+lower j, ?_, ?_⟩
  · intro j hj
    have h := hu j hj
    have h' := hbound j hj
    dsimp [remaining] at h
    change lower j ≤ used j+lower j ∧ used j+lower j ≤ capacity j
    omega
  · rw [Finset.sum_add_distrib, hs]
    omega

/-- Any specified set of arms can simultaneously supply one carry each,
provided their minimum costs fit among the smaller pieces. -/
theorem packing_with_carries {m : ℕ} (capacity : Fin m → ℕ) (S : Finset (Fin m))
    (i a b : ℕ) (hi : 0 < i) (ha : a ≤ ∑ j, capacity j/i)
    (hb : a+b ≤ (∑ j, capacity j/(i+1))+S.card)
    (hcost : (∑ j ∈ S, ((i+1)-capacity j%(i+1))) ≤ a)
    (hcap : ∀ j ∈ S, (i+1)-capacity j%(i+1) ≤ capacity j/i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  classical
  let lower : Fin m → ℕ := fun j => if j ∈ S then (i+1)-capacity j%(i+1) else 0
  have hbound : ∀ j ∈ Finset.univ, lower j ≤ capacity j/i := by
    intro j _
    by_cases hj : j ∈ S
    · simp [lower,hj,hcap j hj]
    · simp [lower,hj]
  have hlower : (∑ j, lower j) = ∑ j ∈ S, ((i+1)-capacity j%(i+1)) := by
    simp [lower, Finset.sum_ite_mem]
  obtain ⟨small,hs,hsum⟩ := allocate_with_lower Finset.univ (fun j => capacity j/i) lower a
    hbound (by rw [hlower]; exact hcost) ha
  have hfit : ∀ j ∈ Finset.univ, small j*i ≤ capacity j := by
    intro j hj
    exact (Nat.le_div_iff_mul_le hi).1 (hs j hj).2
  have hcarry (j : Fin m) (hj : j ∈ S) : 1 ≤ (capacity j%(i+1)+small j)/(i+1) := by
    apply (complementary_carry_iff i _ _ (Nat.mod_lt _ (by omega))).2
    have h := (hs j (Finset.mem_univ j)).1
    simpa [lower,hj] using h
  have hcsum : S.card ≤ ∑ j, (capacity j%(i+1)+small j)/(i+1) := by
    calc
      S.card = ∑ j, if j ∈ S then 1 else 0 := by simp [Finset.sum_ite_mem]
      _ ≤ ∑ j, (capacity j%(i+1)+small j)/(i+1) := by
        apply Finset.sum_le_sum
        intro j _
        by_cases hj : j ∈ S
        · simpa [hj] using hcarry j hj
        · simp [hj]
  have hrem := complementary_sum_capacity Finset.univ capacity small i hfit
  rw [hsum] at hrem
  have hlarge : b ≤ ∑ j, (capacity j-small j*i)/(i+1) := by omega
  obtain ⟨large,hlfit,hlsum⟩ := (fixed_small_packing_iff Finset.univ capacity small i b hfit).2 hlarge
  exact ⟨small,large,hsum,hlsum,fun j => hlfit j (Finset.mem_univ j)⟩

theorem quotient_strict_of_carry (x i : ℕ) (hi : 0 < i)
    (hw : i ≤ x/(i+1)+x%(i+1)) : x/(i+1)+1 ≤ x/i := by
  apply (Nat.le_div_iff_mul_le hi).2
  have h := (residue_decomposition x i hi).1
  nlinarith

theorem reduced_quotients_gain_one {m : ℕ} (arms : Fin m → ℕ) (p q : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hpq : p ≠ q)
    (hres : extra ≤ arms q%(i+1))
    (hw : i ≤ arms p/(i+1)+arms p%(i+1)) :
    (∑ j, arms j/(i+1))+1 ≤ ∑ j, reducedArm arms q extra j/i := by
  have heq : (arms q-extra)/(i+1) = arms q/(i+1) := quotient_unchanged_of_residue (arms q) i extra hres
  have hle (j : Fin m) : arms j/(i+1) ≤ reducedArm arms q extra j/i := by
    by_cases hj : j=q
    · subst j
      have h := consecutive_quotient_order (arms q-extra) i hi
      simpa [reducedArm, heq] using h
    · have h := consecutive_quotient_order (arms j) i hi
      simpa [reducedArm,hj] using h
  have hlt : arms p/(i+1) < reducedArm arms q extra p/i := by
    have h := quotient_strict_of_carry (arms p) i hi hw
    simp only [reducedArm, Function.update_of_ne hpq]
    omega
  have hsum : (∑ j, arms j/(i+1)) < ∑ j, reducedArm arms q extra j/i := by
    apply Finset.sum_lt_sum (fun j _ => hle j)
    exact ⟨p,Finset.mem_univ p,hlt⟩
  omega

/-- A nonwrapping placement on one arm and a carry in another handle the
first rho-two subcase. -/
theorem extra_one_carry_no_loss_packing {m : ℕ} (arms : Fin m → ℕ) (p q : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (hpq : p ≠ q)
    (hres : extra ≤ arms q%(i+1)) (hw : i ≤ arms p/(i+1)+arms p%(i+1))
    (hmin : (i+1)-arms p%(i+1) ≤ a)
    (hbudget : a+b ≤ (∑ j, arms j/(i+1))+1) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms q extra j := by
  have hlarge := (reduced_quotient_sum_no_loss arms q i extra hi hres).1
  have hsmall := reduced_quotients_gain_one arms p q i extra hi hpq hres hw
  have hpfit : (i+1)-reducedArm arms q extra p%(i+1) ≤ reducedArm arms q extra p/i := by
    have h := (can_create_carry_iff (arms p) i hi).2 hw
    simpa [reducedArm,hpq] using h
  have hpmin : (i+1)-reducedArm arms q extra p%(i+1) ≤ a := by
    simpa [reducedArm,hpq] using hmin
  apply packing_one_carry (reducedArm arms q extra) i a b hi (by omega) (by omega) p hpmin hpfit

theorem reduced_quotients_gain_one_self {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hres : extra ≤ arms p%(i+1))
    (hw : i+extra ≤ arms p/(i+1)+arms p%(i+1)) :
    (∑ j, arms j/(i+1))+1 ≤ ∑ j, reducedArm arms p extra j/i := by
  have heq := quotient_unchanged_of_residue (arms p) i extra hres
  have hcap : extra ≤ arms p := hres.trans (Nat.mod_le _ _)
  have hle (j : Fin m) : arms j/(i+1) ≤ reducedArm arms p extra j/i := by
    by_cases hj : j=p
    · subst j
      have h := consecutive_quotient_order (arms p-extra) i hi
      simpa [reducedArm,heq] using h
    · have h := consecutive_quotient_order (arms j) i hi
      simpa [reducedArm,hj] using h
  have hlt : arms p/(i+1) < reducedArm arms p extra p/i := by
    have h := (residue_decomposition (arms p) i hi).1
    have hsub := Nat.sub_add_cancel hcap
    have hh : (arms p/(i+1)+1)*i ≤ arms p-extra := by nlinarith
    have hh' := (Nat.le_div_iff_mul_le hi).2 hh
    simp only [reducedArm, Function.update_self]
    omega
  have hsum : (∑ j, arms j/(i+1)) < ∑ j, reducedArm arms p extra j/i := by
    apply Finset.sum_lt_sum (fun j _ => hle j)
    exact ⟨p,Finset.mem_univ p,hlt⟩
  omega

theorem extra_one_carry_same_arm_packing {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (hres : extra ≤ arms p%(i+1))
    (hw : i+extra ≤ arms p/(i+1)+arms p%(i+1))
    (hmin : (i+1)-(arms p%(i+1)-extra) ≤ a)
    (hbudget : a+b ≤ (∑ j, arms j/(i+1))+1) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have hlarge := (reduced_quotient_sum_no_loss arms p i extra hi hres).1
  have hsmall := reduced_quotients_gain_one_self arms p i extra hi hres hw
  have hcap : extra ≤ arms p := hres.trans (Nat.mod_le _ _)
  have hdiv := Nat.div_add_mod (arms p) (i+1)
  have hv := Nat.mod_lt (arms p) (by omega : 0 < i+1)
  have hsub := Nat.sub_add_cancel hcap
  have hvsub := Nat.sub_add_cancel hres
  have hrep : arms p-extra = (i+1)*(arms p/(i+1))+(arms p%(i+1)-extra) := by nlinarith
  have hrem : (arms p-extra)%(i+1) = arms p%(i+1)-extra := by
    rw [hrep, Nat.mul_add_mod, Nat.mod_eq_of_lt (by omega)]
  have hquot := quotient_unchanged_of_residue (arms p) i extra hres
  have hgood : i ≤ (arms p-extra)/(i+1)+(arms p-extra)%(i+1) := by rw [hquot,hrem]; omega
  have hpfit : (i+1)-reducedArm arms p extra p%(i+1) ≤ reducedArm arms p extra p/i := by
    have h := (can_create_carry_iff (arms p-extra) i hi).2 hgood
    simpa [reducedArm] using h
  have hpmin : (i+1)-reducedArm arms p extra p%(i+1) ≤ a := by
    simpa [reducedArm,hrem] using hmin
  apply packing_one_carry (reducedArm arms p extra) i a b hi (by omega) (by omega) p hpmin hpfit

theorem reduced_quotients_gain_one_wrap {m : ℕ} (arms : Fin m → ℕ) (p q : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hpq : p ≠ q) (hcap : extra ≤ arms q)
    (hwq : extra ≤ arms q/(i+1)+arms q%(i+1))
    (hwp : i ≤ arms p/(i+1)+arms p%(i+1)) :
    (∑ j, arms j/(i+1))+1 ≤ ∑ j, reducedArm arms q extra j/i := by
  have hle (j : Fin m) : arms j/(i+1) ≤ reducedArm arms q extra j/i := by
    by_cases hj : j=q
    · subst j
      simpa [reducedArm] using small_slots_after_wrap (arms q) i extra hi hcap hwq
    · have h := consecutive_quotient_order (arms j) i hi
      simpa [reducedArm,hj] using h
  have hlt : arms p/(i+1) < reducedArm arms q extra p/i := by
    have h := quotient_strict_of_carry (arms p) i hi hwp
    simp only [reducedArm, Function.update_of_ne hpq]
    omega
  have hsum : (∑ j, arms j/(i+1)) < ∑ j, reducedArm arms q extra j/i := by
    apply Finset.sum_lt_sum (fun j _ => hle j)
    exact ⟨p,Finset.mem_univ p,hlt⟩
  omega

theorem extra_two_carry_wrap_packing {m : ℕ} (arms : Fin m → ℕ) (p q : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (he : extra ≤ i+1) (hpq : p ≠ q)
    (hcap : extra ≤ arms q) (hwrap : arms q%(i+1) < extra)
    (hwq : extra ≤ arms q/(i+1)+arms q%(i+1))
    (hwp : i ≤ arms p/(i+1)+arms p%(i+1))
    (hcost : ((i+1)-arms p%(i+1))+(extra-arms q%(i+1)) ≤ a)
    (hbudget : a+b ≤ (∑ j, arms j/(i+1))+1) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms q extra j := by
  classical
  let S : Finset (Fin m) := {p,q}
  have hlarge := (wrapped_sum_relations arms q i extra hi he hcap hwrap hwq).1
  have hsmall := reduced_quotients_gain_one_wrap arms p q i extra hi hpq hcap hwq hwp
  have hpfit : (i+1)-reducedArm arms q extra p%(i+1) ≤ reducedArm arms q extra p/i := by
    have h := (can_create_carry_iff (arms p) i hi).2 hwp
    simpa [reducedArm,hpq] using h
  have hqfit : (i+1)-reducedArm arms q extra q%(i+1) ≤ reducedArm arms q extra q/i := by
    have h := (wrapped_sum_relations arms q i extra hi he hcap hwrap hwq).2.2
    have hlocal : arms q/(i+1) ≤ reducedArm arms q extra q/i := by
      simpa [reducedArm] using small_slots_after_wrap (arms q) i extra hi hcap hwq
    rw [h]
    omega
  have hqcost := (wrapped_sum_relations arms q i extra hi he hcap hwrap hwq).2.2
  have hpCost : (i+1)-reducedArm arms q extra p%(i+1) = (i+1)-arms p%(i+1) := by
    simp [reducedArm,hpq]
  apply packing_with_carries (reducedArm arms q extra) S i a b hi (by omega)
  · simp [S,hpq]
    omega
  · simp [S,hpq,hpCost,hqcost]
    exact hcost
  · intro j hj
    simp only [S, Finset.mem_insert, Finset.mem_singleton] at hj
    rcases hj with rfl | rfl
    · exact hpfit
    · exact hqfit

theorem residue_eq_w_mod (x i : ℕ) (hi : 0 < i) :
    x%i = (x/(i+1)+x%(i+1))%i := by
  have h := (residue_decomposition x i hi).1
  conv_lhs => rw [h]
  rw [Nat.mul_add_mod]

theorem residue_eq_w_sub (x i extra : ℕ) (hi : 0 < i) (hextra : extra < i)
    (hlow : i ≤ x/(i+1)+x%(i+1))
    (hhigh : x/(i+1)+x%(i+1) < i+extra) :
    x%i = x/(i+1)+x%(i+1)-i := by
  rw [residue_eq_w_mod x i hi, Nat.mod_eq_sub_mod hlow,
    Nat.mod_eq_of_lt (by omega : x/(i+1)+x%(i+1)-i < i)]

end Hornak
