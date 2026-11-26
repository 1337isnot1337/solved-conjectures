import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic

/-! The literal finite-color transfer matrix and endpoint closure in Tom–Vailaya. -/

open scoped BigOperators

namespace TomVailaya

noncomputable section

variable {V C E R : Type*} [LinearOrder C] [Fintype E] [CommSemiring R]

/-- One directed arc contributes zero on equal colors and a factor of `q` on
an ascent. The edge index is retained even if another arc has the same endpoints. -/
def arcFactor (q : R) (a b : C) : R :=
  if a = b then 0 else if a < b then q else 1

def arcWeight (q : R) (edge : E → V × V) (c : V → C) : R :=
  ∏ e : E, arcFactor q (c (edge e).1) (c (edge e).2)

/-- The arc factors recover the source ascent enumerator, including parallel arcs. -/
theorem arcWeight_eq (q : R) (edge : E → V × V) (c : V → C) :
    arcWeight q edge c =
      if ∀ e, c (edge e).1 ≠ c (edge e).2 then
        q ^ (Finset.univ.filter (fun e : E => c (edge e).1 < c (edge e).2)).card
      else 0 := by
  classical
  by_cases h : ∀ e, c (edge e).1 ≠ c (edge e).2
  · rw [ite_eq_left h, arcWeight, ← Finset.prod_const]
    rw [Finset.prod_filter]
    exact Finset.prod_congr rfl (fun e _ => by simp [arcFactor, h e])
  · rw [ite_eq_right h, arcWeight]
    push Not at h
    obtain ⟨e, he⟩ := h
    refine Finset.prod_eq_zero (Finset.mem_univ e) ?_
    simp [arcFactor, he]

variable [Fintype C]

/-- The finite-color chromatic quasisymmetric polynomial, evaluated at `x` and `q`. -/
def chromatic [Fintype V] [DecidableEq V] (x : C → R) (q : R) (edge : E → V × V) : R :=
  ∑ c : V → C, (∏ v : V, x (c v)) * arcWeight q edge c

/-- Identify the last vertex with vertex zero. Earlier vertices retain their labels. -/
def closeVertex (n : ℕ) : Fin (n + 2) → Fin (n + 1) := Fin.lastCases 0 id

@[simp] theorem closeVertex_castSucc (n : ℕ) (v : Fin (n + 1)) :
    closeVertex n v.castSucc = v := by simp [closeVertex]

@[simp] theorem closeVertex_last (n : ℕ) : closeVertex n (Fin.last (n + 1)) = 0 := by
  simp [closeVertex]

@[simp] theorem closeVertex_zero (n : ℕ) : closeVertex n 0 = 0 := by
  exact closeVertex_castSucc n 0

/-- Keep every directed arc and change its endpoints by the closure map. -/
def closeEdges {n : ℕ} (edge : E → Fin (n + 2) × Fin (n + 2)) :
    E → Fin (n + 1) × Fin (n + 1) :=
  fun e => (closeVertex n (edge e).1, closeVertex n (edge e).2)

private def tailWeight {n : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) (c : Fin (n + 2) → C) : R :=
  (∏ v : Fin (n + 1), x (c v.succ)) * arcWeight q edge c

/-- The last color is the row, the first is the column, and the first vertex
supplies no variable factor in the transfer matrix. -/
def colorMatrix {n : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) : Matrix C C R :=
  fun b a => ∑ c : Fin (n + 2) → C,
    if c 0 = a ∧ c (Fin.last (n + 1)) = b then tailWeight x q edge c else 0

private def endpointColoringEquiv (n : ℕ) :
    (Fin (n + 1) → C) ≃ {c : Fin (n + 2) → C // c 0 = c (Fin.last (n + 1))} where
  toFun c := ⟨c ∘ closeVertex n, by simp⟩
  invFun c := fun v => c.val v.castSucc
  left_inv c := by funext v; simp
  right_inv c := by
    apply Subtype.ext
    funext v
    refine Fin.lastCases ?_ (fun i => ?_) v
    · simpa using c.property
    · simp

omit [LinearOrder C] [Fintype C] in
private theorem tailVertexProduct (n : ℕ) (x : C → R) (c : Fin (n + 1) → C) :
    (∏ v : Fin (n + 1), x (c (closeVertex n v.succ))) = ∏ v, x (c v) := by
  calc
    _ = (∏ v : Fin n, x (c v.succ)) * x (c 0) := by
      rw [Fin.prod_univ_castSucc]
      congr 1
      · apply Finset.prod_congr rfl
        intro v _
        rw [show v.castSucc.succ = v.succ.castSucc from Fin.ext rfl, closeVertex_castSucc]
      · rw [show (Fin.last n).succ = Fin.last (n + 1) from Fin.ext rfl, closeVertex_last]
    _ = _ := by
      rw [mul_comm]
      exact (Fin.prod_univ_succ fun v => x (c v)).symm

private theorem trace_eq_sum_equal_endpoints {n : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) :
    (colorMatrix x q edge).trace =
      ∑ c : {c : Fin (n + 2) → C // c 0 = c (Fin.last (n + 1))},
        tailWeight x q edge c.val := by
  classical
  simp only [Matrix.trace, Matrix.diag_apply, colorMatrix]
  let p (c : Fin (n + 2) → C) := c 0 = c (Fin.last (n + 1))
  rw [← Finset.sum_subtype (Finset.univ.filter p) (fun c => by simp [p]) (tailWeight x q edge),
    Finset.sum_comm, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro c _
  rw [Finset.sum_eq_single (c 0)]
  · by_cases h : c 0 = c (Fin.last (n + 1))
    · simp [h]
    · simp [h, Ne.symm h]
  · intro a _ ha
    simp [Ne.symm ha]
  · simp

/-- The finite-color transfer trace is the chromatic quasisymmetric function
of the actual endpoint closure, with every directed arc retained. -/
theorem trace_colorMatrix_eq_chromatic_close {n : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) :
    (colorMatrix x q edge).trace = chromatic x q (closeEdges edge) := by
  classical
  rw [trace_eq_sum_equal_endpoints, chromatic]
  symm
  apply Fintype.sum_equiv (endpointColoringEquiv n)
  intro c
  change (∏ v, x (c v)) * arcWeight q (closeEdges edge) c =
    (∏ v : Fin (n + 1), x (c (closeVertex n v.succ))) * arcWeight q (closeEdges edge) c
  rw [tailVertexProduct]

/-- A loop in the closure rules out every coloring. -/
theorem chromatic_close_eq_zero_of_arc {n : ℕ} (x : C → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) (e : E)
    (he : closeVertex n (edge e).1 = closeVertex n (edge e).2) :
    chromatic x q (closeEdges edge) = 0 := by
  classical
  unfold chromatic
  apply Finset.sum_eq_zero
  intro c _
  have hproper : ¬ ∀ f, c (closeEdges edge f).1 ≠ c (closeEdges edge f).2 :=
    fun h => h e (congrArg c he)
  simp only [arcWeight_eq, ite_eq_right hproper, mul_zero]


/-- The path on two vertices has one increasingly oriented edge. -/
def pathEdge : Unit → Fin 2 × Fin 2 := fun _ => (0, Fin.last 1)

/-- The path-edge gadget, directly from the literal color matrix. -/
theorem colorMatrix_pathEdge (x : C → R) (q : R) (b a : C) :
    colorMatrix x q pathEdge b a = x b * arcFactor q a b := by
  classical
  let c : Fin 2 → C := Fin.cases a fun _ => b
  have hfirst : c 0 = a := rfl
  have hlast : c (Fin.last 1) = b := rfl
  unfold colorMatrix
  rw [Finset.sum_eq_single c]
  · rw [ite_eq_left ⟨hfirst, hlast⟩]
    simp [tailWeight, arcWeight, pathEdge, hfirst, c]
    rfl
  · intro d _ hdc
    apply ite_eq_right
    intro hd
    apply hdc
    funext v
    refine Fin.lastCases ?_ (fun i => ?_) v
    · exact hd.2.trans hlast.symm
    · fin_cases i
      exact hd.1.trans hfirst.symm
  · simp

end

end TomVailaya
