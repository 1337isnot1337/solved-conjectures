import Conjectures.FanTringaliStack

/-!
# Fan–Tringali's power-monoid length-set conjecture: the graph construction

A graph is recorded by its finitely many forbidden pairs. The allowed subsets
are exactly its cliques. A separate marked slab realizes each forbidden pair.
An additional unrestricted Boolean upper slice ensures positive height also
when the forbidden-pair list is empty; it imposes no additional restriction.
-/

open scoped Pointwise

namespace FanTringali

/-- A finite list of unordered nonedge constraints, with either orientation.
Repeated constraints are harmless. -/
structure Constraints (ι : Type*) where
  size : ℕ
  left : Fin size → ι
  right : Fin size → ι
  distinct : ∀ e, left e ≠ right e

section Graph

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Cliques in the graph whose nonedges are the recorded constraints. -/
def Compatible (C : Constraints ι) (J : Finset ι) : Prop :=
  ∀ e, ¬(C.left e ∈ J ∧ C.right e ∈ J)

omit [Fintype ι] [DecidableEq ι] in
theorem compatible_mono {C : Constraints ι} {J K : Finset ι}
    (hK : Compatible C K) (hJK : J ⊆ K) : Compatible C J :=
  fun e h => hK e ⟨hJK h.1, hJK h.2⟩

omit [Fintype ι] [DecidableEq ι] in
theorem compatible_empty (C : Constraints ι) : Compatible C ∅ := by
  intro e h
  exact Finset.notMem_empty _ h.1

omit [Fintype ι] [DecidableEq ι] in
theorem compatible_singleton (C : Constraints ι) (i : ι) : Compatible C {i} := by
  intro e h
  have hl := Finset.mem_singleton.mp h.1
  have hr := Finset.mem_singleton.mp h.2
  exact C.distinct e (hl.trans hr.symm)

def constraintRows (C : Constraints ι) (m : ℕ) : Finset (ι → ℕ) :=
  if hm : 0 < m ∧ m ≤ C.size then
    slab (C.left ⟨m-1, by omega⟩) (C.right ⟨m-1, by omega⟩)
      (C.distinct ⟨m-1, by omega⟩)
  else box Finset.univ

@[simp] theorem constraintRows_zero (C : Constraints ι) :
    constraintRows C 0 = box Finset.univ := by simp [constraintRows]

theorem constraintRows_succ (C : Constraints ι) (e : Fin C.size) :
    constraintRows C (e.val+1) = slab (C.left e) (C.right e) (C.distinct e) := by
  unfold constraintRows
  split_ifs with hm
  · have he : (⟨e.val+1-1, by omega⟩ : Fin C.size) = e := by
      apply Fin.ext
      simp only [Nat.add_sub_cancel]
    simp only [he]
  · have he := e.isLt
    omega

/-- The finite lattice set encoding the graph. -/
def graphSet (C : Constraints ι) : Finset (Marked ι → ℕ) :=
  stack (box Finset.univ) (Finset.range (C.size+1)) (constraintRows C)

theorem graphSet_layered (C : Constraints ι) :
    Layered none (markedAxes Finset.univ) (graphSet C) := by
  apply layered_stack
  refine ⟨0, by simp, ?_⟩
  rw [constraintRows_zero]
  exact ⟨0, zero_mem_box _⟩

theorem graphSet_row (C : Constraints ι) (e : Fin C.size) :
    row 1 (e.val+1) (graphSet C) = slab (C.left e) (C.right e) (C.distinct e) := by
  rw [graphSet, row_stack_upper]
  · exact constraintRows_succ C e
  · simp only [Finset.mem_range]
    have he := e.isLt
    omega

/-- A box divides the construction precisely when its axes form a clique; in
that case the quotient is unique among all finite subsets. -/
theorem graph_uniqueQuotient {C : Constraints ι} {J : Finset ι}
    (hJ : Compatible C J) :
    ∃ Q, UniqueQuotient (graphSet C) (box (markedAxes J)) Q := by
  classical
  have hRows : ∀ m ∈ Finset.range (C.size+1),
      ∃ Q, UniqueQuotient (constraintRows C m) (box J) Q := by
    intro m hm
    by_cases hm₀ : m=0
    · subst m
      rw [constraintRows_zero]
      exact ⟨_, uniqueQuotient_box (Finset.subset_univ _)⟩
    · have hmBound := Finset.mem_range.mp hm
      let e : Fin C.size := ⟨m-1, by omega⟩
      have he : m = e.val+1 := by dsimp [e]; omega
      rw [he, constraintRows_succ]
      exact slab_uniqueQuotient (C.distinct e) J (hJ e)
  let Q : ℕ → Finset (ι → ℕ) := fun m =>
    if hm : m ∈ Finset.range (C.size+1) then Classical.choose (hRows m hm) else ∅
  have hQ : ∀ m ∈ Finset.range (C.size+1),
      UniqueQuotient (constraintRows C m) (box J) (Q m) := by
    intro m hm
    dsimp only [Q]
    simp only [hm, dite_true]
    exact Classical.choose_spec (hRows m hm)
  have h := uniqueQuotient_stack
    (uniqueQuotient_box (U := Finset.univ) (J := J) (Finset.subset_univ _)) hQ
    (zero_mem_box J)
  rw [image_box_low] at h
  exact ⟨_, h⟩

theorem graph_compatible_of_quotient {C : Constraints ι} {J : Finset ι}
    {D : Finset (Marked ι → ℕ)} (hD : D + box (markedAxes J) = graphSet C) :
    Compatible C J := by
  intro e he
  have hh := congrArg (row 1 (e.val+1)) hD
  rw [← image_box_low, row_add_low, graphSet_row] at hh
  exact slab_no_quotient_both (C.distinct e) J he.1 he.2 _ hh

theorem graph_box_divisor_iff (C : Constraints ι) (J : Finset ι) :
    (∃ D, D + box (markedAxes J) = graphSet C) ↔ Compatible C J := by
  constructor
  · rintro ⟨D, hD⟩
    exact graph_compatible_of_quotient hD
  · intro hJ
    obtain ⟨Q, hQ⟩ := graph_uniqueQuotient hJ
    exact ⟨Q, hQ.sum_eq⟩

omit [Fintype ι] in
/-- Every subset of the ordinary marked axes comes from a unique set of
ordinary coordinates. -/
theorem subset_markedAxes {U : Finset ι} {K : Finset (Marked ι)}
    (hK : K ⊆ markedAxes U) : ∃ J, J ⊆ U ∧ markedAxes J = K := by
  let J := U.filter fun i => some (some i) ∈ K
  refine ⟨J, Finset.filter_subset _ _, ?_⟩
  ext i
  cases i with
  | none =>
    have hi : (none : Marked ι) ∉ K := fun hi => height_not_mem_markedAxes U (hK hi)
    simp [hi]
  | some i => cases i with
    | none =>
      have hi : (some none : Marked ι) ∉ K :=
        fun hi => marker_not_mem_markedAxes U (hK hi)
      simp [hi]
    | some i =>
      simp only [mem_markedAxes, J, Finset.mem_filter]
      constructor
      · exact And.right
      · intro hi
        exact ⟨mem_markedAxes.mp (hK hi), hi⟩

omit [Fintype ι] in
theorem markedAxes_injective : Function.Injective (markedAxes (ι := ι)) := by
  intro J K h
  ext i
  have hh := congrArg (fun S => some (some i) ∈ S) h
  simpa only [mem_markedAxes] using eq_iff_iff.mp hh

omit [Fintype ι] in
theorem markedAxes_subset_iff {J K : Finset ι} : markedAxes J ⊆ markedAxes K ↔ J ⊆ K := by
  constructor
  · intro h i hi
    exact mem_markedAxes.mp (h (mem_markedAxes.mpr hi))
  · intro h x hx
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
    exact mem_markedAxes.mpr (h hi)

omit [Fintype ι] in
theorem markedAxes_card (J : Finset ι) : (markedAxes J).card = J.card := by
  apply Finset.card_image_of_injective
  intro i j h
  exact Option.some.inj (Option.some.inj h)

end Graph

end FanTringali
