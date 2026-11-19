import Conjectures.ThreeDistanceGraphCircle
import Conjectures.HaralambisTheorem

namespace ThreeDistanceGraph

def gapSpeeds (k s : ℕ) : List ℕ := [1,k,k+s]
noncomputable def gapValue (k s : ℕ) : ℝ := Loneliness.value (gapSpeeds k s)
noncomputable def gapDensity (k s : ℕ) : ℝ := Loneliness.Packing.density (gapSpeeds k s)

theorem gap_density_eq_value (k s : ℕ) (hk : 0 < k) : gapDensity k s=gapValue k s := by
  have hh := Haralambis.density_eq_value (![1,k,k+s] : Fin 3 → ℕ)
    (by intro i; fin_cases i <;> simp <;> omega)
  simpa [gapDensity,gapValue,gapSpeeds,Haralambis.speeds] using hh

theorem pair_sum_grid (k s : ℕ) (hk : 0 < k) :
    (∃ m : ℤ, gapValue k s=Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(k+1:ℕ))) ∨
    (∃ m : ℤ, gapValue k s=Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(k+s+1:ℕ))) ∨
    (∃ m : ℤ, gapValue k s=Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(2*k+s:ℕ))) := by
  let d : Fin 3 → ℕ := ![1,k,k+s]
  have hd : ∀ i, 0 < d i := by intro i; fin_cases i <;> simp [d] <;> omega
  obtain ⟨i,j,hij,m,hm⟩ := Haralambis.pair_sum_maximum d hd
  have hden : d i+d j=k+1 ∨ d i+d j=k+s+1 ∨ d i+d j=2*k+s := by
    fin_cases i <;> fin_cases j <;> simp [d] at hij ⊢ <;> omega
  change gapValue k s=Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(d i+d j:ℕ)) at hm
  rcases hden with hden | hden | hden
  · exact Or.inl ⟨m,by rwa [hden] at hm⟩
  · exact Or.inr (Or.inl ⟨m,by rwa [hden] at hm⟩)
  · exact Or.inr (Or.inr ⟨m,by rwa [hden] at hm⟩)

theorem left_grid_norm (k s m : ℤ) :
    circularNorm (k+1) ((k+s)*m)=circularNorm (k+1) ((s-1)*m) := by
  have he : (k+s)*m=(s-1)*m+m*(k+1) := by ring
  rw [he,circularNorm_add_mul]

theorem middle_grid_norm (k s m : ℤ) (hP : 0 < k+s+1) :
    circularNorm (k+s+1) (k*m)=circularNorm (k+s+1) ((s+1)*m) := by
  have he : k*m= -((s+1)*m)+m*(k+s+1) := by ring
  rw [he,circularNorm_add_mul,circularNorm_neg hP]

theorem odd_half_character {P : ℤ} (hodd : P%2=1) (m : ℤ) :
    ∃ u : ℤ, (2*u)%P=m%P := by
  let q := (P+1)/2
  have hq : 2*q=P+1 := by dsimp [q]; omega
  refine ⟨q*m,?_⟩
  have he : 2*(q*m)=m+m*P := by nlinarith only [congrArg (fun x : ℤ => x*m) hq]
  rw [he,Int.add_mul_emod_self_right]

theorem last_grid_norm (k s m : ℤ) (hP : 0 < 2*k+s) (hs : s%2=1) :
    ∃ u : ℤ, circularNorm (2*k+s) m=circularNorm (2*k+s) (2*u) ∧
      circularNorm (2*k+s) (k*m)=circularNorm (2*k+s) (s*u) := by
  obtain ⟨u,hu⟩ := odd_half_character (P:=2*k+s) (by omega) m
  refine ⟨u,circularNorm_congr hu.symm,?_⟩
  calc
    _ = circularNorm (2*k+s) (k*(2*u)) := by
      apply circularNorm_congr
      rw [Int.mul_emod k m,Int.mul_emod k (2*u),hu]
    _ = circularNorm (2*k+s) (-(s*u)+u*(2*k+s)) := by congr 1; ring
    _ = circularNorm (2*k+s) (s*u) := by
      rw [circularNorm_add_mul,circularNorm_neg hP]

/-- Pair-sum attainment reduces the exact three-speed maximum to three
integer circular-distance bounds, with no enumeration depending on k. -/
theorem gap_upper_of_integer_bounds (k s : ℕ) (hk : 0 < k) (hs : (s:ℤ)%2=1) (r : ℝ)
    (hleft : ∀ m H : ℤ, H ≤ circularNorm (k+1) m →
      H ≤ circularNorm (k+1) (((s:ℤ)-1)*m) → (H:ℝ)/((k:ℤ)+1:ℤ) ≤ r)
    (hmiddle : ∀ m H : ℤ, H ≤ circularNorm ((k:ℤ)+s+1) m →
      H ≤ circularNorm ((k:ℤ)+s+1) (((s:ℤ)+1)*m) →
      (H:ℝ)/((k:ℤ)+s+1:ℤ) ≤ r)
    (hlast : ∀ u H : ℤ, H ≤ circularNorm (2*(k:ℤ)+s) (2*u) →
      H ≤ circularNorm (2*(k:ℤ)+s) ((s:ℤ)*u) →
      (H:ℝ)/(2*(k:ℤ)+s:ℤ) ≤ r) : gapValue k s ≤ r := by
  have hne : gapSpeeds k s ≠ [] := by simp [gapSpeeds]
  rcases pair_sum_grid k s hk with ⟨m,hm⟩ | ⟨m,hm⟩ | ⟨m,hm⟩
  · have hP : (0:ℤ) < (k:ℤ)+1 := by omega
    obtain ⟨H,_,he,hbound⟩ := clearance_grid_numerator (gapSpeeds k s) hne ((k:ℤ)+1) m hP
    have h1 := hbound 1 (by simp [gapSpeeds])
    have h3 := hbound (k+s) (by simp [gapSpeeds])
    simp only [Nat.cast_one,one_mul] at h1
    simp only [Nat.cast_add] at h3
    rw [left_grid_norm] at h3
    rw [hm]
    have he' : Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(k+1:ℕ))=(H:ℝ)/((k:ℤ)+1:ℤ) := by
      simpa only [Nat.cast_add,Nat.cast_one,Int.cast_add,Int.cast_natCast,Int.cast_one] using he
    rw [he']
    exact hleft m H h1 h3
  · have hP : (0:ℤ) < (k:ℤ)+s+1 := by omega
    obtain ⟨H,_,he,hbound⟩ := clearance_grid_numerator (gapSpeeds k s) hne ((k:ℤ)+s+1) m hP
    have h1 := hbound 1 (by simp [gapSpeeds])
    have h2 := hbound k (by simp [gapSpeeds])
    simp only [Nat.cast_one,one_mul] at h1
    rw [middle_grid_norm _ _ _ hP] at h2
    rw [hm]
    have he' : Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(k+s+1:ℕ))=(H:ℝ)/((k:ℤ)+s+1:ℤ) := by
      simpa only [Nat.cast_add,Nat.cast_one,Int.cast_add,Int.cast_natCast,Int.cast_one] using he
    rw [he']
    exact hmiddle m H h1 h2
  · have hP : (0:ℤ) < 2*(k:ℤ)+s := by omega
    obtain ⟨H,_,he,hbound⟩ := clearance_grid_numerator (gapSpeeds k s) hne (2*(k:ℤ)+s) m hP
    have h1 := hbound 1 (by simp [gapSpeeds])
    have h2 := hbound k (by simp [gapSpeeds])
    simp only [Nat.cast_one,one_mul] at h1
    obtain ⟨u,hu1,hu2⟩ := last_grid_norm k s m hP hs
    rw [hu1] at h1
    rw [hu2] at h2
    rw [hm]
    have he' : Loneliness.clearance (gapSpeeds k s) ((m:ℝ)/(2*k+s:ℕ))=(H:ℝ)/(2*(k:ℤ)+s:ℤ) := by
      simpa only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Int.cast_add,
        Int.cast_mul,Int.cast_natCast,Int.cast_ofNat] using he
    rw [he']
    exact hlast u H h1 h2

theorem ratio_le_of_linear {P H a b : ℤ} (hP : 0 < P) (hb : 0 < b)
    (h : b*H ≤ a*P) : (H:ℝ)/(P:ℝ) ≤ (a:ℝ)/(b:ℝ) := by
  have hPR : (0:ℝ) < P := by exact_mod_cast hP
  have hbR : (0:ℝ) < b := by exact_mod_cast hb
  apply (div_le_div_iff₀ hPR hbR).mpr
  have hh : (b:ℝ)*(H:ℝ) ≤ (a:ℝ)*(P:ℝ) := by exact_mod_cast h
  nlinarith only [hh]

theorem gap_five_upper (k : ℕ) (hk : 0 < k) (r : ℝ) (hthreshold : 2/5 ≤ r)
    (hmiddle : ∀ H : ℤ, 7*H ≤ 3*((k:ℤ)+6) → (H:ℝ)/((k:ℤ)+6:ℤ) ≤ r)
    (hlast : ∀ H : ℤ,
      H ≤ max (5*((2*(2*(k:ℤ)+5))/7)-(2*(k:ℤ)+5))
        ((2*(k:ℤ)+5)-2*((2*(2*(k:ℤ)+5))/7+1)) →
      (H:ℝ)/(2*(k:ℤ)+5:ℤ) ≤ r) : gapValue k 5 ≤ r := by
  apply gap_upper_of_integer_bounds k 5 hk (by norm_num) r
  · intro m H h1 h4
    have hh := one_even_pair_bound (a:=2) (by omega : (0:ℤ)<(k:ℤ)+1) (by norm_num) h1 h4
    have hb : (H:ℝ)/((k:ℤ)+1:ℤ) ≤ (2:ℝ)/5 := by
      simpa using ratio_le_of_linear (by omega : (0:ℤ)<(k:ℤ)+1) (by norm_num : (0:ℤ)<5) hh
    exact hb.trans hthreshold
  · intro m H h1 h6
    apply hmiddle H
    exact one_even_pair_bound (a:=3) (by omega : (0:ℤ)<(k:ℤ)+5+1) (by norm_num) h1 h6
  · intro u H h2 h5
    by_cases hsmall : 5*H ≤ 2*(2*(k:ℤ)+5)
    · have hb : (H:ℝ)/(2*(k:ℤ)+5:ℤ) ≤ (2:ℝ)/5 := by
        simpa using ratio_le_of_linear (by omega : (0:ℤ)<2*(k:ℤ)+5) (by norm_num : (0:ℤ)<5) hsmall
      exact hb.trans hthreshold
    · exact hlast H (two_five_pair_bound (by omega : (0:ℤ)<2*(k:ℤ)+5) (by omega) h2 h5)

theorem gap_seven_upper (k : ℕ) (hk : 0 < k) (r : ℝ) (hthreshold : 3/7 ≤ r)
    (hmiddle : ∀ H : ℤ, 9*H ≤ 4*((k:ℤ)+8) → (H:ℝ)/((k:ℤ)+8:ℤ) ≤ r)
    (hlast : ∀ H : ℤ,
      H ≤ max (2*((2*(2*(k:ℤ)+7))/9))
        (2*(2*(k:ℤ)+7)-7*((2*(2*(k:ℤ)+7))/9+1)) →
      (H:ℝ)/(2*(k:ℤ)+7:ℤ) ≤ r) : gapValue k 7 ≤ r := by
  apply gap_upper_of_integer_bounds k 7 hk (by norm_num) r
  · intro m H h1 h6
    have hh := one_even_pair_bound (a:=3) (by omega : (0:ℤ)<(k:ℤ)+1) (by norm_num) h1 h6
    have hb : (H:ℝ)/((k:ℤ)+1:ℤ) ≤ (3:ℝ)/7 := by
      simpa using ratio_le_of_linear (by omega : (0:ℤ)<(k:ℤ)+1) (by norm_num : (0:ℤ)<7) hh
    exact hb.trans hthreshold
  · intro m H h1 h8
    apply hmiddle H
    exact one_even_pair_bound (a:=4) (by omega : (0:ℤ)<(k:ℤ)+7+1) (by norm_num) h1 h8
  · intro u H h2 h7
    by_cases hsmall : 7*H ≤ 3*(2*(k:ℤ)+7)
    · have hb : (H:ℝ)/(2*(k:ℤ)+7:ℤ) ≤ (3:ℝ)/7 := by
        simpa using ratio_le_of_linear (by omega : (0:ℤ)<2*(k:ℤ)+7) (by norm_num : (0:ℤ)<7) hsmall
      exact hb.trans hthreshold
    · exact hlast H (two_seven_pair_bound (by omega : (0:ℤ)<2*(k:ℤ)+7) (by omega) h2 h7)

end ThreeDistanceGraph
