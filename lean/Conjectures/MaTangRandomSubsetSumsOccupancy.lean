import Conjectures.MaTangRandomSubsetSumsKernel

/-!
# Ma–Tang's random subset-sum threshold conjecture

Candidate finite counting argument for the singleton occupancy bound. This
module counts sequences exactly; normalization to a probability, the law
of the sampled kernel, and the asymptotic estimate remain separate.
-/

open scoped BigOperators

namespace MaTangRandomSubsetSums

/-- A sequence with its unique hit at a specified index is equivalent to
one hit value and arbitrary miss values at all other indices. -/
noncomputable def uniqueHitEquiv {α : Type*} (P : α → Prop) {k : ℕ}
    (i : Fin k) :
    {w : Fin k → α // P (w i) ∧ ∀ j, j ≠ i → ¬ P (w j)} ≃
      {a : α // P a} × ({j : Fin k // j ≠ i} → {a : α // ¬ P a}) := by
  classical
  refine
    { toFun := fun w =>
        (⟨w.1 i, w.2.1⟩, fun j => ⟨w.1 j.1, w.2.2 j.1 j.2⟩)
      invFun := fun v =>
        ⟨fun j => if h : j = i then v.1.1 else (v.2 ⟨j, h⟩).1, ?_⟩
      left_inv := ?_
      right_inv := ?_ }
  · constructor
    · simpa using v.1.2
    · intro j hj
      simpa [hj] using (v.2 ⟨j, hj⟩).2
  · intro w
    apply Subtype.ext
    funext j
    by_cases hj : j = i
    · simp [hj]
    · simp [hj]
  · intro v
    apply Prod.ext
    · apply Subtype.ext
      simp
    · funext j
      apply Subtype.ext
      simp [j.2]

/-- Exact number of words having a unique hit at a specified position. -/
theorem uniqueHit_card {α : Type*} [Fintype α] (P : α → Prop) {k : ℕ}
    (i : Fin k) :
    Nat.card {w : Fin k → α // P (w i) ∧ ∀ j, j ≠ i → ¬ P (w j)} =
      Nat.card {a : α // P a} * (Nat.card {a : α // ¬ P a}) ^ (k - 1) := by
  classical
  have hidx : Fintype.card {j : Fin k // j ≠ i} = k - 1 := by
    rw [Fintype.card_subtype_compl (fun j : Fin k => j = i),
      Fintype.card_subtype_eq, Fintype.card_fin]
  simp only [Nat.card_eq_fintype_card]
  rw [Fintype.card_congr (uniqueHitEquiv P i), Fintype.card_prod,
    Fintype.card_fun, hidx]

/-- A counting union bound for arbitrary finite families of hit predicates.
The two cardinal parameters are the exact sizes of the hit and miss sets
for every predicate. No independence between different predicates is used. -/
theorem singleton_union_card_le {α β : Type*} [Fintype α] [Fintype β]
    (P : β → α → Prop) (k p q : ℕ)
    (hp : ∀ b, Nat.card {a : α // P b a} = p)
    (hq : ∀ b, Nat.card {a : α // ¬ P b a} = q) :
    Nat.card {w : Fin k → α //
      ∃ b : β, ∃ i : Fin k, P b (w i) ∧ ∀ j, j ≠ i → ¬ P b (w j)} ≤
      Fintype.card β * k * p * q ^ (k - 1) := by
  classical
  let E := {w : Fin k → α //
    ∃ b : β, ∃ i : Fin k, P b (w i) ∧ ∀ j, j ≠ i → ¬ P b (w j)}
  let H := fun (b : β) (i : Fin k) =>
    {w : Fin k → α // P b (w i) ∧ ∀ j, j ≠ i → ¬ P b (w j)}
  let F := Σ b : β, Σ i : Fin k, H b i
  let f : E → F := fun w =>
    ⟨Classical.choose w.2, Classical.choose (Classical.choose_spec w.2),
      ⟨w.1, Classical.choose_spec (Classical.choose_spec w.2)⟩⟩
  have hf : Function.Injective f := by
    intro x y he
    apply Subtype.ext
    exact congrArg (fun v : F => v.2.2.1) he
  have hcard (b : β) (i : Fin k) :
      Fintype.card (H b i) = p * q ^ (k - 1) := by
    rw [← Nat.card_eq_fintype_card]
    exact (uniqueHit_card (P b) i).trans (by rw [hp b, hq b])
  calc
    _ = Fintype.card E := Nat.card_eq_fintype_card
    _ ≤ Fintype.card F := Fintype.card_le_of_injective f hf
    _ = Fintype.card β * k * p * q ^ (k - 1) := by
      simp only [F, Fintype.card_sigma, hcard, Finset.sum_const,
        Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
      ring

/-- In the independent-column model the alphabet contains 3·2^r letters.
A type is occupied if its ternary coefficient is nonzero. -/
abbrev OccupancyAlphabet (r : ℕ) := (Fin r → ZMod 2) × ZMod 3

theorem occupancy_alphabet_card (r : ℕ) :
    Fintype.card (OccupancyAlphabet r) = 3 * 2 ^ r := by
  simp [OccupancyAlphabet, Fintype.card_prod, Fintype.card_fun, ZMod.card,
    mul_comm]

private noncomputable def occupiedLetterEquiv (r : ℕ) (b : Fin r → ZMod 2) :
    {a : OccupancyAlphabet r // a.1 = b ∧ a.2 ≠ 0} ≃
      {c : ZMod 3 // c ≠ 0} where
  toFun a := ⟨a.1.2, a.2.2⟩
  invFun c := ⟨(b, c.1), rfl, c.2⟩
  left_inv a := by
    apply Subtype.ext
    exact Prod.ext a.2.1.symm rfl
  right_inv _ := rfl

theorem occupied_letter_card (r : ℕ) (b : Fin r → ZMod 2) :
    Nat.card {a : OccupancyAlphabet r // a.1 = b ∧ a.2 ≠ 0} = 2 := by
  classical
  rw [Nat.card_eq_fintype_card, Fintype.card_congr (occupiedLetterEquiv r b),
    Fintype.card_subtype_compl (fun c : ZMod 3 => c = 0),
    Fintype.card_subtype_eq, ZMod.card]
  decide

/-- The number of independent-column samples containing a singleton
occupied nonzero type is bounded by
(2^r-1) k 2 (3·2^r-2)^(k-1). Dividing by the total sample count gives
the source's finite union bound. -/
theorem singleton_occupancy_card_le (r k : ℕ) :
    Nat.card {w : Fin k → OccupancyAlphabet r //
      ∃ b : {b : Fin r → ZMod 2 // b ≠ 0}, ∃ i : Fin k,
        ((w i).1 = b.1 ∧ (w i).2 ≠ 0) ∧
          ∀ j, j ≠ i → ¬ ((w j).1 = b.1 ∧ (w j).2 ≠ 0)} ≤
      (2 ^ r - 1) * k * 2 * (3 * 2 ^ r - 2) ^ (k - 1) := by
  classical
  let P : {b : Fin r → ZMod 2 // b ≠ 0} → OccupancyAlphabet r → Prop :=
    fun b a => a.1 = b.1 ∧ a.2 ≠ 0
  have hp (b : {b : Fin r → ZMod 2 // b ≠ 0}) :
      Nat.card {a : OccupancyAlphabet r // P b a} = 2 :=
    occupied_letter_card r b.1
  have hq (b : {b : Fin r → ZMod 2 // b ≠ 0}) :
      Nat.card {a : OccupancyAlphabet r // ¬ P b a} = 3 * 2 ^ r - 2 := by
    have h := hp b
    rw [Nat.card_eq_fintype_card] at h ⊢
    rw [Fintype.card_subtype_compl (P b), occupancy_alphabet_card, h]
  have hb : Fintype.card {b : Fin r → ZMod 2 // b ≠ 0} = 2 ^ r - 1 := by
    rw [Fintype.card_subtype_compl (fun b : Fin r → ZMod 2 => b = 0),
      Fintype.card_subtype_eq, Fintype.card_fun, Fintype.card_fin, ZMod.card]
  simpa only [P, hb] using
    singleton_union_card_le P k 2 (3 * 2 ^ r - 2) hp hq

end MaTangRandomSubsetSums
