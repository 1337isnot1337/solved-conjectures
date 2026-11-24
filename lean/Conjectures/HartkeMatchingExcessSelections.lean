import Conjectures.HartkeMatchingExcessWeights

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Finite selections of actual return vertices: the ordinary binary selection,
the complete early residue interval, and the later Mersenne multiples.
-/

namespace HartkeMatchingExcess

open Finset

variable {R : ℕ}

def shiftedEmbedding (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) : S ↪ Fin (R + 1) where
  toFun i := ⟨d + i.val, h i.val i.property⟩
  inj' := by
    intro i j he
    apply Subtype.ext
    have hv := congrArg Fin.val he
    change d + i.val = d + j.val at hv
    omega

def shiftedPositions (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) : Finset (Fin (R + 1)) :=
  S.attach.map (shiftedEmbedding S d h)

theorem shiftedPositions_card (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) :
    (shiftedPositions S d h).card = S.card := by
  simp [shiftedPositions]

theorem shiftedPositions_mem_val (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) {j : Fin (R + 1)}
    (hj : j ∈ shiftedPositions S d h) : ∃ i ∈ S, j.val = d + i := by
  obtain ⟨i, _, rfl⟩ := mem_map.mp hj
  exact ⟨i.val, i.property, rfl⟩

theorem shiftedPositions_zero_not_mem (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) (hd : 0 < d) :
    (0 : Fin (R + 1)) ∉ shiftedPositions S d h := by
  intro hj
  obtain ⟨i, _, hi⟩ := shiftedPositions_mem_val S d h hj
  change 0 = d + i at hi
  omega

theorem shiftedPositions_sum (S : Finset ℕ) (d : ℕ)
    (h : ∀ i ∈ S, d + i < R + 1) (f : Fin (R + 1) → ℕ) (g : ℕ → ℕ)
    (hf : ∀ i (hi : i ∈ S), f ⟨d + i, h i hi⟩ = g i) :
    (∑ j ∈ shiftedPositions S d h, f j) = ∑ i ∈ S, g i := by
  rw [shiftedPositions, sum_map]
  calc
    (∑ i ∈ S.attach, f (shiftedEmbedding S d h i)) = ∑ i ∈ S.attach, g i.val := by
      apply sum_congr rfl
      intro i _
      exact hf i.val i.property
    _ = ∑ i ∈ S, g i := sum_attach S g

theorem exists_binary_returns (t : ℕ) :
    ∃ J : Finset (Fin (binaryLength t + 1)),
      0 ∉ J ∧ J.card = binaryWeight t ∧
        (∑ j ∈ J, pathCount (fun _ _ : Fin (binaryLength t + 1) => True) j) = t := by
  have hb : ∀ i ∈ binaryPositions t, 1 + i < binaryLength t + 1 := by
    intro i hi
    have := binaryPositions_lt_length hi
    omega
  let J := shiftedPositions (binaryPositions t) 1 hb
  refine ⟨J, shiftedPositions_zero_not_mem _ _ _ (by omega), ?_, ?_⟩
  · dsimp only [J]
    rw [shiftedPositions_card, binaryPositions_card]
  · calc
      (∑ j ∈ J, pathCount (fun _ _ : Fin (binaryLength t + 1) => True) j) =
          ∑ i ∈ binaryPositions t, 2 ^ i := by
        apply shiftedPositions_sum
        intro i hi
        rw [pathCount_binary]
        simp [Fin.ext_iff]
      _ = t := binaryPositions_sum t

theorem exists_early_binary_returns (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (r : ℕ) (hr : r < 2 ^ (u.val - 1)) :
    ∃ J : Finset (Fin (R + 1)), 0 ∉ J ∧ (∀ j ∈ J, j < u) ∧
      (∑ j ∈ J, pathCount (withoutOneArc u) j) = r := by
  obtain ⟨S, hS, hs⟩ := binary_subset_sum_below hr
  have hb : ∀ i ∈ S, 1 + i < R + 1 := by
    intro i hi
    have := mem_range.mp (hS hi)
    have := u.isLt
    omega
  let J := shiftedPositions S 1 hb
  have hjlt : ∀ j ∈ J, j < u := by
    intro j hj
    obtain ⟨i, hi, hv⟩ := shiftedPositions_mem_val S 1 hb hj
    have := mem_range.mp (hS hi)
    change j.val < u.val
    omega
  refine ⟨J, shiftedPositions_zero_not_mem _ _ _ (by omega), hjlt, ?_⟩
  calc
    (∑ j ∈ J, pathCount (withoutOneArc u) j) = ∑ i ∈ S, 2 ^ i := by
      apply shiftedPositions_sum
      intro i hi
      have hiu : (⟨1 + i, hb i hi⟩ : Fin (R + 1)) < u := by
        have := mem_range.mp (hS hi)
        change 1 + i < u.val
        omega
      rw [pathCount_deleted_before u _ hiu]
      simp [Fin.ext_iff]
    _ = r := hs

theorem exists_early_returns (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (r : ℕ) (hr : r < 2 ^ u.val - 1) :
    ∃ J : Finset (Fin (R + 1)), 0 ∉ J ∧ (∀ j ∈ J, j ≤ u) ∧
      (∑ j ∈ J, pathCount (withoutOneArc u) j) = r := by
  have hp : 2 ^ u.val = 2 * 2 ^ (u.val - 1) := by
    conv_lhs => rw [show u.val = (u.val - 1) + 1 by omega, pow_succ]
    omega
  by_cases hlo : r < 2 ^ (u.val - 1)
  · obtain ⟨J, hJ0, hJ, hs⟩ := exists_early_binary_returns u hu r hlo
    exact ⟨J, hJ0, fun j hj => (hJ j hj).le, hs⟩
  · let s := r - (2 ^ (u.val - 1) - 1)
    have hs : s < 2 ^ (u.val - 1) := by dsimp [s]; omega
    obtain ⟨J, hJ0, hJ, hsum⟩ := exists_early_binary_returns u hu s hs
    have hu0 : u ≠ 0 := by
      intro h
      have hv : u.val = 0 := congrArg Fin.val h
      omega
    have huJ : u ∉ J := fun h => (lt_irrefl u) (hJ u h)
    refine ⟨insert u J, ?_, ?_, ?_⟩
    · simp [Ne.symm hu0, hJ0]
    · intro j hj
      rcases mem_insert.mp hj with rfl | hj
      · exact le_rfl
      · exact (hJ j hj).le
    · rw [sum_insert huJ, pathCount_deleted_at u hu, hsum]
      dsimp [s]
      omega

theorem exists_deleted_returns (t u : ℕ) (hu : 2 ≤ u) :
    ∃ (R : ℕ) (v : Fin (R + 1)) (J : Finset (Fin (R + 1))),
      v.val = u ∧ 0 ∉ J ∧ binaryWeight (t / (2 ^ u - 1)) ≤ J.card ∧
        (∑ j ∈ J, pathCount (withoutOneArc v) j) = t := by
  let M := 2 ^ u - 1
  let Q := t / M
  let r := t % M
  let R := u + binaryLength Q
  let v : Fin (R + 1) := ⟨u, by dsimp [R]; omega⟩
  have hv : 2 ≤ v.val := hu
  have hM : 0 < M := by
    have hp : 1 < 2 ^ u := one_lt_pow₀ (by decide) (by omega)
    dsimp [M]
    omega
  have hr : r < 2 ^ v.val - 1 := Nat.mod_lt t hM
  obtain ⟨E, hE0, hE, hsE⟩ := exists_early_returns v hv r hr
  have hb : ∀ i ∈ binaryPositions Q, (u + 1) + i < R + 1 := by
    intro i hi
    have := binaryPositions_lt_length hi
    dsimp [R]
    omega
  let L := shiftedPositions (binaryPositions Q) (u + 1) hb
  have hL0 : 0 ∉ L := shiftedPositions_zero_not_mem _ _ _ (by omega)
  have hL : ∀ j ∈ L, v < j := by
    intro j hj
    obtain ⟨i, _, he⟩ := shiftedPositions_mem_val _ _ _ hj
    change u < j.val
    omega
  have hdis : Disjoint E L := disjoint_left.mpr (by
    intro j hj hj'
    exact (not_lt_of_ge (hE j hj)) (hL j hj'))
  have hcL : L.card = binaryWeight Q := by
    dsimp only [L]
    rw [shiftedPositions_card, binaryPositions_card]
  have hsL : (∑ j ∈ L, pathCount (withoutOneArc v) j) = M * Q := by
    calc
      (∑ j ∈ L, pathCount (withoutOneArc v) j) =
          ∑ i ∈ binaryPositions Q, M * 2 ^ i := by
        apply shiftedPositions_sum
        intro i hi
        have hij : v < (⟨(u + 1) + i, hb i hi⟩ : Fin (R + 1)) := by
          change u < (u + 1) + i
          omega
        rw [pathCount_deleted_after v _ hv hij]
        have hexp : ((u + 1) + i) - u - 1 = i := by omega
        change (2 ^ u - 1) * 2 ^ (((u + 1) + i) - u - 1) = M * 2 ^ i
        rw [hexp]
      _ = M * ∑ i ∈ binaryPositions Q, 2 ^ i := (mul_sum _ _ _).symm
      _ = M * Q := by rw [binaryPositions_sum]
  refine ⟨R, v, E ∪ L, rfl, ?_, ?_, ?_⟩
  · simp [hE0, hL0]
  · change binaryWeight Q ≤ (E ∪ L).card
    rw [← hcL]
    exact card_le_card subset_union_right
  · rw [sum_union hdis, hsE, hsL]
    exact Nat.mod_add_div t M

end HartkeMatchingExcess
