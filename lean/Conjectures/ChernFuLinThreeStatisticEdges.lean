import Conjectures.ChernFuLinThreeStatisticDefs
import Conjectures.BursteinA218225TreeX

/-! # Eligible edges of the maximum-insertion tree of `X` -/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

/-- In an `A` node the old maximum ends the initial increasing run; in a `B`
node it follows the active prefix. Indices in `maxGap` are zero-based. -/
theorem max_location {n : ℕ} {π : Equiv.Perm (Fin (n+1))} (hX : InX π) :
    (least213Mid π = kX π ∧ firstDescent π = (maxGap π).val+2) ∨
    (least213Mid π = firstDescent π ∧ firstDescent π < kX π ∧ kX π = (maxGap π).val+1) := by
  let σ := deleteMax π
  let g := maxGap π
  have hs : InX σ := inX_deleteMax hX
  have he : insertMax σ g = π := insertMax_deleteMax π
  have hl : LegalGapX σ g := by change InX (insertMax σ g); rwa [he]
  have hk := (legalGapX_iff_lt_kX hs g).1 hl
  by_cases hg : g.val < firstDescent σ
  · obtain ⟨hd,hb,hk'⟩ := updateX_lt_d hs g hg
    rw [he] at hd hb hk'
    exact Or.inl ⟨hb.trans hk'.symm,hd⟩
  · obtain ⟨hd,hb,hk'⟩ := updateX_ge_d hs g (Nat.le_of_not_gt hg) hk
    rw [he] at hd hb hk'
    exact Or.inr ⟨hb.trans hd.symm,by omega,hk'⟩

theorem noninverse_edge_eligible {n : ℕ} {π : Equiv.Perm (Fin (n+1))} (hX : InX π)
    {g : Fin (n+2)} (hg : LegalGapX π g) (hni : (maxGap π).val < g.val) :
    g.val < least213Mid π := by
  have hk := (legalGapX_iff_lt_kX hX g).1 hg
  rcases max_location hX with ⟨_,_⟩ | ⟨_,_,_⟩ <;> omega

theorem eligible_inverse_edge_low {n : ℕ} {π : Equiv.Perm (Fin (n+1))} (hX : InX π)
    {g : Fin (n+2)} (he : g.val < least213Mid π) (hi : g.val ≤ (maxGap π).val) :
    g.val < firstDescent π := by
  rcases max_location hX with ⟨_,_⟩ | ⟨_,_,_⟩ <;> omega

theorem eligible_inverse_child {n : ℕ} {π : Equiv.Perm (Fin (n+1))} (hX : InX π)
    {g : Fin (n+2)} (he : g.val < least213Mid π) (hi : g.val ≤ (maxGap π).val) :
    InX (insertMax π g) ∧ least213Mid (insertMax π g) = kX (insertMax π g) ∧
    firstDescent (insertMax π g) = g.val+2 := by
  obtain ⟨hd,hb,hk⟩ := updateX_lt_d hX g (eligible_inverse_edge_low hX he hi)
  exact ⟨(legalGapX_iff_lt_kX hX g).2 (he.trans_le (invariantsX_bounds π).2.2.1),hb.trans hk.symm,hd⟩

/-- Inserting before the old maximum removes no right-to-left maxima. -/
theorem rma_inverse_edge {n : ℕ} (π : Equiv.Perm (Fin (n+1))) {g : Fin (n+2)}
    (hi : g.val ≤ (maxGap π).val) : rma (insertMax π g) = 1+rma π := by
  rw [rma_insertMax]; congr 1
  apply Finset.sum_congr rfl
  intro i _
  apply if_congr _ rfl rfl
  refine ⟨And.right, fun hr => ⟨?_,hr⟩⟩
  apply (Fin.lt_succAbove_iff_le_castSucc g i).mpr
  change g.val ≤ i.val
  apply hi.trans
  by_contra! hlt
  have h := hr (maxGap π) hlt
  rw [maxGap, Equiv.apply_symm_apply] at h
  exact (Fin.le_last _).not_gt h

theorem ides_inverse_edge {n : ℕ} (π : Equiv.Perm (Fin (n+1))) {g : Fin (n+2)}
    (hi : g.val ≤ (maxGap π).val) : ides (insertMax π g) = ides π+1 := by
  rw [ides_insertMax, ite_eq_left ((Fin.lt_succAbove_iff_le_castSucc ..).2 hi)]

end Conjectures.ChernFuLinThreeStatistic
