import Conjectures.BraunBrueggeMinimumPolar
import Mathlib.Data.Fintype.Sigma

/-! The theta graph has two shared endpoints and three disjoint interiors.
The path lengths specify the vertices and all the edges. -/

open Set

namespace BraunBruegge

abbrev ThetaVertex (length : Fin 3 → ℕ) := Bool ⊕ (Σ p : Fin 3, Fin (length p - 1))

variable {length : Fin 3 → ℕ}

def thetaStart : ThetaVertex length := .inl false

def thetaFinish : ThetaVertex length := .inl true

def thetaPosition (p : Fin 3) (i : Fin (length p + 1)) : ThetaVertex length :=
  if h₀ : i.val = 0 then thetaStart else
    if h₁ : i.val = length p then thetaFinish else .inr ⟨p, ⟨i.val - 1, by
      have hi := i.isLt
      omega⟩⟩

def thetaLast (p : Fin 3) : Fin (length p + 1) := ⟨length p, by omega⟩

def thetaInterior (p : Fin 3) (i : Fin (length p - 1)) : Fin (length p + 1) :=
  ⟨i.val + 1, by have hi := i.isLt; omega⟩

@[simp] theorem thetaPosition_zero (p : Fin 3) : thetaPosition (length := length) p 0 = thetaStart := by
  simp [thetaPosition]

theorem thetaPosition_last (positive : ∀ p, 0 < length p) (p : Fin 3) :
    thetaPosition p (thetaLast (length := length) p) = thetaFinish := by
  simp [thetaPosition, thetaLast, (positive p).ne']

@[simp] theorem thetaPosition_interior (p : Fin 3) (i : Fin (length p - 1)) :
    thetaPosition p (thetaInterior p i) = (.inr ⟨p, i⟩ : ThetaVertex length) := by
  have he : i.val + 1 ≠ length p := by have hi := i.isLt; omega
  simp [thetaPosition, thetaInterior, he]

theorem thetaPosition_injective (p : Fin 3) : Function.Injective (thetaPosition (length := length) p) := by
  intro i j he
  apply Fin.ext
  unfold thetaPosition at he
  split_ifs at he with hi₀ hi₁ hj₀ hj₁ <;> simp [thetaStart, thetaFinish] at he ⊢ <;> omega

theorem thetaPosition_surjective (positive : ∀ p, 0 < length p) (v : ThetaVertex length) :
    ∃ p i, thetaPosition p i = v := by
  rcases v with (_ | _) | ⟨p, j⟩
  · exact ⟨0, 0, thetaPosition_zero 0⟩
  · exact ⟨0, thetaLast 0, thetaPosition_last positive 0⟩
  · exact ⟨p, thetaInterior p j, thetaPosition_interior p j⟩

def thetaLabels {α : Type*} (start finish : α) (values : (p : Fin 3) → Fin (length p + 1) → α) :
    ThetaVertex length → α := Sum.elim (fun b => if b then finish else start)
      (fun w => values w.1 (thetaInterior w.1 w.2))

theorem thetaLabels_position {α : Type*} {start finish : α}
    {values : (p : Fin 3) → Fin (length p + 1) → α}
    (h₀ : ∀ p, values p 0 = start) (h₁ : ∀ p, values p (thetaLast p) = finish)
    (p : Fin 3) (i : Fin (length p + 1)) : thetaLabels start finish values (thetaPosition p i) = values p i := by
  unfold thetaPosition
  split_ifs with hs hf
  · have he : i = 0 := Fin.ext hs
    rw [he, h₀]
    rfl
  · have he : i = thetaLast (length := length) p := Fin.ext hf
    rw [he, h₁]
    rfl
  · let j : Fin (length p - 1) := ⟨i.val - 1, by have hi := i.isLt; omega⟩
    change values p (thetaInterior p j) = values p i
    congr 1
    apply Fin.ext
    change i.val - 1 + 1 = i.val
    omega

def thetaGraph (length : Fin 3 → ℕ) : SimpleGraph (ThetaVertex length) where
  Adj u v := u ≠ v ∧ ∃ (p : Fin 3) (i : Fin (length p)),
    (thetaPosition p i.castSucc = u ∧ thetaPosition p i.succ = v) ∨
    (thetaPosition p i.castSucc = v ∧ thetaPosition p i.succ = u)
  symm := ⟨fun _ _ h => ⟨h.1.symm, by
    obtain ⟨p, i, h⟩ := h.2
    exact ⟨p, i, h.symm⟩⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

theorem theta_step_adj (p : Fin 3) (i : Fin (length p)) :
    (thetaGraph length).Adj (thetaPosition p i.castSucc) (thetaPosition p i.succ) := by
  refine ⟨?_, ⟨p, i, Or.inl ⟨rfl, rfl⟩⟩⟩
  intro h
  have he := congrArg Fin.val (thetaPosition_injective p h)
  simp at he

theorem theta_path_reachable {G : SimpleGraph (ThetaVertex length)} (p : Fin 3)
    (i j : Fin (length p + 1)) (hij : i.val ≤ j.val)
    (adj : ∀ k : Fin (length p), i.val ≤ k.val → k.val < j.val →
      G.Adj (thetaPosition p k.castSucc) (thetaPosition p k.succ)) :
    G.Reachable (thetaPosition p i) (thetaPosition p j) := by
  have h : ∀ (b : ℕ) (hb₀ : i.val ≤ b) (hb₁ : b ≤ j.val),
      G.Reachable (thetaPosition p i) (thetaPosition p ⟨b, by omega⟩) := by
    intro b hb₀
    induction hb₀ with
    | refl => intro _; exact SimpleGraph.Reachable.refl _
    | @step b hb₀ ih =>
      intro hb₁
      have hlt : b < j.val := by omega
      exact (ih (by omega)).trans (adj ⟨b, by omega⟩ hb₀ hlt).reachable
  exact h j.val hij le_rfl

theorem thetaGraph_connected (positive : ∀ p, 0 < length p) : (thetaGraph length).Connected := by
  have h (v : ThetaVertex length) : (thetaGraph length).Reachable thetaStart v := by
    obtain ⟨p, i, rfl⟩ := thetaPosition_surjective positive v
    rw [← thetaPosition_zero p]
    exact theta_path_reachable p 0 i (Nat.zero_le _) (fun k _ _ => theta_step_adj p k)
  exact ⟨fun u v => (h u).symm.trans (h v)⟩

end BraunBruegge
