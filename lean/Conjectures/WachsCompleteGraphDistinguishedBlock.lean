module
public import Conjectures.WachsCompleteGraphLabelEquiv

@[expose] public section
namespace WachsCompleteGraph

variable {α : Type*} [DecidableEq α]

/-- Removing a whole part leaves exactly the complement of that part. -/
theorem erase_part_sup {S B : Finset α} (P : Finpartition S) (hB : B ∈ P.parts) :
    (P.parts.erase B).sup id = S \ B := by
  ext a
  rw [Finset.mem_sup,Finset.mem_sdiff]
  constructor
  · rintro ⟨C,hC,ha⟩
    obtain ⟨hne,hCP⟩ := Finset.mem_erase.mp hC
    exact ⟨P.le hCP ha,fun h => (Finset.disjoint_left.mp (P.disjoint hCP hB hne)) ha h⟩
  · rintro ⟨hS,hn⟩
    obtain ⟨C,hC,ha⟩ := P.exists_mem hS
    exact ⟨C,Finset.mem_erase.mpr ⟨fun h => hn (h ▸ ha),hC⟩,ha⟩

def removePart {S B : Finset α} (P : Finpartition S) (hB : B ∈ P.parts) :
    Finpartition (S \ B) :=
  P.ofSubset (Finset.erase_subset _ _) (erase_part_sup P hB)

def addPart {S B : Finset α} (hBS : B ⊆ S) (hB : B ≠ ∅) (P : Finpartition (S \ B)) :
    Finpartition S :=
  P.extend hB (Finset.disjoint_sdiff.symm) (by exact Finset.sdiff_union_of_subset hBS)

theorem addPart_parts {S B : Finset α} (hBS : B ⊆ S) (hB : B ≠ ∅) (P : Finpartition (S \ B)) :
    (addPart hBS hB P).parts = insert B P.parts := rfl

theorem removePart_parts {S B : Finset α} (P : Finpartition S) (hB : B ∈ P.parts) :
    (removePart P hB).parts = P.parts.erase B := rfl

abbrev ContainingSubsets (S : Finset α) (a : α) := {B : Finset α // B ⊆ S ∧ a ∈ B}

instance (S : Finset α) (a : α) : Fintype (ContainingSubsets S a) :=
  Fintype.ofFinset (S.powerset.filter (a ∈ ·)) (fun B => by
    change B ∈ S.powerset.filter (a ∈ ·) ↔ B ⊆ S ∧ a ∈ B
    simp only [Finset.mem_filter,Finset.mem_powerset])

theorem marked_addPart_mem {S : Finset α} {a : α} (B : ContainingSubsets S a)
    (P : Finpartition (S \ B.val)) :
    B.val ∈ (addPart B.property.1 (Finset.nonempty_iff_ne_empty.mp ⟨a,B.property.2⟩) P).parts := by
  rw [addPart_parts]
  exact Finset.mem_insert_self _ _

theorem finpartition_heq {S T : Finset α} (h : S = T) {P : Finpartition S} {R : Finpartition T}
    (hp : P.parts = R.parts) : HEq P R := by
  subst T
  exact heq_of_eq (Finpartition.ext hp)

/-- Marking a vertex canonically splits a partition into its marked
block and an arbitrary partition of the complementary vertices. -/
def distinguishedBlockEquiv {S : Finset α} {a : α} (ha : a ∈ S) :
    Finpartition S ≃ Σ B : ContainingSubsets S a, Finpartition (S \ B.val) where
  toFun P := ⟨⟨P.part a, P.le (P.part_mem.mpr ha),P.mem_part ha⟩,removePart P (P.part_mem.mpr ha)⟩
  invFun den := addPart den.1.property.1
    (Finset.nonempty_iff_ne_empty.mp ⟨a,den.1.property.2⟩) den.2
  left_inv P := by
    apply Finpartition.ext
    rw [addPart_parts,removePart_parts,Finset.insert_erase (P.part_mem.mpr ha)]
  right_inv den := by
    obtain ⟨B,P⟩ := den
    let T := addPart B.property.1 (Finset.nonempty_iff_ne_empty.mp ⟨a,B.property.2⟩) P
    have hB : T.part a = B.val := T.part_eq_of_mem (marked_addPart_mem B P) B.property.2
    let V : ContainingSubsets S a := ⟨T.part a,T.le (T.part_mem.mpr ha),T.mem_part ha⟩
    have hV : V = B := Subtype.ext hB
    change (⟨V,removePart T (T.part_mem.mpr ha)⟩ : Σ C : ContainingSubsets S a, Finpartition (S \ C.val)) = ⟨B,P⟩
    apply Sigma.ext hV
    have he : HEq (removePart T (T.part_mem.mpr ha)).parts P.parts := by
      rw [heq_eq_eq,removePart_parts]
      rw [hB,show T.parts = insert B.val P.parts from rfl,Finset.erase_insert (by
        intro hm
        exact (Finset.mem_sdiff.mp (P.le hm B.property.2)).2 B.property.2)]
    exact finpartition_heq (congrArg (fun b : Finset α => S \ b) hB) (eq_of_heq he)

end WachsCompleteGraph
