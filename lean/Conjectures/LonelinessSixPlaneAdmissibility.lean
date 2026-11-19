import Conjectures.LonelinessSixPlaneCriticalNormalization
import Mathlib.SetTheory.Cardinal.NatCard

/-! Every repeated-coordinate line in a sufficiently low-value rational plane
passes the finite support test, with the exact four- and five-speed inputs stated explicitly. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

theorem le_foldl_min (xs : List ℕ) (a d : ℕ) (ha : d ≤ a)
    (hxs : ∀ b ∈ xs, d ≤ b) : d ≤ xs.foldl min a := by
  induction xs generalizing a with
  | nil => exact ha
  | cons b xs ih =>
    exact ih (min a b) (le_min ha (hxs b (by simp)))
      (fun c hc => hxs c (by simp [hc]))

theorem foldl_min_le_initial (xs : List ℕ) (a : ℕ) : xs.foldl min a ≤ a := by
  induction xs generalizing a with
  | nil => exact le_rfl
  | cons b xs ih => exact (ih (min a b)).trans (min_le_left _ _)

theorem foldl_min_le_member (xs : List ℕ) (a d : ℕ) (hd : d ∈ xs) :
    xs.foldl min a ≤ d := by
  induction xs generalizing a with
  | nil => simp at hd
  | cons b xs ih =>
    rcases List.mem_cons.mp hd with rfl | hd
    · exact (foldl_min_le_initial xs (min a d)).trans (min_le_right _ _)
    · exact ih (min a b) hd

theorem scaledSupportTest_of_support (u : Vector) (d : ℕ) (base : List ℕ)
    (hbase : ∀ b ∈ base, 1 ≤ b) (hone : 1 ∈ base)
    (hsupport : ∀ a, a ∈ absoluteCoordinates u ↔ a ∈ base.map (d * ·)) :
    scaledSupportTest u base = true := by
  have hlower : ∀ a ∈ absoluteCoordinates u, d ≤ a := by
    intro a ha
    obtain ⟨b, hb, rfl⟩ := List.mem_map.mp ((hsupport a).mp ha)
    simpa using Nat.mul_le_mul_left d (hbase b hb)
  have hmem : d ∈ absoluteCoordinates u :=
    (hsupport d).mpr (List.mem_map.mpr ⟨1, hone, by simp⟩)
  have hmin : minimumAbsolute u = d := by
    apply le_antisymm
    · exact foldl_min_le_member _ _ _ hmem
    · exact le_foldl_min _ _ _ (hlower _ (List.mem_ofFn.mpr ⟨0, rfl⟩)) hlower
  simp only [scaledSupportTest, hmin, Bool.and_eq_true, List.all_eq_true,
    List.any_eq_true, beq_iff_eq]
  constructor
  · intro a ha
    obtain ⟨b, hb, heq⟩ := List.mem_map.mp ((hsupport a).mp ha)
    exact ⟨b, hb, heq.symm⟩
  · intro b hb
    exact ⟨d * b, (hsupport _).mpr (List.mem_map.mpr ⟨b, hb, rfl⟩), rfl⟩

theorem criticalSupportTest_of_critical (u : Vector)
    (hcrit : CriticalIntegerDirection u) : criticalSupportTest u = true := by
  obtain ⟨d, hd, hperm⟩ := hcrit
  have hmem : ∀ a, a ∈ absoluteCoordinates u ↔ a ∈ integerSpeeds u := by
    intro a
    simp only [absoluteCoordinates, List.mem_ofFn, mem_integerSpeeds]
  rcases hperm with hperm | hperm
  · have ht := scaledSupportTest_of_support u d [1,2,3,4,5]
      (by simp +decide) (by simp) (fun a => (hmem a).trans hperm.mem_iff)
    simp [criticalSupportTest, ht]
  · have ht := scaledSupportTest_of_support u d [1,3,4,5,9]
      (by simp +decide) (by simp) (fun a => (hmem a).trans hperm.mem_iff)
    simp [criticalSupportTest, ht]

theorem range_card_le_five_of_repeat (f : Fin 6 → ℕ) (i j : Fin 6)
    (hij : i ≠ j) (heq : f i = f j) : Nat.card (Set.range f) ≤ 5 := by
  have hle : Nat.card (Set.range f) ≤ 6 := by simpa using Finite.card_range_le f
  have hne : Nat.card (Set.range f) ≠ 6 := by
    intro hcard
    have hbij : Function.Bijective (Set.rangeFactorization f) :=
      (Nat.bijective_iff_surjective_and_card (Set.rangeFactorization f)).mpr
        ⟨Set.rangeFactorization_surjective, by simpa using hcard.symm⟩
    exact hij (hbij.injective (Subtype.ext heq))
  omega

theorem repeatedLine_repeats (q c : Vector) (i j : Fin 6) (ε : ℤ)
    (hε : ε = 1 ∨ ε = -1) :
    (repeatedLine q c i j ε i).natAbs = (repeatedLine q c i j ε j).natAbs := by
  have heq : repeatedLine q c i j ε i = ε * repeatedLine q c i j ε j := by
    rcases hε with rfl | rfl <;> simp only [repeatedLine] <;> ring
  rw [heq, Int.natAbs_mul]
  rcases hε with rfl | rfl <;> simp

theorem repeatedLine_mem (E : Submodule ℚ (Fin 6 → ℚ)) (q c : Vector)
    (hq : (fun i => (q i : ℚ)) ∈ E) (hc : (fun i => (c i : ℚ)) ∈ E)
    (i j : Fin 6) (ε : ℤ) :
    (fun k => (repeatedLine q c i j ε k : ℚ)) ∈ E := by
  have h := E.sub_mem
    (E.smul_mem ((q i - ε * q j : ℤ) : ℚ) hc)
    (E.smul_mem ((c i - ε * c j : ℤ) : ℚ) hq)
  have heq : (fun k => (repeatedLine q c i j ε k : ℚ)) =
      ((q i - ε * q j : ℤ) : ℚ) • (fun k => (c k : ℚ)) -
      ((c i - ε * c j : ℤ) : ℚ) • (fun k => (q k : ℚ)) := by
    ext k
    simp only [repeatedLine, Int.cast_sub, Int.cast_mul, Pi.sub_apply,
      Pi.smul_apply, smul_eq_mul]
  rw [heq]
  exact h

theorem lineTest_of_low_plane (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (E : Submodule ℚ (Fin 6 → ℚ)) (q c : Vector)
    (hq : (fun i => (q i : ℚ)) ∈ E) (hc : (fun i => (c i : ℚ)) ∈ E)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ))
    (i j : Fin 6) (hij : i ≠ j) (ε : ℤ) (hε : ε = 1 ∨ ε = -1) :
    lineTest (repeatedLine q c i j ε) = true := by
  let u := repeatedLine q c i j ε
  change lineTest u = true
  by_cases hnz : nonzeroTest u = true
  · have hu : ∀ k, u k ≠ 0 := by
      intro k
      have h := List.all_eq_true.mp hnz (u k) (List.mem_ofFn.mpr ⟨k, rfl⟩)
      simpa using h
    have hcrit := critical_of_repeated_direction hfour hfive u hu
      (range_card_le_five_of_repeat (fun k => (u k).natAbs) i j hij
        (repeatedLine_repeats q c i j ε hε))
      ((integer_direction_value_le E u (repeatedLine_mem E q c hq hc i j ε)).trans_lt hbelow)
    simp [lineTest, criticalSupportTest_of_critical u hcrit]
  · simp [lineTest, hnz]

theorem admissibleTest_of_low_plane (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (E : Submodule ℚ (Fin 6 → ℚ)) (q c : Vector)
    (hq : (fun i => (q i : ℚ)) ∈ E) (hc : (fun i => (c i : ℚ)) ∈ E)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ)) :
    admissibleTest q c = true := by
  simp only [admissibleTest, List.all_eq_true]
  intro i hi j hj
  split_ifs with hij
  · have hne : i ≠ j := ne_of_lt hij
    simp [lineTest_of_low_plane hfour hfive E q c hq hc hbelow i j hne 1 (Or.inl rfl),
      lineTest_of_low_plane hfour hfive E q c hq hc hbelow i j hne (-1) (Or.inr rfl)]
  · rfl

end

end Loneliness.SixPlane

