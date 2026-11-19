import Conjectures.LineSizeGeometry
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Algebra.CharZero.Infinite
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Explicit nonvertical real lines and finite avoidance for constructing
generic carrier arrangements. -/
noncomputable section
namespace LineSize

structure Carrier where
  slope : ℝ
  intercept : ℝ

noncomputable instance : DecidableEq Carrier := Classical.decEq _

def OnCarrier (C : Carrier) (p : Point) : Prop :=
  p.2=C.slope*p.1+C.intercept

def graphPoint (C : Carrier) (x : ℝ) : Point :=
  (x,C.slope*x+C.intercept)

def carrierLine (C : Carrier) : AffineSubspace ℝ Point :=
  line[ℝ, graphPoint C 0, graphPoint C 1]

@[simp] theorem graphPoint_on (C : Carrier) (x : ℝ) :
    OnCarrier C (graphPoint C x) := rfl

theorem mem_carrierLine (C : Carrier) (p : Point) :
    p ∈ carrierLine C ↔ OnCarrier C p := by
  unfold carrierLine
  rw [mem_affineSpan_pair_iff_exists_lineMap_eq]
  constructor
  · rintro ⟨t,rfl⟩
    simp [OnCarrier, graphPoint, AffineMap.lineMap_apply_module]
    ring
  · intro h
    refine ⟨p.1,?_⟩
    apply Prod.ext
    · simp [graphPoint, AffineMap.lineMap_apply_module]
    · simp only [graphPoint, AffineMap.lineMap_apply_module, Prod.snd_add,
        Prod.smul_snd, smul_eq_mul, mul_zero, zero_add, mul_one]
      unfold OnCarrier at h
      nlinarith

def meet (C D : Carrier) : Point :=
  graphPoint C ((D.intercept-C.intercept)/(C.slope-D.slope))

theorem meet_on_left (C D : Carrier) : OnCarrier C (meet C D) := rfl

theorem meet_on_right (C D : Carrier) (hne : C.slope ≠ D.slope) :
    OnCarrier D (meet C D) := by
  unfold OnCarrier meet graphPoint
  dsimp
  field_simp [sub_ne_zero.mpr hne]
  ring

theorem meet_unique (C D : Carrier) (hne : C.slope ≠ D.slope)
    (p : Point) (hC : OnCarrier C p) (hD : OnCarrier D p) : p=meet C D := by
  have hx : p.1=(D.intercept-C.intercept)/(C.slope-D.slope) := by
    apply (eq_div_iff (sub_ne_zero.mpr hne)).2
    unfold OnCarrier at hC hD
    nlinarith
  apply Prod.ext hx
  change p.2=C.slope*((D.intercept-C.intercept)/(C.slope-D.slope))+C.intercept
  rw [← hx]
  exact hC

theorem meet_comm (C D : Carrier) (hne : C.slope ≠ D.slope) : meet C D=meet D C := by
  exact (meet_unique C D hne (meet D C) (meet_on_right D C hne.symm)
    (meet_on_left D C)).symm

theorem exists_transversal_avoiding (C : Finset Carrier) (F : Finset Point) :
    ∃ D : Carrier, (∀ c ∈ C, D.slope ≠ c.slope) ∧
      (∀ p ∈ F, ¬OnCarrier D p) := by
  classical
  obtain ⟨m,hm⟩ := Infinite.exists_notMem_finset (C.image Carrier.slope)
  obtain ⟨b,hb⟩ := Infinite.exists_notMem_finset (F.image fun p => p.2-m*p.1)
  refine ⟨⟨m,b⟩,?_,?_⟩
  · intro c hc heq
    apply hm
    exact Finset.mem_image.mpr ⟨c,hc,heq.symm⟩
  · intro p hp hon
    apply hb
    refine Finset.mem_image.mpr ⟨p,hp,?_⟩
    change p.2=m*p.1+b at hon
    linarith

theorem graphPoint_injective (C : Carrier) : Function.Injective (graphPoint C) := by
  intro x y h
  exact congrArg Prod.fst h

theorem exists_point_avoiding (C : Carrier) (F : Finset Point) :
    ∃ p : Point, OnCarrier C p ∧ p ∉ F := by
  classical
  obtain ⟨x,hx⟩ := Infinite.exists_notMem_finset (F.image Prod.fst)
  refine ⟨graphPoint C x,graphPoint_on C x,?_⟩
  intro hp
  apply hx
  exact Finset.mem_image.mpr ⟨graphPoint C x,hp,rfl⟩

end LineSize
