import Conjectures.LonelinessHyperplaneFourier
import Conjectures.LonelinessHyperplaneHaar
import Conjectures.LonelinessHyperplaneLattice

/-! Haar probability on the actual closed torus kernel, and the exact
character averages on that kernel. Primitivity is used to identify its
annihilator with the integer span of the given normal. -/

namespace Loneliness.Hyperplane

open MeasureTheory
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]

def torusRelationGroup (m : ι → ℤ) : AddSubgroup (UnitAddTorus ι) :=
  (normalHom (G := UnitAddCircle) m).ker

theorem mem_torusRelationGroup (m : ι → ℤ) (x : UnitAddTorus ι) :
    x ∈ torusRelationGroup m ↔ normalHom m x = 0 := Iff.rfl

theorem torusRelationGroup_isClosed (m : ι → ℤ) :
    IsClosed (torusRelationGroup m : Set (UnitAddTorus ι)) := by
  change IsClosed {x : UnitAddTorus ι | normalHom m x = 0}
  exact isClosed_eq (continuous_normalHom m) continuous_const

instance torusRelationGroup_compactSpace (m : ι → ℤ) :
    CompactSpace (torusRelationGroup m) :=
  isCompact_iff_compactSpace.mp (torusRelationGroup_isClosed m).isCompact

private def relationUniverse (m : ι → ℤ) :
    TopologicalSpace.PositiveCompacts (torusRelationGroup m) :=
  ⟨⟨Set.univ, isCompact_univ⟩, by simp⟩

/-- Haar measure normalized on the whole compact subgroup. -/
def relationHaar (m : ι → ℤ) : Measure (torusRelationGroup m) :=
  Measure.addHaarMeasure (relationUniverse m)

instance relationHaar_isAddHaarMeasure (m : ι → ℤ) :
    Measure.IsAddHaarMeasure (relationHaar m) :=
  inferInstanceAs (Measure.IsAddHaarMeasure (Measure.addHaarMeasure (relationUniverse m)))

instance relationHaar_isProbabilityMeasure (m : ι → ℤ) :
    IsProbabilityMeasure (relationHaar m) :=
  ⟨Measure.addHaarMeasure_self⟩

omit [Fintype ι] in
private theorem toCircle_finset_sum (S : Finset ι) (x : ι → UnitAddCircle) :
    (AddCircle.toCircle (∑ i ∈ S, x i) : ℂ) =
      ∏ i ∈ S, (AddCircle.toCircle (x i) : ℂ) := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | @insert i S hi ih =>
    rw [Finset.sum_insert hi, Finset.prod_insert hi, AddCircle.toCircle_add,
      Circle.coe_mul, ih]

theorem mFourier_eq_normalHom (n : ι → ℤ) (x : UnitAddTorus ι) :
    UnitAddTorus.mFourier n x = (AddCircle.toCircle (normalHom n x) : ℂ) := by
  change (∏ i, fourier (n i) (x i)) =
    (AddCircle.toCircle (∑ i, n i • x i) : ℂ)
  simp only [fourier_apply]
  exact (toCircle_finset_sum Finset.univ (fun i => n i • x i)).symm

theorem normalHom_frequency_smul (m : ι → ℤ) (c : ℤ) (x : UnitAddTorus ι) :
    normalHom (c • m) x = c • normalHom m x := by
  change (∑ i, (c * m i) • x i) = c • (∑ i, m i • x i)
  simp only [mul_smul, Finset.smul_sum]

theorem normalHom_velocity (m v : ι → ℤ) (t : UnitAddCircle) :
    normalHom m (fun i => v i • t) = integerPairing m v • t := by
  change (∑ i, m i • (v i • t)) = (∑ i, m i * v i) • t
  simp only [mul_smul, Finset.sum_smul]

theorem torusRelation_character_of_multiple
    (m n : ι → ℤ) (h : ∃ c : ℤ, n = c • m) :
    ∀ x : torusRelationGroup m,
      UnitAddTorus.mFourier n (x : UnitAddTorus ι) = 1 := by
  obtain ⟨c, rfl⟩ := h
  intro x
  rw [mFourier_eq_normalHom, normalHom_frequency_smul]
  have hx : normalHom m (x : UnitAddTorus ι) = 0 := x.2
  rw [hx, smul_zero, AddCircle.toCircle_zero, Circle.coe_one]

/-- A nonparallel integer frequency takes the value minus one at an
explicit point of the actual torus kernel. -/
theorem exists_torusRelation_character_ne_one
    (m : ι → ℤ) (hm : PrimitiveNormal m) (n : ι → ℤ)
    (hn : ¬ ∃ c : ℤ, n = c • m) :
    ∃ x : torusRelationGroup m,
      UnitAddTorus.mFourier n (x : UnitAddTorus ι) ≠ 1 := by
  obtain ⟨z, hmz, hnz⟩ := exists_integer_kernel_separator m hm n hn
  let t : UnitAddCircle := (((1 : ℝ) / 2 / (integerPairing n z : ℝ) : ℝ) : UnitAddCircle)
  have hx : (fun i => z i • t) ∈ torusRelationGroup m := by
    rw [mem_torusRelationGroup, normalHom_velocity, hmz, zero_smul]
  refine ⟨⟨fun i => z i • t, hx⟩, ?_⟩
  change UnitAddTorus.mFourier n (fun i => z i • t) ≠ 1
  rw [mFourier_velocity]
  have hphase : fourier (integerPairing n z) t = (-1 : ℂ) := by
    simpa only [zero_add, fourier_eval_zero] using
      (fourier_add_half_inv_index hnz (by norm_num : (0 : ℝ) < 1)
        (0 : UnitAddCircle))
  change fourier (integerPairing n z) t ≠ 1
  rw [hphase]
  norm_num

theorem torusRelation_character_trivial_iff
    (m : ι → ℤ) (hm : PrimitiveNormal m) (n : ι → ℤ) :
    (∀ x : torusRelationGroup m,
      UnitAddTorus.mFourier n (x : UnitAddTorus ι) = 1) ↔
      ∃ c : ℤ, n = c • m := by
  constructor
  · intro h
    by_contra hn
    obtain ⟨x, hx⟩ := exists_torusRelation_character_ne_one m hm n hn
    exact hx (h x)
  · exact torusRelation_character_of_multiple m n

theorem integral_relation_mFourier_of_multiple
    (m n : ι → ℤ) (hn : ∃ c : ℤ, n = c • m) :
    (∫ x : torusRelationGroup m,
      UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂relationHaar m) = 1 :=
  integral_subgroup_mFourier_eq_one (torusRelationGroup m) (relationHaar m) n
    (torusRelation_character_of_multiple m n hn)

theorem integral_relation_mFourier_of_not_multiple
    (m : ι → ℤ) (hm : PrimitiveNormal m) (n : ι → ℤ)
    (hn : ¬ ∃ c : ℤ, n = c • m) :
    (∫ x : torusRelationGroup m,
      UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂relationHaar m) = 0 :=
  integral_subgroup_mFourier_eq_zero (torusRelationGroup m) (relationHaar m) n
    (exists_torusRelation_character_ne_one m hm n hn)

/-- A velocity whose only annihilating frequency here is a multiple of
the prescribed normal has the same character average as the whole kernel. -/
theorem integral_mFourier_velocity_eq_relation
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0) (n : ι → ℤ)
    (hn : (¬ ∃ c : ℤ, n = c • m) → integerPairing n v ≠ 0) :
    (∫ t : UnitAddCircle, UnitAddTorus.mFourier n (fun i => v i • t)) =
      ∫ x : torusRelationGroup m,
        UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂relationHaar m := by
  classical
  rw [integral_mFourier_velocity]
  change (if integerPairing n v = 0 then (1 : ℂ) else 0) = _
  by_cases hnm : ∃ c : ℤ, n = c • m
  · have hnv : integerPairing n v = 0 := by
      obtain ⟨c, rfl⟩ := hnm
      rw [integerPairing_comm (c • m) v, integerPairing_smul,
        integerPairing_comm v m, hv, mul_zero]
    rw [ite_eq_left hnv,
      integral_relation_mFourier_of_multiple m n hnm]
  · rw [ite_eq_right (hn hnm),
      integral_relation_mFourier_of_not_multiple m hm n hnm]

end

end Loneliness.Hyperplane
