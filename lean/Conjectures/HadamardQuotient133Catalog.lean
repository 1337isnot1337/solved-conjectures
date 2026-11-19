import Mathlib.Data.List.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Int.Order.Basic
import Lean.Elab.Tactic.Omega

/-!
# Small certificates for an ordered catalogue

Only comparisons of adjacent entries and two neighbours of an insertion point
are evaluated.  The soundness statements quantify over arbitrary catalogue
indices; they do not assume that a producer's search was exhaustive.
-/

namespace HadamardQuotient133

inductive LookupTree (α : Type*) where
  | leaf (value : α)
  | branch (split : ℕ) (left right : LookupTree α)

def LookupTree.get {α : Type*} : LookupTree α → ℕ → α
  | .leaf value, _ => value
  | .branch split left right, index =>
      if index < split then left.get index else right.get index

structure Catalog where
  size : ℕ
  value : ℕ → ℤ
  gap : ℕ → ℕ
  allowed : ℕ → Bool

def gapCheck (C : Catalog) (target : ℤ) (index : ℕ) : Bool :=
  decide (C.gap index ≤ C.size ∧
    (C.gap index = 0 ∨ C.value (C.gap index - 1) < target - C.value index) ∧
    (C.gap index = C.size ∨ target - C.value index < C.value (C.gap index)))

def catalogCheck (C : Catalog) (target : ℤ) (index : ℕ) : Bool :=
  decide (index + 1 < C.size → C.value index < C.value (index + 1)) &&
    (C.allowed index || gapCheck C target index)

theorem catalog_increasing (C : Catalog)
    (h : ∀ i, i + 1 < C.size → C.value i < C.value (i + 1))
    {i j : ℕ} (hij : i < j) (hj : j < C.size) :
    C.value i < C.value j := by
  revert hij hj
  induction j with
  | zero => omega
  | succ j ih =>
      intro hij hj
      by_cases heq : i = j
      · subst i
        exact h j hj
      · exact lt_trans (ih (by omega) (by omega)) (h j hj)

theorem gapCheck_excludes (C : Catalog) (target : ℤ)
    (horder : ∀ i, i + 1 < C.size → C.value i < C.value (i + 1))
    {i j : ℕ} (hj : j < C.size)
    (hgap : gapCheck C target i = true) :
    C.value i + C.value j ≠ target := by
  simp only [gapCheck, decide_eq_true_eq] at hgap
  obtain ⟨hbound, hlo, hhi⟩ := hgap
  intro heq
  by_cases hcut : j < C.gap i
  · have hpositive : 0 < C.gap i := by omega
    have hlo' : C.value (C.gap i - 1) < target - C.value i := by
      rcases hlo with hz | hlt
      · omega
      · exact hlt
    have hle : C.value j ≤ C.value (C.gap i - 1) := by
      rcases lt_or_eq_of_le (show j ≤ C.gap i - 1 by omega) with hlt | he
      · exact le_of_lt (catalog_increasing C horder hlt (by omega))
      · rw [he]
    omega
  · have hinside : C.gap i < C.size := by omega
    have hhi' : target - C.value i < C.value (C.gap i) := by
      rcases hhi with he | hlt
      · omega
      · exact hlt
    have hle : C.value (C.gap i) ≤ C.value j := by
      rcases lt_or_eq_of_le (show C.gap i ≤ j by omega) with hlt | he
      · exact le_of_lt (catalog_increasing C horder hlt hj)
      · rw [he]
    omega

theorem catalog_pair_forces_allowed (C : Catalog) (target : ℤ)
    (hcheck : ∀ i, i < C.size → catalogCheck C target i = true)
    {i j : ℕ} (hi : i < C.size) (hj : j < C.size)
    (hsum : C.value i + C.value j = target) :
    C.allowed i = true := by
  have horder : ∀ k, k + 1 < C.size → C.value k < C.value (k + 1) := by
    intro k hk
    have hc := hcheck k (by omega)
    simp only [catalogCheck, Bool.and_eq_true, decide_eq_true_eq] at hc
    exact hc.1 hk
  have hc := hcheck i hi
  simp only [catalogCheck, Bool.and_eq_true, Bool.or_eq_true,
    decide_eq_true_eq] at hc
  rcases hc.2 with ha | hg
  · exact ha
  · exact False.elim ((gapCheck_excludes C target horder hj hg) hsum)

def assignmentsCheck {α : Type*} (key : α → ℤ) (C : Catalog)
    (extra : ℕ → α → Bool) : List α → List ℕ → Bool
  | [], [] => true
  | a :: rest, index :: indices =>
      decide (index < C.size ∧ key a = C.value index) &&
        extra index a && assignmentsCheck key C extra rest indices
  | _, _ => false

theorem assignmentsCheck_sound {α : Type*} (key : α → ℤ) (C : Catalog)
    (extra : ℕ → α → Bool) {inputs : List α} {indices : List ℕ}
    (h : assignmentsCheck key C extra inputs indices = true) :
    ∀ a ∈ inputs, ∃ index, index < C.size ∧
      key a = C.value index ∧ extra index a = true := by
  induction inputs generalizing indices with
  | nil => simp
  | cons a rest ih =>
      cases indices with
      | nil => simp [assignmentsCheck] at h
      | cons index indices =>
          simp only [assignmentsCheck, Bool.and_eq_true, decide_eq_true_eq,
            and_assoc] at h
          intro b hb
          rcases List.mem_cons.mp hb with heq | hmem
          · subst b
            exact ⟨index, h.1, h.2.1, h.2.2.1⟩
          · exact ih h.2.2.2 b hmem

end HadamardQuotient133
