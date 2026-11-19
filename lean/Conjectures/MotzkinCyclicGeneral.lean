import Conjectures.MotzkinCompact
import Conjectures.MotzkinCyclic
import Mathlib.Topology.Instances.ZMod

/-! The cyclic formula without a generation hypothesis. The finite character
maximum is an attained independence number, including disconnected graphs. -/
namespace Motzkin.Cyclic

open MeasureTheory MeasureTheory.Measure
open scoped ENNReal

variable {N : ℕ} [NeZero N]

noncomputable def independence (a b : ZMod N) : ℕ :=
  Finset.univ.sup (fun t => score t a b)

theorem score_le_independence (a b t : ZMod N) : score t a b ≤ independence a b :=
  Finset.le_sup (Finset.mem_univ t)

theorem exists_score_eq_independence (a b : ZMod N) :
    ∃ t : ZMod N, score t a b=independence a b := by
  obtain ⟨t,_,ht⟩ := Finset.exists_mem_eq_sup (Finset.univ : Finset (ZMod N))
    Finset.univ_nonempty (fun t => score t a b)
  exact ⟨t,ht.symm⟩

theorem characterValue_eq_independence (a b : ZMod N) :
    characterValue a b=(independence a b:ℝ)/(N:ℝ) := by
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  apply le_antisymm
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    obtain ⟨t,ht⟩ := character_classification χ.toAddMonoidHom
    change min ‖χ.toAddMonoidHom a‖ ‖χ.toAddMonoidHom b‖ ≤ _
    rw [ht,character_score]
    apply (div_le_div_iff_of_pos_right hN).mpr
    exact_mod_cast score_le_independence a b t
  · obtain ⟨t,ht⟩ := exists_score_eq_independence a b
    let χ : ZMod N →ₜ+ UnitAddCircle :=
      {toAddMonoidHom := character t, continuous_toFun := continuous_of_discreteTopology}
    have h := le_characterValue a b χ
    change min ‖character t a‖ ‖character t b‖ ≤ _ at h
    rwa [character_score,ht] at h

theorem independent_card_le_independence (a b : ZMod N) (B : Finset (ZMod N))
    (hB : ∀ x ∈ B, x+a ∉ B ∧ x+b ∉ B) : B.card ≤ independence a b := by
  classical
  let _ : MeasurableSpace (ZMod N) := ⊤
  let _ : MeasurableSingletonClass (ZMod N) := ⟨fun _ => trivial⟩
  let μ : Measure (ZMod N) := ((count : Measure (ZMod N)) Set.univ)⁻¹ • count
  let _ : IsProbabilityMeasure μ := inferInstance
  let _ : IsAddLeftInvariant μ := inferInstance
  have huniv : (count : Measure (ZMod N)) Set.univ=(N:ℝ≥0∞) := by
    simpa only [Finset.coe_univ,Finset.card_univ,ZMod.card] using
      (count_apply_finset (Finset.univ : Finset (ZMod N)))
  have hratio : μ.real (B:Set (ZMod N))=(B.card:ℝ)/(N:ℝ) := by
    change ((((count : Measure (ZMod N)) Set.univ)⁻¹ • count) (B:Set (ZMod N))).toReal=_
    rw [Measure.smul_apply,smul_eq_mul,huniv,count_apply_finset]
    simp [ENNReal.toReal_mul,ENNReal.toReal_inv,div_eq_mul_inv,mul_comm]
  have h := compact_measure_le_characterValue μ a b
    (show MeasurableSet (B:Set (ZMod N)) from trivial)
    (show Avoids (B:Set (ZMod N)) a b from hB)
  rw [hratio,characterValue_eq_independence] at h
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  exact_mod_cast (div_le_div_iff_of_pos_right hN).mp h

/-- The integer character maximum is the exact independence number with no
assumption that the two jumps generate the full cyclic group. -/
theorem finite_cyclic_theorem_all (a b : ZMod N) :
    ∃ A : Finset (ZMod N), ∃ t : ZMod N,
      (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) ∧
      A.card=independence a b ∧ score t a b=A.card ∧
      ∀ B : Finset (ZMod N), (∀ x ∈ B, x+a ∉ B ∧ x+b ∉ B) → B.card ≤ A.card := by
  obtain ⟨t,ht⟩ := exists_score_eq_independence a b
  obtain ⟨A,hA,hlower⟩ := finite_character_independent a b (character t)
  rw [character_score,ht,ZMod.card] at hlower
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  have hcard : A.card=independence a b := by
    apply le_antisymm (independent_card_le_independence a b A hA)
    exact_mod_cast (div_le_div_iff_of_pos_right hN).mp hlower
  refine ⟨A,t,hA,hcard,ht.trans hcard.symm,?_⟩
  intro B hB
  rw [hcard]
  exact independent_card_le_independence a b B hB

theorem score_natCast (a b t : ℕ) :
    score (t:ZMod N) (a:ZMod N) (b:ZMod N) =
      min (min ((t*a)%N) (N-(t*a)%N)) (min ((t*b)%N) (N-(t*b)%N)) := by
  simp only [score,folded,← Nat.cast_mul,ZMod.val_natCast]

end Motzkin.Cyclic
