import Conjectures.LonelinessCriticalBase
import Mathlib.Data.Nat.BitIndices
import Mathlib.Data.Nat.Bitwise

/-! Exact real interval semantics for the finite phase arguments in Renault's
five-speed proof. The certificate checker uses integer endpoint inequalities;
the theorems below establish them for every real point of each interval. -/

namespace Loneliness.Renault

open CriticalFamilies

theorem distance_strict_of_cell {x r : ℝ} {k : ℤ}
    (hl : r < x - k) (hu : x - k < 1 - r) : r < distance x := by
  rcases le_or_gt (round x) k with hk | hk
  · have hk' : (round x : ℝ) ≤ k := by exact_mod_cast hk
    exact lt_of_lt_of_le (by linarith : r < x - round x) (le_abs_self _)
  · have hki : k + 1 ≤ round x := by omega
    have hk' : (k : ℝ) + 1 ≤ round x := by exact_mod_cast hki
    exact lt_of_lt_of_le (by linarith : r < -(x - round x)) (neg_le_abs _)

theorem distance_eq_min_fract (x : ℝ) :
    distance x = min (Int.fract x) (1 - Int.fract x) :=
  abs_sub_round_eq_min x

theorem distance_nat_mul_distance (a : ℕ) (x : ℝ) :
    distance ((a : ℝ) * distance x) = distance ((a : ℝ) * x) := by
  change distance ((a : ℝ) * |x - (round x : ℝ)|) = distance ((a : ℝ) * x)
  rcases le_or_gt (0 : ℝ) (x - round x) with hx | hx
  · rw [abs_of_nonneg hx]
    have he : (a : ℝ) * (x - round x) =
        (a : ℝ) * x + ((-(a : ℤ) * round x : ℤ) : ℝ) := by
      push_cast
      ring
    rw [he, distance_add_int]
  · rw [abs_of_neg hx]
    have he : (a : ℝ) * -(x - round x) =
        -((a : ℝ) * x) + (((a : ℤ) * round x : ℤ) : ℝ) := by
      push_cast
      ring
    rw [he, distance_add_int, distance_neg]

theorem distance_mul_fract_eq (a : ℕ) (x z : ℝ) :
    distance ((a : ℝ) * Int.fract x + z) = distance ((a : ℝ) * x + z) := by
  have he : (a : ℝ) * Int.fract x + z =
      ((a : ℝ) * x + z) + ((-(a : ℤ) * ⌊x⌋ : ℤ) : ℝ) := by
    rw [Int.fract]
    push_cast
    ring
  rw [he, distance_add_int]

theorem distance_of_unit_interval {x : ℝ} (hl : 0 ≤ x) (hu : x ≤ 1) :
    distance x = min x (1 - x) := by
  apply le_antisymm
  · apply le_min
    · simpa only [Int.cast_zero, sub_zero, abs_of_nonneg hl] using distance_le_int x 0
    · have hx : x - 1 ≤ 0 := by linarith
      simpa only [Int.cast_one, abs_of_nonpos hx, neg_sub] using distance_le_int x 1
  · apply distance_lower_of_cell (k := 0)
    · simp
    · have h := min_le_right x (1 - x)
      simpa using (show x ≤ 1 - min x (1 - x) by linarith)

theorem distance_add_half (x : ℝ) : distance (x + 1 / 2) = 1 / 2 - distance x := by
  have h0 := Int.fract_nonneg x
  have h1 := Int.fract_lt_one x
  have hx : distance (Int.fract x + 1 / 2) = distance (x + 1 / 2) := by
    simpa using distance_mul_fract_eq 1 x (1 / 2)
  rw [← hx, distance_eq_min_fract x]
  by_cases hhalf : Int.fract x ≤ 1 / 2
  · rw [distance_of_unit_interval (by linarith) (by linarith)]
    rw [min_eq_left (by linarith : Int.fract x ≤ 1 - Int.fract x)]
    rw [min_eq_right (by linarith :
      1 - (Int.fract x + 1 / 2) ≤ Int.fract x + 1 / 2)]
    ring
  · have he : Int.fract x + 1 / 2 = (Int.fract x - 1 / 2) + (1 : ℤ) := by
      norm_num
      ring
    rw [he, distance_add_int,
      distance_of_unit_interval (by linarith) (by linarith)]
    rw [min_eq_right (by linarith : 1 - Int.fract x ≤ Int.fract x)]
    rw [min_eq_left (by linarith :
      Int.fract x - 1 / 2 ≤ 1 - (Int.fract x - 1 / 2))]
    ring

theorem three_five_distance_band (r s : ℝ)
    (hr : 0 < r) (hrhi : r < 1 / 6) (hrs : r ≤ s) (hs : s ≤ 1 / 2)
    (hthree : distance (3 * s) ≤ r) (hfive : distance (5 * s) ≤ r) :
    1 / 10 < r ∧ 11 / 30 < s ∧ s < 7 / 18 := by
  obtain ⟨hthreeL, hthreeU⟩ := abs_le.mp hthree
  obtain ⟨hfiveL, hfiveU⟩ := abs_le.mp hfive
  have hkthree : round (3 * s) = 1 := by
    have hlo : 0 < round (3 * s) := by
      by_contra hn
      have hk : round (3 * s) ≤ 0 := by omega
      have hkR : (round (3 * s) : ℝ) ≤ 0 := by exact_mod_cast hk
      linarith
    have hhi : round (3 * s) < 2 := by
      by_contra hn
      have hk : 2 ≤ round (3 * s) := by omega
      have hkR : (2 : ℝ) ≤ round (3 * s) := by exact_mod_cast hk
      linarith
    omega
  norm_num [hkthree] at hthreeL hthreeU
  have hslow : 5 / 18 < s := by linarith
  have hkfive : round (5 * s) = 2 := by
    have hlo : 1 < round (5 * s) := by
      by_contra hn
      have hk : round (5 * s) ≤ 1 := by omega
      have hkR : (round (5 * s) : ℝ) ≤ 1 := by exact_mod_cast hk
      linarith
    have hhi : round (5 * s) < 3 := by
      by_contra hn
      have hk : 3 ≤ round (5 * s) := by omega
      have hkR : (3 : ℝ) ≤ round (5 * s) := by exact_mod_cast hk
      linarith
    omega
  norm_num [hkfive] at hfiveL hfiveU
  exact ⟨by linarith, by linarith, by linarith⟩

theorem double_half_strict_of_outer (x : ℝ)
    (h : distance x < 1 / 6 ∨ 1 / 3 < distance x) :
    (1 / 6 : ℝ) < distance (2 * x + 1 / 2) := by
  have hnonneg := distance_nonneg x
  have hhalf := distance_le_half x
  have he : distance (2 * distance x) = distance (2 * x) := by
    simpa using distance_nat_mul_distance 2 x
  rw [distance_add_half, ← he]
  rcases h with h | h
  · have hb := distance_le_int (2 * distance x) 0
    have hn : 0 ≤ 2 * distance x := by linarith
    simp only [Int.cast_zero, sub_zero, abs_of_nonneg hn] at hb
    linarith
  · have hb := distance_le_int (2 * distance x) 1
    have hn : 2 * distance x - 1 ≤ 0 := by linarith
    simp only [Int.cast_one, abs_of_nonpos hn] at hb
    linarith

theorem two_odd_phase_improvement (x y : ℝ)
    (hfirst : ¬ ((1 / 6 : ℝ) ≤ distance x ∧ (1 / 6 : ℝ) ≤ distance y))
    (hsecond : ¬ ((1 / 6 : ℝ) ≤ distance (x + 1 / 2) ∧
      (1 / 6 : ℝ) ≤ distance (y + 1 / 2))) :
    (1 / 6 : ℝ) < distance (2 * x + 1 / 2) ∧
      (1 / 6 : ℝ) < distance (2 * y + 1 / 2) := by
  rw [distance_add_half, distance_add_half] at hsecond
  by_cases hx : distance x < 1 / 6
  · have hy : 1 / 3 < distance y := by
      by_contra hn
      apply hsecond
      constructor <;> linarith
    exact ⟨double_half_strict_of_outer x (Or.inl hx),
      double_half_strict_of_outer y (Or.inr hy)⟩
  · have hy : distance y < 1 / 6 := by
      by_contra hn
      exact hfirst ⟨le_of_not_gt hx, le_of_not_gt hn⟩
    have hx' : 1 / 3 < distance x := by
      by_contra hn
      apply hsecond
      constructor <;> linarith
    exact ⟨double_half_strict_of_outer x (Or.inr hx'),
      double_half_strict_of_outer y (Or.inl hy)⟩

structure PhaseAction where
  multiplier : ℕ
  shift : ℕ
  strict : Bool
  deriving DecidableEq, Repr

def PhaseAction.Good (a : PhaseAction) (coefficient : ℕ) (x : ℝ) : Prop :=
  if a.strict = true then
    (1 / 6 : ℝ) < distance ((a.multiplier : ℝ) * x + coefficient * a.shift / 6)
  else
    (1 / 6 : ℝ) ≤ distance ((a.multiplier : ℝ) * x + coefficient * a.shift / 6)

theorem PhaseAction.good_fract_iff (a : PhaseAction) (coefficient : ℕ) (x : ℝ) :
    a.Good coefficient (Int.fract x) ↔ a.Good coefficient x := by
  simp only [PhaseAction.Good, distance_mul_fract_eq]

/-- A singleton when the endpoints agree, and an open interval otherwise.
Endpoints are integral coordinates on the grid with denominator 360. -/
structure PhaseCell where
  left : ℕ
  right : ℕ
  deriving DecidableEq, Repr

def PhaseCell.Contains (cell : PhaseCell) (x : ℝ) : Prop :=
  if cell.left = cell.right then 360 * x = cell.left
  else (cell.left : ℝ) < 360 * x ∧ 360 * x < cell.right

def phaseActionCheck (action : PhaseAction) (coefficient : ℕ) (cell : PhaseCell) : Bool :=
  let a := action.multiplier
  let offset := 60 * coefficient * action.shift
  let q := (a * cell.left + offset) / 360
  decide (0 < a ∧
    if cell.left = cell.right ∧ action.strict = true then
      360 * q + 60 < a * cell.left + offset ∧
        a * cell.right + offset < 360 * q + 300
    else
      360 * q + 60 ≤ a * cell.left + offset ∧
        a * cell.right + offset ≤ 360 * q + 300)

theorem phaseActionCheck_sound (action : PhaseAction) (coefficient : ℕ)
    (cell : PhaseCell) (x : ℝ)
    (hcheck : phaseActionCheck action coefficient cell = true)
    (hx : cell.Contains x) : action.Good coefficient x := by
  let q := (action.multiplier * cell.left + 60 * coefficient * action.shift) / 360
  have h := of_decide_eq_true hcheck
  change 0 < action.multiplier ∧
    (if cell.left = cell.right ∧ action.strict = true then
      360 * q + 60 < action.multiplier * cell.left + 60 * coefficient * action.shift ∧
        action.multiplier * cell.right + 60 * coefficient * action.shift < 360 * q + 300
    else
      360 * q + 60 ≤ action.multiplier * cell.left + 60 * coefficient * action.shift ∧
        action.multiplier * cell.right + 60 * coefficient * action.shift ≤ 360 * q + 300) at h
  have ha : (0 : ℝ) < action.multiplier := by exact_mod_cast h.1
  have hw : 360 * q + 60 ≤ action.multiplier * cell.left + 60 * coefficient * action.shift ∧
      action.multiplier * cell.right + 60 * coefficient * action.shift ≤ 360 * q + 300 := by
    by_cases hs : cell.left = cell.right ∧ action.strict = true
    · rw [ite_eq_left hs] at h
      exact ⟨h.2.1.le, h.2.2.le⟩
    · simpa only [ite_eq_right hs] using h.2
  have hlo : 360 * (q : ℝ) + 60 ≤
      (action.multiplier : ℝ) * cell.left + 60 * coefficient * action.shift := by
    exact_mod_cast hw.1
  have hhi : (action.multiplier : ℝ) * cell.right + 60 * coefficient * action.shift ≤
      360 * (q : ℝ) + 300 := by exact_mod_cast hw.2
  by_cases hp : cell.left = cell.right
  · have hpoint : 360 * x = cell.left := by simpa only [PhaseCell.Contains, ite_eq_left hp] using hx
    have hprod : (action.multiplier : ℝ) * (360 * x) = action.multiplier * cell.left :=
      congrArg (fun z : ℝ => (action.multiplier : ℝ) * z) hpoint
    rw [← hp] at hhi
    by_cases hs : action.strict = true
    · rw [ite_eq_left ⟨hp, hs⟩] at h
      have hslo : 360 * (q : ℝ) + 60 <
          (action.multiplier : ℝ) * cell.left + 60 * coefficient * action.shift := by
        exact_mod_cast h.2.1
      have hshi : (action.multiplier : ℝ) * cell.right + 60 * coefficient * action.shift <
          360 * (q : ℝ) + 300 := by exact_mod_cast h.2.2
      rw [← hp] at hshi
      simp only [PhaseAction.Good, ite_eq_left hs]
      apply distance_strict_of_cell (k := (q : ℤ)) <;> push_cast <;> nlinarith
    · simp only [PhaseAction.Good, ite_eq_right hs]
      apply distance_lower_of_cell (k := (q : ℤ)) <;> push_cast <;> nlinarith
  · have hx' : (cell.left : ℝ) < 360 * x ∧ 360 * x < cell.right := by
      simpa only [PhaseCell.Contains, ite_eq_right hp] using hx
    have hprodlo := mul_lt_mul_of_pos_left hx'.1 ha
    have hprodhi := mul_lt_mul_of_pos_left hx'.2 ha
    have hg : (1 / 6 : ℝ) <
        distance ((action.multiplier : ℝ) * x + coefficient * action.shift / 6) := by
      apply distance_strict_of_cell (k := (q : ℤ)) <;> push_cast <;> nlinarith
    unfold PhaseAction.Good
    split_ifs
    · exact hg
    · exact hg.le

def phaseMaskCheck (actions : ℕ → PhaseAction) (coefficient mask : ℕ)
    (cell : PhaseCell) : Bool :=
  mask.bitIndices.all (fun i => phaseActionCheck (actions i) coefficient cell)

def PhaseMaskGood (actions : ℕ → PhaseAction) (coefficient mask : ℕ) (x : ℝ) : Prop :=
  ∀ i, mask.testBit i = true → (actions i).Good coefficient x

theorem phaseMaskCheck_sound (actions : ℕ → PhaseAction) (coefficient mask : ℕ)
    (cell : PhaseCell) (x : ℝ)
    (hcheck : phaseMaskCheck actions coefficient mask cell = true)
    (hx : cell.Contains x) : PhaseMaskGood actions coefficient mask x := by
  intro i hi
  have h := List.all_eq_true.mp hcheck i (Nat.mem_bitIndices.mpr hi)
  exact phaseActionCheck_sound _ _ _ _ h hx

/-- A chain alternating singleton endpoints and open gaps. Its final endpoint
is included. Every stored mask must occur in the supplied finite mask table. -/
inductive PhaseCover where
  | single (point mask : ℕ)
  | next (left right pointMask openMask : ℕ) (rest : PhaseCover)
  deriving Repr

def PhaseCover.lower : PhaseCover → ℕ
  | .single point _ => point
  | .next left _ _ _ _ => left

def PhaseCover.upper : PhaseCover → ℕ
  | .single point _ => point
  | .next _ _ _ _ rest => rest.upper

def PhaseCover.check (actions : ℕ → PhaseAction) (coefficient : ℕ) (masks : List ℕ) :
    PhaseCover → Bool
  | .single point mask =>
      decide (mask ∈ masks) && phaseMaskCheck actions coefficient mask ⟨point, point⟩
  | .next left right pointMask openMask rest =>
      decide (left < right ∧ rest.lower = right ∧ pointMask ∈ masks ∧ openMask ∈ masks) &&
        (phaseMaskCheck actions coefficient pointMask ⟨left, left⟩ &&
          (phaseMaskCheck actions coefficient openMask ⟨left, right⟩ &&
            rest.check actions coefficient masks))

theorem PhaseCover.check_sound (cover : PhaseCover) (actions : ℕ → PhaseAction)
    (coefficient : ℕ) (masks : List ℕ) (x : ℝ)
    (hcheck : cover.check actions coefficient masks = true)
    (hlo : (cover.lower : ℝ) ≤ 360 * x) (hhi : 360 * x ≤ cover.upper) :
    ∃ mask ∈ masks, PhaseMaskGood actions coefficient mask x := by
  induction cover generalizing x with
  | single point mask =>
    simp only [PhaseCover.check, Bool.and_eq_true, decide_eq_true_eq] at hcheck
    refine ⟨mask, hcheck.1, phaseMaskCheck_sound _ _ _ _ _ hcheck.2 ?_⟩
    simpa [PhaseCell.Contains, PhaseCover.lower, PhaseCover.upper] using le_antisymm hhi hlo
  | next left right pointMask openMask rest ih =>
    simp only [PhaseCover.check, Bool.and_eq_true, decide_eq_true_eq] at hcheck
    obtain ⟨⟨hlt, hjoin, hpoint, hopen⟩, hpcheck, hgcheck, hrcheck⟩ := hcheck
    change (left : ℝ) ≤ 360 * x at hlo
    change 360 * x ≤ rest.upper at hhi
    by_cases hp : 360 * x = left
    · refine ⟨pointMask, hpoint, phaseMaskCheck_sound _ _ _ _ _ hpcheck ?_⟩
      simpa [PhaseCell.Contains] using hp
    · by_cases hg : 360 * x < right
      · refine ⟨openMask, hopen, phaseMaskCheck_sound _ _ _ _ _ hgcheck ?_⟩
        simp only [PhaseCell.Contains, ite_eq_right (ne_of_lt hlt)]
        exact ⟨lt_of_le_of_ne hlo (Ne.symm hp), hg⟩
      · apply ih _ hrcheck _ hhi
        rw [hjoin]
        exact le_of_not_gt hg

def phaseTripleCheck (first second third : List ℕ) : Bool :=
  first.all (fun a => second.all (fun b => third.all (fun c => decide (a &&& b &&& c ≠ 0))))

theorem exists_set_bit {mask : ℕ} (h : mask ≠ 0) : ∃ i, mask.testBit i = true := by
  by_contra hn
  push Not at hn
  apply h
  apply Nat.zero_of_testBit_eq_false
  intro i
  simpa only [Bool.not_eq_true] using hn i

theorem phaseTripleCheck_sound (first second third : List ℕ)
    (hcheck : phaseTripleCheck first second third = true)
    (a b c : ℕ) (ha : a ∈ first) (hb : b ∈ second) (hc : c ∈ third) :
    ∃ i, a.testBit i = true ∧ b.testBit i = true ∧ c.testBit i = true := by
  simp only [phaseTripleCheck, List.all_eq_true, decide_eq_true_eq] at hcheck
  obtain ⟨i, hi⟩ := exists_set_bit (hcheck a ha b hb c hc)
  simp only [Nat.testBit_and, Bool.and_eq_true] at hi
  exact ⟨i, hi.1.1, hi.1.2, hi.2⟩

theorem phase_three_covers (actions : ℕ → PhaseAction) (coefficients : Fin 3 → ℕ)
    (covers : Fin 3 → PhaseCover) (masks : Fin 3 → List ℕ) (x : Fin 3 → ℝ)
    (hcover : ∀ i, (covers i).check actions (coefficients i) (masks i) = true)
    (htriple : phaseTripleCheck (masks 0) (masks 1) (masks 2) = true)
    (hlo : ∀ i, ((covers i).lower : ℝ) ≤ 360 * Int.fract (x i))
    (hhi : ∀ i, 360 * Int.fract (x i) ≤ (covers i).upper) :
    ∃ a, ∀ i, (actions a).Good (coefficients i) (x i) := by
  obtain ⟨a, ha, hax⟩ := (covers 0).check_sound actions (coefficients 0) (masks 0)
    (Int.fract (x 0)) (hcover 0) (hlo 0) (hhi 0)
  obtain ⟨b, hb, hbx⟩ := (covers 1).check_sound actions (coefficients 1) (masks 1)
    (Int.fract (x 1)) (hcover 1) (hlo 1) (hhi 1)
  obtain ⟨c, hc, hcx⟩ := (covers 2).check_sound actions (coefficients 2) (masks 2)
    (Int.fract (x 2)) (hcover 2) (hlo 2) (hhi 2)
  obtain ⟨i, hai, hbi, hci⟩ := phaseTripleCheck_sound _ _ _ htriple a b c ha hb hc
  refine ⟨i, ?_⟩
  intro j
  have hj : j = 0 ∨ j = 1 ∨ j = 2 := by omega
  rcases hj with rfl | rfl | rfl
  · exact ((actions i).good_fract_iff _ _).mp (hax i hai)
  · exact ((actions i).good_fract_iff _ _).mp (hbx i hbi)
  · exact ((actions i).good_fract_iff _ _).mp (hcx i hci)

end Loneliness.Renault
