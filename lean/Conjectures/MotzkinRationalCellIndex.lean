import Conjectures.MotzkinRationalCells
import Mathlib.Tactic.FieldSimp

/-! The half-open-cell index commutes with rational translations. This
retains the boundary points exactly; no almost-everywhere exception is used. -/
namespace Motzkin.RationalIntervals

open Set

noncomputable def cellIndex (N : ℕ) (x : UnitAddCircle) : ZMod N :=
  (Int.floor ((N:ℝ)*representative x):ZMod N)

theorem cellIndex_coe (N : ℕ) (r : ℝ) :
    cellIndex N (r:UnitAddCircle)=(Int.floor ((N:ℝ)*r):ZMod N) := by
  unfold cellIndex
  rw [representative_coe_fract]
  have he : (N:ℝ)*Int.fract r=(N:ℝ)*r-(((N:ℤ)*Int.floor r:ℤ):ℝ) := by
    simp only [Int.fract,Int.cast_mul,Int.cast_natCast]
    ring
  rw [he,Int.floor_sub_intCast]
  simp only [Int.cast_sub,Int.cast_mul,Int.cast_natCast,ZMod.natCast_self,zero_mul,sub_zero]

variable {N : ℕ} [NeZero N]

theorem cellIndex_add (x : UnitAddCircle) (a : ZMod N) :
    cellIndex N (x+ZMod.toAddCircle a)=cellIndex N x+a := by
  let r := representative x
  have hx : (r:UnitAddCircle)=x := coe_representative x
  have hN : (N:ℝ) ≠ 0 := by exact_mod_cast NeZero.ne N
  have he : (N:ℝ)*(r+(a.val:ℝ)/(N:ℝ))=(N:ℝ)*r+(a.val:ℝ) := by
    field_simp [hN]
  rw [← hx,ZMod.toAddCircle_apply,← AddCircle.coe_add,cellIndex_coe,cellIndex_coe,
    he,Int.floor_add_natCast]
  simp only [Int.cast_add,Int.cast_natCast,ZMod.natCast_zmod_val]

theorem cellIndex_val (x : UnitAddCircle) :
    ((cellIndex N x).val:ℤ)=Int.floor ((N:ℝ)*representative x) := by
  have hN : (0:ℝ) < N := by exact_mod_cast NeZero.pos N
  have hnonneg : (0:ℤ) ≤ Int.floor ((N:ℝ)*representative x) := by
    apply Int.le_floor.mpr
    simpa using mul_nonneg (Nat.cast_nonneg N) (representative_mem x).1
  have hlt : Int.floor ((N:ℝ)*representative x)<(N:ℤ) := by
    apply Int.floor_lt.mpr
    simpa only [Int.cast_natCast,mul_one] using
      mul_lt_mul_of_pos_left (representative_mem x).2 hN
  change (((Int.floor ((N:ℝ)*representative x):ℤ):ZMod N).val:ℤ)=_
  rw [ZMod.val_intCast]
  exact Int.emod_eq_of_lt hnonneg hlt

theorem mem_circleUnion (A : Finset (ZMod N)) (x : UnitAddCircle) :
    x ∈ circleUnion A ↔ cellIndex N x ∈ A := by
  rw [circleUnion_eq_liftSet]
  change representative x ∈ realUnion A ↔ cellIndex N x ∈ A
  constructor
  · intro hx
    obtain ⟨j,hj,hr⟩ := Set.mem_iUnion₂.mp hx
    have he : cellIndex N x=j := by
      unfold cellIndex
      rw [(mem_realCell_iff_floor j (representative x)).mp hr]
      simp only [Int.cast_natCast,ZMod.natCast_zmod_val]
    rwa [he]
  · intro hx
    apply Set.mem_iUnion₂.mpr
    refine ⟨cellIndex N x,hx,?_⟩
    exact (mem_realCell_iff_floor _ _).mpr (cellIndex_val x).symm

end Motzkin.RationalIntervals
