import Conjectures.HornakZero

namespace Hornak

/-- A positive-gap arm contributes no deficit; a bound on the other two
large residues controls the whole three-arm deficit. -/
theorem three_arm_deficit_of_one_positive (arms : Fin 3 → ℕ) (p : Fin 3)
    (i lam : ℕ) (hp : arms p/i ≠ arms p/(i+1))
    (hother : ∀ j k : Fin 3, j ≠ p → k ≠ p → j ≠ k →
      arms j%(i+1)+arms k%(i+1)+lam ≤ i) :
    (∑ j, if arms j/i = arms j/(i+1) then arms j%(i+1) else 0)+lam ≤ i := by
  fin_cases p
  · have hh := hother 1 2 (by decide) (by decide) (by decide)
    simp only [Fin.sum_univ_three] at ⊢
    have hp' : arms 0/i ≠ arms 0/(i+1) := by simpa using hp
    simp only [hp', ite_false]
    split_ifs <;> omega
  · have hh := hother 0 2 (by decide) (by decide) (by decide)
    simp only [Fin.sum_univ_three] at ⊢
    have hp' : arms 1/i ≠ arms 1/(i+1) := by simpa using hp
    simp only [hp', ite_false]
    split_ifs <;> omega
  · have hh := hother 0 1 (by decide) (by decide) (by decide)
    simp only [Fin.sum_univ_three] at ⊢
    have hp' : arms 2/i ≠ arms 2/(i+1) := by simpa using hp
    simp only [hp', ite_false]
    split_ifs <;> omega


theorem residue_gap_lower (x i : ℕ) (hi : 0 < i) :
    x%i ≤ x/(i+1)+x%(i+1) ∧
    (x/i ≠ x/(i+1) → i+x%i ≤ x/(i+1)+x%(i+1)) := by
  have h := (residue_decomposition x i hi).2
  have horder := consecutive_quotient_order x i hi
  constructor
  · nlinarith
  · intro hn
    have hp : 1 ≤ x/i-x/(i+1) := by omega
    nlinarith

theorem one_gap_sum_lower (arms : Fin 3 → ℕ) (p : Fin 3) (i : ℕ)
    (hi : 0 < i) (hp : arms p/i ≠ arms p/(i+1)) :
    i+(∑ j, arms j%i) ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1)) := by
  have h0 := residue_gap_lower (arms 0) i hi
  have h1 := residue_gap_lower (arms 1) i hi
  have h2 := residue_gap_lower (arms 2) i hi
  fin_cases p
  · have hp' : arms 0/i ≠ arms 0/(i+1) := by simpa using hp
    have hh := h0.2 hp'
    simp only [Fin.sum_univ_three]
    omega
  · have hp' : arms 1/i ≠ arms 1/(i+1) := by simpa using hp
    have hh := h1.2 hp'
    simp only [Fin.sum_univ_three]
    omega
  · have hp' : arms 2/i ≠ arms 2/(i+1) := by simpa using hp
    have hh := h2.2 hp'
    simp only [Fin.sum_univ_three]
    omega

/-- Under the fifth test, the two arms other than a unique positive-gap
arm have total larger residue at most the available zero-budget deficit. -/
theorem one_gap_other_bound (arms : Fin 3 → ℕ) (p : Fin 3) (i extra lam : ℕ)
    (hi : 0 < i) (hp : arms p/i ≠ arms p/(i+1))
    (hunique : ∀ j, j ≠ p → arms j/i = arms j/(i+1))
    (hu : i+extra ≤ (∑ j, arms j%i)+lam)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1)) :
    ∀ j k : Fin 3, j ≠ p → k ≠ p → j ≠ k →
      arms j%(i+1)+arms k%(i+1)+lam ≤ i := by
  let V := ∑ j, arms j%(i+1)
  have hV : V+lam < 2*(i+1) := by
    have hh := hpairsv 0 1 (by decide)
    have hv := Nat.mod_lt (arms 2) (by omega : 0 < i+1)
    dsimp [V]
    rw [Fin.sum_univ_three]
    omega
  by_cases hlow : V+lam ≤ i
  · intro j k hj hk hjk
    have hsum : arms j%(i+1)+arms k%(i+1) ≤ V := by
      dsimp [V]
      have hh := Finset.sum_le_sum_of_subset_of_nonneg (f := fun l : Fin 3 => arms l%(i+1))
        (show ({j,k} : Finset (Fin 3)) ⊆ Finset.univ from Finset.subset_univ _)
        (fun _ _ _ => Nat.zero_le _)
      simpa [hjk] using hh
    omega
  · have hcarry : (V+lam)/(i+1) = 1 := by
      apply Nat.div_eq_of_lt_le <;> omega
    have hbig : 2*i ≤ (∑ j, arms j/(i+1))+V+lam := by
      have hh := one_gap_sum_lower arms p i hi hp
      omega
    obtain ⟨w,hwres,hwcap⟩ := htest5 (by simpa [V] using hcarry) (by simpa [V] using hbig)
    have hwp : w=p := by
      by_contra hn
      have heq := hunique w hn
      have hd := (residue_decomposition (arms w) i hi).2
      simp only [heq, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at hd
      have hmod := Nat.mod_lt (arms w) hi
      omega
    subst w
    change (V+lam)%(i+1) < arms p%(i+1) at hwres
    have hmod := Nat.div_add_mod (V+lam) (i+1)
    rw [hcarry] at hmod
    have hoff : V+lam ≤ i+arms p%(i+1) := by omega
    intro j k hj hk hjk
    have hh := Finset.sum_le_sum_of_subset_of_nonneg (f := fun l : Fin 3 => arms l%(i+1))
      (show ({p,j,k} : Finset (Fin 3)) ⊆ Finset.univ from Finset.subset_univ _)
      (fun _ _ _ => Nat.zero_le _)
    have hsum : arms p%(i+1)+arms j%(i+1)+arms k%(i+1) ≤ V := by
      simpa [V, hj.symm, hk.symm, hjk, Nat.add_assoc] using hh
    omega

/-- Zero-slack exceptional packing with exactly one positive quotient gap. -/
theorem exceptional_zero_one_positive_from_tests (arms : Fin 3 → ℕ) (p : Fin 3)
    (i extra lam a b : ℕ) (hi : 0 < i) (hp : arms p/i ≠ arms p/(i+1))
    (hunique : ∀ j, j ≠ p → arms j/i = arms j/(i+1))
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  obtain ⟨hres,hrem⟩ := exceptional_zero_residue_bounds arms i extra lam a b hi hpairsu htotal hbudget
  have hu : i+extra ≤ (∑ j, arms j%i)+lam := by omega
  have hother := one_gap_other_bound arms p i extra lam hi hp hunique hu hpairsv htest5
  have hdef := three_arm_deficit_of_one_positive arms p i lam hp hother
  refine ⟨p,?_⟩
  exact exceptional_zero_of_original_deficit arms p i extra lam a b hi
    (by have h := hrem p; omega) hbudget hres hdef

/-- At zero budget, equal consecutive quotients in every arm make every
larger-piece slot free of carry cost. -/
theorem zero_budget_all_equal {m : ℕ} (capacity : Fin m → ℕ) (i a b : ℕ)
    (hi : 0 < i) (heq : ∀ j, capacity j/i = capacity j/(i+1))
    (hbudget : a+b = ∑ j, capacity j/i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  apply (zero_budget_packing_iff capacity i a b hi hbudget).2
  have hmin : ∀ j, min (capacity j/(i+1)) (capacity j%i) = capacity j/i := by
    intro j
    have hh := (residue_decomposition (capacity j) i hi).2
    simp only [heq j, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at hh
    rw [Nat.min_eq_left (by omega), ← heq j]
  simp only [hmin]
  omega

/-- Zero-slack exceptional packing when all original quotient gaps vanish. -/
theorem exceptional_zero_no_positive_from_tests (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i)
    (heq : ∀ j, arms j/i = arms j/(i+1))
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  obtain ⟨hres,hrem⟩ := exceptional_zero_residue_bounds arms i extra lam a b hi hpairsu htotal hbudget
  let p : Fin 3 := 0
  have hr : extra ≤ arms p%i := by have h := hrem p; omega
  have hs := reserve_small_sums arms p i extra hi hr
  have hbudget' : a+b = ∑ j, reducedArm arms p extra j/i := by omega
  have hres' : (∑ j, reducedArm arms p extra j%i)+lam = b+i := by omega
  refine ⟨p,?_⟩
  by_cases hp : reducedArm arms p extra p/i = reducedArm arms p extra p/(i+1)
  · apply zero_budget_all_equal (reducedArm arms p extra) i a b hi _ hbudget'
    intro j
    by_cases hj : j=p
    · simpa [hj] using hp
    · simpa [reducedArm, Function.update_of_ne hj] using heq j
  · apply zero_budget_packing_of_deficit (reducedArm arms p extra) i a b lam hi hbudget' hres'
    apply three_arm_deficit_of_one_positive (reducedArm arms p extra) p i lam hp
    intro j k hj hk hjk
    have hjv : arms j%(i+1) ≤ arms j%i := by
      have hh := (residue_decomposition (arms j) i hi).2
      simp only [heq j, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at hh
      rw [← hh]
      exact Nat.le_add_left _ _
    have hkv : arms k%(i+1) ≤ arms k%i := by
      have hh := (residue_decomposition (arms k) i hi).2
      simp only [heq k, Nat.sub_self, Nat.mul_zero, Nat.zero_add] at hh
      rw [← hh]
      exact Nat.le_add_left _ _
    have hpair := hpairsu j k hjk
    simp only [reducedArm, Function.update_of_ne hj, Function.update_of_ne hk]
    omega

theorem fin_three_cover (p j k l : Fin 3) (hpj : p ≠ j) (hpk : p ≠ k) (hjk : j ≠ k) :
    l = p ∨ l = j ∨ l = k := by
  fin_cases p <;> fin_cases j <;> fin_cases k <;> fin_cases l <;> simp_all

/-- All zero-slack exceptional packings follow from the residue tests and
fifth-test witness, by the zero-, one-, and two-gap cases. -/
theorem exceptional_zero_packing_from_tests (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i) (hlam : lam ≤ 1)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  by_cases htwo : ∀ j k : Fin 3, j ≠ k →
      arms j/i ≠ arms j/(i+1) ∨ arms k/i ≠ arms k/(i+1)
  · exact exceptional_zero_two_positive_from_tests arms i extra lam a b hi hlam hpairsu htwo htotal hbudget
  · push Not at htwo
    obtain ⟨j,k,hjk,hj,hk⟩ := htwo
    by_cases hall : ∀ t, arms t/i = arms t/(i+1)
    · exact exceptional_zero_no_positive_from_tests arms i extra lam a b hi hall hpairsu htotal hbudget
    · push Not at hall
      obtain ⟨p,hp⟩ := hall
      have hpj : p ≠ j := by intro h; subst p; exact hp hj
      have hpk : p ≠ k := by intro h; subst p; exact hp hk
      have hunique : ∀ t, t ≠ p → arms t/i = arms t/(i+1) := by
        intro t ht
        rcases fin_three_cover p j k t hpj hpk hjk with he | he | he
        · exact (ht he).elim
        · simpa [he] using hj
        · simpa [he] using hk
      exact exceptional_zero_one_positive_from_tests arms p i extra lam a b hi hp hunique
        hpairsu hpairsv htest5 htotal hbudget

/-- The pairwise small-residue test makes the exceptional packing budget
nonnegative for every input count pair. -/
theorem exceptional_budget_nonnegative (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    a+b ≤ ∑ j, arms j/i := by
  have h01 := hpairsu 0 1 (by decide)
  have h2 := Nat.mod_lt (arms 2) hi
  have hU : (∑ j, arms j%i)+lam < 2*i := by
    rw [Fin.sum_univ_three]
    omega
  have hsum := arm_quotient_sum_identity arms i
  by_contra hn
  have hq : (∑ j, arms j/i)+1 ≤ a+b := by omega
  nlinarith

/-- Every exceptional count pair packs under the stated residue and fifth
 test hypotheses; the proof covers zero and positive quotient slack. -/
theorem exceptional_packing_from_tests (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  have hb := exceptional_budget_nonnegative arms i extra lam a b hi hpairsu htotal
  by_cases hz : a+b = ∑ j, arms j/i
  · exact exceptional_zero_packing_from_tests arms i extra lam a b hi hlam hpairsu hpairsv htest5 htotal hz
  · exact exceptional_positive_budget_packing arms i extra lam a b hi hextra he hlam harms
      hpairsu hpairsv htest5 htotal (by omega)

/-- The exceptional-size tests construct connected partitions of the
four-arm graph with the extra arm wholly contained in the center. -/
theorem exceptional_partition_with_reserved_arm_from_tests {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (hcenter : sizes 0 = i+1) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    Partitionable (Fin.cases lam arms) sizes := by
  obtain ⟨p,small,large,hs,hl,hfit⟩ := exceptional_packing_from_tests arms i extra lam a b
    hi hextra he hlam harms hpairsu hpairsv htest5 htotal
  apply extra_partition_with_reserved_arm arms sizes i extra a b (i+1) lam p hi hextra
    (by have h := harms p; omega) hcenter hextrasize hsmall hlarge hvalues htotal
  exact ⟨small,large,hs,hl,hfit⟩

/-- The corresponding exceptional-size graph partition for a tripod. -/
theorem exceptional_partition_from_tests {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1) < i+1)
    (htest5 : (∑ j, arms j%(i+1))/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1)) →
      ∃ j, (∑ k, arms k%(i+1))%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (hcenter : sizes 0 = i+1) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+∑ j, arms j) :
    Partitionable arms sizes := by
  obtain ⟨p,small,large,hs,hl,hfit⟩ := exceptional_packing_from_tests arms i extra 0 a b
    hi hextra he (by omega) harms (by simpa using hpairsu) (by simpa using hpairsv)
    (by simpa using htest5) (by simpa using htotal)
  apply extra_partition_from_reduced_packing arms sizes i extra a b (i+1) p hi hextra
    (by have h := harms p; omega) hcenter hextrasize hsmall hlarge hvalues htotal
  refine ⟨small,large,hs,hl,?_⟩
  intro j
  by_cases hj : j=p
  · subst j
    simpa [reducedArm] using hfit p
  · simpa [reducedArm, hj] using hfit j

end Hornak
