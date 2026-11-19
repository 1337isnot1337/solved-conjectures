import Conjectures.LonelinessFiveSpeedPrimitiveDirection
import Conjectures.LonelinessFiveSpeedSporadic

/-! Consequences of the literal sporadic exhaustion statement.  The finite
coverage proof is an explicit input here and is supplied by the concrete
certificate assembly, rather than treated as an axiom. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.CriticalFamilies

def SporadicExhaustion : Prop :=
  ∀ ds : List ℕ, ds.length = 5 → ds.Nodup → (∀ a ∈ ds, 0 < a) →
    ds.foldr Nat.gcd 0 = 1 → ds.Pairwise (· ≤ ·) →
    ¬ContainsCriticalQuadruple ds → value ds < (1 / 5 : ℝ) → ds ∈ sporadicTuples

theorem sorted_normalized_sporadic_of_exhaustion (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a)
    (hnot : ¬ContainsCriticalQuadruple ds) (hbelow : value ds < (1 / 5 : ℝ)) :
    (Normalization.normalize ds).mergeSort (· ≤ ·) ∈ sporadicTuples := by
  have hne : ds ≠ [] := by intro h; simp [h] at hlen
  let ns := Normalization.normalize ds
  let ss := ns.mergeSort (· ≤ ·)
  have hperm : ss.Perm ns := List.mergeSort_perm _ _
  have hvalue : value ss = value ds :=
    (value_perm hperm).trans (Normalization.value_normalize ds hne hpositive)
  apply hexhaustion ss
  · exact hperm.length_eq.trans ((Normalization.normalize_length ds).trans hlen)
  · exact hperm.nodup_iff.mpr (Normalization.normalize_nodup hdistinct)
  · intro a ha
    exact Normalization.normalize_positive ds hpositive a (hperm.mem_iff.mp ha)
  · change Normalization.gcd ss = 1
    rw [Modular.list_gcd_eq_of_perm hperm]
    exact Normalization.normalize_primitive ds hne hpositive
  · exact List.pairwise_mergeSort' (· ≤ ·) ns
  · intro hcrit
    apply hnot
    apply (normalization_critical_iff ds hne hpositive).mp
    exact containsCriticalQuadruple_of_subset (fun a ha => hperm.mem_iff.mp ha) hcrit
  · rw [hvalue]
    exact hbelow

theorem primitive_sporadic_classification_iff (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) (hprimitive : ds.foldr Nat.gcd 0 = 1)
    (hordered : ds.Pairwise (· ≤ ·)) :
    (value ds < (1 / 5 : ℝ) ∧ ¬ContainsCriticalQuadruple ds) ↔ ds ∈ sporadicTuples := by
  constructor
  · rintro ⟨hbelow, hnot⟩
    exact hexhaustion ds hlen hdistinct hpositive hprimitive hordered hnot hbelow
  · intro hmem
    exact ⟨sporadicTuples_below_threshold ds hmem, sporadicTuples_not_critical ds hmem⟩

theorem five_speed_spectrum_of_exhaustion (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) (hbelow : value ds < (1 / 5 : ℝ)) :
    SpectrumForm ds := by
  by_cases hcrit : ContainsCriticalQuadruple ds
  · exact Normalization.critical_family_below_threshold hlen hpositive hcrit hbelow
  · have hmem := sorted_normalized_sporadic_of_exhaustion hexhaustion ds hlen
      hdistinct hpositive hcrit hbelow
    have hne : ds ≠ [] := by intro h; simp [h] at hlen
    have hvalue : value ((Normalization.normalize ds).mergeSort (· ≤ ·)) = value ds :=
      (value_perm (List.mergeSort_perm _ _)).trans
        (Normalization.value_normalize ds hne hpositive)
    simpa only [SpectrumForm, hvalue] using sporadicTuples_spectrum _ hmem

theorem five_speed_spectrum_exact_of_exhaustion (hexhaustion : SporadicExhaustion)
    (r : ℝ) :
    (∃ ds : List ℕ, ds.length = 5 ∧ ds.Nodup ∧ (∀ a ∈ ds, 0 < a) ∧
      value ds = r ∧ r < (1 / 5 : ℝ)) ↔
      ∃ s : ℕ, 1 ≤ s ∧ r = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  constructor
  · rintro ⟨ds, hlen, hdistinct, hpositive, hvalue, hbelow⟩
    obtain ⟨s, hs, he⟩ := five_speed_spectrum_of_exhaustion hexhaustion ds hlen
      hdistinct hpositive (by simpa only [hvalue] using hbelow)
    exact ⟨s, hs, hvalue.symm.trans he⟩
  · rintro ⟨s, hs, rfl⟩
    obtain ⟨ds, hlen, hdistinct, hpositive, _, hvalue, hbelow⟩ := five_family_realizes s hs
    exact ⟨ds, hlen, hdistinct, hpositive, hvalue, by simpa only [hvalue] using hbelow⟩

theorem five_speed_lower_bound_of_exhaustion (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) : (1 / 6 : ℝ) ≤ value ds := by
  by_cases hlarge : (1 / 5 : ℝ) ≤ value ds
  · linarith
  · obtain ⟨s, hs, hvalue⟩ := five_speed_spectrum_of_exhaustion hexhaustion ds hlen
      hdistinct hpositive (lt_of_not_ge hlarge)
    rw [hvalue]
    apply (le_div_iff₀ (by positivity : (0 : ℝ) < 5 * (s : ℝ) + 1)).mpr
    have hsR : (1 : ℝ) ≤ s := by exact_mod_cast hs
    linarith

theorem five_speed_below_additive_of_exhaustion (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) (hbelow : value ds < (1 / 5 : ℝ)) :
    ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds := by
  by_cases hcrit : ContainsCriticalQuadruple ds
  · exact critical_quadruple_additive hcrit
  · have hmem := sorted_normalized_sporadic_of_exhaustion hexhaustion ds hlen
      hdistinct hpositive hcrit hbelow
    obtain ⟨a, ha, b, hb, hab⟩ := sporadicTuples_additive _ hmem
    have hperm := List.mergeSort_perm (Normalization.normalize ds) (· ≤ ·)
    have ha' := hperm.mem_iff.mp ha
    have hb' := hperm.mem_iff.mp hb
    have hab' := hperm.mem_iff.mp hab
    have hscale (x : ℕ) (hx : x ∈ Normalization.normalize ds) :
        Normalization.gcd ds * x ∈ ds := by
      rw [← Normalization.rescale_normalize ds]
      exact List.mem_map.mpr ⟨x, hx, rfl⟩
    refine ⟨Normalization.gcd ds * a, hscale a ha',
      Normalization.gcd ds * b, hscale b hb', ?_⟩
    simpa only [Nat.mul_add] using hscale (a + b) hab'

theorem five_speed_value_ge_fifth_of_no_additive (hexhaustion : SporadicExhaustion)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a)
    (hnoadditive : ¬∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds) :
    (1 / 5 : ℝ) ≤ value ds := by
  by_contra h
  exact hnoadditive (five_speed_below_additive_of_exhaustion hexhaustion ds hlen
    hdistinct hpositive (lt_of_not_ge h))

end Loneliness.FiveSpeedCertificate
