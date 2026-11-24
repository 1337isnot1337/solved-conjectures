import Conjectures.AlmironMoyanoWilfGeneratorCount

/-! The fixed-semigroup Wilf threshold is the maximum of the individual
thresholds over the appropriate finite gap-antichain family. -/

open Finset

namespace AlmironMoyanoWilf

noncomputable section

private def minimalFinset (S : AddSubmonoid ℕ) (D : Set ℕ) (c : ℕ) : Finset ℕ := by
  classical
  exact (insert 0 (gaps (S : Set ℕ) c)).filter (fun n => n ∈ minimalGenerators S D)

private theorem mem_minimalFinset {S : AddSubmonoid ℕ} {D : Set ℕ} {c n : ℕ}
    (hc : IsConductor (fun i => i ∈ S) c) (hD : IsNormalizedModule S (fun i => i ∈ D)) :
    n ∈ minimalFinset S D c ↔ n ∈ minimalGenerators S D := by
  classical
  unfold minimalFinset
  rw [mem_filter]
  refine ⟨And.right, fun hn => ⟨?_, hn⟩⟩
  by_cases he : n = 0
  · exact mem_insert.2 (Or.inl he)
  · exact mem_insert.2 (Or.inr ((mem_gaps_iff (D := (S : Set ℕ)) hc).2
      (minimalGenerator_isGap (D := D) hD hn he)))

theorem isMinimalGenerating_iff {S : AddSubmonoid ℕ} {D : Set ℕ} {c : ℕ}
    (hc : IsConductor (fun i => i ∈ S) c) (hD : IsNormalizedModule S (fun i => i ∈ D))
    (A : Finset ℕ) :
    IsMinimalGenerating S (fun n => n ∈ D) A ↔
      (A : Set ℕ) = minimalGenerators S D := by
  classical
  let B := minimalFinset S D c
  have hB : Generates S (fun n => n ∈ D) B := by
    intro n
    constructor
    · intro hn
      obtain ⟨g, hg, s, hs, he⟩ := decomposes_into_minimal hn
      exact ⟨g, (mem_minimalFinset hc hD).2 hg, s, hs, he⟩
    · rintro ⟨g, hg, s, hs, rfl⟩
      exact hD.2 g s ((mem_minimalFinset hc hD).1 hg).1 hs
  have hcoe : (B : Set ℕ) = minimalGenerators S D :=
    Set.ext fun _ => mem_minimalFinset hc hD
  constructor
  · intro hA
    have hsub : B ⊆ A := by
      intro n hn
      exact minimalGenerators_subset_generating hA.1 ((mem_minimalFinset hc hD).1 hn)
    have hBA := eq_of_subset_of_card_le hsub (hA.2 B hB)
    rwa [← hBA]
  · intro he
    have hAB : A = B := by
      apply Finset.coe_injective
      exact he.trans hcoe.symm
    subst A
    refine ⟨hB, fun C hC => card_le_card ?_⟩
    intro n hn
    exact minimalGenerators_subset_generating hC ((mem_minimalFinset hc hD).1 hn)

/-- The possible positive parts of minimal generating sets of cardinality `r`. -/
def admissibleAntichains (S : AddSubmonoid ℕ) (c r : ℕ) : Finset (Finset ℕ) := by
  classical
  exact ((gaps (S : Set ℕ) c).powersetCard (r - 1)).filter (fun A => IsGapAntichain S (A : Set ℕ))

theorem minimal_positive_antichain {S : AddSubmonoid ℕ} {D : Set ℕ} {A : Finset ℕ} {c r : ℕ}
    (hc : IsConductor (fun i => i ∈ S) c) (hD : IsNormalizedModule S (fun i => i ∈ D))
    (hA : IsMinimalGenerating S (fun n => n ∈ D) A) (hr : A.card = r) :
    A.erase 0 ∈ admissibleAntichains S c r ∧ generated S ↑(A.erase 0) = D := by
  classical
  have he := (isMinimalGenerating_iff hc hD A).1 hA
  have hA0 : 0 ∈ A := by
    rw [← Finset.mem_coe, he]
    exact zero_mem_minimalGenerators hD
  have hB : (↑(A.erase 0) : Set ℕ) = minimalGenerators S D \ {0} := by
    rw [coe_erase, he]
  have hpos := positive_minimal_generators (D := D) hD
  refine ⟨?_, by rw [hB]; exact hpos.2⟩
  unfold admissibleAntichains
  rw [mem_filter, mem_powersetCard, hB]
  refine ⟨⟨?_, by rw [card_erase_of_mem hA0, hr]⟩, hpos.1⟩
  intro n hn
  have hn' : n ∈ minimalGenerators S D \ {0} := by rw [← hB]; exact hn
  exact (mem_gaps_iff (D := (S : Set ℕ)) hc).2
    (minimalGenerator_isGap hD hn'.1 hn'.2)

theorem admissible_antichain_minimal {S : AddSubmonoid ℕ} {A : Finset ℕ} {c r : ℕ}
    (hr : 0 < r) (hA : A ∈ admissibleAntichains S c r) :
    IsMinimalGenerating S (fun n => n ∈ generated S ↑A) (insert 0 A) ∧ (insert 0 A).card = r := by
  classical
  unfold admissibleAntichains at hA
  have hA' := mem_filter.1 hA
  have hcard := (mem_powersetCard.1 hA'.1).2
  have h0 : 0 ∉ A := fun h => hA'.2.1 0 h S.zero_mem
  exact ⟨antichain_minimalGenerating hA'.2, by rw [card_insert_of_notMem h0, hcard]; omega⟩

/-- The smallest positive integer dominating the required Wilf inequalities
over a finite family of normalized modules is the maximum of the individual
thresholds, with the empty family giving one. -/
theorem finite_family_threshold {α : Type*} [DecidableEq α] (A : Finset α)
    (c δ w : α → ℕ)
    (h : ∀ a ∈ A, IsLeast {k : ℕ | 0 < k ∧ c a ≤ k * δ a} (w a)) :
    IsLeast {k : ℕ | 0 < k ∧ ∀ a ∈ A, c a ≤ k * δ a} (max 1 (A.sup w)) := by
  constructor
  · refine ⟨by omega, fun a ha => ?_⟩
    exact (h a ha).1.2.trans (Nat.mul_le_mul_right _ ((le_sup ha).trans (le_max_right _ _)))
  · intro k hk
    rcases hk with ⟨hpos, hk⟩
    apply max_le (by omega)
    exact Finset.sup_le (fun a ha => (h a ha).2 ⟨hpos, hk a ha⟩)

private def leftMembers (D : Set ℕ) (c : ℕ) : ℕ := by
  classical
  exact leftCount (fun n => n ∈ D) c

private def moduleThreshold (D : Set ℕ) (c : ℕ) : ℕ :=
  max 1 ⌈(c : ℚ) / (leftMembers D c : ℚ)⌉₊

private theorem moduleThreshold_isLeast {D : Set ℕ} {c : ℕ} (h0 : 0 ∈ D) :
    IsLeast {k : ℕ | 0 < k ∧ c ≤ k * leftMembers D c} (moduleThreshold D c) := by
  classical
  by_cases hc : c = 0
  · subst c
    simp [moduleThreshold, IsLeast, lowerBounds]
    omega
  · let δ := leftMembers D c
    let ratio : ℚ := (c : ℚ) / δ
    have hc' : 0 < c := Nat.pos_of_ne_zero hc
    have hδ : (0 : ℚ) < δ := by
      have h : 0 < leftCount (fun n => n ∈ D) c := leftCount_pos h0 hc'
      exact_mod_cast h
    have hratio : 0 < ratio := div_pos (by exact_mod_cast hc') hδ
    have hceil : 1 ≤ ⌈ratio⌉₊ := Nat.ceil_pos.2 hratio
    have hequiv (k : ℕ) : ratio ≤ k ↔ c ≤ k * δ := by
      dsimp [ratio]
      rw [div_le_iff₀ hδ, ← Nat.cast_mul]
      exact_mod_cast (Iff.rfl : c ≤ k * δ ↔ c ≤ k * δ)
    change IsLeast _ (max 1 ⌈ratio⌉₊)
    rw [max_eq_right hceil]
    constructor
    · exact ⟨hceil, (hequiv _).1 (Nat.le_ceil _)⟩
    · rintro k ⟨_, hk⟩
      exact Nat.ceil_le.2 ((hequiv k).2 hk)

private def antichainConductor {S : AddSubmonoid ℕ} {c : ℕ}
    (hc : IsConductor (fun n => n ∈ S) c) (A : Finset ℕ) : ℕ :=
  Classical.choose (normalizedModule_conductor hc (generated_isModule S ↑A))

private theorem antichainConductor_spec {S : AddSubmonoid ℕ} {c : ℕ}
    (hc : IsConductor (fun n => n ∈ S) c) (A : Finset ℕ) :
    IsConductor (fun n => n ∈ generated S ↑A) (antichainConductor hc A) :=
  Classical.choose_spec (normalizedModule_conductor hc (generated_isModule S ↑A))

/-- The fixed-semigroup threshold with a prescribed minimal generator count.
The maximum is over gap antichains of size `r-1`. -/
def fixedThreshold {S : AddSubmonoid ℕ} {c : ℕ} (hc : IsConductor (fun n => n ∈ S) c)
    (r : ℕ) : ℕ :=
  max 1 ((admissibleAntichains S c r).sup fun A =>
    moduleThreshold (generated S ↑A) (antichainConductor hc A))

/-- Every admissible module occurs in the finite maximum and conversely,
including the value one when the admissible family is empty. -/
theorem fixedThreshold_isLeast {S : AddSubmonoid ℕ} {c r : ℕ} (hr : 0 < r)
    (hc : IsConductor (fun n => n ∈ S) c) :
    IsLeast {k : ℕ | 0 < k ∧
      ∀ (D : Set ℕ) (d : ℕ) (A : Finset ℕ),
        IsNormalizedModule S (fun n => n ∈ D) → IsConductor (fun n => n ∈ D) d →
        IsMinimalGenerating S (fun n => n ∈ D) A → A.card = r →
        d ≤ k * leftMembers D d} (fixedThreshold hc r) := by
  let cuts := fun A => antichainConductor hc A
  let counts := fun A : Finset ℕ => leftMembers (generated S ↑A) (cuts A)
  let thresholds := fun A : Finset ℕ => moduleThreshold (generated S ↑A) (cuts A)
  have hfinite := finite_family_threshold (admissibleAntichains S c r) cuts counts thresholds (by
    intro A _
    exact moduleThreshold_isLeast (D := generated S ↑A) (c := cuts A)
      (generated_isModule S ↑A).1)
  constructor
  · refine ⟨hfinite.1.1, ?_⟩
    intro D d A hD hd hA hcard
    obtain ⟨hB, hEq⟩ := minimal_positive_antichain hc hD hA hcard
    have htd : cuts (A.erase 0) = d := by
      have hh := antichainConductor_spec hc (A.erase 0)
      rw [hEq] at hh
      exact isConductor_unique hh hd
    have hfinite' := hfinite.1.2 (A.erase 0) hB
    change cuts (A.erase 0) ≤ fixedThreshold hc r *
      leftMembers (generated S ↑(A.erase 0)) (cuts (A.erase 0)) at hfinite'
    rwa [hEq, htd] at hfinite'
  · intro k hk
    refine hfinite.2 ⟨hk.1, fun A hA => ?_⟩
    have hcount := admissible_antichain_minimal hr hA
    exact hk.2 (generated S ↑A) (cuts A) (insert 0 A)
      (generated_isModule S ↑A) (antichainConductor_spec hc A) hcount.1 hcount.2

end

end AlmironMoyanoWilf
