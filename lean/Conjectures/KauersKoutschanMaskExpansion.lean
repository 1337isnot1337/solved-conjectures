import Conjectures.KauersKoutschanTraceCoefficients
import Conjectures.KauersKoutschanCertificate

/-! The two column numerators give exactly the sixteen source masks. -/

open scoped BigOperators

namespace KauersKoutschan

open PowerSeries
open KauersKoutschanCertificate (bit)

private theorem bit_le_one (m i : ℕ) : bit m i ≤ 1 := by unfold bit; omega

private noncomputable def columnChoice (p : ℕ) (k : Fin 4) : rowMarkedWeights :=
  if bit k 0 + bit k 1 ≤ p then
    MvPolynomial.C (rowMarker 0 ^ bit k 0 * rowMarker 1 ^ bit k 1) *
      markedHomogeneous (p - bit k 0 - bit k 1)
  else 0

private theorem markedColumn_coeff_choices (p : ℕ) :
    PowerSeries.coeff p markedColumns = ∑ k : Fin 4, columnChoice p k := by
  rw [show markedColumns = signedColumnSeries (MvPolynomial.C (rowMarker 0)) (MvPolynomial.C (rowMarker 1))
    (MvPolynomial.X 0) (MvPolynomial.X 1) by rfl, signedColumnSeries_coeff]
  dsimp only
  let u : rowMarkedWeights := MvPolynomial.C (rowMarker 0)
  let v : rowMarkedWeights := MvPolynomial.C (rowMarker 1)
  let a : rowMarkedWeights := MvPolynomial.X 0
  let b : rowMarkedWeights := MvPolynomial.X 1
  have hd : (1 - a - b) * u * v = MvPolynomial.C (rowMarker 0 * rowMarker 1) * (1 - a - b) := by
    unfold u v
    rw [map_mul]
    ring
  have ht : (a - 1) * u + (b - 1) * v = u * (a - 1) + v * (b - 1) := by ring
  change ((traceComplete ((1 - a - b) * u * v) p).eval ((a - 1) * u + (b - 1) * v)) + _ + _ = _
  rw [hd, ht]
  change markedHomogeneous p + (if 1 ≤ p then (u + v) * markedHomogeneous (p - 1) else 0) +
    (if 2 ≤ p then (u * v) * markedHomogeneous (p - 2) else 0) = _
  rw [Fin.sum_univ_succ]
  simp [Fin.sum_univ_succ, columnChoice, bit, u, v, Nat.sub_sub]
  split_ifs <;> ring

private def columnsOfMask : Fin 16 ≃ Fin 4 × Fin 4 where
  toFun m :=
    ⟨⟨bit m 0 + 2 * bit m 2, by have := bit_le_one m 0; have := bit_le_one m 2; omega⟩,
      ⟨bit m 1 + 2 * bit m 3, by have := bit_le_one m 1; have := bit_le_one m 3; omega⟩⟩
  invFun k :=
    ⟨(k.1 : ℕ) % 2 + 2 * ((k.2 : ℕ) % 2) + 4 * ((k.1 : ℕ) / 2) + 8 * ((k.2 : ℕ) / 2), by
      have := k.1.isLt
      have := k.2.isLt
      omega⟩
  left_inv m := by fin_cases m <;> decide
  right_inv k := by rcases k with ⟨i, j⟩; fin_cases i <;> fin_cases j <;> decide

private theorem columnsOfMask_bits (m : Fin 16) :
    bit (columnsOfMask m).1 0 = bit m 0 ∧
      bit (columnsOfMask m).1 1 = bit m 2 ∧
      bit (columnsOfMask m).2 0 = bit m 1 ∧
      bit (columnsOfMask m).2 1 = bit m 3 := by
  fin_cases m <;> decide

/-- The polynomial contribution of the mask before taking the factorial moment. -/
noncomputable def maskWeight (p q m : ℕ) : rowMarkedWeights :=
  let a := bit m 0
  let b := bit m 1
  let c := bit m 2
  let d := bit m 3
  if a + c ≤ p ∧ b + d ≤ q then
    MvPolynomial.C (rowMarker 0 ^ (a + b) * rowMarker 1 ^ (c + d)) *
      (markedHomogeneous (p - a - c) * markedHomogeneous (q - b - d))
  else 0

theorem markedColumns_product_mask (p q : ℕ) :
    PowerSeries.coeff p markedColumns * PowerSeries.coeff q markedColumns =
      ∑ m : Fin 16, maskWeight p q m := by
  rw [markedColumn_coeff_choices, markedColumn_coeff_choices, Finset.sum_mul]
  simp_rw [Finset.mul_sum]
  rw [← Fintype.sum_prod_type (fun k : Fin 4 × Fin 4 => columnChoice p k.1 * columnChoice q k.2)]
  apply Fintype.sum_equiv columnsOfMask.symm
  intro k
  let m := columnsOfMask.symm k
  have hk : columnsOfMask m = k := columnsOfMask.apply_symm_apply k
  change columnChoice p k.1 * columnChoice q k.2 = maskWeight p q m
  rw [← hk]
  obtain ⟨h₀, h₁, h₂, h₃⟩ := columnsOfMask_bits m
  dsimp [columnChoice, maskWeight]
  rw [h₀, h₁, h₂, h₃]
  by_cases hp : bit m 0 + bit m 2 ≤ p <;> by_cases hq : bit m 1 + bit m 3 ≤ q <;>
    simp [hp, hq, pow_add, map_mul]
  ring

end KauersKoutschan
