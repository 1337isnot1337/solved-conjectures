import Conjectures.ShiftedLonelyRunnerWeightedBand
import Conjectures.ShiftedLonelyRunnerWeightedFinite
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.Real

/-!
# Combining weighted time bounds

The intervals are scaled by a common period. Overlap among different
runners can only increase the sum of their individual covered weights.
-/

open MeasureTheory
open scoped BigOperators ENNReal

namespace ShiftedLonelyRunner.WeightedResidual

noncomputable def length (cells : List Cell) : ℝ :=
  (cells.map fun c => (c.weight : ℝ) * ((c.right : ℝ) - c.left)).sum

noncomputable def load (cells : List Cell) (s : Set ℝ) : ℝ :=
  (cells.map fun c => (c.weight : ℝ) * volume.real (c.times ∩ s)).sum

private theorem weight_le_sum_load {ι : Type*} [Fintype ι] {tracks : ι → Set ℝ}
    {cells : List Cell}
    (ordered : ∀ c ∈ cells, c.left ≤ c.right)
    (covers : ∀ c ∈ cells, c.times ⊆ ⋃ j, tracks j) :
    length cells ≤ ∑ j, load cells (tracks j) := by
  induction cells with
  | nil => simp [length, load]
  | cons c cells ih =>
    have hc : c.left ≤ c.right := ordered c (by simp)
    have hsubset : c.times ⊆ ⋃ j, c.times ∩ tracks j := by
      intro x hx
      obtain ⟨j, hj⟩ := Set.mem_iUnion.mp (covers c (by simp) hx)
      exact Set.mem_iUnion.mpr ⟨j, hx, hj⟩
    have hbounded : (volume : Measure ℝ) (⋃ j, c.times ∩ tracks j) ≠ ∞ := by
      apply measure_ne_top_of_subset (s := c.times)
      · intro x hx
        obtain ⟨j, hj⟩ := Set.mem_iUnion.mp hx
        exact hj.1
      · simp [Cell.times]
    have hlen : (c.right : ℝ) - c.left ≤ ∑ j, volume.real (c.times ∩ tracks j) := by
      rw [← Real.volume_real_Ioo_of_le (by exact_mod_cast hc : (c.left : ℝ) ≤ c.right)]
      exact (measureReal_mono hsubset hbounded).trans
        (measureReal_iUnion_fintype_le (fun j => c.times ∩ tracks j))
    have htail := ih (fun d hd => ordered d (by simp [hd])) (fun d hd => covers d (by simp [hd]))
    simp only [length, load, List.map_cons, List.sum_cons, Finset.sum_add_distrib] at htail ⊢
    rw [← Finset.mul_sum]
    exact add_le_add (mul_le_mul_of_nonneg_left hlen (by positivity)) htail

private theorem length_eq_nat {cells : List Cell}
    (ordered : ∀ c ∈ cells, c.left ≤ c.right) :
    length cells = ((cells.map (fun c => c.weight * (c.right - c.left))).sum : ℕ) := by
  induction cells with
  | nil => simp [length]
  | cons c cells ih =>
    simp only [length, List.map_cons, List.sum_cons, Nat.cast_add, Nat.cast_mul]
    rw [Nat.cast_sub (ordered c (by simp))]
    exact congrArg (fun x : ℝ => (c.weight : ℝ) * ((c.right : ℝ) - c.left) + x)
      (ih (fun d hd => ordered d (by simp [hd])))

theorem support_length : length support = 153120431 := by
  rw [length_eq_nat (fun c hc => (cell_valid hc).1.le), support_mass]
  norm_num

/-- Each set of times may come from any independently shifted runner. If seven
sets each cover at most the stated weighted length, some time is in none
and all fixed seed runners are strictly farther than 1/59 from zero. -/
theorem no_cover_of_seven_caps (tracks : Fin 7 → Set ℝ)
    (caps : ∀ j, load support (tracks j) ≤ 20159589) :
    ∃ x ∈ Set.Icc (0 : ℝ) (period : ℝ),
      (∀ p ∈ row57.tracks, (1 : ℝ) / 59 < Loneliness.distance
          ((p.2 : ℝ) / row57.scale + p.1 * (x / period))) ∧
      ∀ j, x ∉ tracks j := by
  classical
  have hfail : ¬ ∀ c ∈ support, c.times ⊆ ⋃ j, tracks j := by
    intro cover
    have h := weight_le_sum_load (fun c hc => (cell_valid hc).1.le) cover
    rw [support_length] at h
    have hc : (∑ j : Fin 7, load support (tracks j)) ≤ ∑ _j : Fin 7, (20159589 : ℝ) :=
      Finset.sum_le_sum (fun j _ => caps j)
    exact (by norm_num : ¬ (153120431 : ℝ) ≤ 7 * 20159589)
      (h.trans (by simpa using hc))
  simp only [Set.subset_def, not_forall] at hfail
  obtain ⟨c, hc, x, hx, hmiss⟩ := hfail
  refine ⟨x, ⟨lt_of_le_of_lt (Nat.cast_nonneg _) hx.1 |>.le,
    hx.2.le.trans (by exact_mod_cast (cell_valid hc).2)⟩, ?_, ?_⟩
  · intro p hp
    exact seed_misses hc hp hx
  · intro j hj
    exact hmiss (Set.mem_iUnion.mpr ⟨j, hj⟩)

/-- The single-runner upper bound uses half-open cells internally so that
period seams contribute no extra interval length. -/
theorem load_le_periodic {p u c : ℝ} {speed : ℕ} {cells : List Cell}
    (hp : 0 < p) (hu : 0 ≤ u) (hup : u < p) (hv : 0 < speed)
    (ordered : ∀ c ∈ cells, c.left ≤ c.right) :
    load cells (track p u (speed : ℝ) c) ≤ rawLoad cells p u speed c / (speed : ℝ) := by
  have hvR : (0 : ℝ) < speed := by exact_mod_cast hv
  induction cells with
  | nil => simp [load, rawLoad]
  | cons cell rest ih =>
    have hb : (cell.left : ℝ) ≤ cell.right := by
      exact_mod_cast ordered cell (by simp)
    have hsubset : cell.times ∩ track p u (speed : ℝ) c ⊆
        Set.Ico (cell.left : ℝ) (cell.right : ℝ) ∩ track p u (speed : ℝ) c :=
      Set.inter_subset_inter Set.Ioo_subset_Ico_self (fun _ h => h)
    have hmeasure := (measure_mono hsubset).trans (volume_track hp hu hup hvR hb)
    have hlen : volume.real (cell.times ∩ track p u (speed : ℝ) c) ≤
        intervalLoad p u (speed : ℝ) c cell.left cell.right := by
      simpa only [Measure.real, ENNReal.toReal_ofReal (intervalLoad_nonneg hp hu hvR hb)] using
        (ENNReal.toReal_mono (by simp : ENNReal.ofReal _ ≠ ∞) hmeasure)
    have hrest := ih (fun d hd => ordered d (by simp [hd]))
    simp only [load, rawLoad, List.map_cons, List.sum_cons] at hrest ⊢
    rw [add_div]
    refine add_le_add ?_ hrest
    rw [mul_div_assoc]
    exact mul_le_mul_of_nonneg_left hlen (by positivity)

private theorem rawLoad_translate {p u c : ℝ} (hp : 0 < p)
    (cells : List Cell) (speed : ℕ) (k : ℤ) :
    rawLoad cells p u speed (c + (k : ℝ) * p) = rawLoad cells p u speed c := by
  induction cells with
  | nil => simp [rawLoad]
  | cons cell rest ih =>
    simp only [rawLoad, List.map_cons, List.sum_cons] at ih ⊢
    rw [ih]
    congr 2
    unfold bandLengthUnits
    have h (x : ℝ) : (speed : ℝ) * x - (c + (k : ℝ) * p) =
        (speed : ℝ) * x - c + ((-k : ℤ) : ℝ) * p := by push_cast; ring
    rw [h, h, primitive_translate hp, primitive_translate hp]
    ring

private theorem only_weight_eq (cells : List Cell) :
    (cells.map (fun d => (d.weight : ℝ))).sum =
      ((cells.map Cell.weight).sum : ℕ) := by
  induction cells with
  | nil => simp
  | cons cell rest ih => simp [ih]

private theorem weighted_tail {p u c : ℝ} {speed : ℕ}
    (hp : 0 < p) (hu : 0 ≤ u) (hup : u ≤ p) (hv : 0 < speed) (cells : List Cell) :
    rawLoad cells p u speed c / (speed : ℝ) ≤
      (u / p) * length cells + (u / (speed : ℝ)) * (cells.map fun d => (d.weight : ℝ)).sum := by
  have hvR : (0 : ℝ) < speed := by exact_mod_cast hv
  induction cells with
  | nil => simp [rawLoad, length]
  | cons cell rest ih =>
    have h := intervalLoad_tail hp hu hup hvR c (cell.left : ℝ) (cell.right : ℝ)
    have hh := mul_le_mul_of_nonneg_left h (show (0 : ℝ) ≤ cell.weight by positivity)
    simp only [rawLoad, length, List.map_cons, List.sum_cons] at ih ⊢
    rw [add_div, mul_div_assoc]
    unfold intervalLoad at hh
    simp only [bandLengthUnits] at ih ⊢
    nlinarith only [hh, ih]

/-- The only certificate premise is the concrete finite-speed Boolean check.
All real phases and all remaining positive integer speeds are covered. -/
theorem all_caps_of_finite_checks
    (finite : ∀ v : ℕ, 0 < v → v ≤ 59940 → checkFiniteSpeed v = true)
    {v : ℕ} (hv : 0 < v) (c : ℝ) :
    load support (track period width (v : ℝ) c) ≤ 20159589 := by
  have hp : (0 : ℝ) < period := by norm_num [period]
  have hu : (0 : ℝ) ≤ width := Nat.cast_nonneg _
  have hup : (width : ℝ) < period := by norm_num [period, width, halfWidth]
  have hvR : (0 : ℝ) < v := by exact_mod_cast hv
  apply (load_le_periodic hp hu hup hv (fun _ h => (cell_valid h).1.le)).trans
  by_cases hfin : v ≤ 59940
  · let k : ℤ := ⌊c / (period : ℝ)⌋
    let c₀ := c - (k : ℝ) * period
    have hc₁ : 0 ≤ c₀ := sub_nonneg.mpr ((le_div_iff₀ hp).mp (Int.floor_le _))
    have hc₂ : c₀ ≤ (period : ℝ) := by
      have hh := (div_lt_iff₀ hp).mp (Int.lt_floor_add_one (c / (period : ℝ)))
      dsimp [c₀, k]
      linarith only [hh]
    have hc : c = c₀ + (k : ℝ) * (period : ℝ) := by dsimp [c₀]; ring
    rw [hc, rawLoad_translate hp]
    have h := checkWindow_sound
      (p := (period : ℤ)) (u := (width : ℤ))
      (limit := (v * 20159589 : ℕ)) (speed := v) (cells := support)
      (by decide +kernel) (by positivity) (by decide +kernel) (finite v hv hfin) hc₁ hc₂
    apply (div_le_iff₀ hvR).mpr
    push_cast at h
    convert h using 1
    ring
  · apply (weighted_tail hp hu hup.le hv support).trans
    rw [support_length, only_weight_eq support, support_weight]
    have hv' : (59941 : ℝ) ≤ v := by
      exact_mod_cast (show (59941 : ℕ) ≤ v by omega)
    have hU := div_le_div_of_nonneg_left (a := (width : ℝ)) hu (by norm_num : (0 : ℝ) < 59941) hv'
    have hmul := mul_le_mul_of_nonneg_right hU (by norm_num : (0 : ℝ) ≤ 303345)
    push_cast
    norm_num [period, width, halfWidth] at hmul ⊢
    linarith only [hmul]

/-- Closed distance to the nearest integer implies membership in the runner's
closed bands in scaled time. -/
theorem distance_hit {v : ℕ} {s x : ℝ}
    (hit : Loneliness.distance (s + v * (x / period)) ≤ (1 : ℝ) / 59) :
    x ∈ track period width (v : ℝ) (-s * (period : ℝ) - halfWidth) := by
  let k := round (s + (v : ℝ) * (x / period))
  obtain ⟨hlo, hhi⟩ := abs_le.mp hit
  change -(1 / 59 : ℝ) ≤ s + v * (x / period) - k at hlo
  change s + v * (x / period) - k ≤ (1 : ℝ) / 59 at hhi
  have hp : (0 : ℝ) < period := by norm_num [period]
  have lo := mul_le_mul_of_nonneg_right hlo hp.le
  have hi := mul_le_mul_of_nonneg_right hhi hp.le
  have scale : (s + v * (x / (period : ℝ)) - (k : ℝ)) * (period : ℝ) =
      s * period + v * x - k * (period : ℝ) := by
    rw [sub_mul, add_mul, mul_assoc, div_mul_cancel₀ _ hp.ne']
  rw [scale] at lo hi
  refine ⟨k, ?_, ?_⟩
  · norm_num [period, halfWidth] at lo ⊢
    linarith only [lo]
  · norm_num [period, width, halfWidth] at hi ⊢
    linarith only [hi]

/-- Relative to the published seed, any seven extra positive integer speeds
and arbitrary real shifts have a common time at distance strictly above
1/59. The input to this theorem is only the explicit finite arithmetic sweep. -/
theorem no_seven_of_finite_checks
    (finite : ∀ v : ℕ, 0 < v → v ≤ 59940 → checkFiniteSpeed v = true)
    (v : Fin 7 → ℕ) (positive : ∀ j, 0 < v j) (shifts : Fin 7 → ℝ) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1,
      (∀ p ∈ row57.tracks, (1 : ℝ) / 59 < Loneliness.distance
        ((p.2 : ℝ) / row57.scale + p.1 * t)) ∧
      ∀ j, (1 : ℝ) / 59 < Loneliness.distance (shifts j + v j * t) := by
  let tracks (j : Fin 7) :=
    track period width (v j : ℝ) (-(shifts j) * (period : ℝ) - halfWidth)
  have caps (j : Fin 7) : load support (tracks j) ≤ 20159589 :=
    all_caps_of_finite_checks finite (positive j) _
  obtain ⟨x, hx, old, new⟩ := no_cover_of_seven_caps tracks caps
  have hp : (0 : ℝ) < period := by norm_num [period]
  refine ⟨x / period, ⟨div_nonneg hx.1 hp.le, (div_le_one hp).mpr hx.2⟩, old, ?_⟩
  intro j
  by_contra! hj
  exact new j (distance_hit hj)

end ShiftedLonelyRunner.WeightedResidual
