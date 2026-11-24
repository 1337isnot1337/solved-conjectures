import Conjectures.JuhnkePathsCuts

/-!
# Juhnke's conjecture

Canonical maximal runs of an arbitrary unit word. This supplies the exact
word-to-alternating-positive-composition correspondence used to enumerate
even and odd run counts.
-/

namespace Juhnke

theorem adjacent_composition_indices {N : ℕ} (c : Composition N) (j : Fin (N - 1)) :
    (c.index (rightUnit j)).val = (c.index (leftUnit j)).val ∨
      (c.index (rightUnit j)).val = (c.index (leftUnit j)).val + 1 := by
  let q := c.index (leftUnit j)
  let r := c.index (rightUnit j)
  have hqlo := c.sizeUpTo_index_le (leftUnit j)
  have hqhi := c.lt_sizeUpTo_index_succ (leftUnit j)
  have hrlo := c.sizeUpTo_index_le (rightUnit j)
  have hrhi := c.lt_sizeUpTo_index_succ (rightUnit j)
  change c.sizeUpTo q.val ≤ j.val at hqlo
  change j.val < c.sizeUpTo (q.val + 1) at hqhi
  change c.sizeUpTo r.val ≤ j.val + 1 at hrlo
  change j.val + 1 < c.sizeUpTo (r.val + 1) at hrhi
  have hqr : q.val ≤ r.val := by
    by_contra h
    have hm := c.monotone_sizeUpTo (show r.val + 1 ≤ q.val by omega)
    omega
  have hrq : r.val ≤ q.val + 1 := by
    by_contra h
    have hq' : q.val + 1 < c.length := by have := r.isLt; omega
    have hs : c.sizeUpTo (q.val + 1) < c.sizeUpTo (q.val + 2) := by
      simpa only [Nat.add_assoc] using c.sizeUpTo_strict_mono hq'
    have hm := c.monotone_sizeUpTo (show q.val + 2 ≤ r.val by omega)
    omega
  change r.val = q.val ∨ r.val = q.val + 1
  omega

theorem cut_indices_succ {N : ℕ} (c : Composition N) (j : Fin (N - 1))
    (hj : j ∈ compositionCutsEquiv N c) :
    (c.index (rightUnit j)).val = (c.index (leftUnit j)).val + 1 := by
  rcases adjacent_composition_indices c j with h | h
  · exact ((cut_iff_index_change c j).mp hj (Fin.ext h.symm)).elim
  · exact h

/-- The interior unit-edge cut between two consecutive blocks. -/
def betweenBlocks {N : ℕ} (c : Composition N) (i : Fin (c.length - 1)) : Fin (N - 1) :=
  ⟨c.sizeUpTo (i.val + 1) - 1, by
    have h0 := c.sizeUpTo_strict_mono (leftUnit i).isLt
    have h1 := c.sizeUpTo_strict_mono (rightUnit i).isLt
    have h2 := c.sizeUpTo_le (i.val + 2)
    change c.sizeUpTo i.val < c.sizeUpTo (i.val + 1) at h0
    change c.sizeUpTo (i.val + 1) < c.sizeUpTo (i.val + 2) at h1
    omega⟩

theorem index_betweenBlocks_left {N : ℕ} (c : Composition N) (i : Fin (c.length - 1)) :
    c.index (leftUnit (betweenBlocks c i)) = leftUnit i := by
  symm
  apply c.mem_range_embedding_iff'.mp
  apply c.mem_range_embedding_iff.mpr
  have h0 := c.sizeUpTo_strict_mono (leftUnit i).isLt
  change c.sizeUpTo i.val < c.sizeUpTo (i.val + 1) at h0
  change c.sizeUpTo i.val ≤ c.sizeUpTo (i.val + 1) - 1 ∧
    c.sizeUpTo (i.val + 1) - 1 < c.sizeUpTo (i.val + 1)
  omega

theorem index_betweenBlocks_right {N : ℕ} (c : Composition N) (i : Fin (c.length - 1)) :
    c.index (rightUnit (betweenBlocks c i)) = rightUnit i := by
  symm
  apply c.mem_range_embedding_iff'.mp
  apply c.mem_range_embedding_iff.mpr
  have h0 := c.sizeUpTo_strict_mono (leftUnit i).isLt
  have h1 := c.sizeUpTo_strict_mono (rightUnit i).isLt
  change c.sizeUpTo i.val < c.sizeUpTo (i.val + 1) at h0
  change c.sizeUpTo (i.val + 1) < c.sizeUpTo (i.val + 2) at h1
  change c.sizeUpTo (i.val + 1) ≤ c.sizeUpTo (i.val + 1) - 1 + 1 ∧
    c.sizeUpTo (i.val + 1) - 1 + 1 < c.sizeUpTo (i.val + 2)
  omega

def AlternatingLabels {N : ℕ} (p : LiteralPath N) : Prop :=
  ∀ i : Fin (p.stepCount - 1), p.2 (leftUnit i) ≠ p.2 (rightUnit i)

/-- A path consists of maximal direction runs exactly when its labels alternate. -/
theorem alternatingLabels_iff_changes_eq_cuts {N : ℕ} (p : LiteralPath N) :
    AlternatingLabels p ↔ changes p.word = compositionCutsEquiv N p.1 := by
  constructor
  · intro hp
    apply Finset.Subset.antisymm p.changes_subset_cuts
    intro j hj
    have hs := cut_indices_succ p.1 j hj
    let i : Fin (p.stepCount - 1) := ⟨(p.1.index (leftUnit j)).val, by
      have := (p.1.index (rightUnit j)).isLt
      change (p.1.index (leftUnit j)).val < p.1.length - 1
      omega⟩
    have hl : leftUnit i = p.1.index (leftUnit j) := Fin.ext rfl
    have hr : rightUnit i = p.1.index (rightUnit j) := Fin.ext hs.symm
    apply (mem_changes p.word j).mpr
    simpa only [LiteralPath.word, ← hl, ← hr] using hp i
  · intro hp i
    have hne : leftUnit i ≠ rightUnit i := by
      intro h
      have := congrArg Fin.val h
      simp [leftUnit, rightUnit] at this
    have hb : betweenBlocks p.1 i ∈ compositionCutsEquiv N p.1 := by
      rw [cut_iff_index_change, index_betweenBlocks_left, index_betweenBlocks_right]
      exact hne
    rw [← hp] at hb
    have h := (mem_changes p.word (betweenBlocks p.1 i)).mp hb
    simpa only [LiteralPath.word, index_betweenBlocks_left, index_betweenBlocks_right] using h

/-- Merge all consecutive unit edges with the same direction into one maximal run. -/
def maximalPath {N : ℕ} (w : Fin N → Bool) : LiteralPath N :=
  cutsToLiteralPath ⟨w, changes w, Finset.Subset.refl _⟩

theorem maximalPath_word {N : ℕ} (w : Fin N → Bool) : (maximalPath w).word = w :=
  cutsToLiteralPath_word _

theorem maximalPath_alternating {N : ℕ} (w : Fin N → Bool) :
    AlternatingLabels (maximalPath w) := by
  apply (alternatingLabels_iff_changes_eq_cuts _).mpr
  rw [maximalPath_word]
  exact ((compositionCutsEquiv N).apply_symm_apply (changes w)).symm

theorem maximalPath_east {N : ℕ} (w : Fin N → Bool) :
    (maximalPath w).east = eastCount w := by
  rw [LiteralPath.east_eq_word_eastCount, maximalPath_word]

theorem maximalPath_stepCount {N : ℕ} (hN : 0 < N) (w : Fin N → Bool) :
    (maximalPath w).stepCount = runCount w := by
  rw [runCount_of_pos hN]
  exact compositionCutsEquiv_symm_length hN (changes w)

theorem LiteralPath.east_of_one_step {N : ℕ} (p : LiteralPath N)
    (hp : p.stepCount = 1) : p.east = 0 ∨ p.east = N := by
  let i0 : Fin p.1.length := ⟨0, by change 0 < p.stepCount; omega⟩
  have hi (i : Fin p.1.length) : i = i0 := by
    apply Fin.ext
    have hi := i.isLt
    change p.1.length = 1 at hp
    change i.val = 0
    omega
  cases hd : p.2 i0 with
  | false =>
    have hall (i : Fin p.1.length) : p.2 i = false := by rw [hi i, hd]
    left
    simp [LiteralPath.east, hall]
  | true =>
    have hall (i : Fin p.1.length) : p.2 i = true := by rw [hi i, hd]
    right
    simp [LiteralPath.east, hall]

theorem eastCount_of_one_run {N : ℕ} (hN : 0 < N) (w : Fin N → Bool)
    (hw : runCount w = 1) : eastCount w = 0 ∨ eastCount w = N := by
  have hp : (maximalPath w).stepCount = 1 := (maximalPath_stepCount hN w).trans hw
  simpa only [maximalPath_east] using (maximalPath w).east_of_one_step hp

/-- Unit words are in bijection with alternating labeled positive compositions. -/
def unitWordMaximalEquiv (N : ℕ) :
    (Fin N → Bool) ≃ {p : LiteralPath N // AlternatingLabels p} where
  toFun w := ⟨maximalPath w, maximalPath_alternating w⟩
  invFun p := p.val.word
  left_inv := maximalPath_word
  right_inv p := by
    apply Subtype.ext
    have hp := (alternatingLabels_iff_changes_eq_cuts p.val).mp p.property
    have hcut : (⟨p.val.word, changes p.val.word, Finset.Subset.refl _⟩ : CutPath N) =
        literalPathToCuts p.val := by
      unfold literalPathToCuts
      apply congrArg (Sigma.mk p.val.word)
      apply Subtype.ext
      exact hp
    change cutsToLiteralPath _ = p.val
    rw [hcut]
    exact (literalPathCutsEquiv N).symm_apply_apply p.val

end Juhnke
