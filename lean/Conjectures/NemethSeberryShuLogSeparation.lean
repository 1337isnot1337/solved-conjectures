import Conjectures.NemethSeberryShuCounting
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Tactic

namespace NemethSeberryShu

/-- The logarithmic determinant correction for the two exceptional modes. -/
noncomputable def logModeCorrection (x : ℝ) := -Real.log (1 - x) - x

theorem logModeCorrection_strictMono :
    StrictMonoOn logModeCorrection (Set.Ioo (0 : ℝ) 1) := by
  apply strictMonoOn_of_deriv_pos (convex_Ioo 0 1)
  · intro x hx
    have h : 1 - x ≠ 0 := ne_of_gt (sub_pos.mpr hx.2)
    exact (((continuousAt_const.sub continuousAt_id).log h).neg.sub
      continuousAt_id).continuousWithinAt
  · intro x hx
    have hx' : x ∈ Set.Ioo (0 : ℝ) 1 := interior_subset hx
    have hpos : 0 < 1 - x := sub_pos.mpr hx'.2
    have hD : HasDerivAt logModeCorrection ((1 - x)⁻¹ - 1) x := by
      convert (((((hasDerivAt_const x (1 : ℝ)).sub (hasDerivAt_id x)).log
          hpos.ne').neg).sub (hasDerivAt_id x)) using 1
      · rfl
      · simp only [Pi.sub_apply, id_eq, zero_sub, neg_div, neg_neg, one_div]
    rw [hD.deriv]
    have hi : 1 < (1 - x)⁻¹ := (one_lt_inv₀ hpos).mpr (by linarith [hx'.1])
    linarith

/-- The real-valued limit profile in §2 of the written disproof. -/
noncomputable def permanentLogProfile (density amplitude : ℝ) :=
    (density⁻¹ - 1) / 2 + logModeCorrection ((amplitude / density) ^ 2)

private theorem mode_mem_interval {density amplitude : ℝ}
    (hρ : density ∈ Set.Icc (1 / 3 : ℝ) (2 / 3))
    (ha : amplitude ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) :
    (amplitude / density) ^ 2 ∈ Set.Ioo (0 : ℝ) 1 := by
  have hd : 0 < density := lt_of_lt_of_le (by norm_num) hρ.1
  have hapos : 0 < amplitude := lt_of_lt_of_le (by norm_num) ha.1
  have hq : 0 < amplitude / density := div_pos hapos hd
  have hlt : amplitude / density < 1 :=
    (div_lt_one₀ hd).2 ((ha.2.trans_lt (by norm_num)).trans_le hρ.1)
  exact ⟨by positivity, by nlinarith [mul_pos hq (sub_pos.mpr hlt)]⟩

theorem permanentLogProfile_strictMono {density : ℝ}
    (hρ : density ∈ Set.Icc (1 / 3 : ℝ) (2 / 3)) :
    StrictMonoOn (permanentLogProfile density) (Set.Icc (1 / 24 : ℝ) (1 / 12)) := by
  intro a ha b hb hab
  have hd : 0 < density := lt_of_lt_of_le (by norm_num) hρ.1
  have hap : 0 < a / density := div_pos (lt_of_lt_of_le (by norm_num) ha.1) hd
  have hbp : 0 < b / density := div_pos (lt_of_lt_of_le (by norm_num) hb.1) hd
  have hq : a / density < b / density := (div_lt_div_iff_of_pos_right hd).2 hab
  have hs : (a / density) ^ 2 < (b / density) ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr hq) (add_pos hbp hap)]
  exact add_lt_add_right
    (logModeCorrection_strictMono (mode_mem_interval hρ ha) (mode_mem_interval hρ hb) hs) _

theorem permanentLogProfile_continuousOn {amplitude : ℝ}
    (ha : amplitude ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) :
    ContinuousOn (fun density => permanentLogProfile density amplitude)
      (Set.Icc (1 / 3 : ℝ) (2 / 3)) := by
  intro density hdensity
  have hd : 0 < density := lt_of_lt_of_le (by norm_num) hdensity.1
  have hlt := (mode_mem_interval hdensity ha).2
  have hq : ContinuousAt (fun r : ℝ => (amplitude / r) ^ 2) density :=
    (continuousAt_const.div continuousAt_id hd.ne').pow 2
  have hl := (continuousAt_const.sub hq).log (ne_of_gt (sub_pos.mpr hlt))
  have hbase : ContinuousAt (fun r : ℝ => (r⁻¹ - 1) / 2) density :=
    ((continuousAt_id.inv₀ hd.ne').sub continuousAt_const).div_const 2
  exact (hbase.add (hl.neg.sub hq)).continuousWithinAt

/-- An amplitude pair separates uniformly for every real density in the closed
dense-row interval. This is the compactness step, not a permanent asymptotic. -/
theorem permanentLogProfile_uniform_gap {a b : ℝ}
    (ha : a ∈ Set.Icc (1 / 24 : ℝ) (1 / 12))
    (hb : b ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) (hab : a < b) :
    ∃ ε > 0, ∀ ρ ∈ Set.Icc (1 / 3 : ℝ) (2 / 3),
      ε ≤ permanentLogProfile ρ b - permanentLogProfile ρ a := by
  apply isCompact_Icc.exists_forall_le'
    ((permanentLogProfile_continuousOn hb).sub (permanentLogProfile_continuousOn ha))
  intro ρ hρ
  exact sub_pos.mpr (permanentLogProfile_strictMono hρ ha hb hab)

/-- A common separation constant for all distinct ordered members of a finite
increasing list of amplitudes, uniform over the full density interval. -/
theorem permanentLogProfile_finite_uniform_gap {m : ℕ} (a : Fin m → ℝ)
    (ha : ∀ j, a j ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) (hmono : StrictMono a) :
    ∃ ε > 0, ∀ ρ ∈ Set.Icc (1 / 3 : ℝ) (2 / 3), ∀ i j, i < j →
      ε ≤ permanentLogProfile ρ (a j) - permanentLogProfile ρ (a i) := by
  classical
  have hpair (q : Fin m × Fin m) :
      ∃ ε > 0, ∀ ρ ∈ Set.Icc (1 / 3 : ℝ) (2 / 3), q.1 < q.2 →
        ε ≤ permanentLogProfile ρ (a q.2) - permanentLogProfile ρ (a q.1) := by
    by_cases h : q.1 < q.2
    · obtain ⟨ε, hε, H⟩ := permanentLogProfile_uniform_gap
        (ha q.1) (ha q.2) (hmono h)
      exact ⟨ε, hε, fun ρ hρ _ => H ρ hρ⟩
    · exact ⟨1, by norm_num, fun _ _ h' => (h h').elim⟩
  choose Δ hΔ hbound using hpair
  by_cases h : (Finset.univ : Finset (Fin m × Fin m)).Nonempty
  · refine ⟨Finset.univ.inf' h Δ, ?_, ?_⟩
    · exact (Finset.lt_inf'_iff h).2 (fun q _ => hΔ q)
    · intro ρ hρ i j hij
      exact (Finset.inf'_le Δ (Finset.mem_univ (i, j))).trans
        (hbound (i, j) ρ hρ hij)
  · refine ⟨1, by norm_num, ?_⟩
    intro _ _ i j _
    exact (h ⟨(i, j), Finset.mem_univ _⟩).elim

/-- Tiny uniform profile errors on a finite increasing amplitude set force
strict ordering of the observed real values. -/
theorem strictly_ordered_of_profile_error {m : ℕ} (a : Fin m → ℝ)
    (ha : ∀ j, a j ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) (hmono : StrictMono a) :
    ∃ η > 0, ∀ ρ ∈ Set.Icc (1 / 3 : ℝ) (2 / 3), ∀ y : Fin m → ℝ,
      (∀ j, |y j - permanentLogProfile ρ (a j)| ≤ η) → StrictMono y := by
  obtain ⟨ε, hε, H⟩ := permanentLogProfile_finite_uniform_gap a ha hmono
  refine ⟨ε / 3, by positivity, ?_⟩
  intro ρ hρ y hy i j hij
  have hg := H ρ hρ i j hij
  have hi := (abs_le.mp (hy i)).2
  have hj := (abs_le.mp (hy j)).1
  linarith

/-- A finite increasing family of allowed amplitudes, including the empty case. -/
theorem exists_amplitude_family (m : ℕ) :
    ∃ a : Fin m → ℝ, (∀ j, a j ∈ Set.Icc (1 / 24 : ℝ) (1 / 12)) ∧ StrictMono a := by
  let a (j : Fin m) : ℝ := 1 / 24 + (j.val : ℝ) / (24 * m)
  refine ⟨a, ?_, ?_⟩
  · intro j
    have hm : 0 < (m : ℝ) := by exact_mod_cast (Nat.zero_lt_of_lt j.isLt)
    have hj : (j.val : ℝ) < (m : ℝ) := by exact_mod_cast j.isLt
    have hden : 0 < 24 * (m : ℝ) := by positivity
    have hq : (j.val : ℝ) / (24 * m) ≤ 1 / 24 :=
      (div_le_iff₀ hden).2 (by linarith)
    have hq0 : 0 ≤ (j.val : ℝ) / (24 * m) := by positivity
    exact ⟨by dsimp [a]; linarith, by dsimp [a]; linarith⟩
  · intro i j hij
    have hm : 0 < (m : ℝ) := by exact_mod_cast (Nat.zero_lt_of_lt j.isLt)
    have hden : 0 < 24 * (m : ℝ) := by positivity
    have hij' : (i.val : ℝ) < (j.val : ℝ) := by exact_mod_cast hij
    exact add_lt_add_right ((div_lt_div_iff_of_pos_right hden).2 hij') _

theorem density_mem_denseRowInterval {p k : ℕ} (hp : 0 < p)
    (hk : k ∈ denseRowSums p) :
    (k : ℝ) / p ∈ Set.Icc (1 / 3 : ℝ) (2 / 3) := by
  have hp' : 0 < (p : ℝ) := by exact_mod_cast hp
  simp only [denseRowSums, Finset.mem_Icc] at hk
  have hl : p ≤ 3 * k := by omega
  have hu : 3 * k ≤ 2 * p := by omega
  have hl' : (p : ℝ) ≤ 3 * (k : ℝ) := by exact_mod_cast hl
  have hu' : 3 * (k : ℝ) ≤ 2 * (p : ℝ) := by exact_mod_cast hu
  exact ⟨(le_div_iff₀ hp').2 (by linarith), (div_le_iff₀ hp').2 (by linarith)⟩

/-- The normalized logarithmic permanent used in §2. -/
noncomputable def normalizedLogPermanent {p : ℕ} [NeZero p] (k : ℕ) (S : Finset (ZMod p)) : ℝ :=
  Real.log (((p : ℝ) ^ p * ((binaryCirculant S).permanent : ℝ)) /
    ((p.factorial : ℝ) * (k : ℝ) ^ p))

/-- The still-unformalized uniform consequence of the permanent asymptotic. -/
def UniformLogProfileApproximation : Prop :=
  ∀ η > (0 : ℝ), ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
    ∀ k : denseRowSums q.val, ∀ a ∈ Set.Icc (1 / 24 : ℝ) (1 / 12),
      ∃ S : Finset (ZMod q.val), S.card = k.val ∧
        |normalizedLogPermanent k.val S -
            permanentLogProfile ((k.val : ℝ) / q.val) a| ≤ η

/-- The uniform log-profile approximation alone would discharge the remaining
dense-family premise, without assuming positivity or injectivity of a transform. -/
theorem dense_families_of_uniform_log_profile (h : UniformLogProfileApproximation) :
    ∀ m : ℕ, ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      HasDensePermanentFamilies q m := by
  intro m
  obtain ⟨a, ha, hm⟩ := exists_amplitude_family m
  obtain ⟨η, hη, H⟩ := strictly_ordered_of_profile_error a ha hm
  obtain ⟨N, hN⟩ := h η hη
  refine ⟨N, fun q hq => ?_⟩
  have hex (k : denseRowSums q.val) (j : Fin m) :=
    hN q hq k (a j) (ha j)
  choose S hcard herror using hex
  refine ⟨S, hcard, fun k i j hij => ?_⟩
  have hstrict := H ((k.val : ℝ) / q.val)
    (density_mem_denseRowInterval q.property.pos k.property)
    (fun j => normalizedLogPermanent k.val (S k j)) (herror k)
  have he : normalizedLogPermanent k.val (S k i) =
      normalizedLogPermanent k.val (S k j) := by
    exact congrArg (fun n : ℕ => Real.log (((q.val : ℝ) ^ q.val * (n : ℝ)) /
      ((q.val.factorial : ℝ) * (k.val : ℝ) ^ q.val))) hij
  exact hstrict.injective he

/-- The original linear bound is impossible if the normalized-log profile
convergence is established uniformly. No approximation axiom is introduced. -/
theorem no_eventual_linear_bound_of_uniform_log_profile
    (h : UniformLogProfileApproximation) :
    ¬ ∃ B N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      primePermanentCount q ≤ B * q.val :=
  no_eventual_linear_bound_of_dense_families (dense_families_of_uniform_log_profile h)

end NemethSeberryShu
