import Conjectures.SymmetricFourPointResult
import Conjectures.NonmixedGapResidues

/-! Common-divisor normalization for arbitrary positive symmetric four-point
sets. The upper and lower bounds apply to all center sets, through uniform
finite-interval bounds on every residue class. Periodic extremizers lift by
replacing each occupied integer with a full block of the common-divisor size. -/

namespace SymmetricFourPoint

noncomputable def packingTarget (a b : ℕ) : ℝ :=
  if a % 2 = 1 ∧ b % 2 = 1 then
    ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) else 1 / 4

noncomputable def coveringTarget (a b : ℕ) : ℝ :=
  if a % 2 = 1 ∧ b % 2 = 1 then
    ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) else 1 / 4

theorem multiplicity_residueSlice (A : Set ℤ) (g r a b t : ℤ) :
    multiplicity (indicator (NonmixedGap.residueSlice A g r)) a b t =
      multiplicity (indicator A) (g*a) (g*b) (r+g*t) := by
  have hi : ∀ s, indicator (NonmixedGap.residueSlice A g r) s =
      indicator A (r+g*s) := fun _ => rfl
  simp only [multiplicity, pair, hi]
  congr 2 <;> congr 1 <;> ring

theorem packing_residueSlice {A : Set ℤ} {g a b : ℤ}
    (hA : IsPacking A (g*a) (g*b)) (r : ℤ) :
    IsPacking (NonmixedGap.residueSlice A g r) a b := by
  intro t
  rw [multiplicity_residueSlice]
  exact hA _

theorem covering_residueSlice {A : Set ℤ} {g a b : ℤ}
    (hA : IsCovering A (g*a) (g*b)) (r : ℤ) :
    IsCovering (NonmixedGap.residueSlice A g r) a b := by
  intro t
  rw [multiplicity_residueSlice]
  exact hA _

theorem multiplicity_blowUp (A : Set ℤ) {g : ℤ} (hg : 0 < g) (a b t : ℤ) :
    multiplicity (indicator (NonmixedGap.blowUp A g)) (g*a) (g*b) t =
      multiplicity (indicator A) a b (t/g) := by
  have hi : ∀ s, indicator (NonmixedGap.blowUp A g) s = indicator A (s/g) := fun _ => rfl
  have hd : ∀ s d : ℤ, (s-g*d)/g = s/g-d :=
    fun s d => Int.sub_mul_ediv_left s d (ne_of_gt hg)
  simp only [multiplicity, pair, hi, hd]

theorem packing_blowUp {A : Set ℤ} {g a b : ℤ} (hg : 0 < g)
    (hA : IsPacking A a b) : IsPacking (NonmixedGap.blowUp A g) (g*a) (g*b) := by
  intro t
  rw [multiplicity_blowUp A hg]
  exact hA _

theorem covering_blowUp {A : Set ℤ} {g a b : ℤ} (hg : 0 < g)
    (hA : IsCovering A a b) : IsCovering (NonmixedGap.blowUp A g) (g*a) (g*b) := by
  intro t
  rw [multiplicity_blowUp A hg]
  exact hA _

theorem packingTarget_nonneg (a b : ℕ) (ha : 0 < a) (hab : a < b) :
    0 ≤ packingTarget a b := by
  unfold packingTarget
  split_ifs
  · apply div_nonneg
    · have hp : 1 ≤ packingLength a b := by dsimp [packingLength]; omega
      have hpR : (1 : ℝ) ≤ packingLength a b := by exact_mod_cast hp
      linarith
    · positivity
  · norm_num

theorem coveringTarget_le_one (a b : ℕ) (ha : 0 < a) (hab : a < b) :
    coveringTarget a b ≤ 1 := by
  unfold coveringTarget
  split_ifs
  · have hp : 0 < coveringLength a b := by dsimp [coveringLength]; omega
    have hpR : (1 : ℝ) ≤ coveringLength a b := by exact_mod_cast hp
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 4 * coveringLength a b)).2
    linarith
  · norm_num

/-- One error constant works for every packing and every finite interval. -/
theorem packing_uniform_bound (a b : ℕ) (ha : 0 < a) (hab : a < b) :
    ∃ C : ℝ, ∀ A : Set ℤ, IsPacking A a b → ∀ u v : ℤ, u ≤ v →
      (NonmixedGap.count A u v : ℝ) ≤ packingTarget a b * (v-u) + C := by
  by_cases hodd : a % 2 = 1 ∧ b % 2 = 1
  · let P : ℝ := packingLength a b
    have hp : 0 < packingLength a b := by dsimp [packingLength]; omega
    have hP : 0 < P := by dsimp [P]; exact_mod_cast hp
    refine ⟨(2 * P * (a+b : ℝ) + P - 1) / (4 * P), ?_⟩
    intro A hA u v huv
    let n := (v-u).toNat
    have hn : (n : ℤ) = v-u := by dsimp [n]; omega
    have hnR : (n : ℝ) = (v : ℝ)-u := by exact_mod_cast hn
    have hcount : windowSum (indicator A) u n = (NonmixedGap.count A u v : ℤ) := by
      rw [windowSum_indicator, hn, add_sub_cancel]
    have hb := packing_count_bound a b ha hab hodd.1 hodd.2 (indicator A)
      (indicator_nonneg A) hA u n
    rw [hcount] at hb
    have hbR : 4 * P * (NonmixedGap.count A u v : ℝ) ≤
        (P-1)*n + 2*P*(a+b : ℝ) + P - 1 := by
      dsimp [P]
      exact_mod_cast hb
    rw [hnR] at hbR
    calc
      (NonmixedGap.count A u v : ℝ) ≤
          ((P-1)*((v : ℝ)-u) + 2*P*(a+b : ℝ) + P - 1) / (4*P) := by
        apply (le_div_iff₀ (by positivity : 0 < 4*P)).2
        nlinarith only [hbR]
      _ = packingTarget a b * (v-u) + (2*P*(a+b : ℝ)+P-1)/(4*P) := by
        simp only [packingTarget, if_pos hodd]
        dsimp [P]
        ring
  · refine ⟨(a+b : ℝ)/2, ?_⟩
    intro A hA u v huv
    let n := (v-u).toNat
    have hn : (n : ℤ) = v-u := by dsimp [n]; omega
    have hsum := windowSum_le hA u n
    have hm := (windowSum_multiplicity_bounds (indicator_nonneg A)
      (indicator_le_one A) a b u n).1
    rw [windowSum_indicator, hn, add_sub_cancel] at hm
    have hI : 4 * (NonmixedGap.count A u v : ℤ) ≤ (v-u)+2*(a+b : ℤ) := by omega
    have hR : 4 * (NonmixedGap.count A u v : ℝ) ≤ (v-u)+2*(a+b : ℝ) := by exact_mod_cast hI
    simp only [packingTarget, if_neg hodd]
    linarith only [hR]

/-- The covering estimate also has one error constant for all center sets. -/
theorem covering_uniform_bound (a b : ℕ) (ha : 0 < a) (hab : a < b) :
    ∃ C : ℝ, ∀ A : Set ℤ, IsCovering A a b → ∀ u v : ℤ, u ≤ v →
      coveringTarget a b * (v-u) - C ≤ (NonmixedGap.count A u v : ℝ) := by
  by_cases hodd : a % 2 = 1 ∧ b % 2 = 1
  · let Q : ℝ := coveringLength a b
    have hp : 0 < coveringLength a b := by dsimp [coveringLength]; omega
    have hQ : 0 < Q := by dsimp [Q]; exact_mod_cast hp
    refine ⟨(2*Q*(a+b : ℝ)+Q-1)/(4*Q), ?_⟩
    intro A hA u v huv
    let n := (v-u).toNat
    have hn : (n : ℤ) = v-u := by dsimp [n]; omega
    have hnR : (n : ℝ) = (v : ℝ)-u := by exact_mod_cast hn
    have hcount : windowSum (indicator A) u n = (NonmixedGap.count A u v : ℤ) := by
      rw [windowSum_indicator, hn, add_sub_cancel]
    have hb := covering_count_bound a b ha hab hodd.1 hodd.2 (indicator A)
      (indicator_nonneg A) (indicator_le_one A) hA u n
    rw [hcount] at hb
    have hbR : (Q+1)*n - 2*Q*(a+b : ℝ) - (Q-1) ≤
        4*Q*(NonmixedGap.count A u v : ℝ) := by
      dsimp [Q]
      exact_mod_cast hb
    rw [hnR] at hbR
    calc
      coveringTarget a b * (v-u) - (2*Q*(a+b : ℝ)+Q-1)/(4*Q) =
          ((Q+1)*((v : ℝ)-u) - 2*Q*(a+b : ℝ) - (Q-1))/(4*Q) := by
        simp only [coveringTarget, if_pos hodd]
        dsimp [Q]
        ring
      _ ≤ (NonmixedGap.count A u v : ℝ) := by
        apply (div_le_iff₀ (by positivity : 0 < 4*Q)).2
        nlinarith only [hbR]
  · refine ⟨(a+b : ℝ)/2, ?_⟩
    intro A hA u v huv
    let n := (v-u).toNat
    have hn : (n : ℤ) = v-u := by dsimp [n]; omega
    have hsum := le_windowSum hA u n
    have hm := (windowSum_multiplicity_bounds (indicator_nonneg A)
      (indicator_le_one A) a b u n).2
    rw [windowSum_indicator, hn, add_sub_cancel] at hm
    have hI : v-u-2*(a+b : ℤ) ≤ 4*(NonmixedGap.count A u v : ℤ) := by omega
    have hR : v-u-2*(a+b : ℝ) ≤ 4*(NonmixedGap.count A u v : ℝ) := by exact_mod_cast hI
    simp only [coveringTarget, if_neg hodd]
    linarith only [hR]

theorem periodic_tiling_of_not_odd (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (hodd : ¬ (a % 2 = 1 ∧ b % 2 = 1)) :
    ∃ (A : Set ℤ) (P : ℕ), 0 < P ∧
      (∀ t, multiplicity (indicator A) a b t = 1) ∧ NonmixedGap.IsPeriodic A P ∧
      NonmixedGap.upperDensity A = 1/4 ∧ NonmixedGap.lowerDensity A = 1/4 := by
  have hparity : a % 2 ≠ b % 2 := by
    intro heq
    have hae : a % 2 = 0 := by omega
    have hbe : b % 2 = 0 := by omega
    exact Nat.not_coprime_of_dvd_of_dvd (by decide : 1 < 2)
      (Nat.dvd_of_mod_eq_zero hae) (Nat.dvd_of_mod_eq_zero hbe) hcop
  by_cases heven : a % 2 = 0
  · obtain ⟨A,ht,hP,hu,hl⟩ := even_odd_tiling a b ha hcop heven (by omega)
    exact ⟨A,2*a,by omega,ht,hP,hu,hl⟩
  · obtain ⟨A,ht,hP,hu,hl⟩ := even_odd_tiling b a (by omega) hcop.symm (by omega) (by omega)
    refine ⟨A,2*b,by omega,?_,hP,hu,hl⟩
    intro t
    rw [multiplicity_swap]
    exact ht t

theorem periodic_packing_target (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) :
    ∃ (A : Set ℤ) (P : ℕ), 0 < P ∧ IsPacking A a b ∧
      NonmixedGap.IsPeriodic A P ∧ NonmixedGap.upperDensity A = packingTarget a b := by
  by_cases hodd : a % 2 = 1 ∧ b % 2 = 1
  · obtain ⟨A,hA,hP,hd,_⟩ := odd_packing_witness a b ha hab hcop hodd.1 hodd.2
    refine ⟨A,packingLength a b,?_,hA,hP,?_⟩
    · dsimp [packingLength]; omega
    · simpa only [packingTarget, if_pos hodd] using hd
  · obtain ⟨A,P,hP,ht,hperiod,hu,_⟩ := periodic_tiling_of_not_odd a b ha hab hcop hodd
    exact ⟨A,P,hP,fun t => le_of_eq (ht t),hperiod,
      by simpa only [packingTarget, if_neg hodd] using hu⟩

theorem periodic_covering_target (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) :
    ∃ (A : Set ℤ) (P : ℕ), 0 < P ∧ IsCovering A a b ∧
      NonmixedGap.IsPeriodic A P ∧ NonmixedGap.lowerDensity A = coveringTarget a b := by
  by_cases hodd : a % 2 = 1 ∧ b % 2 = 1
  · obtain ⟨A,hA,hP,_,hd⟩ := odd_covering_witness a b ha hab hcop hodd.1 hodd.2
    refine ⟨A,coveringLength a b,?_,hA,hP,?_⟩
    · dsimp [coveringLength]; omega
    · simpa only [coveringTarget, if_pos hodd] using hd
  · obtain ⟨A,P,hP,ht,hperiod,_,hl⟩ := periodic_tiling_of_not_odd a b ha hab hcop hodd
    exact ⟨A,P,hP,fun t => le_of_eq (ht t).symm,hperiod,
      by simpa only [coveringTarget, if_neg hodd] using hl⟩

/-- Multiplying both steps by any positive integer preserves the normalized
extremal density. This theorem quantifies over all packings and coverings. -/
theorem scaled_densities (g a b : ℕ) (hg : 0 < g) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) :
    packingDensity (g*a) (g*b) = packingTarget a b ∧
    coveringDensity (g*a) (g*b) = coveringTarget a b := by
  have hgI : (0 : ℤ) < g := by exact_mod_cast hg
  constructor
  · have hbound : ∀ A : Set ℤ, IsPacking A (g*a) (g*b) →
        NonmixedGap.upperDensity A ≤ packingTarget a b := by
      intro A hA
      obtain ⟨C,hC⟩ := packing_uniform_bound a b ha hab
      apply NonmixedGap.uniform_count_upper A _ ((g : ℝ)*(2*packingTarget a b+C))
      apply NonmixedGap.uniform_count_from_residues A hgI _ C (packingTarget_nonneg a b ha hab)
      intro r hr0 hrg u v huv
      exact hC _ (packing_residueSlice hA r) u v huv
    obtain ⟨A,P,hP,hA,hperiod,hd⟩ := periodic_packing_target a b ha hab hcop
    apply packingDensity_eq_of_witness (g*a) (g*b) _ hbound (NonmixedGap.blowUp A g)
    · exact packing_blowUp hgI hA
    · rw [NonmixedGap.blowUp_upperDensity hgI (by exact_mod_cast hP) hperiod, hd]
  · have hbound : ∀ A : Set ℤ, IsCovering A (g*a) (g*b) →
        coveringTarget a b ≤ NonmixedGap.lowerDensity A := by
      intro A hA
      obtain ⟨C,hC⟩ := covering_uniform_bound a b ha hab
      apply NonmixedGap.uniform_count_lower A _ ((g : ℝ)*(2*(1-coveringTarget a b)+C))
      apply NonmixedGap.uniform_count_from_residues_lower A hgI _ C (coveringTarget_le_one a b ha hab)
      intro r hr0 hrg u v huv
      exact hC _ (covering_residueSlice hA r) u v huv
    obtain ⟨A,P,hP,hA,hperiod,hd⟩ := periodic_covering_target a b ha hab hcop
    apply coveringDensity_eq_of_witness (g*a) (g*b) _ hbound (NonmixedGap.blowUp A g)
    · exact covering_blowUp hgI hA
    · rw [NonmixedGap.blowUp_lowerDensity hgI (by exact_mod_cast hP) hperiod, hd]

/-- The exact density formula for every positive pair of unequal steps.
The parity test and interval lengths use the steps divided by their gcd. -/
theorem symmetric_four_point_densities_general (a b : ℕ) (ha : 0 < a) (hab : a < b) :
    packingDensity a b = packingTarget (a / Nat.gcd a b) (b / Nat.gcd a b) ∧
    coveringDensity a b = coveringTarget (a / Nat.gcd a b) (b / Nat.gcd a b) := by
  let g := Nat.gcd a b
  have hg : 0 < g := Nat.gcd_pos_of_pos_left b ha
  have hga : g*(a/g) = a := by
    rw [Nat.mul_comm]
    exact Nat.div_mul_cancel (Nat.gcd_dvd_left a b)
  have hgb : g*(b/g) = b := by
    rw [Nat.mul_comm]
    exact Nat.div_mul_cancel (Nat.gcd_dvd_right a b)
  have ha' : 0 < a/g := Nat.div_gcd_pos_of_pos_left b ha
  have hab' : a/g < b/g := by nlinarith [hga,hgb]
  have hcop : Nat.Coprime (a/g) (b/g) := Nat.coprime_div_gcd_div_gcd hg
  have hh := scaled_densities g (a/g) (b/g) hg ha' hab' hcop
  have hgaI : (g : ℤ)*(a/g : ℕ) = (a : ℤ) := by exact_mod_cast hga
  have hgbI : (g : ℤ)*(b/g : ℕ) = (b : ℤ) := by exact_mod_cast hgb
  rw [hgaI,hgbI] at hh
  exact hh

end SymmetricFourPoint
