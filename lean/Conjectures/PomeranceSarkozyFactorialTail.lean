module
public import Conjectures.PomeranceSarkozyFiniteSieve
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

variable {A : Type*} [DecidableEq A]

abbrev MarkedSubset (P : Finset A) (a : ℕ) :=
  Σ T : ↥(P.powersetCard (a+1)),↥T.val

abbrev ExtendableSubset (P : Finset A) (a : ℕ) :=
  Σ S : ↥(P.powersetCard a),↥(P \ S.val)

/-- Marking one chosen element and removing it is exactly the same as
choosing a smaller subset and one new element. -/
def markEraseEquiv (P : Finset A) (a : ℕ) : MarkedSubset P a ≃ ExtendableSubset P a where
  toFun q := by
    obtain ⟨T,i⟩ := q
    have hT := Finset.mem_powersetCard.mp T.property
    let S : ↥(P.powersetCard a) := ⟨T.val.erase i.val,Finset.mem_powersetCard.mpr
      ⟨(Finset.erase_subset _ _).trans hT.1,by rw [Finset.card_erase_of_mem i.property,hT.2]; omega⟩⟩
    exact ⟨S,⟨i.val,Finset.mem_sdiff.mpr ⟨hT.1 i.property,Finset.notMem_erase _ _⟩⟩⟩
  invFun q := by
    obtain ⟨S,i⟩ := q
    have hS := Finset.mem_powersetCard.mp S.property
    have hi := Finset.mem_sdiff.mp i.property
    let T : ↥(P.powersetCard (a+1)) := ⟨insert i.val S.val,Finset.mem_powersetCard.mpr
      ⟨Finset.insert_subset_iff.mpr ⟨hi.1,hS.1⟩,by rw [Finset.card_insert_of_notMem hi.2,hS.2]⟩⟩
    exact ⟨T,⟨i.val,Finset.mem_insert_self _ _⟩⟩
  left_inv q := by
    rcases q with ⟨T,i⟩
    have h : insert i.val (T.val.erase i.val)=T.val := Finset.insert_erase i.property
    apply Sigma.ext (Subtype.ext h)
    apply (Subtype.heq_iff_coe_eq (by intro x; simp [h])).mpr
    rfl
  right_inv q := by
    rcases q with ⟨S,i⟩
    have h : (insert i.val S.val).erase i.val=S.val :=
      Finset.erase_insert (Finset.mem_sdiff.mp i.property).2
    apply Sigma.ext (Subtype.ext h)
    apply (Subtype.heq_iff_coe_eq (by intro x; simp [h])).mpr
    rfl

def weightedSubsets (P : Finset A) (w : A → ℚ) (a : ℕ) : ℚ :=
  ∑ T ∈ P.powersetCard a,∏ i ∈ T,w i

theorem weightedSubsets_step_identity (P : Finset A) (w : A → ℚ) (a : ℕ) :
    (a+1:ℕ)*weightedSubsets P w (a+1) =
      ∑ S ∈ P.powersetCard a,(∑ i ∈ P\S,w i)*(∏ i ∈ S,w i) := by
  have he := Fintype.sum_equiv (markEraseEquiv P a)
    (fun q : MarkedSubset P a => ∏ i ∈ q.1.val,w i)
    (fun q : ExtendableSubset P a => w q.2.val*(∏ i ∈ q.1.val,w i)) (by
      intro q
      rcases q with ⟨T,i⟩
      change (∏ j ∈ T.val,w j) = w i.val*(∏ j ∈ T.val.erase i.val,w j)
      rw [← Finset.prod_erase_mul _ _ i.property,mul_comm])
  simp only [Fintype.sum_sigma,Finset.sum_const,Finset.card_univ,Fintype.card_coe,nsmul_eq_mul] at he
  -- Convert the two outer subtype sums using their underlying finite sets.
  calc
    _ = ∑ T : ↥(P.powersetCard (a+1)), (T.val.card:ℚ)*(∏ i ∈ T.val,w i) := by
      unfold weightedSubsets
      rw [Finset.mul_sum,← Finset.sum_coe_sort (P.powersetCard (a+1))]
      apply Fintype.sum_congr
      intro T
      rw [(Finset.mem_powersetCard.mp T.property).2]
    _ = ∑ S : ↥(P.powersetCard a),∑ i : ↥(P\S.val),w i.val*(∏ j ∈ S.val,w j) := he
    _ = _ := by
      conv_rhs => rw [← Finset.sum_coe_sort (P.powersetCard a)]
      apply Fintype.sum_congr
      intro S
      rw [Finset.sum_mul,← Finset.sum_coe_sort (P \ S.val)]

/-- Elementary symmetric weights have the exact factorial bound used
in the prime-tail and truncated Bonferroni estimates. -/
theorem weightedSubsets_factorial_le (P : Finset A) (w : A → ℚ)
    (hw : ∀ i∈P,0≤w i) (a : ℕ) :
    (a.factorial:ℚ)*weightedSubsets P w a ≤ (∑ i ∈ P,w i)^a := by
  induction a with
  | zero => simp [weightedSubsets]
  | succ a ih =>
    have hstep : (a+1:ℕ)*weightedSubsets P w (a+1) ≤
        (∑ i∈P,w i)*weightedSubsets P w a := by
      rw [weightedSubsets_step_identity,weightedSubsets,Finset.mul_sum]
      apply Finset.sum_le_sum
      intro S hS
      have hp : 0≤∏ i∈S,w i :=
        Finset.prod_nonneg (fun i hi => hw i ((Finset.mem_powersetCard.mp hS).1 hi))
      apply mul_le_mul_of_nonneg_right _ hp
      exact Finset.sum_le_sum_of_subset_of_nonneg Finset.sdiff_subset
        (fun i hi _ => hw i hi)
    have hμ : 0≤∑ i∈P,w i := Finset.sum_nonneg hw
    rw [Nat.factorial_succ,Nat.cast_mul, mul_comm ((a+1:ℕ):ℚ),mul_assoc,pow_succ']
    calc
      _ ≤ (a.factorial:ℚ)*((∑ i∈P,w i)*weightedSubsets P w a) :=
        mul_le_mul_of_nonneg_left hstep (by positivity)
      _ = (∑ i∈P,w i)*((a.factorial:ℚ)*weightedSubsets P w a) := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_left ih hμ

end PomeranceSarkozy
