import Conjectures.LonelinessGcdShiftCounting
import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessModularStrictWitness
import Mathlib.Topology.Instances.Irrational

/-! The strict gcd-weighted shift test for nine positive speeds. The only
runner-bound input to the final theorem is the bound for at most eight
distinct positive speeds. Arc counting and endpoint avoidance are internal. -/

namespace Loneliness.GcdShift

noncomputable section

open scoped BigOperators

/-- An irrational phase cannot lie at any rational distance from an integer. -/
theorem distance_ne_rat_of_irrational (x : ℝ) (hx : Irrational x) (r : ℚ) :
    distance x ≠ (r : ℝ) := by
  intro heq
  have hirr := hx.sub_intCast (round x)
  by_cases hsign : 0 ≤ x - (round x : ℝ)
  · exact hirr.ne_rat r (by simpa only [distance, abs_of_nonneg hsign] using heq)
  · have hneg : x - (round x : ℝ) < 0 := lt_of_not_ge hsign
    exact hirr.neg.ne_rat r (by simpa only [distance, abs_of_neg hneg] using heq)

/-- Every finite positive-speed phase, at every rational shift of an
irrational time, avoids both endpoints of the forbidden arc. -/
theorem shifted_distance_ne_tenth (t : ℝ) (ht : Irrational t)
    (a d j : ℕ) (ha : 0 < a) :
    distance ((a : ℝ) * (t + (j : ℝ) / d)) ≠ (1 / 10 : ℝ) := by
  have hphase : Irrational ((a : ℝ) * (t + (j : ℝ) / d)) := by
    simpa only [Rat.cast_div, Rat.cast_natCast] using
      (ht.add_ratCast ((j : ℚ) / d)).natCast_mul ha.ne'
  simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
    distance_ne_rat_of_irrational _ hphase (1 / 10)

/-- The endpoint-avoiding time can be chosen in every prescribed neighborhood
of a time at which the retained speeds have strict clearance. -/
theorem exists_irrational_nearby_clearance (ds : List ℕ) (r t₀ ε : ℝ)
    (hclear : r < clearance ds t₀) (hε : 0 < ε) :
    ∃ t : ℝ, |t - t₀| < ε ∧ r < clearance ds t ∧ Irrational t := by
  let U : Set ℝ := {t | r < clearance ds t} ∩ Metric.ball t₀ ε
  have hopen : IsOpen U :=
    (isOpen_lt continuous_const (continuous_clearance ds)).inter Metric.isOpen_ball
  have hnonempty : U.Nonempty := by
    refine ⟨t₀, hclear, ?_⟩
    simpa only [Metric.mem_ball, dist_self] using hε
  obtain ⟨t, htI, ht⟩ := dense_irrational.exists_mem_open hopen hnonempty
  refine ⟨t, ?_, ht.1, htI⟩
  simpa only [Metric.mem_ball, Real.dist_eq] using ht.2

theorem distance_shift_of_dvd (a d j : ℕ) (hd : 0 < d) (hdiv : d ∣ a) (t : ℝ) :
    distance ((a : ℝ) * (t + (j : ℝ) / d)) = distance ((a : ℝ) * t) := by
  obtain ⟨b, rfl⟩ := hdiv
  have hdR : (d : ℝ) ≠ 0 := by exact_mod_cast hd.ne'
  have hphase : ((d * b : ℕ) : ℝ) * (t + (j : ℝ) / d) =
      ((d * b : ℕ) : ℝ) * t + (((b * j : ℕ) : ℤ) : ℝ) := by
    push_cast
    field_simp [hdR]
  rw [hphase, CriticalFamilies.distance_add_int]

def exceptionalIndices {n : ℕ} (v : Fin n → ℕ) (d : ℕ) : Finset (Fin n) :=
  Finset.univ.filter fun i => ¬d ∣ v i

def divisibleSpeeds {n : ℕ} (v : Fin n → ℕ) (d : ℕ) : List ℕ :=
  (List.ofFn v).filter fun a => decide (d ∣ a)

def ninthShiftCost {n : ℕ} (v : Fin n → ℕ) (d : ℕ) : ℕ :=
  ∑ i ∈ exceptionalIndices v d, ninthShiftWeight (v i) d

/-- A finite union bound on the actual rational translates. The strict
clearance of the divisible sublist is an analytic input here; the final
nine-speed theorem below derives it from the eight-speed runner bound. -/
theorem value_gt_tenth_of_divisible_value {n : ℕ} (v : Fin n → ℕ)
    (hpositive : ∀ i, 0 < v i) (d : ℕ) (hd : 0 < d)
    (hbase : (1 / 10 : ℝ) < value (divisibleSpeeds v d))
    (hcost : ninthShiftCost v d < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  classical
  obtain ⟨t₀, _ht₀, hmax⟩ := value_max (divisibleSpeeds v d)
  have hclear : (1 / 10 : ℝ) < clearance (divisibleSpeeds v d) t₀ := by
    rw [hmax]
    exact hbase
  obtain ⟨t, _hnear, htclear, htI⟩ :=
    exists_irrational_nearby_clearance (divisibleSpeeds v d) (1 / 10) t₀ 1
      hclear (by norm_num)
  let bad : Fin n → Finset ℕ := fun i =>
    openBadShifts (v i) d ((v i : ℝ) * t) (1 / 10)
  let covered : Finset ℕ := (exceptionalIndices v d).biUnion bad
  have hcard : covered.card < d := by
    have hle : covered.card ≤ ninthShiftCost v d := by
      apply Finset.card_biUnion_le.trans
      apply Finset.sum_le_sum
      intro i _hi
      exact openBadShifts_card_le_ninthShiftWeight (v i) d hd ((v i : ℝ) * t)
    exact hle.trans_lt hcost
  obtain ⟨j, hjrange, hjfree⟩ : ∃ j ∈ Finset.range d, j ∉ covered := by
    by_contra hnone
    push Not at hnone
    have hle := Finset.card_le_card hnone
    rw [Finset.card_range] at hle
    omega
  have hcoords : ∀ i, (1 / 10 : ℝ) < distance ((v i : ℝ) * (t + (j : ℝ) / d)) := by
    intro i
    by_cases hi : d ∣ v i
    · rw [distance_shift_of_dvd (v i) d j hd hi t]
      apply htclear.trans_le
      apply clearance_le_of_mem
      exact List.mem_filter.mpr ⟨List.mem_ofFn.mpr ⟨i, rfl⟩, by simpa using hi⟩
    · have himem : i ∈ exceptionalIndices v d := Finset.mem_filter.mpr ⟨Finset.mem_univ _, hi⟩
      have hnotlt : ¬distance ((v i : ℝ) * t + (v i : ℝ) * j / d) < (1 / 10 : ℝ) := by
        intro hbad
        apply hjfree
        apply Finset.mem_biUnion.mpr
        exact ⟨i, himem, Finset.mem_filter.mpr ⟨hjrange, hbad⟩⟩
      have hge := le_of_not_gt hnotlt
      have hphase : (v i : ℝ) * t + (v i : ℝ) * j / d =
          (v i : ℝ) * (t + (j : ℝ) / d) := by ring
      rw [hphase] at hge
      have hne := shifted_distance_ne_tenth t htI (v i) d j (hpositive i)
      exact lt_of_le_of_ne hge hne.symm
  have hresult := Modular.clearance_strict_lower (List.ofFn v) (1 / 10)
    (t + (j : ℝ) / d) (by norm_num) (by
      intro a ha
      obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
      exact hcoords i)
  exact hresult.trans_le (CriticalFamilies.le_value_any _ _)

/-- The arbitrary-modulus shift test in the nine-speed equality proof.
The integer weight is exactly `g*((2*(d/g)+9)/10)`, with `g=gcd(v_i,d)`.
No assumption about an arc count, sampled witness, or finite census remains. -/
theorem nine_speed_shift_test
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (d : ℕ) (hd : 2 ≤ d)
    (hcostpos : 0 < ninthShiftCost v d) (hcost : ninthShiftCost v d < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  classical
  apply value_gt_tenth_of_divisible_value v hpositive d (by omega) _ hcost
  by_cases hempty : divisibleSpeeds v d = []
  · rw [hempty]
    have hvalue : value [] = (1 / 2 : ℝ) := by
      apply le_antisymm (value_le_half [])
      exact le_value (ds := []) (t := 0) (by norm_num)
    rw [hvalue]
    norm_num
  · have hexceptional : (exceptionalIndices v d).Nonempty := by
      by_contra hnone
      have he := Finset.not_nonempty_iff_eq_empty.mp hnone
      simp only [ninthShiftCost, he, Finset.sum_empty] at hcostpos
      omega
    obtain ⟨i, hi⟩ := hexceptional
    have hinot : ¬d ∣ v i := (Finset.mem_filter.mp hi).2
    have hlength : (divisibleSpeeds v d).length ≤ 8 := by
      have hlt : (divisibleSpeeds v d).length < (List.ofFn v).length := by
        apply List.length_filter_lt_length_iff_exists.mpr
        exact ⟨v i, List.mem_ofFn.mpr ⟨i, rfl⟩, by simpa using hinot⟩
      simp only [List.length_ofFn] at hlt
      omega
    have hnodup' : (divisibleSpeeds v d).Nodup := hnodup.filter _
    have hpositive' : ∀ a ∈ divisibleSpeeds v d, 0 < a := by
      intro a ha
      obtain ⟨i, rfl⟩ := List.mem_ofFn.mp (List.mem_filter.mp ha).1
      exact hpositive i
    have hbound := hLRC8 (divisibleSpeeds v d) hempty hnodup' hlength hpositive'
    norm_num at hbound
    linarith

/-- A literal mathematical contract, independent of the names of the cost
and weight definitions. All arithmetic is natural-number arithmetic. -/
theorem nine_speed_shift_test_explicit
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (d : ℕ) (hd : 2 ≤ d)
    (hcostpos : 0 < ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
      Nat.gcd (v i) d * ((2 * (d / Nat.gcd (v i) d) + 9) / 10))
    (hcost : (∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
      Nat.gcd (v i) d * ((2 * (d / Nat.gcd (v i) d) + 9) / 10)) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) :=
  nine_speed_shift_test hLRC8 v hpositive hnodup d hd hcostpos hcost

theorem ninthShiftWeight_eq_of_modEq (a b d : ℕ) (h : Nat.ModEq d a b) :
    ninthShiftWeight a d = ninthShiftWeight b d := by
  simp only [ninthShiftWeight, h.gcd_eq]

theorem ninthShiftCost_eq_of_modEq {n : ℕ} (v w : Fin n → ℕ) (d : ℕ)
    (h : ∀ i, Nat.ModEq d (v i) (w i)) : ninthShiftCost v d = ninthShiftCost w d := by
  classical
  have hind : exceptionalIndices v d = exceptionalIndices w d := by
    apply Finset.ext
    intro i
    have hi : v i % d = w i % d := by simpa only [Nat.ModEq] using h i
    simp only [exceptionalIndices, Finset.mem_filter, Finset.mem_univ, true_and,
      Nat.dvd_iff_mod_eq_zero, hi]
  simp only [ninthShiftCost, hind]
  apply Finset.sum_congr rfl
  intro i _hi
  exact ninthShiftWeight_eq_of_modEq (v i) (w i) d (h i)

/-- A residue tuple modulo any multiple of `d` supplies the same test.
This is the interface used by the auxiliary-modulus lift program. -/
theorem nine_speed_shift_test_of_residues
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v c : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (q d : ℕ) (hd : 2 ≤ d) (hdq : d ∣ q)
    (hresidue : ∀ i, Nat.ModEq q (v i) (c i))
    (hcostpos : 0 < ninthShiftCost c d) (hcost : ninthShiftCost c d < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have hmod : ∀ i, Nat.ModEq d (v i) (c i) := by
    intro i
    apply Nat.modEq_iff_dvd.mpr
    exact (Int.natCast_dvd_natCast.mpr hdq).trans (hresidue i).dvd
  have heq := ninthShiftCost_eq_of_modEq v c d hmod
  apply nine_speed_shift_test hLRC8 v hpositive hnodup d hd
  · rwa [heq]
  · rwa [heq]

theorem ceil_two_mul_tenth (q : ℕ) (hq : 0 < q) :
    ⌈(2 : ℝ) * q / 10⌉₊ = (2 * q + 9) / 10 := by
  have hpos : 0 < (2 * q + 9) / 10 := by omega
  apply (Nat.ceil_eq_iff hpos.ne').mpr
  constructor
  · have hlt : 10 * ((2 * q + 9) / 10 - 1) < 2 * q := by omega
    have hltR : (10 : ℝ) * (((2 * q + 9) / 10 - 1 : ℕ) : ℝ) < 2 * q := by
      exact_mod_cast hlt
    linarith
  · have hle : 2 * q ≤ 10 * ((2 * q + 9) / 10) := by omega
    have hleR : (2 : ℝ) * q ≤ 10 * (((2 * q + 9) / 10 : ℕ) : ℝ) := by
      exact_mod_cast hle
    linarith

theorem ninthShiftWeight_eq_ceiling (a d : ℕ) (hd : 0 < d) :
    ninthShiftWeight a d =
      Nat.gcd a d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd a d : ℕ))⌉₊ := by
  have hg : 0 < Nat.gcd a d := Nat.gcd_pos_of_pos_right a hd
  have hq : 0 < d / Nat.gcd a d := Nat.div_gcd_pos_of_pos_right a hd
  have hfactor : (Nat.gcd a d : ℝ) * (d / Nat.gcd a d : ℕ) = d := by
    exact_mod_cast Nat.mul_div_cancel' (Nat.gcd_dvd_right a d)
  have hratio : (2 : ℝ) * d / (10 * (Nat.gcd a d : ℕ)) =
      2 * (d / Nat.gcd a d : ℕ) / 10 := by
    apply (div_eq_div_iff (by positivity) (by norm_num)).mpr
    nlinarith
  rw [ninthShiftWeight, hratio, ceil_two_mul_tenth _ hq]

/-- The same endpoint in the exact ceiling notation of the written proof. -/
theorem nine_speed_shift_test_ceiling
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (d : ℕ) (hd : 2 ≤ d)
    (hcostpos : 0 < ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
      Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊)
    (hcost : (∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
      Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have heq : ninthShiftCost v d =
      ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
        Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊ := by
    apply Finset.sum_congr rfl
    intro i _hi
    exact ninthShiftWeight_eq_ceiling (v i) d (by omega)
  apply nine_speed_shift_test hLRC8 v hpositive hnodup d hd
  · rwa [heq]
  · rwa [heq]

theorem ninthShiftWeight_pos (a d : ℕ) (hd : 0 < d) :
    0 < ninthShiftWeight a d := by
  have hg : 0 < Nat.gcd a d := Nat.gcd_pos_of_pos_right a hd
  have hq : 0 < d / Nat.gcd a d := Nat.div_gcd_pos_of_pos_right a hd
  have hN : 0 < (2 * (d / Nat.gcd a d) + 9) / 10 := by omega
  exact Nat.mul_pos hg hN

theorem ninthShiftCost_pos_of_exception {n : ℕ} (v : Fin n → ℕ) (d : ℕ)
    (hd : 0 < d) (hexception : ∃ i, ¬d ∣ v i) : 0 < ninthShiftCost v d := by
  classical
  obtain ⟨i, hi⟩ := hexception
  have himem : i ∈ exceptionalIndices v d := by simp [exceptionalIndices, hi]
  have hle : ninthShiftWeight (v i) d ≤ ninthShiftCost v d := by
    unfold ninthShiftCost
    exact Finset.single_le_sum (f := fun j : Fin n => ninthShiftWeight (v j) d)
      (fun _ _ => Nat.zero_le _) himem
  exact (ninthShiftWeight_pos (v i) d hd).trans_le hle

/-- The statement in the written proof, with a nonempty exceptional set and
the literal gcd-weighted ceiling inequality. -/
theorem nine_speed_shift_test_of_exception
    (hLRC8 : CoordinateSubspace.LonelyRunnerBound 8)
    (v : Fin 9 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnodup : (List.ofFn v).Nodup) (d : ℕ) (hd : 2 ≤ d)
    (hexception : ∃ i, ¬d ∣ v i)
    (hcost : (∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
      Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊) < d) :
    (1 / 10 : ℝ) < value (List.ofFn v) := by
  have heq : ninthShiftCost v d =
      ∑ i ∈ Finset.univ.filter (fun i => ¬d ∣ v i),
        Nat.gcd (v i) d * ⌈(2 : ℝ) * d / (10 * (Nat.gcd (v i) d : ℕ))⌉₊ := by
    apply Finset.sum_congr rfl
    intro i _hi
    exact ninthShiftWeight_eq_ceiling (v i) d (by omega)
  apply nine_speed_shift_test_ceiling hLRC8 v hpositive hnodup d hd _ hcost
  rw [← heq]
  exact ninthShiftCost_pos_of_exception v d (by omega) hexception

end

end Loneliness.GcdShift
