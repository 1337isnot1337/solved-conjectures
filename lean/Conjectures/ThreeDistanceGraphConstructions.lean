import Conjectures.ThreeDistanceGraphGrids

namespace ThreeDistanceGraph

noncomputable def intRatio (a b : ℤ) : ℝ := (a:ℝ)/(b:ℝ)

theorem gap_lower_of_norms (k s : ℕ) {P m H : ℤ} (hP : 0 < P)
    (hhalf : 2*H ≤ P) (h1 : H ≤ circularNorm P m)
    (h2 : H ≤ circularNorm P ((k:ℤ)*m))
    (h3 : H ≤ circularNorm P (((k:ℤ)+s)*m)) :
    (H:ℝ)/(P:ℝ) ≤ gapValue k s := by
  apply value_lower_of_grid (gapSpeeds k s) hP hhalf (m:=m)
  intro d hd
  simp only [gapSpeeds,List.mem_cons,List.not_mem_nil,or_false] at hd
  rcases hd with rfl | rfl | rfl
  · simpa using h1
  · exact h2
  · simpa only [Nat.cast_add] using h3

/-- The normal branch uses numerator H itself as the character.  The three
residues are H, H+C, and -H; the one length inequality verifies all of them. -/
theorem gap_lower_normal (k s : ℕ) {P H C K : ℤ}
    (hP : P=(k:ℤ)+s+1) (hH : 0 < H) (hC : 0 ≤ C)
    (hrel : ((s:ℤ)+2)*H=K*P-C) (hfits : 2*H+C ≤ P) :
    (H:ℝ)/(P:ℝ) ≤ gapValue k s := by
  have hpos : 0 < P := by omega
  have hn : H ≤ circularNorm P H :=
    circularNorm_lower hpos hH (le_refl H) (by omega) rfl
  apply gap_lower_of_norms k s hpos (by omega) hn
  · have he : (k:ℤ)*H=H+C+(H-K)*P := by rw [hP] at hrel ⊢; nlinarith only [hrel]
    rw [he,circularNorm_add_mul]
    exact circularNorm_lower hpos hH (by omega) (by omega) rfl
  · have he : ((k:ℤ)+s)*H= -H+H*P := by rw [hP]; ring
    rw [he,circularNorm_add_mul,circularNorm_neg hpos]
    exact hn

/-- The exceptional residue-three branch has a character H+1 on the odd
pair-sum period.  Its two large speeds have residues H and -H. -/
theorem gap_lower_special (k s : ℕ) {P H z : ℤ}
    (hP : P=2*(k:ℤ)+s) (hH : 0 < H) (hfits : 2*H+1 ≤ P)
    (hrel : (k:ℤ)*(H+1)=H+z*P) :
    (H:ℝ)/(P:ℝ) ≤ gapValue k s := by
  have hpos : 0 < P := by omega
  have hn : H ≤ circularNorm P H :=
    circularNorm_lower hpos hH (le_refl H) (by omega) rfl
  apply gap_lower_of_norms k s hpos (by omega) (m:=H+1)
  · exact circularNorm_lower hpos hH (by omega) (by omega) rfl
  · rw [hrel,circularNorm_add_mul]
    exact hn
  · have he : ((k:ℤ)+s)*(H+1)= -H+(H+1-z)*P := by
      rw [hP] at hrel ⊢
      nlinarith only [hrel]
    rw [he,circularNorm_add_mul,circularNorm_neg hpos]
    exact hn

theorem quotient_le_quotient_of_int {H P A B : ℤ} (hP : 0 < P) (hB : 0 < B)
    (h : H*B ≤ A*P) : (H:ℝ)/(P:ℝ) ≤ (A:ℝ)/(B:ℝ) := by
  have hPR : (0:ℝ)<P := by exact_mod_cast hP
  have hBR : (0:ℝ)<B := by exact_mod_cast hB
  apply (div_le_div_iff₀ hPR hBR).mpr
  exact_mod_cast h

theorem gap_five_bound (k : ℕ) (hk : 0 < k) {A B U V : ℤ}
    (hB : 0 < B) (hthreshold : 2*B ≤ 5*A)
    (hmiddle : ∀ H : ℤ, 7*H ≤ 3*((k:ℤ)+6) → H ≤ U)
    (hlast : ∀ H : ℤ,
      H ≤ max (5*((2*(2*(k:ℤ)+5))/7)-(2*(k:ℤ)+5))
        ((2*(k:ℤ)+5)-2*((2*(2*(k:ℤ)+5))/7+1)) → H ≤ V)
    (hU : U*B ≤ A*((k:ℤ)+6)) (hV : V*B ≤ A*(2*(k:ℤ)+5)) :
    gapValue k 5 ≤ intRatio A B := by
  apply gap_five_upper k hk
  · exact quotient_le_quotient_of_int (P:=5) (H:=2) (by norm_num) hB (by omega)
  · intro H hH
    apply quotient_le_quotient_of_int (by omega) hB
    exact (mul_le_mul_of_nonneg_right (hmiddle H hH) (le_of_lt hB)).trans hU
  · intro H hH
    apply quotient_le_quotient_of_int (by omega) hB
    exact (mul_le_mul_of_nonneg_right (hlast H hH) (le_of_lt hB)).trans hV

theorem gap_seven_bound (k : ℕ) (hk : 0 < k) {A B U V : ℤ}
    (hB : 0 < B) (hthreshold : 3*B ≤ 7*A)
    (hmiddle : ∀ H : ℤ, 9*H ≤ 4*((k:ℤ)+8) → H ≤ U)
    (hlast : ∀ H : ℤ,
      H ≤ max (2*((2*(2*(k:ℤ)+7))/9))
        (2*(2*(k:ℤ)+7)-7*((2*(2*(k:ℤ)+7))/9+1)) → H ≤ V)
    (hU : U*B ≤ A*((k:ℤ)+8)) (hV : V*B ≤ A*(2*(k:ℤ)+7)) :
    gapValue k 7 ≤ intRatio A B := by
  apply gap_seven_upper k hk
  · exact quotient_le_quotient_of_int (P:=7) (H:=3) (by norm_num) hB (by omega)
  · intro H hH
    apply quotient_le_quotient_of_int (by omega) hB
    exact (mul_le_mul_of_nonneg_right (hmiddle H hH) (le_of_lt hB)).trans hU
  · intro H hH
    apply quotient_le_quotient_of_int (by omega) hB
    exact (mul_le_mul_of_nonneg_right (hlast H hH) (le_of_lt hB)).trans hV

end ThreeDistanceGraph
