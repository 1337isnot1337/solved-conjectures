import Conjectures.MotzkinCyclicGeneral
import Conjectures.MotzkinRankTwoRelations

/-! The rational circle consequence, with the actual finite cyclic optimum
and attainment by a Borel avoiding set. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure

theorem characterValue_map_eq {H G : Type*} [AddCommGroup H] [AddCommGroup G]
    [TopologicalSpace H] [DiscreteTopology H]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (f : H →+ G) (hf : Function.Injective f) (a b : H) :
    characterValue (f a) (f b)=characterValue a b := by
  apply le_antisymm
  · apply csSup_le (character_candidates_nonempty (f a) (f b))
    rintro r ⟨χ,rfl⟩
    let ψ : H →ₜ+ UnitAddCircle :=
      {toAddMonoidHom := χ.toAddMonoidHom.comp f,
       continuous_toFun := continuous_of_discreteTopology}
    exact le_characterValue a b ψ
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    exact algebraic_character_le_characterValue f hf a b χ.toAddMonoidHom

theorem rational_circle_density (μ : Measure UnitAddCircle)
    [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (N : ℕ) [NeZero N] (a b : ZMod N) :
    density μ (ZMod.toAddCircle a) (ZMod.toAddCircle b)=
      (Cyclic.independence a b:ℝ)/(N:ℝ) := by
  rw [compact_two_difference_theorem μ,
    characterValue_map_eq ZMod.toAddCircle (ZMod.toAddCircle_injective N),
    Cyclic.characterValue_eq_independence]

theorem rational_pair_density (μ : Measure UnitAddCircle)
    [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (N a b : ℕ) [NeZero N] :
    density μ (((a:ℝ)/(N:ℝ):ℝ):UnitAddCircle) (((b:ℝ)/(N:ℝ):ℝ):UnitAddCircle)=
      (Cyclic.independence (a:ZMod N) (b:ZMod N):ℝ)/(N:ℝ) := by
  simpa only [ZMod.toAddCircle_natCast] using
    rational_circle_density μ N (a:ZMod N) (b:ZMod N)

theorem rational_circle_density_attained (μ : Measure UnitAddCircle)
    [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (N : ℕ) [NeZero N] (a b : ZMod N) :
    ∃ A : Set UnitAddCircle, MeasurableSet A ∧
      Avoids A (ZMod.toAddCircle a) (ZMod.toAddCircle b) ∧
      μ.real A=(Cyclic.independence a b:ℝ)/(N:ℝ) := by
  have hNa : N • ZMod.toAddCircle a=0 := by
    rw [← map_nsmul]
    simp only [nsmul_eq_mul,ZMod.natCast_self,zero_mul,map_zero]
  have hNb : (0:ℤ) • ZMod.toAddCircle a+N • ZMod.toAddCircle b=0 := by
    rw [zero_zsmul,zero_add,← map_nsmul]
    simp only [nsmul_eq_mul,ZMod.natCast_self,zero_mul,map_zero]
  obtain ⟨A,hA,havoid,hmeasure⟩ := finite_relation_density_attained μ
    (ZMod.toAddCircle a) (ZMod.toAddCircle b) N N 0 (NeZero.pos N) (NeZero.pos N) hNa hNb
  exact ⟨A,hA,havoid,hmeasure.trans (rational_circle_density μ N a b)⟩

end Motzkin
