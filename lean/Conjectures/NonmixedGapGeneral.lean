import Conjectures.NonmixedGapScaling

namespace NonmixedGap

/-- Scaling the forbidden differences preserves the certified circle
clearance after scaling the period and window by the same factor. -/
theorem CharacterCertificate.scale {a b k m P p H g : ℤ} (hg : 0 < g)
    (h : CharacterCertificate a b k m P p H) :
    CharacterCertificate (g*a) (g*b) k m (g*P) p (g*H) := by
  refine ⟨mul_pos hg h.period_pos,mul_nonneg (le_of_lt hg) h.window_nonneg,?_,?_,?_⟩
  · have hh := mul_le_mul_of_nonneg_left h.window_half (le_of_lt hg)
    nlinarith only [hh]
  · let G : ℤ := Int.gcd p (g*P)
    have hG1 : G ∣ p := Int.gcd_dvd_left _ _
    have hG2 : G ∣ g*P := Int.gcd_dvd_right _ _
    have hG : G ∣ g*(Int.gcd p P : ℤ) := by
      rw [Int.gcd_eq_gcd_ab,mul_add]
      apply dvd_add
      · have hh := dvd_mul_of_dvd_left hG1 (g*Int.gcdA p P)
        convert hh using 1
        ring
      · have hh := dvd_mul_of_dvd_left hG2 (Int.gcdB p P)
        convert hh using 1
        ring
    obtain ⟨c,hc⟩ := h.kernel_divides
    rw [hc]
    simpa only [mul_assoc] using dvd_mul_of_dvd_left hG c
  · intro i j hi hik hj hjm hij
    obtain ⟨hlo,hhi⟩ := h.separated i j hi hik hj hjm hij
    have he : p*(i*(g*a)+j*(g*b)) = g*(p*(i*a+j*b)) := by ring
    rw [he,Int.mul_emod_mul_of_pos _ _ hg]
    constructor
    · exact mul_le_mul_of_nonneg_left hlo (le_of_lt hg)
    · have hh := mul_le_mul_of_nonneg_left hhi (le_of_lt hg)
      nlinarith only [hh]

theorem optimal_character_formula {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    ∃ P p H : ℤ, CharacterCertificate a b k m P p H ∧
      (H:ℝ)/(P:ℝ) = formula a b k m := by
  obtain ⟨U,V,hbez⟩ := hcop
  let s := k+m+1
  let d := (a-b)/s
  let r := (a-b)%s
  have hs : 0 < s := by dsimp [s]; omega
  have heq : a-b=(k+m+1)*d+r := by
    have hh := Int.emod_add_mul_ediv (a-b) s
    dsimp [s,d,r] at hh ⊢
    nlinarith only [hh]
  have hr0 : 0 ≤ r := Int.emod_nonneg _ (ne_of_gt hs)
  have hrs : r < k+m+1 := Int.emod_lt_of_pos _ hs
  rw [formula_eq_densityValue ha hb hk hm heq hr0 hrs]
  exact optimal_character ha hb hk hm hbez heq hr0 hrs

theorem scaled_circleValue {g a b k m : ℤ}
    (hg : 0 < g) (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hcop : IsCoprime a b) : circleValue (g*a) (g*b) k m = formula a b k m := by
  apply le_antisymm
  · apply Loneliness.value_le_of_rat
    intro q
    obtain ⟨P,p,H,hcert,hratio⟩ := rational_character (mul_pos hg ha) (mul_pos hg hb) hk hm q
    obtain ⟨hA,hdensity⟩ := hcert.packing
    have hh := scaled_upperDensity_le hg ha hb hk hm hcop hA
    rw [hdensity] at hh
    rwa [hratio]
  · obtain ⟨P,p,H,hcert,hratio⟩ := optimal_character_formula ha hb hk hm hcop
    have hh := (hcert.scale hg).le_circleValue (mul_pos hg ha) (mul_pos hg hb)
    have hgR : (g:ℝ) ≠ 0 := by exact_mod_cast ne_of_gt hg
    have he : ((g*H:ℤ):ℝ)/((g*P:ℤ):ℝ) = (H:ℝ)/(P:ℝ) := by
      push_cast
      exact mul_div_mul_left _ _ hgR
    rwa [he,hratio] at hh

/-- The noncoprime extension: the exact density and circle value are those of
the gap lengths divided by their greatest common divisor. -/
theorem nonmixed_gap_density_general (a b k m : ℤ)
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) :
    packingDensity a b k m = formula (a/(Int.gcd a b : ℤ)) (b/(Int.gcd a b : ℤ)) k m ∧
    circleValue a b k m = formula (a/(Int.gcd a b : ℤ)) (b/(Int.gcd a b : ℤ)) k m := by
  have hgN := Int.gcd_pos_of_ne_zero_left b (ne_of_gt ha)
  let g : ℤ := Int.gcd a b
  have hg : 0 < g := by dsimp [g]; exact_mod_cast hgN
  obtain ⟨a',b',hcop,ha',hb'⟩ := Int.exists_gcd_one hgN
  have hea : a=g*a' := by dsimp [g]; nlinarith only [ha']
  have heb : b=g*b' := by dsimp [g]; nlinarith only [hb']
  have ha'p : 0 < a' := by rw [hea] at ha; exact pos_of_mul_pos_right ha (le_of_lt hg)
  have hb'p : 0 < b' := by rw [heb] at hb; exact pos_of_mul_pos_right hb (le_of_lt hg)
  have hca : a/(Int.gcd a b : ℤ)=a' := by
    change a/g=a'
    rw [hea,Int.mul_ediv_cancel_left _ (ne_of_gt hg)]
  have hcb : b/(Int.gcd a b : ℤ)=b' := by
    change b/g=b'
    rw [heb,Int.mul_ediv_cancel_left _ (ne_of_gt hg)]
  rw [hca,hcb]
  have hcop' := Int.isCoprime_iff_gcd_eq_one.mpr hcop
  constructor
  · rw [hea,heb]
    exact scaled_packingDensity hg ha'p hb'p hk hm hcop'
  · rw [hea,heb]
    exact scaled_circleValue hg ha'p hb'p hk hm hcop'

theorem nonmixed_gap_general_periodic_optimum (a b k m : ℤ)
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) :
    ∃ (A : Set ℤ) (P : ℤ), 0 < P ∧ IsPeriodic A P ∧ Packs A (tile a b k m) ∧
      upperDensity A = packingDensity a b k m := by
  have hgN := Int.gcd_pos_of_ne_zero_left b (ne_of_gt ha)
  let g : ℤ := Int.gcd a b
  have hg : 0 < g := by dsimp [g]; exact_mod_cast hgN
  obtain ⟨a',b',hcop,ha',hb'⟩ := Int.exists_gcd_one hgN
  have hea : a=g*a' := by dsimp [g]; nlinarith only [ha']
  have heb : b=g*b' := by dsimp [g]; nlinarith only [hb']
  have ha'p : 0 < a' := by rw [hea] at ha; exact pos_of_mul_pos_right ha (le_of_lt hg)
  have hb'p : 0 < b' := by rw [heb] at hb; exact pos_of_mul_pos_right hb (le_of_lt hg)
  have hcop' := Int.isCoprime_iff_gcd_eq_one.mpr hcop
  obtain ⟨A,P,hP,hperiod,hpack,hvalue⟩ := nonmixed_gap_periodic_optimum a' b' k m ha'p hb'p hk hm hcop'
  have hA := (packs_iff_avoids ha'p hb'p (le_of_lt hk) (le_of_lt hm)).mp hpack
  refine ⟨blowUp A g,g*P,mul_pos hg hP,blowUp_periodic hg hperiod,?_,?_⟩
  · apply (packs_iff_avoids ha hb (le_of_lt hk) (le_of_lt hm)).mpr
    rw [hea,heb]
    exact avoids_blowUp hg hA
  · rw [blowUp_upperDensity hg hP hperiod,hvalue,hea,heb]
    exact (scaled_packingDensity hg ha'p hb'p hk hm hcop').symm

theorem example_five_three_two_two :
    packingDensity 5 3 2 2 = 3/19 ∧ circleValue 5 3 2 2 = 3/19 := by
  have hh := nonmixed_gap_density 5 3 2 2 (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (Int.isCoprime_iff_gcd_eq_one.mpr (by decide))
  norm_num [formula] at hh ⊢
  exact hh

theorem example_five_three_two_two_packing :
    Packs {t : ℤ | t%19 < 3} (tile 5 3 2 2) ∧
      upperDensity {t : ℤ | t%19 < 3} = 3/19 := by
  have hcert : CharacterCertificate 5 3 2 2 19 1 3 := by
    refine ⟨by norm_num,by norm_num,by norm_num,by decide,?_⟩
    intro i j hi hik hj hjm hij
    have hlo : 0 ≤ i*5+j*3 := by omega
    have hhi : i*5+j*3 < 19 := by omega
    rw [one_mul,Int.emod_eq_of_lt hlo hhi]
    constructor <;> omega
  obtain ⟨hA,hdensity⟩ := hcert.packing
  have he : modularWindow 19 1 3 = {t : ℤ | t%19 < 3} := by
    ext t
    simp only [modularWindow,Set.mem_ofPred_eq,one_mul]
  rw [he] at hA hdensity
  exact ⟨(packs_iff_avoids (by norm_num) (by norm_num) (by norm_num) (by norm_num)).mpr hA,
    hdensity⟩

end NonmixedGap
