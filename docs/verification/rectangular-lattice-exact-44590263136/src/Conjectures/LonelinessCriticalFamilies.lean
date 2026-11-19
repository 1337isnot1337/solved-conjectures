import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessCriticalSecond
import Mathlib.Data.List.Nodup

/-! Classification of both critical families of primitive five-speed lists.
Every such list either has loneliness at least one fifth, or has exactly
`s/(5*s+1)` for a positive integer `s`. No external classification result is
assumed. -/

namespace Loneliness.CriticalFamilies

def SpectrumForm (ds : List ℕ) : Prop :=
  ∃ s : ℕ, 1 ≤ s ∧ value ds = (s : ℝ) / (5 * (s : ℝ) + 1)

def ContainsCriticalQuadruple (ds : List ℕ) : Prop :=
  ∃ d : ℕ, 0 < d ∧
    (([1, 2, 3, 4].map (fun m => d * m)) ⊆ ds ∨
      ([1, 3, 4, 7].map (fun m => d * m)) ⊆ ds)

theorem append_classification (base : List ℕ)
    (hbase : ∀ m ∈ base, m % 5 ≠ 0)
    (hspec : ∀ s : ℕ, 1 ≤ s → SpectrumForm (base ++ [5 * s]))
    (a d : ℕ) (ha : 0 < a) (hd : 0 < d) (hcop : Nat.Coprime a d) :
    (1 / 5 : ℝ) ≤ value ((base.map (fun m => d * m)) ++ [a]) ∨
      SpectrumForm ((base.map (fun m => d * m)) ++ [a]) := by
  by_cases hd₁ : d = 1
  · subst d
    have hmap : base.map (fun m => 1 * m) = base := by simp
    rw [hmap]
    by_cases hres : a % 5 = 0
    · have haseq : a = 5 * (a / 5) := by omega
      have has : 1 ≤ a / 5 := by omega
      rw [haseq]
      exact Or.inr (hspec (a / 5) has)
    · apply Or.inl
      apply fifth_of_all_nonzero_residues
      intro m hm
      rcases List.mem_append.mp hm with hm | hm
      · exact hbase m hm
      · have hma : m = a := List.mem_singleton.mp hm
        simpa [hma] using hres
  · exact Or.inl (fifth_of_dilation base hbase a d (by omega) hcop)

theorem classification_of_base {base ds : List ℕ}
    (hbase : base.Nodup) (hbase_len : base.length = 4)
    (hres : ∀ m ∈ base, m % 5 ≠ 0)
    (hspec : ∀ s : ℕ, 1 ≤ s → SpectrumForm (base ++ [5 * s]))
    (hlen : ds.length = 5) (hpos : ∀ m ∈ ds, 0 < m)
    (hprim : ds.foldr Nat.gcd 0 = 1)
    (d : ℕ) (hd : 0 < d) (hsub : (base.map (fun m => d * m)) ⊆ ds) :
    (1 / 5 : ℝ) ≤ value ds ∨ SpectrumForm ds := by
  have hscaled : (base.map (fun m => d * m)).Nodup :=
    List.Nodup.map (mul_right_injective₀ (ne_of_gt hd)) hbase
  obtain ⟨a, hperm⟩ := subset_four_completion hscaled (by simpa using hbase_len) hlen hsub
  have ha : 0 < a := hpos a (hperm.mem_iff.mpr (by simp))
  have hcop : Nat.Coprime a d := primitive_coprime hperm hprim
  have hv := value_perm hperm
  simp only [SpectrumForm, hv]
  exact append_classification base hres hspec a d ha hd hcop

theorem critical_family_classification {ds : List ℕ}
    (hlen : ds.length = 5) (hpos : ∀ m ∈ ds, 0 < m)
    (hprim : ds.foldr Nat.gcd 0 = 1) (hcrit : ContainsCriticalQuadruple ds) :
    (1 / 5 : ℝ) ≤ value ds ∨ SpectrumForm ds := by
  obtain ⟨d, hd, hsub | hsub⟩ := hcrit
  · apply classification_of_base (base := [1, 2, 3, 4])
      (by decide) (by rfl) ?_ ?_ hlen hpos hprim d hd hsub
    · norm_num
    · intro s hs
      exact ⟨s, hs, five_family_value s hs⟩
  · apply classification_of_base (base := [1, 3, 4, 7])
      (by decide) (by rfl) ?_ ?_ hlen hpos hprim d hd hsub
    · norm_num
    · intro s hs
      exact second_family_spectrum s hs

theorem critical_family_below_threshold {ds : List ℕ}
    (hlen : ds.length = 5) (hpos : ∀ m ∈ ds, 0 < m)
    (hprim : ds.foldr Nat.gcd 0 = 1) (hcrit : ContainsCriticalQuadruple ds)
    (hbelow : value ds < 1 / 5) :
    ∃ s : ℕ, 1 ≤ s ∧ value ds = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  rcases critical_family_classification hlen hpos hprim hcrit with hge | hspec
  · exact False.elim (not_lt_of_ge hge hbelow)
  · exact hspec

end Loneliness.CriticalFamilies
