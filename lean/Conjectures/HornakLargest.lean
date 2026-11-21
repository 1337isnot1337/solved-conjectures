import Conjectures.HornakReservedArm
import Mathlib.Tactic.IntervalCases

/-! Deriving the largest-count exceptional endpoint from any given counts. -/
namespace Hornak

theorem exceptional_endpoint_arithmetic (i extra lam H V a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i)
    (hV : V+lam < 2*(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+H*(i+1)+V) :
    ∃ ae be rho, ae ≤ i ∧ b ≤ be ∧ rho ≤ 2 ∧
      a*i+b*(i+1) = ae*i+be*(i+1) ∧
      ae+V+lam+1 = rho*(i+1)+extra ∧
      ae+be+1 = H+rho := by
  let ae := a%(i+1)
  let be := b+(a/(i+1))*i
  let S := ae+V+lam+1
  have hj : 0 < i+1 := by omega
  have hadiv := Nat.div_add_mod a (i+1)
  have haelt : ae ≤ i := by have h := Nat.mod_lt a hj; dsimp [ae]; omega
  have heq : a*i+b*(i+1) = ae*i+be*(i+1) := by
    dsimp [ae,be]
    nlinarith
  have hbe : b ≤ be := by dsimp [be]; omega
  have htotale : (i+1)+extra+ae*i+be*(i+1) = 1+lam+H*(i+1)+V := by omega
  have hS : S+H*(i+1) = extra+(ae+be+1)*(i+1) := by dsimp [S]; nlinarith
  have hexlt : extra < i+1 := by omega
  have hmod : S%(i+1) = extra := by
    have hm := congrArg (fun n : ℕ => n%(i+1)) hS
    simpa [Nat.add_mod, Nat.mul_mod, Nat.mod_eq_of_lt hexlt] using hm
  have hSge : extra ≤ S := by
    by_contra hn
    have hSlt : S < i+1 := by omega
    rw [Nat.mod_eq_of_lt hSlt] at hmod
    omega
  have hmodeq : Nat.ModEq (i+1) S extra := by
    change S%(i+1) = extra%(i+1)
    simpa [Nat.mod_eq_of_lt hexlt] using hmod
  have hdiff := Nat.ModEq.sub hSge (le_refl extra) hmodeq (Nat.ModEq.refl extra)
  have hdiv : (i+1) ∣ S-extra := by
    apply Nat.dvd_of_mod_eq_zero
    simpa [Nat.ModEq] using hdiff
  obtain ⟨rho,hrho⟩ := hdiv
  have hSsub := Nat.sub_add_cancel hSge
  have hSform : S = rho*(i+1)+extra := by nlinarith
  have hbound : rho ≤ 2 := by
    by_contra hn
    have h3 : 3 ≤ rho := by omega
    dsimp [S] at hSform
    nlinarith only [haelt, hV, hextra, he, h3, hSform]
  refine ⟨ae,be,rho,haelt,hbe,hbound,heq,?_,?_⟩
  · exact hSform
  · have hprod : (H+rho)*(i+1) = (ae+be+1)*(i+1) := by nlinarith only [hS,hSform]
    exact (Nat.eq_of_mul_eq_mul_right hj hprod).symm

/-- Every input count pair has a feasible largest-larger-piece endpoint,
under the stated three-arm residue and fifth-test hypotheses. -/
theorem exceptional_largest_packing (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    ∃ ae be, ae ≤ i ∧ b ≤ be ∧ a*i+b*(i+1) = ae*i+be*(i+1) ∧
      ∃ p : Fin 3, ∃ small large : Fin 3 → ℕ,
        (∑ j, small j) = ae ∧ (∑ j, large j) = be ∧
        ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  let H := ∑ j, arms j/(i+1)
  let V := ∑ j, arms j%(i+1)
  have hV : V+lam < 2*(i+1) := by
    have hp := hpairsv 0 1 (by decide)
    have hv := Nat.mod_lt (arms 2) (by omega : 0 < i+1)
    dsimp [V]
    rw [Fin.sum_univ_three]
    omega
  have hsum := arm_quotient_sum_identity arms (i+1)
  have htotal' : (i+1)+extra+a*i+b*(i+1) = 1+lam+H*(i+1)+V := by
    dsimp [H,V]
    omega
  obtain ⟨ae,be,rho,hae,hbe,hrho,heq,hendpoint,hcounts⟩ :=
    exceptional_endpoint_arithmetic i extra lam H V a b hi hextra he hV htotal'
  refine ⟨ae,be,hae,hbe,heq,?_⟩
  interval_cases rho
  · let p : Fin 3 := 0
    have hcap : extra ≤ arms p := by have h := harms p; omega
    refine ⟨p,?_⟩
    apply extra_baseline_packing arms p i extra ae be hi (by omega) hcap
    dsimp [H] at hcounts
    omega
  · have hend : ae+(∑ p, arms p%(i+1))+lam = i+extra := by dsimp [V] at hendpoint; omega
    have hbudget : ae+be ≤ ∑ p, arms p/(i+1) := by dsimp [H] at hcounts; omega
    exact extra_rho_one_packing arms i extra lam ae be hi he harms hpairsu
      (hpairsv 0 1 (by decide)) hend hbudget htest5
  · have hrdef : i+((∑ j, arms j%(i+1))+lam-i) = (∑ j, arms j%(i+1))+lam := by
      dsimp [V] at hendpoint
      omega
    have hrlarge : extra < (∑ j, arms j%(i+1))+lam-i := by
      dsimp [V] at hendpoint
      omega
    have hend : ae+((∑ j, arms j%(i+1))+lam-i) = i+1+extra := by
      dsimp [V] at hendpoint
      omega
    have hH : ae ≤ (∑ j, arms j/(i+1))+1 := by dsimp [H] at hcounts; omega
    have hbudget : ae+be ≤ (∑ j, arms j/(i+1))+1 := by dsimp [H] at hcounts; omega
    exact extra_rho_two_packing arms i extra lam ae be hi he hlam harms hpairsu hpairsv
      hrdef hrlarge hend hH hbudget htest5

theorem quotient_loses_at_most_one (x d extra : ℕ) (hd : 0 < d)
    (he : extra ≤ d) (hcap : extra ≤ x) : x/d ≤ (x-extra)/d+1 := by
  have hfloor := Nat.div_mul_le_self x d
  have hsub := Nat.sub_add_cancel hcap
  by_cases hz : x/d = 0
  · simp [hz]
  · have hp : 0 < x/d := Nat.pos_of_ne_zero hz
    have hq : x/d-1+1=x/d := by omega
    have hbound : (x/d-1)*d ≤ x-extra := by nlinarith
    have hh := (Nat.le_div_iff_mul_le hd).2 hbound
    omega

theorem reduced_small_sum_lower {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (he : extra ≤ i) (hcap : extra ≤ arms p) :
    (∑ j, arms j/i) ≤ (∑ j, reducedArm arms p extra j/i)+1 := by
  classical
  let f : Fin m → ℕ := fun j => arms j/i
  let z := (arms p-extra)/i
  have hz : arms p/i ≤ z+1 := quotient_loses_at_most_one (arms p) i extra hi he hcap
  have hfun : (fun j => reducedArm arms p extra j/i) = Function.update f p z := by
    funext j
    by_cases h : j=p
    · subst j
      simp [reducedArm, f, z]
    · simp [reducedArm, f, z, h]
  rw [hfun]
  change (∑ j, arms j/i) ≤ (∑ j, Function.update f p z j)+1
  have hsum := sum_update_balance Finset.univ f p (Finset.mem_univ p) z
  change (∑ j, Function.update f p z j)+arms p/i = (∑ j, arms j/i)+z at hsum
  omega

/-- All count pairs with one unit of small-quotient slack transfer from the
largest endpoint, regardless of which arm that endpoint selects. -/
theorem exceptional_positive_budget_packing (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (hpairsu : ∀ j k : Fin 3, j ≠ k → arms j%i+arms k%i+lam < i)
    (hpairsv : ∀ j k : Fin 3, j ≠ k → arms j%(i+1)+arms k%(i+1)+lam < i+1)
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j)
    (hslack : a+b+1 ≤ ∑ j, arms j/i) :
    ∃ p : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  obtain ⟨ae,be,hae,hbe,heq,p,small,large,hs,hl,hfit⟩ :=
    exceptional_largest_packing arms i extra lam a b hi hextra he hlam harms hpairsu hpairsv htest5 htotal
  have hcap : extra ≤ arms p := by have h := harms p; omega
  have hq := reduced_small_sum_lower arms p i extra hi (by omega) hcap
  have hb : a+b ≤ ∑ j, reducedArm arms p extra j/i := by omega
  have hbudget : a+b+((∑ j, reducedArm arms p extra j/i)-(a+b)) =
      ∑ j, reducedArm arms p extra j/i := by omega
  refine ⟨p,?_⟩
  exact transfer_equal_total (reducedArm arms p extra) i a b ae be _ hi hbe heq hbudget
    ⟨small,large,hs,hl,hfit⟩

end Hornak
