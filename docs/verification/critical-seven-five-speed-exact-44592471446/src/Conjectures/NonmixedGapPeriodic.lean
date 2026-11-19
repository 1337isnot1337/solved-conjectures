import Conjectures.NonmixedGapDensity
import Mathlib.RingTheory.Coprime.Lemmas
import Mathlib.Tactic.FieldSimp

namespace NonmixedGap

theorem count_translate (A : Set ℤ) (c u v : ℤ) :
    count {t | c+t ∈ A} u v = count A (c+u) (c+v) := by
  classical
  unfold count
  apply Finset.card_bij (fun t _ => c+t)
  · intro t ht
    obtain ⟨htu,htv,htA⟩ := mem_occupied.mp ht
    exact mem_occupied.mpr ⟨by omega,by omega,htA⟩
  · intro t ht t' ht' he
    omega
  · intro t ht
    obtain ⟨htu,htv,htA⟩ := mem_occupied.mp ht
    refine ⟨t-c,?_,by omega⟩
    apply mem_occupied.mpr
    refine ⟨by omega,by omega,?_⟩
    change c+(t-c) ∈ A
    simpa only [add_sub_cancel] using htA

def modularWindow (P p H : ℤ) : Set ℤ := {t | (p*t)%P < H}

theorem window_periodic (P p H : ℤ) : IsPeriodic (modularWindow P p H) P := by
  intro t
  change (p*(t+P))%P < H ↔ (p*t)%P < H
  rw [mul_add,Int.add_mul_emod_self_right]

theorem inv_mul_mod {P p U V : ℤ} (hbez : U*p+V*P=1) (x : ℤ) :
    (U*((p*x)%P))%P = x%P := by
  have hunit : U*p ≡ 1 [ZMOD P] := by
    apply Int.modEq_of_dvd
    refine ⟨V,?_⟩
    nlinarith only [hbez]
  have hh := hunit.mul_right x
  change (U*((p*x)%P))%P = x%P
  calc
    _ = (U*(p*x))%P := by simp only [Int.mul_emod,Int.emod_emod]
    _ = ((U*p)*x)%P := by congr 1; ring
    _ = x%P := by simpa only [Int.ModEq,one_mul] using hh

/-- Coprime modular multiplication permutes the residue interval. -/
theorem window_count {P p H U V : ℤ} (hP : 0 < P) (hH : 0 ≤ H) (hHP : H ≤ P)
    (hbez : U*p+V*P=1) : (count (modularWindow P p H) 0 P : ℤ) = H := by
  classical
  have hcard : count (modularWindow P p H) 0 P = (Finset.Ico 0 H).card := by
    unfold count
    apply Finset.card_bij (fun t _ => (p*t)%P)
    · intro t ht
      obtain ⟨ht0,htP,htW⟩ := mem_occupied.mp ht
      exact Finset.mem_Ico.mpr ⟨Int.emod_nonneg _ (ne_of_gt hP),htW⟩
    · intro t ht t' ht' he
      obtain ⟨ht0,htP,_⟩ := mem_occupied.mp ht
      obtain ⟨ht'0,ht'P,_⟩ := mem_occupied.mp ht'
      have hh := congrArg (fun z => (U*z)%P) he
      rw [inv_mul_mod hbez,inv_mul_mod hbez,Int.emod_eq_of_lt ht0 htP,
        Int.emod_eq_of_lt ht'0 ht'P] at hh
      exact hh
    · intro r hr
      obtain ⟨hr0,hrH⟩ := Finset.mem_Ico.mp hr
      have hrP : r < P := lt_of_lt_of_le hrH hHP
      have hbez' : p*U+V*P=1 := by nlinarith only [hbez]
      have hinv : (p*((U*r)%P))%P = r := by
        rw [inv_mul_mod hbez',Int.emod_eq_of_lt hr0 hrP]
      refine ⟨(U*r)%P,?_,hinv⟩
      apply mem_occupied.mpr
      refine ⟨Int.emod_nonneg _ (ne_of_gt hP),Int.emod_lt_of_pos _ hP,?_⟩
      change (p*((U*r)%P))%P < H
      rw [hinv]
      exact hrH
  rw [hcard,Int.card_Ico_of_le 0 H hH,sub_zero]

theorem window_upperDensity {P p H U V : ℤ} (hP : 0 < P) (hH : 0 ≤ H) (hHP : H ≤ P)
    (hbez : U*p+V*P=1) : upperDensity (modularWindow P p H) = (H:ℝ)/(P:ℝ) := by
  rw [periodic_upperDensity hP (window_periodic P p H)]
  have hc := window_count hP hH hHP hbez
  have hcR : (count (modularWindow P p H) 0 P : ℝ) = H := by exact_mod_cast hc
  rw [hcR]

/-- If a forbidden step lands outside the two end windows, its two endpoints
cannot both lie in the character packing. -/
theorem window_avoids_step {P p H d t : ℤ} (hP : 0 < P)
    (hdlo : H ≤ (p*d)%P) (hdhi : (p*d)%P ≤ P-H)
    (ht : t ∈ modularWindow P p H) : t+d ∉ modularWindow P p H := by
  intro htd
  change (p*t)%P < H at ht
  change (p*(t+d))%P < H at htd
  have hx0 := Int.emod_nonneg (p*t) (ne_of_gt hP)
  have hy0 := Int.emod_nonneg (p*(t+d)) (ne_of_gt hP)
  have hd0 := Int.emod_nonneg (p*d) (ne_of_gt hP)
  have hdP := Int.emod_lt_of_pos (p*d) hP
  have hxy : (p*(t+d))%P = ((p*t)%P+(p*d)%P)%P := by
    rw [mul_add,Int.add_emod]
  have hsum : (p*t)%P+(p*d)%P < P := by omega
  rw [hxy,Int.emod_eq_of_lt (by omega) hsum] at htd
  omega

theorem gcd_dvd_residue (P p d : ℤ) : (Int.gcd p P : ℤ) ∣ (p*d)%P := by
  have hg1 := Int.gcd_dvd_left p P
  have hg2 := Int.gcd_dvd_right p P
  rw [Int.emod_def]
  exact dvd_sub (dvd_mul_of_dvd_left hg1 d) (dvd_mul_of_dvd_left hg2 ((p*d)/P))

theorem gcd_dvd_distance_numerator (P p d : ℤ) :
    (Int.gcd p P : ℤ) ∣ min ((p*d)%P) (P-(p*d)%P) := by
  have h1 := gcd_dvd_residue P p d
  have h2 := dvd_sub (Int.gcd_dvd_right p P) h1
  by_cases h : (p*d)%P ≤ P-(p*d)%P
  · rwa [min_eq_left h]
  · rwa [min_eq_right (le_of_lt (lt_of_not_ge h))]

/-- A nonprimitive character has the same density formula whenever its kernel
size divides the window length. This includes the explicit optimal character. -/
theorem window_upperDensity_of_gcd_dvd {P p H : ℤ}
    (hP : 0 < P) (hH : 0 ≤ H) (hHP : H ≤ P)
    (hgH : (Int.gcd p P : ℤ) ∣ H) :
    upperDensity (modularWindow P p H) = (H:ℝ)/(P:ℝ) := by
  have hg : 0 < Int.gcd p P := Int.gcd_pos_of_ne_zero_right p (ne_of_gt hP)
  let g : ℤ := Int.gcd p P
  have hgZ : 0 < g := by dsimp [g]; exact_mod_cast hg
  obtain ⟨p',P',hcop,hp',hP'⟩ := Int.exists_gcd_one hg
  change p = p'*g at hp'
  change P = P'*g at hP'
  obtain ⟨H',hH'⟩ := hgH
  change H = g*H' at hH'
  have hPpos : 0 < P' := by
    apply pos_of_mul_pos_left (b:=g)
    · simpa only [←hP'] using hP
    · exact le_of_lt hgZ
  have hHnonneg : 0 ≤ H' := by
    apply (mul_nonneg_iff_of_pos_left hgZ).mp
    rwa [←hH']
  have hHP' : H' ≤ P' := by
    apply (mul_le_mul_iff_of_pos_left hgZ).mp
    nlinarith only [hHP,hH',hP']
  obtain ⟨U,V,hbez⟩ := Int.isCoprime_iff_gcd_eq_one.mpr hcop
  have hmod : ∀ x : ℤ, (p*x)%P = g*((p'*x)%P') := by
    intro x
    rw [hp',hP']
    calc
      (p'*g*x)%(P'*g) = (g*(p'*x))%(g*P') := by congr 1 <;> ring
      _ = g*((p'*x)%P') := Int.mul_emod_mul_of_pos _ _ hgZ
  have hsets : modularWindow P p H = modularWindow P' p' H' := by
    ext x
    change (p*x)%P < H ↔ (p'*x)%P' < H'
    rw [hmod,hH',mul_lt_mul_iff_of_pos_left hgZ]
  rw [hsets,window_upperDensity hPpos hHnonneg hHP' hbez,hH',hP']
  push_cast
  have hgR : (g:ℝ) ≠ 0 := by exact_mod_cast (ne_of_gt hgZ)
  field_simp

end NonmixedGap
