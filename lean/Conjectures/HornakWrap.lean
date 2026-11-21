import Conjectures.HornakExtraResidues

/-! The wrapped-residue exceptional-piece endpoint. -/
namespace Hornak

theorem wrapped_sum_relations {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra : ℕ) (hi : 0 < i) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hwrap : arms p%(i+1) < extra)
    (hw : extra ≤ arms p/(i+1)+arms p%(i+1)) :
    (∑ j, reducedArm arms p extra j/(i+1))+1 = ∑ j, arms j/(i+1) ∧
    (∑ j, arms j/(i+1)) ≤ ∑ j, reducedArm arms p extra j/i ∧
    (i+1)-reducedArm arms p extra p%(i+1) = extra-arms p%(i+1) := by
  classical
  have hlocal := quotient_and_residue_after_wrap (arms p) i extra he hcap hwrap
  let f : Fin m → ℕ := fun j => arms j/(i+1)
  let z := (arms p-extra)/(i+1)
  have hfun : (fun j => reducedArm arms p extra j/(i+1)) = Function.update f p z := by
    funext j
    by_cases h : j=p
    · subst j
      simp [reducedArm, f, z]
    · simp [reducedArm, f, z, h]
  have hsum := sum_update_balance Finset.univ f p (Finset.mem_univ p) z
  have hz : z+1 = arms p/(i+1) := hlocal.1
  have hlarge : (∑ j, reducedArm arms p extra j/(i+1))+1 = ∑ j, arms j/(i+1) := by
    rw [hfun]
    change (∑ j, Function.update f p z j)+1 = ∑ j, arms j/(i+1)
    change (∑ j, Function.update f p z j)+arms p/(i+1) = (∑ j, arms j/(i+1))+z at hsum
    omega
  have hsmall : (∑ j, arms j/(i+1)) ≤ ∑ j, reducedArm arms p extra j/i := by
    apply Finset.sum_le_sum
    intro j _
    by_cases hj : j=p
    · subst j
      simpa [reducedArm] using small_slots_after_wrap (arms p) i extra hi hcap hw
    · have h := consecutive_quotient_order (arms j) i hi
      simpa [reducedArm,hj] using h
  refine ⟨hlarge,hsmall,?_⟩
  simp only [reducedArm, Function.update_self]
  rw [hlocal.2]
  omega

theorem extra_wrapped_packing {m : ℕ} (arms : Fin m → ℕ) (p : Fin m)
    (i extra a b : ℕ) (hi : 0 < i) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hwrap : arms p%(i+1) < extra)
    (hw : extra ≤ arms p/(i+1)+arms p%(i+1))
    (hmin : extra-arms p%(i+1) ≤ a)
    (hbudget : a+b ≤ ∑ j, arms j/(i+1)) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ reducedArm arms p extra j := by
  have h := wrapped_sum_relations arms p i extra hi he hcap hwrap hw
  have hv : arms p%(i+1) < i+1 := Nat.mod_lt _ (by omega)
  have hlocal : arms p/(i+1) ≤ reducedArm arms p extra p/i := by
    simpa [reducedArm] using small_slots_after_wrap (arms p) i extra hi hcap hw
  apply packing_one_carry (reducedArm arms p extra) i a b hi (by omega) (by omega) p
  · rw [h.2.2]
    exact hmin
  · rw [h.2.2]
    omega

theorem extra_wrapped_partition {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (he : extra ≤ i+1) (hcap : extra ≤ arms p)
    (hwrap : arms p%(i+1) < extra)
    (hw : extra ≤ arms p/(i+1)+arms p%(i+1))
    (hmin : extra-arms p%(i+1) ≤ a)
    (hbudget : a+b ≤ ∑ j, arms j/(i+1))
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) : Partitionable arms sizes := by
  apply extra_partition_from_reduced_packing arms sizes i extra a b center p hi hextra hcap
    hcenter hextrasize hsmall hlarge hvalues htotal
  obtain ⟨small,large,ha,hb,hfit⟩ := extra_wrapped_packing arms p i extra a b hi he hcap hwrap hw hmin hbudget
  refine ⟨small,large,ha,hb,?_⟩
  intro j
  have h := hfit j
  by_cases hj : j = p
  · subst j
    simpa [reducedArm] using h
  · simpa [reducedArm, hj] using h

end Hornak
