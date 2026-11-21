import Conjectures.HornakWeak

namespace Hornak

theorem choose_wrapped_arm_fallback_weak
    (i extra lam r H u0 u1 u2 v0 v1 v2 w0 w1 w2 : ℕ)
    (hextra : extra < i) (_hr : 0 < r)
    (hrdef : i+r = v0+v1+v2+lam)
    (hsmall : H+v0+v1+v2+lam < 2*i)
    (hsize : i+extra ≤ H+v0+v1+v2+lam)
    (hsum : w0+w1+w2 = H+v0+v1+v2)
    (_hv0 : v0 < extra) (_hv1 : v1 < extra) (_hv2 : v2 < extra)
    (hw0 : v0 ≤ w0 ∧ w0 ≤ H+v0) (hw1 : v1 ≤ w1 ∧ w1 ≤ H+v1)
    (hw2 : v2 ≤ w2 ∧ w2 ≤ H+v2)
    (hu0 : w0 < i → u0 = w0) (hu1 : w1 < i → u1 = w1) (hu2 : w2 < i → u2 = w2)
    (hpair : u0+u1+lam < i ∨ u0+u2+lam < i ∨ u1+u2+lam < i) :
    (r ≤ v0 ∧ extra ≤ w0) ∨ (r ≤ v1 ∧ extra ≤ w1) ∨ (r ≤ v2 ∧ extra ≤ w2) := by
  by_contra hn
  push Not at hn
  have hw0i : w0 < i := by
    by_cases hv : r ≤ v0
    · have := hn.1 hv
      omega
    · omega
  have hw1i : w1 < i := by
    by_cases hv : r ≤ v1
    · have := hn.2.1 hv
      omega
    · omega
  have hw2i : w2 < i := by
    by_cases hv : r ≤ v2
    · have := hn.2.2 hv
      omega
    · omega
  have h0 := hu0 hw0i
  have h1 := hu1 hw1i
  have h2 := hu2 hw2i
  rcases hpair with hpair | hpair | hpair <;> omega

/-- If the residue excess is nonpositive, some arm still has enough
quotient-plus-residue to receive the exceptional piece. -/
theorem choose_wrapped_arm_nonpositive_weak
    (i extra lam H u0 u1 u2 v0 v1 v2 w0 w1 w2 : ℕ)
    (hextra : extra < i)
    (hsize : i+extra ≤ H+v0+v1+v2+lam)
    (hsum : w0+w1+w2 = H+v0+v1+v2)
    (hu0 : w0 < i → u0 = w0) (hu1 : w1 < i → u1 = w1) (hu2 : w2 < i → u2 = w2)
    (hpair : u0+u1+lam < i ∨ u0+u2+lam < i ∨ u1+u2+lam < i) :
    extra ≤ w0 ∨ extra ≤ w1 ∨ extra ≤ w2 := by
  by_contra hn
  push Not at hn
  have h0 := hu0 (by omega)
  have h1 := hu1 (by omega)
  have h2 := hu2 (by omega)
  rcases hpair with hpair | hpair | hpair <;> omega


theorem weak_residue_pair_disjunction (arms : Fin 3 → ℕ) (i lam : ℕ)
    (hweak : WeakResidue arms i lam) :
    arms 0%i+arms 1%i+lam < i ∨ arms 0%i+arms 2%i+lam < i ∨
      arms 1%i+arms 2%i+lam < i := by
  obtain ⟨p,hp⟩ := hweak
  simp only [Fin.sum_univ_three] at hp
  fin_cases p
  · right; right
    change arms 0%i+arms 1%i+arms 2%i+lam < i+arms 0%i at hp
    omega
  · right; left
    change arms 0%i+arms 1%i+arms 2%i+lam < i+arms 1%i at hp
    omega
  · left
    change arms 0%i+arms 1%i+arms 2%i+lam < i+arms 2%i at hp
    omega

theorem choose_wrapped_arm_weak (arms : Fin 3 → ℕ) (i extra lam a : ℕ)
    (hi : 0 < i) (hextra : extra < i)
    (hv : ∀ p, arms p%(i+1) < extra)
    (hweak : WeakResidue arms i lam)
    (hend : a+(∑ p, arms p%(i+1))+lam = i+extra)
    (hH : a ≤ ∑ p, arms p/(i+1))
    (hprior : 0 < (∑ p, arms p%(i+1))+lam-i →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, (∑ p, arms p%(i+1))+lam-i ≤ arms p%(i+1) ∧
        i ≤ arms p/(i+1)+arms p%(i+1)) :
    ∃ p, extra ≤ arms p/(i+1)+arms p%(i+1) ∧ extra-arms p%(i+1) ≤ a := by
  let u : Fin 3 → ℕ := fun p => arms p%i
  let v : Fin 3 → ℕ := fun p => arms p%(i+1)
  let h : Fin 3 → ℕ := fun p => arms p/(i+1)
  let w : Fin 3 → ℕ := fun p => h p+v p
  let H := ∑ p, h p
  let V := ∑ p, v p
  have hsum : w 0+w 1+w 2 = H+v 0+v 1+v 2 := by simp [H,w,Fin.sum_univ_three]; omega
  have hV : V = v 0+v 1+v 2 := by simp [V,Fin.sum_univ_three]
  have hHbounds (p : Fin 3) : h p ≤ H := by
    exact Finset.single_le_sum (f := h) (fun _ _ => Nat.zero_le _) (Finset.mem_univ p)
  have hw (p : Fin 3) : v p ≤ w p ∧ w p ≤ H+v p := by dsimp [w]; have := hHbounds p; omega
  have hu (p : Fin 3) : w p < i → u p = w p := by
    intro hw'
    exact residue_eq_w_of_small (arms p) i hi hw'
  have hpair : u 0+u 1+lam < i ∨ u 0+u 2+lam < i ∨ u 1+u 2+lam < i := by
    exact weak_residue_pair_disjunction arms i lam hweak
  have hsize : i+extra ≤ H+V+lam := by dsimp [H,V,h,v] at *; omega
  by_cases hnonpos : V+lam ≤ i
  · have hc := choose_wrapped_arm_nonpositive_weak i extra lam H
      (u 0) (u 1) (u 2) (v 0) (v 1) (v 2) (w 0) (w 1) (w 2)
      hextra (by omega) hsum (hu 0) (hu 1) (hu 2) hpair
    rcases hc with hc | hc | hc
    · refine ⟨0,hc,?_⟩; dsimp [V,v] at *; omega
    · refine ⟨1,hc,?_⟩; dsimp [V,v] at *; omega
    · refine ⟨2,hc,?_⟩; dsimp [V,v] at *; omega
  · have hrpos : 0 < V+lam-i := by omega
    by_cases hbig : 2*i ≤ H+V+lam
    · obtain ⟨p,hv',hw'⟩ := hprior hrpos hbig
      refine ⟨p,by omega,?_⟩
      dsimp [V,v] at *
      omega
    · have hrdef : i+(V+lam-i) = v 0+v 1+v 2+lam := by omega
      have hc := choose_wrapped_arm_fallback_weak i extra lam (V+lam-i) H
        (u 0) (u 1) (u 2) (v 0) (v 1) (v 2) (w 0) (w 1) (w 2)
        hextra hrpos hrdef (by omega) (by omega) hsum (hv 0) (hv 1) (hv 2)
        (hw 0) (hw 1) (hw 2) (hu 0) (hu 1) (hu 2) hpair
      rcases hc with hc | hc | hc
      · refine ⟨0,hc.2,?_⟩; dsimp [V,v] at *; omega
      · refine ⟨1,hc.2,?_⟩; dsimp [V,v] at *; omega
      · refine ⟨2,hc.2,?_⟩; dsimp [V,v] at *; omega


theorem prior_carry_from_test5_weak (arms : Fin 3 → ℕ) (i lam : ℕ) (hi : 0 < i)
    (hweak : WeakResidue arms (i+1) lam)
    (htest5 : ((∑ p, arms p%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, ((∑ p, arms p%(i+1))+lam)%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    0 < (∑ p, arms p%(i+1))+lam-i →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, (∑ p, arms p%(i+1))+lam-i ≤ arms p%(i+1) ∧
        i ≤ arms p/(i+1)+arms p%(i+1) := by
  intro hr hsum
  let T := (∑ p, arms p%(i+1))+lam
  have hj : 0 < i+1 := by omega
  have hbound : T < 2*(i+1) := by
    exact weak_residue_total_lt arms (i+1) lam hj hweak
  have hlow : i+1 ≤ T := by omega
  have hdivlo : 1 ≤ T/(i+1) := by
    apply (Nat.le_div_iff_mul_le hj).2
    omega
  have hdivhi : T/(i+1) < 2 := (Nat.div_lt_iff_lt_mul hj).2 hbound
  have hdiv : T/(i+1) = 1 := by omega
  have hrem := Nat.div_add_mod T (i+1)
  have hgamma := hdiv
  dsimp [T] at hgamma
  obtain ⟨p,hv',hqv⟩ := htest5 hgamma hsum
  have hq : (i+1)-arms p%(i+1) ≤ arms p/i := Nat.sub_le_of_le_add hqv
  have hw := (can_create_carry_iff (arms p) i hi).1 hq
  refine ⟨p,?_,hw⟩
  change T%(i+1) < arms p%(i+1) at hv'
  rw [hdiv] at hrem
  omega

theorem extra_rho_one_packing_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : extra < i) (harms : ∀ p, i+2 ≤ arms p)
    (hu : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
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
    have hprior := prior_carry_from_test5_weak arms i lam hi hvweak htest5
    obtain ⟨p,hw,hmin⟩ := choose_wrapped_arm_weak arms i extra lam a hi hextra hv hu hend hH hprior
    have hcap : extra ≤ arms p := by have h := harms p; omega
    exact ⟨p,extra_wrapped_packing arms p i extra a b hi (by omega) hcap (hv p) hw hmin hbudget⟩


theorem rho_two_selection_weak (arms : Fin 3 → ℕ) (i extra lam a : ℕ) (p : Fin 3)
    (hi : 0 < i) (hextra : extra < i) (_hlam : lam ≤ 1)
    (huweak : WeakResidue arms i lam)
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
    have hv0 := hvq 0
    have hv1 := hvq 1
    have hv2 := hvq 2
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
    have hlt : (∑ j, u j)+lam < i+extra := by
      obtain ⟨j,hj⟩ := huweak
      have h := hall j
      change (∑ j, u j)+lam < i+u j at hj
      omega
    have hge : i+extra ≤ (∑ j, u j)+lam := by
      rw [hsumw] at hsumu
      omega
    omega


theorem extra_rho_two_packing_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
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
  have hprior := prior_carry_from_test5_weak arms i lam hi hvweak htest5
  obtain ⟨p,hpv,hpw⟩ := hprior hrpos hsum
  have hselect := rho_two_selection_weak arms i extra lam a p hi hextra hlam huweak
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


theorem exceptional_largest_packing_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
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
    exact weak_residue_total_lt arms (i+1) lam (by omega) hvweak
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
    exact extra_rho_one_packing_weak arms i extra lam ae be hi he harms huweak hvweak hend hbudget htest5
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
    exact extra_rho_two_packing_weak arms i extra lam ae be hi he hlam harms huweak hvweak
      hrdef hrlarge hend hH hbudget htest5


theorem exceptional_positive_budget_packing_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
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
    exceptional_largest_packing_weak arms i extra lam a b hi hextra he hlam harms huweak hvweak htest5 htotal
  have hcap : extra ≤ arms p := by have h := harms p; omega
  have hq := reduced_small_sum_lower arms p i extra hi (by omega) hcap
  have hb : a+b ≤ ∑ j, reducedArm arms p extra j/i := by omega
  have hbudget : a+b+((∑ j, reducedArm arms p extra j/i)-(a+b)) =
      ∑ j, reducedArm arms p extra j/i := by omega
  refine ⟨p,?_⟩
  exact transfer_equal_total (reducedArm arms p extra) i a b ae be _ hi hbe heq hbudget
    ⟨small,large,hs,hl,hfit⟩


theorem exceptional_budget_nonnegative_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i)
    (huweak : WeakResidue arms i lam)
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    a+b ≤ ∑ j, arms j/i := by
  have hU := weak_residue_total_lt arms i lam hi huweak
  have hsum := arm_quotient_sum_identity arms i
  by_contra hn
  have hq : (∑ j, arms j/i)+1 ≤ a+b := by omega
  nlinarith


theorem exceptional_packing_weak (arms : Fin 3 → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
    (htest5 : ((∑ j, arms j%(i+1))+lam)/(i+1) = 1 →
      2*i ≤ (∑ j, arms j/(i+1))+(∑ j, arms j%(i+1))+lam →
      ∃ j, ((∑ k, arms k%(i+1))+lam)%(i+1) < arms j%(i+1) ∧
        i+1 ≤ arms j/i+arms j%(i+1))
    (htotal : (i+1)+extra+a*i+b*(i+1) = 1+lam+∑ j, arms j) :
    ∃ selected : Fin 3, ∃ small large : Fin 3 → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms selected extra j := by
  have hb := exceptional_budget_nonnegative_weak arms i extra lam a b hi huweak htotal
  by_cases hz : a+b = ∑ j, arms j/i
  · exact exceptional_zero_packing_weak arms i extra lam a b hi hlam huweak hvweak htest5 htotal hz
  · exact exceptional_positive_budget_packing_weak arms i extra lam a b hi hextra he hlam harms
      huweak hvweak htest5 htotal (by omega)


theorem exceptional_partition_with_reserved_arm_weak {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i) (hlam : lam ≤ 1)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i lam)
    (hvweak : WeakResidue arms (i+1) lam)
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
  obtain ⟨p,small,large,hs,hl,hfit⟩ := exceptional_packing_weak arms i extra lam a b
    hi hextra he hlam harms huweak hvweak htest5 htotal
  apply extra_partition_with_reserved_arm arms sizes i extra a b (i+1) lam p hi hextra
    (by have h := harms p; omega) hcenter hextrasize hsmall hlarge hvalues htotal
  exact ⟨small,large,hs,hl,hfit⟩


theorem exceptional_partition_weak {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b : ℕ)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (huweak : WeakResidue arms i 0)
    (hvweak : WeakResidue arms (i+1) 0)
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
  obtain ⟨p,small,large,hs,hl,hfit⟩ := exceptional_packing_weak arms i extra 0 a b
    hi hextra he (by omega) harms huweak hvweak
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
