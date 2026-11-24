import Conjectures.JuhnkePathsBasic
import Conjectures.JuhnkeCompositions

/-!
# Juhnke's conjecture

The exact correspondence between positive-length steps and a unit word with
cuts. A direction change must be a step boundary; every other interior
position is an independent optional boundary.
-/

namespace Juhnke

open scoped BigOperators

def cutBoundary {N : ℕ} (i : Fin (N - 1)) : Fin (N + 1) :=
  ⟨i + 1, by omega⟩

theorem mem_cuts_iff_boundary {N : ℕ} (c : Composition N) (i : Fin (N - 1)) :
    i ∈ compositionCutsEquiv N c ↔ cutBoundary i ∈ c.boundaries := by
  simp [compositionCutsEquiv, compositionEquiv, compositionAsSetEquiv,
    Composition.toCompositionAsSet, cutBoundary, Nat.add_comm]

theorem cut_iff_index_change {N : ℕ} (c : Composition N) (i : Fin (N - 1)) :
    i ∈ compositionCutsEquiv N c ↔ c.index (leftUnit i) ≠ c.index (rightUnit i) := by
  rw [mem_cuts_iff_boundary]
  constructor
  · intro hi heq
    obtain ⟨j, _, hj⟩ := Finset.mem_map.mp hi
    have hj' : c.sizeUpTo j = i.val + 1 := congrArg Fin.val hj
    have hlo := c.sizeUpTo_index_le (leftUnit i)
    have hhi := c.lt_sizeUpTo_index_succ (rightUnit i)
    rw [← heq] at hhi
    change c.sizeUpTo (c.index (leftUnit i)).val ≤ i.val at hlo
    change i.val + 1 < c.sizeUpTo ((c.index (leftUnit i)).val + 1) at hhi
    by_cases hle : j.val ≤ (c.index (leftUnit i)).val
    · have hm := c.monotone_sizeUpTo hle
      omega
    · have hm := c.monotone_sizeUpTo (show (c.index (leftUnit i)).val + 1 ≤ j.val by omega)
      omega
  · intro hi
    let k := c.index (rightUnit i)
    have hlo := c.sizeUpTo_index_le (rightUnit i)
    have hhi := c.lt_sizeUpTo_index_succ (rightUnit i)
    change c.sizeUpTo k ≤ i.val + 1 at hlo
    change i.val + 1 < c.sizeUpTo (k.val + 1) at hhi
    have hk : c.sizeUpTo k = i.val + 1 := by
      by_contra hne
      have hl : c.sizeUpTo k ≤ (leftUnit i).val := by
        change c.sizeUpTo k ≤ i.val
        omega
      have hu : (leftUnit i).val < c.sizeUpTo (k.val + 1) := by
        change i.val < c.sizeUpTo (k.val + 1)
        omega
      have hm := (c.mem_range_embedding_iff').mp
        ((c.mem_range_embedding_iff).mpr ⟨hl, hu⟩)
      exact hi hm.symm
    refine Finset.mem_map.mpr ⟨⟨k.val, by omega⟩, Finset.mem_univ _, ?_⟩
    apply Fin.ext
    exact hk

theorem LiteralPath.changes_subset_cuts {N : ℕ} (p : LiteralPath N) :
    changes p.word ⊆ compositionCutsEquiv N p.1 := by
  intro i hi
  rw [cut_iff_index_change]
  intro heq
  exact (mem_changes p.word i).mp hi (congrArg p.2 heq)

/-- A unit word together with exactly the selected step boundaries. -/
abbrev CutPath (N : ℕ) :=
  Σ w : Fin N → Bool, {s : Finset (Fin (N - 1)) // changes w ⊆ s}

noncomputable instance (N : ℕ) : Fintype (CutPath N) := by
  classical
  unfold CutPath
  infer_instance

/-- The direction assigned to the first unit edge of every block. -/
def blockLabels {N : ℕ} (c : Composition N) (w : Fin N → Bool) : Fin c.length → Bool :=
  fun i ↦ w (c.embedding i ⟨0, c.one_le_blocksFun i⟩)

theorem blockLabels_heq {N : ℕ} {c d : Composition N} (h : c = d)
    (w : Fin N → Bool) : blockLabels c w ≍ blockLabels d w := by
  subst d
  rfl

theorem constant_on_block {N : ℕ} (c : Composition N) (w : Fin N → Bool)
    (hcuts : changes w ⊆ compositionCutsEquiv N c)
    (i : Fin c.length) (j : Fin (c.blocksFun i)) :
    w (c.embedding i j) = blockLabels c w i := by
  have H : ∀ t (ht : t < c.blocksFun i),
      w (c.embedding i ⟨t, ht⟩) = w (c.embedding i ⟨0, c.one_le_blocksFun i⟩) := by
    intro t
    induction t with
    | zero => intro ht; rfl
    | succ t ih =>
      intro ht
      have ht' : t < c.blocksFun i := by omega
      let e := c.embedding i ⟨t, ht'⟩
      let e' := c.embedding i ⟨t + 1, ht⟩
      let cut : Fin (N - 1) := ⟨e.val, by
        have he' := e'.isLt
        simp only [e', Composition.coe_embedding] at he'
        simp only [e, Composition.coe_embedding]
        omega⟩
      have hl : leftUnit cut = e := by rfl
      have hr : rightUnit cut = e' := by
        apply Fin.ext
        simp [rightUnit, cut, e, e', Nat.add_assoc]
      have hn : cut ∉ compositionCutsEquiv N c := by
        rw [cut_iff_index_change, hl, hr]
        simp [e, e']
      have heq : w e = w e' := by
        by_contra hne
        exact hn (hcuts ((mem_changes w cut).mpr (by simpa [hl, hr] using hne)))
      exact heq.symm.trans (ih ht')
  exact H j.val j.isLt

theorem word_blockLabels {N : ℕ} (c : Composition N) (w : Fin N → Bool)
    (hcuts : changes w ⊆ compositionCutsEquiv N c) :
    (fun i ↦ blockLabels c w (c.index i)) = w := by
  funext i
  have h := constant_on_block c w hcuts (c.index i) (c.invEmbedding i)
  simpa using h.symm

theorem blockLabels_word {N : ℕ} (p : LiteralPath N) :
    blockLabels p.1 p.word = p.2 := by
  funext i
  simp [blockLabels, LiteralPath.word]

def literalPathToCuts {N : ℕ} (p : LiteralPath N) : CutPath N :=
  ⟨p.word, compositionCutsEquiv N p.1, p.changes_subset_cuts⟩

def cutsToLiteralPath {N : ℕ} (p : CutPath N) : LiteralPath N :=
  let c := (compositionCutsEquiv N).symm p.2.val
  ⟨c, blockLabels c p.1⟩

theorem cutsToLiteralPath_word {N : ℕ} (p : CutPath N) :
    (cutsToLiteralPath p).word = p.1 := by
  apply word_blockLabels
  simpa using p.2.property

def literalPathCutsEquiv (N : ℕ) : LiteralPath N ≃ CutPath N where
  toFun := literalPathToCuts
  invFun := cutsToLiteralPath
  left_inv p := by
    have hc := (compositionCutsEquiv N).symm_apply_apply p.1
    apply Sigma.ext hc
    exact (blockLabels_heq hc p.word).trans (heq_of_eq (blockLabels_word p))
  right_inv p := by
    apply Sigma.ext (cutsToLiteralPath_word p)
    apply (Subtype.heq_iff_coe_eq (fun s ↦ ?_)).mpr
    · change (compositionCutsEquiv N) ((compositionCutsEquiv N).symm p.2.val) = p.2.val
      exact (compositionCutsEquiv N).apply_symm_apply p.2.val
    · change changes (cutsToLiteralPath p).word ⊆ s ↔ changes p.1 ⊆ s
      rw [cutsToLiteralPath_word]

theorem literalPathCutsEquiv_east {N : ℕ} (p : LiteralPath N) :
    p.east = eastCount ((literalPathCutsEquiv N) p).1 :=
  p.east_eq_word_eastCount

theorem literalPathCutsEquiv_stepCount {N : ℕ} (hN : 0 < N) (p : LiteralPath N) :
    p.stepCount = (((literalPathCutsEquiv N) p).2.val).card + 1 :=
  compositionCutsEquiv_length hN p.1

end Juhnke
