import Conjectures.LonelinessRenaultOrdering
import Conjectures.LonelinessRenaultReindex

/-! Exact relabeling and residue assembly for Renault's three parity cases.
The three mathematical cases are explicit premises in this structural
lemma; the final bound supplies their proved implementations. -/

namespace Loneliness.Renault

private theorem even_residue (v : ℕ) (h₃ : ¬3 ∣ v) (h₂ : 2 ∣ v) :
    v % 6 = 2 ∨ v % 6 = 4 := by
  have h3 : v % 3 ≠ 0 := fun h => h₃ (Nat.dvd_of_mod_eq_zero h)
  have h2 : v % 2 = 0 := Nat.mod_eq_zero_of_dvd h₂
  omega

private theorem odd_residue (v : ℕ) (h₃ : ¬3 ∣ v) (h₂ : ¬2 ∣ v) :
    v % 6 = 1 ∨ v % 6 = 5 := by
  have h3 : v % 3 ≠ 0 := fun h => h₃ (Nat.dvd_of_mod_eq_zero h)
  have h2 : v % 2 ≠ 0 := fun h => h₂ (Nat.dvd_of_mod_eq_zero h)
  omega

theorem allSafe_of_residue_cases
    (hone : ∀ w : Fin 5 → ℕ, (∀ i, 0 < w i) → 6 ∣ w 0 →
      (∀ i, i ≠ 0 → w i % 6 = 1 ∨ w i % 6 = 5) → ∃ t : ℝ, AllSafe w t)
    (htwo : ∀ w : Fin 5 → ℕ, (∀ i, 0 < w i) → 6 ∣ w 0 →
      (w 1 % 6 = 2 ∨ w 1 % 6 = 4) →
      (∀ i, i ≠ 0 → i ≠ 1 → w i % 6 = 1 ∨ w i % 6 = 5) → ∃ t : ℝ, AllSafe w t)
    (hthree : ∀ w : Fin 5 → ℕ, (∀ i, 0 < w i) → 6 ∣ w 0 →
      (w 1 % 6 = 2 ∨ w 1 % 6 = 4) → (w 2 % 6 = 2 ∨ w 2 % 6 = 4) →
      (w 3 % 6 = 1 ∨ w 3 % 6 = 5) → (w 4 % 6 = 1 ∨ w 4 % 6 = 5) →
      ∃ t : ℝ, AllSafe w t)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (h₆ : ∃ i, 6 ∣ v i)
    (h₃ : ∀ i j, 3 ∣ v i → 3 ∣ v j → i = j)
    (h₂ : (Finset.univ.filter fun i : Fin 5 => 2 ∣ v i).card ≤ 3) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  obtain ⟨i₀, hi₀⟩ := h₆
  let π : Equiv.Perm (Fin 5) := Equiv.swap 0 i₀
  have hπ₀ : π 0 = i₀ := Equiv.swap_apply_left 0 i₀
  let w : Fin 5 → ℕ := v ∘ π
  have hwpositive : ∀ i, 0 < w i := fun i => hpositive (π i)
  have hw₆ : 6 ∣ w 0 := by simpa only [w, Function.comp_apply, hπ₀] using hi₀
  have hw₃ : ∀ i, i ≠ 0 → ¬3 ∣ w i := by
    intro i hi hdiv
    have hfirst : 3 ∣ v i₀ := dvd_trans (by decide : 3 ∣ 6) hi₀
    have heq : π i = i₀ := h₃ (π i) i₀ hdiv hfirst
    apply hi
    apply π.injective
    exact heq.trans hπ₀.symm
  let E : Finset (Fin 5) := Finset.univ.filter fun i => 2 ∣ w i
  have hE₀ : 0 ∈ E := by
    simp only [E, Finset.mem_filter, Finset.mem_univ, true_and]
    exact dvd_trans (by decide : 2 ∣ 6) hw₆
  have hEcard : E.card ≤ 3 := by
    change (Finset.univ.filter fun i => 2 ∣ v (π i)).card ≤ 3
    rw [card_filter_equiv π (fun i => 2 ∣ v i)]
    exact h₂
  obtain ⟨k, hk⟩ := exists_caseOrder E hE₀ hEcard
  let σ := caseEquiv k
  let u : Fin 5 → ℕ := w ∘ σ
  have hσ₀ : σ 0 = 0 := caseEquiv_zero k
  have hu₆ : 6 ∣ u 0 := by simpa only [u, Function.comp_apply, hσ₀] using hw₆
  have hupositive : ∀ i, 0 < u i := fun i => hwpositive (σ i)
  have hu₃ : ∀ i, i ≠ 0 → ¬3 ∣ u i := by
    intro i hi
    apply hw₃ (σ i)
    intro heq
    apply hi
    apply σ.injective
    exact heq.trans hσ₀.symm
  have hmem (i : Fin 5) : caseOrder k i ∈ E ↔ 2 ∣ u i := by
    simp only [E, Finset.mem_filter, Finset.mem_univ, true_and]
    rfl
  have hanswer : ∃ t : ℝ, AllSafe u t := by
    rcases hk with hk | hk | hk
    · apply hone u hupositive hu₆
      intro i hi
      exact odd_residue (u i) (hu₃ i hi) (fun h => hk i hi ((hmem i).mpr h))
    · apply htwo u hupositive hu₆
      · exact even_residue (u 1) (hu₃ 1 (by decide)) ((hmem 1).mp hk.1)
      · intro i hi hi₁
        exact odd_residue (u i) (hu₃ i hi) (fun h => hk.2 i hi hi₁ ((hmem i).mpr h))
    · apply hthree u hupositive hu₆
      · exact even_residue (u 1) (hu₃ 1 (by decide)) ((hmem 1).mp hk.1)
      · exact even_residue (u 2) (hu₃ 2 (by decide)) ((hmem 2).mp hk.2.1)
      · exact odd_residue (u 3) (hu₃ 3 (by decide))
          (fun h => hk.2.2 3 (by decide) (by decide) (by decide) ((hmem 3).mpr h))
      · exact odd_residue (u 4) (hu₃ 4 (by decide))
          (fun h => hk.2.2 4 (by decide) (by decide) (by decide) ((hmem 4).mpr h))
  apply (exists_allSafe_reindex_iff v π).mp
  exact (exists_allSafe_reindex_iff w σ).mp hanswer

end Loneliness.Renault
