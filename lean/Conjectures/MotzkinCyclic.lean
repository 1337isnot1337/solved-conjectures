import Conjectures.MotzkinFiniteTheorem
import Mathlib.Topology.Instances.AddCircle.Real

/-! The finite two-difference theorem in cyclic coordinates: every character
is a multiplier, and the independence number is the largest folded residue
score among those multipliers. -/
namespace Motzkin.Cyclic

variable {N : ℕ} [NeZero N]

def folded (z : ZMod N) : ℕ := min z.val (N-z.val)

def score (t a b : ZMod N) : ℕ := min (folded (t*a)) (folded (t*b))

noncomputable def character (t : ZMod N) : ZMod N →+ UnitAddCircle where
  toFun z := ZMod.toAddCircle (t*z)
  map_zero' := by rw [mul_zero,map_zero]
  map_add' x y := by rw [mul_add,map_add]

theorem norm_toAddCircle (z : ZMod N) :
    ‖ZMod.toAddCircle z‖=(folded z:ℝ)/(N:ℝ) := by
  rw [ZMod.toAddCircle_apply,UnitAddCircle.norm_eq,abs_sub_round_div_natCast_eq]
  rw [Nat.mod_eq_of_lt z.val_lt]
  rfl

theorem norm_character (t a : ZMod N) :
    ‖character t a‖=(folded (t*a):ℝ)/(N:ℝ) := norm_toAddCircle (t*a)

theorem character_score (t a b : ZMod N) :
    min ‖character t a‖ ‖character t b‖=(score t a b:ℝ)/(N:ℝ) := by
  rw [norm_character,norm_character,min_div_div_right (Nat.cast_nonneg N)]
  rw [score,Nat.cast_min]

theorem character_classification (χ : ZMod N →+ UnitAddCircle) :
    ∃ t : ZMod N, χ=character t := by
  have hN : 0 < N := NeZero.pos N
  have hz : N • (1:ZMod N)=0 := by simp only [nsmul_eq_mul,ZMod.natCast_self,zero_mul]
  have hχ : N • χ 1=0 := by rw [← map_nsmul,hz,map_zero]
  obtain ⟨m,_,hm⟩ := (AddCircle.nsmul_eq_zero_iff hN).mp hχ
  simp only [mul_one] at hm
  have h₁ : χ 1=character (m:ZMod N) 1 := by
    change χ 1=ZMod.toAddCircle ((m:ZMod N)*1)
    rw [mul_one,ZMod.toAddCircle_natCast]
    exact hm.symm
  refine ⟨(m:ZMod N),?_⟩
  ext z
  have he : z.val • (1:ZMod N)=z := by simp [nsmul_eq_mul]
  calc
    χ z = χ (z.val • (1:ZMod N)) := congrArg χ he.symm
    _ = z.val • χ 1 := map_nsmul χ _ _
    _ = z.val • character (m:ZMod N) 1 := congrArg (fun w => z.val • w) h₁
    _ = character (m:ZMod N) (z.val • (1:ZMod N)) := (map_nsmul _ _ _).symm
    _ = character (m:ZMod N) z := congrArg (character (m:ZMod N)) he

/-- Both the independent-set optimum and the maximizing multiplier are actual
witnesses. This is the exact integer independence-number formula. -/
theorem finite_cyclic_theorem (a b : ZMod N)
    (hgen : AddSubgroup.closure ({a,b} : Set (ZMod N))=⊤) :
    ∃ A : Finset (ZMod N), ∃ t : ZMod N,
      (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) ∧ A.card=score t a b ∧
      (∀ B : Finset (ZMod N), (∀ x ∈ B, x+a ∉ B ∧ x+b ∉ B) → B.card ≤ A.card) ∧
      ∀ u : ZMod N, score u a b ≤ A.card := by
  obtain ⟨A,χ,hA,hval,hmax,hchar⟩ := finite_two_difference_theorem a b hgen
  obtain ⟨t,rfl⟩ := character_classification χ
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  rw [ZMod.card,character_score] at hval
  have hcard : A.card=score t a b := by
    have hh := (div_left_inj' hN.ne').mp hval
    exact_mod_cast hh
  refine ⟨A,t,hA,hcard,hmax,?_⟩
  intro u
  have hu := hchar (character u)
  rw [character_score,character_score] at hu
  have hh := (div_le_div_iff_of_pos_right hN).mp hu
  rw [hcard]
  exact_mod_cast hh

end Motzkin.Cyclic
