module

public import Conjectures.McNamaraSteingrimssonPrefixFamilies

@[expose] public section
namespace McNamaraSteingrimsson

abbrev BlockOrder {s : ℕ} (lengths : Fin s→ℕ) :=
  (i : Fin s) → Equiv.Perm (Fin (lengths i))

abbrev BlockPosition {s : ℕ} (lengths : Fin s→ℕ) :=
  Σ i : Fin s, Fin (lengths i)

def blockPositionLT {s : ℕ} {lengths : Fin s→ℕ}
    (p q : BlockPosition lengths) : Prop :=
  p.1 < q.1 ∨ p.1=q.1 ∧ p.2.val < q.2.val

def blockValueLT {s : ℕ} {lengths : Fin s→ℕ} (p : BlockOrder lengths)
    (i j : BlockPosition lengths) : Prop :=
  i.1 < j.1 ∨ i.1=j.1 ∧ (p i.1 i.2).val < (p j.1 j.2).val

structure BlockEmbedding {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    (p : BlockOrder lengths) (q : BlockOrder widths) where
  map : BlockPosition lengths → BlockPosition widths
  injective : Function.Injective map
  position_iff : ∀ i j, blockPositionLT i j ↔ blockPositionLT (map i) (map j)
  value_iff : ∀ i j, blockValueLT p i j ↔ blockValueLT q (map i) (map j)

def blockFirst {s : ℕ} {lengths : Fin s→ℕ} {i : Fin s} (hn : 0<lengths i) :
    BlockPosition lengths := ⟨i,⟨0,hn⟩⟩

/-- An occurrence cannot straddle two host summands if the original
permutation has its largest value at its first position. -/
theorem blockEmbedding_single_label {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) (hm : BeginsWithMaximum (p i))
    (j : Fin (lengths i)) :
    (f.map ⟨i,j⟩).fst=(f.map (blockFirst hn)).fst := by
  let h := blockFirst hn
  by_cases hj : j.val=0
  · have he : j=h.snd := Fin.ext hj
    subst j
    rfl
  · have hpos : blockPositionLT h ⟨i,j⟩ := Or.inr ⟨rfl,Nat.pos_of_ne_zero hj⟩
    have hval : ¬blockValueLT p h ⟨i,j⟩ := by
      rintro (hbad|⟨_,hbad⟩)
      · exact lt_irrefl _ hbad
      · have hmax := hm h.snd rfl
        have hjlt := (p i j).isLt
        change (p i h.snd).val < (p i j).val at hbad
        omega
    rcases (f.position_iff _ _).mp hpos with hlt|⟨hs,_⟩
    · exact (hval ((f.value_iff _ _).mpr (Or.inl hlt))).elim
    · exact hs.symm

def blockEmbedding_anchor {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) : Fin t :=
  (f.map (blockFirst hn)).fst

def blockEmbedding_slots {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) (hm : BeginsWithMaximum (p i)) :
    Fin (lengths i) → Fin (widths (blockEmbedding_anchor f hn)) :=
  fun j => ⟨(f.map ⟨i,j⟩).snd.val,by
    have he := blockEmbedding_single_label f hn hm j
    change (f.map ⟨i,j⟩).fst=blockEmbedding_anchor f hn at he
    rw [← he]
    exact (f.map ⟨i,j⟩).snd.isLt⟩

theorem blockEmbedding_slots_mono {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) (hm : BeginsWithMaximum (p i)) :
    StrictMono (blockEmbedding_slots f hn hm) := by
  intro j k hjk
  have hpos : blockPositionLT (⟨i,j⟩ : BlockPosition lengths) ⟨i,k⟩ :=
    Or.inr ⟨rfl,hjk⟩
  rcases (f.position_iff _ _).mp hpos with h|⟨_,h⟩
  · rw [blockEmbedding_single_label f hn hm j,blockEmbedding_single_label f hn hm k] at h
    exact (lt_irrefl _ h).elim
  · exact h

theorem blockEmbedding_size_le {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) (hm : BeginsWithMaximum (p i)) :
    lengths i≤widths (blockEmbedding_anchor f hn) := by
  simpa only [Fintype.card_fin] using
    Fintype.card_le_of_injective _ (blockEmbedding_slots_mono f hn hm).injective

/-- A selected maximum-sized summand fills its assigned host block. -/
theorem blockEmbedding_slots_surj_of_eq {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i : Fin s} (hn : 0<lengths i) (hm : BeginsWithMaximum (p i))
    (he : lengths i=widths (blockEmbedding_anchor f hn)) :
    Function.Surjective (blockEmbedding_slots f hn hm) := by
  let e := Fin.castOrderIso he.symm
  have hi : Function.Injective (fun j => e (blockEmbedding_slots f hn hm j)) :=
    e.injective.comp (blockEmbedding_slots_mono f hn hm).injective
  intro y
  obtain ⟨j,hj⟩ := Finite.surjective_of_injective hi (e y)
  exact ⟨j,e.injective hj⟩

theorem blockPosition_ext {s : ℕ} {lengths : Fin s→ℕ}
    {p q : BlockPosition lengths} (hi : p.fst=q.fst) (hj : p.snd.val=q.snd.val) :
    p=q := by
  rcases p with ⟨a,p⟩
  rcases q with ⟨b,q⟩
  change a=b at hi
  subst b
  exact congrArg (Sigma.mk a) (Fin.ext hj)

theorem blockEmbedding_anchor_mono {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i j : Fin s} (hi : 0<lengths i) (hj : 0<lengths j) (hij : i < j) :
    blockEmbedding_anchor f hi≤blockEmbedding_anchor f hj := by
  have h : blockPositionLT (blockFirst hi) (blockFirst hj) := Or.inl hij
  exact ((f.position_iff _ _).mp h).elim le_of_lt (fun h => le_of_eq h.1)

theorem blockEmbedding_anchor_ne_of_full {s t : ℕ} {lengths : Fin s→ℕ} {widths : Fin t→ℕ}
    {p : BlockOrder lengths} {q : BlockOrder widths} (f : BlockEmbedding p q)
    {i j : Fin s} (hi : 0<lengths i) (hj : 0<lengths j)
    (hm : BeginsWithMaximum (p i))
    (he : lengths i=widths (blockEmbedding_anchor f hi)) (hij : i≠j) :
    blockEmbedding_anchor f hi≠blockEmbedding_anchor f hj := by
  intro h
  let y := f.map (blockFirst hj)
  let v : Fin (widths (blockEmbedding_anchor f hi)) :=
    ⟨y.snd.val,by rw [h]; exact y.snd.isLt⟩
  obtain ⟨z,hz⟩ := blockEmbedding_slots_surj_of_eq f hi hm he v
  have hfst : (f.map ⟨i,z⟩).fst=y.fst := (blockEmbedding_single_label f hi hm z).trans h
  have hsnd : (f.map ⟨i,z⟩).snd.val=y.snd.val :=
    congrArg (fun x : Fin (widths (blockEmbedding_anchor f hi)) => x.val) hz
  have hmap := f.injective (blockPosition_ext hfst hsnd)
  exact hij (congrArg Sigma.fst hmap)

end McNamaraSteingrimsson
