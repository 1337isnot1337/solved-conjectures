module

public import Conjectures.ShumyatskyCyclicTransport
public import Mathlib.Data.List.OfFn

/-! Keep the specified automorphism classes on a paired cycle while
changing only its reserved closing label. The conjugator at every
vertex stays in its original outer class. -/

@[expose] public section

namespace Shumyatsky

variable {A B : Type*} [Group A] [Group B]

theorem cycleNext_cast {m n : ℕ} (h : m = n) (i : Fin m) :
    cycleNext (i.cast h) = (cycleNext i).cast h := by
  subst n
  rfl

private theorem transport_ofFn_take {n : ℕ} (hPos : 0 < n)
    (edges : Fin n → A × A) (g : Fin n → A)
    (hSteps : ∀ i, g (cycleNext i) = (edges i).2 * g i * (edges i).1⁻¹)
    (i : Fin n) :
    transportLabels ((List.ofFn edges).take i.val) (g ⟨0, hPos⟩) = g i := by
  obtain ⟨i, hi⟩ := i
  induction i with
  | zero => rfl
  | succ i ih =>
    have hi' : i < n := Nat.lt_trans (Nat.lt_succ_self _) hi
    have hList : i < (List.ofFn edges).length := by simpa using hi'
    rw [List.take_succ_eq_append_getElem hList, transportLabels_append, List.getElem_ofFn]
    change (edges ⟨i, hi'⟩).2 * transportLabels ((List.ofFn edges).take i) (g ⟨0, hPos⟩)
      * (edges ⟨i, hi'⟩).1⁻¹ = g ⟨i + 1, hi⟩
    rw [ih hi']
    have h := hSteps ⟨i, hi'⟩
    simpa only [cycleNext, dite_eq_left hi] using h.symm

private theorem transport_ofFn_returns {n : ℕ}
    (edges : Fin (n + 1) → A × A) (g : Fin (n + 1) → A)
    (hSteps : ∀ i, g (cycleNext i) = (edges i).2 * g i * (edges i).1⁻¹) :
    transportLabels (List.ofFn edges) (g 0) = g 0 := by
  have hn : n < (List.ofFn edges).length := by simp
  have hFull : (List.ofFn edges).take (n + 1) = List.ofFn edges := by simp
  rw [← hFull, List.take_succ_eq_append_getElem hn, transportLabels_append, List.getElem_ofFn]
  change (edges (Fin.last n)).2 * transportLabels ((List.ofFn edges).take n) (g 0) *
    (edges (Fin.last n)).1⁻¹ = g 0
  have hTake : transportLabels ((List.ofFn edges).take n) (g 0) = g (Fin.last n) :=
    transport_ofFn_take (Nat.succ_pos n) edges g hSteps (Fin.last n)
  rw [hTake]
  have h := hSteps (Fin.last n)
  have hNext : cycleNext (Fin.last n) = 0 := Fin.ext
    (by simp [cycleNext])
  rw [hNext] at h
  exact h.symm

/-- For paired cycles of length n+1, change only the last second label
    to make the conjugacy equations consistent. Every new label,
    including each conjugator label, stays in its prescribed class. -/
theorem exists_cycle_completion_in_classes (f : A →* B) {n : ℕ}
    (x y x₀ y₀ g₀ : Fin (n + 1) → A)
    (hX : ∀ i, f (x i) = f (x₀ i)) (hY : ∀ i, f (y i) = f (y₀ i))
    (hReference : ∀ i, g₀ (cycleNext i) = y₀ i * g₀ i * (x₀ i)⁻¹) :
    ∃ y' g' : Fin (n + 1) → A,
      (∀ i, i ≠ Fin.last n → y' i = y i) ∧
      (∀ i, f (y' i) = f (y₀ i)) ∧
      (∀ i, f (g' i) = f (g₀ i)) ∧
      (∀ i, g' (cycleNext i) = y' i * g' i * (x i)⁻¹) := by
  let init := List.ofFn fun i : Fin n => (x i.castSucc, y i.castSucc)
  let init₀ := List.ofFn fun i : Fin n => (x₀ i.castSucc, y₀ i.castSucc)
  let old := List.ofFn fun i : Fin (n + 1) => (x₀ i, y₀ i)
  let start := g₀ 0
  let last := Fin.last n
  have hOldEq : old = init₀ ++ [(x₀ last, y₀ last)] := List.ofFn_succ_last
  have hOldClosed : transportLabels old start = start :=
    transport_ofFn_returns (fun i => (x₀ i, y₀ i)) g₀ hReference
  let y' := Function.update y last (closingLabel init (x last) start)
  have hSame (i : Fin (n + 1)) (hi : i ≠ last) : y' i = y i := by
    simp [y', hi]
  let new := List.ofFn fun i : Fin (n + 1) => (x i, y' i)
  have hNewEq : new = completeCycle init (x last) start := by
    unfold new completeCycle
    rw [List.ofFn_succ_last]
    have hInit : (List.ofFn fun i : Fin n => (x i.castSucc, y' i.castSucc)) = init := by
      apply congrArg List.ofFn
      funext i
      rw [hSame i.castSucc (Fin.ne_of_lt i.castSucc_lt_last)]
    rw [hInit]
    simp [y', last]
  have hNewClosed : transportLabels new start = start := by
    rw [hNewEq]
    exact transportLabels_completeCycle _ _ _
  have hInitClass : init.map (fun e => (f e.1, f e.2)) =
      init₀.map (fun e => (f e.1, f e.2)) := by
    simp only [init, init₀, List.map_ofFn]
    apply congrArg List.ofFn
    funext i
    exact Prod.ext (hX i.castSucc) (hY i.castSucc)
  have hNewClass : new.map (fun e => (f e.1, f e.2)) =
      old.map (fun e => (f e.1, f e.2)) := by
    rw [hNewEq, hOldEq]
    exact map_completeCycle_eq_reference f init init₀ _ _ _ start hInitClass (hX last)
      (hOldEq ▸ hOldClosed)
  have hyClass (i : Fin (n + 1)) : f (y' i) = f (y₀ i) := by
    have h := hNewClass
    simp only [new, old, List.map_ofFn] at h
    exact congrArg Prod.snd (congrFun (List.ofFn_inj.mp h) i)
  let g' (i : Fin (n + 1)) := transportLabels (new.take i.val) start
  have hGClass (i : Fin (n + 1)) : f (g' i) = f (g₀ i) := by
    have hOldTake : transportLabels (old.take i.val) start = g₀ i :=
      transport_ofFn_take (Nat.succ_pos n) (fun i => (x₀ i, y₀ i)) g₀ hReference i
    rw [← hOldTake]
    simp only [g', map_transportLabels, List.map_take, hNewClass]
  refine ⟨y', g', hSame, hyClass, hGClass, ?_⟩
  intro i
  have hLen : new.length = n + 1 := List.length_ofFn
  have h := cycleConjugator_step new start hNewClosed (i.cast hLen.symm)
  rw [cycleNext_cast] at h
  simpa only [cycleConjugator, Fin.val_cast, new, List.getElem_ofFn, g'] using h

end Shumyatsky
