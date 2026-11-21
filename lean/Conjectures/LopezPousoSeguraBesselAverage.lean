import Conjectures.LopezPousoSeguraBesselMidpoint

namespace BesselWeights

noncomputable def weightSum (w : ℕ → ℝ) (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, w k
noncomputable def momentSum (w lam : ℕ → ℝ) (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, w k * lam k
noncomputable def weightedSum (w c : ℕ → ℝ) (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, w k * c k

lemma weightSum_succ (w : ℕ → ℝ) (n : ℕ) : weightSum w (n+1) = weightSum w n + w n := by
  simp [weightSum, Finset.sum_range_succ]
lemma momentSum_succ (w l : ℕ → ℝ) (n : ℕ) : momentSum w l (n+1) = momentSum w l n + w n*l n := by
  simp [momentSum, Finset.sum_range_succ]
lemma weightedSum_succ (w c : ℕ → ℝ) (n : ℕ) : weightedSum w c (n+1) = weightedSum w c n + w n*c n := by
  simp [weightedSum, Finset.sum_range_succ]

theorem moment_identity (w lam c : ℕ → ℝ)
    (hc : ∀ n, c n = 2*weightSum w n + w n - lam n/2) :
    ∀ n, momentSum w lam n = 2*(weightSum w n)^2 - 2*weightedSum w c n := by
  intro n
  induction n with
  | zero => simp [weightSum, momentSum, weightedSum]
  | succ n ih =>
    rw [momentSum_succ, weightSum_succ, weightedSum_succ, ih, hc n]
    ring

noncomputable def weightedMean (w c : ℕ → ℝ) (n : ℕ) : ℝ := weightedSum w c (n+1)/weightSum w (n+1)

theorem source_K_is_mean (w lam c : ℕ → ℝ) (n : ℕ)
    (hw : ∀ k, 0 < w k)
    (hc : ∀ k, c k = 2*weightSum w k + w k - lam k/2) :
    weightSum w (n+1) - momentSum w lam (n+1)/(2*weightSum w (n+1)) = weightedMean w c n := by
  have hpos : 0 < weightSum w (n+1) := by
    rw [weightSum_succ]
    have hn : 0 ≤ weightSum w n := Finset.sum_nonneg (by intro i hi; exact (hw i).le)
    linarith [hw n]
  rw [moment_identity w lam c hc]
  unfold weightedMean
  field_simp
  ring

lemma weightSum_nonnegative (w : ℕ → ℝ) (hw : ∀ k, 0 < w k) (n : ℕ) : 0 ≤ weightSum w n := by
  exact Finset.sum_nonneg (by intro i hi; exact (hw i).le)

lemma weightSum_positive (w : ℕ → ℝ) (hw : ∀ k, 0 < w k) (n : ℕ) : 0 < weightSum w (n+1) := by
  rw [weightSum_succ]
  linarith [weightSum_nonnegative w hw n, hw n]

lemma weightedSum_positive (w c : ℕ → ℝ) (hw : ∀ k, 0 < w k) (hc : ∀ k, 0 < c k) (n : ℕ) :
    0 < weightedSum w c (n+1) := by
  rw [weightedSum_succ]
  have hn : 0 ≤ weightedSum w c n := Finset.sum_nonneg (by intro i hi; exact mul_nonneg (hw i).le (hc i).le)
  have hp := mul_pos (hw n) (hc n)
  linarith

lemma weightedSum_lt_next (w c : ℕ → ℝ) (hw : ∀ k, 0 < w k) (hc : StrictMono c) (n : ℕ) :
    weightedSum w c (n+1) < weightSum w (n+1) * c (n+1) := by
  induction n with
  | zero =>
    simp [weightedSum, weightSum]
    exact mul_lt_mul_of_pos_left (hc (by omega : 0 < 1)) (hw 0)
  | succ n ih =>
    rw [weightedSum_succ, weightSum_succ]
    have hs := weightSum_positive w hw n
    have hlt := hc (show n+1 < n+1+1 by omega)
    have hm := mul_lt_mul_of_pos_left hlt (add_pos hs (hw (n+1)))
    nlinarith

theorem weightedMean_positive_strictMono (w c : ℕ → ℝ)
    (hw : ∀ k, 0 < w k) (hc : ∀ k, 0 < c k) (hmono : StrictMono c) :
    (∀ n, 0 < weightedMean w c n) ∧ StrictMono (weightedMean w c) := by
  constructor
  · intro n
    exact div_pos (weightedSum_positive w c hw hc n) (weightSum_positive w hw n)
  · apply strictMono_nat_of_lt_succ
    intro n
    unfold weightedMean
    rw [weightedSum_succ w c (n+1), weightSum_succ w (n+1)]
    have hs := weightSum_positive w hw n
    have hs' : 0 < weightSum w (n+1)+w (n+1) := add_pos hs (hw (n+1))
    apply (div_lt_div_iff₀ hs hs').2
    have hlt := weightedSum_lt_next w c hw hmono n
    have hmul := mul_lt_mul_of_pos_right hlt (hw (n+1))
    nlinarith

noncomputable def sourceWeight (g : ℝ → ℝ) (n : ℕ) : ℝ := g (n+1)/4
noncomputable def sourceLambda (lam : ℝ → ℝ) (n : ℕ) : ℝ := lam (n+1)
noncomputable def sourceC (g lam : ℝ → ℝ) (n : ℕ) : ℝ := C g lam n
noncomputable def sourceK (g lam : ℝ → ℝ) (n : ℕ) : ℝ :=
  weightSum (sourceWeight g) (n+1) -
    momentSum (sourceWeight g) (sourceLambda lam) (n+1) / (2 * weightSum (sourceWeight g) (n+1))

theorem sourceK_positive_strictMono (g lam : ℝ → ℝ)
    (hg0 : g 0 = 0) (hl0 : lam 0 = 0)
    (hgp : ∀ n : ℕ, 0 < g (n+1))
    (hc : ∀ a : ℝ, 0 ≤ a → ContinuousOn g (Set.Icc a (a+1)))
    (hs : ∀ a : ℝ, 0 ≤ a → StrictConvexOn ℝ (Set.Icc a (a+1)) g)
    (hld : ContinuousOn lam (Set.Ici 0)) (hd : ∀ x > 0, HasDerivAt lam (g x) x) :
    (∀ n, 0 < sourceK g lam n) ∧ StrictMono (sourceK g lam) := by
  have hw : ∀ k, 0 < sourceWeight g k := by
    intro k
    exact div_pos (hgp k) (by norm_num)
  have hC := c_increasing_and_positive g lam hg0 hl0 hc hs hld hd
  have hCpos : ∀ k, 0 < sourceC g lam k := hC.1
  have hCmono : StrictMono (sourceC g lam) := hC.2
  have hform : ∀ k, sourceC g lam k = 2*weightSum (sourceWeight g) k + sourceWeight g k - sourceLambda lam k/2 := by
    intro k
    simpa [sourceC, sourceWeight, sourceLambda, weightSum] using C_source_formula g lam k
  have heq : sourceK g lam = weightedMean (sourceWeight g) (sourceC g lam) := by
    funext n
    exact source_K_is_mean _ _ _ n hw hform
  rw [heq]
  exact weightedMean_positive_strictMono _ _ hw hCpos hCmono
end BesselWeights
