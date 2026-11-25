module
public import Conjectures.WachsCompleteGraphMarkedCount
public import Conjectures.WachsCompleteGraphPartitionSupport

@[expose] public section
namespace WachsCompleteGraph

variable {R : Type*} [CommSemiring R]

/-- All sizes of the marked block are collected with their exact
binomial multiplicities. -/
theorem canonicalPartitionWeightSum_succ (w : ℕ → R) (n k : ℕ) :
    canonicalPartitionWeightSum w (n+1) (k+1) =
      ∑ j ∈ Finset.range (n+1), (n.choose j : R) * w (j+1) *
        canonicalPartitionWeightSum w (n-j) k := by
  classical
  let S : Finset (Fin (n+1)) := Finset.univ
  let a : Fin (n+1) := 0
  have ha : a ∈ S := Finset.mem_univ _
  have hS : S.card = n+1 := by simp [S]
  rw [canonicalPartitionWeightSum,partitionWeightSum_marked w ha]
  have hc (B : ContainingSubsets S a) : (S \ B.val).card = S.card - B.val.card :=
    Finset.card_sdiff_of_subset B.property.1
  simp_rw [partitionWeightSum_of_card w,hc]
  let f (B : ContainingSubsets S a) := B.val.card - 1
  have hf (B : ContainingSubsets S a) : f B + 1 = B.val.card :=
    Nat.sub_add_cancel (Finset.card_pos.mpr ⟨a,B.property.2⟩)
  have hm (B : ContainingSubsets S a) : f B ∈ Finset.range (n+1) := by
    apply Finset.mem_range.mpr
    have h := Finset.card_le_card B.property.1
    have hb := hf B
    omega
  let g (j : ℕ) := w (j+1) * canonicalPartitionWeightSum w (n-j) k
  have he (B : ContainingSubsets S a) :
      w B.val.card * canonicalPartitionWeightSum w (S.card-B.val.card) k = g (f B) := by
    unfold g
    rw [hf B,hS]
    congr 2
    have hb := hf B
    omega
  simp_rw [he]
  rw [← Finset.sum_fiberwise_of_maps_to' (s:=Finset.univ) (t:=Finset.range (n+1))
    (fun B _ => hm B) g]
  apply Finset.sum_congr rfl
  intro j _
  have hcard : (Finset.univ.filter fun B : ContainingSubsets S a => f B = j).card = n.choose j := by
    have h' : (Finset.univ.filter fun B : ContainingSubsets S a => f B = j) =
        Finset.univ.filter (fun B : ContainingSubsets S a => B.val.card = j+1) := by
      ext B
      simp only [Finset.mem_filter,Finset.mem_univ,true_and]
      have hh := hf B
      omega
    rw [h',← Fintype.card_subtype,marked_size_card ha,hS]
    rfl
  have hfilter : (∑ B : ContainingSubsets S a with f B = j,g j) = (n.choose j:R) * g j := by
    rw [Finset.sum_const,hcard,nsmul_eq_mul]
  rw [hfilter]
  exact (mul_assoc _ _ _).symm

end WachsCompleteGraph
