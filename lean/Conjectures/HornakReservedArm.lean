import Conjectures.HornakRhoTwo

/-! Reserve one entire arm for the central connected piece. -/
namespace Hornak

theorem extra_partition_with_reserved_arm {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center leaf : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (hcap : extra ≤ arms p)
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+leaf+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j) :
    Partitionable (Fin.cases leaf arms) sizes := by
  classical
  let allArms : Fin (m+1) → ℕ := Fin.cases leaf arms
  change Partitionable allArms sizes
  have hp : extra ≤ allArms p.succ := by simpa [allArms] using hcap
  have ht : center+extra+a*i+b*(i+1) = 1+∑ j, allArms j := by
    simpa [allArms, Fin.sum_univ_succ, Nat.add_assoc] using htotal
  apply extra_partition_from_reduced_packing allArms sizes i extra a b center p.succ
    hi hextra hp hcenter hextrasize hsmall hlarge hvalues ht
  obtain ⟨small,large,ha,hb,hfit⟩ := hfeasible
  refine ⟨Fin.cases 0 small,Fin.cases 0 large,?_,?_,?_⟩
  · simpa [Fin.sum_univ_succ] using ha
  · simpa [Fin.sum_univ_succ] using hb
  · intro j
    cases j using Fin.cases with
    | zero => simp
    | succ j =>
      change small j*i+large j*(i+1) ≤ arms j-(if j.succ=p.succ then extra else 0)
      have h := hfit j
      by_cases hj : j=p
      · subst j
        simpa [reducedArm] using h
      · simpa [reducedArm,hj] using h

theorem extra_rho_one_packing (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : extra < i) (harms : ∀ p, i+2 ≤ arms p)
    (hpairs : ∀ p q : Fin 3, p ≠ q → arms p%i+arms q%i+lam < i)
    (hpairj : arms 0%(i+1)+arms 1%(i+1)+lam < i+1)
    (hend : a+(∑ p, arms p%(i+1))+lam = i+extra)
    (hbudget : a+b ≤ ∑ p, arms p/(i+1))
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    ∃ p : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  by_cases h : ∃ p : Fin 3, extra ≤ arms p%(i+1)
  · obtain ⟨p,hres⟩ := h
    exact ⟨p,extra_no_loss_packing arms p i extra a b hi hres hbudget⟩
  · have hv : ∀ p : Fin 3, arms p%(i+1) < extra := by
      intro p
      by_contra hn
      exact h ⟨p,by omega⟩
    have hH : a ≤ ∑ p, arms p/(i+1) := by omega
    have hprior := prior_carry_from_test5 arms i lam hi hpairj htest5
    obtain ⟨p,hw,hmin⟩ := choose_wrapped_arm arms i extra lam a hi hextra hv hpairs hend hH hprior
    have hcap : extra ≤ arms p := by have h := harms p; omega
    exact ⟨p,extra_wrapped_packing arms p i extra a b hi (by omega) hcap (hv p) hw hmin hbudget⟩

theorem rho_one_reserved_partition {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center leaf : ℕ)
    (hi : 0 < i) (hextra0 : 0 < extra) (hextra : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairs : ∀ p q : Fin 3, p ≠ q → arms p%i+arms q%i+lam < i)
    (hpairj : arms 0%(i+1)+arms 1%(i+1)+lam < i+1)
    (hend : a+(∑ p, arms p%(i+1))+lam = i+extra)
    (hbudget : a+b ≤ ∑ p, arms p/(i+1))
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+leaf+∑ j, arms j) :
    Partitionable (Fin.cases leaf arms) sizes := by
  obtain ⟨p,hpack⟩ := extra_rho_one_packing arms i extra lam a b hi hextra harms hpairs
    hpairj hend hbudget htest5
  have hcap : extra ≤ arms p := by have h := harms p; omega
  exact extra_partition_with_reserved_arm arms sizes i extra a b center leaf p hi hextra0 hcap
    hcenter hextrasize hsmall hlarge hvalues htotal hpack

theorem rho_two_reserved_partition {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center leaf : ℕ)
    (hi : 0 < i) (hextra0 : 0 < extra) (hextra : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (hrdef : i+((∑ j, arms j%(i+1))+lam-i) = (∑ j, arms j%(i+1))+lam)
    (hrlarge : extra < (∑ j, arms j%(i+1))+lam-i)
    (hend : a+((∑ j, arms j%(i+1))+lam-i) = i+1+extra)
    (hH : a ≤ (∑ j, arms j/(i+1))+1)
    (hbudget : a+b ≤ (∑ j, arms j/(i+1))+1)
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+leaf+∑ j, arms j) :
    Partitionable (Fin.cases leaf arms) sizes := by
  obtain ⟨p,hpack⟩ := extra_rho_two_packing arms i extra lam a b hi hextra hlam harms hpairsu hpairsv
    hrdef hrlarge hend hH hbudget htest5
  have hcap : extra ≤ arms p := by have h := harms p; omega
  exact extra_partition_with_reserved_arm arms sizes i extra a b center leaf p hi hextra0 hcap
    hcenter hextrasize hsmall hlarge hvalues htotal hpack

theorem rho_zero_reserved_partition {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center leaf : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hbudget : a+b+1 ≤ ∑ j, arms j/(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+leaf+∑ j, arms j) :
    Partitionable (Fin.cases leaf arms) sizes := by
  exact extra_partition_with_reserved_arm arms sizes i extra a b center leaf p hi hextra hcap
    hcenter hextrasize hsmall hlarge hvalues htotal
    (extra_baseline_packing arms p i extra a b hi he hcap hbudget)

end Hornak
