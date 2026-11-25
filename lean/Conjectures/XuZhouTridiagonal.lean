module

public import Conjectures.XuZhouMarking
public import Conjectures.XuZhouLaplacianEnergy

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {n : ℕ}

def consecutive (i j : Fin n) : Prop := i.val+1=j.val ∨ j.val+1=i.val

theorem consecutive_comm (i j : Fin n) : consecutive i j ↔ consecutive j i := by
  unfold consecutive
  exact or_comm

theorem not_consecutive_self (i : Fin n) : ¬consecutive i i := by
  unfold consecutive
  omega

instance : DecidableRel (@consecutive n) := by unfold consecutive; infer_instance

theorem leftNeighbor_eq_some_iff {i j : Fin n} :
    leftNeighbor i = some j ↔ j.val+1=i.val := by
  refine ⟨fun h => ?_,leftNeighbor_of_succ⟩
  unfold leftNeighbor at h
  split at h
  · next hp =>
    have he := congrArg Fin.val (Option.some.inj h)
    change i.val-1=j.val at he
    omega
  · simp at h

theorem rightNeighbor_eq_some_iff {i j : Fin n} :
    rightNeighbor i = some j ↔ i.val+1=j.val := by
  refine ⟨fun h => ?_,rightNeighbor_of_succ⟩
  unfold rightNeighbor at h
  split at h
  · exact congrArg Fin.val (Option.some.inj h)
  · simp at h

theorem optionSet_mem_iff {α : Type*} (o : Option α) (a : α) :
    a ∈ optionSet o ↔ o = some a := by
  cases o <;> simp [optionSet,eq_comm]

def unmarkedPath (a : Fin n→ℕ) : SimpleGraph (Fin n) where
  Adj i j := i ∉ marked a ∧ j ∉ marked a ∧ consecutive i j
  symm.symm := by
    rintro i j ⟨hi,hj,hij⟩
    exact ⟨hj,hi,(consecutive_comm i j).mp hij⟩
  loopless.irrefl := by
    intro i h
    exact not_consecutive_self i h.2.2

instance (a : Fin n→ℕ) : DecidableRel (unmarkedPath a).Adj :=
  fun _ _ => inferInstanceAs (Decidable (_ ∧ _ ∧ _))

theorem unmarkedPath_neighbors (a : Fin n→ℕ) {i : Fin n} (hi : i ∉ marked a) :
    (unmarkedPath a).neighborFinset i =
      (optionSet (leftNeighbor i) \ marked a) ∪ (optionSet (rightNeighbor i) \ marked a) := by
  ext j
  rw [SimpleGraph.mem_neighborFinset]
  simp only [unmarkedPath,hi,Finset.mem_union,
    Finset.mem_sdiff,optionSet_mem_iff,leftNeighbor_eq_some_iff,rightNeighbor_eq_some_iff,consecutive]
  tauto

def leftCount (a : Fin n→ℕ) (i : Fin n) : ℕ :=
  ((optionSet (leftNeighbor i)) \ marked a).card

def rightCount (a : Fin n→ℕ) (i : Fin n) : ℕ :=
  ((optionSet (rightNeighbor i)) \ marked a).card

theorem unmarkedPath_degree_le (a : Fin n→ℕ) {i : Fin n} (hi : i ∉ marked a) :
    (unmarkedPath a).degree i ≤ leftCount a i+rightCount a i := by
  rw [SimpleGraph.degree,unmarkedPath_neighbors a hi]
  exact Finset.card_union_le _ _

theorem leftCount_eq_zero_of_large {a : Fin n→ℕ} {i : Fin n} (hi : 3 ≤ a i) :
    leftCount a i = 0 := by
  unfold leftCount
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro j hj
  obtain ⟨hm,hbad⟩ := Finset.mem_sdiff.mp hj
  have h := (leftNeighbor_eq_some_iff).mp ((optionSet_mem_iff _ _).mp hm)
  exact hbad (marked_left_of_large hi h)

theorem rightCount_eq_zero_of_large {a : Fin n→ℕ} {i : Fin n} (hi : 3 ≤ a i) :
    rightCount a i = 0 := by
  unfold rightCount
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro j hj
  obtain ⟨hm,hbad⟩ := Finset.mem_sdiff.mp hj
  have h := (rightNeighbor_eq_some_iff).mp ((optionSet_mem_iff _ _).mp hm)
  exact hbad (marked_right_of_large hi h)

private theorem singleton_diff_eq {α : Type*} [DecidableEq α] (j : α) (s : Finset α) :
    ({j} : Finset α) \ s = if j∈s then ∅ else {j} := by
  ext x
  by_cases hx : x=j
  · subst x
    by_cases h : j∈s <;> simp [h]
  · by_cases h : j∈s <;> simp [h,hx]

theorem leftSize_add_count_le_two {a : Fin n→ℕ} {i : Fin n} (hi : i ∉ marked a) :
    leftSize a i+leftCount a i ≤ 2 := by
  have hs := leftSize_le_two_of_unmarked hi
  rcases hh : leftNeighbor i with _ | j
  · simp [leftSize,leftCount,hh,optionSet]
  · by_cases hj : j ∈ marked a
    · simpa [leftSize,leftCount,hh,optionSet,hj,singleton_diff_eq] using hs
    · have hav : a j≤2 := by simpa [leftSize,hh] using hs
      have hn : a j≠2 := fun h => hj (marked_of_two h)
      have he : a j+1 ≤ 2 := by omega
      simpa [leftSize,leftCount,hh,optionSet,hj,singleton_diff_eq] using he

theorem rightSize_add_count_le_two {a : Fin n→ℕ} {i : Fin n} (hi : i ∉ marked a) :
    rightSize a i+rightCount a i ≤ 2 := by
  have hs := rightSize_le_two_of_unmarked hi
  rcases hh : rightNeighbor i with _ | j
  · simp [rightSize,rightCount,hh,optionSet]
  · by_cases hj : j ∈ marked a
    · simpa [rightSize,rightCount,hh,optionSet,hj,singleton_diff_eq] using hs
    · have hav : a j≤2 := by simpa [rightSize,hh] using hs
      have hn : a j≠2 := fun h => hj (marked_of_two h)
      have he : a j+1 ≤ 2 := by omega
      simpa [rightSize,rightCount,hh,optionSet,hj,singleton_diff_eq] using he

noncomputable def chainDiag (a : Fin n→ℕ) (i : Fin n) : ℝ :=
  ((leftSize a i:ℝ)+(rightSize a i:ℝ)-4) / (a i:ℝ)

noncomputable def chainTridiagonal (a : Fin n→ℕ) : Matrix (Fin n) (Fin n) ℝ :=
  fun i j => if i=j then chainDiag a i else if consecutive i j then 1 else 0

theorem chainTridiagonal_hermitian (a : Fin n→ℕ) :
    (chainTridiagonal a).IsHermitian := by
  rw [Matrix.IsHermitian,Matrix.conjTranspose_eq_transpose_of_trivial]
  ext i j
  by_cases h : i=j
  · subst j
    rfl
  · simp only [Matrix.transpose_apply,chainTridiagonal,h,Ne.symm h,ite_false,consecutive_comm j i]

end XuZhou
