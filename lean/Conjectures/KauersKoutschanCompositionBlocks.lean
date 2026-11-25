import Conjectures.KauersKoutschanCompositions

/-! Composition boundaries identify the maximal blocks of a selection. -/

namespace KauersKoutschan

abbrev valueCoordinates (n : ℕ) : Fin n ≃ Σ row : Fin 2, Fin (rowLength n row) :=
  (positionCoordinateEquiv n).trans (positionRows n)

theorem valueCoordinates_symm_val (n : ℕ) (row : Fin 2) (j : Fin (rowLength n row)) :
    ((valueCoordinates n).symm ⟨row, j⟩ : ℕ) = 2 * (j : ℕ) + (row : ℕ) :=
  rfl

theorem edgeCoordinates_symm_val (n : ℕ) (row : Fin 2) (i : Fin (rowLength n row - 1)) :
    ((edgeCoordinates n).symm ⟨row, i⟩ : ℕ) = 2 * (i : ℕ) + (row : ℕ) := by
  let e := (edgeCoordinates n).symm ⟨row, i⟩
  have he := edgeCoordinates_row_offset n e
  have heq : edgeCoordinates n e = ⟨row, i⟩ := (edgeCoordinates n).apply_symm_apply _
  rw [heq] at he
  change (row : ℕ) = (e : ℕ) % 2 ∧ (i : ℕ) = (e : ℕ) / 2 at he
  change (e : ℕ) = _
  omega

private theorem selectedAt_edge_iff {n : ℕ} (s : Finset (Fin (n - 2))) (e : Fin (n - 2)) :
    selectedAt s (e : ℕ) ↔ e ∈ s := by
  constructor
  · intro h
    obtain ⟨d, hd, he⟩ := Finset.mem_image.mp h
    rwa [show d = e from Fin.ext he] at hd
  · exact fun h => Finset.mem_image.mpr ⟨e, h, rfl⟩

noncomputable abbrev sourceComposition {n : ℕ} (s : Finset (Fin (n - 2))) (row : Fin 2) :
    CompositionAsSet (rowLength n row) :=
  (selectedEdgeCompositions n s row).toCompositionAsSet

/-- A value-chain position begins a selected run exactly when it is a
boundary of the corresponding composition. -/
theorem source_boundary_iff_block_head {n : ℕ} (s : Finset (Fin (n - 2)))
    (row : Fin 2) (j : Fin (rowLength n row)) :
    (⟨(j : ℕ), by have := j.isLt; omega⟩ : Fin (rowLength n row + 1)) ∈
      (sourceComposition s row).boundaries ↔
        let b := ((valueCoordinates n).symm ⟨row, j⟩ : ℕ)
        ¬ (2 ≤ b ∧ selectedAt s (b - 2)) := by
  have he := row.isLt
  simp only [valueCoordinates_symm_val]
  by_cases hj : (j : ℕ) = 0
  · have hz : (⟨(j : ℕ), by have := j.isLt; omega⟩ : Fin (rowLength n row + 1)) = 0 :=
      Fin.ext hj
    rw [hz]
    refine iff_of_true (sourceComposition s row).zero_mem ?_
    intro h
    have := h.1
    omega
  · let i : Fin (rowLength n row - 1) := ⟨(j : ℕ) - 1, by have := j.isLt; omega⟩
    let e := (edgeCoordinates n).symm ⟨row, i⟩
    have heq : (e : ℕ) = 2 * (j : ℕ) + (row : ℕ) - 2 := by
      rw [edgeCoordinates_symm_val n row i]
      dsimp [i]
      omega
    have hboundary : (⟨(j : ℕ), by have := j.isLt; omega⟩ : Fin (rowLength n row + 1)) =
        ⟨1 + (i : ℕ), by have := i.isLt; omega⟩ := Fin.ext (by dsimp [i]; omega)
    rw [hboundary, composition_boundary_iff]
    change e ∉ s ↔ _
    rw [← heq, selectedAt_edge_iff, and_iff_right (by omega : 2 ≤ 2 * (j : ℕ) + (row : ℕ))]

def boundaryAt {m : ℕ} (c : CompositionAsSet m) (x : ℕ) : Prop :=
  ∃ a : Fin (m + 1), (a : ℕ) = x ∧ a ∈ c.boundaries

private theorem boundaryAt_iff_missing {n : ℕ} (s : Finset (Fin (n - 2)))
    (row : Fin 2) (i : Fin (rowLength n row - 1)) :
    boundaryAt (sourceComposition s row) ((i : ℕ) + 1) ↔
      ¬selectedAt s (2 * (i : ℕ) + (row : ℕ)) := by
  let a : Fin (rowLength n row + 1) := ⟨1 + (i : ℕ), by have := i.isLt; omega⟩
  have h : boundaryAt (sourceComposition s row) ((i : ℕ) + 1) ↔ a ∈ (sourceComposition s row).boundaries := by
    constructor
    · rintro ⟨x, hx, hm⟩
      have he : x = a := Fin.ext (by dsimp [a]; omega)
      rwa [← he]
    · intro h
      exact ⟨a, by dsimp [a]; omega, h⟩
  rw [h]
  change a ∈ (sourceComposition s row).boundaries ↔ _
  rw [show a ∈ (sourceComposition s row).boundaries ↔
    (edgeCoordinates n).symm ⟨row, i⟩ ∉ s from composition_boundary_iff s row i]
  rw [← edgeCoordinates_symm_val n row i, selectedAt_edge_iff]

theorem admissibleOffset_iff_no_interior_cut {n : ℕ} (s : Finset (Fin (n - 2)))
    (row : Fin 2) (j : Fin (rowLength n row)) (k : ℕ) :
    admissibleOffset s ((valueCoordinates n).symm ⟨row, j⟩) k ↔
      (j : ℕ) + k < rowLength n row ∧
        ∀ z < k, ¬boundaryAt (sourceComposition s row) ((j : ℕ) + z + 1) := by
  have hr := row.isLt
  rw [admissibleOffset, valueCoordinates_symm_val]
  have hn : 2 * (j : ℕ) + (row : ℕ) + 2 * k < n ↔ (j : ℕ) + k < rowLength n row := by
    dsimp [rowLength]
    omega
  rw [hn]
  apply and_congr_right
  intro hk
  classical
  refine forall_congr' (fun z => imp_congr_right (fun hz => ?_))
  let i : Fin (rowLength n row - 1) := ⟨(j : ℕ) + z, by omega⟩
  have h := boundaryAt_iff_missing s row i
  have hi : 2 * (j : ℕ) + (row : ℕ) + 2 * z = 2 * (i : ℕ) + (row : ℕ) := by dsimp [i]; omega
  rw [hi]
  exact not_not.symm.trans (not_congr h).symm

private theorem no_boundary_between {m : ℕ} (c : CompositionAsSet m) (i : Fin c.length)
    (x : ℕ) (hl : (c.boundary ⟨(i : ℕ), c.lt_length' i⟩ : ℕ) < x)
    (hr : x < (c.boundary ⟨(i : ℕ) + 1, c.lt_length i⟩ : ℕ)) :
    ¬boundaryAt c x := by
  rintro ⟨a, ha, hm⟩
  obtain ⟨k, hk⟩ := (c.boundaries.orderIsoOfFin rfl).surjective ⟨a, hm⟩
  have hka : c.boundary k = a := congrArg Subtype.val hk
  have hl' : (c.boundary ⟨(i : ℕ), c.lt_length' i⟩ : ℕ) < c.boundary k := by rwa [hka, ha]
  have hr' : (c.boundary k : ℕ) < c.boundary ⟨(i : ℕ) + 1, c.lt_length i⟩ := by rwa [hka, ha]
  have lk := c.boundary.strictMono.lt_iff_lt.mp hl'
  have rk := c.boundary.strictMono.lt_iff_lt.mp hr'
  change (i : ℕ) < (k : ℕ) at lk
  change (k : ℕ) < (i : ℕ) + 1 at rk
  omega

abbrev compositionStart {m : ℕ} (c : CompositionAsSet m) (i : Fin c.length) : Fin m :=
  ⟨c.boundary ⟨(i : ℕ), c.lt_length' i⟩, by
    have h := c.boundary.strictMono (show (⟨(i : ℕ), c.lt_length' i⟩ : Fin c.boundaries.card) <
        ⟨(i : ℕ) + 1, c.lt_length i⟩ by exact Nat.lt_succ_self _)
    exact lt_of_lt_of_le h (Nat.le_of_lt_succ (c.boundary ⟨(i : ℕ) + 1, c.lt_length i⟩).isLt)⟩

/-- The literal selected run beginning at a composition boundary has exactly
its block size. -/
theorem runLength_eq_composition_block {n : ℕ} (s : Finset (Fin (n - 2)))
    (row : Fin 2) (i : Fin (sourceComposition s row).length) :
    runLength s ((valueCoordinates n).symm ⟨row, compositionStart (sourceComposition s row) i⟩) =
      (sourceComposition s row).blocksFun i := by
  let c := sourceComposition s row
  let a := compositionStart c i
  let b := c.boundary ⟨(i : ℕ) + 1, c.lt_length i⟩
  let w := (valueCoordinates n).symm ⟨row, a⟩
  have hab : (a : ℕ) < b := by
    exact c.boundary.strictMono (show (⟨(i : ℕ), c.lt_length' i⟩ : Fin c.boundaries.card) <
        ⟨(i : ℕ) + 1, c.lt_length i⟩ by exact Nat.lt_succ_self _)
  have hb := b.isLt
  have hδ : c.blocksFun i = (b : ℕ) - (a : ℕ) := rfl
  have hbefore : admissibleOffset s (w : ℕ) (c.blocksFun i - 1) := by
    apply (admissibleOffset_iff_no_interior_cut s row a _).mpr
    rw [hδ]
    refine ⟨by omega, ?_⟩
    intro z hz
    exact no_boundary_between c i _ (by change (a : ℕ) < _; omega)
      (by change _ < (b : ℕ); omega)
  have he : c.blocksFun i - 1 < runLength s (w : ℕ) :=
    (admissibleOffset_iff_lt_runLength s _ _).mp hbefore
  have hafter : ¬admissibleOffset s (w : ℕ) (c.blocksFun i) := by
    intro h
    obtain ⟨hl, hn⟩ := (admissibleOffset_iff_no_interior_cut s row a _).mp h
    have hx : (a : ℕ) + (c.blocksFun i - 1) + 1 = (b : ℕ) := by rw [hδ]; omega
    apply hn (c.blocksFun i - 1) (by rw [hδ]; omega)
    rw [hx]
    exact ⟨b, rfl, (c.boundaries.orderIsoOfFin rfl ⟨(i : ℕ) + 1, c.lt_length i⟩).2⟩
  have hn : ¬ c.blocksFun i < runLength s (w : ℕ) :=
    fun h => hafter ((admissibleOffset_iff_lt_runLength s _ _).mpr h)
  change runLength s (w : ℕ) = c.blocksFun i
  omega

private noncomputable def compositionHead {n : ℕ} (s : Finset (Fin (n - 2)))
    (q : Σ row : Fin 2, Fin (sourceComposition s row).length) : BlockHeads s :=
  let c := sourceComposition s q.1
  let j := compositionStart c q.2
  ⟨(valueCoordinates n).symm ⟨q.1, j⟩, (source_boundary_iff_block_head s q.1 j).mp
    ((c.boundaries.orderIsoOfFin rfl) ⟨q.2, c.lt_length' q.2⟩).2⟩

/-- The parts of the two cut compositions are exactly the literal maximal
value blocks, in their source chain order. -/
noncomputable def compositionHeadEquiv {n : ℕ} (s : Finset (Fin (n - 2))) :
    (Σ row : Fin 2, Fin (sourceComposition s row).length) ≃ BlockHeads s :=
  Equiv.ofBijective (compositionHead s) ⟨by
    rintro ⟨r, i⟩ ⟨t, j⟩ h
    have hh := (valueCoordinates n).symm.injective (congrArg Subtype.val h)
    have hr : r = t := congrArg Sigma.fst hh
    subst t
    let c := sourceComposition s r
    have he : (c.boundary ⟨(i : ℕ), c.lt_length' i⟩ : ℕ) =
        (c.boundary ⟨(j : ℕ), c.lt_length' j⟩ : ℕ) :=
      congrArg (fun v : Σ row : Fin 2, Fin (rowLength n row) => (v.2 : ℕ)) hh
    have hidx : (⟨(i : ℕ), c.lt_length' i⟩ : Fin c.boundaries.card) =
        ⟨(j : ℕ), c.lt_length' j⟩ := c.boundary.injective (Fin.ext he)
    have hv : (i : ℕ) = (j : ℕ) := congrArg (fun u : Fin c.boundaries.card => (u : ℕ)) hidx
    have hij : i = j := Fin.ext hv
    rw [hij], by
    intro b
    let x := valueCoordinates n b.1
    have hv : (valueCoordinates n).symm x = b.1 := (valueCoordinates n).symm_apply_apply b.1
    obtain ⟨r, j⟩ := x
    let c := sourceComposition s r
    let a : Fin (rowLength n r + 1) := ⟨j, by have := j.isLt; omega⟩
    have hm : a ∈ c.boundaries :=
      (source_boundary_iff_block_head s r j).mpr (by rw [hv]; exact b.2)
    obtain ⟨k, hk⟩ := (c.boundaries.orderIsoOfFin rfl).surjective ⟨a, hm⟩
    have ha : c.boundary k = a := congrArg Subtype.val hk
    have hlast : (k : ℕ) < c.length := by
      have hcard := c.card_boundaries_eq_succ_length
      have hki := k.isLt
      by_contra h
      have hkeq : k = ⟨c.length, c.length_lt_card_boundaries⟩ := Fin.ext (show (k : ℕ) = c.length by omega)
      rw [hkeq, c.boundary_length] at ha
      have hbad : rowLength n r = (j : ℕ) := congrArg Fin.val ha
      have hj := j.isLt
      omega
    refine ⟨⟨r, ⟨k, hlast⟩⟩, Subtype.ext ?_⟩
    change (valueCoordinates n).symm ⟨r, compositionStart c ⟨k, hlast⟩⟩ = b.1
    have haVal : (c.boundary k : ℕ) = (j : ℕ) :=
      congrArg (fun u : Fin (rowLength n r + 1) => (u : ℕ)) ha
    have hj : compositionStart c ⟨k, hlast⟩ = j := Fin.ext haVal
    rw [hj, hv]⟩

theorem compositionHeadEquiv_length {n : ℕ} (s : Finset (Fin (n - 2)))
    (q : Σ row : Fin 2, Fin (sourceComposition s row).length) :
    runLength s ((compositionHeadEquiv s q).1 : ℕ) = (sourceComposition s q.1).blocksFun q.2 :=
  runLength_eq_composition_block s q.1 q.2

end KauersKoutschan
