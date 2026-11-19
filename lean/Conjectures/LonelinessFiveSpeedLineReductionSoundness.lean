import Conjectures.LonelinessFiveSpeedLineReductionDefs
import Conjectures.LonelinessCriticalScaling
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessModularDirections

/-! Soundness of the line classifications and exact transfer through a
nonzero integer cross-scaling.  The finite tables are imported separately. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem line_value_integerSpeeds (v : FiveIntegerVector) :
    value (integerSpeeds v) = value (Modular.absoluteSpeeds v) := by
  apply value_eq_of_mem
  intro a
  simp only [mem_integerSpeeds, Modular.absoluteSpeeds, List.mem_ofFn]

theorem line_critical_integerSpeeds (v : FiveIntegerVector) :
    ContainsCriticalQuadruple (integerSpeeds v) ↔
      ContainsCriticalQuadruple (Modular.absoluteSpeeds v) := by
  simp only [ContainsCriticalQuadruple, List.subset_def, mem_integerSpeeds,
    Modular.absoluteSpeeds, List.mem_ofFn]

theorem lineCriticalSign_natAbs (payload : LineCriticalPayload) (k : Fin 4) :
    (lineCriticalSign payload k).natAbs = 1 := by
  cases h : payload.negative k <;> simp [lineCriticalSign, h]

theorem line_row_mulVec (B : Matrix (Fin 5) (Fin 2) ℤ) (u : Fin 2 → ℤ)
    (i j : Fin 5) (c : ℤ) (hrow : ∀ k, B i k = c * B j k) :
    (B *ᵥ u) i = c * (B *ᵥ u) j := by
  change (∑ k : Fin 2, B i k * u k) = c * (∑ k : Fin 2, B j k * u k)
  simp_rw [hrow, mul_assoc]
  rw [Finset.mul_sum]

theorem line_row_relation_cancel (B : Matrix (Fin 5) (Fin 2) ℤ) (u : Fin 2 → ℤ)
    (a : ℤ) (ha : a ≠ 0) (v : FiveIntegerVector) (hscale : B *ᵥ u = a • v)
    (i j : Fin 5) (c : ℤ) (hrow : ∀ k, B i k = c * B j k) :
    v i = c * v j := by
  have h := line_row_mulVec B u i j c hrow
  rw [hscale] at h
  change a * v i = c * (a * v j) at h
  apply mul_left_cancel₀ ha
  calc
    a * v i = c * (a * v j) := h
    _ = a * (c * v j) := by ring

theorem line_pattern_contains_critical (v : FiveIntegerVector)
    (payload : LineCriticalPayload) (hroot : v payload.root ≠ 0)
    (hrows : ∀ k : Fin 4, v (payload.selected k) =
      lineCriticalSign payload k * (lineCriticalPattern payload.second k : ℤ) * v payload.root) :
    ContainsCriticalQuadruple (integerSpeeds v) := by
  apply (line_critical_integerSpeeds v).mpr
  let d := (v payload.root).natAbs
  have hd : 0 < d := Int.natAbs_pos.mpr hroot
  have hnat (k : Fin 4) : (v (payload.selected k)).natAbs =
      d * lineCriticalPattern payload.second k := by
    rw [hrows k, Int.natAbs_mul, Int.natAbs_mul, lineCriticalSign_natAbs,
      Int.natAbs_natCast, Nat.one_mul]
    exact Nat.mul_comm _ _
  have hsub : (List.ofFn (lineCriticalPattern payload.second)).map (fun n => d * n) ⊆
      Modular.absoluteSpeeds v := by
    intro a ha
    obtain ⟨n, hn, rfl⟩ := List.mem_map.mp ha
    obtain ⟨k, hk⟩ := List.mem_ofFn.mp hn
    apply List.mem_ofFn.mpr
    refine ⟨payload.selected k, ?_⟩
    rw [hnat k, hk]
  refine ⟨d, hd, ?_⟩
  cases h : payload.second
  · left
    simpa [h, lineCriticalPattern, List.ofFn_succ] using hsub
  · right
    simpa [h, lineCriticalPattern, List.ofFn_succ] using hsub

/-- The other two dispositions contradict the stated noncritical and
distinct-coordinate hypotheses, so a checked line retains an indexed map. -/
theorem lineCaseCheck_retained (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) (h : ThreeIntegerVector) (certificate : LineCertificate)
    (hcheck : lineCaseCheck maps A h certificate = true)
    (u : ThreeIntegerVector) (hrelation : h ⬝ᵥ u = 0)
    (hnonzero : ∀ i, (A *ᵥ u) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((A *ᵥ u) i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (A *ᵥ u))) :
    ∃ m : Fin 164, lineEliminationMap A h certificate.pivot = maps m := by
  rcases certificate with ⟨j, disposition⟩
  have hc := lineCaseCheck_conditions maps A h ⟨j, disposition⟩ hcheck
  have hj : h j ≠ 0 := hc.1
  have heq := lineElimination_mulVec A h j u hrelation
  cases disposition with
  | image m => exact ⟨m, hc.2⟩
  | critical payload =>
      apply False.elim
      apply hnot
      apply line_pattern_contains_critical (A *ᵥ u) payload (hnonzero payload.root)
      intro k
      exact line_row_relation_cancel (lineEliminationMap A h j) (lineFreeParameters j u)
        (h j) hj (A *ᵥ u) heq (payload.selected k) payload.root
        (lineCriticalSign payload k * (lineCriticalPattern payload.second k : ℤ)) (hc.2 k)
  | repeated left right negative =>
      have hrows : left ≠ right ∧ ∀ k : Fin 2,
          lineEliminationMap A h j left k =
            (if negative then (-1 : ℤ) else 1) * lineEliminationMap A h j right k := hc.2
      have hv := line_row_relation_cancel (lineEliminationMap A h j) (lineFreeParameters j u)
        (h j) hj (A *ᵥ u) heq left right (if negative then -1 else 1) hrows.2
      have habs : ((A *ᵥ u) left).natAbs = ((A *ᵥ u) right).natAbs := by
        rw [hv, Int.natAbs_mul]
        cases negative <;> simp
      exact (hrows.1 (hdistinct habs)).elim

theorem lineCaseCheck_primitive_image (maps : Fin 164 → Matrix (Fin 5) (Fin 2) ℤ)
    (A : ThreeParameterMap) (h : ThreeIntegerVector) (certificate : LineCertificate)
    (hcheck : lineCaseCheck maps A h certificate = true)
    (u : ThreeIntegerVector) (hrelation : h ⬝ᵥ u = 0)
    (hnonzero : ∀ i, (A *ᵥ u) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((A *ᵥ u) i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (A *ᵥ u))) :
    ∃ m : Fin 164, ∃ g : ℕ, 0 < g ∧ ∃ w : Fin 2 → ℤ,
      Nat.gcd (w 0).natAbs (w 1).natAbs = 1 ∧
      (g : ℤ) • (maps m *ᵥ w) = h certificate.pivot • (A *ᵥ u) ∧
      ∀ i, (maps m *ᵥ w) i ≠ 0 := by
  obtain ⟨m, hm⟩ := lineCaseCheck_retained maps A h certificate hcheck u hrelation
    hnonzero hdistinct hnot
  have hpivot := (lineCaseCheck_conditions maps A h certificate hcheck).1
  obtain ⟨g, hg, w, hw, hscale, hnonzero'⟩ :=
    lineElimination_primitive_image A h certificate.pivot hpivot u hrelation hnonzero
  rw [hm] at hscale hnonzero'
  exact ⟨m, g, hg, w, hw, hscale, hnonzero'⟩

theorem line_cross_scale_absoluteSpeeds (v w : FiveIntegerVector) (g : ℕ) (b : ℤ)
    (hscale : (g : ℤ) • w = b • v) :
    (Modular.absoluteSpeeds w).map (fun d => g * d) =
      (Modular.absoluteSpeeds v).map (fun d => b.natAbs * d) := by
  simp only [Modular.absoluteSpeeds, List.map_ofFn]
  congr 1
  funext i
  have h := congrArg Int.natAbs (congrFun hscale i)
  simpa only [Function.comp_apply, Pi.smul_apply, smul_eq_mul,
    Int.natAbs_mul, Int.natAbs_natCast] using h

theorem line_cross_scale_primitiveDirection (v w : FiveIntegerVector)
    (g : ℕ) (hg : 0 < g) (b : ℤ) (hb : b ≠ 0)
    (hscale : (g : ℤ) • w = b • v) :
    Modular.primitiveDirection w = Modular.primitiveDirection v := by
  have hn := Modular.normalize_eq_of_cross_scale hg (Int.natAbs_pos.mpr hb)
    (line_cross_scale_absoluteSpeeds v w g b hscale)
  unfold Modular.primitiveDirection
  rw [hn]

theorem line_cross_scale_value (v w : FiveIntegerVector)
    (g : ℕ) (hg : 0 < g) (b : ℤ) (hb : b ≠ 0)
    (hscale : (g : ℤ) • w = b • v) :
    value (integerSpeeds w) = value (integerSpeeds v) := by
  have hv := congrArg value (line_cross_scale_absoluteSpeeds v w g b hscale)
  rw [Normalization.value_scale _ g hg,
    Normalization.value_scale _ b.natAbs (Int.natAbs_pos.mpr hb)] at hv
  rw [line_value_integerSpeeds, line_value_integerSpeeds]
  exact hv

theorem line_cross_scale_critical_iff (v w : FiveIntegerVector)
    (g : ℕ) (hg : 0 < g) (b : ℤ) (hb : b ≠ 0)
    (hscale : (g : ℤ) • w = b • v) :
    ContainsCriticalQuadruple (integerSpeeds w) ↔
      ContainsCriticalQuadruple (integerSpeeds v) := by
  have hmap := line_cross_scale_absoluteSpeeds v w g b hscale
  rw [line_critical_integerSpeeds, line_critical_integerSpeeds]
  calc
    ContainsCriticalQuadruple (Modular.absoluteSpeeds w) ↔
        ContainsCriticalQuadruple ((Modular.absoluteSpeeds w).map (fun d => g * d)) :=
      (containsCriticalQuadruple_map_mul_iff _ g hg).symm
    _ ↔ ContainsCriticalQuadruple
        ((Modular.absoluteSpeeds v).map (fun d => b.natAbs * d)) := by rw [hmap]
    _ ↔ ContainsCriticalQuadruple (Modular.absoluteSpeeds v) :=
      containsCriticalQuadruple_map_mul_iff _ b.natAbs (Int.natAbs_pos.mpr hb)

theorem line_cross_scale_nonzero (v w : FiveIntegerVector) (g : ℕ) (b : ℤ)
    (hb : b ≠ 0) (hscale : (g : ℤ) • w = b • v) (hv : ∀ i, v i ≠ 0) :
    ∀ i, w i ≠ 0 := by
  intro i hi
  have h := congrFun hscale i
  change (g : ℤ) * w i = b * v i at h
  rw [hi, mul_zero] at h
  exact (mul_ne_zero hb (hv i)) h.symm

theorem line_cross_scale_distinct (v w : FiveIntegerVector) (g : ℕ) (b : ℤ)
    (hb : b ≠ 0) (hscale : (g : ℤ) • w = b • v)
    (hv : Function.Injective (fun i => (v i).natAbs)) :
    Function.Injective (fun i => (w i).natAbs) := by
  intro i j hij
  apply hv
  have hbabs : b.natAbs ≠ 0 := Int.natAbs_ne_zero.mpr hb
  apply Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero hbabs)
  have hi := congrArg Int.natAbs (congrFun hscale i)
  have hj := congrArg Int.natAbs (congrFun hscale j)
  simp only [Pi.smul_apply, smul_eq_mul, Int.natAbs_mul, Int.natAbs_natCast] at hi hj
  exact hi.symm.trans ((congrArg (fun d => g * d) hij).trans hj)

end Loneliness.FiveSpeedCertificate
