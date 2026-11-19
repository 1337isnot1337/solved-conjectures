import Conjectures.LonelinessHyperplaneBasic
import Conjectures.LonelinessHyperplaneDenominator
import Mathlib.Topology.Instances.Rat
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise

/-! Real admissibility supplies a positive, distinct integer kernel
point. A rational projection along an integer Bézout vector preserves
the relation. Rational density and a finite common denominator then
discharge the witness hypothesis in the box-count lower bound. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The original admissibility condition uses real coordinates. -/
def RealAdmissible (m : ι → ℤ) : Prop :=
  ∃ x : ι → ℝ, pairing m x = 0 ∧ (∀ i, 0 < x i) ∧ Function.Injective x

def positiveDistinctReal : Set (ι → ℝ) :=
  {x | (∀ i, 0 < x i) ∧ Function.Injective x}

theorem isOpen_positiveDistinctReal : IsOpen (positiveDistinctReal (ι := ι)) := by
  have hpos : IsOpen {x : ι → ℝ | ∀ i, 0 < x i} := by
    simpa only [Set.ofPred_forall] using
      isOpen_iInter_of_finite (fun i : ι =>
        isOpen_lt (continuous_const : Continuous (fun _ : ι → ℝ => (0 : ℝ)))
          (continuous_apply i))
  have hne : IsOpen {x : ι → ℝ | ∀ i, ∀ j : {j : ι // j ≠ i}, x i ≠ x j} := by
    simpa only [Set.ofPred_forall] using
      isOpen_iInter_of_finite (fun i : ι =>
        isOpen_iInter_of_finite (fun j : {j : ι // j ≠ i} =>
          isOpen_ne_fun (continuous_apply i) (continuous_apply j.1)))
  have heq : {x : ι → ℝ | ∀ i, ∀ j : {j : ι // j ≠ i}, x i ≠ x j} =
      {x : ι → ℝ | Function.Injective x} := by
    ext x
    constructor
    · intro hx i j hij
      by_contra h
      exact hx i ⟨j, Ne.symm h⟩ hij
    · intro hx i j hij
      exact j.2 (hx hij).symm
  rw [heq] at hne
  exact hpos.inter hne

def relationProjection (m e : ι → ℤ) (x : ι → ℝ) : ι → ℝ :=
  x - pairing m x • integerVector e

omit [DecidableEq ι] in
theorem continuous_pairing (m : ι → ℤ) : Continuous (pairing m) := by
  unfold pairing
  apply continuous_finsetSum
  intro i _
  exact continuous_const.mul (continuous_apply i)

omit [DecidableEq ι] in
theorem continuous_relationProjection (m e : ι → ℤ) :
    Continuous (relationProjection m e) :=
  continuous_id.sub ((continuous_pairing m).smul continuous_const)

omit [DecidableEq ι] in
theorem relationProjection_mem (m e : ι → ℤ) (he : integerPairing m e = 1)
    (x : ι → ℝ) : pairing m (relationProjection m e x) = 0 := by
  have heR : pairing m (integerVector e) = 1 := by
    rw [pairing_integerVector]
    exact_mod_cast he
  rw [relationProjection, pairing_sub, pairing_smul, heR, mul_one, sub_self]

omit [DecidableEq ι] in
theorem relationProjection_eq (m e : ι → ℤ) {x : ι → ℝ}
    (hx : pairing m x = 0) : relationProjection m e x = x := by
  simp [relationProjection, hx]

def rationalVector (q : ι → ℚ) : ι → ℝ := fun i => (q i : ℝ)

def rationalRelationProjection (m e : ι → ℤ) (q : ι → ℚ) : ι → ℚ :=
  fun i => q i - (∑ j, (m j : ℚ) * q j) * (e i : ℚ)

omit [DecidableEq ι] in
theorem rationalVector_projection (m e : ι → ℤ) (q : ι → ℚ) :
    rationalVector (rationalRelationProjection m e q) =
      relationProjection m e (rationalVector q) := by
  funext i
  simp [rationalVector, rationalRelationProjection, relationProjection,
    pairing, integerVector]

omit [Fintype ι] [DecidableEq ι] in
theorem denseRange_rationalVector : DenseRange (rationalVector (ι := ι)) :=
  DenseRange.piMap (fun _ : ι => Rat.denseRange_cast)

theorem exists_positive_distinct_rational_kernel
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m) :
    ∃ q : ι → ℚ, pairing m (rationalVector q) = 0 ∧
      (∀ i, 0 < q i) ∧ Function.Injective q := by
  obtain ⟨e, he⟩ := primitive_bezout m hm
  change integerPairing m e = 1 at he
  obtain ⟨x, hx, hpos, hinj⟩ := hreal
  let U : Set (ι → ℝ) := (relationProjection m e) ⁻¹' positiveDistinctReal
  have hU : IsOpen U :=
    isOpen_positiveDistinctReal.preimage (continuous_relationProjection m e)
  have hxU : x ∈ U := by
    change (∀ i, 0 < relationProjection m e x i) ∧
      Function.Injective (relationProjection m e x)
    rw [relationProjection_eq m e hx]
    exact ⟨hpos, hinj⟩
  obtain ⟨q, hq⟩ := denseRange_rationalVector.exists_mem_open hU ⟨x, hxU⟩
  let r := rationalRelationProjection m e q
  have hr : rationalVector r = relationProjection m e (rationalVector q) :=
    rationalVector_projection m e q
  have hgood : (∀ i, 0 < rationalVector r i) ∧
      Function.Injective (rationalVector r) := by
    rw [hr]
    exact hq
  refine ⟨r, ?_, ?_, ?_⟩
  · rw [hr]
    exact relationProjection_mem m e he _
  · intro i
    have hi := hgood.1 i
    change (0 : ℝ) < (r i : ℝ) at hi
    exact_mod_cast hi
  · intro i j hij
    apply hgood.2
    exact congrArg (fun z : ℚ => (z : ℝ)) hij

def rationalCommonDenominator (q : ι → ℚ) : ℕ := ∏ i, (q i).den

omit [DecidableEq ι] in
theorem rationalCommonDenominator_pos (q : ι → ℚ) :
    0 < rationalCommonDenominator q := by
  exact Finset.prod_pos (fun i _ => (q i).den_pos)

omit [DecidableEq ι] in
theorem den_dvd_rationalCommonDenominator (q : ι → ℚ) (i : ι) :
    (q i).den ∣ rationalCommonDenominator q :=
  Finset.dvd_prod_of_mem (fun j => (q j).den) (Finset.mem_univ i)

def clearedRationalVector (q : ι → ℚ) : ι → ℤ :=
  fun i => ((rationalCommonDenominator q / (q i).den : ℕ) : ℤ) * (q i).num

omit [DecidableEq ι] in
theorem cast_clearedRationalVector (q : ι → ℚ) (i : ι) :
    (clearedRationalVector q i : ℚ) = (rationalCommonDenominator q : ℚ) * q i := by
  have hd := Nat.div_mul_cancel (den_dvd_rationalCommonDenominator q i)
  simp only [clearedRationalVector, Int.cast_mul, Int.cast_natCast]
  calc
    ((rationalCommonDenominator q / (q i).den : ℕ) : ℚ) * ((q i).num : ℚ) =
        ((rationalCommonDenominator q / (q i).den : ℕ) : ℚ) *
          (((q i).den : ℚ) * q i) := by rw [Rat.den_mul_eq_num]
    _ = (((rationalCommonDenominator q / (q i).den) * (q i).den : ℕ) : ℚ) * q i := by
      push_cast
      ring
    _ = _ := by rw [hd]

omit [DecidableEq ι] in
theorem integerVector_clearedRationalVector (q : ι → ℚ) :
    integerVector (clearedRationalVector q) =
      (rationalCommonDenominator q : ℝ) • rationalVector q := by
  funext i
  have h := cast_clearedRationalVector q i
  change (clearedRationalVector q i : ℝ) = (rationalCommonDenominator q : ℝ) * (q i : ℝ)
  exact_mod_cast h

/-- The witness is in the literal integer kernel and retains strict
positivity and pairwise distinct coordinates. -/
theorem exists_positive_distinct_integer_kernel
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m) :
    ∃ u : ι → ℤ, integerPairing m u = 0 ∧
      (∀ i, 0 < u i) ∧ Function.Injective u := by
  obtain ⟨q, hq, hpos, hinj⟩ := exists_positive_distinct_rational_kernel m hm hreal
  refine ⟨clearedRationalVector q, ?_, ?_, ?_⟩
  · have hz : pairing m (integerVector (clearedRationalVector q)) = 0 := by
      rw [integerVector_clearedRationalVector, pairing_smul, hq, mul_zero]
    rw [pairing_integerVector] at hz
    exact_mod_cast hz
  · intro i
    have hD : (0 : ℚ) < (rationalCommonDenominator q : ℚ) := by
      exact_mod_cast rationalCommonDenominator_pos q
    have hi : (0 : ℚ) < (clearedRationalVector q i : ℚ) := by
      rw [cast_clearedRationalVector]
      exact mul_pos hD (hpos i)
    exact_mod_cast hi
  · intro i j hij
    apply hinj
    have hcast := congrArg (fun z : ℤ => (z : ℚ)) hij
    rw [cast_clearedRationalVector, cast_clearedRationalVector] at hcast
    have hD : (rationalCommonDenominator q : ℚ) ≠ 0 := by
      exact_mod_cast (ne_of_gt (rationalCommonDenominator_pos q))
    exact (mul_left_cancel₀ hD) hcast

theorem realAdmissible_iff_integer_witness
    (m : ι → ℤ) (hm : PrimitiveNormal m) :
    RealAdmissible m ↔ ∃ u : ι → ℤ, integerPairing m u = 0 ∧
      (∀ i, 0 < u i) ∧ Function.Injective u := by
  refine ⟨exists_positive_distinct_integer_kernel m hm, ?_⟩
  rintro ⟨u, hu, hpos, hinj⟩
  refine ⟨integerVector u, ?_, ?_, ?_⟩
  · rw [pairing_integerVector]
    exact_mod_cast hu
  · intro i
    change (0 : ℝ) < (u i : ℝ)
    exact_mod_cast hpos i
  · intro i j hij
    apply hinj
    change (u i : ℝ) = (u j : ℝ) at hij
    exact_mod_cast hij

/-- Real admissibility gives the sampling denominator bound with a
fixed positive constant. No lattice-volume asymptotic is assumed. -/
theorem exists_admissible_box_denominator
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m) :
    ∃ C : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      (N / C) ^ (Fintype.card ι - 1) ≤ (positiveBoxAdmissible m N).card := by
  obtain ⟨u, hu, hpos, hinj⟩ := exists_positive_distinct_integer_kernel m hm hreal
  exact exists_positiveBoxAdmissible_card_lower m hm u hu hpos hinj

end

end Loneliness.Hyperplane
