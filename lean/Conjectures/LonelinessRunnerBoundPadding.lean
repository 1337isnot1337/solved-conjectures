import Conjectures.LonelinessRunnerBoundTransport

/-! Distinct positive padding removes the smaller-runner hypotheses from
primitive-classification transport. Appending constraints can only decrease
the value. Any smaller bounds used to prove a classification remain premises
of that classification; the transport itself does not need them. -/

namespace Loneliness.CoordinateSubspace

private theorem exists_distinct_positive_extension_add (ds : List ℕ)
    (hne : ds ≠ []) (hnodup : ds.Nodup) (hpositive : ∀ a ∈ ds, 0 < a)
    (r : ℕ) : ∃ es : List ℕ, ds ⊆ es ∧ es.length = ds.length + r ∧
      es.Nodup ∧ (∀ a ∈ es, 0 < a) := by
  induction r with
  | zero => exact ⟨ds, fun _ h => h, by omega, hnodup, hpositive⟩
  | succ r ih =>
    obtain ⟨es, hsub, hlen, hdistinct, hpos⟩ := ih
    have hesne : es ≠ [] := by
      intro hz
      apply hne
      apply List.eq_nil_of_subset_nil
      simpa only [hz] using hsub
    let a := es.max hesne + 1
    have hafresh : a ∉ es := by
      intro ha
      have hle : a ≤ es.max hesne := List.le_max_of_mem ha
      dsimp [a] at hle
      omega
    refine ⟨a :: es, ?_, ?_, List.nodup_cons.mpr ⟨hafresh, hdistinct⟩, ?_⟩
    · intro b hb
      exact List.mem_cons_of_mem a (hsub hb)
    · simp only [List.length_cons, hlen]
      omega
    · intro b hb
      rcases List.mem_cons.mp hb with rfl | hb
      · dsimp [a]
        omega
      · exact hpos b hb

/-- Every nonempty positive distinct list extends to a positive distinct list
of any specified larger length. -/
theorem exists_distinct_positive_extension (ds : List ℕ)
    (hne : ds ≠ []) (hnodup : ds.Nodup) (hpositive : ∀ a ∈ ds, 0 < a)
    (k : ℕ) (hlen : ds.length ≤ k) :
    ∃ es : List ℕ, ds ⊆ es ∧ es.length = k ∧ es.Nodup ∧ (∀ a ∈ es, 0 < a) := by
  obtain ⟨es, hsub, hlength, hdistinct, hpos⟩ :=
    exists_distinct_positive_extension_add ds hne hnodup hpositive (k - ds.length)
  exact ⟨es, hsub, by omega, hdistinct, hpos⟩

/-- Adding speeds imposes additional clearance constraints and decreases the
supremal value. -/
theorem value_le_of_list_subset {ds es : List ℕ} (hsub : ds ⊆ es) :
    value es ≤ value ds := by
  apply value_le
  intro t ht
  have hclear : clearance es t ≤ clearance ds t := by
    apply le_clearance (clearance_le_half es t)
    intro a ha
    exact clearance_le_of_mem (hsub ha) t
  exact hclear.trans (le_value ht)

/-- A primitive lower bound at exact length `k` implies the full bound for
all distinct positive lists of length at most `k`, without smaller-runner
assumptions. -/
theorem lonelyRunnerBound_of_exact_length_primitive_lower (k : ℕ)
    (hprimitive : ∀ ds : List ℕ, ds.length = k → ds.Nodup →
      (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
        (1 : ℝ) / (k + 1) ≤ value ds) : LonelyRunnerBound k := by
  intro ds hne hnodup hlen hpositive
  obtain ⟨es, hsub, hlength, hdistinct, hpos⟩ :=
    exists_distinct_positive_extension ds hne hnodup hpositive k hlen
  have hesne : es ≠ [] := by
    intro hz
    apply hne
    apply List.eq_nil_of_subset_nil
    simpa only [hz] using hsub
  exact (value_lower_of_primitive k ((1 : ℝ) / (k + 1)) hprimitive
    es hesne hlength hdistinct hpos).trans (value_le_of_list_subset hsub)

/-- A closed-sublevel primitive classification and lower bounds for its
classified families imply the full runner bound. Smaller-runner assumptions
are needed only if they occur in the proof of the classification itself. -/
theorem lonelyRunnerBound_of_exact_length_primitive_classification (k : ℕ)
    (P : List ℕ → Prop)
    (hclassify : ∀ ds : List ℕ, ds.length = k → ds.Nodup →
      (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
      value ds ≤ (1 : ℝ) / (k + 1) → P ds)
    (hvalues : ∀ ds : List ℕ, P ds → (1 : ℝ) / (k + 1) ≤ value ds) :
    LonelyRunnerBound k := by
  apply lonelyRunnerBound_of_exact_length_primitive_lower k
  intro ds hlen hnodup hpositive hprimitive
  by_cases hbound : (1 : ℝ) / (k + 1) ≤ value ds
  · exact hbound
  · exact hvalues ds (hclassify ds hlen hnodup hpositive hprimitive
      (lt_of_not_ge hbound).le)

end Loneliness.CoordinateSubspace
