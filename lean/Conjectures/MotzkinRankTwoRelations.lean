import Conjectures.MotzkinRelations
import Conjectures.MotzkinRankTwo
import Mathlib.Order.ConditionallyCompleteLattice.Finset

/-! The explicit finite grid computes the compact-group density whenever the
relation lattice has basis (m,0),(s,k). -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure

theorem rankTwoPoint_compatible {G : Type*} [AddCommGroup G]
    (a b : G) (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*s ∧ t=v*(k:ℤ)) (i j : ℕ) :
    RelationCompatible a b (rankTwoPoint m k s i j).1 (rankTwoPoint m k s i j).2 := by
  obtain ⟨h₁,h₂⟩ := rankTwoPoint_relations m k s hm hk i j
  intro r t hrt
  obtain ⟨u,v,rfl,rfl⟩ := hgen r t hrt
  rw [add_zsmul,mul_zsmul,mul_zsmul,mul_zsmul,natCast_zsmul,natCast_zsmul]
  calc
    _ = u • (m • (rankTwoPoint m k s i j).1)+
        v • (s • (rankTwoPoint m k s i j).1+k • (rankTwoPoint m k s i j).2) := by
      rw [smul_add]
      abel
    _ = 0 := by rw [h₁,h₂,smul_zero,smul_zero,add_zero]

theorem rank_two_characterValue {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (hma : m • a=0) (hskb : s • a+k • b=0)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*s ∧ t=v*(k:ℤ)) :
    ∃ i : Fin m, ∃ j : Fin k,
      characterValue a b=
        min ‖(rankTwoPoint m k s i j).1‖ ‖(rankTwoPoint m k s i j).2‖ ∧
      ∀ i' : Fin m, ∀ j' : Fin k,
        min ‖(rankTwoPoint m k s i' j').1‖ ‖(rankTwoPoint m k s i' j').2‖ ≤
          characterValue a b := by
  obtain ⟨i,j,hmax⟩ := rank_two_annihilator_maximum m k s hm hk
  refine ⟨i,j,le_antisymm ?_ ?_,?_⟩
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    apply hmax (χ a) (χ b)
    · rw [← map_nsmul,hma,map_zero]
    · rw [← map_zsmul,← map_nsmul,← map_add,hskb,map_zero]
  · exact relationCompatible_score_le_characterValue a b _ _
      (rankTwoPoint_compatible a b m k s hm hk hgen i j)
  · intro i' j'
    exact relationCompatible_score_le_characterValue a b _ _
      (rankTwoPoint_compatible a b m k s hm hk hgen i' j')

theorem rank_two_density {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (hma : m • a=0) (hskb : s • a+k • b=0)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*s ∧ t=v*(k:ℤ)) :
    ∃ i : Fin m, ∃ j : Fin k,
      density μ a b=
        min ‖(rankTwoPoint m k s i j).1‖ ‖(rankTwoPoint m k s i j).2‖ ∧
      ∀ i' : Fin m, ∀ j' : Fin k,
        min ‖(rankTwoPoint m k s i' j').1‖ ‖(rankTwoPoint m k s i' j').2‖ ≤
          density μ a b := by
  rw [compact_two_difference_theorem μ a b]
  exact rank_two_characterValue a b m k s hm hk hma hskb hgen

theorem exists_character_maximum_of_finite_relations {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] (a b : G) (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (hma : m • a=0) (hskb : s • a+k • b=0) :
    ∃ χ : G →ₜ+ UnitAddCircle, min ‖χ a‖ ‖χ b‖=characterValue a b := by
  let C : Set ℝ := Set.range
    (fun χ : G →ₜ+ UnitAddCircle => min ‖χ a‖ ‖χ b‖)
  let score (p : Fin m × Fin k) :=
    min ‖(rankTwoPoint m k s p.1 p.2).1‖ ‖(rankTwoPoint m k s p.1 p.2).2‖
  have hfinite : C.Finite := (Set.finite_range score).subset (by
    rintro r ⟨χ,rfl⟩
    have hx : m • χ a=0 := by rw [← map_nsmul,hma,map_zero]
    have hy : s • χ a+k • χ b=0 := by
      rw [← map_zsmul,← map_nsmul,← map_add,hskb,map_zero]
    obtain ⟨i,j,hij⟩ := rank_two_grid_complete m k s hm hk (χ a) (χ b) hx hy
    refine ⟨(i,j),?_⟩
    change min ‖(rankTwoPoint m k s i j).1‖ ‖(rankTwoPoint m k s i j).2‖=_
    rw [← hij])
  exact (character_candidates_nonempty a b).csSup_mem hfinite

/-- In particular, rational pairs of circle differences admit a Borel avoiding
set attaining their density. This statement also applies in any compact group
when two independent integral relations hold. -/
theorem finite_relation_density_attained {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (hma : m • a=0) (hskb : s • a+k • b=0) :
    ∃ A : Set G, MeasurableSet A ∧ Avoids A a b ∧ μ.real A=density μ a b := by
  obtain ⟨χ,hχ⟩ := exists_character_maximum_of_finite_relations a b m k s hm hk hma hskb
  obtain ⟨A,hA,havoid,hscore⟩ :=
    character_lower_bound μ χ.toAddMonoidHom χ.continuous.measurable a b
  refine ⟨A,hA,havoid,le_antisymm (le_density μ hA havoid) ?_⟩
  rw [compact_two_difference_theorem μ a b,← hχ]
  exact hscore

end Motzkin
