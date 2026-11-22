module

public import Conjectures.AgnosticVC.OptimizerSubsetSwap
public import Conjectures.AgnosticVC.Learner

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- The restrictions remaining after removing a coordinate, before collapsing the support. -/
abbrev AvoidingSampleSubset (i : I) (σ : Schedule) := (j : Fin σ.levels) × AvoidingSubset i (σ.size j)

noncomputable def avoidingRestrictionCoeff (i : I) (σ : Schedule) (k : AvoidingSampleSubset i σ) : ℝ :=
  σ.coeff k.1 / (Fintype.card (AvoidingSubset i (σ.size k.1)) : ℝ)

/-- Full-support law with every restriction drawn only among the surviving coordinates. -/
noncomputable def avoidOptimizer (F : Finset (Finset I)) [Nonempty ↥F] (i : I) (σ : Schedule)
    (loss : ↥F → ℝ) : ↥F → ℝ :=
  optimizer loss σ.temperature (avoidingRestrictionCoeff i σ)
    (fun k => restrictionOn F k.2.val.val)

private abbrev CoupledSampleSubset (i : I) (σ : Schedule) :=
  (j : Fin σ.levels) × SubsetSwap i (σ.size j)

private noncomputable def coupledCoeff (i : I) (σ : Schedule) (k : CoupledSampleSubset i σ) : ℝ :=
  σ.coeff k.1 * swapWeight i k.2

private noncomputable def coupledChangedCoeff (i : I) (σ : Schedule) (k : CoupledSampleSubset i σ) : ℝ :=
  match k.2 with
  | Sum.inl _ => 0
  | Sum.inr _ => coupledCoeff i σ k

private theorem sum_coupledChangedCoeff (i : I) (σ : Schedule)
    (hm : ∀ j, σ.size j < Fintype.card I) :
    ∑ k, coupledChangedCoeff i σ k = ∑ j, σ.coeff j * ((σ.size j : ℝ) / Fintype.card I) := by
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro j _
  rw [Fintype.sum_sum_type]
  simp only [coupledChangedCoeff, coupledCoeff, Finset.sum_const_zero, zero_add, ← Finset.mul_sum,
    sum_swapWeight_changed i (hm j)]

private theorem coupledSource_objective (F : Finset (Finset I)) (i : I) (σ : Schedule)
    (loss p : ↥F → ℝ) (hm : ∀ j, σ.size j < Fintype.card I) :
    objective loss σ.temperature (coupledCoeff i σ)
      (fun k => restrictionOn F (swapSource i k.2).val) p =
    objective loss σ.temperature (restrictionCoeff σ)
      (fun k => restrictionOn F k.2.val) p := by
  unfold objective
  rw [Fintype.sum_sigma, Fintype.sum_sigma]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  change (∑ k : SubsetSwap i (σ.size j), σ.coeff j * swapWeight i k *
      negEntropy (marginal (restrictionOn F (swapSource i k).val) p)) =
    ∑ k : SizedSubset I (σ.size j), (σ.coeff j / (Fintype.card (SizedSubset I (σ.size j)) : ℝ)) *
      negEntropy (marginal (restrictionOn F k.val) p)
  simp_rw [mul_assoc]
  rw [← Finset.mul_sum, ← Finset.mul_sum,
    sum_swapSource i (hm j) (fun k => negEntropy (marginal (restrictionOn F k.val) p)), div_eq_mul_inv,
    mul_assoc]

private theorem coupledTarget_objective (F : Finset (Finset I)) (i : I) (σ : Schedule)
    (loss p : ↥F → ℝ) (hm : ∀ j, σ.size j < Fintype.card I) :
    objective loss σ.temperature (coupledCoeff i σ)
      (fun k => restrictionOn F (swapTarget i k.2).val.val) p =
    objective loss σ.temperature (avoidingRestrictionCoeff i σ)
      (fun k => restrictionOn F k.2.val.val) p := by
  unfold objective
  rw [Fintype.sum_sigma, Fintype.sum_sigma]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  change (∑ k : SubsetSwap i (σ.size j), σ.coeff j * swapWeight i k *
      negEntropy (marginal (restrictionOn F (swapTarget i k).val.val) p)) =
    ∑ k : AvoidingSubset i (σ.size j), (σ.coeff j / (Fintype.card (AvoidingSubset i (σ.size j)) : ℝ)) *
      negEntropy (marginal (restrictionOn F k.val.val) p)
  simp_rw [mul_assoc]
  rw [← Finset.mul_sum, ← Finset.mul_sum,
    sum_swapTarget i (hm j) (fun k => negEntropy (marginal (restrictionOn F k.val.val) p)), div_eq_mul_inv,
    mul_assoc]

/-- The effect of excluding a row from the actual uniform restriction scheme, on unchanged full
support. The bound pays exactly the fraction of coupled subsets which need a replacement. -/
theorem optimizer_remove_restrictions (F : Finset (Finset I)) [Nonempty ↥F] (i : I) (σ : Schedule)
    (loss : ↥F → ℝ) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j)
    (hm : ∀ j, σ.size j < Fintype.card I) :
    hellingerSq (avoidOptimizer F i σ loss)
      (optimizer loss σ.temperature (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)) ≤
      8 * ((∑ j, σ.coeff j * ((σ.size j : ℝ) / Fintype.card I)) / σ.temperature)^2 := by
  let r := fun k : CoupledSampleSubset i σ => restrictionOn F (swapSource i k.2).val
  let s := fun k : CoupledSampleSubset i σ => restrictionOn F (swapTarget i k.2).val.val
  let w := coupledCoeff i σ
  let W := ∑ j, σ.coeff j * ((σ.size j : ℝ) / Fintype.card I)
  have hw (k : CoupledSampleSubset i σ) : 0 ≤ w k := mul_nonneg (hc k.1) (swapWeight_nonneg i k.2)
  have hgrad (p : ↥F → ℝ) (hp : IsLaw p) (hpos : ∀ a, 0 < p a) :
      ∑ a, p a * (∑ k, w k * (Real.log (marginal (s k) p (s k a)) -
        Real.log (marginal (r k) p (r k a))))^2 ≤ 32 * W^2 := by
    let g := fun k a => Real.log (marginal (s k) p (s k a)) - Real.log (marginal (r k) p (r k a))
    have he (k : CoupledSampleSubset i σ) (a : ↥F) : w k * g k a = coupledChangedCoeff i σ k * g k a := by
      obtain ⟨j, k⟩ := k
      cases k with
      | inl k =>
        have hz : g ⟨j, Sum.inl k⟩ a = 0 := by
          change Real.log (marginal (restrictionOn F k.val.val) p (restrictionOn F k.val.val a)) -
            Real.log (marginal (restrictionOn F k.val.val) p (restrictionOn F k.val.val a)) = 0
          exact sub_self _
        rw [hz, mul_zero, mul_zero]
      | inr k => rfl
    have hh (k : CoupledSampleSubset i σ) : ∑ a, p a * (g k a)^2 ≤ 32 := by
      obtain ⟨j, k⟩ := k
      cases k with
      | inl k =>
        have hzero (a : ↥F) : g ⟨j, Sum.inl k⟩ a = 0 := by
          change Real.log (marginal (restrictionOn F k.val.val) p (restrictionOn F k.val.val a)) -
            Real.log (marginal (restrictionOn F k.val.val) p (restrictionOn F k.val.val a)) = 0
          exact sub_self _
        simp [hzero]
      | inr k =>
        let C := k.1.val.val.erase i
        let j' := k.2.val
        have he : insert i C = k.1.val.val := Finset.insert_erase k.1.property
        have hh := restrictionOn_swap_gradient_bound F C i j' hp hpos
        rw [he] at hh
        exact hh
    change ∑ a, p a * (∑ k, w k * g k a)^2 ≤ _
    simp_rw [he]
    have hbound := weighted_gradient_sum_bound (coupledChangedCoeff i σ) g hp.1
      (fun k => by obtain ⟨j, k⟩ := k; cases k; exacts [le_rfl, hw _]) hh
    rw [sum_coupledChangedCoeff i σ hm, mul_comm] at hbound
    exact hbound
  have h := optimizer_replace_restrictions loss w r s hτ hw hgrad
  have he₁ : optimizer loss σ.temperature w r =
      optimizer loss σ.temperature (restrictionCoeff σ) (fun k => restrictionOn F k.2.val) := by
    refine minimizer_unique (coeff := restrictionCoeff σ)
      (restriction := fun k => restrictionOn F k.2.val)
      hτ (fun k => div_nonneg (hc k.1) (by positivity))
      (optimizer_isLaw _ _ _ _) (optimizer_isLaw _ _ _ _) ?_ (optimizer_min _ _ _ _)
    intro q hq
    have hmin := optimizer_min loss σ.temperature w r q hq
    dsimp only [w, r] at hmin
    rw [coupledSource_objective F i σ loss _ hm, coupledSource_objective F i σ loss _ hm] at hmin
    exact hmin
  have he₂ : optimizer loss σ.temperature w s = avoidOptimizer F i σ loss := by
    unfold avoidOptimizer
    refine minimizer_unique (coeff := avoidingRestrictionCoeff i σ)
      (restriction := fun k => restrictionOn F k.2.val.val)
      hτ (fun k => div_nonneg (hc k.1) (by positivity))
      (optimizer_isLaw _ _ _ _) (optimizer_isLaw _ _ _ _) ?_ (optimizer_min _ _ _ _)
    intro q hq
    have hmin := optimizer_min loss σ.temperature w s q hq
    dsimp only [w, s] at hmin
    rw [coupledTarget_objective F i σ loss _ hm, coupledTarget_objective F i σ loss _ hm] at hmin
    exact hmin
  rw [he₁, he₂] at h
  convert h using 1
  ring

end AgnosticVC
