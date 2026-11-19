import Conjectures.MotzkinEvaluatorGeometry
import Conjectures.MotzkinRankTwoRelations

/-! The exact floor-sum evaluator computes the actual compact-group Motzkin
density when its input is a Hermite basis of the relation lattice. -/
namespace Motzkin.Evaluator

open MeasureTheory MeasureTheory.Measure

theorem hermite_compatible {G : Type*} [AddCommGroup G]
    (a b : G) (m k s : ℕ)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ))
    (x y : UnitAddCircle) (hx : m • x=0) (hy : s • x+k • y=0) :
    RelationCompatible a b x y := by
  intro r t hrt
  obtain ⟨u,v,rfl,rfl⟩ := hgen r t hrt
  rw [add_zsmul,mul_zsmul,mul_zsmul,mul_zsmul,
    natCast_zsmul,natCast_zsmul,natCast_zsmul]
  calc
    _ = u • (m • x)+v • (s • x+k • y) := by rw [smul_add]; abel
    _ = 0 := by rw [hx,hy,smul_zero,smul_zero,add_zero]

theorem characterValue_eq_optimum {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (a b : G) (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    (hma : m • a=0) (hskb : s • a+k • b=0)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ)) :
    characterValue a b=(optimum m k s:ℝ)/(m*k:ℕ) := by
  obtain ⟨x,y,hx,hy,hscore,hmax⟩ := optimum_annihilator_maximum m k s hm hk
  apply le_antisymm
  · apply csSup_le (character_candidates_nonempty a b)
    rintro r ⟨χ,rfl⟩
    apply hmax (χ a) (χ b)
    · rw [← map_nsmul,hma,map_zero]
    · rw [← map_nsmul,← map_nsmul,← map_add,hskb,map_zero]
  · rw [← hscore]
    exact relationCompatible_score_le_characterValue a b x y
      (hermite_compatible a b m k s hgen x y hx hy)

/-- For a normalized Hermite basis, the executable output threshold divided
by the quotient order is the actual Borel-set density. -/
theorem density_eq_quotientOptimum {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m)
    (hma : m • a=0) (hskb : s • a+k • b=0)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ)) :
    density μ a b=((quotientOptimum m k s).1:ℝ)/(m*k:ℕ) := by
  rw [compact_two_difference_theorem μ a b,quotientOptimum_threshold,
    Nat.mod_eq_of_lt hs]
  exact characterValue_eq_optimum a b m k s hm hk hma hskb hgen

/-- The second output component describes an attaining annihilator point.
It uses the very row and residue produced by the executable evaluator. -/
theorem quotientOptimum_attains {G : Type*} [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (a b : G) (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m)
    (hma : m • a=0) (hskb : s • a+k • b=0)
    (hgen : ∀ r t : ℤ, r • a+t • b=0 →
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ)) :
    let z := quotientOptimum m k s
    ∃ i : ℕ, i < m ∧ z.2.1=k*i ∧
      RelationCompatible a b (residuePoint m k i z.2.2).1 (residuePoint m k i z.2.2).2 ∧
      min ‖(residuePoint m k i z.2.2).1‖ ‖(residuePoint m k i z.2.2).2‖=density μ a b := by
  dsimp only
  obtain ⟨i,hi,hxi,hy,hkiL,hkiU,hyL,hyU,hdiv⟩ := quotientOptimum_feasible m k s hm hk
  rw [Nat.mod_eq_of_lt hs] at hdiv
  have hkiL' : (quotientOptimum m k s).1 ≤ k*i := by simpa only [hxi] using hkiL
  have hkiU' : k*i ≤ m*k-(quotientOptimum m k s).1 := by simpa only [hxi] using hkiU
  have hscore : residueScore m k i (quotientOptimum m k s).2.2=(quotientOptimum m k s).1 := by
    apply le_antisymm
    · apply quotientOptimum_optimal m k s hm hk
      rw [Nat.mod_eq_of_lt hs]
      exact residueScore_feasible m k s i _ hi hy hdiv
    · exact feasible_le_residueScore m k _ hkiL' hkiU' hyL hyU
  obtain ⟨hx,hz⟩ := residuePoint_relations m k s i (quotientOptimum m k s).2.2 hm hk
  refine ⟨i,hi,hxi,hermite_compatible a b m k s hgen _ _ hx (hz.mpr hdiv),?_⟩
  rw [residuePoint_score m k i _ hm hk hi hy,hscore,
    density_eq_quotientOptimum μ a b m k s hm hk hs hma hskb hgen]

end Motzkin.Evaluator
