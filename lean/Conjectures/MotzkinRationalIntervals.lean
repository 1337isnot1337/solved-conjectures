import Conjectures.MotzkinRationalCircle
import Conjectures.MotzkinRationalCellIndex

/-! The particular finite union of cells asserted in the rational-circle
construction is Borel, avoids the two rational jumps, and attains the density
when its residue set is a maximum independent set. -/
namespace Motzkin.RationalIntervals

open Set MeasureTheory MeasureTheory.Measure

variable {N : ℕ} [NeZero N]

theorem circleUnion_avoids (A : Finset (ZMod N)) (a b : ZMod N)
    (hA : ∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) :
    Avoids (circleUnion A) (ZMod.toAddCircle a) (ZMod.toAddCircle b) := by
  intro x hx
  have hi := (mem_circleUnion A x).mp hx
  constructor
  · simpa only [mem_circleUnion,cellIndex_add] using (hA (cellIndex N x) hi).1
  · simpa only [mem_circleUnion,cellIndex_add] using (hA (cellIndex N x) hi).2

theorem rational_intervals_construction (A : Finset (ZMod N)) (a b : ZMod N)
    (hA : ∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) :
    MeasurableSet (circleUnion A) ∧
      Avoids (circleUnion A) (ZMod.toAddCircle a) (ZMod.toAddCircle b) ∧
      volume.real (circleUnion A)=(A.card:ℝ)/(N:ℝ) :=
  ⟨measurable_circleUnion A,circleUnion_avoids A a b hA,circleUnion_volume_real A⟩

theorem rational_intervals_attain_density (a b : ZMod N) :
    ∃ A : Finset (ZMod N),
      (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) ∧ A.card=Cyclic.independence a b ∧
      MeasurableSet (circleUnion A) ∧
      Avoids (circleUnion A) (ZMod.toAddCircle a) (ZMod.toAddCircle b) ∧
      volume.real (circleUnion A)=density volume (ZMod.toAddCircle a) (ZMod.toAddCircle b) := by
  letI : IsProbabilityMeasure (volume:Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  obtain ⟨A,_,hA,hcard,_,_⟩ := Cyclic.finite_cyclic_theorem_all a b
  refine ⟨A,hA,hcard,measurable_circleUnion A,circleUnion_avoids A a b hA,?_⟩
  rw [circleUnion_volume_real,hcard,rational_circle_density]

/-- The endpoint displays the literal finite union, including its half-open
boundary convention, rather than only an abstract maximizing Borel set. -/
theorem rational_interval_union_attainment (a b : ZMod N) :
    ∃ A : Finset (ZMod N),
      let U : Set UnitAddCircle := ⋃ j ∈ A, ((↑):ℝ → UnitAddCircle) ''
        Ico ((j.val:ℝ)/(N:ℝ)) (((j.val:ℝ)+1)/(N:ℝ))
      A.card=Cyclic.independence a b ∧ MeasurableSet U ∧
        Avoids U (ZMod.toAddCircle a) (ZMod.toAddCircle b) ∧
        volume.real U=density volume (ZMod.toAddCircle a) (ZMod.toAddCircle b) := by
  obtain ⟨A,_,hcard,hm,ha,hv⟩ := rational_intervals_attain_density a b
  refine ⟨A,?_⟩
  dsimp only
  have hall : A.card=Cyclic.independence a b ∧ MeasurableSet (circleUnion A) ∧
      Avoids (circleUnion A) (ZMod.toAddCircle a) (ZMod.toAddCircle b) ∧
      volume.real (circleUnion A)=density volume (ZMod.toAddCircle a) (ZMod.toAddCircle b) :=
    ⟨hcard,hm,ha,hv⟩
  simpa only [circleUnion_eq_iUnion] using hall

end Motzkin.RationalIntervals
