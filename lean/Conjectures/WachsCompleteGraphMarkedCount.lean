module
public import Conjectures.WachsCompleteGraphDistinguishedBlock

@[expose] public section
namespace WachsCompleteGraph

variable {α : Type*} [DecidableEq α]

def markedSizeEquiv {S : Finset α} {a : α} (ha : a ∈ S) (j : ℕ) :
    {B : ContainingSubsets S a // B.val.card = j+1} ≃ ↑((S.erase a).powersetCard j) where
  toFun B := ⟨B.val.val.erase a,Finset.mem_powersetCard.mpr
    ⟨Finset.erase_subset_erase _ B.val.property.1,by
      rw [Finset.card_erase_of_mem B.val.property.2,B.property]
      rfl⟩⟩
  invFun T := by
    obtain ⟨hs,hcard⟩ := Finset.mem_powersetCard.mp T.property
    have hn : a ∉ T.val := fun h => Finset.notMem_erase _ _ (hs h)
    refine ⟨⟨insert a T.val,Finset.insert_subset ha (hs.trans (Finset.erase_subset _ _)),Finset.mem_insert_self _ _⟩,?_⟩
    rw [Finset.card_insert_of_notMem hn,hcard]
  left_inv B := by
    apply Subtype.ext
    apply Subtype.ext
    exact Finset.insert_erase B.val.property.2
  right_inv T := by
    apply Subtype.ext
    exact Finset.erase_insert (fun h => Finset.notMem_erase _ _
      ((Finset.mem_powersetCard.mp T.property).1 h))

theorem marked_size_card {S : Finset α} {a : α} (ha : a ∈ S) (j : ℕ) :
    Fintype.card {B : ContainingSubsets S a // B.val.card = j+1} = (S.card-1).choose j := by
  rw [Fintype.card_congr (markedSizeEquiv ha j),Fintype.card_coe,Finset.card_powersetCard,
    Finset.card_erase_of_mem ha]

end WachsCompleteGraph
