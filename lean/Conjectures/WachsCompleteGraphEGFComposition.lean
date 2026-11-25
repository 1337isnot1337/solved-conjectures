module
public import Conjectures.WachsCompleteGraphRankTally
public import Conjectures.WachsLagrangeSubstitution

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

omit [CharZero K] in
theorem coeff_subst_zero_constant_range (B F : K⟦X⟧) (hB : constantCoeff B = 0) (n : ℕ) :
    coeff n (F.subst B) = ∑ j ∈ Finset.range (n+1), coeff j F * coeff n (B^j) := by
  obtain ⟨U,rfl⟩ := (PowerSeries.X_dvd_iff.mpr hB)
  exact coeff_subst_X_mul_range U F n n le_rfl

/-- The coefficient version of the labeled exponential composition rule,
using actual weighted set partitions as the coefficient on the right. -/
theorem coeff_subst_blockEGF (F : K⟦X⟧) (w a : ℕ → K)
    (hF : ∀ k, coeff k F = a k/(k.factorial:K)) (n : ℕ) :
    coeff n (F.subst (blockEGF w)) =
      (∑ π : CompletePartition n, a π.parts.card * ∏ b ∈ π.parts,w b.card)/(n.factorial:K) := by
  rw [coeff_subst_zero_constant_range _ _ (constant_blockEGF w)]
  rw [← partition_sum_blockCount w a n,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro j _
  have h := congrArg (coeff n) (tallyEGF_eq_pow w j)
  rw [tallyEGF,coeff_mk,coeff_C_mul] at h
  rw [hF j]
  calc
    _ = a j * (1/(j.factorial:K) * coeff n (blockEGF w ^ j)) := by ring
    _ = a j * (canonicalPartitionWeightSum w n j/(n.factorial:K)) := congrArg (a j * ·) h.symm
    _ = _ := by ring

end WachsCompleteGraph
