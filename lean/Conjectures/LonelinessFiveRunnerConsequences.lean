import Conjectures.LonelinessFiveRunnerFinite
import Conjectures.LonelinessConsecutive
import Conjectures.LonelinessFiveExamples

/-! Consequences of the complete primitive five-runner classification.

The two retained directions have their actual global value `1/6`. Gcd
normalization transfers the finite-dimensional classification to arbitrary
positive integer lists, and the checked lower cases cover shorter lists.
-/

namespace Loneliness.Modular.FiveRunner

def PrimitiveClassification : Prop :=
  ∀ (v : Fin 5 → ℕ), (∀ i, 0 < v i) → Search.Primitive v →
    value (List.ofFn v) ≤ (1 / 6 : ℝ) →
      (List.ofFn v).Perm consecutive ∨ (List.ofFn v).Perm exceptional

theorem consecutive_value : value consecutive = (1 / 6 : ℝ) := by
  have h := Loneliness.consecutive_value 5 (by decide)
  norm_num [consecutive, List.range'] at h ⊢
  exact h

theorem exceptional_value : value exceptional = (1 / 6 : ℝ) :=
  FiveSpeedExamples.v1_3_4_5_9_value

theorem value_eq_of_direction {ds : List ℕ}
    (h : ds.Perm consecutive ∨ ds.Perm exceptional) : value ds = (1 / 6 : ℝ) := by
  rcases h with h | h
  · exact (CriticalFamilies.value_perm h).trans consecutive_value
  · exact (CriticalFamilies.value_perm h).trans exceptional_value

theorem primitive_list_classification (hclass : PrimitiveClassification)
    (ds : List ℕ) (hlength : ds.length = 5)
    (hpositive : ∀ a ∈ ds, 0 < a) (hprimitive : Normalization.gcd ds = 1)
    (hvalue : value ds ≤ (1 / 6 : ℝ)) :
    ds.Perm consecutive ∨ ds.Perm exceptional := by
  let v : Fin 5 → ℕ := fun i => ds.get (Fin.cast hlength.symm i)
  have hv : List.ofFn v = ds :=
    (List.ofFn_congr hlength ds.get).symm.trans (List.ofFn_get ds)
  have hpositive' (i : Fin 5) : 0 < v i := by
    apply hpositive
    rw [← hv]
    exact List.mem_ofFn.mpr ⟨i, rfl⟩
  have hprimitive' : Search.Primitive v := by
    change Normalization.gcd (List.ofFn v) = 1
    rwa [hv]
  have hvalue' : value (List.ofFn v) ≤ (1 / 6 : ℝ) := by
    rwa [hv]
  simpa only [hv] using hclass v hpositive' hprimitive' hvalue'

theorem normalized_classification (hclass : PrimitiveClassification)
    (ds : List ℕ) (hlength : ds.length = 5)
    (hpositive : ∀ a ∈ ds, 0 < a) (hvalue : value ds ≤ (1 / 6 : ℝ)) :
    (Normalization.normalize ds).Perm consecutive ∨
      (Normalization.normalize ds).Perm exceptional := by
  have hnonempty : ds ≠ [] := by intro h; simp [h] at hlength
  apply primitive_list_classification hclass (Normalization.normalize ds)
    (by simpa only [Normalization.normalize_length] using hlength)
    (Normalization.normalize_positive ds hpositive)
    (Normalization.normalize_primitive ds hnonempty hpositive)
  rwa [Normalization.value_normalize ds hnonempty hpositive]

/-- The quantified runner bound follows without a remaining modular,
geometric, or normalization assumption once the classification is supplied. -/
theorem lonelyRunnerBound_of_classification
    (hfour : CoordinateSubspace.LonelyRunnerBound 4)
    (hclass : PrimitiveClassification) : CoordinateSubspace.LonelyRunnerBound 5 := by
  intro ds hnonempty hnodup hlength hpositive
  norm_num
  by_cases hsmall : ds.length ≤ 4
  · have h := hfour ds hnonempty hnodup hsmall hpositive
    norm_num at h
    linarith
  · have hlength5 : ds.length = 5 := by omega
    by_contra hn
    have hbelow : value ds < (1 / 6 : ℝ) := lt_of_not_ge hn
    have htarget := normalized_classification hclass ds hlength5 hpositive hbelow.le
    have hvalue := value_eq_of_direction htarget
    rw [Normalization.value_normalize ds hnonempty hpositive] at hvalue
    linarith

end Loneliness.Modular.FiveRunner
