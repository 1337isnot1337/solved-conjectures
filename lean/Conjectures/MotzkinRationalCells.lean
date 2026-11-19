import Conjectures.MotzkinCircleLift
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! A finite set of residues determines a finite union of half-open cells.
The cells are disjoint and each has measure `1/N`. -/
namespace Motzkin.RationalIntervals

open Set MeasureTheory MeasureTheory.Measure
open scoped BigOperators

variable {N : ℕ} [NeZero N]

def realCell (j : ZMod N) : Set ℝ :=
  Ico ((j.val:ℝ)/(N:ℝ)) (((j.val:ℝ)+1)/(N:ℝ))

def realUnion (A : Finset (ZMod N)) : Set ℝ := ⋃ j ∈ A, realCell j

def circleUnion (A : Finset (ZMod N)) : Set UnitAddCircle :=
  ((↑):ℝ → UnitAddCircle) '' realUnion A

theorem realCell_subset (j : ZMod N) : realCell j ⊆ Ico (0:ℝ) 1 := by
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  intro r hr
  refine ⟨(div_nonneg (Nat.cast_nonneg _) hN.le).trans hr.1,?_⟩
  apply hr.2.trans_le
  apply (div_le_one hN).mpr
  exact_mod_cast Nat.succ_le_iff.mpr (ZMod.val_lt j)

theorem realUnion_subset (A : Finset (ZMod N)) : realUnion A ⊆ Ico (0:ℝ) 1 := by
  intro r hr
  obtain ⟨j,_,hrj⟩ := Set.mem_iUnion₂.mp hr
  exact realCell_subset j hrj

omit [NeZero N] in
theorem measurable_realCell (j : ZMod N) : MeasurableSet (realCell j) := measurableSet_Ico

omit [NeZero N] in
theorem measurable_realUnion (A : Finset (ZMod N)) : MeasurableSet (realUnion A) :=
  A.measurableSet_biUnion (fun j _ => measurable_realCell j)

theorem mem_realCell_iff_floor (j : ZMod N) (r : ℝ) :
    r ∈ realCell j ↔ Int.floor ((N:ℝ)*r)=(j.val:ℤ) := by
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  rw [Int.floor_eq_iff]
  simp only [Int.cast_natCast]
  constructor
  · intro hr
    exact ⟨by simpa only [mul_comm] using (div_le_iff₀ hN).mp hr.1,
      by simpa only [mul_comm] using (lt_div_iff₀ hN).mp hr.2⟩
  · intro hr
    exact ⟨(div_le_iff₀ hN).mpr (by simpa only [mul_comm] using hr.1),
      (lt_div_iff₀ hN).mpr (by simpa only [mul_comm] using hr.2)⟩

theorem realCell_disjoint {i j : ZMod N} (hne : i ≠ j) :
    Disjoint (realCell i) (realCell j) := by
  apply Set.disjoint_left.mpr
  intro r hi hj
  apply hne
  apply ZMod.val_injective N
  have he := (mem_realCell_iff_floor i r).mp hi
  have hf := (mem_realCell_iff_floor j r).mp hj
  exact_mod_cast he.symm.trans hf

theorem realCell_volume_real (j : ZMod N) : volume.real (realCell j)=1/(N:ℝ) := by
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  have hle : (j.val:ℝ)/(N:ℝ) ≤ ((j.val:ℝ)+1)/(N:ℝ) :=
    (div_le_div_iff_of_pos_right hN).mpr (by linarith)
  rw [realCell,Real.volume_real_Ico_of_le hle]
  ring

theorem realUnion_volume_real (A : Finset (ZMod N)) :
    volume.real (realUnion A)=(A.card:ℝ)/(N:ℝ) := by
  have hd : Set.PairwiseDisjoint (A:Set (ZMod N)) realCell :=
    fun _ _ _ _ hne => realCell_disjoint hne
  unfold realUnion
  rw [measureReal_biUnion_finset hd (fun j _ => measurable_realCell j)
    (fun j _ => by rw [realCell,Real.volume_Ico]; exact ENNReal.ofReal_ne_top)]
  simp only [realCell_volume_real,Finset.sum_const,nsmul_eq_mul]
  ring

theorem circleUnion_eq_liftSet (A : Finset (ZMod N)) :
    circleUnion A=liftSet (realUnion A) := image_eq_liftSet (realUnion_subset A)

omit [NeZero N] in
theorem circleUnion_eq_iUnion (A : Finset (ZMod N)) :
    circleUnion A=⋃ j ∈ A, ((↑):ℝ → UnitAddCircle) ''
      Ico ((j.val:ℝ)/(N:ℝ)) (((j.val:ℝ)+1)/(N:ℝ)) := by
  simp only [circleUnion,realUnion,realCell,Set.image_iUnion]

theorem measurable_circleUnion (A : Finset (ZMod N)) : MeasurableSet (circleUnion A) :=
  image_measurable (realUnion_subset A) (measurable_realUnion A)

theorem circleUnion_volume_real (A : Finset (ZMod N)) :
    volume.real (circleUnion A)=(A.card:ℝ)/(N:ℝ) := by
  exact (image_volume_real (realUnion_subset A) (measurable_realUnion A)).trans
    (realUnion_volume_real A)

end Motzkin.RationalIntervals
