import Conjectures.MotzkinCyclicWalk
import Mathlib.Data.Fin.VecNotation

/-! The N=24, a=3, b=4 example. Its odd girth is seven, its odd-cycle upper
bound is ten, and its exact independence number is nine. All finite checks use
kernel reduction through `decide`. -/
namespace Motzkin

open scoped BigOperators

def labelledJump {G : Type*} [AddCommGroup G] (a b : G) (i : Fin 4) : G :=
  ![a,-a,b,-b] i

theorem ForbiddenStep.exists_label {G : Type*} [AddCommGroup G]
    {a b x y : G} (h : ForbiddenStep a b x y) :
    ∃ i : Fin 4, y=x+labelledJump a b i := by
  rcases h with h | h | h | h
  · exact ⟨0,by simpa [labelledJump] using h⟩
  · exact ⟨1,by simp [labelledJump,h,add_assoc]⟩
  · exact ⟨2,by simpa [labelledJump] using h⟩
  · exact ⟨3,by simp [labelledJump,h,add_assoc]⟩

theorem closed_walk_labels {G I : Type*} [AddCommGroup G] [Fintype I]
    (a b : G) (p : I → G) (σ : Equiv.Perm I)
    (hstep : ∀ i, ForbiddenStep a b (p i) (p (σ i))) :
    ∃ f : I → Fin 4, ∑ i, labelledJump a b (f i)=0 := by
  classical
  choose f hf using (fun i => (hstep i).exists_label)
  refine ⟨f,?_⟩
  have he (i : I) : labelledJump a b (f i)=p (σ i)-p i := by
    rw [hf i]
    abel
  simp_rw [he]
  rw [Finset.sum_sub_distrib,Equiv.sum_comp σ p,sub_self]

namespace Cyclic

theorem generate_of_sub_eq_one {N : ℕ} [NeZero N] (a b : ZMod N)
    (h : b-a=1) : AddSubgroup.closure ({a,b} : Set (ZMod N))=⊤ := by
  let H := AddSubgroup.closure ({a,b} : Set (ZMod N))
  have ha : a ∈ H := AddSubgroup.subset_closure (by simp)
  have hb : b ∈ H := AddSubgroup.subset_closure (by simp)
  have hone : (1:ZMod N) ∈ H := h ▸ H.sub_mem hb ha
  apply AddSubgroup.eq_top_iff'.mpr
  intro z
  have hz := H.nsmul_mem hone z.val
  simpa only [nsmul_eq_mul,mul_one,ZMod.natCast_zmod_val] using hz

theorem example_generate : AddSubgroup.closure ({(3:ZMod 24),4} : Set (ZMod 24))=⊤ :=
  generate_of_sub_eq_one 3 4 (by decide)

theorem example_score_upper : ∀ t : ZMod 24, score t 3 4 ≤ 9 := by decide

theorem example_score_at_three : score (3:ZMod 24) 3 4=9 := by decide

def exampleSet : Finset (ZMod 24) := {0,1,2,8,9,10,16,17,18}

theorem exampleSet_card : exampleSet.card=9 := by decide

theorem exampleSet_avoids : ∀ x ∈ exampleSet,
    x+(3:ZMod 24) ∉ exampleSet ∧ x+(4:ZMod 24) ∉ exampleSet := by decide

theorem example_independent_upper (A : Finset (ZMod 24))
    (hA : ∀ x ∈ A, x+(3:ZMod 24) ∉ A ∧ x+(4:ZMod 24) ∉ A) : A.card ≤ 9 := by
  obtain ⟨χ,hχ⟩ := finite_independent_character 3 4 example_generate A hA
  obtain ⟨t,rfl⟩ := character_classification χ
  rw [ZMod.card,character_score] at hχ
  have hc : (A.card:ℝ) ≤ (score t 3 4:ℝ) :=
    (div_le_div_iff_of_pos_right (by norm_num : (0:ℝ) < 24)).mp hχ
  have hnat : A.card ≤ score t 3 4 := by exact_mod_cast hc
  exact hnat.trans (example_score_upper t)

theorem example_exact_independence :
    exampleSet.card=9 ∧
    (∀ x ∈ exampleSet, x+(3:ZMod 24) ∉ exampleSet ∧ x+(4:ZMod 24) ∉ exampleSet) ∧
    ∀ A : Finset (ZMod 24),
      (∀ x ∈ A, x+(3:ZMod 24) ∉ A ∧ x+(4:ZMod 24) ∉ A) → A.card ≤ exampleSet.card := by
  refine ⟨exampleSet_card,exampleSet_avoids,?_⟩
  intro A hA
  rw [exampleSet_card]
  exact example_independent_upper A hA

def sevenCycle : Fin 7 → ZMod 24 := ![0,3,6,9,12,16,20]

theorem sevenCycle_injective : Function.Injective sevenCycle := by decide

theorem sevenCycle_steps : ∀ i,
    ForbiddenStep (3:ZMod 24) 4 (sevenCycle i) (sevenCycle (finRotate 7 i)) := by decide

theorem no_label_cycle_one :
    ∀ f : Fin 1 → Fin 4, (∑ i, labelledJump (3:ZMod 24) 4 (f i)) ≠ 0 := by decide

theorem no_label_cycle_three :
    ∀ f : Fin 3 → Fin 4, (∑ i, labelledJump (3:ZMod 24) 4 (f i)) ≠ 0 := by decide

theorem no_label_cycle_five :
    ∀ f : Fin 5 → Fin 4, (∑ i, labelledJump (3:ZMod 24) 4 (f i)) ≠ 0 := by decide

/-- No odd closed walk shorter than seven exists; the displayed seven-cycle
has distinct vertices. These statements certify odd girth seven. -/
theorem no_short_odd_closed_walk (n : ℕ) (hodd : Odd n) (hshort : n < 7)
    (p : Fin n → ZMod 24) :
    ¬ ∀ i, ForbiddenStep (3:ZMod 24) 4 (p i) (p (finRotate n i)) := by
  intro hstep
  have hn : n=1 ∨ n=3 ∨ n=5 := by
    have := Nat.odd_iff.mp hodd
    omega
  rcases hn with rfl | rfl | rfl
  · obtain ⟨f,hf⟩ := closed_walk_labels 3 4 p (finRotate 1) hstep
    exact no_label_cycle_one f hf
  · obtain ⟨f,hf⟩ := closed_walk_labels 3 4 p (finRotate 3) hstep
    exact no_label_cycle_three f hf
  · obtain ⟨f,hf⟩ := closed_walk_labels 3 4 p (finRotate 5) hstep
    exact no_label_cycle_five f hf

theorem example_odd_cycle_bound_gap : exampleSet.card < (24*(7-1))/(2*7) := by decide

theorem example_no_sharp_pair :
    ¬ ∃ r s : ℕ, 10 ≤ r ∧ r ≤ 14 ∧ 10 ≤ s ∧ s ≤ 14 ∧
      (4:ZMod 24)*(r:ZMod 24)=(3:ZMod 24)*(s:ZMod 24) := by
  intro h
  have hupper : ∀ A : Finset (ZMod 24),
      (∀ x ∈ A, x+(3:ZMod 24) ∉ A ∧ x+(4:ZMod 24) ∉ A) → A.card ≤ 10 :=
    fun A hA => (example_independent_upper A hA).trans (by decide)
  obtain ⟨A,hA,hcard⟩ := (attains_upper_bound_iff 3 4 example_generate 10 hupper).mpr h
  have hh := example_independent_upper A hA
  omega

end Cyclic
end Motzkin
