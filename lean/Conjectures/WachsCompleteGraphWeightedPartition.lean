module

public import Conjectures.WachsCompleteGraphHomogeneous
public import Mathlib.Order.Partition.Finpartition

@[expose] public section
namespace WachsCompleteGraph

/-- The unweighted blocks of a partition of the complete graph on n vertices. -/
abbrev CompletePartition (n : ℕ) := Finpartition (Finset.univ : Finset (Fin n))

/-- The weights on a block are a weak r-composition of its size minus one.
Storing zero off the block set makes the finite representation canonical. -/
@[ext] structure WeightedCompletePartition (r n : ℕ) where
  partition : CompletePartition n
  weights : Finset (Fin n) → Fin r → Fin (n+1)
  valid : ∀ b∈partition.parts, (∑ i : Fin r, (weights b i).val)=b.card-1
  offBlocks : ∀ b∉partition.parts, ∀ i, weights b i=0
  deriving DecidableEq

noncomputable instance (r n : ℕ) : Fintype (WeightedCompletePartition r n) := by
  classical
  let T := {p : CompletePartition n × (Finset (Fin n) → Fin r → Fin (n+1)) //
    (∀ b∈p.1.parts, (∑ i : Fin r,(p.2 b i).val)=b.card-1) ∧
    ∀ b∉p.1.parts, ∀ i, p.2 b i=0}
  exact Fintype.ofSurjective (fun p : T => ⟨p.val.1,p.val.2,p.property.1,p.property.2⟩)
    (fun q => ⟨⟨⟨q.partition,q.weights⟩,q.valid,q.offBlocks⟩,rfl⟩)

namespace WeightedCompletePartition

def blockWeight {r n : ℕ} (P : WeightedCompletePartition r n)
    (B : Finset (Fin n)) (i : Fin r) : ℕ :=
  ∑ b ∈ P.partition.parts, if b⊆B then (P.weights b i).val else 0

/-- The literal complete-graph weighted refinement: all merged blocks
are connected, so only the ordinary refinement and coordinatewise
lower weight bounds are needed. -/
def Refines {r n : ℕ} (P Q : WeightedCompletePartition r n) : Prop :=
  P.partition≤Q.partition ∧
  ∀ B∈Q.partition.parts,∀ i : Fin r, P.blockWeight B i≤(Q.weights B i).val

def rank {r n : ℕ} (P : WeightedCompletePartition r n) : ℕ :=
  n-P.partition.parts.card

theorem no_distinct_subblocks {r n : ℕ} (P : WeightedCompletePartition r n)
    {b B : Finset (Fin n)} (hb : b∈P.partition.parts) (hB : B∈P.partition.parts) (h : b⊆B) :
    b=B :=
  P.partition.disjoint.eq_of_le hb hB (P.partition.ne_bot hb) h

theorem blockWeight_self {r n : ℕ} (P : WeightedCompletePartition r n)
    {B : Finset (Fin n)} (hB : B∈P.partition.parts) (i : Fin r) :
    P.blockWeight B i=(P.weights B i).val := by
  unfold blockWeight
  rw [Finset.sum_eq_single B]
  · simp
  · intro b hb hne
    have hn : ¬b⊆B := fun h => hne (no_distinct_subblocks P hb hB h)
    simp [hn]
  · exact fun h => (h hB).elim

theorem refines_refl {r n : ℕ} (P : WeightedCompletePartition r n) :
    Refines P P := by
  refine ⟨le_rfl,?_⟩
  intro B hB i
  rw [blockWeight_self P hB]

theorem refines_rank_mono {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : Refines P Q) : P.rank≤Q.rank := by
  unfold rank
  have hcard := Finpartition.card_mono h.1
  omega

theorem equal_weights_of_refines_same_blocks {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : Refines P Q) (hp : P.partition=Q.partition) : P=Q := by
  apply WeightedCompletePartition.ext hp
  funext B i
  by_cases hB : B∈P.partition.parts
  · have hBQ : B∈Q.partition.parts := hp ▸ hB
    have hle (j : Fin r) : (P.weights B j).val≤(Q.weights B j).val := by
      have hr := h.2 B hBQ j
      rwa [blockWeight_self P hB] at hr
    apply Fin.ext
    by_contra hne
    have hh : (P.weights B i).val < (Q.weights B i).val :=
      (hle i).lt_of_ne hne
    have hlt : (∑ j : Fin r,(P.weights B j).val)<∑ j : Fin r,(Q.weights B j).val :=
      Finset.sum_lt_sum (fun j _ => hle j) ⟨i,Finset.mem_univ _,hh⟩
    rw [P.valid B hB,Q.valid B hBQ] at hlt
    omega
  · have hBQ : B∉Q.partition.parts := hp ▸ hB
    rw [P.offBlocks B hB,Q.offBlocks B hBQ]

end WeightedCompletePartition
end WachsCompleteGraph
