import Conjectures.EkhadZeilbergerOverlapCovariance
import Conjectures.EkhadZeilbergerInterior

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

variable {α : Type*} [Fintype α] [DecidableEq α] [Nonempty α]

omit [Fintype α] [DecidableEq α] [Nonempty α] in
def lagBias {n : ℕ} (t : ℝ) (A B : Fin (n+2)→α) : ℝ :=
  ∑ d ∈ Finset.range (n+1), ((d+1:ℕ):ℝ)*overlapContrast t A B (d+1)

omit [Fintype α] [DecidableEq α] [Nonempty α] in
theorem contrast_sum {n : ℕ} (t : ℝ) (A B : Fin (n+2)→α) :
    (∑ d ∈ Finset.range (n+1),overlapContrast t A B (d+1)) = wordVariance t A B-1 := by
  unfold overlapContrast wordVariance overlapWeight
  simp only [Finset.sum_sub_distrib,Finset.sum_add_distrib]
  ring

/-- Exact finite variance with an explicit, sample-size-independent boundary correction. -/
theorem signed_window_variance_identity {N n : ℕ} (A B : Fin (n+2)→α) (hab : A≠B)
    (hN : n+1 ≤ N) :
    uniformAverage (fun x => (∑ i : Fin N,windowDifference A B i x)^2) =
      2*(letterWeight α)^(n+2)*((N:ℝ)*wordVariance (letterWeight α) A B -
        lagBias (letterWeight α) A B) := by
  let t := letterWeight α
  rw [signed_window_total_second_moment A B hab]
  change (N:ℝ)*signedLagMoment t A B 0 +
      2*∑ d ∈ Finset.range N,((N:ℝ)-(d+1:ℕ))*signedLagMoment t A B (d+1) = _
  have hsum :
      (∑ d ∈ Finset.range N,((N:ℝ)-(d+1:ℕ))*signedLagMoment t A B (d+1)) =
        ∑ d ∈ Finset.range (n+1),((N:ℝ)-(d+1:ℕ))*signedLagMoment t A B (d+1) := by
    symm
    apply Finset.sum_subset (Finset.range_mono hN)
    intro d hd hd'
    have hnot : ¬ d+1 ≤ n+1 := by
      rw [Finset.mem_range] at hd'
      omega
    simp [signedLagMoment,hnot]
  rw [hsum]
  have he (d : ℕ) (hd : d ∈ Finset.range (n+1)) :
      ((N:ℝ)-(d+1:ℕ))*signedLagMoment t A B (d+1) =
        (N:ℝ)*t^(n+2)*overlapContrast t A B (d+1) -
          t^(n+2)*(((d+1:ℕ):ℝ)*overlapContrast t A B (d+1)) := by
    have hd' : d+1≤n+1 := Nat.succ_le_of_lt (Finset.mem_range.mp hd)
    rw [signedLagMoment]
    simp only [Nat.succ_ne_zero,hd',ite_false,ite_true]
    ring
  rw [Finset.sum_congr rfl he,Finset.sum_sub_distrib,← Finset.mul_sum,← Finset.mul_sum,
    contrast_sum]
  simp only [signedLagMoment,ite_true]
  change (N:ℝ)*(2*t^(n+2)) +
      2*((N:ℝ)*t^(n+2)*(wordVariance t A B-1) - t^(n+2)*lagBias t A B) =
      2*t^(n+2)*((N:ℝ)*wordVariance t A B-lagBias t A B)
  ring

omit [DecidableEq α] in
theorem letterWeight_pos : 0 < letterWeight α := by
  unfold letterWeight
  apply inv_pos.mpr
  exact Nat.cast_pos.mpr Fintype.card_pos

/-- Match the finite endpoint variance bound directly with the source overlap
expression; no unformalized probabilistic limit theorem is needed. -/
theorem wordVariance_ge_of_distinct_interiors {n : ℕ} (A B : Fin (n+2)→α)
    (q : Fin (n+2)) (hq : q ∉ endpointSet n) (hab : A q ≠ B q) :
    (1-letterWeight α)^2 ≤ wordVariance (letterWeight α) A B := by
  let t := letterWeight α
  let V := wordVariance t A B
  let C := lagBias t A B
  have hAB : A ≠ B := fun h => hab (congrFun h q)
  by_contra! hg
  have hd : 0 < (1-t)^2-V := by dsimp [V,t]; linarith
  obtain ⟨K,hK⟩ := exists_nat_gt (-C / ((1-t)^2-V))
  let N := max K (n+1)
  have hN : n+1 ≤ N := le_max_right _ _
  have hNK : (K:ℝ)≤(N:ℝ) := Nat.cast_le.mpr (le_max_left _ _)
  have hbad : -C < (N:ℝ)*((1-t)^2-V) :=
    (div_lt_iff₀ hd).mp (hK.trans_le hNK)
  have H := projected_window_variance_lower (N:=N) A B q hq hab
  rw [signed_window_variance_identity A B hAB hN] at H
  change (N:ℝ)*2*t^(n+2)*(1-t)^2 ≤ 2*t^(n+2)*((N:ℝ)*V-C) at H
  have hpos : 0 < 2*t^(n+2) := mul_pos (by norm_num) (pow_pos letterWeight_pos _)
  have hgood : (N:ℝ)*(1-t)^2 ≤ (N:ℝ)*V-C := by
    apply le_of_mul_le_mul_left ?_ hpos
    calc
      _ = (N:ℝ)*2*t^(n+2)*(1-t)^2 := by ring
      _ ≤ _ := H
  nlinarith

end
end EkhadZeilberger
