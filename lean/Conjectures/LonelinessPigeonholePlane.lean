import Conjectures.LonelinessPigeonhole
import Conjectures.LonelinessSubspaceExtension
import Conjectures.LonelinessSmallRunner

/-! A fully explicit rational plane through a primitive speed line. Its value
increases by at most `1/(2B)`, using finite pigeonholing and coefficient rounding. -/

namespace Loneliness.Pigeonhole

noncomputable section

open CoordinateSubspace SubspaceDensity

theorem approximation_plane {n : ℕ} (v : Fin (n + 1) → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (B : ℕ) (hB : 0 < B) (hlarge : B ^ n < v (Fin.last n)) :
    ∃ F : Submodule ℚ (Fin (n + 1) → ℚ),
      Module.finrank ℚ F = 2 ∧ CoordinateFree F ∧
      (fun i => (v i : ℚ)) ∈ F ∧
      spaceValue (realSpan F) ≤ value (List.ofFn v) + 1 / (2 * (B : ℝ)) := by
  obtain ⟨w, t, htpos, htlt, herror, hnot⟩ :=
    independent_integer_approximation v hprimitive B hB hlarge
  let vQ : Fin (n + 1) → ℚ := fun i => (v i : ℚ)
  let wQ : Fin (n + 1) → ℚ := fun i => (w i : ℚ)
  let vR : Fin (n + 1) → ℝ := fun i => (v i : ℝ)
  let wR : Fin (n + 1) → ℝ := fun i => (w i : ℝ)
  let F := Submodule.span ℚ ({vQ, wQ} : Set (Fin (n + 1) → ℚ))
  have hvne : vQ ≠ 0 := by
    intro hzero
    have hz := congrFun hzero (Fin.last n)
    have hp : (0 : ℚ) < v (Fin.last n) := by exact_mod_cast hpositive (Fin.last n)
    exact (ne_of_gt hp) hz
  have hpair : LinearIndependent ℚ (![vQ,wQ] : Fin 2 → Fin (n + 1) → ℚ) := by
    apply (LinearIndependent.pair_iff' hvne).mpr
    intro c heq
    apply hnot
    refine ⟨(c : ℝ), ?_⟩
    intro i
    have h := congrArg (fun x : ℚ => (x : ℝ)) (congrFun heq i)
    simpa only [vQ, wQ, Pi.smul_apply, smul_eq_mul, Rat.cast_mul,
      Rat.cast_natCast, Rat.cast_intCast] using h.symm
  have hrange : Set.range (![vQ,wQ] : Fin 2 → Fin (n + 1) → ℚ) = {vQ,wQ} := by
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
    exact_mod_cast (ne_of_gt (hpositive i))
  have hvcast : rationalVector vQ = vR := by ext i; simp [vQ, vR]
  have hwcast : rationalVector wQ = wR := by ext i; simp [wQ, wR]
  have hreal : realSpan F =
      Submodule.span ℝ {vR} ⊔ Submodule.span ℝ {wR} := by
    change realSpan (Submodule.span ℚ {vQ,wQ}) = _
    rw [realSpan_span, Set.image_insert_eq, Set.image_singleton, hvcast, hwcast,
      Submodule.span_insert]
  refine ⟨F, hdim, hfree, hvF, ?_⟩
  let E : Submodule ℝ (Fin (n + 1) → ℝ) := Submodule.span ℝ {vR}
  have htE : t • vR ∈ E := E.smul_mem t (Submodule.mem_span_singleton_self _)
  have hbound := extension_value_bound E (fun _ : Unit => w) (fun _ => t • vR)
    (fun _ => htE) (fun _ => (1 : ℝ) / (B : ℝ))
    (fun _ i => by simpa only [Pi.smul_apply, smul_eq_mul, vR] using (herror i).le)
  have hwRange : Set.range (fun _ : Unit => integerVector w) = {wR} := by
    change Set.range (fun _ : Unit => wR) = {wR}
    exact Set.range_const
  rw [hwRange] at hbound
  change spaceValue (E ⊔ Submodule.span ℝ {wR}) ≤ _ at hbound
  have hline : spaceValue E = value (List.ofFn v) := spaceValue_speed_line v
  rw [hline] at hbound
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_unit, one_smul] at hbound
  rw [hreal]
  change spaceValue (E ⊔ Submodule.span ℝ {wR}) ≤ _
  convert hbound using 1
  ring

end

end Loneliness.Pigeonhole
