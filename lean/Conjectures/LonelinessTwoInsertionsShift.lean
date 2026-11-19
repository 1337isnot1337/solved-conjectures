import Conjectures.LonelinessTwoInsertionsDivisibility

/-! Explicit perturbed reciprocal times finish the unbounded-speed argument
when the first speed is below twice the old runner count. -/

namespace Loneliness.TwoInsertions

theorem central_speed_window (p c : ℕ) (hp : 3 ≤ p) (hc : 0 < c)
    (hdiv : p+1 ∣ c) (hbound : p*(p+1) ≤ c) : TwoSpeedWindow p p c := by
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  have hp3 : (3 : ℝ) ≤ p := by exact_mod_cast hp
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hr : (0 : ℝ) < p+1 := by positivity
  have hq : (0 : ℝ) < p+2 := by positivity
  have hboundR : (p : ℝ)*(p+1) ≤ c := by exact_mod_cast hbound
  have hhalf : 1/(p+2 : ℝ) ≤ 1/2 :=
    one_div_le_one_div_of_le (by norm_num) (by linarith)
  have hbase : 1/(p+1 : ℝ) ≤ 1/2 :=
    one_div_le_one_div_of_le (by norm_num) (by linarith)
  have hshift : (p : ℝ)/((p+2 : ℝ)*(c : ℝ)) ≤
      1/((p+1 : ℝ)*(p+2 : ℝ)) := by
    apply (div_le_div_iff₀ (mul_pos hq hcR) (mul_pos hr hq)).mpr
    have hm := mul_le_mul_of_nonneg_left hboundR hq.le
    nlinarith
  have hgap : 1/(p+1 : ℝ)-1/(p+2 : ℝ) =
      1/((p+1 : ℝ)*(p+2 : ℝ)) := by
    field_simp [hr.ne', hq.ne']; ring
  let t : ℝ := 1/(p+1 : ℝ)+1/((p+2 : ℝ)*(c : ℝ))
  have hbt : (p : ℝ)*t = 1-1/(p+1 : ℝ)+
      (p : ℝ)/((p+2 : ℝ)*(c : ℝ)) := by
    dsimp [t]
    field_simp [hr.ne', hq.ne', hcR.ne']; ring
  have hblo : 1/(p+2 : ℝ) ≤ (p : ℝ)*t := by
    have hn : (0 : ℝ) ≤ (p : ℝ)/((p+2 : ℝ)*(c : ℝ)) := by positivity
    linarith
  have hbhi : (p : ℝ)*t ≤ 1-1/(p+2 : ℝ) := by linarith
  obtain ⟨k, hk⟩ := hdiv
  have hkR : (c : ℝ) = (p+1 : ℝ)*(k : ℝ) := by exact_mod_cast hk
  have hck : (c : ℝ)/(p+1 : ℝ) = k := by
    apply (div_eq_iff hr.ne').mpr
    nlinarith
  have hct : (c : ℝ)*t = (k : ℝ)+1/(p+2 : ℝ) := by
    calc
      (c : ℝ)*t = (c : ℝ)/(p+1 : ℝ)+1/(p+2 : ℝ) := by
        dsimp [t]
        field_simp [hr.ne', hq.ne', hcR.ne']
      _ = _ := by rw [hck]
  refine ⟨t, ⟨?_, ?_⟩, ?_, ?_⟩
  · have hrecip : 1/(p+2 : ℝ) ≤ 1/(p+1 : ℝ) :=
      one_div_le_one_div_of_le hr (by linarith)
    dsimp [t]
    have hn : (0 : ℝ) ≤ 1/((p+2 : ℝ)*(c : ℝ)) := by positivity
    linarith
  · apply (le_div_iff₀ hpR).mpr
    have hδ : (0 : ℝ) ≤ 1/(p+2 : ℝ) := by positivity
    nlinarith
  · apply distance_lower_of_cell (k := 0)
    · simpa using hblo
    · simpa using hbhi
  · apply distance_lower_of_cell (k := (k : ℤ))
    · norm_num only [Int.cast_natCast]
      linarith
    · norm_num only [Int.cast_natCast]
      linarith

theorem shifted_left_window (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b)
    (hc : 0 < c) (hdiv : p ∣ c) (hnot : ¬ p ∣ b) (hbound : p*b ≤ 2*c) :
    TwoSpeedWindow p b c := by
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  have hp3 : (3 : ℝ) ≤ p := by exact_mod_cast hp
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hq : (0 : ℝ) < p+2 := by positivity
  have hboundR : (p : ℝ)*(b : ℝ) ≤ 2*(c : ℝ) := by exact_mod_cast hbound
  have hpc : p ≤ 2*c := by nlinarith
  have hpcR : (p : ℝ) ≤ 2*(c : ℝ) := by exact_mod_cast hpc
  have hgap : 1/(p : ℝ)-1/(p+2 : ℝ) = 2/((p : ℝ)*(p+2)) := by
    field_simp [hpR.ne', hq.ne']; ring
  have hstep : 1/((p+2 : ℝ)*(c : ℝ)) ≤ 2/((p : ℝ)*(p+2)) := by
    apply (div_le_div_iff₀ (mul_pos hq hcR) (mul_pos hpR hq)).mpr
    nlinarith [mul_le_mul_of_nonneg_left hpcR hq.le]
  have hmove : (b : ℝ)/((p+2 : ℝ)*(c : ℝ)) ≤
      2/((p : ℝ)*(p+2)) := by
    apply (div_le_div_iff₀ (mul_pos hq hcR) (mul_pos hpR hq)).mpr
    nlinarith [mul_le_mul_of_nonneg_left hboundR hq.le]
  let t : ℝ := 1/(p : ℝ)-1/((p+2 : ℝ)*(c : ℝ))
  have hdiff : (b : ℝ)/(p : ℝ)-(b : ℝ)*t =
      (b : ℝ)/((p+2 : ℝ)*(c : ℝ)) := by
    dsimp [t]
    ring
  have hdist : 1/(p : ℝ) ≤ distance ((b : ℝ)/(p : ℝ)) :=
    reciprocal_residue_lower b p (by omega) hnot
  have hclose := distance_le_add ((b : ℝ)/(p : ℝ)) ((b : ℝ)*t)
  rw [hdiff, abs_of_nonneg (by positivity)] at hclose
  obtain ⟨k, hk⟩ := hdiv
  have hkR : (c : ℝ) = (p : ℝ)*(k : ℝ) := by exact_mod_cast hk
  have hck : (c : ℝ)/(p : ℝ) = k := by
    apply (div_eq_iff hpR.ne').mpr
    nlinarith
  have hct : (c : ℝ)*t = (k : ℝ)-1/(p+2 : ℝ) := by
    calc
      (c : ℝ)*t = (c : ℝ)/(p : ℝ)-1/(p+2 : ℝ) := by
        dsimp [t]
        field_simp [hpR.ne', hq.ne', hcR.ne']
      _ = _ := by rw [hck]
  refine ⟨t, ⟨?_, ?_⟩, ?_, ?_⟩
  · dsimp [t]
    linarith
  · dsimp [t]
    have hn : (0 : ℝ) ≤ 1/((p+2 : ℝ)*(c : ℝ)) := by positivity
    linarith
  · linarith
  · rw [hct]
    have heq : distance ((k : ℝ)-1/(p+2 : ℝ)) = distance (1/(p+2 : ℝ)) := by
      simpa only [Int.cast_natCast] using distance_int_sub (k : ℤ) (1/(p+2 : ℝ))
    rw [heq]
    apply distance_lower_of_cell (k := 0)
    · simp
    · have hhalf : 1/(p+2 : ℝ) ≤ 1/2 :=
        one_div_le_one_div_of_le (by norm_num) (by linarith)
      norm_num only [Int.cast_zero, sub_zero]
      linarith

theorem noncentral_divisibility_bound (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b)
    (hbc : b ≤ c) (hsmall : b < 2*p) (hne : b ≠ p)
    (hfail : ¬ TwoSpeedWindow p b c) : ¬ p ∣ b ∧ p ∣ c ∧ p*b ≤ 2*c := by
  have hp0 : 0 < p := by omega
  have hc : 0 < c := hb.trans_le hbc
  have hnot : ¬ p ∣ b := fun hd => hne (divisor_eq_below_twice p b hp0 hb hsmall hd)
  have hdiv := failed_endpoints_divisibility p b c hp hfail
  have hpc : p ∣ c := (hdiv p le_rfl (by omega)).resolve_left hnot
  refine ⟨hnot, hpc, ?_⟩
  by_cases hnext : b = p+1
  · have hbound := failed_endpoints_large_second p b c hp hb hbc hfail
    subst b
    nlinarith
  · have hnotnext : ¬ p+1 ∣ b := by
      intro hd
      exact hnext (divisor_eq_below_twice (p+1) b (by omega) hb (by omega) hd)
    have hnextc : p+1 ∣ c := (hdiv (p+1) (by omega) (by omega)).resolve_left hnotnext
    have hbound := consecutive_divisors_product_le p c hc hpc hnextc
    nlinarith

theorem large_parameter_window (p b c : ℕ) (hp : 11 ≤ p) (hb : 0 < b)
    (hbc : b ≤ c) : TwoSpeedWindow p b c := by
  by_contra hfail
  have hp3 : 3 ≤ p := by omega
  have hc : 0 < c := hb.trans_le hbc
  have hpR : (11 : ℝ) ≤ p := by exact_mod_cast hp
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hq : (0 : ℝ) < p+2 := by positivity
  by_cases hbig : 2*p ≤ b
  · have hbp : (p : ℝ)/(b : ℝ) ≤ 1/2 := by
      apply (div_le_iff₀ hbR).mpr
      have hbigR : (2 : ℝ)*p ≤ b := by exact_mod_cast hbig
      linarith
    have hbound := failed_endpoints_large_second p b c hp3 hb hbc hfail
    have hcp : (p : ℝ)/(c : ℝ) ≤ 2/(p+2 : ℝ) := by
      apply (div_le_div_iff₀ hcR hq).mpr
      exact_mod_cast hbound
    have hstrict : 6/(p+2 : ℝ) < 1/2 := by
      apply (div_lt_iff₀ hq).mpr
      linarith
    apply hfail (window_of_measure p b c hp3 hb hc ?_)
    have heq : 4/(p+2 : ℝ)+2/(p+2 : ℝ) = 6/(p+2 : ℝ) := by ring
    linarith
  · have hsmall : b < 2*p := by omega
    by_cases hcentral : b = p
    · subst b
      have hdiv := failed_endpoints_divisibility p p c hp3 hfail
      have h₁ : p+1 ∣ c := (hdiv (p+1) (by omega) (by omega)).resolve_left (by
        intro hd
        have hle := Nat.le_of_dvd (show 0 < p by omega) hd
        omega)
      have h₂ : p+2 ∣ c := (hdiv (p+2) (by omega) le_rfl).resolve_left (by
        intro hd
        have hle := Nat.le_of_dvd (show 0 < p by omega) hd
        omega)
      have hbound := consecutive_divisors_product_le (p+1) c hc h₁
        (by simpa only [Nat.add_assoc] using h₂)
      exact hfail (central_speed_window p c hp3 hc h₁ (by nlinarith))
    · obtain ⟨hnot, hpc, hbound⟩ :=
        noncentral_divisibility_bound p b c hp3 hb hbc hsmall hcentral hfail
      exact hfail (shifted_left_window p b c hp3 hb hc hpc hnot hbound)

end Loneliness.TwoInsertions
