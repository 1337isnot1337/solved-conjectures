import Conjectures.MotzkinCocycle
import Conjectures.MotzkinDefects
import Conjectures.Loneliness
import Mathlib.Analysis.Normed.Group.AddCircle

/-! Every independent set in a finite abelian two-generator Cayley graph
produces a character with both circle distances at least its occupied fraction. -/
namespace Motzkin

open scoped BigOperators

variable {G : Type*} [AddCommGroup G] [Fintype G]

noncomputable def occupancy (A : Finset G) (x : G) : ℤ := by
  classical
  exact if x ∈ A then 1 else 0

omit [AddCommGroup G] [Fintype G] in
theorem occupancy_binary (A : Finset G) (x : G) : occupancy A x=0 ∨ occupancy A x=1 := by
  classical
  by_cases hx : x ∈ A <;> simp [occupancy,hx]

omit [AddCommGroup G] in
theorem occupancy_sum (A : Finset G) : (∑ x, occupancy A x) = (A.card:ℤ) := by
  classical
  simp [occupancy]

omit [Fintype G] in
theorem occupancy_avoids (A : Finset G) {a : G}
    (ha : ∀ x ∈ A, x+a ∉ A) (x : G) : occupancy A x+occupancy A (x+a) ≤ 1 := by
  classical
  by_cases hx : x ∈ A
  · have hn := ha x hx
    simp [occupancy,hx,hn]
  · rcases occupancy_binary A (x+a) with h | h <;> simp [occupancy,hx] at h ⊢ <;> omega

theorem sum_shift (f : G → ℤ) (a : G) : (∑ x, f (x+a)) = ∑ x, f x := by
  apply Fintype.sum_equiv (Equiv.addRight a)
  intro x
  rfl

theorem sum_increment_bounds (A : Finset G) (a : G) (f : G → ℤ)
    (hf : ∀ x, occupancy A (x+a) ≤ f x ∧ f x ≤ 1-occupancy A x) :
    (A.card:ℤ) ≤ ∑ x, f x ∧ (∑ x, f x) ≤ (Fintype.card G:ℤ)-A.card := by
  constructor
  · have hh := Finset.sum_le_sum (fun x (_ : x ∈ Finset.univ) => (hf x).1)
    rwa [sum_shift,occupancy_sum] at hh
  · have hh := Finset.sum_le_sum (fun x (_ : x ∈ Finset.univ) => (hf x).2)
    simpa only [Finset.sum_sub_distrib,Finset.sum_const,Finset.card_univ,
      nsmul_eq_mul,mul_one,occupancy_sum] using hh

theorem norm_average_lower (A : Finset G) (z : ℤ)
    (hl : (A.card:ℤ) ≤ z) (hu : z ≤ (Fintype.card G:ℤ)-A.card) :
    (A.card:ℝ)/(Fintype.card G:ℝ) ≤
      ‖((z:ℝ)/(Fintype.card G:ℝ) : UnitAddCircle)‖ := by
  have hN : (0:ℝ) < Fintype.card G := by exact_mod_cast Fintype.card_pos
  have hlR : (A.card:ℝ) ≤ z := by exact_mod_cast hl
  have huR : (z:ℝ) ≤ (Fintype.card G:ℝ)-A.card := by exact_mod_cast hu
  have hl' := div_le_div_of_nonneg_right hlR (le_of_lt hN)
  have hsum : (z:ℝ)/(Fintype.card G:ℝ)+(A.card:ℝ)/(Fintype.card G:ℝ) ≤ 1 := by
    rw [← add_div]
    apply (div_le_one hN).mpr
    linarith only [huR]
  have hh := Loneliness.distance_lower_of_cell (k:=0)
    (by simpa only [Int.cast_zero,sub_zero] using hl')
    (by simp only [Int.cast_zero,sub_zero]; linarith only [hsum])
  simpa only [UnitAddCircle.norm_eq,Loneliness.distance] using hh

/-- The finite upper theorem includes noncyclic groups and labelled repeated
directions. Every character produced here is a genuine additive homomorphism. -/
theorem finite_independent_character (a b : G)
    (hgen : AddSubgroup.closure ({a,b} : Set G)=⊤) (A : Finset G)
    (hA : ∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) :
    ∃ χ : G →+ UnitAddCircle,
      (A.card:ℝ)/(Fintype.card G:ℝ) ≤ min ‖χ a‖ ‖χ b‖ := by
  have havoid : ∀ e : Torus.Edge G,
      occupancy A e.2+occupancy A (e.2+Torus.jump a b e) ≤ 1 := by
    rintro ⟨i,x⟩
    cases i
    · exact occupancy_avoids A (fun y hy => (hA y hy).1) x
    · exact occupancy_avoids A (fun y hy => (hA y hy).2) x
  obtain ⟨f,g,hclosed,hf,hg⟩ :=
    Torus.exists_closed_integers a b (occupancy A) (occupancy_binary A) havoid
  obtain ⟨χ,hχa,hχb⟩ := IntegralLift.character_of_closed a b f g hclosed hgen
  refine ⟨χ,le_min ?_ ?_⟩
  · rw [hχa]
    obtain ⟨hl,hu⟩ := sum_increment_bounds A a f hf
    exact norm_average_lower A (∑ x, f x) hl hu
  · rw [hχb]
    obtain ⟨hl,hu⟩ := sum_increment_bounds A b g hg
    exact norm_average_lower A (∑ x, g x) hl hu

end Motzkin
