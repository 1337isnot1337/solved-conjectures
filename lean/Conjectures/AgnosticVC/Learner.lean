module

public import Conjectures.AgnosticVC.Traces
public import Conjectures.AgnosticVC.VC
public import Conjectures.AgnosticVC.LearnerContinuity
public import Mathlib.Data.Nat.Log
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.MeasureTheory.Constructions.UnitInterval
public import Mathlib.MeasureTheory.Integral.Bochner.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Constructions

/-! The distribution-independent proper learner on a labeled sample. The weights
are continuous independent uniform random variables. The sum and integral give
the actual law on the finite set of realized traces. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

/-- Parameters are chosen at the training size and kept fixed for block deletions. -/
structure Schedule where
  levels : ℕ
  size : Fin levels → ℕ
  coeff : Fin levels → ℝ
  temperature : ℝ

/-- The largest j with d * 16^j ≤ n when 1 ≤ d ≤ n. -/
def depth (n d : ℕ) := Nat.log 16 (n / d)

noncomputable def temperatureAt (n d j : ℕ) : ℝ :=
  Real.sqrt ((n : ℝ) / d) / (21 / 20 : ℝ) ^ j

noncomputable def schedule (n d : ℕ) : Schedule where
  levels := depth n d + 1
  size j := d * 4 ^ j.val
  coeff j := temperatureAt n d j.val - temperatureAt n d (j.val+1)
  temperature := temperatureAt n d (depth n d + 1)

theorem schedule_temperature_pos {n d : ℕ} (hd : 0 < d) (hn : 0 < n) :
    0 < (schedule n d).temperature := by
  change 0 < Real.sqrt ((n : ℝ) / d) / (21 / 20 : ℝ) ^ _
  positivity

theorem schedule_coeff_nonneg (n d : ℕ) (j : Fin (schedule n d).levels) :
    0 ≤ (schedule n d).coeff j := by
  change 0 ≤ temperatureAt n d j.val - temperatureAt n d (j.val+1)
  unfold temperatureAt
  rw [sub_nonneg, pow_succ]
  apply div_le_div_of_nonneg_left (Real.sqrt_nonneg _) (by positivity)
  exact le_mul_of_one_le_right (by positivity) (by norm_num)

abbrev SampleSubset (I : Type*) [Fintype I] (σ : Schedule) :=
  (j : Fin σ.levels) × {M : Finset I // M.card = σ.size j}

/-- Averaging each restriction entropy uniformly among sets of its size. -/
noncomputable def restrictionCoeff {I : Type*} [Fintype I] (σ : Schedule)
    (k : SampleSubset I σ) : ℝ :=
  σ.coeff k.1 / (Fintype.card {M : Finset I // M.card = σ.size k.1} : ℝ)

variable {I H X : Type*} [Fintype I] [DecidableEq I]

abbrev TraceSpace (predict : H → X → Bool) (x : I → X) := ↥(sampleFamily predict x)

instance traceSpace_nonempty [Nonempty H] (predict : H → X → Bool) (x : I → X) :
    Nonempty (TraceSpace predict x) :=
  Nonempty.map (fun h : H => ⟨sampleTrace predict x h, sampleTrace_mem predict x h⟩) inferInstance

/-- Project to the realized traces on the restriction. This finite codomain preserves the
VC trace count used in the entropy comparison. -/
noncomputable def restrictTrace (predict : H → X → Bool) (x : I → X) (σ : Schedule)
    (k : SampleSubset I σ) (v : TraceSpace predict x) :
    ↥(traceRestriction (sampleFamily predict x) k.2.val) :=
  ⟨k.2.val ∩ v.val, Finset.mem_image.mpr ⟨v.val, v.property, rfl⟩⟩

noncomputable def mistakeCount (y : I → Bool) (w : I → ℝ) (v : Finset I) : ℝ :=
  ∑ i, if decide (i ∈ v) = y i then 0 else w i

variable [Nonempty H]

noncomputable def traceLaw (σ : Schedule) (predict : H → X → Bool) (x : I → X)
    (y : I → Bool) (w : I → ℝ) : TraceSpace predict x → ℝ :=
  optimizer (fun v => mistakeCount y w v.val) σ.temperature
    (restrictionCoeff σ) (restrictTrace predict x σ)

theorem traceLaw_isLaw (σ : Schedule) (predict : H → X → Bool) (x : I → X)
    (y : I → Bool) (w : I → ℝ) : IsLaw (traceLaw σ predict x y w) :=
  optimizer_isLaw _ _ _ _

theorem continuous_traceLaw {σ : Schedule} (hτ : 0 < σ.temperature)
    (ha : ∀ j, 0 ≤ σ.coeff j) (predict : H → X → Bool) (x : I → X) (y : I → Bool) :
    Continuous (traceLaw σ predict x y) := by
  apply (continuous_optimizer hτ (fun k => div_nonneg (ha k.1) (Nat.cast_nonneg _))
    (restrictTrace predict x σ)).comp
  apply continuous_pi
  intro v
  unfold mistakeCount
  apply continuous_finsetSum
  intro i _
  split <;> fun_prop

/-- Uniform draws in [0,1] scaled to training weights in [0,2]. -/
noncomputable def weightDraw {I : Type*} (u : I → unitInterval) : I → ℝ :=
  fun i => 2 * (u i : ℝ)

noncomputable def weightMeasure (I : Type*) [Fintype I] : Measure (I → unitInterval) :=
  Measure.pi (fun _ : I => (volume : Measure unitInterval))

instance {I : Type*} [Fintype I] : IsProbabilityMeasure (weightMeasure I) := by
  unfold weightMeasure
  infer_instance

noncomputable def learnedTraceMass (σ : Schedule) (predict : H → X → Bool) (x : I → X)
    (y : I → Bool) (v : TraceSpace predict x) : ℝ :=
  ∫ u, traceLaw σ predict x y (weightDraw u) v ∂weightMeasure I

theorem integrable_traceLaw {σ : Schedule} (hτ : 0 < σ.temperature) (ha : ∀ j, 0 ≤ σ.coeff j)
    (predict : H → X → Bool) (x : I → X) (y : I → Bool) (v : TraceSpace predict x) :
    Integrable (fun u => traceLaw σ predict x y (weightDraw u) v) (weightMeasure I) := by
  have cw : Continuous (weightDraw (I := I)) := by unfold weightDraw; fun_prop
  have cf := ((continuous_apply v).comp (continuous_traceLaw hτ ha predict x y)).comp cw
  apply Integrable.of_bound cf.aestronglyMeasurable 1
  filter_upwards with u
  exact (Real.norm_of_nonneg ((traceLaw_isLaw σ predict x y _).1 v)).le.trans
    ((traceLaw_isLaw σ predict x y _).le_one v)

theorem learnedTraceMass_isLaw {σ : Schedule} (hτ : 0 < σ.temperature) (ha : ∀ j, 0 ≤ σ.coeff j)
    (predict : H → X → Bool) (x : I → X) (y : I → Bool) :
    IsLaw (learnedTraceMass σ predict x y) := by
  refine ⟨fun v => integral_nonneg (fun u => (traceLaw_isLaw σ predict x y _).1 v), ?_⟩
  unfold learnedTraceMass
  rw [← integral_finsetSum _ (fun v _ => integrable_traceLaw hτ ha predict x y v)]
  simp only [(traceLaw_isLaw σ predict x y _).2]
  simp

variable [TraceOrder H]

/-- The distribution on actual hypotheses. Sample-dependent trace indices stay internal. -/
noncomputable def properLearner {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Fin n → X × Bool) : PMF H := by
  classical
  let x := fun i => (z i).1
  let y := fun i => (z i).2
  let w := learnedTraceMass (schedule n d) predict x y
  have hw : IsLaw w := learnedTraceMass_isLaw
    (schedule_temperature_pos hd (hd.trans_le hn)) (schedule_coeff_nonneg n d) predict x y
  have hnorm : ∑ v, ENNReal.ofReal (w v) = 1 := by
    rw [← ENNReal.ofReal_sum_of_nonneg (fun v _ => hw.1 v), hw.2, ENNReal.ofReal_one]
  exact (PMF.ofFintype (fun v => ENNReal.ofReal (w v)) hnorm).map (canonicalRep predict x)

end AgnosticVC
