import Conjectures.FanTringaliProducts
import Conjectures.FanTringaliSlices

/-!
# Fan–Tringali's power-monoid length-set conjecture: factorization classification

For a height-one set with a Boolean bottom slice and unique box quotients,
its atomic factorization lengths are one plus the cardinalities of its maximal
box divisors. The graph module identifies those divisors with cliques.
-/

open scoped Pointwise

namespace FanTringali

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Maximality is among the box divisors supported on the bottom axes. -/
def MaximalBoxDivisor (U : Finset ι) (X : Finset (ι → ℕ)) (J : Finset ι) : Prop :=
  J ⊆ U ∧ (∃ Q, Q + box J = X) ∧
    ∀ K, J ⊆ K → K ⊆ U → (∃ Q, Q + box K = X) → K = J

/-- Removing a low box preserves the height-one structure and removes exactly
its axes from the bottom slice. -/
theorem layered_box_quotient {h : ι} {U J : Finset ι} {X Q : Finset (ι → ℕ)}
    (hX : Layered h U X) (hJ : J ⊆ U) (hQ : Q + box J = X) :
    Layered h (U \ J) Q := by
  have hQ₀ : 0 ∈ Q := by
    apply (zero_mem_of_zero_mem_add (A := Q) (B := box J) ?_).1
    rw [hQ]
    exact hX.zero_mem
  have hLow : ∀ x ∈ box J, x h = 0 := by
    intro x hx
    exact (mem_box.mp hx).2 h (fun hh => hX.height_notMem (hJ hh))
  obtain ⟨K, _, hK, hLayer⟩ := layered_factor_low hX (zero_mem_box J) hQ₀
    (by simpa only [add_comm (box J) Q] using hQ) hLow
  have hKJ : K = J := box_injective hK.symm
  simpa only [hKJ] using hLayer

theorem atomic_quotient_maximal {h : ι} {U J : Finset ι} {X Q : Finset (ι → ℕ)}
    (hX : Layered h U X) (hJ : J ⊆ U) (hQ : UniqueQuotient X (box J) Q)
    (hAtom : Atom Q) : MaximalBoxDivisor U X J := by
  refine ⟨hJ, ⟨Q, hQ.sum_eq⟩, ?_⟩
  intro K hJK hKU hDiv
  obtain ⟨R, hR⟩ := hDiv
  have hRLayer := layered_box_quotient hX hKU hR
  have hSum : R + box (K \ J) = Q := by
    apply hQ.unique
    rw [add_assoc, box_add (J := K \ J) (K := J) disjoint_sdiff_self_left,
      Finset.sdiff_union_of_subset hJK, hR]
  have hZero := hAtom.2.2 R (box (K \ J)) hRLayer.zero_mem (zero_mem_box _) hSum
  rcases hZero with hZero | hZero
  · exact False.elim (hRLayer.nonzero hZero)
  · apply Finset.Subset.antisymm
    · exact Finset.sdiff_eq_empty_iff_subset.mp (box_eq_zero.mp hZero)
    · exact hJK

theorem maximal_quotient_atomic {h : ι} {U J : Finset ι} {X Q : Finset (ι → ℕ)}
    (hX : Layered h U X) (hMax : MaximalBoxDivisor U X J)
    (hQ : Q + box J = X) : Atom Q := by
  have hQlayer := layered_box_quotient hX hMax.1 hQ
  refine ⟨hQlayer.zero_mem, hQlayer.nonzero, ?_⟩
  have hLowZero : ∀ {A B : Finset (ι → ℕ)}, 0 ∈ A → 0 ∈ B → A+B=Q →
      (∃ K, K ⊆ U \ J ∧ A=box K ∧ Layered h ((U \ J) \ K) B) → A=0 := by
    intro A B _ _ hAB hLow
    obtain ⟨K, hK, rfl, _⟩ := hLow
    have hJK : Disjoint J K := by
      apply Finset.disjoint_left.mpr
      intro i hiJ hiK
      exact (Finset.mem_sdiff.mp (hK hiK)).2 hiJ
    have hKU : K ⊆ U := fun _ hi => (Finset.mem_sdiff.mp (hK hi)).1
    have hDiv : B + box (J ∪ K) = X := by
      rw [← box_add hJK]
      calc
        B + (box J + box K) = (box K + B) + box J := by ac_rfl
        _ = X := by rw [hAB, hQ]
    have hUnion : J ∪ K = J := hMax.2.2 (J ∪ K) (Finset.subset_union_left)
      (Finset.union_subset hMax.1 hKU) ⟨B, hDiv⟩
    have hKempty : K = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro i hiK
      have hiJ : i ∈ J := by rw [← hUnion]; exact Finset.mem_union_right J hiK
      exact Finset.disjoint_left.mp hJK hiJ hiK
    rw [hKempty, box_empty]
  intro A B hA hB hAB
  rcases layered_factor hQlayer hA hB hAB with hLow | hLow
  · exact Or.inl (hLowZero hA hB hAB hLow)
  · exact Or.inr (hLowZero hB hA (by simpa only [add_comm B A] using hAB) hLow)

/-- Every Boolean box has an atomic factorization using its individual axes. -/
theorem box_has_factorization (J : Finset ι) :
    ∃ L : List (Finset (ι → ℕ)),
      (∀ A ∈ L, Atom A) ∧ L.sum = box J ∧ L.length = J.card := by
  induction J using Finset.induction_on with
  | empty => exact ⟨[], by simp, by simp, by simp⟩
  | @insert i J hi ih =>
    obtain ⟨L, hAtom, hSum, hLen⟩ := ih
    refine ⟨box {i} :: L, ?_, ?_, ?_⟩
    · intro A hA
      rcases List.mem_cons.mp hA with rfl | hA
      · exact atom_box_singleton i
      · exact hAtom A hA
    · rw [List.sum_cons, hSum, box_add]
      · simp
      · simpa using hi
    · simp only [List.length_cons, hLen, Finset.card_insert_of_notMem hi]

/-- An arbitrary atomic factorization has exactly one factor with positive
height. The remaining factors together form a box. -/
theorem layered_atomic_factorization {h : ι} {U : Finset ι} {X : Finset (ι → ℕ)}
    (hX : Layered h U X) (L : List (Finset (ι → ℕ)))
    (hAtom : ∀ A ∈ L, Atom A) (hSum : L.sum = X) :
    ∃ J Q, J ⊆ U ∧ Atom Q ∧ Q + box J = X ∧ L.length = J.card+1 := by
  induction L generalizing U X with
  | nil =>
    have hZero : X=0 := by simpa only [List.sum_nil] using hSum.symm
    exact False.elim (hX.nonzero hZero)
  | cons A L ih =>
    have hA : Atom A := hAtom A (List.mem_cons_self)
    have hL : ∀ B ∈ L, Atom B := fun B hB => hAtom B (List.mem_cons_of_mem _ hB)
    have hL₀ : 0 ∈ L.sum := zero_mem_list_sum (fun B hB => (hL B hB).1)
    have hAL : A + L.sum = X := by simpa only [List.sum_cons] using hSum
    rcases layered_factor hX hA.1 hL₀ hAL with hLow | hHigh
    · obtain ⟨K, hKU, hAK, hLayerL⟩ := hLow
      have hKAtom : Atom (box K) := hAK ▸ hA
      obtain ⟨i, rfl⟩ := atom_box_iff_singleton.mp hKAtom
      obtain ⟨J, Q, hJU, hQAtom, hQSum, hLen⟩ := ih hLayerL hL rfl
      have hiJ : i ∉ J := by
        intro hi
        have hh := (Finset.mem_sdiff.mp (hJU hi)).2
        exact hh (by simp)
      have hDisjoint : Disjoint ({i} : Finset ι) J := by simpa using hiJ
      refine ⟨insert i J, Q, ?_, hQAtom, ?_, ?_⟩
      · apply Finset.insert_subset_iff.mpr
        exact ⟨hKU (by simp), fun _ hx => (Finset.mem_sdiff.mp (hJU hx)).1⟩
      · have hBox : box (insert i J) = box {i} + box J := by
          rw [box_add hDisjoint]
          simp
        rw [hBox]
        calc
          Q + (box {i} + box J) = box {i} + (Q + box J) := by ac_rfl
          _ = X := by rw [hQSum, ← hAK, hAL]
      · simp only [List.length_cons, hLen, Finset.card_insert_of_notMem hiJ]
    · obtain ⟨J, hJU, hLJ, _⟩ := hHigh
      refine ⟨J, A, hJU, hA, ?_, ?_⟩
      · rw [← hLJ]
        exact hAL
      · rw [List.length_cons, atomic_factorization_box_length hL hLJ]

/-- Exact abstract classification, including both realization and exclusion of
all other factorization lengths. -/
theorem layered_lengths {h : ι} {U : Finset ι} {X : Finset (ι → ℕ)}
    (hX : Layered h U X)
    (hUnique : ∀ J, J ⊆ U → ∀ Q, Q + box J = X → UniqueQuotient X (box J) Q) :
    Lengths X = {n | ∃ J, MaximalBoxDivisor U X J ∧ n = J.card+1} := by
  ext n
  constructor
  · rintro ⟨L, hAtom, hSum, hLen⟩
    obtain ⟨J, Q, hJU, hQAtom, hQSum, hLJ⟩ := layered_atomic_factorization hX L hAtom hSum
    exact ⟨J, atomic_quotient_maximal hX hJU (hUnique J hJU Q hQSum) hQAtom,
      hLen.symm.trans hLJ⟩
  · rintro ⟨J, hMax, hn⟩
    obtain ⟨Q, hQ⟩ := hMax.2.1
    have hQAtom := maximal_quotient_atomic hX hMax hQ
    obtain ⟨L, hAtom, hSum, hLen⟩ := box_has_factorization J
    refine ⟨Q :: L, ?_, ?_, ?_⟩
    · intro A hA
      rcases List.mem_cons.mp hA with rfl | hA
      · exact hQAtom
      · exact hAtom A hA
    · rw [List.sum_cons, hSum, hQ]
    · rw [List.length_cons, hLen, hn]

end FanTringali
