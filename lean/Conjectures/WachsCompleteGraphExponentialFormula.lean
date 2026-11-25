module
public import Conjectures.WachsCompleteGraphEGFTally
public import Mathlib.Tactic.Ring

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

omit [CharZero K] in
theorem canonical_tally_empty (w : ℕ → K) (k : ℕ) :
    canonicalPartitionWeightSum w 0 k = if k=0 then 1 else 0 := by
  classical
  let S : Finset (Fin 0) := Finset.univ
  have hS : S = ⊥ := by ext a; exact Fin.elim0 a
  have hp (P : Finpartition S) : P.parts = ∅ := Finpartition.parts_eq_empty_iff.mpr hS
  let _ : Unique (Finpartition S) :=
    ⟨⟨⊥⟩,fun P => Finpartition.ext ((hp P).trans (hp ⊥).symm)⟩
  change partitionWeightSum w S k = _
  rw [partitionWeightSum,Finset.sum_filter]
  simp only [hp,Finset.card_empty,Finset.prod_empty,Finset.sum_const]
  by_cases hk : k=0 <;> simp [hk,eq_comm]

omit [CharZero K] in
theorem canonical_tally_no_parts (w : ℕ → K) (n : ℕ) :
    canonicalPartitionWeightSum w (n+1) 0 = 0 := by
  classical
  unfold canonicalPartitionWeightSum partitionWeightSum
  apply Finset.sum_eq_zero
  intro P h
  have hp := Finset.card_eq_zero.mp (Finset.mem_filter.mp h).2
  have he := P.parts_eq_empty_iff.mp hp
  have hN : (0 : Fin (n+1)) ∈ (Finset.univ : Finset (Fin (n+1))) := Finset.mem_univ _
  rw [he] at hN
  exact (Finset.notMem_empty _ hN).elim

omit [CharZero K] in
theorem constant_tallyEGF (w : ℕ → K) (k : ℕ) :
    constantCoeff (tallyEGF w k) = if k=0 then 1 else 0 := by
  rw [← coeff_zero_eq_constantCoeff]
  simp [tallyEGF,canonical_tally_empty]

theorem tally_zero_eq_one (w : ℕ → K) : tallyEGF w 0 = 1 := by
  ext n
  cases n with
  | zero => simp [tallyEGF,canonical_tally_empty]
  | succ n => simp [tallyEGF,canonical_tally_no_parts]

omit [CharZero K] in
theorem constant_blockEGF (w : ℕ → K) : constantCoeff (blockEGF w) = 0 := by
  simp [blockEGF]

/-- The exponential formula for weighted set partitions, with weights
depending on block size and a specified number of blocks. -/
theorem tallyEGF_eq_pow (w : ℕ → K) (k : ℕ) :
    tallyEGF w k = C (1/(k.factorial:K)) * (blockEGF w)^k := by
  induction k with
  | zero => simp [tally_zero_eq_one]
  | succ k ih =>
    apply derivative.ext
    · rw [tally_derivative,ih,Derivation.leibniz,derivative_C,smul_zero,add_zero,
        Algebra.smul_def,Algebra.algebraMap_self,RingHom.id_apply,derivative_pow]
      simp only [Nat.add_sub_cancel]
      have hc : (((k+1:ℕ):K⟦X⟧)) = C (((k+1:ℕ):K)) := by simp
      have h : (1/((k+1).factorial:K)) * ((k+1:ℕ):K) = 1/(k.factorial:K) := by
        rw [Nat.factorial_succ,Nat.cast_mul]
        field_simp
      rw [hc,← mul_assoc (C _) (C _ * _),← mul_assoc (C _) (C _),← map_mul,h]
      ring
    · rw [constant_tallyEGF,map_mul,map_pow,constant_blockEGF]
      simp

end WachsCompleteGraph
