import Conjectures.PackingSharp

/-! The two obstruction lengths are sharp: the periodic extremizers contain
exactly covered intervals one site shorter than each obstruction length. -/
namespace PackingFourPoint

open scoped BigOperators

theorem periodic_multiplicity_block_count {ι : Type*} [Fintype ι]
    {P : ℕ} [NeZero P] (centers : ι → ZMod P) (a b start : ℤ) :
    intervalSum (multiplicity (periodicCenters centers) a b) start P =
      4*(Fintype.card ι : ℤ) := by
  rw [multiplicity_sum_eq]
  simp only [periodicCenters_block_count]
  ring

theorem interval_eq_one_of_le (f : ℤ → ℤ) (hf : ∀ t, f t ≤ 1)
    (start : ℤ) (n : ℕ) (hs : intervalSum f start n = n) :
    ∀ j : ℕ, j < n → f (start+j) = 1 := by
  intro j hj
  apply (Finset.sum_eq_sum_iff_of_le (s := Finset.range n)
    (f := fun i : ℕ => f (start+i)) (g := fun _ : ℕ => (1 : ℤ))
    (fun i _ => hf _)).mp ?_ j (Finset.mem_range.mpr hj)
  simpa only [intervalSum, Finset.sum_const, Finset.card_range, nsmul_eq_mul, mul_one]
    using hs

theorem interval_eq_one_of_ge (f : ℤ → ℤ) (hf : ∀ t, 1 ≤ f t)
    (start : ℤ) (n : ℕ) (hs : intervalSum f start n = n) :
    ∀ j : ℕ, j < n → f (start+j) = 1 := by
  intro j hj
  symm
  apply (Finset.sum_eq_sum_iff_of_le (s := Finset.range n)
    (f := fun _ : ℕ => (1 : ℤ)) (g := fun i : ℕ => f (start+i))
    (fun i _ => hf _)).mp ?_ j (Finset.mem_range.mpr hj)
  simpa only [intervalSum, Finset.sum_const, Finset.card_range, nsmul_eq_mul, mul_one]
    using hs.symm

/-- The packing obstruction length `ab+b-a` cannot be decreased. -/
theorem packing_interval_sharp (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    ∃ (x : ℤ → ℤ) (start : ℤ), (∀ t, 0 ≤ x t) ∧
      (∀ t, multiplicity x a b t ≤ 1) ∧
      (∀ n : ℕ, n < a*b+b-a-1 → multiplicity x a b (start+n) = 1) := by
  let P := a*b+b-a
  have hP : 0 < P := by omega
  let : NeZero P := ⟨by omega⟩
  let centers := oddPackingCenters a b p q
  let x := periodicCenters centers
  have hx : ∀ t, 0 ≤ x t := fun t => fiberCount_nonneg centers _
  have hr := odd_packing_residues a b p q ha hb hab hcop
  have hp : ∀ t, multiplicity x a b t ≤ 1 := periodic_packing centers a b
    (by simpa only [Int.cast_natCast] using hr.2)
  obtain ⟨j, _, hj⟩ := packing_interval_obstruction x hx 0 a b p q ha hb hab hp
  have hz : multiplicity x a b j = 0 := by simpa only [zero_add] using hj
  have hcardNat : 4*Fintype.card (Fin q × Fin (p+1))+1 = P := by
    simp only [Fintype.card_prod, Fintype.card_fin]
    have hPNat : P+a = a*b+b := Nat.sub_add_cancel (by omega)
    have hh : 4*(q*(p+1))+a+1 = a*b+b := by rw [ha, hb]; ring
    omega
  have hcard : 4*(Fintype.card (Fin q × Fin (p+1)) : ℤ)+1 = P := by
    exact_mod_cast hcardNat
  have hsum := periodic_multiplicity_block_count centers a b j
  have hsplit := intervalSum_add (multiplicity x a b) j 1 (P-1)
  have hn : 1+(P-1) = P := by omega
  rw [hn] at hsplit
  have hone : intervalSum (multiplicity x a b) j 1 = 0 := by
    simpa only [intervalSum, Finset.sum_range_one, Nat.cast_zero, add_zero] using hz
  rw [hone] at hsplit
  have hs : intervalSum (multiplicity x a b) (j+1) (P-1) = (P-1 : ℕ) := by
    change intervalSum (multiplicity x a b) j P = _ at hsum
    norm_num only [Nat.cast_one, zero_add] at hsplit
    omega
  exact ⟨x, j+1, hx, hp, interval_eq_one_of_le _ hp _ _ hs⟩

/-- The exact-cover obstruction length `ab+a+b` cannot be decreased,
even if all integer sites are required to be covered. -/
theorem covering_interval_sharp (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    ∃ (x : ℤ → ℤ) (start : ℤ), (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
      (∀ t, 1 ≤ multiplicity x a b t) ∧
      (∀ n : ℕ, n < a*b+a+b-1 → multiplicity x a b (start+n) = 1) := by
  let Q := a*b+a+b
  have hQ : 0 < Q := by dsimp [Q]; omega
  let : NeZero Q := ⟨by omega⟩
  let centers := oddCoveringCenters a b p q
  let x := periodicCenters centers
  have hx : ∀ t, 0 ≤ x t := fun t => fiberCount_nonneg centers _
  have hr := odd_covering_residues a b p q ha hb hab hcop
  have hc : ∀ t, 1 ≤ multiplicity x a b t := periodic_covering centers a b
    (by simpa only [Int.cast_natCast] using hr.2)
  have hnot := covering_interval_obstruction x hx 0 a b p q ha hb hab
  push Not at hnot
  obtain ⟨j, _, hj⟩ := hnot
  have hz : 2 ≤ multiplicity x a b j := by
    have hh := hc j
    simp only [zero_add] at hj
    omega
  have hcardNat : 4*Fintype.card (Fin (q+1) × Fin (p+1)) = Q+1 := by
    simp only [Fintype.card_prod, Fintype.card_fin]
    dsimp [Q]
    rw [ha, hb]
    ring
  have hcard : 4*(Fintype.card (Fin (q+1) × Fin (p+1)) : ℤ) = (Q : ℤ)+1 := by
    exact_mod_cast hcardNat
  have hsum := periodic_multiplicity_block_count centers a b j
  have hsplit := intervalSum_add (multiplicity x a b) j 1 (Q-1)
  have hn : 1+(Q-1) = Q := by omega
  rw [hn] at hsplit
  have hone : intervalSum (multiplicity x a b) j 1 = multiplicity x a b j := by
    simp only [intervalSum, Finset.sum_range_one, Nat.cast_zero, add_zero]
  rw [hone] at hsplit
  have htail := length_le_intervalSum (multiplicity x a b) hc (j+1) (Q-1)
  have hs : intervalSum (multiplicity x a b) (j+1) (Q-1) = (Q-1 : ℕ) := by
    change intervalSum (multiplicity x a b) j Q = _ at hsum
    norm_num only [Nat.cast_one] at hsplit
    omega
  exact ⟨x, j+1, hx, fun t => fiberCount_le_one centers hr.1 _, hc,
    interval_eq_one_of_ge _ hc _ _ hs⟩

end PackingFourPoint
