import Conjectures.FanTringaliGraph
import Conjectures.FanTringaliFactorizations

/-!
# Fan–Tringali's power-monoid length-set conjecture: maximal cliques

The graph set has precisely the factorization lengths `|J| + 1`, where `J`
ranges over maximal cliques. This is the full graph-to-length-set theorem in
arbitrary finite dimension; the radix and general-monoid transfers are separate.
-/

open scoped Pointwise

namespace FanTringali

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Inclusion-maximal cliques of a finite graph. -/
def MaximalCompatible (C : Constraints ι) (J : Finset ι) : Prop :=
  Compatible C J ∧ ∀ K, J ⊆ K → Compatible C K → K = J

theorem graph_maximal_iff (C : Constraints ι) (J : Finset ι) :
    MaximalBoxDivisor (markedAxes Finset.univ) (graphSet C) (markedAxes J) ↔
      MaximalCompatible C J := by
  constructor
  · intro hMax
    refine ⟨(graph_box_divisor_iff C J).mp hMax.2.1, ?_⟩
    intro K hJK hK
    apply markedAxes_injective
    apply hMax.2.2 (markedAxes K) (markedAxes_subset_iff.mpr hJK)
      (markedAxes_subset_iff.mpr (Finset.subset_univ _))
    exact (graph_box_divisor_iff C K).mpr hK
  · intro hMax
    refine ⟨markedAxes_subset_iff.mpr (Finset.subset_univ _),
      (graph_box_divisor_iff C J).mpr hMax.1, ?_⟩
    intro K hJK hKU hDiv
    obtain ⟨L, _, hLK⟩ := subset_markedAxes hKU
    have hJL : J ⊆ L := markedAxes_subset_iff.mp (by rw [hLK]; exact hJK)
    have hL : Compatible C L := (graph_box_divisor_iff C L).mp (by rw [hLK]; exact hDiv)
    rw [← hLK, hMax.2 L hJL hL]

/-- Exact factorization-length theorem for every finite graph, including graphs
with no nonedges and graphs of arbitrary finite dimension. -/
theorem graph_lengths (C : Constraints ι) :
    Lengths (graphSet C) = {n | ∃ J, MaximalCompatible C J ∧ n=J.card+1} := by
  have hUnique : ∀ K, K ⊆ markedAxes (Finset.univ : Finset ι) →
      ∀ Q, Q + box K = graphSet C → UniqueQuotient (graphSet C) (box K) Q := by
    intro K hKU Q hQ
    obtain ⟨J, _, hJK⟩ := subset_markedAxes hKU
    subst K
    obtain ⟨R, hR⟩ := graph_uniqueQuotient (graph_compatible_of_quotient hQ)
    have hQR := hR.unique Q hQ
    rw [hQR]
    exact hR
  rw [layered_lengths (graphSet_layered C) hUnique]
  ext n
  constructor
  · rintro ⟨K, hMax, hn⟩
    obtain ⟨J, _, hJK⟩ := subset_markedAxes hMax.1
    subst K
    exact ⟨J, (graph_maximal_iff C J).mp hMax, by simpa only [markedAxes_card] using hn⟩
  · rintro ⟨J, hMax, hn⟩
    exact ⟨markedAxes J, (graph_maximal_iff C J).mpr hMax,
      by simpa only [markedAxes_card] using hn⟩

end FanTringali
