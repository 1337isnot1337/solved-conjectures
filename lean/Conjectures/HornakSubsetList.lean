import Conjectures.HornakCoarsen
import Mathlib.Data.Fintype.Fin

/-! Translate between list subpartitions and finite sets of positions. -/
namespace Hornak

theorem list_window_iff_index_subset (middle short largest : ℕ) (parts : List ℕ) :
    HasMiddleWindowSubset middle short largest parts ↔
      ∃ chosen : Finset (Fin parts.length),
        InMiddleWindow middle short largest (∑ k ∈ chosen, parts[k]) := by
  classical
  constructor
  · rintro ⟨chosen,hsub,hwindow⟩
    obtain ⟨indices,heq,hord⟩ := List.sublist_eq_map_getElem hsub
    refine ⟨indices.toFinset,?_⟩
    rw [List.sum_toFinset _ hord.nodup, ← heq]
    exact hwindow
  · rintro ⟨chosen,hwindow⟩
    let indices := (List.finRange parts.length).filter (fun k => k ∈ chosen)
    have hnodup : indices.Nodup := List.Sublist.nodup (by exact List.filter_sublist) (List.nodup_finRange _)
    have hset : indices.toFinset = chosen := by
      ext k
      simp [indices]
    have hsum : (indices.map parts.get).sum = ∑ k ∈ chosen, parts[k] := by
      rw [← List.sum_toFinset parts.get hnodup, hset]
      rfl
    refine ⟨indices.map parts.get,?_,?_⟩
    · have hs : indices.Sublist (List.finRange parts.length) := by
        dsimp [indices]
        exact List.filter_sublist
      have h := hs.map parts.get
      simpa [List.map_get_finRange] using h
    · rw [hsum]
      exact hwindow

theorem middle_window_subsets_equiv {α β : Type*} [Fintype α] [Fintype β]
    (e : α ≃ β) (f : α → ℕ) (g : β → ℕ) (middle short largest : ℕ)
    (he : ∀ k, f k = g (e k)) :
    (∃ chosen : Finset α, InMiddleWindow middle short largest (∑ k ∈ chosen, f k)) ↔
    (∃ chosen : Finset β, InMiddleWindow middle short largest (∑ k ∈ chosen, g k)) := by
  classical
  constructor
  · rintro ⟨chosen,h⟩
    refine ⟨chosen.map e.toEmbedding,?_⟩
    rw [Finset.sum_map]
    change InMiddleWindow middle short largest (∑ k ∈ chosen, g (e k))
    have hs : (∑ k ∈ chosen, g (e k)) = ∑ k ∈ chosen, f k := by
      apply Finset.sum_congr rfl
      intro k _
      exact (he k).symm
    rw [hs]
    exact h
  · rintro ⟨chosen,h⟩
    refine ⟨chosen.map e.symm.toEmbedding,?_⟩
    rw [Finset.sum_map]
    change InMiddleWindow middle short largest (∑ k ∈ chosen, f (e.symm k))
    have hs : (∑ k ∈ chosen, f (e.symm k)) = ∑ k ∈ chosen, g k := by
      apply Finset.sum_congr rfl
      intro k _
      simpa using he (e.symm k)
    rw [hs]
    exact h

/-- The graph-theoretic middle-window characterization expressed in the
list form used by the reduction's balancing transformations. -/
theorem tripod_list_middle_iff (arms : Fin 3 → ℕ) (largest : ℕ) (parts : List ℕ)
    (hmax : ∀ k : Fin parts.length, parts[k] ≤ largest)
    (hshort : arms 2 < largest ∧ ∀ k : Fin parts.length, arms 2 < parts[k])
    (htotal : largest+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases largest parts.get) ↔
      HasMiddleWindowSubset (arms 1) (arms 2) largest parts := by
  classical
  let sizes : Fin (parts.length+1) → ℕ := Fin.cases largest parts.get
  have hm : ∀ k, sizes k ≤ sizes 0 := by
    intro k
    cases k using Fin.cases with
    | zero => exact le_rfl
    | succ k => exact hmax k
  have hs : ∀ k, arms 2 < sizes k := by
    intro k
    cases k using Fin.cases with
    | zero => exact hshort.1
    | succ k => exact hshort.2 k
  have ht : (∑ k, sizes k) = 1+∑ j, arms j := by
    rw [Fin.sum_univ_succ]
    change largest+(∑ k : Fin parts.length, parts.get k) = _
    rw [← List.sum_ofFn, List.ofFn_get]
    exact htotal
  have hg := tripod_middle_subset_iff arms sizes 0 hm hs ht
  have hb := list_window_iff_index_subset (arms 1) (arms 2) largest parts
  let e := otherLabelsEquiv (0 : Fin (parts.length+1))
  have he : ∀ k : Fin parts.length, parts[k] = sizes (e k).val := by intro k; rfl
  have hfin := middle_window_subsets_equiv e (fun k => parts[k]) (fun k => sizes k.val)
    (arms 1) (arms 2) largest he
  exact hg.trans (hfin.symm.trans hb.symm)

/-- Barth's balancing step for two noncentral parts, lifted from the
subset-sum lemma to actual tripod graph partitions. -/
theorem tripod_balance_noncentral (arms : Fin 3 → ℕ) (largest small large : ℕ)
    (rest : List ℕ) (hshort : arms 2 < small)
    (horder : small+2 ≤ large) (hmax : large ≤ largest)
    (hrestmax : ∀ x ∈ rest, x ≤ largest)
    (hrestshort : ∀ x ∈ rest, arms 2 < x)
    (htotal : largest+(small::large::rest).sum = 1+∑ j, arms j)
    (hnew : Partitionable arms (Fin.cases largest ((small+1)::(large-1)::rest).get)) :
    Partitionable arms (Fin.cases largest (small::large::rest).get) := by
  let old := small::large::rest
  let new := (small+1)::(large-1)::rest
  have hmaxold : ∀ k : Fin old.length, old[k] ≤ largest := by
    intro k
    have hh : old[k] ∈ old := List.get_mem old k
    simp only [old, List.mem_cons] at hh
    change old[k] = small ∨ old[k] = large ∨ old[k] ∈ rest at hh
    rcases hh with h | h | h
    · omega
    · omega
    · exact hrestmax _ h
  have hmaxnew : ∀ k : Fin new.length, new[k] ≤ largest := by
    intro k
    have hh : new[k] ∈ new := List.get_mem new k
    simp only [new, List.mem_cons] at hh
    change new[k] = small+1 ∨ new[k] = large-1 ∨ new[k] ∈ rest at hh
    rcases hh with h | h | h
    · omega
    · omega
    · exact hrestmax _ h
  have hshortold : arms 2 < largest ∧ ∀ k : Fin old.length, arms 2 < old[k] := by
    constructor
    · omega
    · intro k
      have hh : old[k] ∈ old := List.get_mem old k
      simp only [old, List.mem_cons] at hh
      change old[k] = small ∨ old[k] = large ∨ old[k] ∈ rest at hh
      rcases hh with h | h | h
      · omega
      · omega
      · exact hrestshort _ h
  have hshortnew : arms 2 < largest ∧ ∀ k : Fin new.length, arms 2 < new[k] := by
    constructor
    · omega
    · intro k
      have hh : new[k] ∈ new := List.get_mem new k
      simp only [new, List.mem_cons] at hh
      change new[k] = small+1 ∨ new[k] = large-1 ∨ new[k] ∈ rest at hh
      rcases hh with h | h | h
      · omega
      · omega
      · exact hrestshort _ h
  have htotalnew : largest+new.sum = 1+∑ j, arms j := by
    simp only [new, List.sum_cons] at htotal ⊢
    omega
  have hwindow := (tripod_list_middle_iff arms largest new hmaxnew hshortnew htotalnew).1 hnew
  have hold := middle_window_balance_transfer (arms 1) (arms 2) largest small large rest
    (by omega) horder hmax hwindow
  exact (tripod_list_middle_iff arms largest old hmaxold hshortold htotal).2 hold

/-- Barth's balancing step between the largest part and a smaller part,
lifted to actual tripod graph partitions. -/
theorem tripod_balance_largest (arms : Fin 3 → ℕ) (largest small : ℕ)
    (rest : List ℕ) (hshort : arms 2 < small)
    (hgap : small+2 ≤ largest)
    (hrestmax : ∀ x ∈ rest, x ≤ largest-1)
    (hrestshort : ∀ x ∈ rest, arms 2 < x)
    (htotal : largest+(small::rest).sum = 1+∑ j, arms j)
    (hnew : Partitionable arms (Fin.cases (largest-1) ((small+1)::rest).get)) :
    Partitionable arms (Fin.cases largest (small::rest).get) := by
  let old := small::rest
  let new := (small+1)::rest
  have hmaxold : ∀ k : Fin old.length, old[k] ≤ largest := by
    intro k
    have hh : old[k] ∈ old := List.get_mem old k
    simp only [old, List.mem_cons] at hh
    change old[k] = small ∨ old[k] ∈ rest at hh
    rcases hh with h | h
    · omega
    · have := hrestmax _ h; omega
  have hmaxnew : ∀ k : Fin new.length, new[k] ≤ largest-1 := by
    intro k
    have hh : new[k] ∈ new := List.get_mem new k
    simp only [new, List.mem_cons] at hh
    change new[k] = small+1 ∨ new[k] ∈ rest at hh
    rcases hh with h | h
    · omega
    · exact hrestmax _ h
  have hshortold : arms 2 < largest ∧ ∀ k : Fin old.length, arms 2 < old[k] := by
    constructor
    · omega
    · intro k
      have hh : old[k] ∈ old := List.get_mem old k
      simp only [old, List.mem_cons] at hh
      change old[k] = small ∨ old[k] ∈ rest at hh
      rcases hh with h | h
      · omega
      · exact hrestshort _ h
  have hshortnew : arms 2 < largest-1 ∧ ∀ k : Fin new.length, arms 2 < new[k] := by
    constructor
    · omega
    · intro k
      have hh : new[k] ∈ new := List.get_mem new k
      simp only [new, List.mem_cons] at hh
      change new[k] = small+1 ∨ new[k] ∈ rest at hh
      rcases hh with h | h
      · omega
      · exact hrestshort _ h
  have htotalnew : (largest-1)+new.sum = 1+∑ j, arms j := by
    simp only [new, List.sum_cons] at htotal ⊢
    omega
  have hwindow := (tripod_list_middle_iff arms (largest-1) new hmaxnew hshortnew htotalnew).1 hnew
  have hold := middle_window_largest_transfer (arms 1) (arms 2) largest small rest (by omega) hwindow
  exact (tripod_list_middle_iff arms largest old hmaxold hshortold htotal).2 hold

theorem list_fiber_card (parts : List ℕ) (n : ℕ) :
    Nat.card {k : Fin parts.length // parts[k] = n} = parts.count n := by
  classical
  let v : List.Vector ℕ parts.length := ⟨parts,rfl⟩
  have h := Fin.card_filter_univ_eq_vector_get_eq_count n v
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype]
  change (Finset.univ.filter (fun k : Fin parts.length => parts.get k = n)).card = parts.count n at ⊢
  change (Finset.univ.filter (fun k : Fin parts.length => parts.get k = n)).card = parts.count n at h
  exact h

/-- Permuting noncentral parts leaves graph realizability unchanged. -/
theorem tripod_partition_list_perm {m : ℕ} (arms : Fin m → ℕ) (center : ℕ)
    (left right : List ℕ) (hp : left.Perm right) :
    Partitionable arms (Fin.cases center left.get) ↔
      Partitionable arms (Fin.cases center right.get) := by
  constructor <;> intro hpart
  · apply partitionable_reorder arms (Fin.cases center left.get) (Fin.cases center right.get) _ hpart
    intro n
    rw [size_fiber_card_succ, size_fiber_card_succ]
    congr 1
    change Nat.card {k : Fin left.length // left[k] = n} = Nat.card {k : Fin right.length // right[k] = n}
    rw [list_fiber_card, list_fiber_card]
    exact hp.count_eq n
  · apply partitionable_reorder arms (Fin.cases center right.get) (Fin.cases center left.get) _ hpart
    intro n
    rw [size_fiber_card_succ, size_fiber_card_succ]
    congr 1
    change Nat.card {k : Fin right.length // right[k] = n} = Nat.card {k : Fin left.length // left[k] = n}
    rw [list_fiber_card, list_fiber_card]
    exact (hp.count_eq n).symm

end Hornak
