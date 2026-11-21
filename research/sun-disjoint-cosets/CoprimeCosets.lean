import Mathlib.Algebra.GCDMonoid.Nat
import Mathlib.GroupTheory.Index
import Mathlib.RingTheory.Coprime.Lemmas
import Mathlib.Data.Nat.GCD.Basic

namespace SunDisjointCosets

/-- For finite-index subgroups of pairwise coprime indices, every choice of
left cosets has a common representative, without any normality assumption. -/
theorem simultaneous_representative {G ι : Type*} [Group G] [Fintype ι]
    (H : ι → Subgroup G) [∀ i, (H i).FiniteIndex]
    (h : Pairwise fun i j => (H i).index.Coprime (H j).index)
    (v : (i : ι) → G ⧸ H i) :
    ∃ x : G, ∀ i, QuotientGroup.mk x = v i := by
  classical
  let K := ⨅ i, H i
  let : K.FiniteIndex := Subgroup.finiteIndex_iInf fun i => inferInstance
  have div : (∏ i, (H i).index) ∣ K.index :=
    Fintype.prod_dvd_of_isRelPrime
      (fun i j hij => Nat.coprime_iff_isRelPrime.mp (h hij))
      (fun i => Subgroup.index_dvd_of_le (iInf_le H i))
  have bound : Nat.card ((i : ι) → G ⧸ H i) ≤ Nat.card (G ⧸ K) := by
    rw [Nat.card_pi]
    exact Nat.le_of_dvd (Nat.pos_of_ne_zero Subgroup.FiniteIndex.index_ne_zero) div
  obtain ⟨q, hq⟩ := ((Subgroup.quotientiInfEmbedding H).injective.bijective_of_nat_card_le bound).2 v
  obtain ⟨x, rfl⟩ := Quotient.exists_rep q
  exact ⟨x, fun i => congrFun hq i⟩

end SunDisjointCosets
