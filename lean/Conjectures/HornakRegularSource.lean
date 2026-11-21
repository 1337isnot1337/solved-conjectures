import Conjectures.HornakWeakEndpoint

/-! The original fifth-test trigger for the regular two-size case. -/
namespace Hornak

theorem regular_case_from_conditional_test5 {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (i a b : ℕ) (hi : 0 < i)
    (hcenter : sizes 0 = i+1)
    (hsmall : Nat.card {k : Fin q // sizes k.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ = i ∨ sizes k.succ = i+1)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, arms j)
    (htest_i : (∑ j, arms j%i)/i ≤ 1)
    (htest_j : (∑ j, arms j%(i+1))/(i+1) ≤ 1)
    (htest5 : (∑ j, arms j%(i+1))/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1)) →
      ∃ p : Fin m, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    Partitionable arms sizes := by
  apply regular_case_from_tests arms sizes i a b hi hcenter hsmall hlarge hvalues htotal htest_i htest_j
  intro hgamma
  apply htest5 hgamma
  let ae := a%(i+1)
  let be := b+(a/(i+1))*i
  let H := ∑ j, arms j/(i+1)
  let V := ∑ j, arms j%(i+1)
  have ha : ae ≤ i := by
    have h := Nat.mod_lt a (by omega : 0 < i+1)
    dsimp [ae]
    omega
  have hadiv := Nat.div_add_mod a (i+1)
  have heq : a*i+b*(i+1) = ae*i+be*(i+1) := by dsimp [ae,be]; nlinarith
  have hs := arm_quotient_sum_identity arms (i+1)
  have heptotal : (i+1)+ae*i+be*(i+1) = 1+H*(i+1)+V := by
    dsimp [H,V] at *
    omega
  obtain ⟨hr,hcounts⟩ := endpoint_arithmetic i ae be H V ha heptotal
  have hdiv := Nat.div_add_mod V (i+1)
  change V/(i+1) = 1 at hgamma
  rw [hgamma] at hcounts hdiv
  change 2*i ≤ H+V
  omega

/-- When the source fifth-test arithmetic trigger holds, the required
partition with at most `i` small parts actually exists. -/
theorem fifth_test_count_trigger {m : ℕ} (arms : Fin m → ℕ) (i : ℕ)
    (hi : 0 < i)
    (hgamma : (∑ j, arms j%(i+1))/(i+1) = 1)
    (hbig : 2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))) :
    ∃ a b : ℕ, a ≤ i ∧ 1 ≤ b ∧
      a*i+b*(i+1) = 1+∑ j, arms j := by
  let H := ∑ j, arms j/(i+1)
  let V := ∑ j, arms j%(i+1)
  let r := V%(i+1)
  let a := i-r
  let b := H+2-a
  have hr : r ≤ i := by
    have h := Nat.mod_lt V (by omega : 0 < i+1)
    dsimp [r]
    omega
  have hdiv := Nat.div_add_mod V (i+1)
  change V/(i+1) = 1 at hgamma
  rw [hgamma] at hdiv
  have hav : a+r=i := by dsimp [a]; omega
  have hb : 1 ≤ b := by dsimp [b,a] at *; omega
  have hba : b+a = H+2 := by dsimp [b]; omega
  have hs := arm_quotient_sum_identity arms (i+1)
  have hv : V = i+1+r := by dsimp [r]; omega
  change H*(i+1)+V = ∑ j, arms j at hs
  refine ⟨a,b,by dsimp [a]; omega,hb,?_⟩
  nlinarith

/-- The existential trigger in source test 5 supplies the witness needed
by the regular and exceptional arithmetic constructions. -/
theorem fifth_test_witness_from_source {m : ℕ} (arms : Fin m → ℕ) (i : ℕ)
    (hi : 0 < i)
    (hsource : ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin m, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    (∑ j, arms j%(i+1))/(i+1) = 1 →
    2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1)) →
    ∃ p : Fin m, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
      i+1 ≤ arms p/i+arms p%(i+1) := by
  intro hgamma hbig
  obtain ⟨a,b,ha,hb,ht⟩ := fifth_test_count_trigger arms i hi hgamma hbig
  exact hsource a b ha hb ht hgamma

/-- In the four-arm case, source test 5 cannot choose the one-edge arm
when the small part size is at least two. -/
theorem fifth_test_regular_witness_with_leaf (arms : Fin 3 → ℕ) (i lam : ℕ)
    (hi : 2 ≤ i) (hlam : lam ≤ 1)
    (hsource : ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j →
      (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 4, (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1))%(i+1) < (Fin.cases lam arms : Fin 4 → ℕ) p%(i+1) ∧
        i+1 ≤ (Fin.cases lam arms : Fin 4 → ℕ) p/i+(Fin.cases lam arms : Fin 4 → ℕ) p%(i+1)) :
    ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
    2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
    ∃ p : Fin 3, ((∑ j, arms j%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
      i+1 ≤ arms p/i+arms p%(i+1) := by
  intro hgamma hbig
  have hli : lam/i = 0 := Nat.div_eq_of_lt (by omega)
  have hlj : lam/(i+1) = 0 := Nat.div_eq_of_lt (by omega)
  have hlr : lam%(i+1) = lam := Nat.mod_eq_of_lt (by omega)
  have hresums : (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1)) =
      lam+(∑ j, arms j%(i+1)) := by
    rw [Fin.sum_univ_succ]
    simp only [Fin.cases_zero, Fin.cases_succ, hlr]
  have hquots : (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j/(i+1)) =
      ∑ j, arms j/(i+1) := by
    rw [Fin.sum_univ_succ]
    simp only [Fin.cases_zero, Fin.cases_succ, hlj, zero_add]
  have hgam : (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1))/(i+1) = 1 := by
    rw [hresums, Nat.add_comm]
    exact hgamma
  have hsum : 2*i ≤ (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j/(i+1))+
      (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1)) := by
    rw [hquots, hresums]
    omega
  obtain ⟨p,hres,hcap⟩ := fifth_test_witness_from_source (Fin.cases lam arms : Fin 4 → ℕ) i (by omega) hsource hgam hsum
  cases p using Fin.cases with
  | zero =>
    simp only [Fin.cases_zero, hli, hlr] at hcap
    omega
  | succ p =>
    refine ⟨p,?_,?_⟩
    · rw [hresums, Nat.add_comm] at hres
      simpa only [Fin.cases_succ] using hres
    · simpa using hcap

/-- The regular two-size graph case with the literal count-based source
test-5 trigger. -/
theorem regular_partition_from_source5 {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (i a b : ℕ) (hi : 0 < i)
    (hcenter : sizes 0 = i+1)
    (hsmall : Nat.card {k : Fin q // sizes k.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ = i ∨ sizes k.succ = i+1)
    (htotal : (i+1)+a*i+b*(i+1) = 1+∑ j, arms j)
    (htest_i : (∑ j, arms j%i)/i ≤ 1)
    (htest_j : (∑ j, arms j%(i+1))/(i+1) ≤ 1)
    (hsource5 : ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin m, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    Partitionable arms sizes := by
  exact regular_case_from_conditional_test5 arms sizes i a b hi hcenter hsmall hlarge
    hvalues htotal htest_i htest_j (fifth_test_witness_from_source arms i hi hsource5)

/-- The exceptional-size graph case using tests 1, 2, and the literal
count-based trigger of source test 5, with the short arm in the center. -/
theorem exceptional_partition_from_source_tests {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b : ℕ)
    (hi : 2 ≤ i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hcarryi : ((∑ j, arms j%i)+lam)/i ≤ 1)
    (htest2i : ((∑ j, arms j%i)+lam)/i = 1 →
      (∃ p, ((∑ j, arms j%i)+lam)%i < arms p%i) ∨ ((∑ j, arms j%i)+lam)%i < lam)
    (hcarryj : ((∑ j, arms j%(i+1))+lam)/(i+1) ≤ 1)
    (htest2j : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      (∃ p, ((∑ j, arms j%(i+1))+lam)%(i+1) < arms p%(i+1)) ∨
        ((∑ j, arms j%(i+1))+lam)%(i+1) < lam)
    (hsource5 : ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j →
      (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 4, (∑ j, (Fin.cases lam arms : Fin 4 → ℕ) j%(i+1))%(i+1) < (Fin.cases lam arms : Fin 4 → ℕ) p%(i+1) ∧
        i+1 ≤ (Fin.cases lam arms : Fin 4 → ℕ) p/i+(Fin.cases lam arms : Fin 4 → ℕ) p%(i+1))
    (hcenter : sizes 0 = i+1) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    Partitionable (Fin.cases lam arms) sizes := by
  have hu := weak_residue_from_tests arms i lam hi hlam hcarryi htest2i
  have hv := weak_residue_from_tests arms (i+1) lam (by omega) hlam hcarryj htest2j
  have hw := fifth_test_regular_witness_with_leaf arms i lam hi hlam hsource5
  exact exceptional_partition_with_reserved_arm_weak arms sizes i extra lam a b (by omega)
    hextra he hlam harms hu hv hw hcenter hextrasize hsmall hlarge hvalues htotal

/-- The exceptional-size tripod partition from the literal source tests. -/
theorem exceptional_tripod_partition_from_source_tests {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b : ℕ)
    (hi : 2 ≤ i) (hextra : 0 < extra) (he : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (hcarryi : (∑ j, arms j%i)/i ≤ 1)
    (htest2i : (∑ j, arms j%i)/i = 1 →
      ∃ p, (∑ j, arms j%i)%i < arms p%i)
    (hcarryj : (∑ j, arms j%(i+1))/(i+1) ≤ 1)
    (htest2j : (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1))
    (hsource5 : ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (hcenter : sizes 0 = i+1) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+∑ j, arms j) :
    Partitionable arms sizes := by
  have hu : WeakResidue arms i 0 := weak_residue_from_tests arms i 0 hi (by omega)
    (by simpa using hcarryi) (by simpa using htest2i)
  have hv : WeakResidue arms (i+1) 0 := weak_residue_from_tests arms (i+1) 0 (by omega) (by omega)
    (by simpa using hcarryj) (by simpa using htest2j)
  have hw := fifth_test_witness_from_source arms i (by omega) hsource5
  exact exceptional_partition_weak arms sizes i extra a b (by omega) hextra he harms hu hv hw
    hcenter hextrasize hsmall hlarge hvalues htotal

end Hornak
