module
public import Conjectures.WachsCompleteGraphDistinguishedBlock
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace WachsCompleteGraph

variable {α R : Type*} [DecidableEq α] [CommSemiring R]

noncomputable def partitionWeightSum (w : ℕ → R) (S : Finset α) (k : ℕ) : R :=
  ∑ P : Finpartition S with P.parts.card = k, ∏ b ∈ P.parts, w b.card

theorem part_not_in_complement {S : Finset α} {a : α} (B : ContainingSubsets S a)
    (P : Finpartition (S \ B.val)) : B.val ∉ P.parts := by
  intro hm
  exact (Finset.mem_sdiff.mp (P.le hm B.property.2)).2 B.property.2

/-- Exact marked-vertex recurrence for the weighted sums over actual
set partitions with a fixed number of blocks. -/
theorem partitionWeightSum_marked (w : ℕ → R) {S : Finset α} {a : α} (ha : a ∈ S) (k : ℕ) :
    partitionWeightSum w S (k+1) =
      ∑ B : ContainingSubsets S a, w B.val.card * partitionWeightSum w (S \ B.val) k := by
  classical
  let e := distinguishedBlockEquiv ha
  let f (P : Finpartition S) : R := if P.parts.card = k+1 then ∏ b ∈ P.parts,w b.card else 0
  have h : (∑ P : Finpartition S, f P) =
      ∑ d : (Σ B : ContainingSubsets S a, Finpartition (S \ B.val)),
        w d.1.val.card * (if d.2.parts.card = k then ∏ b ∈ d.2.parts,w b.card else 0) := by
    symm
    apply Fintype.sum_equiv e.symm
    intro d
    obtain ⟨B,P⟩ := d
    change w B.val.card * (if P.parts.card = k then ∏ b ∈ P.parts,w b.card else 0) =
      f (addPart B.property.1 (Finset.nonempty_iff_ne_empty.mp ⟨a,B.property.2⟩) P)
    unfold f
    rw [addPart_parts,Finset.card_insert_of_notMem (part_not_in_complement B P),
      Finset.prod_insert (part_not_in_complement B P)]
    by_cases hP : P.parts.card = k <;> simp [hP]
  rw [partitionWeightSum,Finset.sum_filter]
  change (∑ P : Finpartition S,f P) = _
  rw [h,Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro B _
  rw [partitionWeightSum,Finset.sum_filter,Finset.mul_sum]

end WachsCompleteGraph
