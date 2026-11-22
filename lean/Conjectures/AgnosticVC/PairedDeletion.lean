module

public import Conjectures.AgnosticVC.Exchangeability
public import Conjectures.AgnosticVC.Information
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Probability.Independence.Basic

/-! Inserting the two alternatives in adjacent positions of a common block
preserves training order under both deletions. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

/-- Embed the common block into the paired supersample without reordering the
unchanged rows. The copy before the insertion point uses bit zero. -/
def unionIndex {n : ℕ} (i : Fin n) (s : Fin n → Bool) : Fin (n+1) → Fin n × Bool :=
  Fin.insertNth (α := fun _ => Fin n × Bool) i.castSucc (i,false)
    (fun j => (j,Function.update s i true j))

@[simp] theorem unionIndex_skip_left {n : ℕ} (i : Fin n) (s : Fin n → Bool) (j : Fin n) :
    unionIndex i s (i.castSucc.succAbove j) = (j, Function.update s i true j) :=
  Fin.insertNth_apply_succAbove ..

theorem unionIndex_skip_right {n : ℕ} (i : Fin n) (s : Fin n → Bool) (j : Fin n) :
    unionIndex i s (i.succ.succAbove j) = (j, Function.update s i false j) := by
  rcases lt_trichotomy j i with h | heq | h
  · have h₁ : j.castSucc < i.succ := Nat.lt_succ_of_lt h
    have h₂ : j.castSucc < i.castSucc := h
    rw [Fin.succAbove_of_castSucc_lt _ _ h₁, ← Fin.succAbove_of_castSucc_lt _ _ h₂,
        unionIndex_skip_left]
    simp [Function.update_of_ne h.ne]
  · subst j
    have hh : i.castSucc < i.succ := Nat.lt_succ_self _
    simp [Fin.succAbove_of_castSucc_lt _ _ hh, unionIndex]
  · have h₁ : i.succ ≤ j.castSucc := h
    have h₂ : i.castSucc ≤ j.castSucc := h.le
    rw [Fin.succAbove_of_le_castSucc _ _ h₁, ← Fin.succAbove_of_le_castSucc _ _ h₂,
        unionIndex_skip_left]
    simp [Function.update_of_ne h.ne']

theorem unionIndex_injective {n : ℕ} (i : Fin n) (s : Fin n → Bool) :
    Function.Injective (unionIndex i s) := by
  intro a b h
  rcases Fin.eq_self_or_eq_succAbove i.castSucc a with rfl | ⟨a,rfl⟩ <;>
    rcases Fin.eq_self_or_eq_succAbove i.castSucc b with rfl | ⟨b,rfl⟩
  · rfl
  · rw [unionIndex_skip_left] at h
    have hh : unionIndex i s i.castSucc = (i,false) := Fin.insertNth_apply_same ..
    rw [hh] at h
    have hb := congrArg Prod.fst h
    change i = b at hb
    subst b
    simp at h
  · rw [unionIndex_skip_left] at h
    have hh : unionIndex i s i.castSucc = (i,false) := Fin.insertNth_apply_same ..
    rw [hh] at h
    have ha := congrArg Prod.fst h
    change a = i at ha
    subst a
    simp at h
  · rw [unionIndex_skip_left, unionIndex_skip_left] at h
    exact congrArg _ (congrArg Prod.fst h)

/-- Restriction to any injectively indexed subtuple preserves the iid product law. -/
theorem measurePreserving_subtuple {I K Z : Type*} [Fintype I] [Fintype K]
    [MeasurableSpace Z] (D : Measure Z) [IsProbabilityMeasure D]
    (e : K → I) (he : Function.Injective e) :
    MeasurePreserving (fun z : I → Z => z ∘ e) (Measure.pi fun _ : I => D)
      (Measure.pi fun _ : K => D) := by
  have hi : ProbabilityTheory.iIndepFun (fun i (z : I → Z) => z i)
      (Measure.pi fun _ : I => D) :=
    ProbabilityTheory.iIndepFun_pi (X := fun _ : I => id) (fun _ => aemeasurable_id)
  have h := (hi.precomp he).map_fun_eq_pi_map
    (fun k => (measurable_pi_apply (e k)).aemeasurable)
  refine ⟨Measurable.of_eval (fun k => measurable_pi_apply (e k)), ?_⟩
  simpa only [Function.comp_def, (measurePreserving_eval (fun _ : I => D) _).map_eq] using h

/-- Adding both ends of adjacent deletions counts each position at most twice. -/
theorem sum_adjacent_deletions_le {n : ℕ} (a : Fin (n+1) → ℝ) (ha : ∀ i, 0 ≤ a i) :
    (∑ i : Fin n, (a i.castSucc + a i.succ)) ≤ 2 * ∑ j, a j := by
  rw [Finset.sum_add_distrib]
  have hc := Fin.sum_univ_castSucc a
  have hs := Fin.sum_univ_succ a
  linarith [ha (Fin.last n), ha 0]

end AgnosticVC
