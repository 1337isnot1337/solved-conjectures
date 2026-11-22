module

public import Conjectures.AgnosticVC.Parameters
public import Conjectures.AgnosticVC.VCWeights

@[expose] public section

namespace AgnosticVC

open Finset MeasureTheory
open scoped BigOperators

private lemma entropy_scale {n d : ℕ} (hd : 0 < d) :
    (d : ℝ) * Real.sqrt ((n : ℝ) / d) = Real.sqrt ((n : ℝ) * d) := by
  have hdr : 0 < (d : ℝ) := Nat.cast_pos.mpr hd
  apply (sq_eq_sq₀ (mul_nonneg hdr.le (Real.sqrt_nonneg _)) (Real.sqrt_nonneg _)).mp
  rw [mul_pow, Real.sq_sqrt (div_nonneg (Nat.cast_nonneg _) hdr.le),
    Real.sq_sqrt (mul_nonneg (Nat.cast_nonneg _) hdr.le)]
  field_simp

private lemma full_trace_entropy_le {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (F : Finset (Finset (Fin n))) (hF : F.Nonempty) (hvc : F.vcDim ≤ d) :
    (schedule n d).temperature * Real.log F.card ≤ 320 * Real.sqrt ((n : ℝ) * d) := by
  have hl := log_card_traceRestriction_le F (Finset.univ : Finset (Fin n)) n d hF (by simp) hvc hd hn
  have hre : traceRestriction F Finset.univ = F := by simp [traceRestriction]
  rw [hre] at hl
  have hb := full_entropy_budget hd hn
  calc
    _ ≤ (schedule n d).temperature * ((d : ℝ) * (1 + Real.log ((n : ℝ) / d))) :=
      mul_le_mul_of_nonneg_left hl (schedule_temperature_pos hd (hd.trans_le hn)).le
    _ = (d : ℝ) * ((schedule n d).temperature * (1 + Real.log ((n : ℝ) / d))) := by ring
    _ ≤ (d : ℝ) * (320 * Real.sqrt ((n : ℝ) / d)) :=
      mul_le_mul_of_nonneg_left hb (Nat.cast_nonneg _)
    _ = _ := by rw [← entropy_scale (n := n) hd]; ring

private lemma restriction_trace_entropy_le {n d : ℕ} (hd : 0 < d)
    (F : Finset (Finset (Fin n))) (hF : F.Nonempty) (hvc : F.vcDim ≤ d) :
    (∑ k : SampleSubset (Fin n) (schedule n d),
      restrictionCoeff (schedule n d) k *
        Real.log (Fintype.card ↥(traceRestriction F k.2.val))) ≤
      81 * Real.sqrt ((n : ℝ) * d) := by
  let σ := schedule n d
  let S (j : Fin σ.levels) := {M : Finset (Fin n) // M.card = σ.size j}
  let B (j : Fin σ.levels) := (d : ℝ) * (1 + 4 * (j.val : ℝ))
  have hwithin (j : Fin σ.levels) (M : S j) :
      Real.log (Fintype.card ↥(traceRestriction F M.val)) ≤ B j := by
    have hsize : σ.size j = d * 4 ^ j.val := rfl
    have hpow : 1 ≤ (4 : ℕ) ^ j.val := Nat.one_le_pow _ _ (by decide)
    have hle : d ≤ σ.size j := by rw [hsize]; exact Nat.le_mul_of_pos_right d hpow
    have h := log_card_traceRestriction_le F M.val (σ.size j) d hF M.property.le hvc hd hle
    rw [Fintype.card_coe]
    apply h.trans
    have hratio : ((σ.size j : ℕ) : ℝ) / d = (4 : ℝ) ^ j.val := by
      rw [hsize, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]
      exact mul_div_cancel_left₀ _ (Nat.cast_ne_zero.mpr hd.ne')
    rw [hratio, Real.log_pow]
    have hlog4 : Real.log 4 ≤ 4 := Real.log_le_self (by norm_num)
    dsimp [B]
    apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
    have hm := mul_le_mul_of_nonneg_left hlog4 (Nat.cast_nonneg (α := ℝ) j.val)
    exact add_le_add le_rfl (by nlinarith only [hm])
  have hfiber (j : Fin σ.levels) :
      (∑ M : S j, restrictionCoeff σ ⟨j, M⟩ *
        Real.log (Fintype.card ↥(traceRestriction F M.val))) ≤ σ.coeff j * B j := by
    let c := σ.coeff j / (Fintype.card (S j) : ℝ)
    have hcoef : 0 ≤ c := div_nonneg (schedule_coeff_nonneg n d j) (Nat.cast_nonneg _)
    calc
      _ ≤ ∑ _ : S j, c * B j :=
        Finset.sum_le_sum (fun M _ => mul_le_mul_of_nonneg_left (hwithin j M) hcoef)
      _ ≤ _ := by
        by_cases hne : Fintype.card (S j) = 0
        · simp [hne]
          exact mul_nonneg (schedule_coeff_nonneg n d j) (by dsimp [B]; positivity)
        · simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, c]
          rw [← mul_assoc, mul_comm _ (σ.coeff j / (Fintype.card (S j) : ℝ)),
            div_mul_cancel₀ _ (Nat.cast_ne_zero.mpr hne)]
  change (∑ k : (j : Fin σ.levels) × S j,
    restrictionCoeff σ k * Real.log (Fintype.card ↥(traceRestriction F k.2.val))) ≤ _
  rw [Fintype.sum_sigma]
  calc
    _ ≤ ∑ j : Fin σ.levels, σ.coeff j * B j := Finset.sum_le_sum fun j _ => hfiber j
    _ = (d : ℝ) * ∑ j : Fin σ.levels,
        (temperatureAt n d j.val - temperatureAt n d (j.val + 1)) * (1 + 4 * (j.val : ℝ)) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      change (temperatureAt n d j.val - temperatureAt n d (j.val + 1)) * ((d : ℝ) * _) = _
      ring
    _ ≤ (d : ℝ) * (81 * Real.sqrt ((n : ℝ) / d)) := by
      apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
      let f (j : ℕ) := (temperatureAt n d j - temperatureAt n d (j + 1)) * (1 + 4 * (j : ℝ))
      change (∑ j : Fin σ.levels, f j.val) ≤ _
      rw [Fin.sum_univ_eq_sum_range f]
      exact entropy_sum_le n d σ.levels
    _ = _ := by rw [← entropy_scale (n := n) hd]; ring

set_option maxHeartbeats 800000 in
/-- The empirical mistake-count bound for the finite trace law of the actual learner.
The comparator can be the trace of any hypothesis in the class. -/
theorem learnedTraceMass_empirical_le {H X : Type*} [Nonempty H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (hvc : HasVCDimensionAtMost predict d)
    (x : Fin n → X) (y : Fin n → Bool) (v : TraceSpace predict x) :
    expected (learnedTraceMass (schedule n d) predict x y)
        (fun u => mistakeCount y (fun _ => 1) u.val) ≤
      mistakeCount y (fun _ => 1) v.val + 583 * Real.sqrt ((n : ℝ) * d) := by
  classical
  let σ := schedule n d
  let F := sampleFamily predict x
  let emp (u : TraceSpace predict x) := mistakeCount y (fun _ => 1) u.val
  let R := Real.sqrt ((n : ℝ) * d)
  let dev := maxWeightDeviation F ⟨v.val, v.property⟩ y
  let obj (w : Fin n → unitInterval) (u : TraceSpace predict x) := traceLaw σ predict x y (weightDraw w) u
  have hτ := schedule_temperature_pos hd (hd.trans_le hn)
  have hc := schedule_coeff_nonneg n d
  have hF : F.Nonempty := ⟨v.val, v.property⟩
  have hvcF : F.vcDim ≤ d := sampleFamily_vcDim_le hvc x
  have hfull : σ.temperature * Real.log (Fintype.card (TraceSpace predict x)) ≤ 320 * R := by
    rw [Fintype.card_coe]
    exact full_trace_entropy_le hd hn F hF hvcF
  have hres : (∑ k : SampleSubset (Fin n) σ, restrictionCoeff σ k *
        Real.log (Fintype.card ↥(traceRestriction F k.2.val))) ≤ 81 * R :=
    restriction_trace_entropy_le hd F hF hvcF
  have hpoint (w : Fin n → unitInterval) : expected (obj w) emp ≤ emp v + 401 * R + 2 * dev w := by
    let loss (u : TraceSpace predict x) := mistakeCount y (weightDraw w) u.val
    have hdiff (u : TraceSpace predict x) : |loss u - emp u| ≤ dev w :=
      Finset.le_sup' (fun t => |mistakeCount y (weightDraw w) t -
        mistakeCount y (fun _ => 1) t|) u.property
    have h := empirical_le_comparator (loss := loss) (empirical := emp)
      (τ := σ.temperature) (coeff := restrictionCoeff σ) (restriction := restrictTrace predict x σ)
      (p := obj w) (slack := dev w) (traceLaw_isLaw σ predict x y (weightDraw w)) hτ.le
      (fun k => div_nonneg (hc k.1) (Nat.cast_nonneg _))
      (optimizer_min loss σ.temperature (restrictionCoeff σ) (restrictTrace predict x σ)) hdiff v
    linarith only [h, hfull, hres]
  have hI (u : TraceSpace predict x) : Integrable (fun w => obj w u * emp u) (weightMeasure (Fin n)) :=
    (integrable_traceLaw hτ hc predict x y u).mul_const _
  have hdev : Integrable dev (weightMeasure (Fin n)) := integrable_maxWeightDeviation F hF y
  have hIE : Integrable (fun w => expected (obj w) emp) (weightMeasure (Fin n)) :=
    integrable_finsetSum _ (fun u _ => hI u)
  have hE : expected (learnedTraceMass σ predict x y) emp =
      ∫ w, expected (obj w) emp ∂weightMeasure (Fin n) := by
    unfold expected learnedTraceMass
    rw [integral_finsetSum _ (fun u _ => hI u)]
    simp_rw [integral_mul_const]
    rfl
  have hcalc := integral_mono hIE ((integrable_const (emp v + 401 * R)).add (hdev.const_mul 2)) hpoint
  rw [← hE, integral_add' (integrable_const _) (hdev.const_mul 2), integral_const_mul] at hcalc
  have : Nonempty (Fin n) := ⟨⟨0, hd.trans_le hn⟩⟩
  have hpert : (∫ w, dev w ∂weightMeasure (Fin n)) ≤ 91 * R := by
    simpa only [R, Fintype.card_fin] using integral_maxWeightDeviation_le F hF d hd hvcF y
  have hconst : (∫ _ : Fin n → unitInterval, emp v + 401 * R ∂weightMeasure (Fin n)) =
      emp v + 401 * R := by simp
  rw [hconst] at hcalc
  change expected (learnedTraceMass σ predict x y) emp ≤ emp v + 583 * R
  linarith only [hcalc, hpert]

/-- The empirical fraction of classification mistakes made by a hypothesis. -/
noncomputable def empiricalError {H X : Type*} {n : ℕ} (predict : H → X → Bool)
    (z : Fin n → X × Bool) (h : H) : ℝ :=
  mistakeCount (fun i => (z i).2) (fun _ => 1) (sampleTrace predict (fun i => (z i).1) h) / n

/-- On every fixed sample, the actual proper learner's expected empirical error is within
`583 * √(d / n)` of every comparator in the class. The expectation is over its finite
support of actual hypothesis names. -/
theorem traceReadoutLearner_empirical_le {H X : Type*} [Nonempty H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (hvc : HasVCDimensionAtMost predict d)
    (z : Fin n → X × Bool)
    (represent : TraceSpace predict (fun i => (z i).1) → H)
    (hrep : ∀ v, sampleTrace predict (fun i => (z i).1) (represent v) = v.val) (h : H) :
    (∑' t : H, (traceReadoutLearner hd hn predict z represent t).toReal * empiricalError predict z t) ≤
      empiricalError predict z h + 583 * Real.sqrt ((d : ℝ) / n) := by
  classical
  let x := fun i => (z i).1
  let y := fun i => (z i).2
  let q := traceReadoutLearner hd hn predict z represent
  let law := learnedTraceMass (schedule n d) predict x y
  let e : TraceSpace predict x ↪ H := ⟨represent, fun a b hab => Subtype.ext
    ((hrep a).symm.trans ((congrArg (sampleTrace predict x) hab).trans (hrep b)))⟩
  let emp (u : TraceSpace predict x) := mistakeCount y (fun _ => 1) u.val
  have hp : IsLaw law := learnedTraceMass_isLaw (schedule_temperature_pos hd (hd.trans_le hn))
    (schedule_coeff_nonneg n d) predict x y
  have hnorm : ∑ v, ENNReal.ofReal (law v) = 1 := by
    rw [← ENNReal.ofReal_sum_of_nonneg (fun v _ => hp.1 v), hp.2, ENNReal.ofReal_one]
  let p := PMF.ofFintype (fun v => ENNReal.ofReal (law v)) hnorm
  have hq : q = p.map e := rfl
  have hzero (t : H) (ht : t ∉ (Finset.univ : Finset (TraceSpace predict x)).map e) : q t = 0 := by
    have hne (u : TraceSpace predict x) : t ≠ e u := by
      intro heq
      exact ht (Finset.mem_map.mpr ⟨u, Finset.mem_univ u, heq.symm⟩)
    rw [hq, PMF.map_apply]
    simp [hne]
  have hmass (u : TraceSpace predict x) : (q (e u)).toReal = law u := by
    rw [hq, PMF.map_apply, tsum_fintype]
    simp only [e.injective.eq_iff]
    rw [Finset.sum_eq_single u]
    · simp [p, ENNReal.toReal_ofReal (hp.1 u)]
    · intro v hv hne
      simp [Ne.symm hne]
    · simp
  have hval (u : TraceSpace predict x) : empiricalError predict z (e u) = emp u / n := by
    unfold empiricalError
    rw [show sampleTrace predict x (e u) = u.val from hrep u]
  have he : (∑' t : H, (q t).toReal * empiricalError predict z t) = expected law emp / n := by
    rw [tsum_eq_sum (s := Finset.univ.map e) (fun t ht => by simp [hzero t ht]), Finset.sum_map]
    simp_rw [hmass, hval, ← mul_div_assoc, div_eq_mul_inv, ← Finset.sum_mul]
    rfl
  have hnpos : 0 < (n : ℝ) := Nat.cast_pos.mpr (hd.trans_le hn)
  have hdnon : 0 ≤ (d : ℝ) := Nat.cast_nonneg _
  have hscale : Real.sqrt ((n : ℝ) * d) / n = Real.sqrt ((d : ℝ) / n) := by
    apply (sq_eq_sq₀ (div_nonneg (Real.sqrt_nonneg _) hnpos.le) (Real.sqrt_nonneg _)).mp
    rw [div_pow, Real.sq_sqrt (mul_nonneg hnpos.le hdnon), Real.sq_sqrt (div_nonneg hdnon hnpos.le)]
    field_simp
  let v : TraceSpace predict x := ⟨sampleTrace predict x h, sampleTrace_mem predict x h⟩
  have hb := div_le_div_of_nonneg_right (learnedTraceMass_empirical_le hd hn predict hvc x y v) hnpos.le
  rw [add_div, mul_div_assoc, hscale] at hb
  change (∑' t : H, (q t).toReal * empiricalError predict z t) ≤ _
  rw [he]
  exact hb

/-- The same empirical bound for globally ordered representatives. -/
theorem properLearner_empirical_le {H X : Type*} [Nonempty H] [TraceOrder H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (hvc : HasVCDimensionAtMost predict d)
    (z : Fin n → X × Bool) (h : H) :
    (∑' t : H, (properLearner hd hn predict z t).toReal * empiricalError predict z t) ≤
      empiricalError predict z h + 583 * Real.sqrt ((d : ℝ) / n) :=
  traceReadoutLearner_empirical_le hd hn predict hvc z
    (canonicalRep predict (fun i => (z i).1)) (canonicalRep_trace predict _) h

end AgnosticVC
