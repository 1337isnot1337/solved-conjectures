module
public import Conjectures.CyrusianKaplanEncoding

@[expose] public section
namespace CyrusianKaplan

open Finset

/-- An additive submonoid of the natural numbers with its actual
finite set of positive gaps. The specification does not impose
any artificial upper bound on the gaps. -/
structure GappedSemigroup where
  carrier : AddSubmonoid ℕ
  gaps : Finset ℕ
  mem_gap : ∀ n : ℕ,n∈gaps ↔ 0<n ∧ n∉carrier

namespace GappedSemigroup

def genus (S : GappedSemigroup) : ℕ := S.gaps.card

noncomputable def lowMembers (S : GappedSemigroup) : Finset ℕ := by
  classical
  exact (Finset.Icc 1 S.genus).filter fun n=>n∈S.carrier

def highGaps (S : GappedSemigroup) : Finset ℕ :=
  S.gaps.filter fun n=>S.genus<n

theorem lowMembers_subset (S : GappedSemigroup) : S.lowMembers⊆Finset.Icc 1 S.genus := by
  classical
  exact Finset.filter_subset _ _

/-- The Frobenius bound, proved for every positive gap by reflecting
the semigroup members below it into the complementary finite set. -/
theorem gap_lt_twice_genus (S : GappedSemigroup) (z : ℕ) (hz : z∈S.gaps) :
    z<2*S.genus := by
  classical
  let T := Finset.range (z+1)
  let U := T.filter fun n=>n∈S.carrier
  let V := T.filter fun n=>n∉S.carrier
  have hx : z∉S.carrier := ((S.mem_gap z).mp hz).2
  have hRef : U.card≤V.card := by
    apply Finset.card_le_card_of_injOn (fun n=>z-n)
    · intro a ha
      have ⟨haT,haS⟩ : a∈T∧a∈S.carrier := Finset.mem_filter.mp ha
      have haZ : a≤z := Nat.lt_succ_iff.mp (Finset.mem_range.mp haT)
      change z-a∈V
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_range.mpr (by omega),?_⟩
      intro ha'
      have h := S.carrier.add_mem ha' haS
      rw [Nat.sub_add_cancel haZ] at h
      exact hx h
    · intro a ha b hb he
      have haZ : a≤z := Nat.lt_succ_iff.mp (Finset.mem_range.mp (Finset.mem_filter.mp ha).1)
      have hbZ : b≤z := Nat.lt_succ_iff.mp (Finset.mem_range.mp (Finset.mem_filter.mp hb).1)
      change z-a=z-b at he
      omega
  have hPart : U.card+V.card=z+1 := by
    simpa only [U,V,T,Finset.card_range] using
      (Finset.card_filter_add_card_filter_not (s:=T) (fun n=>n∈S.carrier))
  have hV : V.card≤S.genus := by
    apply Finset.card_le_card
    intro n hn
    refine (S.mem_gap n).mpr ⟨?_,(Finset.mem_filter.mp hn).2⟩
    by_contra! h
    exact (Finset.mem_filter.mp hn).2 (by simpa only [Nat.eq_zero_of_le_zero h] using S.carrier.zero_mem)
  omega

theorem highGaps_subset (S : GappedSemigroup) : S.highGaps⊆Finset.Ioo S.genus (2*S.genus) := by
  intro n hn
  have ⟨hGap,hHigh⟩ := Finset.mem_filter.mp hn
  exact Finset.mem_Ioo.mpr ⟨hHigh,S.gap_lt_twice_genus n hGap⟩

/-- There are exactly as many gaps above genus as positive
members at or below genus. -/
theorem card_highGaps_eq_card_lowMembers (S : GappedSemigroup) :
    S.highGaps.card=S.lowMembers.card := by
  classical
  let L := (Finset.Icc 1 S.genus).filter fun n=>n∉S.carrier
  have hLow : S.lowMembers.card+L.card=S.genus := by
    simpa [lowMembers,L,Nat.card_Icc] using
      (Finset.card_filter_add_card_filter_not (s:=Finset.Icc 1 S.genus) (fun n=>n∈S.carrier))
  have hFilter : S.gaps.filter (fun n=>¬S.genus<n)=L := by
    ext n
    simp only [L,Finset.mem_filter,S.mem_gap,not_lt,Finset.mem_Icc]
    exact ⟨fun ⟨⟨h₁,h₂⟩,h₃⟩=>⟨⟨h₁,h₃⟩,h₂⟩,fun ⟨⟨h₁,h₂⟩,h₃⟩=>⟨⟨h₁,h₃⟩,h₂⟩⟩
  have hHigh : S.highGaps.card+L.card=S.genus := by
    rw [← hFilter]
    exact Finset.card_filter_add_card_filter_not (s:=S.gaps) (fun n=>S.genus<n)
  omega

/-- The low/high encoding recovers actual membership, not a
surrogate statistic. -/
theorem mem_iff_encoded (S : GappedSemigroup) (n : ℕ) :
    n∈S.carrier ↔ EncodedMember S.genus S.highGaps S.lowMembers n := by
  classical
  by_cases hn : n=0
  · subst n
    exact iff_of_true S.carrier.zero_mem (encodedMember_zero _ _ _)
  · have hp : 0<n := Nat.pos_of_ne_zero hn
    have h1 : 1≤n := hp
    by_cases hl : n≤S.genus
    · simp [EncodedMember,lowMembers,hl,h1,hn,not_lt_of_ge hl]
    · have hH : S.genus<n := lt_of_not_ge hl
      simp [EncodedMember,highGaps,hl,hn,hH,S.mem_gap,hp]

theorem encodingTests (S : GappedSemigroup) : EncodingTests S.genus S.highGaps S.lowMembers := by
  apply (encodedMember_add_closed_iff S.genus S.highGaps S.lowMembers
    S.highGaps_subset S.lowMembers_subset).mp
  intro x y hx hy
  exact (S.mem_iff_encoded _).mp (S.carrier.add_mem
    ((S.mem_iff_encoded _).mpr hx) ((S.mem_iff_encoded _).mpr hy))

end GappedSemigroup

def decodeEncoding (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g)
    (hT : EncodingTests g A B) : GappedSemigroup where
  carrier := encodedSubmonoid g A B hA hB hT
  gaps := encodedGaps g A B
  mem_gap := mem_encodedGaps_iff g A B hA

theorem decodeEncoding_genus (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g)
    (hT : EncodingTests g A B) (hCard : A.card=B.card) :
    (decodeEncoding g A B hA hB hT).genus=g :=
  encodedGaps_card g A B hA hB hCard

/-- Every actual gapped additive submonoid is recovered by encoding
it and reconstructing the resulting carrier. -/
theorem encode_decode_carrier (S : GappedSemigroup) :
    (decodeEncoding S.genus S.highGaps S.lowMembers S.highGaps_subset
      S.lowMembers_subset S.encodingTests).carrier=S.carrier := by
  ext n
  exact (S.mem_iff_encoded n).symm

end CyrusianKaplan
