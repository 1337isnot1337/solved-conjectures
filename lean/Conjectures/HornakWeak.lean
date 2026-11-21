import Conjectures.HornakOne

/-! The original admissibility tests imply a weaker residue bound than the
pairwise hypotheses used in the initial exceptional-case formalization. -/
namespace Hornak

def WeakResidue (arms : Fin 3 → ℕ) (k lam : ℕ) : Prop :=
  ∃ p : Fin 3, (∑ j, arms j%k)+lam < k+arms p%k

theorem weak_residue_total_lt (arms : Fin 3 → ℕ) (k lam : ℕ)
    (hk : 0 < k) (hweak : WeakResidue arms k lam) :
    (∑ j, arms j%k)+lam < 2*k := by
  obtain ⟨p,hp⟩ := hweak
  have hh := Nat.mod_lt (arms p) hk
  omega

theorem weak_residue_select (arms : Fin 3 → ℕ) (k lam extra : ℕ)
    (hweak : WeakResidue arms k lam)
    (hlower : k+extra ≤ (∑ j, arms j%k)+lam) :
    ∃ p, extra < arms p%k := by
  obtain ⟨p,hp⟩ := hweak
  exact ⟨p,by omega⟩

/-- Tests 1 and 2 imply the residue bound used in the paper. The
one-edge arm is allowed to be the test witness. -/
theorem weak_residue_from_tests (arms : Fin 3 → ℕ) (k lam : ℕ)
    (hk : 2 ≤ k) (hlam : lam ≤ 1)
    (hcarry : ((∑ j, arms j%k)+lam)/k ≤ 1)
    (htest2 : ((∑ j, arms j%k)+lam)/k = 1 →
      (∃ p, ((∑ j, arms j%k)+lam)%k < arms p%k) ∨
      ((∑ j, arms j%k)+lam)%k < lam) :
    WeakResidue arms k lam := by
  let S := (∑ j, arms j%k)+lam
  change S/k ≤ 1 at hcarry
  change S/k = 1 → (∃ p, S%k < arms p%k) ∨ S%k < lam at htest2
  have hd := Nat.div_add_mod S k
  have hr := Nat.mod_lt S (by omega : 0 < k)
  by_cases hz : S/k = 0
  · refine ⟨0,?_⟩
    have hS : S < k := by rcases Nat.div_eq_zero_iff.mp hz with h | h <;> omega
    dsimp [S] at hS
    omega
  · have hone : S/k = 1 := Nat.le_antisymm hcarry (Nat.one_le_iff_ne_zero.mpr hz)
    have hw := htest2 hone
    have hS : S = k+S%k := by rw [hone] at hd; omega
    rcases hw with ⟨p,hp⟩ | hleaf
    · refine ⟨p,?_⟩
      change S < k+arms p%k
      omega
    · have hzero : S%k = 0 := by omega
      have hlamone : lam = 1 := by omega
      have hsum : (∑ j, arms j%k) = k-1 := by
        change (∑ j, arms j%k)+lam = k+S%k at hS
        omega
      have hpos : ∃ p : Fin 3, 0 < arms p%k := by
        by_contra hn
        push Not at hn
        have hh : (∑ j, arms j%k) = 0 := Finset.sum_eq_zero (fun p _ => by have h := hn p; omega)
        omega
      obtain ⟨p,hp⟩ := hpos
      refine ⟨p,?_⟩
      omega

theorem one_gap_other_bound_weak (arms : Fin 3 → ℕ) (p : Fin 3) (i extra lam : ℕ)
    (hi : 0 < i) (hp : arms p/i ≠ arms p/(i+1))
    (hunique : ∀ j, j ≠ p → arms j/i = arms j/(i+1))
    (hu : i+extra ≤ (∑ j, arms j%i)+lam)
    (hweak : WeakResidue arms (i+1) lam)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1)) :
    ∀ j k : Fin 3, j ≠ p → k ≠ p → j ≠ k →
      arms j%(i+1)+arms k%(i+1)+lam ≤ i := by
  let V := ∑ j, arms j%(i+1)
  have hV : V+lam < 2*(i+1) := by
    exact weak_residue_total_lt arms (i+1) lam (by omega) hweak
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


theorem weak_zero_residue_and_arm (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hweak : WeakResidue arms i lam)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    (∑ j, arms j%i)+lam = b+i+extra ∧
    ∃ p, extra < arms p%i ∧ (∑ j, arms j%i)+lam < i+arms p%i := by
  have hsum := arm_quotient_sum_identity arms i
  have heq : (∑ j, arms j%i)+lam = b+i+extra := by
    rw [← hbudget] at hsum
    nlinarith
  obtain ⟨p,hp⟩ := hweak
  exact ⟨heq,p,by omega,hp⟩

/-- The zero-slack case with at least two positive quotient gaps, under
exactly the weaker residue consequence of tests 1 and 2. -/
theorem exceptional_zero_two_positive_weak (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i) (hlam : lam ≤ 1)
    (hweak : WeakResidue arms i lam)
    (htwo : ∀ j k : Fin 3, j ≠ k →
      arms j/i ≠ arms j/(i+1) ∨ arms k/i ≠ arms k/(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ p : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  obtain ⟨hres,p,hrem,_⟩ := weak_zero_residue_and_arm arms i extra lam a b hweak htotal hbudget
  exact ⟨p,exceptional_zero_two_positive arms p i extra lam a b hi hlam (by omega) htwo hbudget hres⟩

/-- The zero-slack case with exactly one positive quotient gap, using the
original weaker residue bounds and the fifth-test witness. -/
theorem exceptional_zero_one_positive_weak (arms : Fin 3 → ℕ) (p : Fin 3)
    (i extra lam a b : ℕ) (hi : 0 < i) (hp : arms p/i ≠ arms p/(i+1))
    (hunique : ∀ j, j ≠ p → arms j/i = arms j/(i+1))
    (hu : WeakResidue arms i lam) (hv : WeakResidue arms (i+1) lam)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  obtain ⟨hres,selected,hrem,_⟩ := weak_zero_residue_and_arm arms i extra lam a b hu htotal hbudget
  have hupper : i+extra ≤ (∑ j, arms j%i)+lam := by omega
  have hother := one_gap_other_bound_weak arms p i extra lam hi hp hunique hupper hv htest5
  have hdef := three_arm_deficit_of_one_positive arms p i lam hp hother
  exact ⟨selected,exceptional_zero_of_original_deficit arms selected i extra lam a b hi
    (by omega) hbudget hres hdef⟩

/-- Zero-slack packing when no original quotient gap is positive, using
only the weaker residue condition from tests 1 and 2. -/
theorem exceptional_zero_no_positive_weak (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i)
    (heq : ∀ j, arms j/i = arms j/(i+1))
    (hu : WeakResidue arms i lam)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  obtain ⟨hres,p,hrem,hweak⟩ := weak_zero_residue_and_arm arms i extra lam a b hu htotal hbudget
  have hr : extra ≤ arms p%i := by omega
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
    have hh := Finset.sum_le_sum_of_subset_of_nonneg (f := fun l : Fin 3 => arms l%i)
      (show ({p,j,k} : Finset (Fin 3)) ⊆ Finset.univ from Finset.subset_univ _)
      (fun _ _ _ => Nat.zero_le _)
    have hsum : arms p%i+arms j%i+arms k%i ≤ ∑ l, arms l%i := by
      simpa [hj.symm, hk.symm, hjk, Nat.add_assoc] using hh
    simp only [reducedArm, Function.update_of_ne hj, Function.update_of_ne hk]
    omega

theorem exceptional_zero_packing_weak (arms : Fin 3 → ℕ)
    (i extra lam a b : ℕ) (hi : 0 < i) (hlam : lam ≤ 1)
    (hu : WeakResidue arms i lam)
    (hv : WeakResidue arms (i+1) lam)
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
  · exact exceptional_zero_two_positive_weak arms i extra lam a b hi hlam hu htwo htotal hbudget
  · push Not at htwo
    obtain ⟨j,k,hjk,hj,hk⟩ := htwo
    by_cases hall : ∀ t, arms t/i = arms t/(i+1)
    · exact exceptional_zero_no_positive_weak arms i extra lam a b hi hall hu htotal hbudget
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
      exact exceptional_zero_one_positive_weak arms p i extra lam a b hi hp hunique
        hu hv htest5 htotal hbudget


/-- Zero-slack exceptional partitions on the graph, with a short arm
reserved in the center, under the source-level weaker residue bounds. -/
theorem exceptional_zero_partition_weak {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hu : WeakResidue arms i lam) (hv : WeakResidue arms (i+1) lam)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (hcenter : sizes 0 = i+1) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hbudget : a+b = ∑ j, arms j/i) :
    Partitionable (Fin.cases lam arms) sizes := by
  obtain ⟨p,small,large,hs,hl,hfit⟩ := exceptional_zero_packing_weak arms i extra lam a b
    hi hlam hu hv htest5 htotal hbudget
  apply extra_partition_with_reserved_arm arms sizes i extra a b (i+1) lam p hi hextra
    (by have h := harms p; omega) hcenter hextrasize hsmall hlarge hvalues htotal
  exact ⟨small,large,hs,hl,hfit⟩

end Hornak
