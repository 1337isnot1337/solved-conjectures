import Conjectures.LonelinessPlaneDirections
import Conjectures.LonelinessSmallRunner

/-! The precise four-speed input to the finite plane reduction.
`FourSpeedGap` is an explicit hypothesis, not an axiom or an asserted result.
The smaller-speed cases are discharged by the verified three-speed theorem. -/

namespace Loneliness.CoordinateSubspace

def FourSpeedGap : Prop :=
  ∀ ds : List ℕ, ds.length = 4 → ds.Nodup → (∀ a ∈ ds, 0 < a) →
    value ds < (2 / 9 : ℝ) →
    ∃ d : ℕ, 1 ≤ d ∧
      (ds.Perm ([1,2,3,4].map (fun a => d * a)) ∨
        ds.Perm ([1,3,4,7].map (fun a => d * a)))

def CriticalIntegerDirection (w : Fin 5 → ℤ) : Prop :=
  ∃ d : ℕ, 1 ≤ d ∧
    ((integerSpeeds w).Perm ([1,2,3,4].map (fun a => d * a)) ∨
      (integerSpeeds w).Perm ([1,3,4,7].map (fun a => d * a)))

theorem critical_of_repeated_direction (hgap : FourSpeedGap)
    (w : Fin 5 → ℤ) (hwzero : ∀ i, w i ≠ 0)
    (hwcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 4)
    (hbelow : value (integerSpeeds w) < (2 / 9 : ℝ)) :
    CriticalIntegerDirection w := by
  have hlen : (integerSpeeds w).length ≤ 4 := by
    rw [integerSpeeds_length]
    exact hwcard
  have hexact : (integerSpeeds w).length = 4 := by
    by_contra hne
    have hsmall : (integerSpeeds w).length ≤ 3 := by omega
    have hlower := SmallRunner.lonelyRunnerBound 3 (by decide)
      (integerSpeeds w) (integerSpeeds_nonempty w) (integerSpeeds_nodup w)
      hsmall (integerSpeeds_positive w hwzero)
    norm_num at hlower
    linarith
  exact hgap (integerSpeeds w) hexact (integerSpeeds_nodup w)
    (integerSpeeds_positive w hwzero) hbelow

theorem two_critical_integer_directions (hgap : FourSpeedGap)
    (E : Submodule ℚ (Fin 5 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 9 : ℝ)) :
    ∃ q w : Fin 5 → ℤ,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      CriticalIntegerDirection q ∧ CriticalIntegerDirection w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard, hwcard, hpair, hspan⟩ :=
    two_integer_directions E hfree hdim
  have hqcrit := critical_of_repeated_direction hgap q hqzero
    (by simpa using hqcard) ((integer_direction_value_le E q hqE).trans_lt hbelow)
  have hwcrit := critical_of_repeated_direction hgap w hwzero
    (by simpa using hwcard) ((integer_direction_value_le E w hwE).trans_lt hbelow)
  exact ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩

end Loneliness.CoordinateSubspace
