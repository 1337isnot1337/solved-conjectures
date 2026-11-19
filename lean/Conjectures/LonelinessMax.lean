import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Order.Lattice
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity

/-!
The exact finite search domain for loneliness maxima.

The proof uses the intersection of the phase intervals at a maximizing
height. If their left and right endpoints differ, an interior point makes
every distance strictly larger. Hence two endpoints coincide, and their
two positive speeds have an integral pair-sum phase.
-/

noncomputable section
namespace Loneliness.PairSum

def distance (x : ℝ) : ℝ := min (Int.fract x) (1 - Int.fract x)

theorem distance_eq_norm (x : ℝ) : distance x = ‖(x : UnitAddCircle)‖ := by
  rw [UnitAddCircle.norm_eq, abs_sub_round_eq_min]
  rfl

theorem distance_nonneg (x : ℝ) : 0 ≤ distance x := by
  exact le_min (Int.fract_nonneg x) (by linarith [Int.fract_lt_one x])

theorem distance_le_half (x : ℝ) : distance x ≤ 1/2 := by
  have ha : distance x ≤ Int.fract x := min_le_left _ _
  have hb : distance x ≤ 1-Int.fract x := min_le_right _ _
  linarith

theorem continuous_distance : Continuous distance := by
  have h : Continuous (fun x : ℝ => ‖(x : UnitAddCircle)‖) :=
    (AddCircle.continuous_mk' (1 : ℝ)).norm
  simpa only [← distance_eq_norm] using h

def score (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) : ℝ :=
  D.inf' hD (fun d => distance ((d : ℝ)*t))

theorem score_le (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) {d : ℕ} (hd : d ∈ D) :
    score D hD t ≤ distance ((d : ℝ)*t) := Finset.inf'_le _ hd

theorem score_nonneg (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) : 0 ≤ score D hD t := by
  exact Finset.le_inf' hD _ (fun _ _ => distance_nonneg _)

theorem score_le_half (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) :
    score D hD t ≤ 1/2 := by
  obtain ⟨d, hd⟩ := hD
  exact (score_le D ⟨d, hd⟩ t hd).trans (distance_le_half _)

theorem continuous_score (D : Finset ℕ) (hD : D.Nonempty) : Continuous (score D hD) := by
  apply Continuous.finset_inf'_apply hD
  intro d _
  exact continuous_distance.comp (continuous_const.mul continuous_id)

theorem distance_add_int (x : ℝ) (k : ℤ) : distance (x+k) = distance x := by
  simp only [distance, Int.fract_add_intCast]

theorem score_fract (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) :
    score D hD (Int.fract t) = score D hD t := by
  apply congrArg (D.inf' hD)
  funext d
  have he : (d : ℝ)*t = (d : ℝ)*Int.fract t + ((d : ℤ)*⌊t⌋ : ℤ) := by
    simp only [Int.fract, Int.cast_mul, Int.cast_natCast]
    ring
  rw [he, distance_add_int]

theorem exists_maximizer (D : Finset ℕ) (hD : D.Nonempty) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1, ∀ u : ℝ, score D hD u ≤ score D hD t := by
  obtain ⟨t, ht, hmax⟩ := isCompact_Icc.exists_isMaxOn
    (show (Set.Icc (0 : ℝ) 1).Nonempty from ⟨0, by norm_num⟩)
    (continuous_score D hD).continuousOn
  refine ⟨t, ht, ?_⟩
  intro u
  rw [← score_fract D hD u]
  exact hmax ⟨Int.fract_nonneg u, (Int.fract_lt_one u).le⟩

theorem phase_bounds (D : Finset ℕ) (hD : D.Nonempty) (t : ℝ) {d : ℕ} (hd : d ∈ D) :
    (⌊(d : ℝ)*t⌋ : ℝ) + score D hD t ≤ (d : ℝ)*t ∧
      (d : ℝ)*t ≤ (⌊(d : ℝ)*t⌋ : ℝ) + 1 - score D hD t := by
  have h := score_le D hD t hd
  change score D hD t ≤ min _ _ at h
  obtain ⟨ha, hb⟩ := le_min_iff.mp h
  simp only [Int.fract] at ha hb
  constructor <;> linarith

theorem distance_gt_of_phase_interval (x h : ℝ) (k : ℤ) (hh : 0 ≤ h)
    (hl : (k : ℝ)+h < x) (hu : x < (k : ℝ)+1-h) : h < distance x := by
  have hk : ⌊x⌋ = k := Int.floor_eq_iff.mpr ⟨by linarith, by linarith⟩
  simp only [distance, Int.fract, hk, lt_min_iff]
  constructor <;> linarith

/-- The completeness fact used by the exact pair-sum searches. -/
theorem maximizer_pair_sum (D : Finset ℕ) (hD : D.Nonempty)
    (hcard : 1 < D.card) (hpos : ∀ d ∈ D, 0 < d) (t : ℝ)
    (hmax : ∀ u : ℝ, score D hD u ≤ score D hD t) :
    ∃ a ∈ D, ∃ b ∈ D, a ≠ b ∧ ∃ k : ℤ, ((a : ℝ)+b)*t = k := by
  classical
  let h := score D hD t
  let k : ℕ → ℤ := fun d => ⌊(d : ℝ)*t⌋
  have hh : 0 ≤ h := score_nonneg D hD t
  have hhhalf : h ≤ 1/2 := score_le_half D hD t
  have hphase : ∀ d ∈ D, (k d : ℝ)+h ≤ (d : ℝ)*t ∧
      (d : ℝ)*t ≤ (k d : ℝ)+1-h := fun d hd => phase_bounds D hD t hd
  by_cases heq : h = 1/2
  · obtain ⟨a, ha, b, hb, hab⟩ := Finset.one_lt_card.mp hcard
    refine ⟨a, ha, b, hb, hab, k a+k b+1, ?_⟩
    have ha' := hphase a ha
    have hb' := hphase b hb
    push_cast
    nlinarith [ha'.1, ha'.2, hb'.1, hb'.2]
  · let lo : ℕ → ℝ := fun d => ((k d : ℝ)+h)/(d : ℝ)
    let hi : ℕ → ℝ := fun d => ((k d : ℝ)+1-h)/(d : ℝ)
    let L := D.sup' hD lo
    let R := D.inf' hD hi
    have hdpos : ∀ d ∈ D, (0 : ℝ) < d := by
      intro d hd
      exact_mod_cast hpos d hd
    have hLt : L ≤ t := by
      apply Finset.sup'_le hD lo
      intro d hd
      exact (div_le_iff₀ (hdpos d hd)).mpr (by simpa [mul_comm] using (hphase d hd).1)
    have htR : t ≤ R := by
      apply Finset.le_inf' hD hi
      intro d hd
      exact (le_div_iff₀ (hdpos d hd)).mpr (by simpa [mul_comm] using (hphase d hd).2)
    have hLR : L = R := by
      by_contra hne
      have hlt : L < R := lt_of_le_of_ne (hLt.trans htR) hne
      let u := (L+R)/2
      have hlu : L < u := by dsimp [u]; linarith
      have hur : u < R := by dsimp [u]; linarith
      have himprove : h < score D hD u := by
        apply (Finset.lt_inf'_iff hD).mpr
        intro d hd
        have hl : lo d < u := lt_of_le_of_lt (Finset.le_sup' lo hd) hlu
        have hu : u < hi d := lt_of_lt_of_le hur (Finset.inf'_le hi hd)
        have hl' := (div_lt_iff₀ (hdpos d hd)).mp hl
        have hu' := (lt_div_iff₀ (hdpos d hd)).mp hu
        apply distance_gt_of_phase_interval _ _ (k d) hh
        · simpa [mul_comm] using hl'
        · simpa [mul_comm] using hu'
      exact (not_lt_of_ge (hmax u)) himprove
    obtain ⟨a, ha, hLa⟩ := Finset.exists_mem_eq_sup' hD lo
    obtain ⟨b, hb, hRb⟩ := Finset.exists_mem_eq_inf' hD hi
    have hlt : h < 1/2 := lt_of_le_of_ne hhhalf heq
    have hLa' : lo a = t := by dsimp [L] at hLt hLR; linarith
    have hRb' : hi b = t := by dsimp [R] at htR hLR; linarith
    have hea : (k a : ℝ)+h = (a : ℝ)*t := by
      have he := (div_eq_iff (ne_of_gt (hdpos a ha))).mp hLa'
      simpa [mul_comm] using he
    have heb : (k b : ℝ)+1-h = (b : ℝ)*t := by
      have he := (div_eq_iff (ne_of_gt (hdpos b hb))).mp hRb'
      simpa [mul_comm] using he
    have hab : a ≠ b := by
      intro hab
      subst b
      linarith
    refine ⟨a, ha, b, hb, hab, k a+k b+1, ?_⟩
    push_cast
    nlinarith

/-- A finite set of rational times suffices for the exact global maximum. -/
theorem exists_pair_sum_maximum (D : Finset ℕ) (hD : D.Nonempty)
    (hcard : 1 < D.card) (hpos : ∀ d ∈ D, 0 < d) :
    ∃ a ∈ D, ∃ b ∈ D, a ≠ b ∧ ∃ k : ℕ, k ≤ a+b ∧
      ∀ u : ℝ, score D hD u ≤ score D hD ((k : ℝ)/(a+b : ℕ)) := by
  obtain ⟨t, ht, hmax⟩ := exists_maximizer D hD
  obtain ⟨a, ha, b, hb, hab, k, hk⟩ := maximizer_pair_sum D hD hcard hpos t hmax
  have habpos : (0 : ℝ) < (a : ℝ)+b := by
    have ha' : (0 : ℝ) < a := by exact_mod_cast hpos a ha
    positivity
  have hk0 : (0 : ℝ) ≤ k := by nlinarith [ht.1]
  have hkup : (k : ℝ) ≤ (a : ℝ)+b := by nlinarith [ht.2]
  have hk0' : 0 ≤ k := by exact_mod_cast hk0
  have hkcast : (k.toNat : ℝ) = k := by
    exact_mod_cast Int.toNat_of_nonneg hk0'
  refine ⟨a, ha, b, hb, hab, k.toNat, ?_, ?_⟩
  · have : (k.toNat : ℝ) ≤ ((a+b : ℕ) : ℝ) := by simpa [hkcast] using hkup
    exact_mod_cast this
  · have he : (k.toNat : ℝ)/(a+b : ℕ) = t := by
      apply (div_eq_iff (by exact_mod_cast (ne_of_gt (show 0 < a+b by omega)))).mpr
      rw [hkcast, ← hk]
      push_cast
      ring
    simpa only [he] using hmax

end Loneliness.PairSum
