import Conjectures.LonelinessModularRationalWitness
import Mathlib.Data.Nat.Prime.Basic

/-! Strict rational-grid witnesses and their real-time soundness. A weak
grid witness becomes strict when denominator divisibility excludes equality. -/

namespace Loneliness.Modular

def StrictRationalWitness (num den m t : ℕ) (ds : List ℕ) : Prop :=
  ∀ d ∈ ds, num*m < den*folded m (t*d)

instance (num den m t : ℕ) (ds : List ℕ) :
    Decidable (StrictRationalWitness num den m t ds) :=
  inferInstanceAs (Decidable (∀ d ∈ ds, num*m < den*folded m (t*d)))

def HasStrictRationalWitness (num den m : ℕ) (ds : List ℕ) : Prop :=
  ∃ t, StrictRationalWitness num den m t ds

theorem clearance_strict_lower (ds : List ℕ) (r t : ℝ)
    (hhalf : r < 1/2) (hcoords : ∀ d ∈ ds, r < distance ((d : ℝ)*t)) :
    r < clearance ds t := by
  revert hcoords
  induction ds with
  | nil =>
    intro _hcoords
    exact hhalf
  | cons d ds ih =>
    intro hcoords
    apply lt_min
    · exact hcoords d (by simp)
    · apply ih
      intro a ha
      exact hcoords a (by simp [ha])

theorem strictRationalWitness_clearance_lower {num den m t : ℕ} {ds : List ℕ}
    (hden : 0 < den) (hhalf : 2*num < den) (hm : 0 < m)
    (hw : StrictRationalWitness num den m t ds) :
    (num : ℝ)/den < clearance ds ((t : ℝ)/m) := by
  have hdR : (0 : ℝ) < den := by exact_mod_cast hden
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  apply clearance_strict_lower
  · apply (div_lt_div_iff₀ hdR (by norm_num : (0 : ℝ) < 2)).mpr
    have hh : (2 : ℝ)*(num : ℝ) < (den : ℝ) := by exact_mod_cast hhalf
    nlinarith
  · intro d hd
    have hR : (num : ℝ)*m < (den : ℝ)*folded m (t*d) := by
      exact_mod_cast hw d hd
    have he : (d : ℝ)*((t : ℝ)/m) = ((t*d : ℕ) : ℝ)/m := by
      push_cast
      ring
    rw [he, distance_nat_div _ _ hm]
    apply (div_lt_div_iff₀ hdR hmR).mpr
    simpa only [mul_comm] using hR

theorem strictRationalWitness_value_lower {num den m t : ℕ} {ds : List ℕ}
    (hden : 0 < den) (hhalf : 2*num < den) (hm : 0 < m)
    (hw : StrictRationalWitness num den m t ds) : (num : ℝ)/den < value ds :=
  (strictRationalWitness_clearance_lower hden hhalf hm hw).trans_le
    (CriticalFamilies.le_value_any ds ((t : ℝ)/m))

theorem hasStrictRationalWitness_value_lower {num den m : ℕ} {ds : List ℕ}
    (hden : 0 < den) (hhalf : 2*num < den) (hm : 0 < m)
    (hw : HasStrictRationalWitness num den m ds) : (num : ℝ)/den < value ds := by
  obtain ⟨t, ht⟩ := hw
  exact strictRationalWitness_value_lower hden hhalf hm ht

/-- A weak grid witness is strict when the threshold cannot be attained on
that grid. The fraction need not be reduced. -/
theorem rationalWitness_strict_of_nondvd {num den m t : ℕ} {ds : List ℕ}
    (hgrid : ¬ den ∣ num*m) (hw : RationalWitness num den m t ds) :
    StrictRationalWitness num den m t ds := by
  intro d hd
  have hle := hw d hd
  have hne : num*m ≠ den*folded m (t*d) := by
    intro he
    apply hgrid
    rw [he]
    exact dvd_mul_right den (folded m (t*d))
  omega

theorem hasRationalWitness_strict_of_nondvd {num den m : ℕ} {ds : List ℕ}
    (hgrid : ¬ den ∣ num*m) (hw : HasRationalWitness num den m ds) :
    HasStrictRationalWitness num den m ds := by
  obtain ⟨t, ht⟩ := hw
  exact ⟨t, rationalWitness_strict_of_nondvd hgrid ht⟩

theorem rationalWitness_value_strict_of_nondvd {num den m t : ℕ} {ds : List ℕ}
    (hden : 0 < den) (hhalf : 2*num < den) (hm : 0 < m)
    (hgrid : ¬ den ∣ num*m) (hw : RationalWitness num den m t ds) :
    (num : ℝ)/den < value ds :=
  strictRationalWitness_value_lower hden hhalf hm
    (rationalWitness_strict_of_nondvd hgrid hw)

theorem hasRationalWitness_value_strict_of_nondvd {num den m : ℕ} {ds : List ℕ}
    (hden : 0 < den) (hhalf : 2*num < den) (hm : 0 < m)
    (hgrid : ¬ den ∣ num*m) (hw : HasRationalWitness num den m ds) :
    (num : ℝ)/den < value ds :=
  hasStrictRationalWitness_value_lower hden hhalf hm
    (hasRationalWitness_strict_of_nondvd hgrid hw)

theorem prime_nondvd_binary_grid {num den m : ℕ}
    (hprime : den.Prime) (htwo : ¬ den ∣ 2) (hbase : ¬ den ∣ num*m) (j : ℕ) :
    ¬ den ∣ num*(2^j*m) := by
  have hpower : ¬ den ∣ 2^j := fun h => htwo (hprime.dvd_of_dvd_pow h)
  have he : num*(2^j*m) = 2^j*(num*m) := by ring
  rw [he]
  exact hprime.not_dvd_mul hpower hbase

theorem eleven_nondvd_binary_grid {m : ℕ} (hbase : ¬ 11 ∣ m) (j : ℕ) :
    ¬ 11 ∣ 2^j*m := by
  have h := prime_nondvd_binary_grid (num := 1) (den := 11)
    (by decide) (by decide) (by simpa using hbase) j
  simpa using h

/-- An odd prime factor of a composite denominator gives the same upgrade
through all binary levels. -/
theorem prime_factor_nondvd_binary_grid {q num den m : ℕ}
    (hprime : q.Prime) (hfactor : q ∣ den) (htwo : ¬ q ∣ 2)
    (hbase : ¬ q ∣ num*m) (j : ℕ) : ¬ den ∣ num*(2^j*m) := by
  intro h
  exact prime_nondvd_binary_grid hprime htwo hbase j (hfactor.trans h)

theorem strictRationalWitness_mod_speeds (num den m t : ℕ) (ds : List ℕ) :
    StrictRationalWitness num den m t (ds.map (·%m)) ↔
      StrictRationalWitness num den m t ds := by
  have he (d : ℕ) : folded m (t*(d%m)) = folded m (t*d) :=
    folded_eq_of_mod_eq (by simp [Nat.mul_mod])
  simp only [StrictRationalWitness, List.forall_mem_map, he]

theorem strictRationalWitness_folded_speeds
    (num den m t : ℕ) (ds : List ℕ) (hm : 0 < m) :
    StrictRationalWitness num den m t (ds.map (folded m)) ↔
      StrictRationalWitness num den m t ds := by
  simp only [StrictRationalWitness, List.forall_mem_map, folded_mul_folded m _ t hm]

theorem strictRationalWitness_perm {num den m t : ℕ} {ds es : List ℕ}
    (h : ds.Perm es) :
    StrictRationalWitness num den m t ds ↔ StrictRationalWitness num den m t es := by
  constructor
  · intro hw d hd
    exact hw d (h.mem_iff.mpr hd)
  · intro hw d hd
    exact hw d (h.mem_iff.mp hd)

theorem hasStrictRationalWitness_unit {num den m u v : ℕ}
    (h : (u*v)%m = 1%m) (ds : List ℕ) :
    HasStrictRationalWitness num den m (ds.map (u*·)) ↔
      HasStrictRationalWitness num den m ds := by
  constructor
  · rintro ⟨t, ht⟩
    refine ⟨t*u, ?_⟩
    intro d hd
    simpa only [Nat.mul_assoc] using ht (u*d) (List.mem_map.mpr ⟨d, hd, rfl⟩)
  · rintro ⟨t, ht⟩
    refine ⟨t*v, ?_⟩
    intro d hd
    obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hd
    have he : (t*v)*(u*a) = v*(u*(t*a)) := by ring
    rw [he, folded_unit_cancel h]
    exact ht a ha

theorem hasStrictRationalWitness_folded_unit {num den m u v : ℕ} (hm : 0 < m)
    (h : (u*v)%m = 1%m) (ds : List ℕ) :
    HasStrictRationalWitness num den m (ds.map (fun d => folded m (u*d))) ↔
      HasStrictRationalWitness num den m ds := by
  have hh : ds.map (fun d => folded m (u*d)) = (ds.map (u*·)).map (folded m) := by
    simp only [List.map_map, Function.comp_def]
  rw [hh]
  exact (exists_congr (fun t =>
    strictRationalWitness_folded_speeds num den m t _ hm)).trans
    (hasStrictRationalWitness_unit h ds)

theorem strictRationalWitness_of_mem_equiv {num den m t : ℕ} {ds es : List ℕ}
    (h : ∀ d, d∈ds ↔ d∈es) :
    StrictRationalWitness num den m t ds ↔ StrictRationalWitness num den m t es := by
  constructor
  · intro hw d hd
    exact hw d ((h d).mpr hd)
  · intro hw d hd
    exact hw d ((h d).mp hd)

end Loneliness.Modular
