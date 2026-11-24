import Conjectures.FanTringaliGraphLengths
import Mathlib.Data.Fintype.Sigma

/-!
# Fan–Tringali's power-monoid length-set conjecture: prescribed spectra

A disjoint union of complete graphs with orders `w i` has maximal cliques of
exactly those orders. The graph construction therefore realizes every finite
nonempty set of lengths at least two in a finite-dimensional lattice.
-/

open scoped Pointwise

namespace FanTringali

abbrev BlockVertex {I : Type*} (w : I → ℕ) := (i : I) × Fin (w i)
abbrev CrossPair {I : Type*} (w : I → ℕ) :=
  {p : BlockVertex w × BlockVertex w // p.1.1 ≠ p.2.1}

section Blocks

variable {I : Type*} [Fintype I] [DecidableEq I] (w : I → ℕ)

/-- All pairs from different components are forbidden; pairs within a component
are allowed. -/
noncomputable def blockConstraints : Constraints (BlockVertex w) where
  size := Fintype.card (CrossPair w)
  left e := ((Fintype.equivFin (CrossPair w)).symm e).val.1
  right e := ((Fintype.equivFin (CrossPair w)).symm e).val.2
  distinct e := by
    intro he
    have ht := congrArg Sigma.fst he
    exact ((Fintype.equivFin (CrossPair w)).symm e).property ht

/-- One complete component of the graph. -/
def block (i : I) : Finset (BlockVertex w) :=
  (Finset.univ : Finset (Fin (w i))).image (Sigma.mk i)

omit [Fintype I] in
@[simp] theorem mem_block {i : I} {v : BlockVertex w} : v ∈ block w i ↔ v.1=i := by
  rcases v with ⟨j, v⟩
  constructor
  · intro h
    obtain ⟨u, _, hu⟩ := Finset.mem_image.mp h
    exact (congrArg Sigma.fst hu).symm
  · intro h
    dsimp at h
    subst j
    exact Finset.mem_image.mpr ⟨v, Finset.mem_univ _, rfl⟩

omit [Fintype I] in
@[simp] theorem card_block (i : I) : (block w i).card = w i := by
  rw [block, Finset.card_image_of_injective _ sigma_mk_injective]
  simp

theorem block_compatible_iff (J : Finset (BlockVertex w)) :
    Compatible (blockConstraints w) J ↔ ∀ x ∈ J, ∀ y ∈ J, x.1=y.1 := by
  constructor
  · intro h x hx y hy
    by_contra hxy
    let p : CrossPair w := ⟨(x,y), hxy⟩
    apply h ((Fintype.equivFin (CrossPair w)) p)
    constructor
    · simpa only [blockConstraints, Equiv.symm_apply_apply, p] using hx
    · simpa only [blockConstraints, Equiv.symm_apply_apply, p] using hy
  · intro h e he
    exact ((Fintype.equivFin (CrossPair w)).symm e).property
      (h _ he.1 _ he.2)

theorem block_compatible (i : I) : Compatible (blockConstraints w) (block w i) := by
  apply (block_compatible_iff w _).mpr
  intro x hx y hy
  exact ((mem_block w).mp hx).trans ((mem_block w).mp hy).symm

/-- Positivity ensures that every component itself is a nonempty maximal
clique. There are no other maximal cliques. -/
theorem block_maximal_iff [Nonempty I] (hw : ∀ i, 0 < w i)
    (J : Finset (BlockVertex w)) :
    MaximalCompatible (blockConstraints w) J ↔ ∃ i, J=block w i := by
  constructor
  · intro hMax
    rcases Finset.eq_empty_or_nonempty J with hJ | ⟨v, hv⟩
    · obtain ⟨i⟩ := ‹Nonempty I›
      let v : BlockVertex w := ⟨i, ⟨0, hw i⟩⟩
      have heq := hMax.2 {v} (by simp [hJ]) (compatible_singleton _ v)
      have hv : v ∈ J := by rw [← heq]; simp
      rw [hJ] at hv
      exact False.elim (Finset.notMem_empty v hv)
    · refine ⟨v.1, (hMax.2 (block w v.1) ?_ (block_compatible w v.1)).symm⟩
      intro x hx
      apply (mem_block w).mpr
      exact (block_compatible_iff w J).mp hMax.1 x hx v hv
  · rintro ⟨i, rfl⟩
    refine ⟨block_compatible w i, ?_⟩
    intro K hK hCompat
    apply Finset.Subset.antisymm
    · intro x hx
      let v : BlockVertex w := ⟨i, ⟨0, hw i⟩⟩
      have hv : v ∈ K := hK ((mem_block w).mpr rfl)
      exact (mem_block w).mpr ((block_compatible_iff w K).mp hCompat x hx v hv)
    · exact hK

theorem block_graph_lengths [Nonempty I] (hw : ∀ i, 0 < w i) :
    Lengths (graphSet (blockConstraints w)) = {n | ∃ i, n=w i+1} := by
  rw [graph_lengths]
  ext n
  constructor
  · rintro ⟨J, hMax, hn⟩
    obtain ⟨i, rfl⟩ := (block_maximal_iff w hw J).mp hMax
    exact ⟨i, by simpa only [card_block] using hn⟩
  · rintro ⟨i, hn⟩
    exact ⟨block w i, (block_maximal_iff w hw _).mpr ⟨i, rfl⟩,
      by simpa only [card_block] using hn⟩

end Blocks

/-- The finite-dimensional set realizing a requested finite spectrum. -/
noncomputable def spectrumSet (S : Finset ℕ) :
    Finset (Marked (BlockVertex (fun i : S => i.val-1)) → ℕ) :=
  graphSet (blockConstraints (fun i : S => i.val-1))

theorem spectrumSet_zero (S : Finset ℕ) : 0 ∈ spectrumSet S :=
  (graphSet_layered _).zero_mem

/-- Every finite nonempty subset of `{2,3,...}` is realized in some finite
nonnegative integer lattice. This theorem includes the entire requested set of
lengths, with no additional lengths. -/
theorem finite_spectrum_lattice (S : Finset ℕ) (hS : S.Nonempty)
    (hmin : ∀ n ∈ S, 2 ≤ n) : Lengths (spectrumSet S) = (S : Set ℕ) := by
  obtain ⟨s, hs⟩ := hS
  let : Nonempty S := ⟨⟨s, hs⟩⟩
  have hw : ∀ i : S, 0 < i.val-1 := by
    intro i
    have hi := hmin i.val i.property
    omega
  rw [spectrumSet, block_graph_lengths _ hw]
  ext n
  constructor
  · rintro ⟨i, hn⟩
    have hi := hmin i.val i.property
    have heq : n=i.val := by omega
    exact heq ▸ i.property
  · intro hn
    refine ⟨⟨n, hn⟩, ?_⟩
    have hnmin := hmin n hn
    dsimp
    omega

end FanTringali
