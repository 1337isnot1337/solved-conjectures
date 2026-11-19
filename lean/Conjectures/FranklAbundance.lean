module

public import Conjectures.FranklBasic
public meta import Lean.Elab.Tactic.Omega

/-! Elementary abundance reductions used before the local finite certificate. -/
@[expose] public section

namespace Frankl

variable {α : Type*} [DecidableEq α]

@[simp] theorem frequency_insert_empty (F : Finset (Finset α)) (x : α) :
    frequency (insert ∅ F) x = frequency F x := by
  unfold frequency
  congr 1
  ext U
  simp only [Finset.mem_filter, Finset.mem_insert]
  constructor
  · rintro ⟨hU, hx⟩
    rcases hU with rfl | hU
    · exact False.elim (Finset.notMem_empty x hx)
    · exact ⟨hU, hx⟩
  · rintro ⟨hU, hx⟩
    exact ⟨Or.inr hU, hx⟩

theorem abundant_of_insert_empty {F : Finset (Finset α)} {x : α}
    (h : Abundant (insert ∅ F) x) : Abundant F x := by
  have hcard : F.card ≤ (insert ∅ F).card := Finset.card_le_card (Finset.subset_insert _ _)
  simpa only [Abundant, frequency_insert_empty] using hcard.trans h

theorem unionClosed_insert_empty {F : Finset (Finset α)} (hF : UnionClosed F) :
    UnionClosed (insert ∅ F) := by
  intro A hA B hB
  rcases Finset.mem_insert.mp hA with rfl | hA
  · simpa using hB
  rcases Finset.mem_insert.mp hB with rfl | hB
  · simpa using Finset.mem_insert_of_mem hA
  exact Finset.mem_insert_of_mem (hF A hA B hB)

theorem generatedUnion_mem_of_unionClosed {F H : Finset (Finset α)}
    (hF : UnionClosed F) (h0 : ∅ ∈ F) (hH : H ⊆ F) : generatedUnion H ∈ F := by
  induction H using Finset.induction_on with
  | empty => simpa using h0
  | @insert A H hA ih =>
    have haF : A ∈ F := hH (Finset.mem_insert_self _ _)
    have hHF : H ⊆ F := fun U hU => hH (Finset.mem_insert_of_mem hU)
    simpa [generatedUnion] using hF A haF (generatedUnion H) (ih hHF)

theorem generatedUnions_eq_of_unionClosed {F : Finset (Finset α)}
    (hF : UnionClosed F) (h0 : ∅ ∈ F) : generatedUnions F = F := by
  apply Finset.Subset.antisymm
  · intro U hU
    obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hU
    exact generatedUnion_mem_of_unionClosed hF h0 hH
  · intro U hU
    exact generator_mem_generatedUnions hU

theorem union_injective_on_disjoint (g : Finset α) :
    Set.InjOn (fun U : Finset α => U ∪ g) {U | Disjoint U g} := by
  intro A hA B hB h
  change A ∪ g = B ∪ g at h
  apply Finset.Subset.antisymm
  · intro x hx
    have hx' : x ∈ B ∪ g := by
      rw [← h]
      exact Finset.mem_union.mpr (Or.inl hx)
    rcases Finset.mem_union.mp hx' with hxB | hxg
    · exact hxB
    · exact False.elim (Finset.disjoint_left.mp hA hx hxg)
  · intro x hx
    have hx' : x ∈ A ∪ g := by
      rw [h]
      exact Finset.mem_union.mpr (Or.inl hx)
    rcases Finset.mem_union.mp hx' with hxA | hxg
    · exact hxA
    · exact False.elim (Finset.disjoint_left.mp hB hx hxg)

/-- Counting the four membership patterns at two points. -/
theorem pair_frequency_balance (F : Finset (Finset α)) (x y : α) :
    frequency F x + frequency F y + (F.filter (fun U => x ∉ U ∧ y ∉ U)).card =
      F.card + (F.filter (fun U => x ∈ U ∧ y ∈ U)).card := by
  have hx := frequency_add_missing F x
  have h0 := Finset.card_filter_add_card_filter_not
    (s := F.filter (fun U => x ∉ U)) (fun U => y ∈ U)
  have hy := Finset.card_filter_add_card_filter_not
    (s := F.filter (fun U => y ∈ U)) (fun U => x ∈ U)
  simp only [Finset.filter_filter] at h0 hy
  have h10 : (F.filter (fun U => y ∈ U ∧ x ∉ U)) =
      F.filter (fun U => x ∉ U ∧ y ∈ U) := by
    ext U
    simp only [Finset.mem_filter, and_comm]
  have h11 : (F.filter (fun U => y ∈ U ∧ x ∈ U)) =
      F.filter (fun U => x ∈ U ∧ y ∈ U) := by
    ext U
    simp only [Finset.mem_filter, and_comm]
  rw [h10, h11] at hy
  unfold frequency at hx ⊢
  omega

/-- Joining a fixed member pairs sets containing neither point with sets containing both. -/
theorem neither_le_both_of_join {F : Finset (Finset α)} {g : Finset α} {x y : α}
    (hF : UnionClosed F) (hg : g ∈ F) (hx : x ∈ g) (hy : y ∈ g)
    (hdis : ∀ U ∈ F, x ∉ U → y ∉ U → Disjoint U g) :
    (F.filter (fun U => x ∉ U ∧ y ∉ U)).card ≤
      (F.filter (fun U => x ∈ U ∧ y ∈ U)).card := by
  apply Finset.card_le_card_of_injOn (fun U => U ∪ g)
  · intro U hU
    obtain ⟨hU, hxU, hyU⟩ := Finset.mem_filter.mp hU
    exact Finset.mem_filter.mpr ⟨hF U hU g hg,
      Finset.mem_union.mpr (Or.inr hx), Finset.mem_union.mpr (Or.inr hy)⟩
  · intro U hU V hV h
    obtain ⟨hU, hxU, hyU⟩ := Finset.mem_filter.mp hU
    obtain ⟨hV, hxV, hyV⟩ := Finset.mem_filter.mp hV
    exact union_injective_on_disjoint g (hdis U hU hxU hyU) (hdis V hV hxV hyV) h

theorem pair_frequency_bound_of_join {F : Finset (Finset α)} {g : Finset α} {x y : α}
    (hF : UnionClosed F) (hg : g ∈ F) (hx : x ∈ g) (hy : y ∈ g)
    (hdis : ∀ U ∈ F, x ∉ U → y ∉ U → Disjoint U g) :
    F.card ≤ frequency F x + frequency F y := by
  have hcount := neither_le_both_of_join hF hg hx hy hdis
  have hbalance := pair_frequency_balance F x y
  omega

theorem abundant_or_of_pair_frequency {F : Finset (Finset α)} {x y : α}
    (h : F.card ≤ frequency F x + frequency F y) : Abundant F x ∨ Abundant F y := by
  unfold Abundant
  omega

theorem abundant_or_of_join {F : Finset (Finset α)} {g : Finset α} {x y : α}
    (hF : UnionClosed F) (hg : g ∈ F) (hx : x ∈ g) (hy : y ∈ g)
    (hdis : ∀ U ∈ F, x ∉ U → y ∉ U → Disjoint U g) :
    Abundant F x ∨ Abundant F y :=
  abundant_or_of_pair_frequency (pair_frequency_bound_of_join hF hg hx hy hdis)

theorem pair_member_abundant {F : Finset (Finset α)} {x y : α}
    (hF : UnionClosed F) (hxy : ({x, y} : Finset α) ∈ F) :
    Abundant F x ∨ Abundant F y := by
  apply abundant_or_of_join hF hxy (by simp) (by simp)
  intro U hU hxU hyU
  apply Finset.disjoint_left.mpr
  intro z hzU hzg
  rcases Finset.mem_insert.mp hzg with rfl | hzy
  · exact hxU hzU
  · have : z = y := Finset.mem_singleton.mp hzy
    exact hyU (this ▸ hzU)

theorem singleton_member_abundant {F : Finset (Finset α)} {x : α}
    (hF : UnionClosed F) (hx : ({x} : Finset α) ∈ F) : Abundant F x := by
  have hxx : ({x, x} : Finset α) ∈ F := by simpa using hx
  exact (pair_member_abundant hF hxx).elim id id

theorem singleton_generator_abundant {G : Finset (Finset α)} {x : α}
    (hx : ({x} : Finset α) ∈ G) : Abundant (generatedUnions G) x :=
  singleton_member_abundant (generatedUnions_union_closed G)
    (generator_mem_generatedUnions hx)

theorem pair_generator_abundant {G : Finset (Finset α)} {x y : α}
    (hxy : ({x, y} : Finset α) ∈ G) :
    Abundant (generatedUnions G) x ∨ Abundant (generatedUnions G) y :=
  pair_member_abundant (generatedUnions_union_closed G)
    (generator_mem_generatedUnions hxy)

/-- Two points of a generator meet every generator that intersects it. -/
theorem two_neighbor_generator_abundant {G : Finset (Finset α)} {g : Finset α} {x y : α}
    (hg : g ∈ G) (hx : x ∈ g) (hy : y ∈ g)
    (hhit : ∀ A ∈ G, ¬ Disjoint A g → x ∈ A ∨ y ∈ A) :
    Abundant (generatedUnions G) x ∨ Abundant (generatedUnions G) y := by
  apply abundant_or_of_join (generatedUnions_union_closed G)
    (generator_mem_generatedUnions hg) hx hy
  intro U hU hxU hyU
  obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hU
  apply (Finset.disjoint_biUnion_left H id g).mpr
  intro A hA
  by_contra hdis
  rcases hhit A (hH hA) hdis with hxA | hyA
  · exact hxU (Finset.mem_biUnion.mpr ⟨A, hA, hxA⟩)
  · exact hyU (Finset.mem_biUnion.mpr ⟨A, hA, hyA⟩)

end Frankl
