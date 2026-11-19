module

public import Conjectures.FranklFamily
public import Mathlib.Data.Finset.Prod

/-! Exact independence by a bijection of finite selections: freely varying
the coordinates in I contributes a factor 2^|I|. -/
@[expose] public section

namespace FranklLocal

variable {ι : Type*} [DecidableEq ι]

theorem separated_union_outside {s t I : Finset ι}
    (hs : Disjoint s I) (ht : t ⊆ I) : (s ∪ t) \ I=s := by
  ext x
  constructor
  · intro hx
    obtain ⟨hxst,hxI⟩ := Finset.mem_sdiff.mp hx
    rcases Finset.mem_union.mp hxst with hxs | hxt
    · exact hxs
    · exact False.elim (hxI (ht hxt))
  · intro hxs
    exact Finset.mem_sdiff.mpr
      ⟨Finset.mem_union_left _ hxs,fun hxI => Finset.disjoint_left.mp hs hxs hxI⟩

theorem separated_union_inside {s t I : Finset ι}
    (hs : Disjoint s I) (ht : t ⊆ I) : (s ∪ t) ∩ I=t := by
  ext x
  constructor
  · intro hx
    obtain ⟨hxst,hxI⟩ := Finset.mem_inter.mp hx
    rcases Finset.mem_union.mp hxst with hxs | hxt
    · exact False.elim (Finset.disjoint_left.mp hs hxs hxI)
    · exact hxt
  · intro hxt
    exact Finset.mem_inter.mpr ⟨Finset.mem_union_right _ hxt,ht hxt⟩

/-- If membership in F depends only on the selected indices outside I,
the empty I-slice has exactly a 2^|I| fraction of all members of F. -/
theorem independent_empty_slice_card (F : Finset (Finset ι)) (I : Finset ι)
    (hind : ∀ s t : Finset ι, s \ I=t \ I → (s ∈ F ↔ t ∈ F)) :
    2^I.card*(F.filter (fun s => Disjoint s I)).card=F.card := by
  let C := F.filter (fun s => Disjoint s I)
  let pairs := C.product I.powerset
  let join : Finset ι × Finset ι → Finset ι := fun p => p.1 ∪ p.2
  have himage : pairs.image join=F := by
    ext U
    constructor
    · intro hU
      obtain ⟨⟨s,t⟩,hst,rfl⟩ := Finset.mem_image.mp hU
      obtain ⟨hsC,htI⟩ := Finset.mem_product.mp hst
      obtain ⟨hsF,hsD⟩ := Finset.mem_filter.mp hsC
      have ht := Finset.mem_powerset.mp htI
      exact (hind (s ∪ t) s
        ((separated_union_outside hsD ht).trans
          (Finset.sdiff_eq_self_of_disjoint hsD).symm)).mpr hsF
    · intro hUF
      have hdiff : (U \ I) \ I=U \ I := by
        ext x
        simp only [Finset.mem_sdiff]
        tauto
      have hsF := (hind (U \ I) U hdiff).mpr hUF
      refine Finset.mem_image.mpr ⟨(U \ I,U ∩ I),?_,?_⟩
      · exact Finset.mem_product.mpr
          ⟨Finset.mem_filter.mpr ⟨hsF,Finset.sdiff_disjoint⟩,
            Finset.mem_powerset.mpr Finset.inter_subset_right⟩
      · exact Finset.sdiff_union_inter U I
  have hinj : Set.InjOn join (pairs:Set (Finset ι × Finset ι)) := by
    intro p hp q hq hpq
    obtain ⟨hpC,hpI⟩ := Finset.mem_product.mp hp
    obtain ⟨hqC,hqI⟩ := Finset.mem_product.mp hq
    have hpD := (Finset.mem_filter.mp hpC).2
    have hqD := (Finset.mem_filter.mp hqC).2
    have hpS := Finset.mem_powerset.mp hpI
    have hqS := Finset.mem_powerset.mp hqI
    change p.1 ∪ p.2=q.1 ∪ q.2 at hpq
    have hfirst := congrArg (fun U : Finset ι => U \ I) hpq
    have hsecond := congrArg (fun U : Finset ι => U ∩ I) hpq
    rw [separated_union_outside hpD hpS,separated_union_outside hqD hqS] at hfirst
    rw [separated_union_inside hpD hpS,separated_union_inside hqD hqS] at hsecond
    exact Prod.ext hfirst hsecond
  calc
    2^I.card*(F.filter (fun s => Disjoint s I)).card=pairs.card := by
      simp only [pairs,C,Finset.card_product,Finset.card_powerset,Nat.mul_comm]
    _=(pairs.image join).card := (Finset.card_image_of_injOn hinj).symm
    _=F.card := congrArg Finset.card himage

end FranklLocal
