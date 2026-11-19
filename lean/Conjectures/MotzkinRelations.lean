import Conjectures.MotzkinCompact
import Conjectures.MotzkinRankOne
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Topology.Order.Compact

/-! The relation lattice determines the compact two-difference value. The
maximum is attained on its annihilator, even when no continuous character of
the original group attains the supremum. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure

def pairSum {G : Type*} [AddCommGroup G] (a b : G) : (ℤ × ℤ) →+ G where
  toFun p := p.1 • a+p.2 • b
  map_zero' := by simp
  map_add' p q := by
    change (p.1+q.1) • a+(p.2+q.2) • b=_
    rw [add_zsmul,add_zsmul]
    abel

def RelationCompatible {G : Type*} [AddCommGroup G] (a b : G)
    (x y : UnitAddCircle) : Prop :=
  ∀ u v : ℤ, u • a+v • b=0 → u • x+v • y=0

theorem character_relationCompatible {G : Type*} [AddCommGroup G]
    (a b : G) (χ : G →+ UnitAddCircle) : RelationCompatible a b (χ a) (χ b) := by
  intro u v h
  rw [← map_zsmul,← map_zsmul,← map_add,h,map_zero]

theorem relationCompatible_score_le_characterValue {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) (x y : UnitAddCircle) (hxy : RelationCompatible a b x y) :
    min ‖x‖ ‖y‖ ≤ characterValue a b := by
  let f := pairSum a b
  let g := pairSum x y
  have hker : f.ker ≤ g.ker := by
    intro p hp
    exact hxy p.1 p.2 hp
  let ψ := QuotientAddGroup.lift f.ker g hker
  let e := QuotientAddGroup.kerLift f
  let aQ : (ℤ × ℤ) ⧸ f.ker := QuotientAddGroup.mk' f.ker (1,0)
  let bQ : (ℤ × ℤ) ⧸ f.ker := QuotientAddGroup.mk' f.ker (0,1)
  have h := algebraic_character_le_characterValue e
    (QuotientAddGroup.kerLift_injective f) aQ bQ ψ
  have hea : e aQ = a := by
    change f (1,0) = a
    simp [f,pairSum]
  have heb : e bQ = b := by
    change f (0,1) = b
    simp [f,pairSum]
  have hψa : ψ aQ = x := by
    change g (1,0) = x
    simp [g,pairSum]
  have hψb : ψ bQ = y := by
    change g (0,1) = y
    simp [g,pairSum]
  simpa only [hea,heb,hψa,hψb] using h

theorem exists_annihilator_maximum {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) :
    ∃ x y : UnitAddCircle, RelationCompatible a b x y ∧
      min ‖x‖ ‖y‖=characterValue a b ∧
      ∀ x' y', RelationCompatible a b x' y' → min ‖x'‖ ‖y'‖ ≤ min ‖x‖ ‖y‖ := by
  let S : Set (UnitAddCircle × UnitAddCircle) :=
    {p | RelationCompatible a b p.1 p.2}
  have hclosed : IsClosed S := by
    simp only [S,RelationCompatible,Set.ofPred_forall]
    apply isClosed_iInter
    intro u
    apply isClosed_iInter
    intro v
    apply isClosed_iInter
    intro _
    exact isClosed_eq (((continuous_zsmul u).comp continuous_fst).add
      ((continuous_zsmul v).comp continuous_snd)) continuous_const
  have hne : S.Nonempty := ⟨(0,0),by intro u v _; simp⟩
  have hc : Continuous (fun p : UnitAddCircle × UnitAddCircle => min ‖p.1‖ ‖p.2‖) :=
    continuous_fst.norm.min continuous_snd.norm
  obtain ⟨p,hp,hmax⟩ := hclosed.isCompact.exists_isMaxOn hne hc.continuousOn
  have hmax' : ∀ q ∈ S, min ‖q.1‖ ‖q.2‖ ≤ min ‖p.1‖ ‖p.2‖ :=
    isMaxOn_iff.mp hmax
  refine ⟨p.1,p.2,hp,le_antisymm
    (relationCompatible_score_le_characterValue a b p.1 p.2 hp) ?_,?_⟩
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    exact hmax' (χ a,χ b) (character_relationCompatible a b χ.toAddMonoidHom)
  · intro x' y' hxy'
    exact hmax' (x',y') hxy'

theorem characterValue_le_half {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] (a b : G) : characterValue a b ≤ 1/2 := by
  apply csSup_le (character_candidates_nonempty a b)
  rintro r ⟨χ,rfl⟩
  exact relation_norm_le_half (χ a) (χ b)

theorem rank_zero_characterValue {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) (hrel : ∀ u v : ℤ, u • a+v • b=0 → u=0 ∧ v=0) :
    characterValue a b=1/2 := by
  apply le_antisymm (characterValue_le_half a b)
  have hcompat : RelationCompatible a b halfPoint halfPoint := by
    intro u v h
    obtain ⟨rfl,rfl⟩ := hrel u v h
    simp
  simpa only [norm_halfPoint,min_self] using
    relationCompatible_score_le_characterValue a b halfPoint halfPoint hcompat

theorem rank_one_characterValue {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) (u v : ℤ) (hk : 0 < u.natAbs+v.natAbs)
    (hrel : u • a+v • b=0)
    (hgen : ∀ r s : ℤ, r • a+s • b=0 → ∃ n : ℤ, r=n*u ∧ s=n*v) :
    characterValue a b = ((u.natAbs+v.natAbs)/2:ℕ)/((u.natAbs+v.natAbs:ℕ):ℝ) := by
  apply le_antisymm
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    exact rank_one_upper u v hk (χ a) (χ b)
      (character_relationCompatible a b χ.toAddMonoidHom u v hrel)
  · obtain ⟨x,y,hxy,hscore⟩ := rank_one_attainment u v hk
    have hcompat : RelationCompatible a b x y := by
      intro r s hrs
      obtain ⟨n,rfl,rfl⟩ := hgen r s hrs
      rw [mul_zsmul,mul_zsmul,← smul_add,hxy,smul_zero]
    rw [← hscore]
    exact relationCompatible_score_le_characterValue a b x y hcompat

theorem rank_zero_density {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (hrel : ∀ u v : ℤ, u • a+v • b=0 → u=0 ∧ v=0) :
    density μ a b=1/2 := by
  rw [compact_two_difference_theorem μ a b,rank_zero_characterValue a b hrel]

theorem rank_one_density {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (u v : ℤ) (hk : 0 < u.natAbs+v.natAbs)
    (hrel : u • a+v • b=0)
    (hgen : ∀ r s : ℤ, r • a+s • b=0 → ∃ n : ℤ, r=n*u ∧ s=n*v) :
    density μ a b = ((u.natAbs+v.natAbs)/2:ℕ)/((u.natAbs+v.natAbs:ℕ):ℝ) := by
  rw [compact_two_difference_theorem μ a b,rank_one_characterValue a b u v hk hrel hgen]

end Motzkin
