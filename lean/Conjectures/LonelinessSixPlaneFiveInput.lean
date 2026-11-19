import Conjectures.LonelinessSixPlaneGap
import Conjectures.LonelinessFiveSpeedClassificationCore

/-! The exact five-speed input needed by the six-plane gap follows from the
existing literal sporadic exhaustion statement. The critical-family branch
is proved here from its formulas, and the twelve sporadic values leave exactly
one low-value tuple. No finite exhaustion premise is hidden. -/

namespace Loneliness.SixPlane

open CriticalFamilies FiveSpeedCertificate FiveSpeedExamples

theorem critical_parameters_of_low {base ds : List ℕ}
    (hbase : base.Nodup) (hbase_len : base.length = 4)
    (hres : ∀ m ∈ base, m % 5 ≠ 0)
    (hlen : ds.length = 5) (hpos : ∀ m ∈ ds, 0 < m)
    (hprim : ds.foldr Nat.gcd 0 = 1)
    (d : ℕ) (hd : 0 < d) (hsub : (base.map (fun m => d * m)) ⊆ ds)
    (hbelow : value ds < (1 / 5 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ ds.Perm (base ++ [5 * s]) := by
  have hscaled : (base.map (fun m => d * m)).Nodup :=
    List.Nodup.map (mul_right_injective₀ (ne_of_gt hd)) hbase
  obtain ⟨a, hperm⟩ := CriticalFamilies.subset_four_completion hscaled
    (by simpa using hbase_len) hlen hsub
  have ha : 0 < a := hpos a (hperm.mem_iff.mpr (by simp))
  have hcop : Nat.Coprime a d := primitive_coprime hperm hprim
  have hd1 : d = 1 := by
    by_contra hne
    have hge := fifth_of_dilation base hres a d (by omega) hcop
    rw [← value_perm hperm] at hge
    linarith
  subst d
  have hp : ds.Perm (base ++ [a]) := by simpa using hperm
  have hmod : a % 5 = 0 := by
    by_contra hn
    have hge : (1 / 5 : ℝ) ≤ value (base ++ [a]) := by
      apply fifth_of_all_nonzero_residues
      intro m hm
      rcases List.mem_append.mp hm with hm | hm
      · exact hres m hm
      · simpa only [List.mem_singleton.mp hm] using hn
    rw [← value_perm hp] at hge
    linarith
  have haeq : 5 * (a / 5) = a := by omega
  exact ⟨a / 5, by omega, by simpa only [haeq] using hp⟩

theorem first_family_low_parameter (s : ℕ) (hs : 1 ≤ s)
    (hbelow : value [1,2,3,4,5 * s] < (2 / 11 : ℝ)) : s = 1 := by
  rw [five_family_value s hs] at hbelow
  have hcross := (div_lt_iff₀ (by positivity : (0 : ℝ) < 5 * (s : ℝ) + 1)).mp hbelow
  have hsR : (s : ℝ) < 2 := by linarith
  have hsN : s < 2 := by exact_mod_cast hsR
  omega

theorem second_family_ge_two_elevenths (s : ℕ) (hs : 1 ≤ s) :
    (2 / 11 : ℝ) ≤ value [1,3,4,7,5 * s] := by
  by_cases h1 : s = 1
  · subst s
    norm_num [second_family_one_value]
  · have hs2 : 2 ≤ s := by omega
    rw [second_family_value s hs2]
    apply (le_div_iff₀ (by positivity : (0 : ℝ) < 5 * (s : ℝ) + 1)).mpr
    have hsR : (2 : ℝ) ≤ s := by exact_mod_cast hs2
    linarith

theorem primitive_critical_low_tuple (ds : List ℕ)
    (hlen : ds.length = 5) (hpos : ∀ m ∈ ds, 0 < m)
    (hprim : ds.foldr Nat.gcd 0 = 1) (hcrit : ContainsCriticalQuadruple ds)
    (hbelow : value ds < (2 / 11 : ℝ)) : ds.Perm [1,2,3,4,5] := by
  have hfifth : value ds < (1 / 5 : ℝ) := by linarith
  obtain ⟨d, hd, hsub | hsub⟩ := hcrit
  · obtain ⟨s, hs, hp⟩ := critical_parameters_of_low
      (base := [1,2,3,4]) (by decide) rfl (by norm_num)
      hlen hpos hprim d hd hsub hfifth
    simp only [List.cons_append, List.nil_append] at hp
    have hs1 := first_family_low_parameter s hs
      (by rw [← value_perm hp]; exact hbelow)
    simpa only [hs1, mul_one] using hp
  · obtain ⟨s, hs, hp⟩ := critical_parameters_of_low
      (base := [1,3,4,7]) (by decide) rfl (by norm_num)
      hlen hpos hprim d hd hsub hfifth
    simp only [List.cons_append, List.nil_append] at hp
    have hge := second_family_ge_two_elevenths s hs
    rw [← value_perm hp] at hge
    linarith

theorem sporadic_low_tuple (ds : List ℕ) (hmem : ds ∈ sporadicTuples)
    (hbelow : value ds < (2 / 11 : ℝ)) : ds = [1,3,4,5,9] := by
  simp only [sporadicTuples, List.mem_cons, List.not_mem_nil, or_false] at hmem
  rcases hmem with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · norm_num [v1_2_3_5_8_value] at hbelow
  · rfl
  · norm_num [v1_3_4_5_11_value] at hbelow
  · norm_num [v1_3_4_5_18_value] at hbelow
  · norm_num [v1_3_4_5_27_value] at hbelow
  · norm_num [v1_4_5_6_7_value] at hbelow
  · norm_num [v1_4_5_6_27_value] at hbelow
  · norm_num [v1_7_8_9_15_value] at hbelow
  · norm_num [v2_3_5_8_19_value] at hbelow
  · norm_num [v2_5_7_8_9_value] at hbelow
  · norm_num [v3_5_8_9_13_value] at hbelow
  · norm_num [v3_5_8_11_13_value] at hbelow

theorem fiveSpeedGap_of_sporadicExhaustion (hexhaustion : SporadicExhaustion) :
    FiveSpeedGap := by
  intro ds hlen hdistinct hpositive hbelow
  have hne : ds ≠ [] := by intro hz; simp [hz] at hlen
  let ns := Normalization.normalize ds
  have hnlen : ns.length = 5 := by simpa [ns] using hlen
  have hnpositive : ∀ a ∈ ns, 0 < a := Normalization.normalize_positive ds hpositive
  have hnprimitive : ns.foldr Nat.gcd 0 = 1 :=
    Normalization.normalize_primitive ds hne hpositive
  have hnvalue : value ns = value ds := Normalization.value_normalize ds hne hpositive
  have hnbelow : value ns < (2 / 11 : ℝ) := by rw [hnvalue]; exact hbelow
  have hnormalized : ns.Perm [1,2,3,4,5] ∨ ns.Perm [1,3,4,5,9] := by
    by_cases hcrit : ContainsCriticalQuadruple ns
    · exact Or.inl (primitive_critical_low_tuple ns hnlen hnpositive hnprimitive hcrit hnbelow)
    · let ss := ns.mergeSort (· ≤ ·)
      have hp : ss.Perm ns := List.mergeSort_perm _ _
      have hsvalue : value ss = value ns := value_perm hp
      have hsbelow : value ss < (2 / 11 : ℝ) := by rw [hsvalue]; exact hnbelow
      have hmem : ss ∈ sporadicTuples := by
        apply hexhaustion ss
        · exact hp.length_eq.trans hnlen
        · exact hp.nodup_iff.mpr (Normalization.normalize_nodup hdistinct)
        · exact fun a ha => hnpositive a (hp.mem_iff.mp ha)
        · change Normalization.gcd ss = 1
          rw [Modular.list_gcd_eq_of_perm hp]
          exact hnprimitive
        · exact List.pairwise_mergeSort' (· ≤ ·) ns
        · intro hcritical
          exact hcrit (containsCriticalQuadruple_of_subset
            (fun a ha => hp.mem_iff.mp ha) hcritical)
        · linarith
      have heq := sporadic_low_tuple ss hmem hsbelow
      exact Or.inr (by simpa only [heq] using hp.symm)
  refine ⟨Normalization.gcd ds, by have hg := Normalization.gcd_pos hne hpositive; omega, ?_⟩
  rcases hnormalized with hp | hp
  · apply Or.inl
    have hmap := hp.map (fun a => Normalization.gcd ds * a)
    simpa only [ns, Normalization.rescale_normalize] using hmap
  · apply Or.inr
    have hmap := hp.map (fun a => Normalization.gcd ds * a)
    simpa only [ns, Normalization.rescale_normalize] using hmap

end Loneliness.SixPlane
