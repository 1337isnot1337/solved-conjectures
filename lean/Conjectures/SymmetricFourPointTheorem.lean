import Conjectures.SymmetricFourPointDensity

/-! Exact extremal densities and explicit periodic attainment for every
coprime pair of positive steps. No published extremal result is assumed. -/

namespace SymmetricFourPoint

theorem coprime_of_sum_multiple (a b p k : ℕ) (hcop : Nat.Coprime a b)
    (heq : p + a = b * k) : Nat.Coprime b p := by
  change Nat.gcd b p = 1
  apply Nat.eq_one_of_dvd_one
  have hb : Nat.gcd b p ∣ b := Nat.gcd_dvd_left _ _
  have hp : Nat.gcd b p ∣ p := Nat.gcd_dvd_right _ _
  have hsum : Nat.gcd b p ∣ p + a := by
    rw [heq]
    exact dvd_mul_of_dvd_left hb k
  have ha : Nat.gcd b p ∣ a := (Nat.dvd_add_iff_right hp).mpr hsum
  rw [← hcop.gcd_eq_one]
  exact Nat.dvd_gcd ha hb

theorem coprime_of_multiple_add (a b p k : ℕ) (hcop : Nat.Coprime a b)
    (heq : p = b * k + a) : Nat.Coprime b p := by
  change Nat.gcd b p = 1
  apply Nat.eq_one_of_dvd_one
  have hb : Nat.gcd b p ∣ b := Nat.gcd_dvd_left _ _
  have hp : Nat.gcd b p ∣ p := Nat.gcd_dvd_right _ _
  have hmul : Nat.gcd b p ∣ b * k := dvd_mul_of_dvd_left hb k
  have hp' : Nat.gcd b p ∣ b * k + a := by rw [← heq]; exact hp
  have ha : Nat.gcd b p ∣ a := (Nat.dvd_add_iff_right hmul).mpr hp'
  rw [← hcop.gcd_eq_one]
  exact Nat.dvd_gcd ha hb

def shiftedCenters (p : ℕ) (C : Finset (ZMod p)) (a : ℤ) : Finset (ZMod p) :=
  C.image (fun z => z - (a : ZMod p))

theorem shiftedCenters_card (p : ℕ) (C : Finset (ZMod p)) (a : ℤ) :
    (shiftedCenters p C a).card = C.card := by
  apply Finset.card_image_of_injective
  intro x y h
  exact sub_left_injective h

theorem indicator_shiftedCenters (p : ℕ) (C : Finset (ZMod p)) (a t : ℤ) :
    indicator (cyclicSet p (shiftedCenters p C a)) t =
      indicator (cyclicSet p C) (t + a) := by
  classical
  have hmem : (t : ZMod p) ∈ shiftedCenters p C a ↔ ((t + a : ℤ) : ZMod p) ∈ C := by
    constructor
    · intro h
      obtain ⟨z,hz,he⟩ := Finset.mem_image.mp h
      have ht : ((t + a : ℤ) : ZMod p) = z := by
        rw [Int.cast_add, ← he]
        ring
      simpa only [ht] using hz
    · intro h
      apply Finset.mem_image.mpr
      exact ⟨_, h, by push_cast; ring⟩
  simp only [indicator, cyclicSet, Set.mem_ofPred_eq, hmem]
  split_ifs <;> simp_all

theorem odd_packing_witness (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (haodd : a % 2 = 1) (hbodd : b % 2 = 1) :
    ∃ A : Set ℤ, IsPacking A a b ∧ NonmixedGap.IsPeriodic A (packingLength a b) ∧
      NonmixedGap.upperDensity A = ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) ∧
      NonmixedGap.lowerDensity A = ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) := by
  let u := (a + 1) / 2
  let v := (b - 1) / 2
  let p := packingLength a b
  have hu2 : 2 * u = a + 1 := by dsimp [u]; omega
  have hv2 : 2 * v = b - 1 := by dsimp [v]; omega
  have hu : 0 < u := by omega
  have hv : 0 < v := by omega
  have hp : 0 < p := by dsimp [p, packingLength]; omega
  have hpa : p + a = a * b + b := by dsimp [p, packingLength]; omega
  have hsum : p + a = b * (2 * u) := by
    rw [hu2, hpa]
    ring
  have hsize : 4 * u * v + 1 = p := by
    have hb1 : b - 1 + 1 = b := by omega
    nlinarith [hu2, hv2, hpa]
  have hcp : Nat.Coprime b p := coprime_of_sum_multiple a b p (2 * u) hcop hsum
  let c : (ZMod p)ˣ := ZMod.unitOfCoprime b hcp
  let C := scaledGridCenters u v p c
  have hbmod : (b : ZMod p) = (c : ZMod p) := by simp [c]
  have hamod : ((a : ℤ) : ZMod p) = (c : ZMod p) * (2 * u : ℕ) := by
    rw [← hbmod]
    have hc := congrArg (fun n : ℕ => (n : ZMod p)) hsum
    simpa only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self, zero_add, Int.cast_natCast] using hc
  have hbound : ∀ (i : Fin u) (j : Fin v), centerCode u i j < p := by
    intro i j
    have hh := centerCode_small u v i j hu hv i.isLt j.isLt
    omega
  have hcard : C.card = u * v := scaledGridCenters_card u v p c hu hbound
  have hd : (C.card : ℝ) / p = ((p : ℝ) - 1) / (4 * p) := by
    rw [hcard]
    have hsz : 4 * (u : ℝ) * v + 1 = (p : ℝ) := by exact_mod_cast hsize
    have hp0 : (p : ℝ) ≠ 0 := by exact_mod_cast (ne_of_gt hp)
    push_cast
    field_simp
    nlinarith only [hsz]
  refine ⟨cyclicSet p C, ?_, cyclicSet_periodic p C, ?_, ?_⟩
  · exact rectangle_cyclic_packing u v p hu (by omega) c a b hamod (by simpa using hbmod)
  · rw [cyclicSet_upperDensity p hp C, hd]
  · rw [cyclicSet_lowerDensity p hp C, hd]

theorem odd_covering_witness (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (haodd : a % 2 = 1) (hbodd : b % 2 = 1) :
    ∃ A : Set ℤ, IsCovering A a b ∧ NonmixedGap.IsPeriodic A (coveringLength a b) ∧
      NonmixedGap.upperDensity A = ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) ∧
      NonmixedGap.lowerDensity A = ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) := by
  let u := (a + 1) / 2
  let v := (b + 1) / 2
  let p := coveringLength a b
  have hu2 : 2 * u = a + 1 := by dsimp [u]; omega
  have hv2 : 2 * v = b + 1 := by dsimp [v]; omega
  have hu : 0 < u := by omega
  have hv : 0 < v := by omega
  have hp : 0 < p := by dsimp [p, coveringLength]; omega
  have hsum : p = b * (2 * u) + a := by
    rw [hu2]
    dsimp [p, coveringLength]
    ring
  have hsize : p + 1 = 4 * u * v := by nlinarith [hu2, hv2, hsum]
  have hcp : Nat.Coprime b p := coprime_of_multiple_add a b p (2 * u) hcop hsum
  let c : (ZMod p)ˣ := ZMod.unitOfCoprime b hcp
  let C := scaledGridCenters u v p c
  let C' := shiftedCenters p C a
  have hbmod : (b : ZMod p) = (c : ZMod p) := by simp [c]
  have hamod : ((-(a : ℤ)) : ZMod p) = (c : ZMod p) * (2 * u : ℕ) := by
    rw [← hbmod]
    have hc := congrArg (fun n : ℕ => (n : ZMod p)) hsum
    have hc' : (0 : ZMod p) = (b : ZMod p) * (2 * u : ℕ) + (a : ZMod p) := by
      simpa only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self] using hc
    have he := congrArg (fun z : ZMod p => z - (a : ZMod p)) hc'
    simpa only [zero_sub, add_sub_cancel_right, Int.cast_neg, Int.cast_natCast] using he
  have hbound : ∀ (i : Fin u) (j : Fin v), centerCode u i j < p := by
    intro i j
    have hh := centerCode_small u v i j hu hv i.isLt j.isLt
    omega
  have hcard : C'.card = u * v := by
    rw [shiftedCenters_card]
    exact scaledGridCenters_card u v p c hu hbound
  have hd : (C'.card : ℝ) / p = ((p : ℝ) + 1) / (4 * p) := by
    rw [hcard]
    have hsz : (p : ℝ) + 1 = 4 * (u : ℝ) * v := by exact_mod_cast hsize
    have hp0 : (p : ℝ) ≠ 0 := by exact_mod_cast (ne_of_gt hp)
    push_cast
    field_simp
    nlinarith only [hsz]
  refine ⟨cyclicSet p C', ?_, cyclicSet_periodic p C', ?_, ?_⟩
  · have ht := rectangle_cyclic_covering u v p hu hp (by omega) c (-(a : ℤ)) b
      (by simpa only [Int.cast_neg, Int.cast_natCast] using hamod) (by simpa using hbmod)
    have hx : indicator (cyclicSet p C') = fun t => indicator (cyclicSet p C) (t + a) := by
      funext t
      exact indicator_shiftedCenters p C a t
    intro t
    rw [hx, ← multiplicity_neg_first]
    exact ht t
  · rw [cyclicSet_upperDensity p hp C', hd]
  · rw [cyclicSet_lowerDensity p hp C', hd]

/-- Complete odd-step packing and covering density theorem. -/
theorem densities_odd (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (haodd : a % 2 = 1) (hbodd : b % 2 = 1) :
    packingDensity a b = ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) ∧
    coveringDensity a b = ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) := by
  constructor
  · obtain ⟨A,hA,_,hd,_⟩ := odd_packing_witness a b ha hab hcop haodd hbodd
    exact packingDensity_eq_of_witness a b _ (odd_packing_upperDensity a b ha hab haodd hbodd) A hA hd
  · obtain ⟨A,hA,_,_,hd⟩ := odd_covering_witness a b ha hab hcop haodd hbodd
    exact coveringDensity_eq_of_witness a b _ (odd_covering_lowerDensity a b ha hab haodd hbodd) A hA hd

/-- The even step uses a rectangle of height two. The construction works in
modulus `2*e` and has exactly one cover at every integer site. -/
theorem even_odd_tiling (e o : ℕ) (he : 0 < e) (hcop : Nat.Coprime e o)
    (heven : e % 2 = 0) (hodd : o % 2 = 1) :
    ∃ A : Set ℤ, (∀ t, multiplicity (indicator A) e o t = 1) ∧
      NonmixedGap.IsPeriodic A (2 * e : ℕ) ∧
      NonmixedGap.upperDensity A = 1 / 4 ∧ NonmixedGap.lowerDensity A = 1 / 4 := by
  let u := e / 2
  let p := 2 * e
  have hu2 : 2 * u = e := by dsimp [u]; omega
  have hu : 0 < u := by omega
  have hp : 0 < p := by dsimp [p]; omega
  have hsize : p = 4 * u * 1 := by dsimp [p]; omega
  have ho2 : Nat.Coprime o 2 := Nat.coprime_two_right.mpr ⟨o / 2, by omega⟩
  have hcp : Nat.Coprime o p := ho2.mul_right hcop.symm
  let c : (ZMod p)ˣ := ZMod.unitOfCoprime o hcp
  let C := scaledGridCenters u 1 p c
  have hbmod : (o : ZMod p) = (c : ZMod p) := by simp [c]
  have hamod : ((e : ℤ) : ZMod p) = (c : ZMod p) * (2 * u : ℕ) := by
    rw [← hbmod]
    have hodd' : o = 2 * (o / 2) + 1 := by omega
    have hmul : o * (2 * u) = e + p * (o / 2) := by
      rw [hu2]
      calc
        o * e = (2 * (o / 2) + 1) * e := by rw [← hodd']
        _ = e + p * (o / 2) := by dsimp [p]; ring
    have hc := congrArg (fun n : ℕ => (n : ZMod p)) hmul
    simpa only [Nat.cast_add, Nat.cast_mul, ZMod.natCast_self,
      zero_mul, add_zero, Int.cast_natCast] using hc.symm
  have hbound : ∀ (i : Fin u) (j : Fin 1), centerCode u i j < p := by
    intro i j
    have hh := centerCode_small u 1 i j hu (by omega) i.isLt j.isLt
    omega
  have hcard : C.card = u := by
    simpa only [Nat.mul_one] using scaledGridCenters_card u 1 p c hu hbound
  have hd : (C.card : ℝ) / p = 1 / 4 := by
    rw [hcard]
    have hsz : (p : ℝ) = 4 * (u : ℝ) := by
      exact_mod_cast (show p = 4 * u by simpa only [Nat.mul_one] using hsize)
    have hp0 : (p : ℝ) ≠ 0 := by exact_mod_cast (ne_of_gt hp)
    field_simp
    nlinarith only [hsz]
  refine ⟨cyclicSet p C, ?_, cyclicSet_periodic p C, ?_, ?_⟩
  · have hpa := rectangle_cyclic_packing u 1 p hu (by omega) c e o hamod (by simpa using hbmod)
    have hco := rectangle_cyclic_covering u 1 p hu hp (by omega) c e o hamod (by simpa using hbmod)
    intro t
    exact le_antisymm (hpa t) (hco t)
  · rw [cyclicSet_upperDensity p hp C, hd]
  · rw [cyclicSet_lowerDensity p hp C, hd]

theorem opposite_parity_tiling (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (hparity : a % 2 ≠ b % 2) :
    ∃ A : Set ℤ, (∀ t, multiplicity (indicator A) a b t = 1) ∧
      NonmixedGap.upperDensity A = 1 / 4 ∧ NonmixedGap.lowerDensity A = 1 / 4 := by
  by_cases heven : a % 2 = 0
  · obtain ⟨A,ht,_,hu,hl⟩ := even_odd_tiling a b ha hcop heven (by omega)
    exact ⟨A,ht,hu,hl⟩
  · obtain ⟨A,ht,_,hu,hl⟩ := even_odd_tiling b a (by omega) hcop.symm (by omega) (by omega)
    refine ⟨A,?_,hu,hl⟩
    intro t
    rw [multiplicity_swap]
    exact ht t

/-- Complete opposite-parity packing and covering density theorem. -/
theorem densities_opposite_parity (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (hparity : a % 2 ≠ b % 2) :
    packingDensity a b = 1 / 4 ∧ coveringDensity a b = 1 / 4 := by
  obtain ⟨A,ht,hu,hl⟩ := opposite_parity_tiling a b ha hab hcop hparity
  constructor
  · exact packingDensity_eq_of_witness a b _ (packing_upper_quarter a b)
      A (fun t => le_of_eq (ht t)) hu
  · exact coveringDensity_eq_of_witness a b _ (covering_lower_quarter a b)
      A (fun t => le_of_eq (ht t).symm) hl

end SymmetricFourPoint
