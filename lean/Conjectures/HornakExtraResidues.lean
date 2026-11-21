import Conjectures.HornakExtraTiling

/-! Quotient and carry identities for the exceptional-piece argument. -/
namespace Hornak

theorem consecutive_quotient_order (x i : ℕ) (hi : 0 < i) : x/(i+1) ≤ x/i := by
  apply (Nat.le_div_iff_mul_le hi).2
  have h := Nat.div_mul_le_self x (i+1)
  nlinarith

theorem residue_decomposition (x i : ℕ) (hi : 0 < i) :
    let q := x/i
    let h := x/(i+1)
    let u := x%i
    let v := x%(i+1)
    let w := h+v
    x = i*h+w ∧ w = i*(q-h)+u := by
  dsimp only
  have hiq := Nat.div_add_mod x i
  have hjq := Nat.div_add_mod x (i+1)
  have hqh := consecutive_quotient_order x i hi
  have hsub := Nat.sub_add_cancel hqh
  constructor <;> nlinarith

theorem can_create_carry_iff (x i : ℕ) (hi : 0 < i) :
    (i+1)-x%(i+1) ≤ x/i ↔ i ≤ x/(i+1)+x%(i+1) := by
  have hv : x%(i+1) < i+1 := Nat.mod_lt _ (by omega)
  have hdiv := Nat.div_add_mod x (i+1)
  have h := consecutive_quotient_threshold (i+1) (x/(i+1)) (x%(i+1)) (by omega)
  have he : (x/(i+1))*(i+1)+x%(i+1) = x := by nlinarith
  rw [he] at h
  simp only [Nat.add_sub_cancel] at h
  omega

theorem carry_arm_remainder (x i : ℕ) (hi : 0 < i)
    (hw : i ≤ x/(i+1)+x%(i+1)) :
    x-((i+1)-x%(i+1))*i =
      (x/(i+1)+x%(i+1)-i)*(i+1) := by
  have hv : x%(i+1) < i+1 := Nat.mod_lt _ (by omega)
  have hdiv := Nat.div_add_mod x (i+1)
  have hsub := Nat.sub_add_cancel hw
  have hvsub : (i+1)-x%(i+1)+x%(i+1) = i+1 := by omega
  have hnonneg : ((i+1)-x%(i+1))*i ≤ x := by
    have h := (can_create_carry_iff x i hi).2 hw
    exact (Nat.le_div_iff_mul_le hi).1 h
  have hxsub := Nat.sub_add_cancel hnonneg
  nlinarith

/-- Removing less than one larger piece loses at most one larger-piece
quotient slot, and leaves at least as many smaller-piece slots. -/
theorem quotient_after_extra (x i extra : ℕ) (hi : 0 < i)
    (he : extra ≤ i+1) (hcap : extra ≤ x) :
    x/(i+1)-1 ≤ (x-extra)/(i+1) ∧ x/(i+1)-1 ≤ (x-extra)/i := by
  have hj : 0 < i+1 := by omega
  have hfloor := Nat.div_mul_le_self x (i+1)
  have hsub := Nat.sub_add_cancel hcap
  by_cases hz : x/(i+1) = 0
  · simp [hz]
  · have hp : 0 < x/(i+1) := Nat.pos_of_ne_zero hz
    have heq : x/(i+1)-1+1 = x/(i+1) := by omega
    have hbound : (x/(i+1)-1)*(i+1) ≤ x-extra := by nlinarith
    constructor
    · exact (Nat.le_div_iff_mul_le hj).2 hbound
    · apply (Nat.le_div_iff_mul_le hi).2
      nlinarith

def reducedArm {m : ℕ} (arms : Fin m → ℕ) (p : Fin m) (extra : ℕ) : Fin m → ℕ :=
  Function.update arms p (arms p-extra)

theorem reduced_quotient_sum_lower {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (he : extra ≤ i+1) (hcap : extra ≤ arms p) :
    (∑ j, arms j/(i+1)) ≤ (∑ j, reducedArm arms p extra j/(i+1))+1 ∧
    (∑ j, arms j/(i+1)) ≤ (∑ j, reducedArm arms p extra j/i)+1 := by
  classical
  let f : Fin m → ℕ := fun j => arms j/(i+1)
  let z := (arms p-extra)/(i+1)
  have hz : arms p/(i+1)-1 ≤ z := (quotient_after_extra (arms p) i extra hi he hcap).1
  have hfun : (fun j => reducedArm arms p extra j/(i+1)) = Function.update f p z := by
    funext j
    by_cases h : j=p
    · subst j
      simp [reducedArm, f, z]
    · simp [reducedArm, f, z, h]
  have hsum := sum_update_balance Finset.univ f p (Finset.mem_univ p) z
  have hfirst : (∑ j, arms j/(i+1)) ≤ (∑ j, reducedArm arms p extra j/(i+1))+1 := by
    rw [hfun]
    change (∑ j, arms j/(i+1)) ≤ (∑ j, Function.update f p z j)+1
    change (∑ j, Function.update f p z j)+arms p/(i+1) = (∑ j, arms j/(i+1))+z at hsum
    omega
  constructor
  · exact hfirst
  · have hmono : (∑ j, reducedArm arms p extra j/(i+1)) ≤
        ∑ j, reducedArm arms p extra j/i := by
      apply Finset.sum_le_sum
      intro j _
      exact consecutive_quotient_order _ _ hi
    omega

/-- The zero-carry exceptional endpoint: one reserved larger-piece slot
absorbs the loss from placing the exceptional piece on any fitting arm. -/
theorem extra_baseline_packing {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hbudget : a+b+1 ≤ ∑ j, arms j/(i+1)) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have h := reduced_quotient_sum_lower arms p i extra hi he hcap
  apply packing_baseline (reducedArm arms p extra) i a b hi <;> omega

theorem extra_baseline_partition {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j)
    (hbudget : a+b+1 ≤ ∑ j, arms j/(i+1)) : Partitionable arms sizes := by
  apply extra_partition_from_reduced_packing arms sizes i extra a b center p hi hextra hcap
    hcenter hextrasize hsmall hlarge hvalues htotal
  obtain ⟨small,large,ha,hb,hfit⟩ := extra_baseline_packing arms p i extra a b hi he hcap hbudget
  refine ⟨small,large,ha,hb,?_⟩
  intro j
  have h := hfit j
  by_cases hj : j = p
  · subst j
    simpa [reducedArm] using h
  · simpa [reducedArm, hj] using h

theorem quotient_unchanged_of_residue (x i extra : ℕ) (hres : extra ≤ x%(i+1)) :
    (x-extra)/(i+1) = x/(i+1) := by
  have hj : 0 < i+1 := by omega
  have hv := Nat.mod_lt x hj
  have hdiv := Nat.div_add_mod x (i+1)
  have hx : extra ≤ x := hres.trans (Nat.mod_le _ _)
  have hsub := Nat.sub_add_cancel hx
  have hvsub := Nat.sub_add_cancel hres
  have hrep : x-extra = (i+1)*(x/(i+1))+(x%(i+1)-extra) := by nlinarith
  rw [hrep, Nat.mul_add_div hj]
  have hlt : x%(i+1)-extra < i+1 := by omega
  rw [Nat.div_eq_of_lt hlt, add_zero]

theorem reduced_quotient_sum_no_loss {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (hres : extra ≤ arms p%(i+1)) :
    (∑ j, arms j/(i+1)) = (∑ j, reducedArm arms p extra j/(i+1)) ∧
    (∑ j, arms j/(i+1)) ≤ (∑ j, reducedArm arms p extra j/i) := by
  have he := quotient_unchanged_of_residue (arms p) i extra hres
  have hfun : (fun j => reducedArm arms p extra j/(i+1)) = (fun j => arms j/(i+1)) := by
    funext j
    by_cases h : j=p
    · subst j
      simpa [reducedArm] using he
    · simp [reducedArm, h]
  constructor
  · rw [hfun]
  · rw [← hfun]
    apply Finset.sum_le_sum
    intro j _
    exact consecutive_quotient_order _ _ hi

theorem extra_no_loss_packing {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (hres : extra ≤ arms p%(i+1))
    (hbudget : a+b ≤ ∑ j, arms j/(i+1)) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have h := reduced_quotient_sum_no_loss arms p i extra hi hres
  apply packing_baseline (reducedArm arms p extra) i a b hi <;> omega

theorem extra_no_loss_partition {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (hres : extra ≤ arms p%(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j)
    (hbudget : a+b ≤ ∑ j, arms j/(i+1)) : Partitionable arms sizes := by
  have hcap : extra ≤ arms p := hres.trans (Nat.mod_le _ _)
  apply extra_partition_from_reduced_packing arms sizes i extra a b center p hi hextra hcap
    hcenter hextrasize hsmall hlarge hvalues htotal
  obtain ⟨small,large,ha,hb,hfit⟩ := extra_no_loss_packing arms p i extra a b hi hres hbudget
  refine ⟨small,large,ha,hb,?_⟩
  intro j
  have h := hfit j
  by_cases hj : j = p
  · subst j
    simpa [reducedArm] using h
  · simpa [reducedArm, hj] using h

/-- When the exceptional piece wraps the larger-size residue, its quotient
falls by exactly one and the wrapped residue is explicit. -/
theorem quotient_and_residue_after_wrap (x i extra : ℕ)
    (he : extra ≤ i+1) (hcap : extra ≤ x) (hwrap : x%(i+1) < extra) :
    (x-extra)/(i+1)+1 = x/(i+1) ∧
    (x-extra)%(i+1) = x%(i+1)+(i+1)-extra := by
  have hj : 0 < i+1 := by omega
  have hdiv := Nat.div_add_mod x (i+1)
  have hmod := Nat.mod_lt x hj
  have hpos : 0 < x/(i+1) := by
    by_cases hz : x/(i+1) = 0
    · simp [hz] at hdiv
      have hh : x%(i+1) = x := by simpa using hdiv
      omega
    · exact Nat.pos_of_ne_zero hz
  have hsub := Nat.sub_add_cancel hcap
  have hq : x/(i+1)-1+1=x/(i+1) := by omega
  have hrem : x%(i+1)+(i+1)-extra < i+1 := by omega
  have hremplus : (x%(i+1)+(i+1)-extra)+extra=x%(i+1)+(i+1) := by omega
  have hrep : x-extra = (i+1)*(x/(i+1)-1)+(x%(i+1)+(i+1)-extra) := by nlinarith
  constructor
  · rw [hrep, Nat.mul_add_div hj, Nat.div_eq_of_lt hrem, add_zero]
    omega
  · rw [hrep, Nat.mul_add_mod, Nat.mod_eq_of_lt hrem]

theorem small_slots_after_wrap (x i extra : ℕ) (hi : 0 < i)
    (hcap : extra ≤ x) (hw : extra ≤ x/(i+1)+x%(i+1)) :
    x/(i+1) ≤ (x-extra)/i := by
  have hdiv := Nat.div_add_mod x (i+1)
  have hsub := Nat.sub_add_cancel hcap
  apply (Nat.le_div_iff_mul_le hi).2
  nlinarith

end Hornak
