import Mathlib.Order.Preorder.Finite
import Mathlib.Order.Preorder.Chain
import Mathlib.Data.Finset.Powerset
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic

/-! The dual Stanley transfer and the reversal-invariant chain statistic. -/

namespace AthanasiadisChapotonPolar

open Finset

section Max

variable {R ι : Type*} [LinearOrder R] [Zero R]

/-- A finite maximum with zero included, also defined for the empty family. -/
noncomputable def maxZero (s : Finset ι) (f : ι → R) : R := by
  classical
  exact (insert 0 (s.image f)).max' (by simp)

theorem maxZero_le_iff {s : Finset ι} {f : ι → R} {a : R} :
    maxZero s f ≤ a ↔ 0 ≤ a ∧ ∀ i ∈ s, f i ≤ a := by
  classical
  simp [maxZero, max'_le_iff, or_imp, forall_and]

theorem zero_le_maxZero (s : Finset ι) (f : ι → R) : 0 ≤ maxZero s f :=
  (maxZero_le_iff.mp le_rfl).1

theorem le_maxZero {s : Finset ι} (f : ι → R) {i : ι} (hi : i ∈ s) : f i ≤ maxZero s f :=
  (maxZero_le_iff.mp le_rfl).2 i hi

theorem maxZero_eq_zero_or_attained (s : Finset ι) (f : ι → R) :
    maxZero s f = 0 ∨ ∃ i ∈ s, f i = maxZero s f := by
  classical
  have h := max'_mem (insert (0 : R) (s.image f)) (by simp)
  change maxZero s f ∈ insert 0 (s.image f) at h
  simpa only [mem_insert, mem_image] using h

theorem maxZero_mono_set {s t : Finset ι} (hst : s ⊆ t) (f : ι → R) :
    maxZero s f ≤ maxZero t f :=
  maxZero_le_iff.mpr ⟨zero_le_maxZero _ _, fun _ hi => le_maxZero f (hst hi)⟩

theorem maxZero_congr {s : Finset ι} {f g : ι → R} (h : ∀ i ∈ s, f i = g i) :
    maxZero s f = maxZero s g := by
  classical
  apply le_antisymm <;> apply maxZero_le_iff.mpr
  · exact ⟨zero_le_maxZero _ _, fun i hi => (h i hi).le.trans (le_maxZero g hi)⟩
  · exact ⟨zero_le_maxZero _ _, fun i hi => (h i hi).symm.le.trans (le_maxZero f hi)⟩

end Max

section Chain

variable {P R : Type*} [PartialOrder P]
variable [AddCommGroup R] [LinearOrder R]

section Above

variable [Fintype P]

noncomputable def above (c : P) : Finset P := by
  classical
  exact univ.filter (fun d => c ≤ d)

noncomputable def strictlyAbove (c : P) : Finset P := by
  classical
  exact univ.filter (fun d => c < d)

@[simp] theorem mem_above {c d : P} : d ∈ above c ↔ c ≤ d := by
  classical
  simp [above]

@[simp] theorem mem_strictlyAbove {c d : P} : d ∈ strictlyAbove c ↔ c < d := by
  classical
  simp [strictlyAbove]

theorem above_mono {c d : P} (h : c ≤ d) : above d ⊆ above c := by
  intro e he
  exact mem_above.mpr (h.trans (mem_above.mp he))

end Above

/-- The largest total weight of a chain contained in a finite set. -/
noncomputable def chainMax (s : Finset P) (b : P → R) : R := by
  classical
  exact maxZero (s.powerset.filter (fun t : Finset P => IsChain (· ≤ ·) (↑t : Set P))) (fun t => ∑ i ∈ t, b i)

theorem zero_le_chainMax (s : Finset P) (b : P → R) : 0 ≤ chainMax s b :=
  zero_le_maxZero _ _

theorem sum_chain_le {s t : Finset P} (b : P → R) (hst : t ⊆ s)
    (ht : IsChain (· ≤ ·) (↑t : Set P)) : (∑ i ∈ t, b i) ≤ chainMax s b := by
  classical
  unfold chainMax
  apply le_maxZero (fun u : Finset P => ∑ i ∈ u, b i) (i := t)
  exact mem_filter.mpr ⟨mem_powerset.mpr hst, ht⟩

theorem chainMax_le {s : Finset P} {b : P → R} {v : R} (hv : 0 ≤ v)
    (h : ∀ t : Finset P, t ⊆ s → IsChain (· ≤ ·) (↑t : Set P) → (∑ i ∈ t, b i) ≤ v) :
    chainMax s b ≤ v := by
  classical
  exact maxZero_le_iff.mpr ⟨hv, fun t ht =>
    h t (mem_powerset.mp (mem_filter.mp ht).1) (mem_filter.mp ht).2⟩

theorem chainMax_mono {s t : Finset P} (hst : s ⊆ t) (b : P → R) :
    chainMax s b ≤ chainMax t b :=
  chainMax_le (zero_le_chainMax _ _) fun _ hu hc => sum_chain_le b (hu.trans hst) hc

private theorem chain_min {t : Finset P} (h : t.Nonempty) (ht : IsChain (· ≤ ·) (↑t : Set P)) :
    ∃ c ∈ t, ∀ d ∈ t, c ≤ d := by
  obtain ⟨c, hc⟩ := t.exists_minimal h
  refine ⟨c, hc.1, fun d hd => ?_⟩
  by_cases he : c = d
  · simp [he]
  rcases ht hc.1 hd he with hh | hh
  · exact hh
  · exact (he (le_antisymm (hc.2 hd hh) hh)).elim

variable [Fintype P]

/-- The height of a class is the maximum weight of a chain in its upper set. -/
noncomputable def height (b : P → R) (c : P) : R := chainMax (above c) b

theorem height_antitone (b : P → R) : Antitone (height b) :=
  fun _ _ h => chainMax_mono (above_mono h) b

theorem height_nonneg (b : P → R) (c : P) : 0 ≤ height b c := zero_le_chainMax _ _

theorem maxHeight_eq_chainMax (b : P → R) :
    maxZero univ (height b) = chainMax univ b := by
  apply le_antisymm
  · exact maxZero_le_iff.mpr ⟨zero_le_chainMax _ _, fun _ _ =>
      chainMax_mono (subset_univ _) b⟩
  · apply chainMax_le (zero_le_maxZero ..)
    intro t _ ht
    by_cases h : t.Nonempty
    · obtain ⟨c, _, hc⟩ := chain_min h ht
      exact (sum_chain_le b (fun d hd => mem_above.mpr (hc d hd)) ht).trans
        (le_maxZero (height b) (mem_univ c))
    · simp [not_nonempty_iff_eq_empty.mp h, zero_le_maxZero]

theorem maxStrictHeight_eq_chainMax (b : P → R) (c : P) :
    maxZero (strictlyAbove c) (height b) = chainMax (strictlyAbove c) b := by
  apply le_antisymm
  · apply maxZero_le_iff.mpr ⟨zero_le_chainMax _ _, ?_⟩
    intro d hd
    exact chainMax_mono (fun e he => mem_strictlyAbove.mpr
      ((mem_strictlyAbove.mp hd).trans_le (mem_above.mp he))) b
  · apply chainMax_le (zero_le_maxZero ..)
    intro t hsub ht
    by_cases h : t.Nonempty
    · obtain ⟨d, hd, hmin⟩ := chain_min h ht
      exact (sum_chain_le b (fun e he => mem_above.mpr (hmin e he)) ht).trans
        (le_maxZero (height b) (hsub hd))
    · simp [not_nonempty_iff_eq_empty.mp h, zero_le_maxZero]

variable [IsOrderedAddMonoid R]

theorem height_rec (b : P → R) (hb : ∀ i, 0 ≤ b i) (c : P) :
    height b c = b c + maxZero (strictlyAbove c) (height b) := by
  classical
  rw [maxStrictHeight_eq_chainMax]
  apply le_antisymm
  · apply chainMax_le (add_nonneg (hb c) (zero_le_chainMax _ _))
    intro t hsub ht
    by_cases hc : c ∈ t
    · rw [← sum_erase_add _ _ hc, add_comm _ (b c)]
      apply add_le_add_right
      apply sum_chain_le b _ (ht.mono (erase_subset _ _))
      intro d hd
      have hne := (mem_erase.mp hd).1
      exact mem_strictlyAbove.mpr (lt_of_le_of_ne (mem_above.mp (hsub (mem_erase.mp hd).2)) hne.symm)
    · have ht' : t ⊆ strictlyAbove c := by
        intro d hd
        exact mem_strictlyAbove.mpr (lt_of_le_of_ne (mem_above.mp (hsub hd))
          (fun h => hc (h.symm ▸ hd)))
      exact (sum_chain_le b ht' ht).trans (le_add_of_nonneg_left (hb c))
  · have hc : b c ≤ height b c := by
      simpa only [sum_singleton, height] using sum_chain_le b (singleton_subset_iff.mpr (mem_above.mpr le_rfl))
        (by rw [coe_singleton]; exact IsChain.singleton)
    rw [← le_sub_iff_add_le']
    apply chainMax_le (sub_nonneg.mpr hc)
    intro t hsub ht
    have hct : c ∉ t := fun h => (lt_irrefl c) (mem_strictlyAbove.mp (hsub h))
    have hchain : IsChain (· ≤ ·) (↑(insert c t) : Set P) := by
      rw [coe_insert]
      exact ht.insert fun d hd _ => Or.inl (mem_strictlyAbove.mp (hsub hd)).le
    apply le_sub_iff_add_le.mpr
    rw [add_comm, ← sum_insert hct]
    exact sum_chain_le b (by
      intro d hd
      rcases mem_insert.mp hd with rfl | h
      · exact mem_above.mpr le_rfl
      · exact mem_above.mpr (mem_strictlyAbove.mp (hsub h)).le) hchain

/-- Recover the height from its successive gaps. -/
theorem height_of_gaps {a : P → R} (ha : Antitone a) (ha₀ : ∀ c, 0 ≤ a c) :
    height (fun c => a c - maxZero (strictlyAbove c) a) = a := by
  let b := fun c => a c - maxZero (strictlyAbove c) a
  have hb (c : P) : 0 ≤ b c := sub_nonneg.mpr (maxZero_le_iff.mpr
    ⟨ha₀ c, fun d hd => ha (mem_strictlyAbove.mp hd).le⟩)
  funext c
  change height b c = a c
  induction c using WellFoundedGT.induction with
  | ind c ih =>
    rw [height_rec b hb c, maxZero_congr (fun d hd => ih d (mem_strictlyAbove.mp hd))]
    exact sub_add_cancel _ _

omit [IsOrderedAddMonoid R] in
theorem chainMax_dual (b : P → R) :
    chainMax (univ : Finset Pᵒᵈ) (fun c => b (OrderDual.ofDual c)) = chainMax univ b := by
  apply le_antisymm
  · apply chainMax_le (zero_le_chainMax _ _)
    intro t _ ht
    apply sum_chain_le (P := P) b (t := t) (subset_univ _)
    intro i hi j hj hne
    exact (ht (x := OrderDual.toDual i) (y := OrderDual.toDual j) hi hj hne).symm
  · apply chainMax_le (zero_le_chainMax _ _)
    intro t _ ht
    apply sum_chain_le (P := Pᵒᵈ) (fun c => b (OrderDual.ofDual c)) (t := t) (subset_univ _)
    intro i hi j hj hne
    exact (ht (x := OrderDual.ofDual i) (y := OrderDual.ofDual j) hi hj hne).symm

end Chain

end AthanasiadisChapotonPolar
