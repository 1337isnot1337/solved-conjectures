import Conjectures.LonelinessGcdShift
import Conjectures.LonelinessModularFoldedSearch

/-! The gcd-weighted shift test survives independent coordinate signs and
common multiplication by a checked unit of the auxiliary modulus. Residue
coordinates may vanish or repeat. The real-value conclusions retain the
eight-speed runner bound as an explicit hypothesis.

The finite rejection predicate is exactly the divisor loop in the auxiliary
lift checker. It supplies an actual strict lower bound for every represented
positive distinct nine-speed tuple; it assumes no census or lift completeness. -/

namespace Loneliness.GcdShift

open scoped BigOperators

/-- Multiplication by a unit modulo `q` preserves divisibility by every
divisor of `q`. The inverse is an explicit finite modular equation. -/
theorem dvd_mul_iff_of_unit_mod {q d u uinv a : ℕ}
    (hdq : d ∣ q) (hunit : (u * uinv) % q = 1 % q) :
    d ∣ u * a ↔ d ∣ a := by
  have hu : Nat.ModEq q (u * uinv) 1 := hunit
  have hcancel : Nat.ModEq q (uinv * (u * a)) a := by
    simpa only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm, Nat.one_mul, Nat.mul_one]
      using hu.mul_right a
  constructor
  · intro hdiv
    exact (hcancel.dvd_iff hdq).mp (dvd_mul_of_dvd_right hdiv uinv)
  · intro hdiv
    exact dvd_mul_of_dvd_right hdiv u

/-- Either choice of sign preserves every divisor of the modulus. The
negative choice is expressed by a sum congruent to zero, so no subtraction
or canonical-residue bound is needed. -/
theorem dvd_iff_of_signed_residue {q d a c : ℕ} (hdq : d ∣ q)
    (hsigned : c % q = a % q ∨ (c + a) % q = 0) : d ∣ c ↔ d ∣ a := by
  rcases hsigned with hsame | hnegative
  · exact (show Nat.ModEq q c a from hsame).dvd_iff hdq
  · have hsum : d ∣ c + a := hdq.trans (Nat.dvd_of_mod_eq_zero hnegative)
    constructor
    · intro hc
      exact (Nat.dvd_add_iff_right hc).mpr hsum
    · intro ha
      exact (Nat.dvd_add_iff_left ha).mpr hsum

theorem dvd_iff_of_signed_unit_residue {q d u uinv a c : ℕ}
    (hdq : d ∣ q) (hunit : (u * uinv) % q = 1 % q)
    (hsigned : c % q = (u * a) % q ∨ (c + u * a) % q = 0) :
    d ∣ c ↔ d ∣ a :=
  (dvd_iff_of_signed_residue hdq hsigned).trans
    (dvd_mul_iff_of_unit_mod hdq hunit)

/-- The exact gcd multiplicity in the shift count is preserved. A unit only
modulo an unrelated prime would not suffice for this statement. -/
theorem gcd_eq_of_signed_unit_residue {q d u uinv a c : ℕ}
    (hdq : d ∣ q) (hunit : (u * uinv) % q = 1 % q)
    (hsigned : c % q = (u * a) % q ∨ (c + u * a) % q = 0) :
    Nat.gcd c d = Nat.gcd a d := by
  apply Nat.dvd_antisymm
  · apply Nat.dvd_gcd
    · exact (dvd_iff_of_signed_unit_residue
        ((Nat.gcd_dvd_right c d).trans hdq) hunit hsigned).mp
        (Nat.gcd_dvd_left c d)
    · exact Nat.gcd_dvd_right c d
  · apply Nat.dvd_gcd
    · exact (dvd_iff_of_signed_unit_residue
        ((Nat.gcd_dvd_right a d).trans hdq) hunit hsigned).mpr
        (Nat.gcd_dvd_left a d)
    · exact Nat.gcd_dvd_right a d

theorem ninthShiftWeight_eq_of_signed_unit_residue {q d u uinv a c : ℕ}
    (hdq : d ∣ q) (hunit : (u * uinv) % q = 1 % q)
    (hsigned : c % q = (u * a) % q ∨ (c + u * a) % q = 0) :
    ninthShiftWeight c d = ninthShiftWeight a d := by
  simp only [ninthShiftWeight, gcd_eq_of_signed_unit_residue hdq hunit hsigned]

/-- The signs may be chosen independently at every coordinate. No support
injectivity or nonzero-residue condition is imposed. -/
theorem ninthShiftCost_eq_of_signed_unit {n q d u uinv : ℕ}
    (v c : Fin n → ℕ) (hdq : d ∣ q) (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0) :
    ninthShiftCost c d = ninthShiftCost v d := by
  classical
  have hdiv (i : Fin n) : d ∣ c i ↔ d ∣ v i :=
    dvd_iff_of_signed_unit_residue hdq hunit (hsigned i)
  have hind : exceptionalIndices c d = exceptionalIndices v d := by
    apply Finset.ext
    intro i
    simp only [exceptionalIndices, Finset.mem_filter, Finset.mem_univ, true_and, hdiv i]
  simp only [ninthShiftCost, hind]
  apply Finset.sum_congr rfl
  intro i _hi
  exact ninthShiftWeight_eq_of_signed_unit_residue hdq hunit (hsigned i)

theorem nine_speed_shift_test_of_signed_unit_cost
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d u uinv : ℕ) (_hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hcostpos : 0 < ninthShiftCost c d) (hcost : ninthShiftCost c d < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have heq := ninthShiftCost_eq_of_signed_unit v c hdq hunit hsigned
  apply nine_speed_shift_test hLRC8 v hpositive hnodup d hd
  · rwa [← heq]
  · rwa [← heq]

/-- Literal natural-number arithmetic used by the auxiliary lift checker. -/
theorem nine_speed_shift_test_of_signed_unit_floor
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d u uinv : ℕ) (hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hcostpos : 0 < ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ c i),
      Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10))
    (hcost : (∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ c i),
      Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) :=
  nine_speed_shift_test_of_signed_unit_cost hLRC8 v c hpositive hnodup
    q d u uinv hq hd hdq hunit hsigned hcostpos hcost

/-- The manuscript's literal ceiling criterion after a common unit and
independent coordinate signs. Only the actual speed tuple is required to
be positive and distinct. -/
theorem nine_speed_shift_test_of_signed_unit
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d u uinv : ℕ) (hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hexception : ∃ i, ¬d ∣ c i)
    (hcost : (∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ c i),
      Nat.gcd (c i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (c i) d : ℕ))⌉₊) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have heq : ninthShiftCost c d =
      ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ c i),
        Nat.gcd (c i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (c i) d : ℕ))⌉₊ := by
    apply Finset.sum_congr rfl
    intro i _hi
    exact ninthShiftWeight_eq_ceiling (c i) d (by omega)
  apply nine_speed_shift_test_of_signed_unit_cost hLRC8 v c hpositive hnodup
    q d u uinv hq hd hdq hunit hsigned
  · exact ninthShiftCost_pos_of_exception c d (by omega) hexception
  · rwa [heq]

theorem folded_signed_residue (q a : ℕ) (hq : 0 < q) :
    Modular.folded q a % q = a % q ∨ (Modular.folded q a + a) % q = 0 := by
  by_cases hlow : a % q ≤ q - a % q
  · left
    have he : Modular.folded q a = a % q := min_eq_left hlow
    simp only [he, Nat.mod_mod]
  · right
    have he : Modular.folded q a = q - a % q := min_eq_right (by omega)
    have hr : a % q ≤ q := (Nat.mod_lt a hq).le
    rw [he]
    calc
      (q - a % q + a) % q = (q - a % q + a % q) % q := by simp [Nat.add_mod]
      _ = q % q := by rw [Nat.sub_add_cancel hr]
      _ = 0 := Nat.mod_self q

theorem ninthShiftCost_eq_of_folded_represents {n q d : ℕ}
    (v c : Fin n → ℕ) (hq : 0 < q) (hdq : d ∣ q)
    (hrep : Modular.FoldedSearch.Represents q c v) :
    ninthShiftCost c d = ninthShiftCost v d := by
  obtain ⟨u, uinv, hunit, hfolded⟩ := hrep
  apply ninthShiftCost_eq_of_signed_unit v c hdq hunit
  intro i
  rw [← hfolded i]
  exact folded_signed_residue q (u * v i) hq

theorem nine_speed_shift_test_of_folded_represents
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q d : ℕ) (hq : 0 < q) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hrep : Modular.FoldedSearch.Represents q c v)
    (hcostpos : 0 < ninthShiftCost c d) (hcost : ninthShiftCost c d < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have heq := ninthShiftCost_eq_of_folded_represents v c hq hdq hrep
  apply nine_speed_shift_test hLRC8 v hpositive hnodup d hd
  · rwa [← heq]
  · rwa [← heq]

/-- Exact finite divisor loop: `2 ≤ d ≤ q`, `d ∣ q`, and a positive
gcd-weighted integer cost strictly below `d`. Both rejecting guards are
retained, including the guard against an empty exceptional set. -/
def shiftReject {n : ℕ} (q : ℕ) (c : Fin n → ℕ) : Bool :=
  decide (∃ d : Fin (q + 1), 2 ≤ d.val ∧ d.val ∣ q ∧
    0 < ninthShiftCost c d.val ∧ ninthShiftCost c d.val < d.val)

theorem shiftReject_eq_true_iff {n : ℕ} (q : ℕ) (c : Fin n → ℕ) :
    shiftReject q c = true ↔ ∃ d : ℕ, 2 ≤ d ∧ d ≤ q ∧ d ∣ q ∧
      0 < ninthShiftCost c d ∧ ninthShiftCost c d < d := by
  simp only [shiftReject, decide_eq_true_eq]
  constructor
  · rintro ⟨d, hd, hdq, hpos, hcost⟩
    exact ⟨d.val, hd, Nat.lt_succ_iff.mp d.isLt, hdq, hpos, hcost⟩
  · rintro ⟨d, hd, hbound, hdq, hpos, hcost⟩
    exact ⟨⟨d, Nat.lt_succ_iff.mpr hbound⟩, hd, hdq, hpos, hcost⟩

/-- Literal contract for `shift_witness` in `tight-eight-speeds/lifts.cpp`
at `SPEED_COUNT=9`: the exceptional entries have nonzero remainder, and
the cost uses exactly the program's integer divisions. -/
theorem shiftReject_eq_true_iff_explicit {n : ℕ} (q : ℕ) (c : Fin n → ℕ) :
    shiftReject q c = true ↔ ∃ d : ℕ, 2 ≤ d ∧ d ≤ q ∧ q % d = 0 ∧
      0 < (∑ i ∈ Finset.univ.filter (fun i => c i % d ≠ 0),
        Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) ∧
      (∑ i ∈ Finset.univ.filter (fun i => c i % d ≠ 0),
        Nat.gcd (c i) d * ((2 * (d / Nat.gcd (c i) d) + 9) / 10)) < d := by
  simp only [shiftReject_eq_true_iff, ninthShiftCost, exceptionalIndices,
    ninthShiftWeight, Nat.dvd_iff_mod_eq_zero]

theorem shiftReject_sound_of_signed_unit
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup)
    (q u uinv : ℕ) (hq : 0 < q)
    (hunit : (u * uinv) % q = 1 % q)
    (hsigned : ∀ i, c i % q = (u * v i) % q ∨ (c i + u * v i) % q = 0)
    (hcheck : shiftReject q c = true) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  obtain ⟨d, hd, _hbound, hdq, hpos, hcost⟩ := (shiftReject_eq_true_iff q c).mp hcheck
  exact nine_speed_shift_test_of_signed_unit_cost hLRC8 v c hpositive hnodup
    q d u uinv hq hd hdq hunit hsigned hpos hcost

theorem shiftReject_sound_of_folded_represents
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (q : ℕ) (hq : 0 < q)
    (hrep : Modular.FoldedSearch.Represents q c v)
    (hcheck : shiftReject q c = true) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  obtain ⟨d, hd, _hbound, hdq, hpos, hcost⟩ := (shiftReject_eq_true_iff q c).mp hcheck
  exact nine_speed_shift_test_of_folded_represents hLRC8 v c hpositive hnodup
    q d hq hd hdq hrep hpos hcost

end Loneliness.GcdShift
