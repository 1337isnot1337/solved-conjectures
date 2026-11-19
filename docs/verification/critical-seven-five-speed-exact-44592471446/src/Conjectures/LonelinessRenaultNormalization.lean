import Conjectures.LonelinessNormalization
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessRenaultPreliminaries

/-! Transport from primitive five-coordinate witnesses to the project's
full lower-runner statement. Normalization preserves the actual value;
shorter lists are padded with positive speeds before applying the result. -/

namespace Loneliness.Renault

theorem five_list_value_lower_of_primitive
    (hprimitive : ∀ v : Fin 5 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 → ∃ t : ℝ, AllSafe v t)
    (ds : List ℕ) (hlen : ds.length = 5) (hpos : ∀ a ∈ ds, 0 < a) :
    (1 / 6 : ℝ) ≤ value ds := by
  have hne : ds ≠ [] := by intro h; simp [h] at hlen
  let ns := Normalization.normalize ds
  have hnlen : ns.length = 5 := by simpa only [ns, Normalization.normalize_length] using hlen
  let v : Fin 5 → ℕ := fun i => ns[i.val]'(by rw [hnlen]; exact i.isLt)
  have hof : List.ofFn v = ns := by
    apply List.ext_getElem
    · simp [hnlen]
    · intro i h₁ h₂
      simp only [List.getElem_ofFn]
      rfl
  have hnpos := Normalization.normalize_positive ds hpos
  have hvpos : ∀ i, 0 < v i := by
    intro i
    apply hnpos
    exact List.getElem_mem _
  have hvprim : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
    rw [hof]
    exact Normalization.normalize_primitive ds hne hpos
  obtain ⟨t, ht⟩ := hprimitive v hvpos hvprim
  have hclear : (1 / 6 : ℝ) ≤ clearance ns t := by
    apply le_clearance (by norm_num)
    intro a ha
    rw [← hof] at ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact ht i
  rw [← Normalization.value_normalize ds hne hpos]
  exact hclear.trans (CriticalFamilies.le_value_any ns t)

theorem bounded_list_value_lower_of_primitive
    (hprimitive : ∀ v : Fin 5 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 → ∃ t : ℝ, AllSafe v t)
    (ds : List ℕ) (hlen : ds.length ≤ 5) (hpos : ∀ a ∈ ds, 0 < a) :
    (1 / 6 : ℝ) ≤ value ds := by
  let ps := ds ++ List.replicate (5 - ds.length) 1
  have hplen : ps.length = 5 := by simp [ps, Nat.add_sub_of_le hlen]
  have hppos : ∀ a ∈ ps, 0 < a := by
    intro a ha
    rcases List.mem_append.mp ha with ha | ha
    · exact hpos a ha
    · obtain ⟨_, ha⟩ := List.mem_replicate.mp ha
      subst a
      norm_num
  have hp := five_list_value_lower_of_primitive hprimitive ps hplen hppos
  apply hp.trans
  apply value_le
  intro t ht
  have hclear : clearance ps t ≤ clearance ds t := by
    apply le_clearance (clearance_le_half ps t)
    intro a ha
    apply clearance_le_of_mem (t := t)
    exact List.mem_append_left _ ha
  exact hclear.trans (le_value ht)

theorem runner_bound_five_of_primitive
    (hprimitive : ∀ v : Fin 5 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 → ∃ t : ℝ, AllSafe v t) :
    CoordinateSubspace.LonelyRunnerBound 5 := by
  intro ds _ _ hlen hpos
  norm_num only [Nat.cast_ofNat]
  exact bounded_list_value_lower_of_primitive hprimitive ds hlen hpos

end Loneliness.Renault
