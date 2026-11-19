import Conjectures.NonmixedGapUpper

namespace NonmixedGap

structure CharacterCertificate (a b k m P p H : ℤ) : Prop where
  period_pos : 0 < P
  window_nonneg : 0 ≤ H
  window_half : 2*H ≤ P
  kernel_divides : (Int.gcd p P : ℤ) ∣ H
  separated : ∀ i j : ℤ, 0 ≤ i → i ≤ k → 0 ≤ j → j ≤ m → 0 < i+j →
    H ≤ (p*(i*a+j*b))%P ∧ (p*(i*a+j*b))%P ≤ P-H

theorem CharacterCertificate.swap {a b k m P p H : ℤ}
    (h : CharacterCertificate a b k m P p H) : CharacterCertificate b a m k P p H where
  period_pos := h.period_pos
  window_nonneg := h.window_nonneg
  window_half := h.window_half
  kernel_divides := h.kernel_divides
  separated := by
    intro i j hi him hj hjk hij
    simpa only [add_comm,mul_comm] using h.separated j i hj hjk hi him (by omega)

theorem CharacterCertificate.packing {a b k m P p H : ℤ}
    (h : CharacterCertificate a b k m P p H) :
    Avoids (modularWindow P p H) a b k m ∧
      upperDensity (modularWindow P p H) = (H:ℝ)/(P:ℝ) := by
  constructor
  · intro t ht i j hi hik hj hjm hij
    obtain ⟨hlo,hhi⟩ := h.separated i j hi hik hj hjm hij
    exact window_avoids_step h.period_pos hlo hhi ht
  · exact window_upperDensity_of_gcd_dvd h.period_pos h.window_nonneg
      (by have := h.window_half; have := h.window_nonneg; omega) h.kernel_divides

/-- Bezout's identity constructs the optimal character in the first remainder
branch. This includes remainder zero and permits either order of the gap lengths. -/
theorem first_character {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) (hrm : r ≤ m) :
    ∃ p : ℤ, CharacterCertificate a b k m (k*a+(m+1)*b) p (b+k*d) := by
  let H := b+k*d
  let P := k*a+(m+1)*b
  let p := U*(H+r)+V*H
  have hH : 0 < H := by
    simpa only [numerator,hrm,ite_true] using numerator_pos ha hb hk hm heq hr0 hrs
  have hP : 0 < P := by dsimp [P]; positivity
  obtain ⟨hid1,hid2,_,_⟩ := branch_identities a b k m d r heq
  change P = (k+m+1)*H+k*r at hid1
  change a*H-b*(H+r) = d*P at hid2
  have hhalf : 2*H ≤ P := by
    have hprod := mul_le_mul_of_nonneg_right (show 2 ≤ k+m+1 by omega) (le_of_lt hH)
    have hkr : 0 ≤ k*r := mul_nonneg (le_of_lt hk) hr0
    nlinarith only [hid1,hprod,hkr]
  have haEq : a*p-(H+r) = V*d*P := by
    calc
      a*p-(H+r) = a*(U*(H+r)+V*H)-(U*a+V*b)*(H+r) := by rw [hbez]; simp only [one_mul,p]
      _ = V*(a*H-b*(H+r)) := by ring
      _ = V*d*P := by rw [hid2]; ring
  have hbEq : b*p-H = -U*d*P := by
    calc
      b*p-H = b*(U*(H+r)+V*H)-(U*a+V*b)*H := by rw [hbez]; simp only [one_mul,p]
      _ = -U*(a*H-b*(H+r)) := by ring
      _ = -U*d*P := by rw [hid2]; ring
  have haMod : p*a ≡ H+r [ZMOD P] := by
    apply Int.modEq_of_dvd
    refine ⟨-V*d,?_⟩
    nlinarith only [haEq]
  have hbMod : p*b ≡ H [ZMOD P] := by
    apply Int.modEq_of_dvd
    refine ⟨U*d,?_⟩
    nlinarith only [hbEq]
  have hrep : ∀ i j : ℤ, 0 ≤ i → i ≤ k → 0 ≤ j → j ≤ m → 0 < i+j →
      (p*(i*a+j*b))%P = (i+j)*H+i*r ∧ H ≤ (i+j)*H+i*r ∧ (i+j)*H+i*r ≤ P-H := by
    intro i j hi hik hj hjm hij
    have hl1 := mul_le_mul_of_nonneg_right (show 1 ≤ i+j by omega) (le_of_lt hH)
    have hl2 := mul_nonneg hi hr0
    have hu1 := mul_le_mul_of_nonneg_right (show i+j ≤ k+m by omega) (le_of_lt hH)
    have hu2 := mul_le_mul_of_nonneg_right hik hr0
    have hlo : H ≤ (i+j)*H+i*r := by nlinarith only [hl1,hl2]
    have hhi : (i+j)*H+i*r ≤ P-H := by nlinarith only [hu1,hu2,hid1]
    have hres0 : 0 ≤ (i+j)*H+i*r := by omega
    have hresP : (i+j)*H+i*r < P := by omega
    have hmod := (haMod.mul_left i).add (hbMod.mul_left j)
    have hmod' : (p*(i*a+j*b))%P = ((i+j)*H+i*r)%P := by
      change (i*(p*a)+j*(p*b))%P = (i*(H+r)+j*H)%P at hmod
      convert hmod using 1 <;> congr 1 <;> ring
    rw [Int.emod_eq_of_lt hres0 hresP] at hmod'
    exact ⟨hmod',hlo,hhi⟩
  have hbResidue : (p*b)%P = H := by
    simpa using (hrep 0 1 (by omega) (by omega) (by omega) (by omega) (by omega)).1
  refine ⟨p,?_⟩
  change CharacterCertificate a b k m P p H
  refine ⟨hP,le_of_lt hH,hhalf,?_,?_⟩
  · rw [←hbResidue]
    exact gcd_dvd_residue P p b
  · intro i j hi hik hj hjm hij
    obtain ⟨hres,hlo,hhi⟩ := hrep i j hi hik hj hjm hij
    exact ⟨by rwa [hres],by rwa [hres]⟩

theorem optimal_character {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    ∃ P p H : ℤ, CharacterCertificate a b k m P p H ∧
      (H:ℝ)/(P:ℝ) = densityValue a b k m d r := by
  by_cases hrm : r ≤ m
  · obtain ⟨p,hp⟩ := first_character ha hb hk hm hbez heq hr0 hrs hrm
    exact ⟨_,p,_,hp,by simp only [densityValue,numerator,denominator,hrm,ite_true]⟩
  · have hbez' : V*b+U*a=1 := by nlinarith only [hbez]
    have heq' := swap_remainder a b k m d r heq
    have hrp : 0 < r := by omega
    have hr' : 0 ≤ m+k+1-r := by omega
    have hrs' : m+k+1-r < m+k+1 := by omega
    have hrk : m+k+1-r ≤ k := by omega
    obtain ⟨p,hp⟩ := first_character hb ha hm hk hbez' heq' hr' hrs' hrk
    refine ⟨m*b+(k+1)*a,p,a+m*(-d-1),hp.swap,?_⟩
    have he : a+m*(-d-1) = a-m*(d+1) := by ring
    have he' : m*b+(k+1)*a = (k+1)*a+m*b := by ring
    simp only [densityValue,numerator,denominator,hrm,ite_false,he,he']

/-- An explicit periodic packing attains the stated bound for every parameter. -/
theorem exists_optimal_packing {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    ∃ (A : Set ℤ) (P : ℤ), 0 < P ∧ IsPeriodic A P ∧ Avoids A a b k m ∧
      upperDensity A = densityValue a b k m d r := by
  obtain ⟨P,p,H,hcert,hratio⟩ := optimal_character ha hb hk hm hbez heq hr0 hrs
  obtain ⟨hA,hdensity⟩ := hcert.packing
  exact ⟨modularWindow P p H,P,hcert.period_pos,window_periodic P p H,hA,hdensity.trans hratio⟩

/-- Exact all-parameter packing density, including arbitrary nonperiodic sets. -/
theorem packingDensity_eq {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    packingDensity a b k m = densityValue a b k m d r := by
  apply le_antisymm (packingDensity_le ha hb hk hm hbez heq hr0 hrs)
  obtain ⟨A,P,hP,hperiod,hA,hdensity⟩ := exists_optimal_packing ha hb hk hm hbez heq hr0 hrs
  rw [←hdensity]
  exact le_packingDensity ha hb hk hm hbez heq hr0 hrs hA

end NonmixedGap
