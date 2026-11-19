import Conjectures.LonelinessRenaultAssembly
import Conjectures.LonelinessRenaultNormalization
import Conjectures.LonelinessRenaultParityCases
import Conjectures.LonelinessRenaultThreeEven
import Conjectures.LonelinessRenaultTwoMultiplesFinal

/-! Renault's five-speed argument from the four-speed bound.
The final public wrapper discharges this single lower-runner premise. -/

namespace Loneliness.Renault

theorem primitive_five_safe_time_of_four
    (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4) (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_contra hno
  have hthree_card : (divisibleIndices v 3).card ≤ 1 := by
    by_contra h
    exact hno (exists_allSafe_of_two_multiples hLRC4 v hpositive hprimitive (by omega))
  have hthree_unique : ∀ i j, 3 ∣ v i → 3 ∣ v j → i = j := by
    intro i j hi hj
    apply Finset.card_le_one.mp hthree_card
    · simp [divisibleIndices, hi]
    · simp [divisibleIndices, hj]
  have hsix : ∃ i, 6 ∣ v i := by
    have hpos := divisibility_card_pos v hno 6 (by decide) (by decide)
    obtain ⟨i, hi⟩ := Finset.card_pos.mp (show 0 < (divisibleIndices v 6).card by omega)
    exact ⟨i, (Finset.mem_filter.mp hi).2⟩
  have htwo_card := divisibility_card_le_three hLRC4 v hpositive hprimitive hno 2 (by decide)
  apply hno
  apply allSafe_of_residue_cases ?_ ?_ ?_ v hpositive hsix hthree_unique htwo_card
  · intro w hw hdiv hres
    exact unique_even_safe_time w (hw 0) hdiv hres (exists_strict_safe_except hLRC4 w hw 0)
  · intro w hw hdiv heven hodd
    exact two_even_safe_time w (hw 0) hdiv heven hodd (exists_strict_safe_except hLRC4 w hw 0)
  · intro w hw hdiv heven₁ heven₂ hodd₃ hodd₄
    exact three_even_safe_time w hw hdiv heven₁ heven₂ hodd₃ hodd₄

theorem five_speed_common_time_of_four
    (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4) (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  have hpos : ∀ a ∈ List.ofFn v, 0 < a := by
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact hpositive i
  have hbound := five_list_value_lower_of_primitive (primitive_five_safe_time_of_four hLRC4)
    (List.ofFn v) (by simp) hpos
  obtain ⟨t, ht, heq⟩ := value_max (List.ofFn v)
  refine ⟨t, ht, ?_⟩
  intro i
  rw [← heq] at hbound
  exact hbound.trans (clearance_le_of_mem (List.mem_ofFn.mpr ⟨i, rfl⟩) t)

theorem five_speed_bound_of_four
    (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4) : CoordinateSubspace.LonelyRunnerBound 5 :=
  runner_bound_five_of_primitive (primitive_five_safe_time_of_four hLRC4)

end Loneliness.Renault
