module
public import Conjectures.CyrusianKaplanGapCorrespondence
public import Mathlib.Data.Finset.Max

@[expose] public section
namespace CyrusianKaplan

open Finset

namespace GappedSemigroup

private theorem max_gap_of_high (S : GappedSemigroup) {F : ℕ} (hF : F∈S.highGaps)
    (hBig : ∀ n∈S.highGaps,n≤F) :
    ∀ n∈S.gaps,n≤F := by
  intro n hn
  by_cases h : S.genus<n
  · exact hBig n (Finset.mem_filter.mpr ⟨hn,h⟩)
  · exact (le_of_not_gt h).trans (Finset.mem_filter.mp hF).2.le

private theorem min_positive_of_low (S : GappedSemigroup) {m : ℕ} (hm : m∈S.lowMembers)
    (hSmall : ∀ n∈S.lowMembers,m≤n) :
    ∀ n,0<n→n∈S.carrier→m≤n := by
  classical
  intro n hn hS
  by_cases h : n≤S.genus
  · apply hSmall
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_Icc.mpr ⟨hn,h⟩,hS⟩
  · exact ((Finset.mem_Icc.mp (S.lowMembers_subset hm)).2).trans (le_of_not_ge h)

private theorem erase_encoding_member_iff (S : GappedSemigroup) {m F : ℕ}
    (hm : m∈S.lowMembers) (hF : F∈S.highGaps) (n : ℕ) :
    EncodedMember S.genus (S.highGaps.erase F) (S.lowMembers.erase m) n ↔
      (n∈S.carrier ∨ n=F) ∧ n≠m := by
  classical
  have hm0 := (Finset.mem_Icc.mp (S.lowMembers_subset hm)).1
  have hmG := (Finset.mem_Icc.mp (S.lowMembers_subset hm)).2
  have hFG := (Finset.mem_filter.mp hF).2
  rw [S.mem_iff_encoded n]
  by_cases hn : n=0
  · subst n
    simp [EncodedMember,show 0≠m by omega]
  · by_cases hG : n≤S.genus
    · have hne : n≠F := by omega
      simp only [EncodedMember,hn,hG,not_lt_of_ge hG,Finset.mem_erase,hne,false_or,
        true_and,false_and,or_false]
      exact and_comm
    · have hG' : S.genus<n := by omega
      have hne : n≠m := by omega
      by_cases hnF : n=F
      · subst n
        exact iff_of_true (Or.inr (Or.inr ⟨hFG,fun h=>(Finset.mem_erase.mp h).1 rfl⟩))
          ⟨Or.inr rfl,by omega⟩
      · simp [EncodedMember,hn,hG,hG',hne,hnF]

/-- The literal ordinarization step deletes the smallest positive
semigroup member and inserts the largest gap. Its genus is preserved
and the positive low-member count decreases by exactly one. -/
theorem exists_ordinarization_step (S : GappedSemigroup) (hN : S.lowMembers.Nonempty) :
    ∃ T : GappedSemigroup, ∃ m F : ℕ,
      0<m ∧ m∈S.carrier ∧ (∀ n,0<n→n∈S.carrier→m≤n) ∧
      F∈S.gaps ∧ (∀ n∈S.gaps,n≤F) ∧
      T.genus=S.genus ∧ T.lowMembers.card+1=S.lowMembers.card ∧
      (∀ n : ℕ,n∈T.carrier↔(n∈S.carrier∨n=F)∧n≠m) := by
  classical
  have hA : S.highGaps.Nonempty := by
    apply Finset.card_pos.mp
    rw [S.card_highGaps_eq_card_lowMembers]
    exact Finset.card_pos.mpr hN
  let m := S.lowMembers.min' hN
  let F := S.highGaps.max' hA
  have hm : m∈S.lowMembers := Finset.min'_mem _ _
  have hF : F∈S.highGaps := Finset.max'_mem _ _
  have hml := (Finset.mem_Icc.mp (S.lowMembers_subset hm)).1
  have hmS : m∈S.carrier := (Finset.mem_filter.mp hm).2
  have hmin : ∀ n,0<n→n∈S.carrier→m≤n :=
    S.min_positive_of_low hm (fun n h=>Finset.min'_le _ _ h)
  have hmax : ∀ n∈S.gaps,n≤F :=
    S.max_gap_of_high hF (fun n h=>Finset.le_max' _ _ h)
  have hmF : m<F := ((Finset.mem_Icc.mp (S.lowMembers_subset hm)).2).trans_lt
    (Finset.mem_filter.mp hF).2
  let A := S.highGaps.erase F
  let B := S.lowMembers.erase m
  have hAS : A⊆Finset.Ioo S.genus (2*S.genus) :=
    (Finset.erase_subset _ _).trans S.highGaps_subset
  have hBS : B⊆Finset.Icc 1 S.genus :=
    (Finset.erase_subset _ _).trans S.lowMembers_subset
  have he (n : ℕ) : EncodedMember S.genus A B n↔(n∈S.carrier∨n=F)∧n≠m :=
    S.erase_encoding_member_iff hm hF n
  have hi : (∀ x y,EncodedMember S.genus A B x→EncodedMember S.genus A B y→
      EncodedMember S.genus A B (x+y)) := by
    intro x y hx hy
    by_cases hx0 : x=0
    · simpa only [hx0,zero_add] using hy
    by_cases hy0 : y=0
    · simpa only [hy0,add_zero] using hx
    obtain ⟨hx,_⟩ := (he x).mp hx
    obtain ⟨hy,_⟩ := (he y).mp hy
    have hxpos : 0<x := Nat.pos_of_ne_zero hx0
    have hypos : 0<y := Nat.pos_of_ne_zero hy0
    have hTop (u : ℕ) (hu : F<u) : u∈S.carrier := by
      by_contra h
      have hz := hmax u ((S.mem_gap u).mpr ⟨by omega,h⟩)
      omega
    apply (he (x+y)).mpr
    rcases hx with hxS|hxF
    · rcases hy with hyS|hyF
      · exact ⟨Or.inl (S.carrier.add_mem hxS hyS),by
          have h := hmin x hxpos hxS
          omega⟩
      · exact ⟨Or.inl (hTop _ (by omega)),by omega⟩
    · exact ⟨Or.inl (hTop _ (by omega)),by omega⟩
  have hT := (encodedMember_add_closed_iff S.genus A B hAS hBS).mp hi
  let T := decodeEncoding S.genus A B hAS hBS hT
  have hC : A.card=B.card := by
    unfold A B
    rw [Finset.card_erase_of_mem hF,Finset.card_erase_of_mem hm,S.card_highGaps_eq_card_lowMembers]
  have hG : T.genus=S.genus := decodeEncoding_genus _ _ _ _ _ _ hC
  have hB : T.lowMembers=B := by
    ext n
    change n∈(Finset.Icc 1 T.genus).filter (fun a=>EncodedMember S.genus A B a)↔n∈B
    rw [hG]
    constructor
    · intro hn
      obtain ⟨hInt,hMem⟩ := Finset.mem_filter.mp hn
      have hBox := Finset.mem_Icc.mp hInt
      rcases hMem with hz|⟨_,h⟩|⟨hg,_⟩
      · omega
      · exact h
      · omega
    · intro hn
      exact Finset.mem_filter.mpr ⟨hBS hn,encodedMember_of_low_mem hBS hn⟩
  refine ⟨T,m,F,by omega,hmS,hmin,(Finset.mem_filter.mp hF).1,hmax,hG,?_,he⟩
  rw [hB]
  unfold B
  rw [Finset.card_erase_of_mem hm]
  have hCard := Finset.card_pos.mpr hN
  omega

end GappedSemigroup
end CyrusianKaplan
