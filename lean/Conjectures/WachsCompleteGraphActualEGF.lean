module
public import Conjectures.WachsCompleteGraphEGFComposition
public import Conjectures.WachsCompleteGraphCanonicalUnit

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

noncomputable def rankBlockWeight (p : ℕ) (t : ℝ) (m : ℕ) : ℝ :=
  (canonicalBlockTotal (p+2) m : ℝ)*t^(m-1)

noncomputable def rankForcingWeight (p : ℕ) (t : ℝ) (k : ℕ) : ℝ :=
  if k=0 then 0 else ((p+k).choose (k-1):ℝ)*t^(k-1)

theorem completeGraphForcing_factorial_coeff (p : ℕ) (t : ℝ) (k : ℕ) :
    coeff k (completeGraphForcing p t) = rankForcingWeight p t k/(k.factorial:ℝ) := by
  cases k with
  | zero => simp [completeGraphForcing,rankForcingWeight]
  | succ k =>
    rw [completeGraphForcing_explicit_coeff,rankForcingWeight]
    simp only [Nat.succ_ne_zero,ite_false,Nat.succ_sub_one,map_div₀,map_natCast]
    ring

theorem rankBlockProduct (p : ℕ) (t : ℝ) {n : ℕ} (π : CompletePartition n) :
    (∏ b ∈ π.parts, rankBlockWeight p t b.card) =
      (∏ b ∈ π.parts, (canonicalBlockTotal (p+2) b.card : ℝ)) * t^(n-π.parts.card) := by
  simp_rw [rankBlockWeight]
  rw [Finset.prod_mul_distrib,Finset.prod_pow_eq_pow_sum,sum_block_ranks]

theorem rank_forcing_moebius_zero (p : ℕ) (t : ℝ) {n : ℕ} (hn : 1<n) :
    (∑ π : CompletePartition n, rankForcingWeight p t π.parts.card *
      ∏ b ∈ π.parts,rankBlockWeight p t b.card) = 0 := by
  classical
  have hc := congrArg (Int.castRingHom ℝ) (canonical_total_recurrence (p+1) n hn)
  simp only [map_sum,map_mul,map_prod,map_zero,Int.coe_castRingHom,Int.cast_natCast] at hc
  have he (π : CompletePartition n) :
      rankForcingWeight p t π.parts.card * (∏ b ∈ π.parts,rankBlockWeight p t b.card) =
        ((((p+1)+1+(π.parts.card-1)-1).choose (π.parts.card-1):ℝ) *
          ∏ b : π.parts, (canonicalBlockTotal ((p+1)+1) b.val.card:ℝ)) * t^(n-1) := by
    have hn0 : 0<n := by omega
    have he : (Finset.univ : Finset (Fin n)) ≠ ⊥ := by
      intro h
      have hh : (⟨0,hn0⟩ : Fin n) ∈ (Finset.univ : Finset (Fin n)) := Finset.mem_univ _
      rw [h] at hh
      exact (Finset.notMem_empty _ hh).elim
    have hpos : 0 < π.parts.card := Finset.card_pos.mpr (π.parts_nonempty he)
    have hle := partition_card_le n π
    have hidx : p+π.parts.card = (p+1)+1+(π.parts.card-1)-1 := by omega
    have hrank : (π.parts.card-1)+(n-π.parts.card) = n-1 := by omega
    have hp :
        (∏ b : π.parts, (canonicalBlockTotal ((p+1)+1) b.val.card:ℝ)) =
        ∏ b ∈ π.parts, (canonicalBlockTotal ((p+1)+1) b.card:ℝ) :=
      Finset.prod_coe_sort π.parts (fun b : Finset (Fin n) =>
        (canonicalBlockTotal ((p+1)+1) b.card:ℝ))
    rw [rankForcingWeight,ite_eq_right (by omega : π.parts.card ≠ 0),rankBlockProduct,hidx,hp]
    rw [← hrank,pow_add t]
    ring
  simp_rw [he]
  rw [← Finset.sum_mul,hc,zero_mul]

theorem actualRankEGF_comp_forcing (p : ℕ) (t : ℝ) :
    (completeGraphForcing p t).subst (blockEGF (rankBlockWeight p t)) = X := by
  ext n
  cases n with
  | zero =>
    rw [coeff_subst_zero_constant_range _ _ (constant_blockEGF _),Finset.sum_range_one]
    simp [completeGraphForcing]
  | succ n =>
    cases n with
    | zero =>
      rw [coeff_subst_zero_constant_range _ _ (constant_blockEGF _)]
      have hs : coeff 1 (blockEGF (rankBlockWeight p t)) = 1 := by
        simp [blockEGF,rankBlockWeight,canonicalBlockTotal_one]
      have hf : coeff 1 (completeGraphForcing p t) = 1 := by
        simp [completeGraphForcing_factorial_coeff,rankForcingWeight]
      rw [Finset.sum_range_succ,Finset.sum_range_one]
      simp [hs,hf]
    | succ n =>
      rw [coeff_subst_blockEGF _ _ _ (completeGraphForcing_factorial_coeff p t),
        rank_forcing_moebius_zero p t (by omega),zero_div]
      rw [coeff_X]
      exact ite_eq_right (by omega) |>.symm

end WachsCompleteGraph
