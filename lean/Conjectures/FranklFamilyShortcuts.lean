module

public import Conjectures.FranklLocalWeights

/-! Singleton, two-set, and two-neighbor abundance criteria for the distinct
unions of a finite generating collection. -/
@[expose] public section

namespace FranklLocal

variable {α : Type*} [DecidableEq α]

theorem frequency_pair_identity (F : Finset (Finset α)) (x y : α) :
    frequency F x+frequency F y+
        (F.filter (fun U => x ∉ U ∧ y ∉ U)).card=
      F.card+(F.filter (fun U => x ∈ U ∧ y ∈ U)).card := by
  have hu : F.filter (fun U => x ∈ U) ∪ F.filter (fun U => y ∈ U)=
      F.filter (fun U => x ∈ U ∨ y ∈ U) := by
    ext U
    simp only [Finset.mem_union,Finset.mem_filter]
    tauto
  have hi : F.filter (fun U => x ∈ U) ∩ F.filter (fun U => y ∈ U)=
      F.filter (fun U => x ∈ U ∧ y ∈ U) := by
    ext U
    simp only [Finset.mem_inter,Finset.mem_filter]
    tauto
  have hn : F.filter (fun U => ¬(x ∈ U ∨ y ∈ U))=
      F.filter (fun U => x ∉ U ∧ y ∉ U) := by
    ext U
    simp
  have hcard := Finset.card_union_add_card_inter
    (F.filter (fun U => x ∈ U)) (F.filter (fun U => y ∈ U))
  rw [hu,hi] at hcard
  have hpart := Finset.card_filter_add_card_filter_not
    (s:=F) (fun U => x ∈ U ∨ y ∈ U)
  rw [hn] at hpart
  unfold frequency
  omega

theorem abundant_pair_of_neither_le_both {F : Finset (Finset α)} {x y : α}
    (h : (F.filter (fun U => x ∉ U ∧ y ∉ U)).card ≤
      (F.filter (fun U => x ∈ U ∧ y ∈ U)).card) :
    Abundant F x ∨ Abundant F y := by
  have hi := frequency_pair_identity F x y
  unfold Abundant
  omega

/-- The two selected points hit every generator meeting g. Then any union
avoiding both points is disjoint from g. -/
theorem disjoint_of_two_neighbors {G : Finset (Finset α)} {g U : Finset α}
    {x y : α} (hU : U ∈ family G) (hx : x ∉ U) (hy : y ∉ U)
    (hhit : ∀ e ∈ G, ¬ Disjoint e g → x ∈ e ∨ y ∈ e) : Disjoint U g := by
  apply Finset.disjoint_left.mpr
  intro z hzU hzg
  obtain ⟨e,he,heU,hze⟩ := mem_family_iff_covered.mp hU z hzU
  have hmeet : ¬ Disjoint e g := fun h => Finset.disjoint_left.mp h hze hzg
  rcases hhit e he hmeet with hxe | hye
  · exact hx (heU hxe)
  · exact hy (heU hye)

theorem two_neighbor_generator_abundance {G : Finset (Finset α)}
    {g : Finset α} {x y : α} (hg : g ∈ G) (hxg : x ∈ g) (hyg : y ∈ g)
    (hhit : ∀ e ∈ G, ¬ Disjoint e g → x ∈ e ∨ y ∈ e) :
    Abundant (family G) x ∨ Abundant (family G) y := by
  apply abundant_pair_of_neither_le_both
  apply Finset.card_le_card_of_injOn (fun U => U ∪ g)
  · intro U hU
    obtain ⟨hUF,_,_⟩ := Finset.mem_filter.mp hU
    exact Finset.mem_filter.mpr
      ⟨union_mem_family hUF (generator_mem_family hg),
        Finset.mem_union_right _ hxg,Finset.mem_union_right _ hyg⟩
  · intro U hU V hV hUV
    obtain ⟨hUF,hUx,hUy⟩ := Finset.mem_filter.mp hU
    obtain ⟨hVF,hVx,hVy⟩ := Finset.mem_filter.mp hV
    have hu := disjoint_of_two_neighbors hUF hUx hUy hhit
    have hv := disjoint_of_two_neighbors hVF hVx hVy hhit
    have h := congrArg (fun S : Finset α => S \ g) hUV
    simpa only [Finset.union_sdiff_cancel_right hu,Finset.union_sdiff_cancel_right hv] using h

theorem two_set_generator_abundance {G : Finset (Finset α)} {x y : α}
    (hg : ({x,y}:Finset α) ∈ G) :
    Abundant (family G) x ∨ Abundant (family G) y := by
  apply two_neighbor_generator_abundance hg (by simp) (by simp)
  intro e _ hmeet
  by_cases hx : x ∈ e
  · exact Or.inl hx
  · right
    by_contra hy
    apply hmeet
    apply Finset.disjoint_left.mpr
    intro z hze hzg
    rcases Finset.mem_insert.mp hzg with hzx | hzy
    · exact hx (hzx ▸ hze)
    · exact hy ((Finset.mem_singleton.mp hzy) ▸ hze)

theorem singleton_generator_abundant {G : Finset (Finset α)} {x : α}
    (hg : ({x}:Finset α) ∈ G) : Abundant (family G) x := by
  have h : ({x,x}:Finset α) ∈ G := by simpa using hg
  exact (two_set_generator_abundance h).elim id id

/-- Removing the empty member cannot decrease the frequency proportion of
any point. This transfers a witness proved after adjoining the empty set. -/
theorem abundant_erase_empty {F : Finset (Finset α)} {x : α}
    (hx : Abundant F x) : Abundant (F.erase ∅) x := by
  have hfreq : frequency (F.erase ∅) x=frequency F x := by
    unfold frequency
    congr 1
    ext U
    simp only [Finset.mem_filter,Finset.mem_erase]
    constructor
    · rintro ⟨⟨_,hU⟩,hxU⟩
      exact ⟨hU,hxU⟩
    · rintro ⟨hU,hxU⟩
      refine ⟨⟨?_,hU⟩,hxU⟩
      intro h
      subst U
      simpa using hxU
  unfold Abundant at hx ⊢
  rw [hfreq]
  exact (Finset.card_erase_le (s:=F) (a:=∅)).trans hx

end FranklLocal
