module

public import Conjectures.SteinkeZakynthinou.OutputKernel
public import Conjectures.AgnosticVC.OriginalKL

/-! The finite threshold likelihood formula is the KL divergence for the selector
and returned real parameter, with the product of their actual marginals. -/

@[expose] public section

namespace SteinkeZakynthinou.Learner

open MeasureTheory AgnosticVC
open scoped BigOperators ENNReal

variable {n : ℕ} (a : Learner n)

/-- At a given pool, draw the fair selector and run the learner on its chosen sample. -/
noncomputable def poolJoint (T : SteinkeZakynthinou.Pool n) : PMF (Selector n × ℝ) :=
  originalPoolJoint a.outputPMF (fun p => T p.1 p.2)

/-- KL conditional on this pool, measured against the product of the two actual marginals. -/
noncomputable def poolKL (T : SteinkeZakynthinou.Pool n) : ℝ≥0∞ :=
  let μ := (a.poolJoint T).toMeasure
  InformationTheory.klDiv μ ((μ.map Prod.fst).prod (μ.map Prod.snd))

/-- Reindexing by distinct real outputs combines probabilities of coincident outcomes. -/
private theorem sum_mass_mul (z : Sample n) (V : Finset ℝ)
    (hv : ∀ i, a.threshold z i ∈ V) (f : ℝ → ℝ) :
    ∑ t ∈ V, a.mass z t * f t = ∑ i, a.weight z i * f (a.threshold z i) := by
  classical
  unfold mass
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [ite_mul, zero_mul]
  exact Finset.sum_eq_single_of_mem (a.threshold z i) (hv i)
    (fun t _ h => by simp [Ne.symm h]) |>.trans (by simp)

theorem poolKL_eq_poolInformation (T : SteinkeZakynthinou.Pool n) :
    a.poolKL T ≠ ⊤ ∧ (a.poolKL T).toReal = a.poolInformation T := by
  classical
  let z : AgnosticVC.Pool n ℝ := fun p => T p.1 p.2
  let V : Finset ℝ := Finset.univ.image
    (fun si : Selector n × Fin a.outcomes => a.threshold (select T si.1) si.2)
  have hV (s : Selector n) (i : Fin a.outcomes) : a.threshold (select T s) i ∈ V :=
    Finset.mem_image.mpr ⟨(s,i), Finset.mem_univ _, rfl⟩
  let J := originalPoolJoint a.outputPMF z
  let Q := originalPoolMarginalProduct a.outputPMF z
  have hm (s : Selector n) (t : ℝ) :
      (a.outputPMF (select T s) t).toReal = a.mass (select T s) t := by
    rw [outputPMF_apply, ENNReal.toReal_ofReal (a.mass_nonneg _ _)]
  have h0 (sh : Selector n × ℝ) (ht : sh.2 ∉ V) : J sh = 0 := by
    rcases sh with ⟨s,t⟩
    have hz : a.mass (select T s) t = 0 := by
      apply Finset.sum_eq_zero
      intro i _
      have hne : a.threshold (select T s) i ≠ t := fun he => ht (he ▸ hV s i)
      simp [hne]
    change originalPoolJoint a.outputPMF z (s,t) = 0
    rw [originalPoolJoint_apply]
    change _ * a.outputPMF (select T s) t = 0
    simp [a.outputPMF_apply, hz]
  have hs : J.support.Finite := (((Finset.univ : Finset (Selector n)) ×ˢ V)).finite_toSet.subset (by
    intro sh hsh
    simp only [Finset.mem_coe, Finset.mem_product, Finset.mem_univ, true_and]
    by_contra h
    exact (PMF.mem_support_iff _ _).mp hsh (h0 sh h))
  have hkl := originalPoolInformation_eq_klDiv_of_finite_support a.outputPMF z hs
  have he : a.poolKL T = InformationTheory.klDiv J.toMeasure Q.toMeasure := by
    rw [originalPoolMarginalProduct_toMeasure_eq_prod]
    rfl
  rw [he]
  refine ⟨hkl.1, hkl.2.trans ?_⟩
  let w : ℝ := (Fintype.card (Selector n) : ℝ)⁻¹
  have hw : w ≠ 0 := by dsimp [w]; positivity
  have hJ (s : Selector n) (t : ℝ) : (J (s,t)).toReal = w * a.mass (select T s) t := by
    simp only [J, originalPoolJoint_apply, ENNReal.toReal_mul, fairSelectorLaw_apply,
      ENNReal.toReal_inv, ENNReal.toReal_natCast]
    exact congrArg (fun x => w*x) (hm s t)
  have hQ (s : Selector n) (t : ℝ) :
      (Q (s,t)).toReal = w * selectorMean (fun v => a.mass (select T v) t) := by
    simp only [Q, originalPoolMarginalProduct_apply, ENNReal.toReal_mul, fairSelectorLaw_apply,
      ENNReal.toReal_inv, ENNReal.toReal_natCast, originalPoolOutput_apply_real]
    congr 1
    exact congrArg selectorMean (funext fun v => hm v t)
  change (∑' sh : Selector n × ℝ, (J sh).toReal * Real.log ((J sh).toReal / (Q sh).toReal)) = _
  rw [tsum_eq_sum (s := ((Finset.univ : Finset (Selector n)) ×ˢ V)) (fun sh hs => by
    have ht : sh.2 ∉ V := by simpa using hs
    simp [h0 sh ht]), Finset.sum_product]
  simp_rw [hJ, hQ, mul_div_mul_left _ _ hw, mul_assoc, ← Finset.mul_sum]
  unfold poolInformation selectorMean
  rw [div_eq_inv_mul]
  apply congrArg (fun x => w*x)
  exact Finset.sum_congr rfl fun s _ => a.sum_mass_mul _ _ (hV s) _

/-- Integrating the true conditional KL over an iid pool gives exactly the learner's
finite information formula. Finiteness is proved before converting from extended reals. -/
theorem lintegral_poolKL_eq_cmi (D : Measure Observation) [IsProbabilityMeasure D] :
    (∫⁻ T, a.poolKL T ∂poolMeasure n D) = ENNReal.ofReal (a.cmi D) := by
  have he (T : SteinkeZakynthinou.Pool n) : ENNReal.ofReal (a.poolInformation T) = a.poolKL T := by
    rw [← (a.poolKL_eq_poolInformation T).2, ENNReal.ofReal_toReal (a.poolKL_eq_poolInformation T).1]
  change _ = ENNReal.ofReal (∫ T, a.poolInformation T ∂poolMeasure n D)
  rw [ofReal_integral_eq_lintegral_ofReal (a.integrable_poolInformation D) (ae_of_all _ fun T =>
    (a.poolKL_eq_poolInformation T).2 ▸ ENNReal.toReal_nonneg)]
  exact lintegral_congr fun T => (he T).symm

end SteinkeZakynthinou.Learner
