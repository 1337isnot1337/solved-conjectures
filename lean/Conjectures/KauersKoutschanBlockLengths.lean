import Conjectures.KauersKoutschanBlocks
import Mathlib.Data.Fintype.Sigma

/-! Every maximal block carries a literal finite chain of offsets. -/

open scoped BigOperators

namespace KauersKoutschan

def BlockHeads {n : ℕ} (s : Finset (Fin (n - 2))) :=
  {b : Fin n // ¬ (2 ≤ (b : ℕ) ∧ selectedAt s ((b : ℕ) - 2))}

noncomputable instance {n : ℕ} (s : Finset (Fin (n - 2))) : Fintype (BlockHeads s) := by
  unfold BlockHeads
  classical
  infer_instance

def admissibleOffset {n : ℕ} (s : Finset (Fin (n - 2))) (b k : ℕ) : Prop :=
  b + 2 * k < n ∧ ∀ j < k, selectedAt s (b + 2 * j)

private theorem admissibleOffset_mono {n : ℕ} (s : Finset (Fin (n - 2))) (b : ℕ)
    {i j : ℕ} (hij : i ≤ j) (hj : admissibleOffset s b j) :
    admissibleOffset s b i := by
  exact ⟨by have := hj.1; omega, fun k hk => hj.2 k (by omega)⟩

private theorem exists_inadmissible {n : ℕ} (s : Finset (Fin (n - 2))) (b : ℕ) :
    ∃ k, ¬admissibleOffset s b k :=
  ⟨n, fun h => by have := h.1; omega⟩

/-- A block's length is the first offset outside the selected run. -/
noncomputable def runLength {n : ℕ} (s : Finset (Fin (n - 2))) (b : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_inadmissible s b)

theorem admissibleOffset_iff_lt_runLength {n : ℕ} (s : Finset (Fin (n - 2))) (b k : ℕ) :
    admissibleOffset s b k ↔ k < runLength s b := by
  classical
  unfold runLength
  constructor
  · intro hk
    by_contra hn
    have hfind := Nat.find_spec (exists_inadmissible s b)
    exact hfind (admissibleOffset_mono s b (by omega) hk)
  · intro hk
    by_contra hn
    have hle := Nat.find_min' (exists_inadmissible s b) hn
    omega

theorem runLength_pos {n : ℕ} (s : Finset (Fin (n - 2))) (b : Fin n) :
    0 < runLength s b :=
  (admissibleOffset_iff_lt_runLength s b 0).mp ⟨by simp, by omega⟩

/-- The selected blocks, indexed by their first values, partition exactly the
original (n) value-chain vertices. -/
noncomputable def blocksByLength {n : ℕ} (s : Finset (Fin (n - 2))) :
    Fin n ≃ Σ b : BlockHeads s, Fin (runLength s b.1) :=
  (blockCoordinateEquiv s).trans {
    toFun q := ⟨⟨⟨q.1.1, by have := q.2.1; omega⟩, q.2.2.1⟩,
      ⟨q.1.2, (admissibleOffset_iff_lt_runLength s q.1.1 q.1.2).mp ⟨q.2.1, q.2.2.2⟩⟩⟩
    invFun q := by
      have h := (admissibleOffset_iff_lt_runLength s q.1.1 q.2).mpr q.2.isLt
      exact ⟨(q.1.1, q.2), h.1, q.1.2, h.2⟩
    left_inv q := by apply Subtype.ext; rfl
    right_inv q := by rcases q with ⟨⟨⟨b, hb⟩, he⟩, ⟨k, hk⟩⟩; rfl }

theorem sum_runLength {n : ℕ} (s : Finset (Fin (n - 2))) :
    (∑ b : BlockHeads s, runLength s b.1) = n := by
  classical
  have h := Fintype.card_congr (blocksByLength s)
  simpa [Fintype.card_sigma] using h.symm

/-- The distinct placements of the block heads determine a realizing
permutation uniquely. -/
theorem realizing_eq_of_heads {n : ℕ} {s : Finset (Fin (n - 2))}
    {p q : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (hq : q ∈ s.inf edgeEvent)
    (hs : ∀ b : BlockHeads s, p.symm b.1 = q.symm b.1) : p = q := by
  have he : p.symm = q.symm := by
    ext v
    let z := blockCoordinateEquiv s v
    have hv : (blockCoordinateEquiv s).symm z = v := (blockCoordinateEquiv s).symm_apply_apply v
    rw [← hv]
    obtain ⟨⟨b, k⟩, hb, hfirst, hr⟩ := z
    change (p.symm ⟨b + 2 * k, hb⟩ : ℕ) = (q.symm ⟨b + 2 * k, hb⟩ : ℕ)
    have hhead := hs ⟨⟨b, by omega⟩, hfirst⟩
    rw [inverse_preserves_block_offsets hp b k hb hr, inverse_preserves_block_offsets hq b k hb hr,
      hhead]
  simpa only [Equiv.symm_symm] using congrArg Equiv.symm he

end KauersKoutschan
