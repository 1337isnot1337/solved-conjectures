module

public import Conjectures.FranklLopsidedHarris

/-! An exact coordinate decomposition of a uniformly chosen finite selection:
one distinguished bit, its local bits, and the exterior bits. -/

@[expose] public section

namespace Frankl.Lopsided.Coordinates

open Finset

variable {ι : Type*} [DecidableEq ι]

abbrev Local (N : Finset ι) := {f : ι // f ∈ N}
abbrev Exterior (e : ι) (N : Finset ι) := {f : ι // f ∉ insert e N}
abbrev Slice (e : ι) (N : Finset ι) :=
  SlicedConfiguration (Local N) (Finset (Exterior e N))

def join (e : ι) (N : Finset ι) (z : Slice e N) : Finset ι :=
  let base := z.1.map (Function.Embedding.subtype _) ∪
    z.2.2.map (Function.Embedding.subtype _)
  if z.2.1 then insert e base else base

def split (e : ι) (N : Finset ι) (s : Finset ι) : Slice e N :=
  ⟨s.subtype (fun f => f ∉ insert e N), decide (e ∈ s), s.subtype (fun f => f ∈ N)⟩

theorem exterior_mem_join (e : ι) (N : Finset ι) (z : Slice e N)
    (f : Exterior e N) : (f : ι) ∈ join e N z ↔ f ∈ z.1 := by
  have hfe : (f : ι) ≠ e := fun h => f.2 (mem_insert.mpr (Or.inl h))
  have hfN : (f : ι) ∉ N := fun h => f.2 (mem_insert_of_mem h)
  have hn : (f : ι) ∉ z.2.2.map (Function.Embedding.subtype _) :=
    notMem_map_subtype_of_not_property _ hfN
  cases hbit : z.2.1 <;> simp [join, hbit, hfe, hn, hfN]

theorem local_mem_join (e : ι) (N : Finset ι) (he : e ∉ N) (z : Slice e N)
    (f : Local N) : (f : ι) ∈ join e N z ↔ f ∈ z.2.2 := by
  have hfe : (f : ι) ≠ e := fun h => he (h ▸ f.2)
  have hno : (f : ι) ∉ z.1.map (Function.Embedding.subtype _) := by
    intro hf
    exact property_of_mem_map_subtype z.1 hf (mem_insert_of_mem f.2)
  cases hbit : z.2.1 <;> simp [join, hbit, hfe, hno]

theorem center_mem_join (e : ι) (N : Finset ι) (he : e ∉ N) (z : Slice e N) :
    e ∈ join e N z ↔ z.2.1 = true := by
  have hn : e ∉ z.2.2.map (Function.Embedding.subtype _) :=
    notMem_map_subtype_of_not_property _ he
  have hno : e ∉ z.1.map (Function.Embedding.subtype _) := by
    intro hf
    exact property_of_mem_map_subtype z.1 hf (mem_insert_self e N)
  cases hbit : z.2.1 <;> simp [join, hbit, hn, hno]

theorem join_split (e : ι) (N : Finset ι) (he : e ∉ N) (s : Finset ι) :
    join e N (split e N s) = s := by
  ext f
  by_cases hfe : f = e
  · subst f
    simp only [center_mem_join e N he, split, decide_eq_true_eq]
  · by_cases hfN : f ∈ N
    · simpa only [split, mem_subtype] using
        local_mem_join e N he (split e N s) ⟨f, hfN⟩
    · have hfo : f ∉ insert e N := by simp [hfe, hfN]
      simpa only [split, mem_subtype] using
        exterior_mem_join e N (split e N s) ⟨f, hfo⟩

theorem split_join (e : ι) (N : Finset ι) (he : e ∉ N) (z : Slice e N) :
    split e N (join e N z) = z := by
  have ho : (join e N z).subtype (fun f => f ∉ insert e N) = z.1 := by
    ext f
    simpa only [mem_subtype] using exterior_mem_join e N z f
  have hn : (join e N z).subtype (fun f => f ∈ N) = z.2.2 := by
    ext f
    simpa only [mem_subtype] using local_mem_join e N he z f
  have hb : decide (e ∈ join e N z) = z.2.1 := by
    cases hbit : z.2.1 <;> simp [center_mem_join e N he, hbit]
  cases z with
  | mk o bn =>
    rcases bn with ⟨b, n⟩
    simp only [split, ho, hn, hb]

/-- The decomposition is a bijection of the literal finite configuration
spaces; no assumption of independence is added. -/
def equiv (e : ι) (N : Finset ι) (he : e ∉ N) : Finset ι ≃ Slice e N where
  toFun := split e N
  invFun := join e N
  left_inv := join_split e N he
  right_inv := split_join e N he

end Frankl.Lopsided.Coordinates
