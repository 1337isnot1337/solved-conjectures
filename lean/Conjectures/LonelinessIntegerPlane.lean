import Conjectures.LonelinessSubspaceExtension
import Conjectures.LonelinessCoalescenceValue
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

/-! An independent integer approximation constructs a rational plane with
a controlled actual loneliness value. Signed coordinates are allowed. -/

namespace Loneliness.Pigeonhole

noncomputable section

open CoordinateSubspace SubspaceDensity

theorem integer_approximation_plane (v w : Fin 5 → ℤ)
    (hvzero : ∀ i, v i ≠ 0)
    (hnot : ¬∃ a : ℝ, ∀ i, (w i : ℝ) = a * (v i : ℝ))
    (t r : ℝ) (herror : ∀ i, |(w i : ℝ) - t * (v i : ℝ)| ≤ r) :
    ∃ F : Submodule ℚ (Fin 5 → ℚ),
      Module.finrank ℚ F = 2 ∧ CoordinateFree F ∧
      (fun i => (v i : ℚ)) ∈ F ∧
      spaceValue (realSpan F) ≤ value (integerSpeeds v) + r / 2 := by
  let vQ : Fin 5 → ℚ := fun i => (v i : ℚ)
  let wQ : Fin 5 → ℚ := fun i => (w i : ℚ)
  let vR : Fin 5 → ℝ := fun i => (v i : ℝ)
  let wR : Fin 5 → ℝ := fun i => (w i : ℝ)
  let F := Submodule.span ℚ ({vQ, wQ} : Set (Fin 5 → ℚ))
  have hvne : vQ ≠ 0 := by
    intro hzero
    apply hvzero 0
    have hz := congrFun hzero 0
    change (v 0 : ℚ) = 0 at hz
    exact_mod_cast hz
  have hpair : LinearIndependent ℚ (![vQ,wQ] : Fin 2 → Fin 5 → ℚ) := by
    apply (LinearIndependent.pair_iff' hvne).mpr
    intro c heq
    apply hnot
    refine ⟨(c : ℝ), ?_⟩
    intro i
    have h := congrArg (fun x : ℚ => (x : ℝ)) (congrFun heq i)
    simpa only [vQ, wQ, Pi.smul_apply, smul_eq_mul, Rat.cast_mul,
      Rat.cast_intCast] using h.symm
  have hrange : Set.range (![vQ,wQ] : Fin 2 → Fin 5 → ℚ) = {vQ,wQ} := by
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
  have hdim : Module.finrank ℚ F = 2 := by
    change Module.finrank ℚ (Submodule.span ℚ {vQ,wQ}) = 2
    rw [← hrange, finrank_span_eq_card hpair]
    simp
  have hvF : vQ ∈ F := Submodule.subset_span (by simp)
  have hfree : CoordinateFree F := by
    intro i
    refine ⟨vQ, hvF, ?_⟩
    change (v i : ℚ) ≠ 0
    exact_mod_cast hvzero i
  have hvcast : rationalVector vQ = vR := by ext i; simp [vQ, vR]
  have hwcast : rationalVector wQ = wR := by ext i; simp [wQ, wR]
  have hreal : realSpan F =
      Submodule.span ℝ {vR} ⊔ Submodule.span ℝ {wR} := by
    change realSpan (Submodule.span ℚ {vQ,wQ}) = _
    rw [realSpan_span, Set.image_insert_eq, Set.image_singleton, hvcast, hwcast,
      Submodule.span_insert]
  refine ⟨F, hdim, hfree, hvF, ?_⟩
  let E : Submodule ℝ (Fin 5 → ℝ) := Submodule.span ℝ {vR}
  have htE : t • vR ∈ E := E.smul_mem t (Submodule.mem_span_singleton_self _)
  have hbound := extension_value_bound E (fun _ : Unit => w) (fun _ => t • vR)
    (fun _ => htE) (fun _ => r)
    (fun _ i => by simpa only [Pi.smul_apply, smul_eq_mul, vR] using herror i)
  have hwRange : Set.range (fun _ : Unit => integerVector w) = {wR} := by
    change Set.range (fun _ : Unit => wR) = {wR}
    exact Set.range_const
  rw [hwRange] at hbound
  change spaceValue (E ⊔ Submodule.span ℝ {wR}) ≤ _ at hbound
  have hline : spaceValue E = value (integerSpeeds v) := spaceValue_integer_line v
  rw [hline] at hbound
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_unit, one_smul] at hbound
  rw [hreal]
  change spaceValue (E ⊔ Submodule.span ℝ {wR}) ≤ _
  convert hbound using 1
  ring

end

end Loneliness.Pigeonhole
