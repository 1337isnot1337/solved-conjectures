import Conjectures.LonelinessRational
import Conjectures.NonmixedGapPeriodic

/-! The character lower bound for any nonempty finite list of integer
differences. Every rational-time clearance is attained by an actual periodic
avoiding set, with the original denominator as a period. -/

namespace Loneliness.Packing

def Avoids (ds : List ℕ) (A : Set ℤ) : Prop :=
  ∀ d ∈ ds, ∀ t ∈ A, t + (d : ℤ) ∉ A

noncomputable def density (ds : List ℕ) : ℝ :=
  sSup {x : ℝ | ∃ A : Set ℤ, Avoids ds A ∧ NonmixedGap.upperDensity A = x}

theorem avoids_empty (ds : List ℕ) : Avoids ds ∅ := by
  intro d hd t ht
  exact False.elim ht

theorem upperDensity_le_one (A : Set ℤ) : NonmixedGap.upperDensity A ≤ 1 := by
  apply NonmixedGap.uniform_count_upper A 1 0
  intro u v huv
  have h := NonmixedGap.count_le_length A huv
  simp only [one_mul, add_zero]
  exact_mod_cast h

theorem density_range_nonempty (ds : List ℕ) :
    {x : ℝ | ∃ A : Set ℤ, Avoids ds A ∧ NonmixedGap.upperDensity A = x}.Nonempty := by
  exact ⟨NonmixedGap.upperDensity ∅, ∅, avoids_empty ds, rfl⟩

theorem density_range_bddAbove (ds : List ℕ) :
    BddAbove {x : ℝ | ∃ A : Set ℤ, Avoids ds A ∧ NonmixedGap.upperDensity A = x} := by
  refine ⟨1, ?_⟩
  rintro x ⟨A, _, rfl⟩
  exact upperDensity_le_one A

theorem upperDensity_le_density {ds : List ℕ} {A : Set ℤ} (hA : Avoids ds A) :
    NonmixedGap.upperDensity A ≤ density ds :=
  le_csSup (density_range_bddAbove ds) ⟨A, hA, rfl⟩

theorem density_le {ds : List ℕ} {r : ℝ}
    (h : ∀ A : Set ℤ, Avoids ds A → NonmixedGap.upperDensity A ≤ r) :
    density ds ≤ r := by
  apply csSup_le (density_range_nonempty ds)
  rintro x ⟨A, hA, rfl⟩
  exact h A hA

theorem rational_packing_fraction (ds : List ℕ) (hne : ds ≠ []) (P p : ℤ)
    (hP : 0 < P) :
    ∃ A : Set ℤ, NonmixedGap.IsPeriodic A P ∧ Avoids ds A ∧
      NonmixedGap.upperDensity A = clearance ds ((p : ℝ) / P) := by
  have hPR : (0 : ℝ) < P := by exact_mod_cast hP
  have hdistance : ∀ d : ℕ, distance ((d : ℝ) * ((p : ℝ) / P)) =
      ((min ((p * (d : ℤ)) % P) (P - (p * (d : ℤ)) % P) : ℤ) : ℝ) / P := by
    intro d
    have he : (d : ℝ) * ((p : ℝ) / P) = ((p * (d : ℤ) : ℤ) : ℝ) / P := by
      push_cast
      ring
    rw [he, distance_int_div _ _ hP]
  obtain ⟨d, hd, heq⟩ := clearance_eq_member hne ((p : ℝ) / P)
  let H : ℤ := min ((p * (d : ℤ)) % P) (P - (p * (d : ℤ)) % P)
  have hratio : clearance ds ((p : ℝ) / P) = (H : ℝ) / P := by
    rw [heq, hdistance]
  have hr0 := Int.emod_nonneg (p * (d : ℤ)) (ne_of_gt hP)
  have hrP := Int.emod_lt_of_pos (p * (d : ℤ)) hP
  have hH : 0 ≤ H := le_min hr0 (by omega)
  have hHP : H ≤ P := by
    have hh : H ≤ (p * (d : ℤ)) % P := min_le_left _ _
    omega
  refine ⟨NonmixedGap.modularWindow P p H, NonmixedGap.window_periodic P p H, ?_, ?_⟩
  · intro e he t ht
    have hc := clearance_le_of_mem he ((p : ℝ) / P)
    rw [hratio, hdistance] at hc
    have hmin : H ≤ min ((p * (e : ℤ)) % P) (P - (p * (e : ℤ)) % P) := by
      exact_mod_cast (div_le_div_iff_of_pos_right hPR).mp hc
    have hlow := hmin.trans (min_le_left _ _)
    have hhigh : (p * (e : ℤ)) % P ≤ P - H := by
      have hh := hmin.trans (min_le_right _ _)
      omega
    exact NonmixedGap.window_avoids_step hP hlow hhigh ht
  · rw [NonmixedGap.window_upperDensity_of_gcd_dvd hP hH hHP
      (NonmixedGap.gcd_dvd_distance_numerator P p d), hratio]

theorem rational_packing (ds : List ℕ) (hne : ds ≠ []) (q : ℚ) :
    ∃ (A : Set ℤ) (P : ℤ), 0 < P ∧ NonmixedGap.IsPeriodic A P ∧
      Avoids ds A ∧ NonmixedGap.upperDensity A = clearance ds (q : ℝ) := by
  have hP : (0 : ℤ) < q.den := by exact_mod_cast q.den_pos
  obtain ⟨A, hp, ha, hv⟩ := rational_packing_fraction ds hne q.den q.num hP
  refine ⟨A, q.den, hP, hp, ha, ?_⟩
  simpa only [Rat.cast_def, Int.cast_natCast] using hv

theorem value_le_density (ds : List ℕ) (hne : ds ≠ []) : value ds ≤ density ds := by
  apply value_le_of_rat
  intro q
  obtain ⟨A, P, _, _, hA, hval⟩ := rational_packing ds hne q
  rw [←hval]
  exact upperDensity_le_density hA

theorem avoids_translate {ds : List ℕ} {A : Set ℤ} (hA : Avoids ds A) (u : ℤ) :
    Avoids ds {t : ℤ | u + t ∈ A} := by
  intro d hd t ht htd
  apply hA d hd (u + t) ht
  change u + (t + (d : ℤ)) ∈ A at htd
  simpa only [add_assoc] using htd

end Loneliness.Packing
