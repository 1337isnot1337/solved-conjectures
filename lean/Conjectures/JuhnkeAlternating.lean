import Conjectures.JuhnkeRunLengths

/-!
# Juhnke's conjecture

Alternating direction sequences and their positive run-length counts.
The first direction and the number of runs determine every direction.
-/

namespace Juhnke

open scoped BigOperators

def alternatingLabel {r : ℕ} (start : Bool) (i : Fin r) : Bool :=
  if i.val % 2 = 0 then start else !start

theorem alternatingLabel_succ {r : ℕ} (start : Bool) (i j : Fin r)
    (h : j.val = i.val + 1) : alternatingLabel start j = !(alternatingLabel start i) := by
  by_cases hi : i.val % 2 = 0
  · have hj : ¬j.val % 2 = 0 := by omega
    simp [alternatingLabel, hi, hj]
  · have hj : j.val % 2 = 0 := by omega
    simp [alternatingLabel, hi, hj]

theorem alternatingLabel_adjacent {r : ℕ} (start : Bool) (i : Fin (r - 1)) :
    alternatingLabel start (leftUnit i) ≠ alternatingLabel start (rightUnit i) := by
  rw [alternatingLabel_succ start (leftUnit i) (rightUnit i) rfl]
  cases alternatingLabel start (leftUnit i) <;> decide

theorem eq_alternatingLabel {r : ℕ} (hr : 0 < r) (w : Fin r → Bool)
    (hw : ∀ i : Fin (r - 1), w (leftUnit i) ≠ w (rightUnit i)) :
    w = alternatingLabel (w ⟨0, hr⟩) := by
  have H : ∀ k (hk : k < r), w ⟨k, hk⟩ = alternatingLabel (w ⟨0, hr⟩) ⟨k, hk⟩ := by
    intro k
    induction k with
    | zero => intro hk; simp [alternatingLabel]
    | succ k ih =>
      intro hk
      have hk' : k < r := by omega
      have hne := hw ⟨k, by omega⟩
      change w ⟨k, hk'⟩ ≠ w ⟨k + 1, hk⟩ at hne
      rw [Bool.eq_not_iff.mpr (Ne.symm hne), ih hk']
      exact (alternatingLabel_succ _ ⟨k, hk'⟩ ⟨k + 1, hk⟩ rfl).symm
  funext i
  exact H i.val i.isLt

def alternatingLabelsEquiv {r : ℕ} (hr : 0 < r) :
    {w : Fin r → Bool // ∀ i : Fin (r - 1), w (leftUnit i) ≠ w (rightUnit i)} ≃ Bool where
  toFun w := w.val ⟨0, hr⟩
  invFun start := ⟨alternatingLabel start, alternatingLabel_adjacent start⟩
  left_inv w := by apply Subtype.ext; exact (eq_alternatingLabel hr w.val w.property).symm
  right_inv start := by simp [alternatingLabel]

def evenPositionsEquiv (r : ℕ) :
    {i : Fin r // i.val % 2 = 0} ≃ Fin ((r + 1) / 2) where
  toFun i := ⟨i.val.val / 2, by omega⟩
  invFun i := ⟨⟨2 * i.val, by omega⟩, by dsimp; omega⟩
  left_inv i := by apply Subtype.ext; apply Fin.ext; dsimp; omega
  right_inv i := by apply Fin.ext; dsimp; omega

def oddPositionsEquiv (r : ℕ) :
    {i : Fin r // ¬i.val % 2 = 0} ≃ Fin (r / 2) where
  toFun i := ⟨i.val.val / 2, by omega⟩
  invFun i := ⟨⟨2 * i.val + 1, by omega⟩, by dsimp; omega⟩
  left_inv i := by apply Subtype.ext; apply Fin.ext; dsimp; omega
  right_inv i := by apply Fin.ext; dsimp; omega

def eastPositionsTrueEquiv (r : ℕ) :
    {i : Fin r // alternatingLabel true i = true} ≃ Fin ((r + 1) / 2) :=
  (Equiv.subtypeEquivRight (fun _ => by simp [alternatingLabel])).trans
    (evenPositionsEquiv r)

def northPositionsTrueEquiv (r : ℕ) :
    {i : Fin r // ¬alternatingLabel true i = true} ≃ Fin (r / 2) :=
  (Equiv.subtypeEquivRight (fun _ => by simp [alternatingLabel])).trans
    (oddPositionsEquiv r)

def eastPositionsFalseEquiv (r : ℕ) :
    {i : Fin r // alternatingLabel false i = true} ≃ Fin (r / 2) :=
  (Equiv.subtypeEquivRight (fun _ => by simp [alternatingLabel])).trans
    (oddPositionsEquiv r)

def northPositionsFalseEquiv (r : ℕ) :
    {i : Fin r // ¬alternatingLabel false i = true} ≃ Fin ((r + 1) / 2) :=
  (Equiv.subtypeEquivRight (fun _ => by simp [alternatingLabel])).trans
    (evenPositionsEquiv r)

/-- Positive successive run lengths, with alternating labels and a fixed endpoint. -/
abbrev AlternatingLengths (r a b : ℕ) (start : Bool) :=
  SplitPositiveOn (fun i : Fin r => alternatingLabel start i = true) a b

theorem alternatingLengths_even_card {a b : ℕ} (ha : 0 < a) (hb : 0 < b)
    (j : ℕ) (start : Bool) :
    Fintype.card (AlternatingLengths (2 * j + 2) a b start) =
      (a - 1).choose j * (b - 1).choose j := by
  cases start
  · apply splitPositiveOn_card _ ha hb
      ((eastPositionsFalseEquiv _).trans (finCongr (by omega)))
      ((northPositionsFalseEquiv _).trans (finCongr (by omega)))
  · apply splitPositiveOn_card _ ha hb
      ((eastPositionsTrueEquiv _).trans (finCongr (by omega)))
      ((northPositionsTrueEquiv _).trans (finCongr (by omega)))

theorem alternatingLengths_odd_true_card {a b : ℕ} (ha : 0 < a) (hb : 0 < b)
    (j : ℕ) :
    Fintype.card (AlternatingLengths (2 * j + 3) a b true) =
      (a - 1).choose (j + 1) * (b - 1).choose j := by
  apply splitPositiveOn_card _ ha hb
    ((eastPositionsTrueEquiv _).trans (finCongr (by omega)))
    ((northPositionsTrueEquiv _).trans (finCongr (by omega)))

theorem alternatingLengths_odd_false_card {a b : ℕ} (ha : 0 < a) (hb : 0 < b)
    (j : ℕ) :
    Fintype.card (AlternatingLengths (2 * j + 3) a b false) =
      (a - 1).choose j * (b - 1).choose (j + 1) := by
  apply splitPositiveOn_card _ ha hb
    ((eastPositionsFalseEquiv _).trans (finCongr (by omega)))
    ((northPositionsFalseEquiv _).trans (finCongr (by omega)))

end Juhnke
