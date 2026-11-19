import Conjectures.HadamardQuotient133Model
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

namespace HadamardQuotient133

open scoped BigOperators

def digits : List ℤ := [-9, -7, -5, -3, -1, 1, 3, 5, 7, 9]
def smallDigits : List ℤ := [-3, -1, 1, 3]

def BoundedOdd (r : Row) : Prop :=
  ∀ i j, -9 ≤ r i j ∧ r i j ≤ 9 ∧ r i j % 2 = 1

theorem mem_digits_iff (x : ℤ) :
    x ∈ digits ↔ -9 ≤ x ∧ x ≤ 9 ∧ x % 2 = 1 := by
  simp only [digits, List.mem_cons, List.not_mem_nil, or_false]
  omega

theorem mem_smallDigits_iff (x : ℤ) :
    x ∈ smallDigits ↔ -3 ≤ x ∧ x ≤ 3 ∧ x % 2 = 1 := by
  simp only [smallDigits, List.mem_cons, List.not_mem_nil, or_false]
  omega

theorem digit_square_lower {x : ℤ} (hx : x ∈ digits) : 1 ≤ x ^ 2 := by
  simp only [digits, List.mem_cons, List.not_mem_nil, or_false] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    norm_num

theorem triple_energy_lower (t : Triple) (ht : ∀ i, t i ∈ digits) :
    19 ≤ tripleEnergy t := by
  have h0 := digit_square_lower (ht 0)
  have h1 := digit_square_lower (ht 1)
  have h2 := digit_square_lower (ht 2)
  dsimp [tripleEnergy]
  linarith

theorem energy133_lower (r : Row) (hr : ∀ i j, r i j ∈ digits) :
    133 ≤ energy133 r := by
  have h0 := triple_energy_lower (r 0) (hr 0)
  have h1 := triple_energy_lower (r 1) (hr 1)
  have h2 := triple_energy_lower (r 2) (hr 2)
  dsimp [energy133]
  linarith

theorem norm7_nonneg (r : Row) : 0 ≤ norm7 r := by
  unfold norm7
  positivity

theorem norm19_nonneg (r : Row) : 0 ≤ norm19 r := by
  unfold norm19
  positivity

structure Feasible (r : Row) : Prop where
  digit : ∀ i j, r i j ∈ digits
  normalized : weightedSum r = 1
  energy : energy133 r ≤ 2245
  seven : norm7 r ≤ 9584
  nineteen : norm19 r ≤ 9584

theorem signatures133_of_correlations (a b : Row)
    (h : ∀ t, correlation133 a t + correlation133 b t =
      if t = 0 then 2378 else -18) :
    ∀ k, signature133 a k + signature133 b k = target133 k := by
  intro k
  rw [← correlation133_eq_signature a k, ← correlation133_eq_signature b k]
  rw [h]
  fin_cases k <;> norm_num [shifts133, target133] <;> decide

theorem feasible_of_pair (a b : Row)
    (ha : BoundedOdd a) (hb : BoundedOdd b)
    (hsa : weightedSum a = 1) (hsb : weightedSum b = 1)
    (h : ∀ k, signature133 a k + signature133 b k = target133 k) :
    Feasible a ∧ Feasible b := by
  have hda : ∀ i j, a i j ∈ digits := fun i j => (mem_digits_iff _).2 (ha i j)
  have hdb : ∀ i j, b i j ∈ digits := fun i j => (mem_digits_iff _).2 (hb i j)
  have h0 := h 0
  have h1 := h 1
  have h2 := h 2
  have h3 := h 3
  have h4 := h 4
  norm_num [target133] at h0 h1 h2 h3 h4
  have he : energy133 a + energy133 b = 2378 := by
    simpa only [signature133_zero] using h0
  have hn7 : norm7 a + norm7 b = 9584 := by
    rw [norm7_formula a hsa, norm7_formula b hsb]
    linarith
  have hn19 : norm19 a + norm19 b = 9584 := by
    rw [norm19_formula a hsa, norm19_formula b hsb]
    linarith
  have hea := energy133_lower a hda
  have heb := energy133_lower b hdb
  have h7a := norm7_nonneg a
  have h7b := norm7_nonneg b
  have h19a := norm19_nonneg a
  have h19b := norm19_nonneg b
  exact ⟨⟨hda, hsa, by omega, by omega, by omega⟩,
    ⟨hdb, hsb, by omega, by omega, by omega⟩⟩

theorem norm7_coordinates_bound (a b : ℤ)
    (h : (2 - 7 * (a + b)) ^ 2 + 7 * (a - b) ^ 2 ≤ 9584) :
    (-19 ≤ a ∧ a ≤ 19) ∧ (-19 ≤ b ∧ b ≤ 19) := by
  have ha : 49 * a ^ 2 - 14 * a + 1 ≤ 19168 := by
    nlinarith [sq_nonneg (4 * b + 3 * a - 1)]
  have hb : 49 * b ^ 2 - 14 * b + 1 ≤ 19168 := by
    nlinarith [sq_nonneg (4 * a + 3 * b - 1)]
  constructor
  · constructor
    · by_contra hbad
      have : a ≤ -20 := by omega
      nlinarith [sq_nonneg (a + 20)]
    · by_contra hbad
      have : 20 ≤ a := by omega
      nlinarith [sq_nonneg (a - 20)]
  · constructor
    · by_contra hbad
      have : b ≤ -20 := by omega
      nlinarith [sq_nonneg (b + 20)]
    · by_contra hbad
      have : 20 ≤ b := by omega
      nlinarith [sq_nonneg (b - 20)]

theorem fin3_eta {α : Type*} (t : Fin 3 → α) : ![t 0, t 1, t 2] = t := by
  ext i
  fin_cases i <;> rfl

def digitTriples : List Triple :=
  digits.flatMap fun a => digits.flatMap fun b => digits.map fun c => ![a, b, c]

theorem mem_digitTriples (t : Triple) :
    t ∈ digitTriples ↔ ∀ i, t i ∈ digits := by
  constructor
  · intro ht
    obtain ⟨a, ha, ht⟩ := List.mem_flatMap.mp ht
    obtain ⟨b, hb, ht⟩ := List.mem_flatMap.mp ht
    obtain ⟨c, hc, he⟩ := List.mem_map.mp ht
    subst t
    intro i
    fin_cases i
    · exact ha
    · exact hb
    · exact hc
  · intro ht
    apply List.mem_flatMap.mpr
    refine ⟨t 0, ht 0, ?_⟩
    apply List.mem_flatMap.mpr
    refine ⟨t 1, ht 1, ?_⟩
    exact List.mem_map.mpr ⟨t 2, ht 2, fin3_eta t⟩

def eligibleTriples : List Triple :=
  digitTriples.filter fun t =>
    decide (-19 ≤ tripleSum t ∧ tripleSum t ≤ 19 ∧ tripleEnergy t ≤ 723)

theorem feasible_outer_mem (r : Row) (hr : Feasible r) :
    r 1 ∈ eligibleTriples ∧ r 2 ∈ eligibleTriples := by
  have h0 := triple_energy_lower (r 0) (hr.digit 0)
  have h1 := triple_energy_lower (r 1) (hr.digit 1)
  have h2 := triple_energy_lower (r 2) (hr.digit 2)
  have he := hr.energy
  dsimp [energy133] at he
  have hb := norm7_coordinates_bound (tripleSum (r 1)) (tripleSum (r 2)) hr.seven
  constructor
  · apply List.mem_filter.mpr
    exact ⟨(mem_digitTriples _).2 (hr.digit 1),
      by simpa only [decide_eq_true_eq] using
        (show -19 ≤ tripleSum (r 1) ∧ tripleSum (r 1) ≤ 19 ∧
          tripleEnergy (r 1) ≤ 723 from ⟨hb.1.1, hb.1.2, by omega⟩)⟩
  · apply List.mem_filter.mpr
    exact ⟨(mem_digitTriples _).2 (hr.digit 2),
      by simpa only [decide_eq_true_eq] using
        (show -19 ≤ tripleSum (r 2) ∧ tripleSum (r 2) ≤ 19 ∧
          tripleEnergy (r 2) ≤ 723 from ⟨hb.2.1, hb.2.2, by omega⟩)⟩

def zeroTriples (s : ℤ) : List Triple :=
  digits.flatMap fun a =>
    if (s - a) % 9 = 0 then
      digits.flatMap fun b =>
        let c := (s - a) / 9 - b
        if c ∈ digits then [![a, b, c]] else []
    else []

theorem mem_zeroTriples (t : Triple) (s : ℤ)
    (ht : ∀ i, t i ∈ digits) (hs : tripleSum t = s) :
    t ∈ zeroTriples s := by
  have hsum : t 0 + 9 * (t 1 + t 2) = s := hs
  have hmod : (s - t 0) % 9 = 0 := by omega
  have hlast : (s - t 0) / 9 - t 1 = t 2 := by omega
  apply List.mem_flatMap.mpr
  refine ⟨t 0, ht 0, ?_⟩
  rw [ite_eq_left hmod]
  apply List.mem_flatMap.mpr
  refine ⟨t 1, ht 1, ?_⟩
  dsimp only
  rw [hlast, ite_eq_left (ht 2)]
  exact List.mem_singleton.mpr (fin3_eta t).symm

def rowBlock (u v : Triple) : List Row :=
  if 3 * (tripleEnergy u + tripleEnergy v) ≤ 2226 ∧
      (2 - 7 * (tripleSum u + tripleSum v)) ^ 2 +
        7 * (tripleSum u - tripleSum v) ^ 2 ≤ 9584 then
    (zeroTriples (1 - 3 * (tripleSum u + tripleSum v))).flatMap fun w =>
      let r : Row := ![w, u, v]
      if energy133 r ≤ 2245 ∧ norm19 r ≤ 9584 then [r] else []
  else []

def rowsFor (u : Triple) : List Row :=
  eligibleTriples.flatMap (rowBlock u)

theorem feasible_mem_rowBlock (r : Row) (hr : Feasible r) :
    r ∈ rowBlock (r 1) (r 2) := by
  have hzero := triple_energy_lower (r 0) (hr.digit 0)
  have he := hr.energy
  dsimp [energy133] at he
  have hpre :
      3 * (tripleEnergy (r 1) + tripleEnergy (r 2)) ≤ 2226 ∧
      (2 - 7 * (tripleSum (r 1) + tripleSum (r 2))) ^ 2 +
        7 * (tripleSum (r 1) - tripleSum (r 2)) ^ 2 ≤ 9584 :=
    ⟨by omega, hr.seven⟩
  have hsum : tripleSum (r 0) =
      1 - 3 * (tripleSum (r 1) + tripleSum (r 2)) := by
    have hs := hr.normalized
    dsimp [weightedSum] at hs
    omega
  rw [rowBlock, ite_eq_left hpre]
  apply List.mem_flatMap.mpr
  refine ⟨r 0, mem_zeroTriples (r 0) _ (hr.digit 0) hsum, ?_⟩
  dsimp only
  have hbounds : energy133 r ≤ 2245 ∧ norm19 r ≤ 9584 := ⟨hr.energy, hr.nineteen⟩
  rw [fin3_eta r, ite_eq_left hbounds]
  exact List.mem_singleton.mpr rfl

theorem feasible_mem_rowsFor (r : Row) (hr : Feasible r) :
    r 1 ∈ eligibleTriples ∧ r ∈ rowsFor (r 1) := by
  obtain ⟨hu, hv⟩ := feasible_outer_mem r hr
  exact ⟨hu, List.mem_flatMap.mpr ⟨r 2, hv, feasible_mem_rowBlock r hr⟩⟩

end HadamardQuotient133
