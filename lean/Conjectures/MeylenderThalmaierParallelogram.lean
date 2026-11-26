import Conjectures.MeylenderThalmaierRatios
import Mathlib.Analysis.Convex.Hull
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.FinCases

/-! The explicit reflected parallelogram contains translates of both unit
segments and both normal triangles of the truncated square. -/

noncomputable section

namespace MeylenderThalmaier

abbrev Plane := Fin 2 → ℝ

def axisU (x : Plane) := x 0+x 1
def axisV (a : ℝ) (x : Plane) := x 1+(a-1)*x 0

def parallelogram (a : ℝ) : Set Plane :=
  {x | |axisU x|≤1/2 ∧ |axisV a x|≤1/2}

private theorem mixed_bound {x y s t : ℝ} (hx : |x|≤1/2) (hy : |y|≤1/2)
    (hs : 0≤s) (ht : 0≤t) (hst : s+t=1) : |s*x+t*y|≤1/2 := by
  calc |s*x+t*y| ≤ |s*x|+|t*y| := abs_add_le ..
       _ = s*|x|+t*|y| := by simp [abs_mul,abs_of_nonneg hs,abs_of_nonneg ht]
       _ ≤ s*(1/2)+t*(1/2) := add_le_add (mul_le_mul_of_nonneg_left hx hs) (mul_le_mul_of_nonneg_left hy ht)
       _ = _ := by rw [←add_mul,hst,one_mul]

theorem convex_parallelogram (a : ℝ) : Convex ℝ (parallelogram a) := by
  intro x hx y hy s t hs ht hst
  obtain ⟨hx₁,hx₂⟩ := hx
  obtain ⟨hy₁,hy₂⟩ := hy
  have u : axisU (s • x+t • y)=s*axisU x+t*axisU y := by
    unfold axisU; simp [Pi.add_apply,Pi.smul_apply,smul_eq_mul]; ring
  have v : axisV a (s • x+t • y)=s*axisV a x+t*axisV a y := by
    unfold axisV; simp [Pi.add_apply,Pi.smul_apply,smul_eq_mul]; ring
  exact ⟨u ▸ mixed_bound hx₁ hy₁ hs ht hst,v ▸ mixed_bound hx₂ hy₂ hs ht hst⟩

def Fits (K shape : Set Plane) : Prop := ∃ z : Plane, ∀ x∈shape, z+x∈K

theorem fits_convexHull {K vertices : Set Plane} (hK : Convex ℝ K)
    (h : Fits K vertices) : Fits K (convexHull ℝ vertices) := by
  obtain ⟨z,hz⟩ := h
  exact ⟨z,convexHull_min (t := (fun x => z+x) ⁻¹' K) hz (hK.translate_preimage_right z)⟩

def horizontal : Set Plane := {0,![1,0]}
def vertical : Set Plane := {0,![0,1]}
def triangle (A B : ℝ) : Set Plane := {0,![A,0],![0,B]}

def fourShapes (a b : ℝ) (K : Set Plane) : Prop :=
  Fits K (convexHull ℝ horizontal) ∧ Fits K (convexHull ℝ vertical) ∧
    Fits K (convexHull ℝ (triangle (legX a b) (legY a b))) ∧
    Fits K (convexHull ℝ (triangle (-legX a b) (-legY a b)))

def coordinatesInverse (a u v : ℝ) : Plane :=
  ![(u-v)/(2-a),u-(u-v)/(2-a)]

theorem inverse_axes {a : ℝ} (ha : a<1) (u v : ℝ) :
    axisU (coordinatesInverse a u v)=u ∧ axisV a (coordinatesInverse a u v)=v := by
  simp [axisU,axisV,coordinatesInverse]
  field_simp [show 2-a≠0 by linarith]
  ring

private theorem axis_add (a : ℝ) (z x : Plane) :
    axisU (z+x)=axisU z+axisU x ∧ axisV a (z+x)=axisV a z+axisV a x := by
  simp [axisU,axisV,Pi.add_apply]
  constructor <;> ring

private theorem fits_triangle {a A B : ℝ} (ha : 0<a) (ha' : a<1) (hA : 0≤A) (hA' : A≤1)
    (hB : 0≤B) (hB' : B≤1) (hid : B+(1-a)*A=1) :
    Fits (parallelogram a) (triangle A B) := by
  let z := coordinatesInverse a (-1/2) (-1/2-(a-1)*A)
  obtain ⟨hu,hv⟩ := inverse_axes ha' (-1/2) (-1/2-(a-1)*A)
  change axisU z=_ at hu
  change axisV a z=_ at hv
  have hneg : (a-1)*A≤0 := mul_nonpos_of_nonpos_of_nonneg (by linarith) hA
  refine ⟨z,?_⟩
  intro p hp
  obtain ⟨us,vs⟩ := axis_add a z p
  change |axisU (z+p)|≤1/2 ∧ |axisV a (z+p)|≤1/2
  rw [us,vs,hu,hv]
  simp only [triangle,Set.mem_insert_iff,Set.mem_singleton_iff] at hp
  rcases hp with rfl|rfl|rfl <;> simp [axisU,axisV,abs_le] <;> constructor <;> constructor <;> nlinarith

private theorem symmetric {a : ℝ} {x : Plane} (hx : x∈parallelogram a) : -x∈parallelogram a := by
  have hu : axisU (-x) = -axisU x := by simp [axisU]; ring
  have hv : axisV a (-x) = -axisV a x := by simp [axisV]; ring
  simpa only [parallelogram,Set.mem_ofPred_eq,hu,hv,abs_neg] using hx

theorem parallelogram_covers {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    fourShapes a b (parallelogram a) := by
  obtain ⟨_,hA,hA',hB,hB',hid⟩ := normal_legs ha ha' hb hb'
  have tri := fits_triangle ha ha' hA.le hA' hB.le hB' hid
  apply And.intro (fits_convexHull (convex_parallelogram a) ?_)
  · apply And.intro (fits_convexHull (convex_parallelogram a) ?_)
    · refine ⟨fits_convexHull (convex_parallelogram a) tri,fits_convexHull (convex_parallelogram a) ?_⟩
      obtain ⟨z,hz⟩ := tri
      use -z
      intro p hp
      have hp' : -p∈triangle (legX a b) (legY a b) := by
        simp only [triangle,Set.mem_insert_iff,Set.mem_singleton_iff] at hp ⊢
        rcases hp with rfl|rfl|rfl
        · exact Or.inl neg_zero
        · right; left; ext i; fin_cases i <;> simp
        · right; right; ext i; fin_cases i <;> simp
      simpa [add_comm] using symmetric (hz (-p) hp')
    · refine ⟨![0,-1/2],?_⟩
      intro p hp
      rcases (show p=0 ∨ p=![0,1] from hp) with rfl|rfl <;>
        norm_num [parallelogram,axisU,axisV]
  · refine ⟨![-1/2,0],?_⟩
    intro p hp
    rcases (show p=0 ∨ p=![1,0] from hp) with rfl|rfl <;>
      norm_num [parallelogram,axisU,axisV,abs_le] <;> constructor <;> linarith

end MeylenderThalmaier
