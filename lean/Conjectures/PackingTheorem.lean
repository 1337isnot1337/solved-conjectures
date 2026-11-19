import Conjectures.PackingAsymptotic
import Conjectures.PackingOppositeParity

/-! Exact supremal upper packing density and infimal lower covering density
for symmetric four-point sets of integers. -/
namespace PackingFourPoint

theorem packingDensity_eq_of_bounds (a b : ℤ) (δ : ℝ)
    (hu : ∀ x : ℤ → ℤ, (∀ t, 0 ≤ x t) →
      (∀ t, multiplicity x a b t ≤ 1) → upperDensity x ≤ δ)
    (he : ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧
      (∀ t, multiplicity x a b t ≤ 1) ∧ upperDensity x = δ) :
    packingDensity a b = δ := by
  unfold packingDensity
  have hb : BddAbove {d : ℝ | ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧
      (∀ t, multiplicity x a b t ≤ 1) ∧ upperDensity x = d} := by
    refine ⟨δ, ?_⟩
    rintro d ⟨x, hx, hp, rfl⟩
    exact hu x hx hp
  apply le_antisymm
  · apply csSup_le ⟨δ, he⟩
    rintro d ⟨x, hx, hp, rfl⟩
    exact hu x hx hp
  · exact le_csSup hb he

theorem coveringDensity_eq_of_bounds (a b : ℤ) (δ : ℝ)
    (hl : ∀ x : ℤ → ℤ, (∀ t, 0 ≤ x t) → (∀ t, x t ≤ 1) →
      (∀ t, 1 ≤ multiplicity x a b t) → δ ≤ lowerDensity x)
    (he : ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
      (∀ t, 1 ≤ multiplicity x a b t) ∧ lowerDensity x = δ) :
    coveringDensity a b = δ := by
  unfold coveringDensity
  have hb : BddBelow {d : ℝ | ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
      (∀ t, 1 ≤ multiplicity x a b t) ∧ lowerDensity x = d} := by
    refine ⟨δ, ?_⟩
    rintro d ⟨x, hx0, hx1, hc, rfl⟩
    exact hl x hx0 hx1 hc
  apply le_antisymm
  · exact csInf_le hb he
  · apply le_csInf ⟨δ, he⟩
    rintro d ⟨x, hx0, hx1, hc, rfl⟩
    exact hl x hx0 hx1 hc

theorem packing_upper_density_quarter (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (a b : ℕ) (hp : ∀ t, multiplicity x a b t ≤ 1) :
    upperDensity x ≤ 1/4 := by
  have hu := upperDensity_le_of_count_bound x hx 4 1 (2*(a+b : ℕ)) (by norm_num) (by
    intro start n
    have hm := intervalSum_le_length (multiplicity x a b) hp start n
    have hc := (multiplicity_center_bounds x hx
      (center_le_one_of_packing x hx a b hp) a b start n).1
    linarith)
  simpa only [Int.cast_one, Int.cast_ofNat] using hu

theorem covering_lower_density_quarter (x : ℤ → ℤ)
    (hx0 : ∀ t, 0 ≤ x t) (hx1 : ∀ t, x t ≤ 1)
    (a b : ℕ) (hc : ∀ t, 1 ≤ multiplicity x a b t) :
    1/4 ≤ lowerDensity x := by
  have hl := le_lowerDensity_of_count_bound x hx1 4 1 (2*(a+b : ℕ)) (by norm_num) (by
    intro start n
    have hm := length_le_intervalSum (multiplicity x a b) hc start n
    have hb := (multiplicity_center_bounds x hx0 hx1 a b start n).2
    linarith)
  simpa only [Int.cast_one, Int.cast_ofNat] using hl

theorem odd_packing_upper_density (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hp : ∀ t, multiplicity x a b t ≤ 1) :
    upperDensity x ≤ (((a*b+b-a : ℕ) : ℝ)-1)/(4*(a*b+b-a : ℕ)) := by
  let P := a*b+b-a
  have hP : (0 : ℤ) < P := by omega
  have hu := upperDensity_le_of_count_bound x hx (4*(P : ℤ)) ((P : ℤ)-1)
    ((P : ℤ)-1+2*P*(a+b : ℕ)) (by omega)
    (fun s n => by simpa only [add_assoc] using packing_center_bound x hx s a b p q ha hb hab hp n)
  simpa only [Int.cast_mul, Int.cast_sub, Int.cast_natCast, Int.cast_one, Int.cast_ofNat] using hu

theorem odd_covering_lower_density (x : ℤ → ℤ)
    (hx0 : ∀ t, 0 ≤ x t) (hx1 : ∀ t, x t ≤ 1)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hc : ∀ t, 1 ≤ multiplicity x a b t) :
    (((a*b+a+b : ℕ) : ℝ)+1)/(4*(a*b+a+b : ℕ)) ≤ lowerDensity x := by
  let Q := a*b+a+b
  have hQ : (0 : ℤ) < Q := by
    exact_mod_cast (show 0 < Q by dsimp [Q]; omega)
  have hl := le_lowerDensity_of_count_bound x hx1 (4*(Q : ℤ)) ((Q : ℤ)+1)
    ((Q : ℤ)-1+2*Q*(a+b : ℕ)) (by omega) (by
      intro s n
      simpa only [sub_add_eq_sub_sub] using covering_center_bound x hx0 hx1 s a b p q ha hb hab hc n)
  simpa only [Int.cast_add, Int.cast_mul, Int.cast_natCast, Int.cast_one, Int.cast_ofNat] using hl

theorem odd_packing_attainment (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, multiplicity x a b t ≤ 1) ∧
      upperDensity x = (((a*b+b-a : ℕ) : ℝ)-1)/(4*(a*b+b-a : ℕ)) := by
  let P := a*b+b-a
  have hP : 0 < P := by omega
  let : NeZero P := ⟨by omega⟩
  let centers := oddPackingCenters a b p q
  have hr := odd_packing_residues a b p q ha hb hab hcop
  refine ⟨periodicCenters centers, fun t => fiberCount_nonneg centers _,
    periodic_packing centers a b (by simpa only [Int.cast_natCast] using hr.2), ?_⟩
  have hd := (periodicCenters_densities centers hr.1).1
  rw [hd]
  have hPNat : P+a = a*b+b := Nat.sub_add_cancel (by omega)
  have hcardNat : 4*Fintype.card (Fin q × Fin (p+1))+1 = P := by
    simp only [Fintype.card_prod, Fintype.card_fin]
    have hh : 4*(q*(p+1))+a+1 = a*b+b := by rw [ha, hb]; ring
    omega
  have hcardReal : 4*(Fintype.card (Fin q × Fin (p+1)) : ℝ) = (P : ℝ)-1 := by
    have hh : 4*(Fintype.card (Fin q × Fin (p+1)) : ℝ)+1 = P := by exact_mod_cast hcardNat
    linarith
  change (Fintype.card (Fin q × Fin (p+1)) : ℝ)/P = ((P : ℝ)-1)/(4*P)
  rw [← hcardReal]
  field_simp

theorem odd_covering_attainment (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
      (∀ t, 1 ≤ multiplicity x a b t) ∧
      lowerDensity x = (((a*b+a+b : ℕ) : ℝ)+1)/(4*(a*b+a+b : ℕ)) := by
  let Q := a*b+a+b
  have hQ : 0 < Q := by dsimp [Q]; omega
  let : NeZero Q := ⟨by omega⟩
  let centers := oddCoveringCenters a b p q
  have hr := odd_covering_residues a b p q ha hb hab hcop
  refine ⟨periodicCenters centers, fun t => fiberCount_nonneg centers _,
    fun t => fiberCount_le_one centers hr.1 _,
    periodic_covering centers a b (by simpa only [Int.cast_natCast] using hr.2), ?_⟩
  have hd := (periodicCenters_densities centers hr.1).2
  rw [hd]
  have hcardNat : 4*Fintype.card (Fin (q+1) × Fin (p+1)) = Q+1 := by
    simp only [Fintype.card_prod, Fintype.card_fin]
    dsimp [Q]
    rw [ha, hb]
    ring
  have hcardReal : 4*(Fintype.card (Fin (q+1) × Fin (p+1)) : ℝ) = (Q : ℝ)+1 := by
    exact_mod_cast hcardNat
  change (Fintype.card (Fin (q+1) × Fin (p+1)) : ℝ)/Q = ((Q : ℝ)+1)/(4*Q)
  rw [← hcardReal]
  field_simp

theorem even_odd_attainment (a b : ℕ) (ha0 : 0 < a)
    (haEven : Even a) (hbOdd : Odd b) :
    ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
      (∀ t, multiplicity x a b t ≤ 1) ∧ (∀ t, 1 ≤ multiplicity x a b t) ∧
      upperDensity x = 1/4 ∧ lowerDensity x = 1/4 := by
  obtain ⟨u, hu, centers, hi, hp, hc⟩ := even_odd_residue_tiling a b ha0 haEven hbOdd
  let : NeZero (4*u) := ⟨by omega⟩
  refine ⟨periodicCenters centers, fun t => fiberCount_nonneg centers _,
    fun t => fiberCount_le_one centers hi _,
    periodic_packing centers a b (by simpa only [Int.cast_natCast] using hp),
    periodic_covering centers a b (by simpa only [Int.cast_natCast] using hc), ?_⟩
  have hd := periodicCenters_densities centers hi
  have huReal : (u : ℝ) ≠ 0 := by exact_mod_cast (by omega : u ≠ 0)
  have hr : (Fintype.card (Fin 1 × Fin u) : ℝ)/(4*u : ℕ) = 1/4 := by
    simp only [Fintype.card_prod, Fintype.card_fin, Nat.one_mul,
      Nat.cast_mul, Nat.cast_ofNat]
    field_simp
  exact ⟨hd.1.trans hr, hd.2.trans hr⟩

theorem packingDensity_comm (a b : ℤ) : packingDensity a b = packingDensity b a := by
  unfold packingDensity
  congr 1
  ext d
  constructor
  · rintro ⟨x, hx, hp, hd⟩
    refine ⟨x, hx, ?_, hd⟩
    intro t
    rw [← multiplicity_comm x a b t]
    exact hp t
  · rintro ⟨x, hx, hp, hd⟩
    refine ⟨x, hx, ?_, hd⟩
    intro t
    rw [multiplicity_comm x a b t]
    exact hp t

theorem coveringDensity_comm (a b : ℤ) : coveringDensity a b = coveringDensity b a := by
  unfold coveringDensity
  congr 1
  ext d
  constructor
  · rintro ⟨x, hx0, hx1, hc, hd⟩
    refine ⟨x, hx0, hx1, ?_, hd⟩
    intro t
    rw [← multiplicity_comm x a b t]
    exact hc t
  · rintro ⟨x, hx0, hx1, hc, hd⟩
    refine ⟨x, hx0, hx1, ?_, hd⟩
    intro t
    rw [multiplicity_comm x a b t]
    exact hc t

theorem odd_densities (a b p q : ℕ)
    (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) (hcop : a.Coprime b) :
    packingDensity a b = (((a*b+b-a : ℕ) : ℝ)-1)/(4*(a*b+b-a : ℕ)) ∧
    coveringDensity a b = (((a*b+a+b : ℕ) : ℝ)+1)/(4*(a*b+a+b : ℕ)) := by
  constructor
  · exact packingDensity_eq_of_bounds a b _
      (fun x hx hp => odd_packing_upper_density x hx a b p q ha hb hab hp)
      (odd_packing_attainment a b p q ha hb hab hcop)
  · exact coveringDensity_eq_of_bounds a b _
      (fun x hx0 hx1 hc => odd_covering_lower_density x hx0 hx1 a b p q ha hb hab hc)
      (odd_covering_attainment a b p q ha hb hab hcop)

theorem even_odd_densities (a b : ℕ) (ha0 : 0 < a)
    (haEven : Even a) (hbOdd : Odd b) :
    packingDensity a b = 1/4 ∧ coveringDensity a b = 1/4 := by
  obtain ⟨x, hx0, hx1, hp, hc, hdp, hdc⟩ := even_odd_attainment a b ha0 haEven hbOdd
  constructor
  · exact packingDensity_eq_of_bounds a b _
      (fun x hx hp => packing_upper_density_quarter x hx a b hp) ⟨x, hx0, hp, hdp⟩
  · exact coveringDensity_eq_of_bounds a b _
      (fun x hx0 hx1 hc => covering_lower_density_quarter x hx0 hx1 a b hc)
      ⟨x, hx0, hx1, hc, hdc⟩

/-- The full sharp packing and covering theorem, with genuine supremal
upper asymptotic density and infimal lower asymptotic density. -/
theorem symmetric_four_point_densities (a b : ℕ)
    (ha0 : 0 < a) (hab : a < b) (hcop : a.Coprime b) :
    packingDensity a b =
      (if Odd a ∧ Odd b then (((a*b+b-a : ℕ) : ℝ)-1)/(4*(a*b+b-a : ℕ)) else 1/4) ∧
    coveringDensity a b =
      (if Odd a ∧ Odd b then (((a*b+a+b : ℕ) : ℝ)+1)/(4*(a*b+a+b : ℕ)) else 1/4) := by
  classical
  by_cases hodd : Odd a ∧ Odd b
  · obtain ⟨p, hp⟩ := hodd.1
    obtain ⟨q, hq⟩ := hodd.2
    simpa only [ite_eq_left hodd] using odd_densities a b p q hp hq hab hcop
  · simp only [ite_eq_right hodd]
    rcases Nat.even_or_odd a with haEven | haOdd
    · rcases Nat.even_or_odd b with hbEven | hbOdd
      · have htwo : 2 ∣ Nat.gcd a b := Nat.dvd_gcd haEven.two_dvd hbEven.two_dvd
        rw [hcop.gcd_eq_one] at htwo
        norm_num at htwo
      · exact even_odd_densities a b ha0 haEven hbOdd
    · rcases Nat.even_or_odd b with hbEven | hbOdd
      · have hh := even_odd_densities b a (by omega) hbEven haOdd
        rw [packingDensity_comm (b : ℤ) a, coveringDensity_comm (b : ℤ) a] at hh
        exact hh
      · exact (hodd ⟨haOdd, hbOdd⟩).elim

end PackingFourPoint
