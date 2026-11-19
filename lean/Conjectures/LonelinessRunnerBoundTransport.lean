import Conjectures.LonelinessNormalization
import Conjectures.LonelinessCoalescenceValue

/-! Transport primitive classifications to the full runner lower bound.
Normalization handles lists of the stated length. Shorter lists use the
explicit lower-runner assumptions. The classification threshold stays closed,
and every value bound for a classified family remains an explicit premise. -/

namespace Loneliness.CoordinateSubspace

/-- A value lower bound for primitive distinct lists passes through gcd
normalization to every nonempty distinct list of the same length. -/
theorem value_lower_of_primitive (k : ℕ) (r : ℝ)
    (hprimitive : ∀ ns : List ℕ, ns.length = k → ns.Nodup →
      (∀ a ∈ ns, 0 < a) → Normalization.gcd ns = 1 → r ≤ value ns)
    (ds : List ℕ) (hne : ds ≠ []) (hlen : ds.length = k)
    (hnodup : ds.Nodup) (hpositive : ∀ a ∈ ds, 0 < a) : r ≤ value ds := by
  have h := hprimitive (Normalization.normalize ds)
    (by simpa only [Normalization.normalize_length] using hlen)
    (Normalization.normalize_nodup hnodup)
    (Normalization.normalize_positive ds hpositive)
    (Normalization.normalize_primitive ds hne hpositive)
  simpa only [Normalization.value_normalize ds hne hpositive] using h

/-- The primitive case of exact length `k`, together with all smaller runner
bounds, implies the full bound for lists of length at most `k`. -/
theorem lonelyRunnerBound_of_primitive_lower (k : ℕ)
    (hsmaller : ∀ m : ℕ, 1 ≤ m → m < k → LonelyRunnerBound m)
    (hprimitive : ∀ ds : List ℕ, ds.length = k → ds.Nodup →
      (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
        (1 : ℝ) / (k + 1) ≤ value ds) : LonelyRunnerBound k := by
  intro ds hne hnodup hlen hpositive
  by_cases hshort : ds.length < k
  · have hlengthpos : 1 ≤ ds.length := by
      have hlengthne : ds.length ≠ 0 := fun h => hne (List.length_eq_zero_iff.mp h)
      omega
    have hbound := hsmaller ds.length hlengthpos hshort
      ds hne hnodup le_rfl hpositive
    have hlengthR : (ds.length : ℝ) ≤ k := by exact_mod_cast hlen
    have hreciprocal : (1 : ℝ) / ((k : ℝ) + 1) ≤ 1 / ((ds.length : ℝ) + 1) :=
      one_div_le_one_div_of_le (by positivity) (by linarith)
    exact hreciprocal.trans hbound
  · have hexact : ds.length = k := by omega
    exact value_lower_of_primitive k ((1 : ℝ) / (k + 1)) hprimitive
      ds hne hexact hnodup hpositive

/-- A closed-sublevel classification supplies the exact-length primitive
bound when every classified case has the required value lower bound. -/
theorem lonelyRunnerBound_of_primitive_classification (k : ℕ)
    (hsmaller : ∀ m : ℕ, 1 ≤ m → m < k → LonelyRunnerBound m)
    (P : List ℕ → Prop)
    (hclassify : ∀ ds : List ℕ, ds.length = k → ds.Nodup →
      (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
      value ds ≤ (1 : ℝ) / (k + 1) → P ds)
    (hvalues : ∀ ds : List ℕ, P ds → (1 : ℝ) / (k + 1) ≤ value ds) :
    LonelyRunnerBound k := by
  apply lonelyRunnerBound_of_primitive_lower k hsmaller
  intro ds hlen hnodup hpositive hprimitive
  by_cases hbound : (1 : ℝ) / (k + 1) ≤ value ds
  · exact hbound
  · exact hvalues ds (hclassify ds hlen hnodup hpositive hprimitive
      (lt_of_not_ge hbound).le)

/-- A finite list of permutation representatives is a special case of the
generic classification transport. -/
theorem lonelyRunnerBound_of_primitive_permutation_cases (k : ℕ)
    (hsmaller : ∀ m : ℕ, 1 ≤ m → m < k → LonelyRunnerBound m)
    (representatives : List (List ℕ))
    (hclassify : ∀ ds : List ℕ, ds.length = k → ds.Nodup →
      (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
      value ds ≤ (1 : ℝ) / (k + 1) → ∃ es ∈ representatives, ds.Perm es)
    (hvalues : ∀ es ∈ representatives, (1 : ℝ) / (k + 1) ≤ value es) :
    LonelyRunnerBound k := by
  apply lonelyRunnerBound_of_primitive_classification k hsmaller
    (fun ds => ∃ es ∈ representatives, ds.Perm es) hclassify
  intro ds hcase
  obtain ⟨es, hes, hperm⟩ := hcase
  rw [CriticalFamilies.value_perm hperm]
  exact hvalues es hes

/-- Strong induction turns primitive bounds, each using only earlier runner
bounds, into the full finite range. The initial range and every induction step
are explicit hypotheses. -/
theorem lonelyRunnerBounds_up_to_of_primitive_steps (seed upper : ℕ)
    (hseed : ∀ m : ℕ, 1 ≤ m → m ≤ seed → LonelyRunnerBound m)
    (hstep : ∀ k : ℕ, seed < k → k ≤ upper →
      (∀ m : ℕ, 1 ≤ m → m < k → LonelyRunnerBound m) →
      ∀ ds : List ℕ, ds.length = k → ds.Nodup →
        (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
          (1 : ℝ) / (k + 1) ≤ value ds) :
    ∀ k : ℕ, 1 ≤ k → k ≤ upper → LonelyRunnerBound k := by
  intro k
  induction k using Nat.strong_induction_on with
  | h k ih =>
    intro hkpos hkupper
    by_cases hbase : k ≤ seed
    · exact hseed k hkpos hbase
    · have hprevious : ∀ m : ℕ, 1 ≤ m → m < k → LonelyRunnerBound m := by
        intro m hmpos hmk
        exact ih m hmk hmpos (hmk.le.trans hkupper)
      exact lonelyRunnerBound_of_primitive_lower k hprevious
        (hstep k (by omega) hkupper hprevious)

end Loneliness.CoordinateSubspace
