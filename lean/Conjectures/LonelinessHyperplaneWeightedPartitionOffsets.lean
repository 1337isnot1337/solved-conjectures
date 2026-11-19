import Conjectures.LonelinessHyperplaneWeightedPartitions

/-! Offset and upper-bound terms for the one-relation counting problem.
All counts are cardinalities of actual solution types. In particular,
the strict upper-bound violation is translated by N+1, not by N. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def shiftedWeightedPartition (a : ι → ℕ) (offset n : ℕ) : Type _ :=
  {x : ι → ℕ // (∑ i, a i * x i) + offset = n}

def shiftedWeightedPartitionEquiv
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (offset n : ℕ) :
    shiftedWeightedPartition a offset n ≃
      Σ r : remainderVectors a M,
        shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) n := by
  by_cases hoffset : offset ≤ n
  · let e₁ : shiftedWeightedPartition a offset n ≃ weightedPartition a (n - offset) :=
      Equiv.subtypeEquivRight (fun x => by
        omega)
    let e₂ := weightedPartitionEquiv a ha M hM hdiv (n - offset)
    let e₃ : (Σ r : remainderVectors a M,
        shiftedWeakComposition (ι := ι) M (remainderWeight a M r) (n - offset)) ≃
        Σ r : remainderVectors a M,
          shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) n :=
      Equiv.sigmaCongrRight (fun r => Equiv.subtypeEquivRight (fun q => by
        omega))
    exact e₁.trans (e₂.trans e₃)
  · letI : IsEmpty (shiftedWeightedPartition a offset n) := ⟨by
      rintro ⟨x, hx⟩
      omega⟩
    letI (r : remainderVectors a M) :
        IsEmpty (shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) n) :=
      ⟨by rintro ⟨q, hq⟩; omega⟩
    exact Equiv.equivOfIsEmpty _ _

omit [DecidableEq ι] [Nonempty ι] in
theorem shiftedWeightedPartition_card_eq_sum
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (offset n : ℕ) :
    Nat.card (shiftedWeightedPartition a offset n) =
      ∑ r : remainderVectors a M,
        Nat.card (shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) n) := by
  let (r : remainderVectors a M) :
      Finite (shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) n) :=
    shiftedWeakComposition_finite M (remainderWeight a M r + offset) n hM
  rw [Nat.card_congr (shiftedWeightedPartitionEquiv a ha M hM hdiv offset n), Nat.card_sigma]

def subsetWeight (a : ι → ℕ) (S : Finset ι) : ℕ := ∑ i ∈ S, a i

def upperViolationPartition (a : ι → ℕ) (n N : ℕ) (S : Finset ι) : Type _ :=
  {x : weightedPartition a n // ∀ i ∈ S, N < x.1 i}

omit [Nonempty ι] in
private theorem sum_subset_indicator (a : ι → ℕ) (S : Finset ι) (L : ℕ) :
    (∑ i, if i ∈ S then L * a i else 0) = L * subsetWeight a S := by
  classical
  have hfilter : (Finset.univ : Finset ι).filter (fun i => i ∈ S) = S := by
    ext i
    simp
  rw [← Finset.sum_filter, hfilter, subsetWeight, Finset.mul_sum]

/-- Subtracting N+1 on each specified coordinate is a bijection from
their simultaneous upper-bound violation to an affine partition count. -/
def upperViolationPartitionEquiv
    (a : ι → ℕ) (n N : ℕ) (S : Finset ι) :
    upperViolationPartition a n N S ≃
      shiftedWeightedPartition a ((N + 1) * subsetWeight a S) n := by
  classical
  let L := N + 1
  let forward : upperViolationPartition a n N S →
      shiftedWeightedPartition a (L * subsetWeight a S) n := fun x =>
    ⟨fun i => if i ∈ S then x.1.1 i - L else x.1.1 i, by
      have hpoint : ∀ i,
          a i * (if i ∈ S then x.1.1 i - L else x.1.1 i) +
            (if i ∈ S then L * a i else 0) = a i * x.1.1 i := by
        intro i
        by_cases hi : i ∈ S
        · have hL : L ≤ x.1.1 i := x.2 i hi
          rw [ite_eq_left hi, ite_eq_left hi]
          calc
            _ = a i * (x.1.1 i - L + L) := by ring
            _ = _ := by rw [Nat.sub_add_cancel hL]
        · simp only [ite_eq_right hi, add_zero]
      calc
        _ = ∑ i, (a i * (if i ∈ S then x.1.1 i - L else x.1.1 i) +
            if i ∈ S then L * a i else 0) := by
          rw [Finset.sum_add_distrib, sum_subset_indicator]
        _ = ∑ i, a i * x.1.1 i := Finset.sum_congr rfl (fun i _ => hpoint i)
        _ = n := x.1.2⟩
  let backward : shiftedWeightedPartition a (L * subsetWeight a S) n →
      upperViolationPartition a n N S := fun y =>
    ⟨⟨fun i => if i ∈ S then y.1 i + L else y.1 i, by
        calc
          _ = ∑ i, (a i * y.1 i + if i ∈ S then L * a i else 0) := by
            apply Finset.sum_congr rfl
            intro i _
            by_cases hi : i ∈ S
            · simp only [ite_eq_left hi]
              ring
            · simp only [ite_eq_right hi, add_zero]
          _ = (∑ i, a i * y.1 i) + L * subsetWeight a S := by
            rw [Finset.sum_add_distrib, sum_subset_indicator]
          _ = n := y.2⟩, by
      intro i hi
      change N < if i ∈ S then y.1 i + L else y.1 i
      rw [ite_eq_left hi]
      dsimp only [L]
      omega⟩
  refine ⟨forward, backward, ?_, ?_⟩
  · intro x
    apply Subtype.ext
    apply Subtype.ext
    funext i
    change (if i ∈ S then (if i ∈ S then x.1.1 i - L else x.1.1 i) + L
      else (if i ∈ S then x.1.1 i - L else x.1.1 i)) = x.1.1 i
    by_cases hi : i ∈ S
    · simp only [ite_eq_left hi, Nat.sub_add_cancel (show L ≤ x.1.1 i from x.2 i hi)]
    · simp only [ite_eq_right hi]
  · intro y
    apply Subtype.ext
    funext i
    change (if i ∈ S then (if i ∈ S then y.1 i + L else y.1 i) - L
      else (if i ∈ S then y.1 i + L else y.1 i)) = y.1 i
    by_cases hi : i ∈ S
    · simp only [ite_eq_left hi, Nat.add_sub_cancel]
    · simp only [ite_eq_right hi]

omit [DecidableEq ι] [Nonempty ι] in
theorem remainderWeight_add_subsetWeight_lt
    (a : ι → ℕ) (_ha : ∀ i, 0 < a i) (M : ℕ)
    (hdiv : ∀ i, a i ∣ M) (r : remainderVectors a M) (S : Finset ι)
    (hS : subsetWeight a S < ∑ i, a i) :
    remainderWeight a M r + subsetWeight a S < Fintype.card ι * M := by
  have hpoint : ∀ i, a i * (r i : ℕ) + a i ≤ M := by
    intro i
    have h := Nat.mul_le_mul_left (a i) (Nat.succ_le_of_lt (r i).isLt)
    simpa only [Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one,
      Nat.mul_div_cancel' (hdiv i)] using h
  have hsum : remainderWeight a M r + (∑ i, a i) ≤ Fintype.card ι * M := by
    have h := Finset.sum_le_sum (fun i (_ : i ∈ (Finset.univ : Finset ι)) => hpoint i)
    simpa only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
      nsmul_eq_mul, Nat.cast_id, remainderWeight] using h
  omega

omit [Nonempty ι] in
theorem upperViolationPartition_card_zero
    (a : ι → ℕ) (c N : ℕ) (hc : 0 < c) (S : Finset ι)
    (hS : c ≤ subsetWeight a S) :
    Nat.card (upperViolationPartition a (c * N) N S) = 0 := by
  rw [Nat.card_congr (upperViolationPartitionEquiv a (c * N) N S)]
  let : IsEmpty (shiftedWeightedPartition a ((N + 1) * subsetWeight a S) (c * N)) :=
    ⟨by
      rintro ⟨x, hx⟩
      have hmul := Nat.mul_le_mul_left (N + 1) hS
      have hsum : (N + 1) * subsetWeight a S ≤ c * N := by omega
      have hcontra := hmul.trans hsum
      rw [Nat.add_mul, Nat.one_mul, Nat.mul_comm N c] at hcontra
      omega⟩
  exact Nat.card_of_isEmpty

omit [Nonempty ι] in
theorem upperViolationPartition_card_eq_shifted_sum
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (c N : ℕ) (S : Finset ι)
    (hS : subsetWeight a S < c) :
    Nat.card (upperViolationPartition a (c * N) N S) =
      ∑ r : remainderVectors a M,
        Nat.card (shiftedWeakComposition (ι := ι) M
          (remainderWeight a M r + subsetWeight a S) ((c - subsetWeight a S) * N)) := by
  rw [Nat.card_congr (upperViolationPartitionEquiv a (c * N) N S),
    shiftedWeightedPartition_card_eq_sum a ha M hM hdiv]
  apply Finset.sum_congr rfl
  intro r _
  apply Nat.card_congr
  apply Equiv.subtypeEquivRight
  intro q
  have hc : c = (c - subsetWeight a S) + subsetWeight a S :=
    (Nat.sub_add_cancel hS.le).symm
  constructor <;> intro h <;> nlinarith

/-- Multiplication of the argument preserves a quasipolynomial period.
The polynomial variable is the quotient along that progression. -/
theorem polynomial_on_progressions_mul
    (M : ℕ) (hM : 0 < M) (d k : ℕ) (f : ℕ → ℚ) (P : Fin M → ℚ[X])
    (hdegree : ∀ r, (P r).natDegree ≤ k)
    (heval : ∀ (r : Fin M) (n : ℕ), f (M * n + r) = (P r).eval (n : ℚ)) :
    ∃ Q : Fin M → ℚ[X],
      (∀ r, (Q r).natDegree ≤ k) ∧
      ∀ (r : Fin M) (n : ℕ), f (d * (M * n + r)) = (Q r).eval (n : ℚ) := by
  let phase : Fin M → Fin M := fun r => ⟨(d * (r : ℕ)) % M, Nat.mod_lt _ hM⟩
  let Q : Fin M → ℚ[X] := fun r => (P (phase r)).comp
    (C (d : ℚ) * X + C (((d * (r : ℕ)) / M : ℕ) : ℚ))
  refine ⟨Q, ?_, ?_⟩
  · intro r
    apply natDegree_comp_le.trans
    have hlinear :
        (C (d : ℚ) * X + C (((d * (r : ℕ)) / M : ℕ) : ℚ)).natDegree ≤ 1 := by
      apply (natDegree_add_le _ _).trans
      apply max_le
      · exact (natDegree_C_mul_le _ _).trans natDegree_X_le
      · simp only [natDegree_C]
        decide
    calc
      (P (phase r)).natDegree *
          (C (d : ℚ) * X + C (((d * (r : ℕ)) / M : ℕ) : ℚ)).natDegree ≤
            k * 1 := Nat.mul_le_mul (hdegree _) hlinear
      _ = k := Nat.mul_one _
  · intro r n
    have harg : d * (M * n + (r : ℕ)) =
        M * (d * n + (d * (r : ℕ)) / M) + (phase r : ℕ) := by
      have h := Nat.mod_add_div (d * (r : ℕ)) M
      dsimp only [phase]
      nlinarith
    rw [harg, heval]
    simp only [Q, eval_comp, eval_add, eval_mul, eval_C, eval_X,
      Nat.cast_add, Nat.cast_mul]

theorem upperViolationPartition_polynomial_on_progressions
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (c : ℕ) (hc : 0 < c)
    (hctotal : c ≤ ∑ i, a i) (S : Finset ι) :
    ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (upperViolationPartition a (c * (M * n + r)) (M * n + r) S) : ℚ) =
          (P r).eval (n : ℚ) := by
  classical
  by_cases hS : c ≤ subsetWeight a S
  · refine ⟨fun _ => 0, ?_, ?_⟩
    · intro r
      simp only [natDegree_zero]
      exact Nat.zero_le _
    · intro r n
      rw [upperViolationPartition_card_zero a c (M * n + r) hc S hS]
      simp only [Nat.cast_zero, eval_zero]
  · have hSlt : subsetWeight a S < c := lt_of_not_ge hS
    have hterm : ∀ t : remainderVectors a M,
        ∃ P : Fin M → ℚ[X],
          (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
          ∀ (r : Fin M) (n : ℕ),
            (Nat.card (shiftedWeakComposition (ι := ι) M
              (remainderWeight a M t + subsetWeight a S)
              ((c - subsetWeight a S) * (M * n + r))) : ℚ) = (P r).eval (n : ℚ) := by
      intro t
      have hT := remainderWeight_add_subsetWeight_lt a ha M hdiv t S
        (hSlt.trans_le hctotal)
      obtain ⟨P, hdegree, heval⟩ := shiftedWeakComposition_polynomial_on_progressions
        (ι := ι) M (remainderWeight a M t + subsetWeight a S) hM hT
      exact polynomial_on_progressions_mul M hM (c - subsetWeight a S)
        (Fintype.card ι - 1)
        (fun N => (Nat.card (shiftedWeakComposition (ι := ι) M
          (remainderWeight a M t + subsetWeight a S) N) : ℚ)) P hdegree heval
    choose P hdegree heval using hterm
    refine ⟨fun r => ∑ t : remainderVectors a M, P t r, ?_, ?_⟩
    · intro r
      exact Polynomial.natDegree_sum_le_of_forall_le _ _ (fun t _ => hdegree t r)
    · intro r n
      rw [upperViolationPartition_card_eq_shifted_sum a ha M hM hdiv c
        (M * n + r) S hSlt, Nat.cast_sum, Polynomial.eval_finsetSum]
      apply Finset.sum_congr rfl
      intro t _
      exact heval t r n

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
