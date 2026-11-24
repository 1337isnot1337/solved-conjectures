import Mathlib

/-! Candidate arithmetic component of the Ekhad–Zeilberger overlap proof.
The word-overlap and asymptotic-variance hypotheses remain explicit.
No claim is made here about the stochastic expansion for the actual game. -/

namespace EkhadZeilberger

noncomputable section

/-- Total weight of shifts 1 through n, with t = 1/q. -/
def overlapMass (t : ℝ) : ℕ → ℝ
  | 0 => 0
  | n + 1 => t + t * overlapMass t n

theorem overlapMass_nonneg (t : ℝ) (ht : 0 ≤ t) (n : ℕ) :
    0 ≤ overlapMass t n := by
  induction n with
  | zero => simp [overlapMass]
  | succ n ih =>
    simpa only [overlapMass] using add_nonneg ht (mul_nonneg ht ih)

theorem overlapMass_first_le (t : ℝ) (ht : 0 ≤ t) (n : ℕ) :
    t ≤ overlapMass t (n + 1) := by
  simp only [overlapMass]
  linarith [mul_nonneg ht (overlapMass_nonneg t ht n)]

theorem overlapMass_step (t : ℝ) (n : ℕ) :
    overlapMass t (n + 1) - overlapMass t n = t ^ (n + 1) := by
  induction n with
  | zero => simp [overlapMass]
  | succ n ih =>
    change overlapMass t (n + 1 + 1) - overlapMass t (n + 1) =
      t ^ (n + 1 + 1)
    calc
      overlapMass t (n + 1 + 1) - overlapMass t (n + 1) =
          t * (overlapMass t (n + 1) - overlapMass t n) := by
            simp only [overlapMass]
            ring
      _ = t ^ (n + 1 + 1) := by
        rw [ih, pow_succ t (n + 1), mul_comm]

theorem overlapMass_bound (t : ℝ) (ht : 0 ≤ t) (n : ℕ) :
    (1 - t) * overlapMass t n ≤ t := by
  induction n with
  | zero => simpa [overlapMass] using ht
  | succ n ih =>
    calc
      (1 - t) * overlapMass t (n + 1) =
          t * (1 - t) + t * ((1 - t) * overlapMass t n) := by
            simp only [overlapMass]
            ring
      _ ≤ t * (1 - t) + t * t :=
        add_le_add_left (mul_le_mul_of_nonneg_left ih ht) _
      _ = t := by ring

theorem overlapMass_le_one (t : ℝ) (ht : 0 ≤ t) (htwo : t ≤ 1 / 2)
    (n : ℕ) : overlapMass t n ≤ 1 := by
  by_contra! h
  have hp : 0 < 1 - t := by linarith
  have hh := mul_lt_mul_of_pos_left h hp
  have hb := overlapMass_bound t ht n
  linarith

/-- Missing the shift-one overlap gives a strict improvement for every n. -/
theorem missing_first_lt (t : ℝ) (ht : 0 < t) (n : ℕ) :
    overlapMass t (n + 1) - t < overlapMass t (n + 1) * t := by
  have he := overlapMass_step t n
  have hp : 0 < t ^ (n + 1) := pow_pos ht _
  have hlt : overlapMass t n < overlapMass t (n + 1) := by linarith
  calc
    overlapMass t (n + 1) - t = t * overlapMass t n := by
      simp only [overlapMass]
      ring
    _ < t * overlapMass t (n + 1) := mul_lt_mul_of_pos_left hlt ht
    _ = overlapMass t (n + 1) * t := mul_comm _ _

private theorem square_mono {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) :
    a ^ 2 ≤ b ^ 2 := by
  have h := mul_nonneg (sub_nonneg.mpr hab) (show 0 ≤ b + a by linarith)
  nlinarith only [h]

private theorem square_strict {a b : ℝ} (ha : 0 ≤ a) (hab : a < b) :
    a ^ 2 < b ^ 2 := by
  have h := mul_pos (sub_pos.mpr hab) (show 0 < b + a by linarith)
  nlinarith only [h]

theorem ratio_lt_of_square {a M V : ℝ} (hM : 0 ≤ M) (hV : 0 < V)
    (h : a ^ 2 < M ^ 2 * V) : a / Real.sqrt V < M := by
  have hs : 0 < Real.sqrt V := Real.sqrt_pos.2 hV
  apply (div_lt_iff₀ hs).2
  by_contra! hn
  have hh := square_mono (mul_nonneg hM hs.le) hn
  rw [mul_pow, Real.sq_sqrt hV.le] at hh
  exact (not_lt_of_ge hh) h

theorem ratio_le_of_square {a M V : ℝ} (hM : 0 ≤ M) (hV : 0 < V)
    (h : a ^ 2 ≤ M ^ 2 * V) : a / Real.sqrt V ≤ M := by
  have hs : 0 < Real.sqrt V := Real.sqrt_pos.2 hV
  apply (div_le_iff₀ hs).2
  by_contra! hn
  have hh := square_strict (mul_nonneg hM hs.le) hn
  rw [mul_pow, Real.sq_sqrt hV.le] at hh
  exact (not_lt_of_ge h) hh

/-- Nonconstant case with neither cross-overlap at shift one. -/
theorem no_shift_one_squared {t M x y V : ℝ} (ht : 0 < t)
    (hMt : t ≤ M) (hy : 0 ≤ y) (hyx : y ≤ x)
    (hx : x < M * t) (hV : x + y < V) :
    (x - y) ^ 2 < M ^ 2 * V := by
  have hM : 0 ≤ M := ht.le.trans hMt
  have hx0 : 0 ≤ x := hy.trans hyx
  have hv : 0 < V := lt_of_le_of_lt (add_nonneg hx0 hy) hV
  have hx' : x < M ^ 2 := calc
    x < M * t := hx
    _ ≤ M * M := mul_le_mul_of_nonneg_left hMt hM
    _ = M ^ 2 := by ring
  have hprod := mul_nonneg hy (show 0 ≤ 3 * x - y by linarith)
  have h1 : (x - y) ^ 2 ≤ x * (x + y) := by nlinarith only [hprod]
  calc
    (x - y) ^ 2 ≤ x * (x + y) := h1
    _ ≤ x * V := mul_le_mul_of_nonneg_left hV.le hx0
    _ < M ^ 2 * V := mul_lt_mul_of_pos_right hx' hv

/-- With different interiors the two-endpoint projection supplies this
variance bound. The projection itself is not formalized by this theorem. -/
theorem projected_variance_squared {t M x y V : ℝ} (ht : 0 < t)
    (htwo : t ≤ 1 / 2) (hM : 0 < M) (hy : 0 ≤ y) (hyx : y ≤ x)
    (hx : x < M * t) (hV : (1 - t) ^ 2 ≤ V) :
    (x - y) ^ 2 < M ^ 2 * V := by
  have ht' : t ≤ 1 - t := by linarith
  have hbound : x - y < M * (1 - t) := calc
    x - y ≤ x := sub_le_self x hy
    _ < M * t := hx
    _ ≤ M * (1 - t) := mul_le_mul_of_nonneg_left ht' hM.le
  calc
    (x - y) ^ 2 < (M * (1 - t)) ^ 2 :=
      square_strict (sub_nonneg.mpr hyx) hbound
    _ = M ^ 2 * (1 - t) ^ 2 := by ring
    _ ≤ M ^ 2 * V := mul_le_mul_of_nonneg_left hV (sq_nonneg M)

/-- Source overlap weights: the hypotheses say that the self-overlap of
the loser lacks shift one, and either both cross-overlaps lack it or the
projection lower bound holds. n+1 is k-1, so this covers all k >= 2. -/
theorem nonconstant_advantage_lt (t : ℝ) (n : ℕ) (x y z w V : ℝ)
    (ht : 0 < t) (htwo : t ≤ 1 / 2) (hy : 0 ≤ y) (hyx : y ≤ x)
    (hx : x ≤ overlapMass t (n + 1) - t)
    (hdef : V = 1 + x + y - z - w)
    (hcase : (z ≤ overlapMass t (n + 1) - t ∧
      w ≤ overlapMass t (n + 1) - t) ∨ (1 - t) ^ 2 ≤ V) :
    (x - y) / Real.sqrt V < overlapMass t (n + 1) := by
  let M := overlapMass t (n + 1)
  have hMt : t ≤ M := overlapMass_first_le t ht.le n
  have hM : 0 < M := ht.trans_le hMt
  have hmissing : M - t < M * t := missing_first_lt t ht n
  have hx' : x < M * t := hx.trans_lt hmissing
  rcases hcase with ⟨hz, hw⟩ | hproj
  · have hMone : M ≤ 1 := overlapMass_le_one t ht.le htwo (n + 1)
    have hhalf : M * t ≤ 1 / 2 := by
      calc
        M * t ≤ 1 * t := mul_le_mul_of_nonneg_right hMone ht.le
        _ ≤ 1 / 2 := by simpa only [one_mul] using htwo
    have hz' : z < M * t := hz.trans_lt hmissing
    have hw' : w < M * t := hw.trans_lt hmissing
    have hV : x + y < V := by linarith
    have hVpos : 0 < V := lt_of_le_of_lt (add_nonneg (hy.trans hyx) hy) hV
    exact ratio_lt_of_square hM.le hVpos (no_shift_one_squared ht hMt hy hyx hx' hV)
  · have hVpos : 0 < V :=
      lt_of_lt_of_le (pow_pos (show 0 < 1 - t by linarith) 2) hproj
    exact ratio_lt_of_square hM.le hVpos
      (projected_variance_squared ht htwo hM hy hyx hx' hproj)

/-- Constant loser: the cross-overlap bound gives the sharp extremum and
the exact algebraic equality conditions. The identification of words from
these conditions remains a separate combinatorial obligation. -/
theorem constant_loser_squared {M y z w V : ℝ} (hM : 0 < M)
    (hy : 0 ≤ y) (hyM : y ≤ M) (hcross : z + w ≤ M)
    (hdef : V = 1 + M + y - z - w) :
    (M - y) ^ 2 ≤ M ^ 2 * V ∧
      ((M - y) ^ 2 = M ^ 2 * V ↔ y = 0 ∧ z + w = M) := by
  have hV : 1 ≤ V := by linarith
  have h1 : (M - y) ^ 2 ≤ M ^ 2 :=
    square_mono (sub_nonneg.mpr hyM) (sub_le_self M hy)
  have h2 : M ^ 2 ≤ M ^ 2 * V := by
    simpa only [mul_one] using mul_le_mul_of_nonneg_left hV (sq_nonneg M)
  constructor
  · exact h1.trans h2
  · constructor
    · intro he
      have hy0 : y = 0 := by
        by_contra hn
        have hyp : 0 < y := lt_of_le_of_ne hy (Ne.symm hn)
        have hs : (M - y) ^ 2 < M ^ 2 :=
          square_strict (sub_nonneg.mpr hyM) (sub_lt_self M hyp)
        exact (ne_of_lt (hs.trans_le h2)) he
      refine ⟨hy0, ?_⟩
      by_contra hn
      have hz : z + w < M := lt_of_le_of_ne hcross hn
      have hV' : 1 < V := by linarith
      have h2' : M ^ 2 < M ^ 2 * V := by
        simpa only [mul_one] using mul_lt_mul_of_pos_left hV' (pow_pos hM 2)
      exact (ne_of_lt (h1.trans_lt h2')) he
    · rintro ⟨hy0, hz⟩
      have hV' : V = 1 := by linarith
      rw [hy0, hV', sub_zero, mul_one]

theorem constant_loser_advantage {M y z w V : ℝ} (hM : 0 < M)
    (hy : 0 ≤ y) (hyM : y ≤ M) (hcross : z + w ≤ M)
    (hdef : V = 1 + M + y - z - w) :
    (M - y) / Real.sqrt V ≤ M ∧
      ((M - y) / Real.sqrt V = M ↔ y = 0 ∧ z + w = M) := by
  have hV : 0 < V := by linarith
  have hsq := constant_loser_squared hM hy hyM hcross hdef
  refine ⟨ratio_le_of_square hM.le hV hsq.1, ?_⟩
  constructor
  · intro he
    have hprod : M - y = M * Real.sqrt V :=
      (div_eq_iff (ne_of_gt (Real.sqrt_pos.2 hV))).mp he
    apply hsq.2.mp
    rw [hprod, mul_pow, Real.sq_sqrt hV.le]
  · rintro ⟨hy0, hz⟩
    have hV' : V = 1 := by linarith
    rw [hy0, hV', sub_zero, Real.sqrt_one, div_one]

/-- All nonconstant competitors in the full-alphabet regime with a
variance floor t have squared normalized advantage strictly below M²*t. -/
theorem full_alphabet_nonconstant_squared {t M x y V : ℝ} (ht : 0 < t)
    (hM : 0 < M) (hy : 0 ≤ y) (hyx : y ≤ x) (hx : x < M * t)
    (hV : t ≤ V) : (x - y) ^ 2 < M ^ 2 * t * V := by
  have hbound : x - y < M * t := (sub_le_self x hy).trans_lt hx
  calc
    (x - y) ^ 2 < (M * t) ^ 2 :=
      square_strict (sub_nonneg.mpr hyx) hbound
    _ = M ^ 2 * t * t := by ring
    _ ≤ M ^ 2 * t * V :=
      mul_le_mul_of_nonneg_left hV (mul_nonneg (sq_nonneg M) ht.le)

/-- The constant-loser candidate with cross weight G beats every such
nonconstant competitor, expressed without square-root denominators. -/
theorem full_alphabet_constant_beats_nonconstant {t M x y V G : ℝ}
    (ht : 0 < t) (hM : 0 < M) (hy : 0 ≤ y) (hyx : y ≤ x)
    (hx : x < M * t) (hV : t ≤ V) (hG : 0 ≤ G) (hGM : G ≤ M)
    (hsmall : t * (1 + M) < 1) :
    (x - y) ^ 2 * (1 + M - G) < M ^ 2 * V := by
  have hp : 0 < 1 + M - G := by linarith
  have hVpos : 0 < V := ht.trans_le hV
  have ht' : t * (1 + M - G) < 1 := calc
    t * (1 + M - G) ≤ t * (1 + M) :=
      mul_le_mul_of_nonneg_left (by linarith) ht.le
    _ < 1 := hsmall
  calc
    (x - y) ^ 2 * (1 + M - G) < M ^ 2 * t * V * (1 + M - G) :=
      mul_lt_mul_of_pos_right
        (full_alphabet_nonconstant_squared ht hM hy hyx hx hV) hp
    _ = (M ^ 2 * V) * (t * (1 + M - G)) := by ring
    _ < (M ^ 2 * V) * 1 := mul_lt_mul_of_pos_left ht' (mul_pos (pow_pos hM 2) hVpos)
    _ = M ^ 2 * V := mul_one _

end

end EkhadZeilberger
