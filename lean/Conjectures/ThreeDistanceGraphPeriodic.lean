import Conjectures.ThreeDistanceGraphTheorem

namespace ThreeDistanceGraph

theorem gap_window (k s : ℕ) {P m H : ℤ} (hP : 0 < P) (hH : 0 ≤ H)
    (hHP : H ≤ P) (hdiv : (Int.gcd P m : ℤ) ∣ H)
    (h1 : H ≤ circularNorm P m) (h2 : H ≤ circularNorm P ((k:ℤ)*m))
    (h3 : H ≤ circularNorm P (((k:ℤ)+s)*m)) :
    NonmixedGap.IsPeriodic (NonmixedGap.modularWindow P m H) P ∧
      Loneliness.Packing.Avoids (gapSpeeds k s) (NonmixedGap.modularWindow P m H) ∧
      NonmixedGap.upperDensity (NonmixedGap.modularWindow P m H)=intRatio H P ∧
      NonmixedGap.lowerDensity (NonmixedGap.modularWindow P m H)=intRatio H P := by
  have hp := NonmixedGap.window_periodic P m H
  have hv := NonmixedGap.window_upperDensity_of_gcd_dvd (p:=m) hP hH hHP
    (by simpa only [Int.gcd_comm m P] using hdiv)
  refine ⟨hp,?_,hv,?_⟩
  · intro d hd t ht
    have hn : H ≤ circularNorm P ((d:ℤ)*m) := by
      simp only [gapSpeeds,List.mem_cons,List.not_mem_nil,or_false] at hd
      rcases hd with rfl | rfl | rfl
      · simpa using h1
      · exact h2
      · simpa only [Nat.cast_add] using h3
    have hlo : H ≤ (m*(d:ℤ))%P := by
      have hh := hn.trans (min_le_left _ _)
      simpa only [mul_comm] using hh
    have hhi : (m*(d:ℤ))%P ≤ P-H := by
      have hh := hn.trans (min_le_right _ _)
      rw [mul_comm (d:ℤ) m] at hh
      omega
    exact NonmixedGap.window_avoids_step hP hlo hhi ht
  · rw [NonmixedGap.periodic_lowerDensity hP hp,←NonmixedGap.periodic_upperDensity hP hp]
    exact hv

/-- The literal modular-window construction in each normal table branch. -/
theorem normal_window (k s : ℕ) {P H C K : ℤ}
    (hP : P=(k:ℤ)+s+1) (hH : 0 < H) (hC : 0 ≤ C)
    (hrel : ((s:ℤ)+2)*H=K*P-C) (hfits : 2*H+C ≤ P) :
    NonmixedGap.IsPeriodic (NonmixedGap.modularWindow P H H) P ∧
      Loneliness.Packing.Avoids (gapSpeeds k s) (NonmixedGap.modularWindow P H H) ∧
      NonmixedGap.upperDensity (NonmixedGap.modularWindow P H H)=intRatio H P ∧
      NonmixedGap.lowerDensity (NonmixedGap.modularWindow P H H)=intRatio H P := by
  have hpos : 0 < P := by omega
  have hn : H ≤ circularNorm P H :=
    circularNorm_lower hpos hH (le_refl H) (by omega) rfl
  apply gap_window k s hpos (by omega) (by omega) (Int.gcd_dvd_right P H) hn
  · have he : (k:ℤ)*H=H+C+(H-K)*P := by rw [hP] at hrel ⊢; nlinarith only [hrel]
    rw [he,circularNorm_add_mul]
    exact circularNorm_lower hpos hH (by omega) (by omega) rfl
  · have he : ((k:ℤ)+s)*H= -H+H*P := by rw [hP]; ring
    rw [he,circularNorm_add_mul,circularNorm_neg hpos]
    exact hn

/-- The literal character H+1 construction on the residue-three pair-sum
period.  The modular identity proves the required gcd divisibility directly. -/
theorem special_window (k s : ℕ) {P H z : ℤ}
    (hP : P=2*(k:ℤ)+s) (hH : 0 < H) (hfits : 2*H+1 ≤ P)
    (hrel : (k:ℤ)*(H+1)=H+z*P) :
    NonmixedGap.IsPeriodic (NonmixedGap.modularWindow P (H+1) H) P ∧
      Loneliness.Packing.Avoids (gapSpeeds k s) (NonmixedGap.modularWindow P (H+1) H) ∧
      NonmixedGap.upperDensity (NonmixedGap.modularWindow P (H+1) H)=intRatio H P ∧
      NonmixedGap.lowerDensity (NonmixedGap.modularWindow P (H+1) H)=intRatio H P := by
  have hpos : 0 < P := by omega
  have hn : H ≤ circularNorm P H :=
    circularNorm_lower hpos hH (le_refl H) (by omega) rfl
  have hdiv : (Int.gcd P (H+1) : ℤ) ∣ H := by
    have ha := dvd_mul_of_dvd_right (Int.gcd_dvd_right P (H+1)) (k:ℤ)
    have hb := dvd_mul_of_dvd_right (Int.gcd_dvd_left P (H+1)) z
    have hh := dvd_sub ha hb
    rwa [hrel,add_sub_cancel_right] at hh
  apply gap_window k s hpos (by omega) (by omega) hdiv
  · exact circularNorm_lower hpos hH (by omega) (by omega) rfl
  · rw [hrel,circularNorm_add_mul]
    exact hn
  · have he : ((k:ℤ)+s)*(H+1)= -H+(H+1-z)*P := by
      rw [hP] at hrel ⊢
      nlinarith only [hrel]
    rw [he,circularNorm_add_mul,circularNorm_neg hpos]
    exact hn

/-- The residue-one construction uses the fixed period s+2, independently
of the quotient j.  Taking H=3 or H=4 gives the two constant table branches. -/
theorem residue_one_window (s j : ℕ) {H : ℤ} (hH : 0 < H)
    (hfits : 2*H ≤ (s:ℤ)+2) :
    NonmixedGap.IsPeriodic (NonmixedGap.modularWindow ((s:ℤ)+2) H H) ((s:ℤ)+2) ∧
      Loneliness.Packing.Avoids (gapSpeeds ((s+2)*j+1) s)
        (NonmixedGap.modularWindow ((s:ℤ)+2) H H) ∧
      NonmixedGap.upperDensity (NonmixedGap.modularWindow ((s:ℤ)+2) H H)=
        intRatio H ((s:ℤ)+2) ∧
      NonmixedGap.lowerDensity (NonmixedGap.modularWindow ((s:ℤ)+2) H H)=
        intRatio H ((s:ℤ)+2) := by
  have hP : (0:ℤ)<(s:ℤ)+2 := by omega
  have hn : H ≤ circularNorm ((s:ℤ)+2) H :=
    circularNorm_lower hP hH (le_refl H) (by omega) rfl
  apply gap_window ((s+2)*j+1) s hP (by omega) (by omega)
    (Int.gcd_dvd_right ((s:ℤ)+2) H) hn
  · have he : (((s+2)*j+1:ℕ):ℤ)*H=H+((j:ℤ)*H)*((s:ℤ)+2) := by
      push_cast
      ring
    rw [he,circularNorm_add_mul]
    exact hn
  · have he : ((((s+2)*j+1:ℕ):ℤ)+s)*H= -H+(((j:ℤ)+1)*H)*((s:ℤ)+2) := by
      push_cast
      ring
    rw [he,circularNorm_add_mul,circularNorm_neg hP]
    exact hn

theorem gap_periodic_optimum (k s : ℕ) (hk : 0 < k) :
    ∃ P : ℤ, 0 < P ∧
      (P=(k:ℤ)+1 ∨ P=(k:ℤ)+s+1 ∨ P=2*(k:ℤ)+s) ∧
      ∃ A : Set ℤ, NonmixedGap.IsPeriodic A P ∧
        Loneliness.Packing.Avoids (gapSpeeds k s) A ∧
        NonmixedGap.upperDensity A=gapValue k s ∧
        NonmixedGap.lowerDensity A=gapValue k s := by
  let d : Fin 3 → ℕ := ![1,k,k+s]
  have hd : ∀ i, 0 < d i := by intro i; fin_cases i <;> simp [d] <;> omega
  obtain ⟨_,i,j,hij,hpos,A,hperiod,havoid,hvalue⟩ :=
    Haralambis.three_difference_theorem d hd
  have hpair : d i+d j=k+1 ∨ d i+d j=k+s+1 ∨ d i+d j=2*k+s := by
    fin_cases i <;> fin_cases j <;> simp [d] at hij ⊢ <;> omega
  have hP : (0:ℤ)<(d i+d j:ℕ) := by exact_mod_cast hpos
  have hval : NonmixedGap.upperDensity A=gapValue k s := by
    rw [Haralambis.density_eq_value d hd] at hvalue
    simpa [Haralambis.speeds,d,gapValue,gapSpeeds] using hvalue
  refine ⟨(d i+d j:ℕ),hP,?_,A,hperiod,?_,hval,?_⟩
  · rcases hpair with h | h | h
    · left; exact_mod_cast h
    · right; left; exact_mod_cast h
    · right; right; exact_mod_cast h
  · simpa [Haralambis.speeds,d,gapSpeeds] using havoid
  · rw [NonmixedGap.periodic_lowerDensity hP hperiod,
      ←NonmixedGap.periodic_upperDensity hP hperiod]
    exact hval

theorem gap_five_periodic_classification (k : ℕ) (hk : 0 < k) :
    ∃ P : ℤ, 0 < P ∧
      (P=(k:ℤ)+1 ∨ P=(k:ℤ)+6 ∨ P=2*(k:ℤ)+5) ∧
      ∃ A : Set ℤ, NonmixedGap.IsPeriodic A P ∧
        Loneliness.Packing.Avoids (gapSpeeds k 5) A ∧
        NonmixedGap.upperDensity A=fiveValue k ∧
        NonmixedGap.lowerDensity A=fiveValue k := by
  have h := gap_periodic_optimum k 5 hk
  rw [gap_five_all_value k hk] at h
  simpa only [Nat.cast_ofNat,show (5:ℤ)+1=6 by norm_num,add_assoc] using h

theorem gap_seven_periodic_classification (k : ℕ) (hk : 0 < k) :
    ∃ P : ℤ, 0 < P ∧
      (P=(k:ℤ)+1 ∨ P=(k:ℤ)+8 ∨ P=2*(k:ℤ)+7) ∧
      ∃ A : Set ℤ, NonmixedGap.IsPeriodic A P ∧
        Loneliness.Packing.Avoids (gapSpeeds k 7) A ∧
        NonmixedGap.upperDensity A=sevenValue k ∧
        NonmixedGap.lowerDensity A=sevenValue k := by
  have h := gap_periodic_optimum k 7 hk
  rw [gap_seven_all_value k hk] at h
  simpa only [Nat.cast_ofNat,show (7:ℤ)+1=8 by norm_num,add_assoc] using h

end ThreeDistanceGraph
