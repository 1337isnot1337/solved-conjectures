import Conjectures.HornakWrap

/-! Finite residue inequalities for selecting an exceptional-piece arm. -/
namespace Hornak

/-- The fallback in the wrapped `rho = 1` case, isolated as an exact
three-arm arithmetic lemma. -/
theorem choose_wrapped_arm_fallback
    (i extra lam r H u0 u1 u2 v0 v1 v2 w0 w1 w2 : ℕ)
    (hextra : extra < i) (_hr : 0 < r)
    (hrdef : i+r = v0+v1+v2+lam)
    (hsmall : H+v0+v1+v2+lam < 2*i)
    (hsize : i+extra ≤ H+v0+v1+v2+lam)
    (hsum : w0+w1+w2 = H+v0+v1+v2)
    (hv0 : v0 < extra) (hv1 : v1 < extra) (_hv2 : v2 < extra)
    (hw0 : v0 ≤ w0 ∧ w0 ≤ H+v0) (hw1 : v1 ≤ w1 ∧ w1 ≤ H+v1)
    (hw2 : v2 ≤ w2 ∧ w2 ≤ H+v2)
    (hu0 : w0 < i → u0 = w0) (hu1 : w1 < i → u1 = w1) (hu2 : w2 < i → u2 = w2)
    (h01 : u0+u1+lam < i) (h02 : u0+u2+lam < i) (h12 : u1+u2+lam < i) :
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
  omega

/-- If the residue excess is nonpositive, some arm still has enough
quotient-plus-residue to receive the exceptional piece. -/
theorem choose_wrapped_arm_nonpositive
    (i extra lam H u0 u1 u2 v0 v1 v2 w0 w1 w2 : ℕ)
    (hextra : extra < i)
    (hsize : i+extra ≤ H+v0+v1+v2+lam)
    (hsum : w0+w1+w2 = H+v0+v1+v2)
    (hu0 : w0 < i → u0 = w0) (hu1 : w1 < i → u1 = w1) (hu2 : w2 < i → u2 = w2)
    (h01 : u0+u1+lam < i) (_h02 : u0+u2+lam < i) (_h12 : u1+u2+lam < i) :
    extra ≤ w0 ∨ extra ≤ w1 ∨ extra ≤ w2 := by
  by_contra hn
  push Not at hn
  have h0 := hu0 (by omega)
  have h1 := hu1 (by omega)
  have h2 := hu2 (by omega)
  omega

theorem residue_eq_w_of_small (x i : ℕ) (hi : 0 < i)
    (hw : x/(i+1)+x%(i+1) < i) :
    x%i = x/(i+1)+x%(i+1) := by
  have h := (residue_decomposition x i hi).1
  conv_lhs => rw [h]
  rw [Nat.mul_add_mod, Nat.mod_eq_of_lt hw]

/-- The chosen-arm existence step for the `rho = 1` wrapped case. The
prior-carry input is exactly the exceptional test used in the large-sum
branch of the written proof. -/
theorem choose_wrapped_arm (arms : Fin 3 → ℕ) (i extra lam a : ℕ)
    (hi : 0 < i) (hextra : extra < i)
    (hv : ∀ p, arms p%(i+1) < extra)
    (hpairs : ∀ p q : Fin 3, p ≠ q → arms p%i+arms q%i+lam < i)
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
  have hpair01 : u 0+u 1+lam < i := hpairs 0 1 (by decide)
  have hpair02 : u 0+u 2+lam < i := hpairs 0 2 (by decide)
  have hpair12 : u 1+u 2+lam < i := hpairs 1 2 (by decide)
  have hsize : i+extra ≤ H+V+lam := by dsimp [H,V,h,v] at *; omega
  by_cases hnonpos : V+lam ≤ i
  · have hc := choose_wrapped_arm_nonpositive i extra lam H
      (u 0) (u 1) (u 2) (v 0) (v 1) (v 2) (w 0) (w 1) (w 2)
      hextra (by omega) hsum (hu 0) (hu 1) (hu 2) hpair01 hpair02 hpair12
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
      have hc := choose_wrapped_arm_fallback i extra lam (V+lam-i) H
        (u 0) (u 1) (u 2) (v 0) (v 1) (v 2) (w 0) (w 1) (w 2)
        hextra hrpos hrdef (by omega) (by omega) hsum (hv 0) (hv 1) (hv 2)
        (hw 0) (hw 1) (hw 2) (hu 0) (hu 1) (hu 2) hpair01 hpair02 hpair12
      rcases hc with hc | hc | hc
      · refine ⟨0,hc.2,?_⟩; dsimp [V,v] at *; omega
      · refine ⟨1,hc.2,?_⟩; dsimp [V,v] at *; omega
      · refine ⟨2,hc.2,?_⟩; dsimp [V,v] at *; omega

/-- The wrapped `rho = 1` endpoint, with the arm-selection proof discharged. -/
theorem extra_rho_one_wrapped_partition {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center : ℕ)
    (hi : 0 < i) (hextra0 : 0 < extra) (hextra : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (hv : ∀ p, arms p%(i+1) < extra)
    (hpairs : ∀ p q : Fin 3, p ≠ q → arms p%i+arms q%i+lam < i)
    (hend : a+(∑ p, arms p%(i+1))+lam = i+extra)
    (hbudget : a+b ≤ ∑ p, arms p/(i+1))
    (hprior : 0 < (∑ p, arms p%(i+1))+lam-i →
      2*i ≤ (∑ p, arms p/(i+1))+(∑ p, arms p%(i+1))+lam →
      ∃ p, (∑ p, arms p%(i+1))+lam-i ≤ arms p%(i+1) ∧
        i ≤ arms p/(i+1)+arms p%(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) :
    Partitionable arms sizes := by
  have hH : a ≤ ∑ p, arms p/(i+1) := by omega
  obtain ⟨p,hw,hmin⟩ := choose_wrapped_arm arms i extra lam a hi hextra hv hpairs hend hH hprior
  have hcap : extra ≤ arms p := by have := harms p; omega
  exact extra_wrapped_partition arms sizes i extra a b center p hi hextra0 (by omega) hcap
    (hv p) hw hmin hbudget hcenter hextrasize hsmall hlarge hvalues htotal

/-- The paper's fifth-test witness supplies the prior-carry condition used
in the large-sum branch of the wrapped endpoint. -/
theorem prior_carry_from_test5 (arms : Fin 3 → ℕ) (i lam : ℕ) (hi : 0 < i)
    (hpair : arms 0%(i+1)+arms 1%(i+1)+lam < i+1)
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
  have hv : arms 2%(i+1) < i+1 := Nat.mod_lt _ hj
  have hbound : T < 2*(i+1) := by dsimp [T]; rw [Fin.sum_univ_three]; omega
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

theorem extra_rho_one_wrapped_from_test5 {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center : ℕ)
    (hi : 0 < i) (hextra0 : 0 < extra) (hextra : extra < i)
    (harms : ∀ p, i+2 ≤ arms p)
    (hv : ∀ p, arms p%(i+1) < extra)
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
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) : Partitionable arms sizes := by
  apply extra_rho_one_wrapped_partition arms sizes i extra lam a b center hi hextra0 hextra
    harms hv hpairs hend hbudget (prior_carry_from_test5 arms i lam hi hpairj htest5)
    hcenter hextrasize hsmall hlarge hvalues htotal

theorem extra_rho_one_from_test5 {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra lam a b center : ℕ)
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
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) : Partitionable arms sizes := by
  by_cases h : ∃ p : Fin 3, extra ≤ arms p%(i+1)
  · obtain ⟨p,hres⟩ := h
    exact extra_no_loss_partition arms sizes i extra a b center p hi hextra0 hres
      hcenter hextrasize hsmall hlarge hvalues htotal hbudget
  · have hv : ∀ p : Fin 3, arms p%(i+1) < extra := by
      intro p
      by_contra hn
      exact h ⟨p,by omega⟩
    exact extra_rho_one_wrapped_from_test5 arms sizes i extra lam a b center hi hextra0 hextra
      harms hv hpairs hpairj hend hbudget htest5 hcenter hextrasize hsmall hlarge hvalues htotal

end Hornak
