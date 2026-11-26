module
public import Conjectures.CyrusianKaplanOrdinarizationStep
import Mathlib.Tactic.Tauto

@[expose] public section
namespace CyrusianKaplan

open Finset

def GappedSemigroup.IsOrdinary (S : GappedSemigroup) : Prop :=
  ∀ n : ℕ,n∈S.carrier ↔ n=0 ∨ S.genus<n

theorem GappedSemigroup.ordinary_iff_lowMembers_card_zero (S : GappedSemigroup) :
    S.IsOrdinary ↔ S.lowMembers.card=0 := by
  classical
  constructor
  · intro h
    apply Finset.card_eq_zero.mpr
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro n hn
    have hIn := Finset.mem_Icc.mp (S.lowMembers_subset hn)
    rcases (h n).mp (Finset.mem_filter.mp hn).2 with h0|hG <;> omega
  · intro h
    have hB := Finset.card_eq_zero.mp h
    have hA : S.highGaps=∅ := Finset.card_eq_zero.mp
      (S.card_highGaps_eq_card_lowMembers.trans h)
    intro n
    rw [S.mem_iff_encoded n,hA,hB]
    simp [EncodedMember]

/-- A literal step in the ordinarization tree, using only the
extremal member and gap and the changed carrier. Genus preservation
and the member-count change are conclusions, not fields. -/
structure OrdinarizationStep (S T : GappedSemigroup) : Prop where
  nonordinary : S.lowMembers.Nonempty
  transform : ∃ m F : ℕ,0<m ∧ m∈S.carrier ∧
    (∀ n,0<n→n∈S.carrier→m≤n) ∧
    F∈S.gaps ∧ (∀ n∈S.gaps,n≤F) ∧
    (∀ n : ℕ,n∈T.carrier↔(n∈S.carrier∨n=F)∧n≠m)

theorem OrdinarizationStep.genus_and_count {S T : GappedSemigroup}
    (h : OrdinarizationStep S T) :
    T.genus=S.genus ∧ T.lowMembers.card+1=S.lowMembers.card := by
  classical
  obtain ⟨m,F,hm,hmS,hMin,hF,hMax,hMem⟩ := h.transform
  have hgap : T.gaps=insert m (S.gaps.erase F) := by
    ext n
    rw [T.mem_gap,hMem,Finset.mem_insert,Finset.mem_erase,S.mem_gap]
    by_cases hnm : n=m
    · subst n
      simp [hm]
    · by_cases hnF : n=F
      · subst n
        have hmF : F≠m := hnm
        simp [hmF]
      · simp [hnm,hnF]
  have hmG : m∉S.gaps.erase F := by
    intro h'
    exact ((S.mem_gap _).mp (Finset.mem_erase.mp h').2).2 hmS
  have hG : T.genus=S.genus := by
    unfold GappedSemigroup.genus
    rw [hgap,Finset.card_insert_of_notMem hmG,Finset.card_erase_of_mem hF]
    have hP := Finset.card_pos.mpr ⟨F,hF⟩
    omega
  have hf : S.genus<F := by
    have hP : S.highGaps.Nonempty := by
      apply Finset.card_pos.mp
      rw [S.card_highGaps_eq_card_lowMembers]
      exact Finset.card_pos.mpr h.nonordinary
    obtain ⟨g,hg⟩ := hP
    exact (Finset.mem_filter.mp hg).2.trans_le (hMax g (Finset.mem_filter.mp hg).1)
  have hm' : m∈S.lowMembers := by
    obtain ⟨j,hj⟩ := h.nonordinary
    have hi := Finset.mem_Icc.mp (S.lowMembers_subset hj)
    have hjS := (Finset.mem_filter.mp hj).2
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_Icc.mpr ⟨hm,(hMin j hi.1 hjS).trans hi.2⟩,hmS⟩
  have he : T.lowMembers=S.lowMembers.erase m := by
    ext n
    simp only [GappedSemigroup.lowMembers,Finset.mem_filter,Finset.mem_erase,Finset.mem_Icc,hG,hMem]
    by_cases hn : n≤S.genus
    · have hN : n≠F := by omega
      simp only [hN,hn,and_true]
      tauto
    · simp [hn]
  refine ⟨hG,?_⟩
  rw [he,Finset.card_erase_of_mem hm']
  have hP := Finset.card_pos.mpr h.nonordinary
  omega

inductive OrdinarizationPath : GappedSemigroup → ℕ → GappedSemigroup → Prop
  | nil (S : GappedSemigroup) : OrdinarizationPath S 0 S
  | cons {S T U : GappedSemigroup} {k : ℕ} :
      OrdinarizationStep S T → OrdinarizationPath T k U →
        OrdinarizationPath S (k+1) U

theorem OrdinarizationPath.length_eq_count_difference {S T : GappedSemigroup} {k : ℕ}
    (h : OrdinarizationPath S k T) : S.lowMembers.card=T.lowMembers.card+k := by
  induction h with
  | nil S => simp
  | cons hStep _ ih =>
      have hD := hStep.genus_and_count.2
      omega

/-- Any ordinarization path to the ordinary semigroup has exactly
as many steps as the initial number of positive low members. -/
theorem ordinary_path_length_eq_lowMembers {S T : GappedSemigroup} {k : ℕ}
    (h : OrdinarizationPath S k T) (hT : T.IsOrdinary) : k=S.lowMembers.card := by
  have hCount := h.length_eq_count_difference
  rw [(T.ordinary_iff_lowMembers_card_zero).mp hT,zero_add] at hCount
  exact hCount.symm

/-- A path of the specified length exists for every numerical
semigroup; hence the model's encoded index is the literal tree
distance, including the ordinary case. -/
theorem exists_path_to_ordinary (S : GappedSemigroup) :
    ∃ T : GappedSemigroup,T.IsOrdinary∧OrdinarizationPath S S.lowMembers.card T := by
  generalize hK : S.lowMembers.card=k
  induction k using Nat.strong_induction_on generalizing S with
  | h k ih =>
      by_cases hz : k=0
      · refine ⟨S,(S.ordinary_iff_lowMembers_card_zero).mpr (hK.trans hz),?_⟩
        rw [hz]
        exact OrdinarizationPath.nil S
      · have hN : S.lowMembers.Nonempty := Finset.card_pos.mp (by omega)
        obtain ⟨U,m,F,hm,hmS,hMin,hF,hMax,_,hDec,hMem⟩ := S.exists_ordinarization_step hN
        have hStep : OrdinarizationStep S U := ⟨hN,m,F,hm,hmS,hMin,hF,hMax,hMem⟩
        obtain ⟨T,hOrd,hPath⟩ := ih U.lowMembers.card (by omega) U rfl
        refine ⟨T,hOrd,?_⟩
        have he : U.lowMembers.card+1=k := hDec.trans hK
        rw [← he]
        exact OrdinarizationPath.cons hStep hPath

end CyrusianKaplan
