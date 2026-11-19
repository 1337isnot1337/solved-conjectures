import Conjectures.LonelinessTwoDirections

/-! A coordinate-free rational plane is spanned by two integer directions,
each with at most `n-1` distinct absolute speeds. This is a finite-pattern
reduction once the possible repeated-speed directions have been classified. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

theorem exists_second_integer_direction
    (E : Submodule ℚ (ι → ℚ)) (hdim : Module.finrank ℚ E = 2)
    (q : ι → ℤ) (hqE : (fun i => (q i : ℚ)) ∈ E) (hqzero : ∀ i, q i ≠ 0) :
    ∃ w : ι → ℤ, (fun i => (w i : ℚ)) ∈ E ∧ (∀ i, w i ≠ 0) ∧
      Nat.card (Set.range (fun i => (w i).natAbs)) ≤ Fintype.card ι - 1 ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  classical
  have hqQ : ∀ i, (q i : ℚ) ≠ 0 := by intro i; exact_mod_cast hqzero i
  obtain ⟨a, b, ε, F, hab, hnonparallel, hε, hFE, hFdim, hFfree, hFeq, hqnot⟩ :=
    coordinate_coalescence_avoiding E ⟨_, hqE⟩ hqQ (by omega)
  change (fun i => (q i : ℚ)) ∉ F at hqnot
  have hclasslt : classCount F < classCount E := by
    apply classCount_lt_of_merge hFE (i := a) (j := b)
    · exact fun h => hnonparallel (sameCoordinate_mem_span h)
    · have hrel (x : ι → ℚ) (hx : x ∈ F) : x a = ε * x b := by
        rw [hFeq] at hx
        exact sub_eq_zero.mp hx.2
      rcases hε with rfl | rfl
      · exact Or.inl (by simpa using hrel)
      · exact Or.inr (by simpa using hrel)
  have hclass : classCount F ≤ Fintype.card ι - 1 := by
    have hcard := classCount_le_card E
    omega
  obtain ⟨w, hwF, hwzero, _⟩ := exists_integer_direction F hFfree
  have hwE := hFE hwF
  have hwcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ Fintype.card ι - 1 :=
    (natAbs_values_card_le_rational_abs w).trans
      ((absolute_values_card_le_classCount hwF).trans hclass)
  have hwne : (fun i => (w i : ℚ)) ≠ (0 : ι → ℚ) := by
    obtain ⟨i⟩ := ‹Nonempty ι›
    intro hz
    have h := congrFun hz i
    change (w i : ℚ) = 0 at h
    exact hwzero i (by exact_mod_cast h)
  have hpair : LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] := by
    apply LinearIndependent.pair_symm_iff.mpr
    apply (LinearIndependent.pair_iff' hwne).mpr
    intro c heq
    apply hqnot
    rw [← heq]
    exact F.smul_mem c hwF
  refine ⟨w, hwE, hwzero, hwcard, hpair, ?_⟩
  apply Submodule.eq_of_le_of_finrank_eq
  · apply Submodule.span_le.mpr
    exact Set.insert_subset_iff.mpr ⟨hqE, Set.singleton_subset_iff.mpr hwE⟩
  · rw [hdim]
    have hrange : Set.range (![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] :
        Fin 2 → ι → ℚ) = {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} := by
      ext x
      constructor
      · rintro ⟨i, hi⟩
        fin_cases i
        · exact Or.inl hi.symm
        · exact Or.inr hi.symm
      · intro hx
        rcases hx with hx | hx
        · exact ⟨0, hx.symm⟩
        · exact ⟨1, hx.symm⟩
    have h := finrank_span_eq_card hpair
    rw [hrange] at h
    simpa only [Fintype.card_fin] using h

theorem two_integer_directions
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2) :
    ∃ q w : ι → ℤ,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      Nat.card (Set.range (fun i => (q i).natAbs)) ≤ Fintype.card ι - 1 ∧
      Nat.card (Set.range (fun i => (w i).natAbs)) ≤ Fintype.card ι - 1 ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, hqE, hqzero, hqcard⟩ := exists_integer_direction E hfree
  obtain ⟨w, hwE, hwzero, hwcard, hpair, hspan⟩ :=
    exists_second_integer_direction E hdim q hqE hqzero
  have hn : 2 ≤ Fintype.card ι := by
    simpa [hdim] using Submodule.finrank_le E
  have hqcard' : Nat.card (Set.range (fun i => (q i).natAbs)) ≤ Fintype.card ι - 1 := by
    rw [hdim] at hqcard
    omega
  exact ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard', hwcard, hpair, hspan⟩

theorem integer_direction_value_le
    (E : Submodule ℚ (ι → ℚ)) (w : ι → ℤ)
    (hw : (fun i => (w i : ℚ)) ∈ E) :
    value (integerSpeeds w) ≤ SubspaceDensity.spaceValue (realSpan E) := by
  rw [← spaceValue_integer_line]
  apply SubspaceDensity.spaceValue_mono
  apply Submodule.span_le.mpr
  apply Set.singleton_subset_iff.mpr
  have heq : rationalVector (fun i => (w i : ℚ)) = fun i => (w i : ℝ) := by
    ext i
    simp only [rationalVector_apply, Rat.cast_intCast]
  rw [← heq]
  exact rationalVector_mem_realSpan hw

end

end Loneliness.CoordinateSubspace
