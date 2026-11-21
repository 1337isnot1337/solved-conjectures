import Conjectures.HornakCarries
import Mathlib.Tactic.FinCases

/-! Selection of one or two carry arms in the rho-two endpoint. -/
namespace Hornak

theorem rho_two_selection (arms : Fin 3 → ℕ) (i extra lam a : ℕ) (p : Fin 3)
    (hi : 0 < i) (hextra : extra < i) (_hlam : lam ≤ 1)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (hrdef : i+((∑ j, arms j%(i+1))+lam-i) = (∑ j, arms j%(i+1))+lam)
    (_hrlarge : extra < (∑ j, arms j%(i+1))+lam-i)
    (hend : a+((∑ j, arms j%(i+1))+lam-i) = i+1+extra)
    (hH : a ≤ (∑ j, arms j/(i+1))+1)
    (hpv : (∑ j, arms j%(i+1))+lam-i ≤ arms p%(i+1))
    (hpw : i ≤ arms p/(i+1)+arms p%(i+1)) :
    (∃ q, q ≠ p ∧ extra ≤ arms q%(i+1)) ∨
    i+extra ≤ arms p/(i+1)+arms p%(i+1) ∨
    ∃ q, q ≠ p ∧ extra ≤ arms q/(i+1)+arms q%(i+1) ∧ arms q%(i+1) < extra ∧
      ((i+1)-arms p%(i+1))+(extra-arms q%(i+1)) ≤ a := by
  classical
  by_cases hv : ∃ q, q ≠ p ∧ extra ≤ arms q%(i+1)
  · exact Or.inl hv
  right
  by_cases hw : i+extra ≤ arms p/(i+1)+arms p%(i+1)
  · exact Or.inl hw
  right
  have hvq : ∀ q, q ≠ p → arms q%(i+1) < extra := by
    intro q hq
    by_contra h
    exact hv ⟨q,hq,by omega⟩
  have hcost (q : Fin 3) (hq : q ≠ p) :
      ((i+1)-arms p%(i+1))+(extra-arms q%(i+1)) ≤ a := by
    have hvp : arms p%(i+1) < i+1 := Nat.mod_lt _ (by omega)
    have hvq' : arms q%(i+1) < extra := hvq q hq
    have hpv' := hpv
    have h0 := hpairsv 0 1 (by decide)
    have h1 := hpairsv 0 2 (by decide)
    have h2 := hpairsv 1 2 (by decide)
    fin_cases p <;> fin_cases q <;> simp_all [Fin.sum_univ_three] <;> omega
  by_cases hother : ∃ q, q ≠ p ∧ extra ≤ arms q/(i+1)+arms q%(i+1)
  · obtain ⟨q,hq,hwq⟩ := hother
    exact ⟨q,hq,hwq,hvq q hq,hcost q hq⟩
  · exfalso
    have hlow (q : Fin 3) (hq : q ≠ p) : arms q/(i+1)+arms q%(i+1) < extra := by
      by_contra h
      exact hother ⟨q,hq,by omega⟩
    let u : Fin 3 → ℕ := fun j => arms j%i
    let w : Fin 3 → ℕ := fun j => arms j/(i+1)+arms j%(i+1)
    have hup : u p = w p-i := residue_eq_w_sub (arms p) i extra hi hextra hpw (by omega)
    have huother (j : Fin 3) (hj : j ≠ p) : u j = w j := by
      apply residue_eq_w_of_small (arms j) i hi
      have := hlow j hj
      omega
    have hall (j : Fin 3) : u j < extra := by
      by_cases hj : j=p
      · subst j
        have h := hup
        dsimp [w] at h
        omega
      · have h := huother j hj
        have h' := hlow j hj
        dsimp [w] at h
        omega
    have hsumw : (∑ j, w j) = (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1)) := by
      simp [w, Finset.sum_add_distrib]
    have hsumu : (∑ j, u j)+i = ∑ j, w j := by
      let f : Fin 3 → ℕ := Function.update w p (w p-i)
      have hfun : u = f := by
        funext j
        by_cases hj : j=p
        · subst j
          simpa [f] using hup
        · simpa [f,hj] using huother j hj
      rw [hfun]
      have h := sum_update_balance Finset.univ w p (Finset.mem_univ p) (w p-i)
      change (∑ j, f j)+w p = (∑ j, w j)+(w p-i) at h
      have hpwi : i ≤ w p := hpw
      omega
    have hp01 := hpairsu 0 1 (by decide)
    have hlt : (∑ j, u j)+lam < i+extra := by
      have hu2 := hall 2
      simp only [Fin.sum_univ_three]
      change u 0+u 1+lam < i at hp01
      omega
    have hge : i+extra ≤ (∑ j, u j)+lam := by
      rw [hsumw] at hsumu
      omega
    omega

theorem extra_rho_two_packing (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : extra < i) (hlam : lam ≤ 1)
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
        i+1 ≤ arms p/i+arms p%(i+1)) :
    ∃ q : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms q extra j := by
  have hrpos : 0 < (∑ j, arms j%(i+1))+lam-i := by omega
  have hsum : 2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam := by omega
  have hprior := prior_carry_from_test5 arms i lam hi (hpairsv 0 1 (by decide)) htest5
  obtain ⟨p,hpv,hpw⟩ := hprior hrpos hsum
  have hselect := rho_two_selection arms i extra lam a p hi hextra hlam hpairsu hpairsv
    hrdef hrlarge hend hH hpv hpw
  rcases hselect with ⟨q,hqp,hres⟩ | hself | ⟨q,hqp,hwq,hwrap,hcost⟩
  · refine ⟨q,?_⟩
    have hpq : p ≠ q := Ne.symm hqp
    apply extra_one_carry_no_loss_packing arms p q i extra a b hi hpq hres hpw
      (by omega) hbudget
  · refine ⟨p,?_⟩
    have hres : extra ≤ arms p%(i+1) := by omega
    have hmin : (i+1)-(arms p%(i+1)-extra) ≤ a := by omega
    exact extra_one_carry_same_arm_packing arms p i extra a b hi hres hself hmin hbudget
  · refine ⟨q,?_⟩
    have hpq : p ≠ q := Ne.symm hqp
    have hcap : extra ≤ arms q := by have h := harms q; omega
    exact extra_two_carry_wrap_packing arms p q i extra a b hi (by omega) hpq hcap hwrap hwq hpw hcost hbudget

theorem extra_rho_two_partition {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center : ℕ)
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
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) : Partitionable arms sizes := by
  obtain ⟨p,small,large,ha,hb,hfit⟩ := extra_rho_two_packing arms i extra lam a b hi hextra hlam
    harms hpairsu hpairsv hrdef hrlarge hend hH hbudget htest5
  have hcap : extra ≤ arms p := by have h := harms p; omega
  apply extra_partition_from_reduced_packing arms sizes i extra a b center p hi hextra0 hcap
    hcenter hextrasize hsmall hlarge hvalues htotal
  refine ⟨small,large,ha,hb,?_⟩
  intro j
  have h := hfit j
  by_cases hj : j=p
  · subst j
    simpa [reducedArm] using h
  · simpa [reducedArm,hj] using h

end Hornak
