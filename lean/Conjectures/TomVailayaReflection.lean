import Conjectures.TomVailayaColorTrace
import Mathlib.Data.Fin.Rev

/-! Relabeling and reversal for literal directed arc families. -/

open scoped BigOperators

namespace TomVailaya

noncomputable section

variable {V W C E R : Type*} [Fintype V] [DecidableEq V] [Fintype W] [DecidableEq W]
  [Fintype C] [LinearOrder C] [Fintype E] [CommSemiring R]

/-- Relabeling vertices preserves the arc index. -/
def relabelEdges (p : V ≃ W) (edge : E → V × V) : E → W × W :=
  fun e => (p (edge e).1, p (edge e).2)

/-- Reverse the direction of every arc while retaining its index. -/
def reverseEdges (edge : E → V × V) : E → V × V :=
  fun e => ((edge e).2, (edge e).1)

theorem chromatic_relabel (x : C → R) (q : R) (edge : E → V × V) (p : V ≃ W) :
    chromatic x q (relabelEdges p edge) = chromatic x q edge := by
  unfold chromatic
  symm
  apply Fintype.sum_equiv (Equiv.arrowCongr p (Equiv.refl C))
  intro c
  change (∏ v, x (c v)) * arcWeight q edge c =
    (∏ w, x (c (p.symm w))) * arcWeight q (relabelEdges p edge) (c ∘ p.symm)
  have harc : arcWeight q (relabelEdges p edge) (c ∘ p.symm) = arcWeight q edge c := by
    simp [arcWeight, relabelEdges]
  rw [harc]
  congr 1
  exact Fintype.prod_equiv p _ _ (fun v => by simp)

private theorem arcFactor_rev {N : ℕ} (q : R) (a b : Fin N) :
    arcFactor q b.rev a.rev = arcFactor q a b := by
  have he : b.rev = a.rev ↔ a = b := by rw [Fin.rev_inj, eq_comm]
  simp only [arcFactor, he, Fin.rev_lt_rev]

/-- Reversing all arcs reverses the order of the color weights. -/
theorem chromatic_reverse_edges {N : ℕ} (x : Fin N → R) (q : R) (edge : E → V × V) :
    chromatic x q (reverseEdges edge) = chromatic (x ∘ Fin.rev) q edge := by
  unfold chromatic
  symm
  apply Fintype.sum_equiv (Equiv.arrowCongr (Equiv.refl V) Fin.revPerm)
  intro c
  change (∏ v, x (c v).rev) * arcWeight q edge c =
    (∏ v, x (c v).rev) * arcWeight q (reverseEdges edge) (Fin.rev ∘ c)
  congr 1
  simp only [arcWeight, reverseEdges, Function.comp_apply, arcFactor_rev]

/-- Reflection reverses vertex labels and orients edges increasingly again. -/
def reflectEdges {n : ℕ} (edge : E → Fin (n + 2) × Fin (n + 2)) :
    E → Fin (n + 2) × Fin (n + 2) :=
  relabelEdges Fin.revPerm (reverseEdges edge)

omit [Fintype E] in
theorem reflectEdges_increasing {n : ℕ} (edge : E → Fin (n + 2) × Fin (n + 2))
    (h : ∀ e, (edge e).1 < (edge e).2) (e : E) :
    (reflectEdges edge e).1 < (reflectEdges edge e).2 := by
  change (edge e).2.rev < (edge e).1.rev
  exact Fin.rev_lt_rev.mpr (h e)

private def closedRev (n : ℕ) : Fin (n + 1) → Fin (n + 1) :=
  Fin.cases 0 (fun i : Fin n => i.rev.succ)

private theorem closedRev_involutive (n : ℕ) : Function.Involutive (closedRev n) := by
  intro i
  refine Fin.cases ?_ (fun j => ?_) i
  · simp [closedRev]
  · simp [closedRev]

/-- After reflection and endpoint identification, the surviving endpoint
is fixed and the remaining vertex labels reverse. -/
def closedReflection (n : ℕ) : Equiv.Perm (Fin (n + 1)) :=
  (closedRev_involutive n).toPerm (closedRev n)

theorem closeVertex_rev (n : ℕ) (v : Fin (n + 2)) :
    closeVertex n v.rev = closedReflection n (closeVertex n v) := by
  refine Fin.lastCases ?_ (fun u => ?_) v
  · simp [closedReflection, closedRev]
  · rw [closeVertex_castSucc]
    refine Fin.cases ?_ (fun i => ?_) u
    · change closeVertex n (0 : Fin (n + 2)).rev = _
      simp [closedReflection, closedRev]
    · rw [Fin.rev_castSucc, Fin.rev_succ,
        show i.rev.castSucc.succ = i.rev.succ.castSucc from Fin.ext rfl, closeVertex_castSucc]
      rfl

omit [Fintype E] in
theorem closeEdges_reflect {n : ℕ} (edge : E → Fin (n + 2) × Fin (n + 2)) :
    closeEdges (reflectEdges edge) =
      relabelEdges (closedReflection n) (reverseEdges (closeEdges edge)) := by
  funext e
  change (closeVertex n (edge e).2.rev, closeVertex n (edge e).1.rev) = _
  simp only [closeVertex_rev]
  rfl

/-- Endpoint closure of a reflected graph has the reversed-color weighted
enumerator of the original closure. -/
theorem chromatic_reflect_close {n N : ℕ} (x : Fin N → R) (q : R)
    (edge : E → Fin (n + 2) × Fin (n + 2)) :
    chromatic x q (closeEdges (reflectEdges edge)) =
      chromatic (x ∘ Fin.rev) q (closeEdges edge) := by
  rw [closeEdges_reflect, chromatic_relabel, chromatic_reverse_edges]

end

end TomVailaya
