import Conjectures.LopezPousoSeguraBesselBridge
open Filter
open scoped Topology
namespace BesselWeights

noncomputable def referenceLambda (n : ℕ) : ℝ := Real.pi^2*((n:ℝ)+3/4)^2+1/4
noncomputable def referenceWeight (n : ℕ) : ℝ := Real.pi^2/2*((n:ℝ)+3/4)

theorem reference_weight_growth : ∀ n, |referenceWeight n| ≤ Real.pi^2*((n:ℝ)+1) := by
  intro n
  have hn : 0 ≤ (n:ℝ) := Nat.cast_nonneg n
  have hp : 0 ≤ Real.pi^2 := sq_nonneg _
  have hw : 0 ≤ referenceWeight n := by unfold referenceWeight; positivity
  rw [abs_of_nonneg hw]
  unfold referenceWeight
  nlinarith [mul_nonneg hp (show (0:ℝ) ≤ (n:ℝ)+5/4 by linarith)]

theorem reference_lower (n : ℕ) : Real.pi^2/8*((n:ℝ)+1)^2 ≤ referenceLambda n := by
  have hn : 0 ≤ (n:ℝ) := Nat.cast_nonneg n
  have hsq : ((n:ℝ)+1)^2/4 ≤ ((n:ℝ)+3/4)^2 := by nlinarith [sq_nonneg (n:ℝ)]
  have hp := mul_nonneg (sq_nonneg Real.pi) (sub_nonneg.mpr hsq)
  have hp2 : 0 ≤ Real.pi^2*((n:ℝ)+1)^2 := mul_nonneg (sq_nonneg _) (sq_nonneg _)
  unfold referenceLambda
  nlinarith

theorem perturbed_reference_lower (err : ℕ → ℝ) (he : Tendsto err atTop (𝓝 0)) :
    ∀ᶠ (n : ℕ) in atTop, Real.pi^2/8*((n:ℝ)+1)^2 ≤ referenceLambda n + err n := by
  have hevent : ∀ᶠ (n : ℕ) in atTop, -(1/8:ℝ) < err n :=
    he.eventually (Ioi_mem_nhds (by norm_num : -(1/8:ℝ) < 0))
  filter_upwards [hevent] with n hn
  have hn0 : 0 ≤ (n:ℝ) := Nat.cast_nonneg n
  have hsq : ((n:ℝ)+1)^2/4 ≤ ((n:ℝ)+3/4)^2 := by nlinarith [sq_nonneg (n:ℝ)]
  have hp := mul_nonneg (sq_nonneg Real.pi) (sub_nonneg.mpr hsq)
  have hp2 : 0 ≤ Real.pi^2*((n:ℝ)+1)^2 := mul_nonneg (sq_nonneg _) (sq_nonneg _)
  unfold referenceLambda
  nlinarith

theorem perturbed_reference_weight_growth (err : ℕ → ℝ) (he : Tendsto err atTop (𝓝 0)) :
    ∀ᶠ (n : ℕ) in atTop, |referenceWeight n+err n| ≤ (Real.pi^2+1)*((n:ℝ)+1) := by
  have hevent : ∀ᶠ n in atTop, err n ∈ Set.Ioo (-(1:ℝ)) 1 :=
    he.eventually (Ioo_mem_nhds (by norm_num) (by norm_num))
  filter_upwards [hevent] with n hn
  have herr : |err n| ≤ 1 := abs_le.mpr ⟨le_of_lt hn.1, le_of_lt hn.2⟩
  have hbase := reference_weight_growth n
  have htri := abs_add_le (referenceWeight n) (err n)
  have hn0 : 0 ≤ (n:ℝ) := Nat.cast_nonneg n
  nlinarith

theorem reference_min_lower (err : ℕ → ℝ) (he : Tendsto err atTop (𝓝 0)) :
    ∀ᶠ (n : ℕ) in atTop, Real.pi^2/8*((n:ℝ)+1)^2 ≤
      min (referenceLambda n+err n) (referenceLambda n) := by
  filter_upwards [perturbed_reference_lower err he] with n hn
  exact le_min hn (reference_lower n)

theorem deviation_value_from_source_resolvents (δ err : ℕ → ℝ) (t : ℕ → ℝ) (B C : ℝ)
    (hB : 0 ≤ B) (hδ0 : Tendsto δ atTop (𝓝 0)) (he0 : Tendsto err atTop (𝓝 0))
    (hx : ∀ n, 0 < referenceLambda n+err n)
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖δ n‖ ≤ C/((n:ℝ)+1)^3)
    (he : ∀ᶠ (n : ℕ) in atTop, |err n| ≤ B/((n:ℝ)+1)^2)
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 < t n)
    (hmain : Tendsto (fun n => (∑' k, (referenceWeight k+δ k)/(1+(referenceLambda k+err k)*t n)^2)-1/(4*t n)) atTop (𝓝 0))
    (href : Tendsto (fun n => (∑' k, referenceWeight k/(1+referenceLambda k*t n)^2)-1/(4*t n)) atTop (𝓝 (-1/16+Real.pi^2/192))) :
    (∑' k, δ k) = 1/16-Real.pi^2/192 := by
  let a := fun n : ℕ => referenceWeight n+δ n
  let b := referenceWeight
  let x := fun n : ℕ => referenceLambda n+err n
  let y := referenceLambda
  have hA : 0 ≤ Real.pi^2+1 := by positivity
  have hc : 0 < Real.pi^2/8 := by positivity
  have hy : ∀ n, 0 < y n := by
    intro n
    have hn : 0 < Real.pi^2/8*((n:ℝ)+1)^2 := by positivity
    exact lt_of_lt_of_le hn (reference_lower n)
  have ha : ∀ᶠ (n : ℕ) in atTop, |a n| ≤ (Real.pi^2+1)*((n:ℝ)+1) := perturbed_reference_weight_growth δ hδ0
  have hb : ∀ᶠ (n : ℕ) in atTop, |b n| ≤ (Real.pi^2+1)*((n:ℝ)+1) := by
    filter_upwards with n
    have hh := reference_weight_growth n
    have hn : 0 ≤ (n:ℝ)+1 := by positivity
    nlinarith
  have hdiff : ∀ᶠ (n : ℕ) in atTop, ‖a n-b n‖ ≤ C/((n:ℝ)+1)^3 := by
    filter_upwards [hδ] with n hn
    simpa [a,b] using hn
  have hroot : ∀ᶠ (n : ℕ) in atTop, |x n-y n| ≤ B/((n:ℝ)+1)^2 := by
    filter_upwards [he] with n hn
    simpa [x,y] using hn
  have hmin : ∀ᶠ (n : ℕ) in atTop, Real.pi^2/8*((n:ℝ)+1)^2 ≤ min (x n) (y n) := reference_min_lower err he0
  have hh := deviation_value_from_resolvent_bounds a b x y t (Real.pi^2+1) B (Real.pi^2/8) C
    hA hB hc hx hy hdiff ha hb hroot hmin ht htpos hmain href
  simpa [a,b] using hh

theorem all_limits_from_source_resolvents (g lam : ℝ → ℝ) (δ err t : ℕ → ℝ) (B K : ℝ)
    (hB : 0 ≤ B) (hδ0 : Tendsto δ atTop (𝓝 0)) (he0 : Tendsto err atTop (𝓝 0))
    (hgp : ∀ n : ℕ, 0 < g (n+1)) (hrootpos : ∀ n : ℕ, 0 < lam (n+1))
    (hδ : ∀ᶠ (n : ℕ) in atTop, ‖δ n‖ ≤ K/((n:ℝ)+1)^3)
    (he : ∀ᶠ (n : ℕ) in atTop, |err n| ≤ B/((n:ℝ)+1)^2)
    (ha : ∀ n : ℕ, g (n+1)/4 = referenceWeight n+δ n)
    (hl : ∀ n : ℕ, lam (n+1) = referenceLambda n+err n)
    (ht : Tendsto t atTop (𝓝 0)) (htpos : ∀ᶠ n in atTop, 0 < t n)
    (hmain : Tendsto (fun n => (∑' k, (referenceWeight k+δ k)/(1+(referenceLambda k+err k)*t n)^2)-1/(4*t n)) atTop (𝓝 0))
    (href : Tendsto (fun n => (∑' k, referenceWeight k/(1+referenceLambda k*t n)^2)-1/(4*t n)) atTop (𝓝 (-1/16+Real.pi^2/192))) :
    Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)) ∧
    Tendsto (E g lam) atTop (𝓝 (-(Real.pi^2)/6)) ∧
    Tendsto (sourceK g lam) atTop (𝓝 (Real.pi^2/12)) := by
  have hx : ∀ n, 0 < referenceLambda n+err n := by
    intro n
    rw [← hl n]
    exact hrootpos n
  have hvalue := deviation_value_from_source_resolvents δ err t B K hB hδ0 he0 hx hδ he ht htpos hmain href
  apply all_three_limits_from_cubic_deviation g lam δ err K hgp hδ0 he0 hδ hvalue
  · intro n
    simpa [referenceWeight] using ha n
  · intro n
    simpa [referenceLambda] using hl n
end BesselWeights
