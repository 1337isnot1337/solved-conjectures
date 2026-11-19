import Conjectures.LonelinessSevenCoordinateNormalization
import Conjectures.LonelinessSevenCoordinateFiniteDefs

/-! The geometric meaning of the finite seven-coordinate repeat tests.
Every premise is discharged from the actual plane value, the five-speed
lower bound, and the explicit primitive six-speed classification input. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

theorem candidate_of_canonicalSigned {b : Vector}
    (hb : CanonicalSignedRepeat b) (hpositive : 0 < b 0) : Finite.Candidate b := by
  refine ⟨hpositive, ?_⟩
  ext a
  simpa [Finite.absoluteSupport, Finite.sixSet, sixBase, List.mem_ofFn] using
    canonicalSigned_support hb a

theorem le_foldr_min (xs : List ℕ) (a d : ℕ) (ha : d ≤ a)
    (hxs : ∀ b ∈ xs, d ≤ b) : d ≤ xs.foldr min a := by
  induction xs with
  | nil => exact ha
  | cons b xs ih =>
    exact le_min (hxs b (by simp)) (ih (fun c hc => hxs c (by simp [hc])))

theorem foldr_min_le_member (xs : List ℕ) (a d : ℕ) (hd : d ∈ xs) :
    xs.foldr min a ≤ d := by
  induction xs with
  | nil => simp at hd
  | cons b xs ih =>
    rcases List.mem_cons.mp hd with rfl | hd
    · exact min_le_left _ _
    · exact (min_le_right _ _).trans (ih hd)

theorem repeatShape_of_consecutive (w : Vector)
    (hcritical : ConsecutiveRepeatDirection w) : Finite.RepeatShape w := by
  obtain ⟨d, hd, hperm⟩ := hcritical
  have hcoords (i : Fin 7) : ∃ a ∈ sixBase, (w i).natAbs = d * a := by
    have hmem := hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
    obtain ⟨a, ha, heq⟩ := List.mem_map.mp hmem
    exact ⟨a, ha, heq.symm⟩
  have hbase : ∀ a ∈ sixBase, 1 ≤ a := by norm_num [sixBase]
  have hlower (i : Fin 7) : d ≤ (w i).natAbs := by
    obtain ⟨a, ha, heq⟩ := hcoords i
    rw [heq]
    simpa only [mul_one] using Nat.mul_le_mul_left d (hbase a ha)
  have hone : d ∈ integerSpeeds w :=
    hperm.mem_iff.mpr (List.mem_map.mpr ⟨1, by simp [sixBase], by simp⟩)
  obtain ⟨j, hj⟩ := (mem_integerSpeeds w d).mp hone
  have hleast : Finite.leastAbs w = d := by
    apply le_antisymm
    · exact foldr_min_le_member _ _ _ (List.mem_ofFn.mpr ⟨j, hj⟩)
    · apply le_foldr_min _ _ _ (hlower 0)
      intro a ha
      obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
      exact hlower i
  refine ⟨by simpa [hleast] using hd, ?_, ?_⟩
  · intro i
    obtain ⟨a, _, ha⟩ := hcoords i
    rw [hleast, ha]
    exact dvd_mul_right d a
  · obtain ⟨_, hsupport⟩ := divided_support w d hd hperm
    ext a
    simpa [Finite.dividedSupport, hleast, Finite.sixSet, sixBase, List.mem_ofFn] using
      hsupport a

theorem repeatVector_mem (E : Submodule ℚ (Fin 7 → ℚ)) (w z : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ E) (hz : (fun i => (z i : ℚ)) ∈ E)
    (i j : Fin 7) (positive : Bool) :
    (fun a => (Finite.repeatVector w z i j positive a : ℚ)) ∈ E := by
  have h := E.sub_mem
    (E.smul_mem ((w i - Finite.sign positive * w j : ℤ) : ℚ) hz)
    (E.smul_mem ((z i - Finite.sign positive * z j : ℤ) : ℚ) hw)
  have heq : (fun a => (Finite.repeatVector w z i j positive a : ℚ)) =
      ((w i - Finite.sign positive * w j : ℤ) : ℚ) • (fun a => (z a : ℚ)) -
      ((z i - Finite.sign positive * z j : ℤ) : ℚ) • (fun a => (w a : ℚ)) := by
    ext a
    simp only [Finite.repeatVector, Int.cast_sub, Int.cast_mul, Pi.sub_apply,
      Pi.smul_apply, smul_eq_mul]
  rw [heq]
  exact h

theorem repeatVector_repeats (w z : Vector) (i j : Fin 7) (positive : Bool) :
    (Finite.repeatVector w z i j positive i).natAbs =
      (Finite.repeatVector w z i j positive j).natAbs := by
  have hsign : Finite.sign positive = 1 ∨ Finite.sign positive = -1 := by
    cases positive <;> simp [Finite.sign]
  have heq : Finite.repeatVector w z i j positive i =
      Finite.sign positive * Finite.repeatVector w z i j positive j := by
    rcases hsign with h | h <;> simp only [Finite.repeatVector, h] <;> ring
  rw [heq, Int.natAbs_mul]
  rcases hsign with h | h <;> simp [h]

theorem sameCoordinate_of_spanning_pair
    (E : Submodule ℚ (Fin 7 → ℚ)) (w z : Vector)
    (hspan : Submodule.span ℚ {(fun a => (w a : ℚ)), (fun a => (z a : ℚ))} = E)
    (i j : Fin 7) (positive : Bool)
    (hw : w i = Finite.sign positive * w j)
    (hz : z i = Finite.sign positive * z j) : SameCoordinate E i j := by
  let φ : (Fin 7 → ℚ) →ₗ[ℚ] ℚ :=
    LinearMap.proj i - (Finite.sign positive : ℚ) • LinearMap.proj j
  have hker : E ≤ φ.ker := by
    rw [← hspan]
    apply Submodule.span_le.mpr
    refine Set.insert_subset_iff.mpr ⟨?_, Set.singleton_subset_iff.mpr ?_⟩
    · change (w i : ℚ) - (Finite.sign positive : ℚ) * (w j : ℚ) = 0
      exact sub_eq_zero.mpr (by exact_mod_cast hw)
    · change (z i : ℚ) - (Finite.sign positive : ℚ) * (z j : ℚ) = 0
      exact sub_eq_zero.mpr (by exact_mod_cast hz)
  have hrel (x : Fin 7 → ℚ) (hx : x ∈ E) :
      x i = (Finite.sign positive : ℚ) * x j := sub_eq_zero.mp (hker hx)
  cases positive with
  | false => exact Or.inr (fun x hx => by simpa [Finite.sign] using hrel x hx)
  | true => exact Or.inl (fun x hx => by simpa [Finite.sign] using hrel x hx)

theorem repeatTests_of_low_plane
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ))
    (w z : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ E) (hz : (fun i => (z i : ℚ)) ∈ E)
    (hspan : Submodule.span ℚ {(fun i => (w i : ℚ)), (fun i => (z i : ℚ))} = E) :
    Finite.RepeatTests w z := by
  intro i j hij positive
  constructor
  · rintro ⟨hwi, hzi⟩
    exact low_plane_no_forced_signed_equality hfive E hfree hdim hlow i j (ne_of_gt hij)
      (sameCoordinate_of_spanning_pair E w z hspan i j positive hwi hzi)
  · let u := Finite.repeatVector w z i j positive
    by_cases hzero : ∃ a, u a = 0
    · exact Or.inl hzero
    · apply Or.inr
      apply repeatShape_of_consecutive
      apply every_repeat_direction_consecutive hfive hsix E hlow u
        (repeatVector_mem E w z hw hz i j positive)
        (fun a ha => hzero ⟨a, ha⟩) i j (ne_of_gt hij)
      exact repeatVector_repeats w z i j positive

end

end Loneliness.SevenCoordinateCritical
