module

public import Conjectures.FranklLocalCertificate

/-! Recognize compatible inside patterns through their maximal local cover.
The checker enumerates subsets of the inside window, rather than all local
unions. Its family is exactly the existing family of compatible patterns.
-/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

theorem local_union_subset_localPart {G : Finset (Finset α)} {W L U : Finset α}
    (hL : L ∈ family (localGenerators G W)) (hLU : L ⊆ U) :
    L ⊆ localPart G W U := by
  intro x hx
  obtain ⟨g, hg, hgL, hxg⟩ := mem_family_iff_covered.mp hL x hx
  exact mem_unionOf.mpr
    ⟨g, Finset.mem_filter.mpr ⟨hg, Finset.Subset.trans hgL hLU⟩, hxg⟩

theorem mem_compatible_iff_maximalCover {G : Finset (Finset α)} {W E M S : Finset α}
    (hE : Disjoint E W) :
    S ∈ compatible G W E M ↔ S ⊆ W ∧
      interior W (localPart G W (S ∪ E)) = S ∧
      M ⊆ exterior W (localPart G W (S ∪ E)) := by
  constructor
  · intro hS
    obtain ⟨L, hL, hML, hLE, hLS⟩ := mem_compatible.mp hS
    have hSW : S ⊆ W := by
      rw [← hLS]
      exact Finset.inter_subset_right
    have hLU : L ⊆ S ∪ E := by
      intro x hx
      by_cases hxW : x ∈ W
      · apply Finset.mem_union_left
        rw [← hLS]
        exact Finset.mem_inter.mpr ⟨hx, hxW⟩
      · exact Finset.mem_union_right _ (hLE (Finset.mem_sdiff.mpr ⟨hx, hxW⟩))
    have hLC := local_union_subset_localPart hL hLU
    refine ⟨hSW, ?_, ?_⟩
    · apply Finset.Subset.antisymm
      · intro x hx
        obtain ⟨hxC, hxW⟩ := Finset.mem_inter.mp hx
        rcases Finset.mem_union.mp (localPart_subset G W (S ∪ E) hxC) with hxS | hxE
        · exact hxS
        · exact False.elim (Finset.disjoint_left.mp hE hxE hxW)
      · intro x hx
        have hxI : x ∈ interior W L := by simpa only [hLS] using hx
        obtain ⟨hxL, hxW⟩ := Finset.mem_inter.mp hxI
        exact Finset.mem_inter.mpr ⟨hLC hxL, hxW⟩
    · intro x hx
      obtain ⟨hxL, hxW⟩ := Finset.mem_sdiff.mp (hML hx)
      exact Finset.mem_sdiff.mpr ⟨hLC hxL, hxW⟩
  · rintro ⟨hSW, hCS, hMC⟩
    apply mem_compatible.mpr
    refine ⟨localPart G W (S ∪ E), localPart_mem G W (S ∪ E), hMC, ?_, hCS⟩
    intro x hx
    obtain ⟨hxC, hxW⟩ := Finset.mem_sdiff.mp hx
    rcases Finset.mem_union.mp (localPart_subset G W (S ∪ E) hxC) with hxS | hxE
    · exact False.elim (hxW (hSW hxS))
    · exact hxE

def maximalCompatible (G : Finset (Finset α)) (W E M : Finset α) :
    Finset (Finset α) :=
  W.powerset.filter (fun S =>
    interior W (localPart G W (S ∪ E)) = S ∧
    M ⊆ exterior W (localPart G W (S ∪ E)))

theorem maximalCompatible_eq {G : Finset (Finset α)} {W E M : Finset α}
    (hE : Disjoint E W) : maximalCompatible G W E M = compatible G W E M := by
  ext S
  simp only [maximalCompatible, Finset.mem_filter, Finset.mem_powerset,
    mem_compatible_iff_maximalCover hE]

theorem boundary_disjoint_window (G : Finset (Finset α)) (W : Finset α) :
    Disjoint (boundary G W) W := by
  apply Finset.disjoint_left.mpr
  intro x hx hxW
  exact (Finset.mem_sdiff.mp hx).2 hxW

def maximalCertificateCheck (G : Finset (Finset α)) (W : Finset α) (w : α → ℕ) :
    Bool :=
  decide (∃ x ∈ W, 0 < w x) &&
    decide (∀ E ∈ (boundary G W).powerset, ∀ M ∈ E.powerset,
      0 ≤ ∑ S ∈ maximalCompatible G W E M, integerImbalance W w S)

theorem maximalCertificateCheck_eq (G : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ) : maximalCertificateCheck G W w = certificateCheck G W w := by
  unfold maximalCertificateCheck certificateCheck
  congr 1
  apply Bool.eq_iff_iff.mpr
  simp only [decide_eq_true_eq]
  apply forall_congr'
  intro E
  apply forall_congr'
  intro hE
  have hdis : Disjoint E W :=
    (boundary_disjoint_window G W).mono_left (Finset.mem_powerset.mp hE)
  simp only [maximalCompatible_eq hdis]

theorem maximalCertificateCheck_abundance {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} (hc : maximalCertificateCheck G W w = true) :
    ∃ x ∈ W, Abundant (family G) x := by
  apply certificateCheck_abundance
  simpa only [maximalCertificateCheck_eq] using hc

end FranklLocal
