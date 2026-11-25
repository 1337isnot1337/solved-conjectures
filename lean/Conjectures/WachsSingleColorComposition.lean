module
public import Conjectures.WachsCompleteGraphActualLaguerre

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

noncomputable def singleBlockWeight (t : ℝ) (n : ℕ) : ℝ :=
  (canonicalBlockTotal 1 n:ℝ)*t^(n-1)

noncomputable def singleForcingWeight (t : ℝ) (n : ℕ) : ℝ :=
  if n=0 then 0 else t^(n-1)

noncomputable def singleForcing (t : ℝ) : PowerSeries ℝ :=
  blockEGF (singleForcingWeight t)

noncomputable def singleBlockSeries (t : ℝ) : PowerSeries ℝ :=
  blockEGF (singleBlockWeight t)

theorem singleForcing_coeff (t : ℝ) (n : ℕ) :
    coeff n (singleForcing t) = singleForcingWeight t n/(n.factorial:ℝ) := by
  cases n <;> simp [singleForcing,blockEGF,singleForcingWeight]

theorem singleBlockProduct (t : ℝ) {n : ℕ} (π : CompletePartition n) :
    (∏ b ∈ π.parts, singleBlockWeight t b.card) =
      (∏ b ∈ π.parts, (canonicalBlockTotal 1 b.card : ℝ)) * t^(n-π.parts.card) := by
  simp_rw [singleBlockWeight]
  rw [Finset.prod_mul_distrib,Finset.prod_pow_eq_pow_sum,sum_block_ranks]

theorem single_moebius_zero {n : ℕ} (hn : 1<n) :
    (∑ π : CompletePartition n, ∏ b ∈ π.parts, (canonicalBlockTotal 1 b.card:ℝ)) = 0 := by
  have h := congrArg (Int.castRingHom ℝ) (canonical_total_recurrence 0 n hn)
  simp only [zero_add,map_sum,map_prod,map_mul,map_zero,Int.coe_castRingHom] at h
  have hchoose (m : ℕ) : (1+m-1).choose m = 1 := by rw [show 1+m-1=m by omega,Nat.choose_self]
  norm_num [hchoose] at h
  rw [← h]
  apply Finset.sum_congr rfl
  intro π _
  exact (Finset.prod_coe_sort π.parts (fun b : Finset (Fin n) => (canonicalBlockTotal 1 b.card:ℝ))).symm

theorem single_moebius_weighted_zero (t : ℝ) {n : ℕ} (hn : 1<n) :
    (∑ π : CompletePartition n, singleForcingWeight t π.parts.card *
      ∏ b ∈ π.parts, singleBlockWeight t b.card)=0 := by
  classical
  have hπ (π : CompletePartition n) :
      singleForcingWeight t π.parts.card * (∏ b ∈ π.parts, singleBlockWeight t b.card) =
      (∏ b ∈ π.parts, (canonicalBlockTotal 1 b.card:ℝ))*t^(n-1) := by
    have hn0 : 0<n := by omega
    have h : (Finset.univ : Finset (Fin n)) ≠ ⊥ := by
      intro he
      have hh : (⟨0,hn0⟩ : Fin n)∈(Finset.univ : Finset (Fin n)) := Finset.mem_univ _
      rw [he] at hh
      exact (Finset.notMem_empty _ hh).elim
    have hp : 0<π.parts.card := Finset.card_pos.mpr (π.parts_nonempty h)
    have hle := partition_card_le n π
    have hr : n-1=(π.parts.card-1)+(n-π.parts.card) := by omega
    rw [singleForcingWeight,ite_eq_right hp.ne',singleBlockProduct,hr,pow_add]
    ring
  simp_rw [hπ]
  rw [← Finset.sum_mul,single_moebius_zero hn,zero_mul]

theorem single_forcing_comp_actual (t : ℝ) :
    (singleForcing t).subst (singleBlockSeries t) = (X : PowerSeries ℝ) := by
  ext n
  cases n with
  | zero =>
    rw [singleBlockSeries,coeff_subst_zero_constant_range _ _ (constant_blockEGF _),Finset.sum_range_one,singleForcing_coeff]
    simp [singleForcingWeight]
  | succ n =>
    cases n with
    | zero =>
      rw [singleBlockSeries,coeff_subst_zero_constant_range _ _ (constant_blockEGF _),Finset.sum_range_succ,Finset.sum_range_one]
      simp [singleBlockWeight,singleForcing_coeff,singleForcingWeight,
        blockEGF,canonicalBlockTotal_one]
    | succ n =>
      rw [singleBlockSeries,coeff_subst_blockEGF _ _ _ (singleForcing_coeff t),
        single_moebius_weighted_zero t (by omega),zero_div,coeff_X]
      exact (ite_eq_right (by omega)).symm

end WachsCompleteGraph
