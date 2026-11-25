import Conjectures.KauersKoutschanBlockLengths
import Conjectures.KauersKoutschanDividedSum

/-! The inclusion–exclusion sign factors over the literal maximal blocks. -/

open scoped BigOperators

namespace KauersKoutschan

private def upperEmbedding (n : ℕ) : Fin (n - 2) ↪ Fin n :=
  ⟨upper, fun _ _ h => Fin.ext (by have e := congrArg Fin.val h; simp only [upper] at e; omega)⟩

private theorem mem_upper_image {n : ℕ} (s : Finset (Fin (n - 2))) (b : Fin n) :
    b ∈ s.map (upperEmbedding n) ↔ 2 ≤ (b : ℕ) ∧ selectedAt s ((b : ℕ) - 2) := by
  constructor
  · rintro h
    obtain ⟨i, hi, hb⟩ := Finset.mem_map.mp h
    have hv : (i : ℕ) + 2 = b := congrArg Fin.val hb
    refine ⟨by omega, Finset.mem_image.mpr ⟨i, hi, by omega⟩⟩
  · rintro ⟨hlo, hsel⟩
    obtain ⟨i, hi, hb⟩ := Finset.mem_image.mp hsel
    exact Finset.mem_map.mpr ⟨i, hi, Fin.ext (by change (i : ℕ) + 2 = b; omega)⟩

private def headComplementEquiv {n : ℕ} (s : Finset (Fin (n - 2))) :
    BlockHeads s ≃ ↥((s.map (upperEmbedding n))ᶜ) where
  toFun b := ⟨b.1, Finset.mem_compl.mpr (fun h => b.2 ((mem_upper_image s b.1).mp h))⟩
  invFun b := ⟨b.1, fun h => Finset.mem_compl.mp b.2 ((mem_upper_image s b.1).mpr h)⟩
  left_inv _ := Subtype.ext rfl
  right_inv _ := Subtype.ext rfl

theorem card_heads_add_card_edges {n : ℕ} (s : Finset (Fin (n - 2))) :
    Fintype.card (BlockHeads s) + s.card = n := by
  classical
  have hs := Finset.card_compl_add_card (s.map (upperEmbedding n))
  rw [Fintype.card_congr (headComplementEquiv s), Fintype.card_coe]
  simpa using hs

/-- Each block contributes exactly one chosen edge per vertex after its head. -/
theorem sum_runLength_sub_one {n : ℕ} (s : Finset (Fin (n - 2))) :
    (∑ b : BlockHeads s, (runLength s b.1 - 1)) = s.card := by
  classical
  have h := sum_runLength s
  have h' : (∑ b : BlockHeads s, (runLength s b.1 - 1 + 1)) = n := by
    simpa only [Nat.sub_add_cancel (runLength_pos s _)] using h
  have ht : (∑ b : BlockHeads s, (runLength s b.1 - 1)) + Fintype.card (BlockHeads s) = n := by
    simpa [Finset.sum_add_distrib] using h'
  have hs := card_heads_add_card_edges s
  omega

theorem sign_eq_prod_block_signs {n : ℕ} (s : Finset (Fin (n - 2))) :
    sign s.card = ∏ b : BlockHeads s, sign (runLength s b.1 - 1) := by
  unfold sign
  rw [Finset.prod_pow_eq_pow_sum, sum_runLength_sub_one]

end KauersKoutschan
