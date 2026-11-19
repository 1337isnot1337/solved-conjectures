module

public import Conjectures.FranklBasic
public import Conjectures.FranklFamily

/-! Relabel finite families and their actual point frequencies by a bijection. -/
@[expose] public section

namespace Frankl.Relabel

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

def mapMember (e : α ≃ β) (U : Finset α) : Finset β := U.image e

def mapFamily (e : α ≃ β) (F : Finset (Finset α)) : Finset (Finset β) :=
  F.image (mapMember e)

theorem mem_mapMember (e : α ≃ β) {U : Finset α} {x : α} :
    e x ∈ mapMember e U ↔ x ∈ U := by
  constructor
  · intro hx
    obtain ⟨y, hy, he⟩ := Finset.mem_image.mp hx
    exact (e.injective he) ▸ hy
  · intro hx
    exact Finset.mem_image_of_mem e hx

theorem mapMember_injective (e : α ≃ β) : Function.Injective (mapMember e) := by
  intro U V h
  ext x
  have hU := mem_mapMember e (U := U) (x := x)
  have hV := mem_mapMember e (U := V) (x := x)
  rw [h] at hU
  exact hU.symm.trans hV

theorem mapMember_union (e : α ≃ β) (U V : Finset α) :
    mapMember e (U ∪ V) = mapMember e U ∪ mapMember e V := by
  simp only [mapMember, Finset.image_union]

theorem card_mapFamily (e : α ≃ β) (F : Finset (Finset α)) :
    (mapFamily e F).card = F.card :=
  Finset.card_image_of_injective F (mapMember_injective e)

theorem filter_mapFamily (e : α ≃ β) (F : Finset (Finset α)) (x : α) :
    (mapFamily e F).filter (fun U => e x ∈ U) =
      mapFamily e (F.filter (fun U => x ∈ U)) := by
  ext V
  constructor
  · intro h
    obtain ⟨hV, hx⟩ := Finset.mem_filter.mp h
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hV
    exact Finset.mem_image.mpr
      ⟨U, Finset.mem_filter.mpr ⟨hU, (mem_mapMember e).mp hx⟩, rfl⟩
  · intro h
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp h
    obtain ⟨hU, hx⟩ := Finset.mem_filter.mp hU
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_image_of_mem (mapMember e) hU, (mem_mapMember e).mpr hx⟩

theorem frequency_mapFamily (e : α ≃ β) (F : Finset (Finset α)) (x : α) :
    Frankl.frequency (mapFamily e F) (e x) = Frankl.frequency F x := by
  unfold Frankl.frequency
  rw [filter_mapFamily, card_mapFamily]

theorem abundant_mapFamily_iff (e : α ≃ β) (F : Finset (Finset α)) (x : α) :
    Frankl.Abundant (mapFamily e F) (e x) ↔ Frankl.Abundant F x := by
  unfold Frankl.Abundant
  rw [card_mapFamily, frequency_mapFamily]

theorem unionOf_mapFamily (e : α ≃ β) (H : Finset (Finset α)) :
    FranklLocal.unionOf (mapFamily e H) = mapMember e (FranklLocal.unionOf H) := by
  ext y
  obtain ⟨x, rfl⟩ := e.surjective y
  rw [mem_mapMember]
  constructor
  · intro hx
    obtain ⟨V, hV, hxV⟩ := Finset.mem_biUnion.mp hx
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hV
    exact Finset.mem_biUnion.mpr ⟨U, hU, (mem_mapMember e).mp hxV⟩
  · intro hx
    obtain ⟨U, hU, hxU⟩ := Finset.mem_biUnion.mp hx
    exact Finset.mem_biUnion.mpr
      ⟨mapMember e U, Finset.mem_image_of_mem (mapMember e) hU,
        (mem_mapMember e).mpr hxU⟩

theorem unionClosed_mapFamily (e : α ≃ β) {F : Finset (Finset α)}
    (hF : Frankl.UnionClosed F) : Frankl.UnionClosed (mapFamily e F) := by
  intro A hA B hB
  obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hA
  obtain ⟨V, hV, rfl⟩ := Finset.mem_image.mp hB
  rw [← mapMember_union]
  exact Finset.mem_image_of_mem (mapMember e) (hF U hU V hV)

end Frankl.Relabel
