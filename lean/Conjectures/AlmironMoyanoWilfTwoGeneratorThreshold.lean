import Conjectures.AlmironMoyanoWilfMultiplicityTwo
import Conjectures.AlmironMoyanoWilfTwoGeneratorModules
import Mathlib.Tactic.IntervalCases

/-! Sharp two-generator gap-module threshold for every pair of coprime
generators. The upper bound at three follows from the exact conductor and
gap count. The Frobenius gap witnesses failure at two for multiplicity ≥ 3. -/

namespace AlmironMoyanoWilf.TwoGenerator

private theorem weighted_bound {p C d A : ℕ} (hp : 0 < p)
    (hC : 2*p ≤ 3*C) (hprod : d*d ≤ p*A) : 4*d ≤ C+6*A := by
  apply Nat.le_of_mul_le_mul_right _ hp
  have h := Nat.mul_le_mul_right p hC
  zify at hprod h ⊢
  nlinarith [sq_nonneg ((p : ℤ) - 3*(d : ℤ))]

private theorem min_bound {a b u v g : ℕ} (ha : 3 ≤ a) (hab : a < b) (cop : a.Coprime b)
    (coords : Coordinates a b g u v) :
    4 * min (u*a) (v*b) ≤ (frobenius a b + 1) + 6*(u*v) := by
  have hab' := Nat.add_le_mul (show 1 < a by omega) (show 1 < b by omega)
  have hF : (frobenius a b + 1) + a + b = a*b + 1 := by unfold frobenius; omega
  obtain ⟨hu,hv⟩ := coords.bounds (by omega) (by omega)
  have hv0 := coords.right_pos
  by_cases h3 : a = 3
  · subst a
    have hne : 3*u ≠ b := by
      intro he
      have hd := Nat.dvd_gcd (dvd_refl 3) (show 3 ∣ b from ⟨u, he.symm⟩)
      rw [cop.gcd_eq_one] at hd
      omega
    rcases (show v = 1 ∨ v = 2 by omega) with rfl | rfl <;> omega
  by_cases hsmall : a = 4 ∧ b < 9
  · obtain ⟨rfl,hb⟩ := hsmall
    interval_cases b <;> interval_cases v <;> norm_num [frobenius] <;> omega
  have hC : 2*(a*b) ≤ 3*(frobenius a b + 1) := by
    by_cases h4 : a = 4
    · subst a; omega
    · obtain ⟨i,hi⟩ := Nat.exists_eq_add_of_le (show 5 ≤ a by omega)
      obtain ⟨j,hj⟩ := Nat.exists_eq_add_of_le (show 6 ≤ b by omega)
      rw [hi,hj] at hF ⊢
      nlinarith
  apply weighted_bound (p := a*b) (Nat.mul_pos (by omega) (by omega)) hC
  calc
    _ ≤ (u*a)*(v*b) := Nat.mul_le_mul (min_le_left ..) (min_le_right ..)
    _ = _ := by ring

private theorem min_le_conductor {a b u v g : ℕ} (ha : 3 ≤ a) (hab : a < b)
    (h : Coordinates a b g u v) : min (u*a) (v*b) ≤ frobenius a b + 1 := by
  have he := h.eq
  have hab' := Nat.add_le_mul (show 1 < a by omega) (show 1 < b by omega)
  have hF : frobenius a b + a + b = a*b := by unfold frobenius; omega
  have hhalf : a*b ≤ 2*(frobenius a b+1) := by
    obtain ⟨i,hi⟩ := Nat.exists_eq_add_of_le ha
    obtain ⟨j,hj⟩ := Nat.exists_eq_add_of_le (show 4 ≤ b by omega)
    rw [hi,hj] at hF ⊢
    nlinarith
  omega

open Classical in
theorem gap_threshold_three {a b : ℕ} (ha : 3 ≤ a) (hab : a < b) (cop : a.Coprime b) :
    IsLeast {k : ℕ | 0 < k ∧ ∀ g c, g ∉ semigroup a b →
      IsConductor (fun x => x ∈ moduleSet a b g) c →
      c ≤ k * leftCount (fun x => x ∈ moduleSet a b g) c} 3 := by
  classical
  have ha' : 1 < a := by omega
  have hb' : 1 < b := by omega
  let C := frobenius a b + 1
  constructor
  · refine ⟨by decide, ?_⟩
    intro g c hg hc
    obtain ⟨u,v,h⟩ := coordinates_of_gap ha' hb' cop hg
    have hcut := isConductor_unique hc (conductor ha' hb' cop h)
    have count := module_counts ha' hb' cop h
    change 2 * leftCount _ (C-min (u*a) (v*b)) + C = 2*(C-min (u*a) (v*b)) + 2*(u*v) at count
    change c = C-min (u*a) (v*b) at hcut
    rw [← hcut] at count
    have hbnd := min_bound ha hab cop h
    have hle := min_le_conductor ha hab h
    change 4 * min (u*a) (v*b) ≤ C + 6*(u*v) at hbnd
    change min (u*a) (v*b) ≤ C at hle
    omega
  · intro k hk
    obtain ⟨_,hk⟩ := hk
    let F := frobenius a b
    have hab' := Nat.add_le_mul ha' hb'
    have hf : F + a + b = a*b := by dsimp [F,frobenius]; omega
    have h : Coordinates a b F 1 1 := ⟨by decide, by decide, by simpa using hf⟩
    have hmin : min (1*a) (1*b) = a := by simp [Nat.le_of_lt hab]
    have hle := min_le_conductor ha hab h
    rw [hmin] at hle
    have count := module_counts ha' hb' cop h
    change 2 * leftCount _ (C-min (1*a) (1*b)) + C = 2*(C-min (1*a) (1*b)) + 2*(1*1) at count
    rw [hmin] at count
    have hc := conductor ha' hb' cop h
    rw [hmin] at hc
    let c := C-a
    have hw := hk F c (h.not_mem cop) hc
    by_contra! hklt
    have h2 := Nat.mul_le_mul_right (leftCount (fun x => x ∈ moduleSet a b F) c) (show k ≤ 2 by omega)
    change a ≤ C at hle
    change 2 * leftCount _ c + C = 2*c + 2*(1*1) at count
    have hca : c+a = C := Nat.sub_add_cancel hle
    omega

open Classical in
/-- The least positive uniform threshold over all gap modules of ⟨a,b⟩. -/
theorem exact_two_generator_threshold {a b : ℕ} (ha : 2 ≤ a) (hab : a < b)
    (cop : a.Coprime b) :
    IsLeast {k : ℕ | 0 < k ∧ ∀ g c, g ∉ semigroup a b →
      IsConductor (fun x => x ∈ moduleSet a b g) c →
      c ≤ k * leftCount (fun x => x ∈ moduleSet a b g) c}
      (if a = 2 then if b = 3 then 1 else 2 else 3) := by
  classical
  split
  · next he =>
    subst a
    have hodd : b % 2 = 1 := by
      by_contra! hn
      have hd := Nat.dvd_gcd (dvd_refl 2) (Nat.dvd_of_mod_eq_zero (show b % 2 = 0 by omega))
      rw [cop.gcd_eq_one] at hd
      omega
    exact twoOdd_gap_threshold hodd (by omega)
  · exact gap_threshold_three (by omega) hab cop

end AlmironMoyanoWilf.TwoGenerator
