import Conjectures.LonelinessSevenCoordinateAdmissibility
import Conjectures.LonelinessSevenCoordinateRationalGap
import Conjectures.LonelinessSevenCoordinateMinorBound

/-! Bounded repeat-line generators convert a sufficiently small plane-value
error into an exact one-seventh bound on every repeated-speed direction.
The generators and their rational rescalings are constructed explicitly. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open CoordinateSubspace SubspaceDensity

noncomputable section

def RepeatDirectionBound (E : Submodule ℚ (Fin 7 → ℚ)) : Prop :=
  ∀ x : Vector, (fun i => (x i : ℚ)) ∈ E → (∀ i, x i ≠ 0) →
    Nat.card (Set.range (fun i => (x i).natAbs)) ≤ 6 →
    value (integerSpeeds x) ≤ (1/7 : ℝ)

theorem classCount_eq_seven_of_lt_sixth
    (hfive : LonelyRunnerBound 5)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : spaceValue (realSpan E) < (1/6 : ℝ)) : classCount E = 7 := by
  have hupper : classCount E ≤ 7 := by simpa using classCount_le_card E
  by_contra hne
  have hclasses : classCount E ≤ 6 := by omega
  obtain ⟨F, hFE, _, hFfree, hcount⟩ := exists_coordinate_free_line E hfree
  have hFclasses : classCount F ≤ 5 := by rw [hdim] at hcount; omega
  obtain ⟨w, hwF, hwzero, _⟩ := exists_integer_direction F hFfree
  have hsmall : (integerSpeeds w).length ≤ 5 := by
    rw [integerSpeeds_length]
    exact (natAbs_values_card_le_rational_abs w).trans
      ((absolute_values_card_le_classCount hwF).trans hFclasses)
  have hlower := hfive (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w) hsmall (integerSpeeds_positive w hwzero)
  have hvalue := integer_direction_value_le E w (hFE hwF)
  norm_num at hlower
  linarith

theorem no_forced_signed_equality_of_lt_sixth
    (hfive : LonelyRunnerBound 5)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : spaceValue (realSpan E) < (1/6 : ℝ))
    (i j : Fin 7) (hij : i ≠ j) : ¬SameCoordinate E i j := by
  have hcard := classCount_eq_seven_of_lt_sixth hfive E hfree hdim hbelow
  have hsurj : Function.Surjective (Quotient.mk (coordinateSetoid E)) :=
    Quotient.mk_surjective
  have hbij := hsurj.bijective_of_nat_card_le
    (show Nat.card (Fin 7) ≤ Nat.card (Quotient (coordinateSetoid E)) by
      change Nat.card (Fin 7) ≤ classCount E
      simpa only [Nat.card_eq_fintype_card, Fintype.card_fin] using hcard.ge)
  intro hsame
  exact hij (hbij.injective (Quotient.sound hsame))

theorem signed_repeat_of_support_card (x : Vector)
    (hcard : Nat.card (Set.range (fun i => (x i).natAbs)) ≤ 6) :
    ∃ i j : Fin 7, i ≠ j ∧ ∃ positive : Bool,
      x i = Finite.sign positive*x j := by
  classical
  have hex : ∃ i j : Fin 7, i ≠ j ∧ (x i).natAbs = (x j).natAbs := by
    by_contra! h
    have hinj : Function.Injective (fun i => (x i).natAbs) := by
      intro i j hij
      by_contra hne
      exact h i j hne hij
    rw [Nat.card_range_of_injective hinj] at hcard
    norm_num only [Nat.card_eq_fintype_card, Fintype.card_fin] at hcard
  obtain ⟨i, j, hij, heq⟩ := hex
  rcases Int.natAbs_eq_natAbs_iff.mp heq with h | h
  · exact ⟨i, j, hij, true, by simpa [Finite.sign] using h⟩
  · exact ⟨i, j, hij, false, by simpa [Finite.sign] using h⟩

theorem repeat_direction_rescale (u w x : Vector)
    (hx : (fun i => (x i : ℚ)) ∈
      Submodule.span ℚ {(fun i => (u i : ℚ)), (fun i => (w i : ℚ))})
    (hxzero : ∀ i, x i ≠ 0)
    (i j : Fin 7) (positive : Bool)
    (hrepeat : x i = Finite.sign positive*x j)
    (hnot : ¬(u i = Finite.sign positive*u j ∧ w i = Finite.sign positive*w j)) :
    ∃ c : ℚ, c ≠ 0 ∧ (fun a => (x a : ℚ)) =
      c • (fun a => (Finite.repeatVector u w i j positive a : ℚ)) := by
  obtain ⟨a, b, hcomb⟩ := Submodule.mem_span_pair.mp hx
  let A : ℤ := u i-Finite.sign positive*u j
  let C : ℤ := w i-Finite.sign positive*w j
  have hxcoord (l : Fin 7) : (x l : ℚ) = a*(u l : ℚ)+b*(w l : ℚ) := by
    simpa only [Pi.add_apply, Pi.smul_apply, smul_eq_mul] using (congrFun hcomb l).symm
  have hrel : a*(A : ℚ)+b*(C : ℚ) = 0 := by
    calc
      _ = (x i : ℚ)-(Finite.sign positive : ℚ)*(x j : ℚ) := by
        rw [hxcoord i, hxcoord j]
        dsimp [A, C]
        push_cast
        ring
      _ = 0 := sub_eq_zero.mpr (by exact_mod_cast hrepeat)
  have hscale : ∃ c : ℚ, (fun l => (x l : ℚ)) =
      c • (fun l => (Finite.repeatVector u w i j positive l : ℚ)) := by
    by_cases hA : A = 0
    · have hC : C ≠ 0 := by
        intro hC
        apply hnot
        exact ⟨sub_eq_zero.mp hA, sub_eq_zero.mp hC⟩
      have hCr : (C : ℚ) ≠ 0 := by exact_mod_cast hC
      have hb : b = 0 := by
        rw [hA, Int.cast_zero, mul_zero, zero_add] at hrel
        exact (mul_eq_zero.mp hrel).resolve_right hCr
      refine ⟨-a/(C : ℚ), ?_⟩
      ext l
      change (x l : ℚ) = (-a/(C : ℚ))*(Finite.repeatVector u w i j positive l : ℚ)
      rw [hxcoord l, hb]
      change a*(u l : ℚ)+0*(w l : ℚ) =
        (-a/(C : ℚ))*((A*w l-C*u l : ℤ) : ℚ)
      rw [hA]
      push_cast
      field_simp [hCr]
      ring
    · have hAr : (A : ℚ) ≠ 0 := by exact_mod_cast hA
      refine ⟨b/(A : ℚ), ?_⟩
      ext l
      change (x l : ℚ) = (b/(A : ℚ))*(Finite.repeatVector u w i j positive l : ℚ)
      rw [hxcoord l]
      change a*(u l : ℚ)+b*(w l : ℚ) =
        (b/(A : ℚ))*((A*w l-C*u l : ℤ) : ℚ)
      push_cast
      field_simp [hAr]
      have hmul := congrArg (fun r : ℚ => r*(u l : ℚ)) hrel
      nlinarith
  obtain ⟨c, hc⟩ := hscale
  refine ⟨c, ?_, hc⟩
  intro hz
  rw [hz, zero_smul] at hc
  have h := congrFun hc 0
  change (x 0 : ℚ) = 0 at h
  exact hxzero 0 (by exact_mod_cast h)

theorem value_eq_of_rational_rescale (x q : Vector) (c : ℚ) (hc : c ≠ 0)
    (hscale : (fun i => (x i : ℚ)) = c • (fun i => (q i : ℚ))) :
    value (integerSpeeds x) = value (integerSpeeds q) := by
  have hcR : (c : ℝ) ≠ 0 := by exact_mod_cast hc
  have hscaleR : (fun i => (x i : ℝ)) = (c : ℝ) • (fun i => (q i : ℝ)) := by
    ext i
    have h := congrFun hscale i
    change (x i : ℚ) = c*(q i : ℚ) at h
    change (x i : ℝ) = (c : ℝ)*(q i : ℝ)
    exact_mod_cast h
  rw [← spaceValue_integer_line, ← spaceValue_integer_line, hscaleR,
    Submodule.span_singleton_smul_eq (isUnit_iff_ne_zero.mpr hcR)]

theorem repeat_direction_bound_of_minors
    (hfive : LonelyRunnerBound 5)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2) (u w : Vector)
    (hspan : Submodule.span ℚ {(fun i => (u i : ℚ)), (fun i => (w i : ℚ))} = E)
    (A : ℝ) (hA : 0 < A)
    (hminor : ∀ i j, |(minor u w i j : ℝ)| ≤ A)
    (hgap : spaceValue (realSpan E) < (1/7 : ℝ)+1/(28*A))
    (hsixth : spaceValue (realSpan E) < (1/6 : ℝ)) :
    RepeatDirectionBound E := by
  intro x hx hxzero hxcard
  obtain ⟨i, j, hij, positive, hrepeat⟩ := signed_repeat_of_support_card x hxcard
  have hnot : ¬(u i = Finite.sign positive*u j ∧ w i = Finite.sign positive*w j) := by
    rintro ⟨hu, hw⟩
    exact no_forced_signed_equality_of_lt_sixth hfive E hfree hdim hsixth i j hij
      (sameCoordinate_of_spanning_pair E u w hspan i j positive hu hw)
  obtain ⟨c, hc, hscale⟩ := repeat_direction_rescale u w x (by rwa [hspan])
    hxzero i j positive hrepeat hnot
  let q := Finite.repeatVector u w i j positive
  have hqzero (l : Fin 7) : q l ≠ 0 := by
    intro hz
    have h := congrFun hscale l
    change (x l : ℚ) = c*(q l : ℚ) at h
    rw [hz, Int.cast_zero, mul_zero] at h
    exact hxzero l (by exact_mod_cast h)
  have huE : (fun i => (u i : ℚ)) ∈ E := by
    rw [← hspan]
    exact Submodule.subset_span (by simp)
  have hwE : (fun i => (w i : ℚ)) ∈ E := by
    rw [← hspan]
    exact Submodule.subset_span (by simp)
  have hqE : (fun l => (q l : ℚ)) ∈ E := repeatVector_mem E u w huE hwE i j positive
  have hqvalue := integer_direction_value_le E q hqE
  have hqcard : 1 < (integerSpeeds q).toFinset.card := by
    by_contra hn
    have hsmall : (integerSpeeds q).length ≤ 5 := by
      rw [List.toFinset_card_of_nodup (integerSpeeds_nodup q)] at hn
      omega
    have hlower := hfive (integerSpeeds q) (integerSpeeds_nonempty q)
      (integerSpeeds_nodup q) hsmall (integerSpeeds_positive q hqzero)
    norm_num at hlower
    linarith
  have hqbound (d : ℕ) (hd : d ∈ integerSpeeds q) : (d : ℝ) ≤ 2*A := by
    obtain ⟨l, rfl⟩ := (mem_integerSpeeds q d).mp hd
    simpa only [Nat.cast_natAbs, Int.cast_abs] using
      repeatVector_abs_le u w A hminor i j positive l
  have hlowq : value (integerSpeeds q) ≤ (1/7 : ℝ) := by
    apply value_le_one_seventh_of_pair_bound (integerSpeeds q) hqcard
      (integerSpeeds_positive q hqzero) (2*A) (by positivity) hqbound
    simpa only [show (14 : ℝ)*(2*A) = 28*A by ring] using hqvalue.trans_lt hgap
  rw [value_eq_of_rational_rescale x q c hc hscale]
  exact hlowq

end

end Loneliness.SevenCoordinateCritical.Quantitative
