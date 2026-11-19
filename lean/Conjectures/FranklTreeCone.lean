module

public import Mathlib.Geometry.Convex.Cone.Pointed
public import Mathlib.Basic.Real.Basic
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Tactic.FinCases

@[expose] public section

/-!
# Sound propagation of cones of independent-set messages

A message has coordinates `(occupied, dominated by children, needs parent)`.
The finite certificate computes outer cones, so the relevant assertion is
containment for arbitrary children in the input cone. In particular, children
need not have the same ray or the same message.
-/

namespace FranklTreeCone

abbrev Message := Fin 3 → ℝ

/-- The three factors used when attaching a child to its parent. -/
def factorMap : Message →ₗ[ℝ] Message where
  toFun v := ![v 1 + v 2, v 0 + v 1, v 1]
  map_add' v w := by
    ext i
    fin_cases i <;> simp [add_assoc, add_left_comm, add_comm]
  map_smul' r v := by
    ext i
    fin_cases i <;> simp [mul_add]

/-- Convert the three products back to the three branch counts. -/
def returnMap : Message →ₗ[ℝ] Message where
  toFun v := ![v 0, v 1 - v 2, v 2]
  map_add' v w := by
    ext i
    fin_cases i <;> simp [sub_add_sub_comm]
  map_smul' r v := by
    ext i
    fin_cases i <;> simp [mul_sub]

/-- A linear map needs checking only on generating rays of a pointed cone. -/
theorem linear_mem_cone_of_generators (f : Message →ₗ[ℝ] Message)
    (A : Set Message) (C : PointedCone ℝ Message)
    (h : ∀ a ∈ A, f a ∈ C) {v : Message}
    (hv : v ∈ PointedCone.hull ℝ A) : f v ∈ C := by
  have hle : PointedCone.hull ℝ A ≤ C.comap f := Submodule.span_le.mpr h
  exact hle hv

/-- Coordinatewise multiplication is linear in each argument separately.
Checking pairs of generating rays therefore covers arbitrary conic inputs. -/
theorem mul_mem_cone_of_generators (A B : Set Message) (C : PointedCone ℝ Message)
    (h : ∀ a ∈ A, ∀ b ∈ B, a * b ∈ C) {v w : Message}
    (hv : v ∈ PointedCone.hull ℝ A) (hw : w ∈ PointedCone.hull ℝ B) :
    v * w ∈ C := by
  have hle : PointedCone.hull ℝ A ≤ C.comap (LinearMap.mulRight ℝ w) := by
    refine Submodule.span_le.mpr ?_
    intro a ha
    have hle' : PointedCone.hull ℝ B ≤ C.comap (LinearMap.mulLeft ℝ a) :=
      Submodule.span_le.mpr (fun b hb => h a ha b hb)
    exact hle' hw
  exact hle hv

/-- All products of `n` input rays, before the final linear map. -/
def rayProducts (A : Set Message) : ℕ → Set Message
  | 0 => {1}
  | n + 1 => Set.image2 (· * ·) A (rayProducts A n)

theorem list_prod_mem_hull_rayProducts (A : Set Message) (l : List Message)
    (hl : ∀ v ∈ l, v ∈ PointedCone.hull ℝ A) :
    l.prod ∈ PointedCone.hull ℝ (rayProducts A l.length) := by
  induction l with
  | nil => exact PointedCone.subset_hull (Set.mem_singleton 1)
  | cons v l ih =>
      change v * l.prod ∈
        PointedCone.hull ℝ (Set.image2 (· * ·) A (rayProducts A l.length))
      apply mul_mem_cone_of_generators A (rayProducts A l.length)
      · intro a ha b hb
        exact PointedCone.subset_hull (Set.mem_image2_of_mem ha hb)
      · exact hl v (by simp)
      · exact ih (fun w hw => hl w (by simp [hw]))

/-- The actual multivariate recursion, with a potentially different message
at every child. -/
def childrenMessage (l : List Message) : Message :=
  returnMap ((l.map factorMap).prod)

/-- Generating rays before any optional removal of redundant rays. -/
def childRays (A : Set Message) (degree : ℕ) : Set Message :=
  returnMap '' rayProducts (factorMap '' A) degree

/-- The child-message recursion preserves the certified outer-cone bound. -/
theorem childrenMessage_mem_hull (A : Set Message) (l : List Message)
    (hl : ∀ v ∈ l, v ∈ PointedCone.hull ℝ A) :
    childrenMessage l ∈ PointedCone.hull ℝ (childRays A l.length) := by
  have hf : ∀ v ∈ l.map factorMap, v ∈ PointedCone.hull ℝ (factorMap '' A) := by
    intro v hv
    obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hv
    exact linear_mem_cone_of_generators factorMap A (PointedCone.hull ℝ (factorMap '' A))
      (fun a ha => PointedCone.subset_hull ⟨a, ha, rfl⟩) (hl w hw)
  have hp := list_prod_mem_hull_rayProducts (factorMap '' A) (l.map factorMap) hf
  have hr := linear_mem_cone_of_generators returnMap
    (rayProducts (factorMap '' A) l.length) (PointedCone.hull ℝ (childRays A l.length))
    (fun a ha => PointedCone.subset_hull ⟨a, ha, rfl⟩)
    (by simpa using hp)
  exact hr

/-- A certificate may replace the full ray set by any cone containing it.
This justifies discarding interior rays at every multiplication stage. -/
theorem childrenMessage_mem_certified_cone (A : Set Message) (C : PointedCone ℝ Message)
    (l : List Message) (hl : ∀ v ∈ l, v ∈ PointedCone.hull ℝ A)
    (hC : childRays A l.length ⊆ C) : childrenMessage l ∈ C := by
  exact (Submodule.span_le.mpr hC) (childrenMessage_mem_hull A l hl)

end FranklTreeCone
