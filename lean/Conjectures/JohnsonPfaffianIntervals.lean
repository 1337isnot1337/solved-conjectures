import Conjectures.JohnsonPfaffianUncross
namespace JohnsonPfaffian

noncomputable def boundaries (I : Finset (ℕ × ℕ)) : Finset ℕ :=
  (I.image Prod.fst) ∪ (I.image (fun e => e.2+1))

theorem boundaries_card_le (I : Finset (ℕ × ℕ)) : (boundaries I).card ≤ 2*I.card := by
  unfold boundaries
  calc
    _ ≤ (I.image Prod.fst).card + (I.image (fun e => e.2+1)).card := Finset.card_union_le _ _
    _ ≤ I.card + I.card := add_le_add Finset.card_image_le Finset.card_image_le
    _ = 2*I.card := by omega

theorem covered_intervals_have_twins (n : ℕ) (I : Finset (ℕ × ℕ))
    (hn : 0 < n) (hcount : 2*I.card ≤ n)
    (hvalid : ∀ e ∈ I, e.1 ≤ e.2 ∧ e.2 < n)
    (hcover : ∀ v < n, ∃ e ∈ I, e.1 ≤ v ∧ v ≤ e.2) :
    ∃ v, v+1 < n ∧ ∀ e ∈ I, (e.1 ≤ v ∧ v ≤ e.2) ↔ (e.1 ≤ v+1 ∧ v+1 ≤ e.2) := by
  classical
  have h0 : 0 ∈ boundaries I := by
    obtain ⟨e, he, hl, hr⟩ := hcover 0 hn
    have : e.1 = 0 := by omega
    unfold boundaries
    apply Finset.mem_union_left
    exact Finset.mem_image.mpr ⟨e,he,this⟩
  have hN : n ∈ boundaries I := by
    obtain ⟨e, he, hl, hr⟩ := hcover (n-1) (by omega)
    have hv := hvalid e he
    have : e.2+1 = n := by omega
    unfold boundaries
    apply Finset.mem_union_right
    exact Finset.mem_image.mpr ⟨e,he,this⟩
  have hgap : ∃ g, 0 < g ∧ g < n ∧ g ∉ boundaries I := by
    by_contra hnone
    have hsubset : Finset.range (n+1) ⊆ boundaries I := by
      intro g hg
      have hg' : g < n+1 := Finset.mem_range.mp hg
      by_cases hg0 : g=0
      · simpa [hg0] using h0
      by_cases hgn : g=n
      · simpa [hgn] using hN
      by_contra hmem
      apply hnone
      exact ⟨g, by omega, by omega, hmem⟩
    have hcard := Finset.card_le_card hsubset
    have hbound := boundaries_card_le I
    simp only [Finset.card_range] at hcard
    omega
  obtain ⟨g, hg0, hgn, hg⟩ := hgap
  refine ⟨g-1, by omega, ?_⟩
  intro e he
  have hleft : e.1 ≠ g := by
    intro hh
    apply hg
    unfold boundaries
    apply Finset.mem_union_left
    exact Finset.mem_image.mpr ⟨e,he,hh⟩
  have hright : e.2+1 ≠ g := by
    intro hh
    apply hg
    unfold boundaries
    apply Finset.mem_union_right
    exact Finset.mem_image.mpr ⟨e,he,hh⟩
  omega
end JohnsonPfaffian
